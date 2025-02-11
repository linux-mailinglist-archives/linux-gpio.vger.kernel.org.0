Return-Path: <linux-gpio+bounces-15744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E57A30C4D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBB1E3A77E6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFC022068A;
	Tue, 11 Feb 2025 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rbq2qrAE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE9921E091
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278786; cv=none; b=IWJqCsQxxZWTRVW4aWzkXt4oAdXQ7ByuwxGGeFM8AdaxojXB0nph4+KD1GD0wwZXSP2S4tnh8sgM3FkwfjVaSQSUyhE169rZvMZYjj0Lv22yrFKECCBGbqlLl1K5kkiYxRaS6vb1xGXCeRcDgpXniuVIPFhH5BRGuFIV4LK9ogw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278786; c=relaxed/simple;
	bh=NhCfl+Kf5EQ2UwVelToJ1q07HgJ+U6QdzNQaf1Pr7sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfB8jbh0rRt7xNb2dKfuCU5TkOwyndQZffByrdL/6tc2CCxcylbuSwzrkieDO+9FWz4Os3grzCOzsB5APZPhQkHkyfCO7exiumDntNBC0YPQ2Ul+GV0x5ODNImG3+ciBQ9RXoKsfjl/yxgpqzFwwBAIOm3HJC+TR9whIQoCzsXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rbq2qrAE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so38398185e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278783; x=1739883583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+mrn6ZS9pJMG2PWPukzMUQixAlUjJ28nS6mTddW1wQ=;
        b=rbq2qrAEt5FqlW1j3wllu/Xj1fZOkmNLRri72BvnjdBVHgYfcWvoIqmY30Puw2AOpK
         HtX1Ixkiht+EXW1+iKRXoIxhQuk9WgwvAbP0Kgzt5TEDemStHdvvQGMcpVDLgc1LjSSE
         ha4hhKcyePi8E7h8ggzkgmj3RTJXuXH8ZybJODKZ5iM5+mXxWVPIGCqhIKb2RfNMXu/C
         wJn6K6PKmwJGOjXE06HwUWLI6WEeu3/RmwCKJOwSKDMG1pdjvzJr9mnVjQYbMs0QEHdw
         P9nqdvzx5it25Bb2ot+E1OLWaE8A0PJBPAnuSAHemUhQsKnIwl53KlZouoPjg8BTED4H
         2/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278783; x=1739883583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+mrn6ZS9pJMG2PWPukzMUQixAlUjJ28nS6mTddW1wQ=;
        b=eqEJG1DePDUyPnGcCwbnHblMRiNPDr7yMrkfhMsTg6j9oDPuDOWlL9yoBjR0wMbXVJ
         Fae8z8SiZ1NpIRqs8Kksgc/deMnepvL0Bj3aCY7EjCYbyk8SU+S06r8TCk7an0wovqwL
         QDxMntIV5lIOECjrrAAMyj/wpmRpLwGSMCBQsNnYxhsJlvsMR7eBSTtVJnNFBwkjakKp
         BDbwvqvHZAHmuDih7SFbEc++VDvZ9yG514vPmWTGsMyDNwxwvNs+5VeT0pmddCFya+Pl
         xnScQc4JNio/jnodlIIsaiRFHl9bB5YQeEBa8dw4u36wRfgag98XgQabGOZ+GVwjs2F6
         xqOA==
X-Forwarded-Encrypted: i=1; AJvYcCVpXpUwYlkYiDMBZtos5vOMRCDEIBAW4OMdjGyCq9dW0HLa/HfMGQmxKIz/iL44+XQ4megxJy9dECN/@vger.kernel.org
X-Gm-Message-State: AOJu0YyrcSLppsua6tqo1ATs1ggrLhJ6MO+Yyz4SkyO3wPK65wuaDGDs
	A5nwuDNWaUU484FAZIiPdYJpm9KdVuZ1+1MmhGB35oG1wO8H22kqs0Wn+tC8OgM=
X-Gm-Gg: ASbGncuhl0V2SCau0tCZDs0eYS9Zw+sf8Wm5GX8VttXKmDyvotbto+wceZMn8WXfVps
	PI2ge5VGsqiFRtrx3mXS48lwjoh3M0tgtwNYmazWSD8q2UCxsEC0tIusviPgJaVbPrd3imq4NSk
	d940W8UeIRgQPrVFwatyXXjd/9h5W9SUbHD2OyWc/ZRoeQXOM36R1FoYrpZCf2v++RdbRda2O94
	D8QmP6CjhGWm0Hy7Mz9ZkSja9CmqKL+Gn37UF8V8+76ljQ7B9tHydVHRBNs/b2wh9G7xAG4YQQr
	Xa/0oDw=
X-Google-Smtp-Source: AGHT+IFEtl4bEn4ibrjkMB9uEAGey2VSG1PhB34+uddjm2//j3Z7yHvWfamZqX3Ti5Pt10NeWBNwyg==
X-Received: by 2002:a05:600c:5494:b0:439:5016:3867 with SMTP id 5b1f17b1804b1-43950163b9amr21251785e9.23.1739278782653;
        Tue, 11 Feb 2025 04:59:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:26 +0100
Subject: [PATCH libgpiod v4 05/17] bindings: python: doc: describe
 undocumented members
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-5-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m1VmVdAcCKDaFQ9gSfBa4q1kJxwVgUYQcFQ
 gHXZagzE22JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtQAKCRARpy6gFHHX
 ciYbD/4tv80vGoLL56QltaOVtnqI0vCVrjswa4OKHjxM7LbrvaSBbdVwfLMak6ajY84znMn+kl1
 oiqiI4VNoRIzWqcWgzrBaBspT5xReDAizQ53l7GVIg9lA7x5fJ2d8c9Eze88NgcIIY324ZhkKN2
 dJlCHlgzv3zyvOM74lCXRGr3PHsFGIgAQRN3Au1LAVBeA9Mc806Wj1MQeNoRlxmtsP/yImFVnYq
 yrEB+o8dECGJ0J3j5TqTVoKnB69ZD2ltVN9UMA5uYZ1AdcUMn46/Crn2icZ4cHLLsW3/sKLSOIX
 hyn07FCtlKcTZIklrO8JDZcuw9cEO8Ocv8H+41B3Zcgk47eNUf9yF1Mt0laByhdiwADeTk9nDyU
 /p6Z/dzswfiyQD7g87RDTXbaOY4DwQviwYSFovDVhZdc4DVnryxAkYRbqM6DEXi3fvCnKiZyUe9
 4EqLv8nELsXi46Tonq7S+TBFxPPVyBNHgjn5ZmgtZN2ovM9ABI/TezsBCEymVVRXzKBY1Rj0QHX
 QDX8hZCN+JZp48wOepMpfd3Srm4cL8pD8rZ96biEz66x85f+bgYuoJCfQ6vpdXE+aL41QqpAHtZ
 2acjpXqO/U9lcy+jRIh8tE1O/s0nvYBiqQ0eFPx/bvMUxh60lQT0R/l6hFrot1LmueS8ORAVjzO
 V93i2fgfDU31mZw==
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


