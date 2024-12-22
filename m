Return-Path: <linux-gpio+bounces-14141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D289FA7E2
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 21:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C47165A35
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 20:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4FA1925A4;
	Sun, 22 Dec 2024 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Umo/b80X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5719D165F1E
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898105; cv=none; b=Fw84wAwfGZPmW3qdadnP0RGKnm1tIHsQGT8Mfhs2f7XhaKs0psZCUXgICTQFbs5nDyYnqERPeFu9xZ/TwZVp1g2ghF1z7btm+nrXZrKM7Mmp0Uyo6OSpQzWU3BhCh653dJkByRXEatUshMvCtTxRpQ4buqzBSnQqm4xYhhqQPjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898105; c=relaxed/simple;
	bh=NhCfl+Kf5EQ2UwVelToJ1q07HgJ+U6QdzNQaf1Pr7sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=peUzp58H+bZoOzGYAw6XPtbwcmQKp6yAUrIrINL+Kh2v0NOf5IQ4DMsHBWILgsvhNfdEw7AUmBdQGUThRuN1LezkAgXcRRg/5O11Ojm6PB5gLn8Uxa4MWoYdZ9yd0xZ8W9sMtNBmKAI7wGPn/12ydIUTeIgIZVJUkHIq8z5Jm7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Umo/b80X; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so40570155e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 12:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734898102; x=1735502902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+mrn6ZS9pJMG2PWPukzMUQixAlUjJ28nS6mTddW1wQ=;
        b=Umo/b80XRxR7loHcY4UEFvyaEAwUkEf9LfyEkJHxxY6R570UnzyxT9QqjSkp7QPyb5
         Dn455TxKVfpFBZ96vspY/i3hOQq3SLpbBj9BB8Eq7irQn6zXeFPBZwO33XFQep0VczPu
         emnlSDI8UEnp4VLcNsps+zIeU5eyTbOBdnaMUGyTPt/wKzvImg6H3m+qKy0V/LdmQTUt
         F3RlFRN/dEaBasOLcigeWm0pmcmsVrQk5ZbAAAlNRfxA0nYwagqfXdJ5OqpkulxjapTP
         VQboLTpACk/Jkjy6MksJ4Adpop9D6qdISGDl4+XxEBd0N3H27G/5OINTo19D2yYsQqH5
         DIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898102; x=1735502902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+mrn6ZS9pJMG2PWPukzMUQixAlUjJ28nS6mTddW1wQ=;
        b=myKIJ0jGDDSJr9nd221MUeZtHwSsieImFs2/c4PaioCNfzmGR4RMS/TIYor7o5crx6
         k3Yy1PmWqxDJpnF3DkpMdQGb7w3ctIzHFyTgY8+Aw8FJ0ajLNjqQ5sJjdwCi3V4txisC
         boYkgNaSllSybXXXPVijCS7J176D2r0CBLcaqfnmBSVf8AUQJuDhQLMX9f3OsntuRk6c
         VExbqk+Funqf108TpskRHxaa32iSeAbnrKGLnodytQJ15QuMxA1daCuivtrj1kpE5pBM
         84jW/NdpamMAi6KTw32uzGCxSP6sfJN5AwCVwbG/JY18OJRZLBQ/N2Yo+lgs7zFqwsq0
         W9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVZIFvt7KaW5s7iWX2j6x8L20g4+7S/M+Q87jNRvi4BpOFPJkVhZiUWF/fTH/uYUicZ3h2JBxt+AaNS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4CdX0eVbNWQu7eOwe5N12jyntdzhMFrqyhJm1auqa7i61xvv
	9SD9MT7w2k2a8z3Z81alzRycPBAv+OJhyOLI1dPcOXqUgyuHoMXSunJw1R3foh4=
X-Gm-Gg: ASbGnctsP3HGop4fZztNqFRi9xH3vwH9JECTVRhJTtWoD2Nhgn/7xmTDmUzMdVn/ePW
	QRM1ituU/z8l9pT8G1oqiI9abX9+25aRi6llDecep6+F6WBHpIAJCHPMuC+blSiFw/4Vpj8w8wq
	6fB/Z7NC3Ntr3Tt3bTa2nI9uKTh/vRIfuULKy8A/QTUP8qvPgIQrnWBh994g0jiBDXc/bxyl5ml
	kmnfvSsGmGXJPlHt4ef4327ekk5FcsT8HyVujBbLWnTEXBP
X-Google-Smtp-Source: AGHT+IH+3OM1R3Q0LMmG7iy01KiJSl1AUteWJL7QIxuzLl2fNUxLBdJzcyfgBv9rhpngeQoegbD3gA==
X-Received: by 2002:a05:600c:282:b0:436:51bb:7a3b with SMTP id 5b1f17b1804b1-4366854c054mr84986185e9.6.1734898101463;
        Sun, 22 Dec 2024 12:08:21 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a153:75c:4edb:ec23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833155sm9492900f8f.24.2024.12.22.12.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:08:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 22 Dec 2024 21:08:09 +0100
Subject: [PATCH libgpiod v2 4/5] bindings: python: doc: describe
 undocumented members
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-improve-docs-v2-4-9067aa775099@linaro.org>
References: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
In-Reply-To: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7689;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LhcHepDt0rsWrdFCseebevfOQ5srCUTQc8wqLx64ULM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnaHGw3w4cJgfjXBE3irvshwCndrGDHfx57Oqng
 7gJ7kEbNheJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2hxsAAKCRARpy6gFHHX
 crUED/9Y1RVY2JKl83gKRwjXCM6tGWR+NRKOQ7gb39UrXmqWDChGQpJ709dwA9GHMkkuc+htY4n
 G32A6W0WIOtULXIxCsIU7rbbwprmLSVQnueH4NxmUeP8GbhVQnABTnx7R4i2+y3pF5THGHNsg+p
 Ru8yM7Hk+2ltgsM5gqyNuz41CmyG9pw3oCD0/PwuAzhvU1BO/K4PufaPEWPZaH88PlOt4vEVoso
 kE/Qusacp8JpPY0LaCiF6kKQJcawjLyQtqI1goF9OUipGYOYEc1LOEk2ov3Odc210udj7FfX304
 QkOmPfJZ7g3P/dcNIcM2Qi3y7buo401fsV5CQH0TgeDMdxZGjkk9SLux3Gpy4eQtAFQlFE+zHWE
 +wDXerZ3hOtd8AEcqCjHi0nSI9HAB32/qFz3qggocGl6TMnYVJD+WiIk6wEAEYPHl/tSLUN3Q8Q
 hQRBvFPQ5+ygKbazkHvnzZB/u822J6QpVy8lZ+YZRMZsXLAcHnrorsgosa4qbvGo3CDikEuPKym
 RTRa1WrLzRUmy5z91KciCAlxU9GzizpzyMqSy0sEI31mOExdKzS45qTRvMrbJUSj7CEpkYV2P05
 LSIdzIREDJuYoZQw2oUSqnErfjqFrLwhiT2ZLPOVDjk6hCrwcpDl79Iq9QZu5O6jdXhBaWwdN8c
 e8fk3KWbs44okyg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are several public members in python bindings that are missing
docstrings. Document them for completeness.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip_info.py     |  5 +++++
 bindings/python/gpiod/edge_event.py    |  9 +++++++++
 bindings/python/gpiod/info_event.py    |  8 ++++++++
 bindings/python/gpiod/line.py          | 20 ++++++++++++++++++++
 bindings/python/gpiod/line_info.py     | 12 ++++++++++++
 bindings/python/gpiod/line_settings.py |  8 ++++++++
 6 files changed, 62 insertions(+)

diff --git a/bindings/python/gpiod/chip_info.py b/bindings/python/gpiod/chip_info.py
index 3306af2..737a45e 100644
--- a/bindings/python/gpiod/chip_info.py
+++ b/bindings/python/gpiod/chip_info.py
@@ -14,8 +14,13 @@ class ChipInfo:
     """
 
     name: str
+    """Name of the chip."""
+
     label: str
+    """Label of the chip."""
+
     num_lines: int
+    """Number of lines exposed by the chip."""
 
     def __str__(self) -> str:
         return f'<ChipInfo name="{self.name}" label="{self.label}" num_lines={self.num_lines}>'
diff --git a/bindings/python/gpiod/edge_event.py b/bindings/python/gpiod/edge_event.py
index 7f5cd4d..c888cb2 100644
--- a/bindings/python/gpiod/edge_event.py
+++ b/bindings/python/gpiod/edge_event.py
@@ -16,14 +16,23 @@ class EdgeEvent:
     """
 
     class Type(Enum):
+        """Possible edge event types."""
+
         RISING_EDGE = _ext.EDGE_EVENT_TYPE_RISING
+        """Rising edge event."""
         FALLING_EDGE = _ext.EDGE_EVENT_TYPE_FALLING
+        """Falling edge event."""
 
     event_type: Type
+    """Edge event type."""
     timestamp_ns: int
+    """Timestamp of the event in nanoseconds."""
     line_offset: int
+    """Offset of the line on which this event was registered."""
     global_seqno: int
+    """Global sequence number of this event."""
     line_seqno: int
+    """Event sequence number specific to the concerned line."""
 
     def __init__(
         self,
diff --git a/bindings/python/gpiod/info_event.py b/bindings/python/gpiod/info_event.py
index 4a86697..cd2785e 100644
--- a/bindings/python/gpiod/info_event.py
+++ b/bindings/python/gpiod/info_event.py
@@ -17,13 +17,21 @@ class InfoEvent:
     """
 
     class Type(Enum):
+        """Line status change event types."""
+
         LINE_REQUESTED = _ext.INFO_EVENT_TYPE_LINE_REQUESTED
+        """Line has been requested."""
         LINE_RELEASED = _ext.INFO_EVENT_TYPE_LINE_RELEASED
+        """Previously requested line has been released."""
         LINE_CONFIG_CHANGED = _ext.INFO_EVENT_TYPE_LINE_CONFIG_CHANGED
+        """Line configuration has changed."""
 
     event_type: Type
+    """Event type of the status change event."""
     timestamp_ns: int
+    """Timestamp of the event."""
     line_info: LineInfo
+    """Snapshot of line-info associated with the event."""
 
     def __init__(self, event_type: int, timestamp_ns: int, line_info: LineInfo):
         object.__setattr__(self, "event_type", InfoEvent.Type(event_type))
diff --git a/bindings/python/gpiod/line.py b/bindings/python/gpiod/line.py
index 33c7368..0cfc854 100644
--- a/bindings/python/gpiod/line.py
+++ b/bindings/python/gpiod/line.py
@@ -13,7 +13,9 @@ class Value(Enum):
     """Logical line states."""
 
     INACTIVE = _ext.VALUE_INACTIVE
+    """Line is logically inactive."""
     ACTIVE = _ext.VALUE_ACTIVE
+    """Line is logically active."""
 
     def __bool__(self) -> bool:
         return self == self.ACTIVE
@@ -23,40 +25,58 @@ class Direction(Enum):
     """Direction settings."""
 
     AS_IS = _ext.DIRECTION_AS_IS
+    """Request the line(s), but don't change direction."""
     INPUT = _ext.DIRECTION_INPUT
+    """Direction is input - for reading the value of an externally driven GPIO line."""
     OUTPUT = _ext.DIRECTION_OUTPUT
+    """Direction is output - for driving the GPIO line."""
 
 
 class Bias(Enum):
     """Internal bias settings."""
 
     AS_IS = _ext.BIAS_AS_IS
+    """Don't change the bias setting when applying line config."""
     UNKNOWN = _ext.BIAS_UNKNOWN
+    """The internal bias state is unknown."""
     DISABLED = _ext.BIAS_DISABLED
+    """The internal bias is disabled."""
     PULL_UP = _ext.BIAS_PULL_UP
+    """The internal pull-up bias is enabled."""
     PULL_DOWN = _ext.BIAS_PULL_DOWN
+    """The internal pull-down bias is enabled."""
 
 
 class Drive(Enum):
     """Drive settings."""
 
     PUSH_PULL = _ext.DRIVE_PUSH_PULL
+    """Drive setting is push-pull."""
     OPEN_DRAIN = _ext.DRIVE_OPEN_DRAIN
+    """Line output is open-drain."""
     OPEN_SOURCE = _ext.DRIVE_OPEN_SOURCE
+    """Line output is open-source."""
 
 
 class Edge(Enum):
     """Edge detection settings."""
 
     NONE = _ext.EDGE_NONE
+    """Line edge detection is disabled."""
     RISING = _ext.EDGE_RISING
+    """Line detects rising edge events."""
     FALLING = _ext.EDGE_FALLING
+    """Line detects falling edge events."""
     BOTH = _ext.EDGE_BOTH
+    """Line detects both rising and falling edge events."""
 
 
 class Clock(Enum):
     """Event clock settings."""
 
     MONOTONIC = _ext.CLOCK_MONOTONIC
+    """Line uses the monotonic clock for edge event timestamps."""
     REALTIME = _ext.CLOCK_REALTIME
+    """Line uses the realtime clock for edge event timestamps."""
     HTE = _ext.CLOCK_HTE
+    """Line uses the hardware timestamp engine for event timestamps."""
diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
index 1aca142..d31565e 100644
--- a/bindings/python/gpiod/line_info.py
+++ b/bindings/python/gpiod/line_info.py
@@ -16,17 +16,29 @@ class LineInfo:
     """
 
     offset: int
+    """Offset of the line."""
     name: str
+    """Name of the line."""
     used: bool
+    """Indicates whether line is in use."""
     consumer: str
+    """Name of the consumer of the line."""
     direction: Direction
+    """Direction setting of the line."""
     active_low: bool
+    """Active-low setting of the line."""
     bias: Bias
+    """Bias setting of the line."""
     drive: Drive
+    """Drive setting of the line."""
     edge_detection: Edge
+    """Edge detection setting of the line."""
     event_clock: Clock
+    """Event clock setting used for edge event timestamps for the line."""
     debounced: bool
+    """Indicates whether line is debounced."""
     debounce_period: timedelta
+    """Debounce period of the line."""
 
     def __init__(
         self,
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index 2aca71c..3752acd 100644
--- a/bindings/python/gpiod/line_settings.py
+++ b/bindings/python/gpiod/line_settings.py
@@ -17,13 +17,21 @@ class LineSettings:
     """
 
     direction: Direction = Direction.AS_IS
+    """Line direction."""
     edge_detection: Edge = Edge.NONE
+    """Edge detection setting."""
     bias: Bias = Bias.AS_IS
+    """Line bias setting."""
     drive: Drive = Drive.PUSH_PULL
+    """Line drive setting."""
     active_low: bool = False
+    """Active-low switch."""
     debounce_period: timedelta = timedelta()
+    """Debounce period of the line."""
     event_clock: Clock = Clock.MONOTONIC
+    """Edge event timestamping clock setting."""
     output_value: Value = Value.INACTIVE
+    """Output value of the line."""
 
     # __repr__ generated by @dataclass uses repr for enum members resulting in
     # an unusable representation as those are of the form: <NAME: $value>

-- 
2.45.2


