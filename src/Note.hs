module Note where

-- |An ABC notation note.
data ABC = C | Cs | D | Ds | E | F | Fs | G | Gs | A | As | B
    deriving (Eq, Ord, Read, Show)

instance Bounded ABC where
    minBound = C
    maxBound = B

instance Enum ABC where
    fromEnum C = 0
    fromEnum Cs = 1
    fromEnum D = 2
    fromEnum Ds = 3
    fromEnum E = 4
    fromEnum F = 5
    fromEnum Fs = 6
    fromEnum G = 7
    fromEnum Gs = 8
    fromEnum A = 9
    fromEnum As = 10
    fromEnum B = 11

    toEnum 0 = C
    toEnum 1 = Cs
    toEnum 2 = D
    toEnum 3 = Ds
    toEnum 4 = E
    toEnum 5 = F
    toEnum 6 = Fs
    toEnum 7 = G
    toEnum 8 = Gs
    toEnum 9 = A
    toEnum 10 = As
    toEnum 11 = B

type Octave = Integer

-- |Absolute note.
data Note = Note ABC Octave
    deriving (Eq, Read, Show)

instance Ord Note where
    (Note n1 o1) `compare` (Note n2 o2) = (o1, n1) `compare` (o2, n2)

semitonesInOctave = 12

-- |Returns a semitone number for a given note, counting from C.
semitone :: ABC -> Integer
semitone = toInteger . fromEnum

-- |Calculates distance between two notes in semitones.
semitoneDistance :: Note -> Note -> Integer
semitoneDistance (Note n1 o1) (Note n2 o2) =
    (o2 - o1) * semitonesInOctave + (semitone n2 - semitone n1)