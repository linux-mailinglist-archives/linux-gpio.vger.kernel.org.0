Return-Path: <linux-gpio+bounces-14092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA29F96D0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 17:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC1A16A858
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 16:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9034421A45B;
	Fri, 20 Dec 2024 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xCISRLX4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558FE21A423
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713198; cv=none; b=iM1BP9de5t5vjuIi1VQVYFTU4FI/aHOsL6vBBM+7h6devMXSbclrEAhFLQN8x0Xphq868TFiKxIxosuyR9YCuj7O0snT1FyxR/xEnhkunvSE6dfQ8uIoAu2PgTSJCgChoRaQ2FZSKDw5wJcV1qKcZWD1KqTKSHEyUUcMXPa96ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713198; c=relaxed/simple;
	bh=NhCfl+Kf5EQ2UwVelToJ1q07HgJ+U6QdzNQaf1Pr7sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbFkd/SjSza12H2ZHjM4T2TM03dDluuMzjPh6KTT/yiHHlIKAfj3aaNQeLKFE9jsC9wO86Y4P1A4K0o0RAM4igtzgEohrHNwU18JKEZl2+BNAbRYYxTDH2zYjffJpUICvWUZ/XDuWwF4wFyKw4hIRgEZzx5j4aR7Laifd89b0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xCISRLX4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso14817125e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 08:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734713194; x=1735317994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+mrn6ZS9pJMG2PWPukzMUQixAlUjJ28nS6mTddW1wQ=;
        b=xCISRLX48emmaSipl53Ohp8RRkntZhA9n2JYnWCbzEvjAgv+33hPxEPUZdxsl2lBaz
         WN+Dcx818fYTQt/B13kgj8XxjtJ/+MLnY/v3Z9g5h8pqcILm+za4o/yY1OKfeXexF0Un
         PNR8OY/azQkmxylDWEeLDyz5kaTqM8EzcF1cycmBa0+f7O9MAZlOzIdNGP4LKKjaErhp
         z5xjf+PpaPClCsvZbD4sCmVk0JTo1drWewWq7CzyAx4U0evz2bnA0Gpr22qnz8UzL7Fy
         VOgSyzPNt4XasUTXkG1IAMci8UFz09ViTAPr0zi8IXIL+ip4loHTsb/ehxWUQBrV5um2
         MrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713194; x=1735317994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+mrn6ZS9pJMG2PWPukzMUQixAlUjJ28nS6mTddW1wQ=;
        b=iOVmSODwqLgNjB2mKKv3F6AUZCn9gFjXzkci3Hs+i0uRq44YgBLFjUwZR346tqSrGX
         c7nlZck0zk0d3kKf2CXbvfMeg6NwGiZFb5KJ8Ct5nOZmDLNwaURJ1gVPq51hpV3/gYq9
         PWqpI0BuyxhNxi+6waK+2tyI1S1hki5IrPkTab/eHVAqKbv8pK5aDZdA7yoR2ET2uhfL
         uKGsZuRTlStBTjieQDLC3UJ7+2/GSSCpXYiXK3BtnyAnmpVBjIY1F54dLRycybye2fHM
         eUlIghcAZpYHpLXV+gSQ7zCcMYwcBLv892fRG/VKi7NlwO6cKSpYm2Qpr7i0JloSdOXK
         TghA==
X-Forwarded-Encrypted: i=1; AJvYcCVPaAy46sE83pOaGltKZWEuFgrHj3uf/0NlwLHQ+hwqhWTsVnXCCVUneHonVw71FgeBMehcrqexQpKR@vger.kernel.org
X-Gm-Message-State: AOJu0YxGxx527noynNVpkcI7Uz5ywSIo6FNk++UkgMpSkeF1GXeMwTyh
	j7BV+wQcFFbFaEhGtZcZabprXFvgWMmGao0H2hOuEM7qODfm4BkwuYtQrZhbUSs=
X-Gm-Gg: ASbGncvKN3V47e2GqP/Sjb8/DGHmhuxntUOrakLHfRYmaxcbXC2IhfMvqDFypTmhFZL
	UzG3mzfJqqjgOJR5QtbNWUYNt07ip2PLdYw+kuJfsKJtkuQJiytn0ENBO1i8/rRFOjfIDp5gMHz
	o/StyG/mrQ19l1M/vui4m6lWqIiRqwBoFwK+PSlD1n7JuseKDxIelJYHG3piNU21erWBWBZwW3P
	jyE37sL3xZTl0Xt6XLdCpiEHuo3Zkh7191FMTnywwMyP7K72A==
X-Google-Smtp-Source: AGHT+IHCtSnSLRD4tiFh3AF3G0WV5bf4f7cx+B40ohrDHSpJ0+jKS6dOfi18rySAl3UZUw784b/iFg==
X-Received: by 2002:a5d:6d83:0:b0:385:f249:c336 with SMTP id ffacd0b85a97d-38a223f5d01mr3334313f8f.45.1734713194467;
        Fri, 20 Dec 2024 08:46:34 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200abesm50165225e9.18.2024.12.20.08.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:46:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Dec 2024 17:46:25 +0100
Subject: [PATCH libgpiod 4/5] bindings: python: doc: describe undocumented
 members
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-improve-docs-v1-4-799b86991dec@linaro.org>
References: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
In-Reply-To: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnZZ9k1sOxOaVGOzPI34m7GpLImWaWvGZXSTkoN
 uobKXQquLCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2WfZAAKCRARpy6gFHHX
 chZGD/4s3jCicLlrZ8FoLtI4RES7XdWwQiGE2uVdKEXjmyHsOdoIocuyNsYOBGsfYRG20GDhfWt
 Nx1ItpWjyzpnEDOYo3S/WoPF+dyqQSOSIiPuQAIjRj7P4CBdi9A7aIpFcp2jxwfuD0Rarg8gFgs
 hDNcPZGtLk2jup7m0evD8MxSb/F3rZa+Zaha4Alcb37eEEz72z0Z8Ri2uAlXZIdvK+1Y7DUTI8r
 4ORYdnGyuUWuntI2CyBZBIwMwIr8F0LY6hLZLM7Z6RZNDqQkWMdPXJdT56UAKc/rfsX7KkCUJBz
 mBxMPDxYAM+sQnzYH30jArqaQkDVW6O57UyuLf9q5V/5LgzNWRF8M6J8IkAH40UKg6UQhZQpTA4
 9KN5DKOPetnrSly1il5Z6TACyikx7DjPs6mKCNvON9s9zcBhOGrrP5lW5Gq/FbpuySNtSsRwwcV
 YAlhGCFsgBOyyVQ4AtiMg4zlSrQnnKyvPcnRh0dtZrPJUB6dyS6p0Wy/ShqPCMMgz2LbvJtNQhA
 JiMVFMVDmtJzKVOCSVhxvdUx5XbBQq+aUpwG9uONLdCGyGjtrc2AIseYFXGcU0CUvZphgs1Ymj4
 JlkpoU9I7atKLxRerwUnKztYwJt+8ESCyTstyOOf2MNudldBj0A7cxnN+kjjzuC46lyWOq+Jm1X
 h3+6fqmjn315Zbw==
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


