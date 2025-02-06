Return-Path: <linux-gpio+bounces-15450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC14A2A863
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 732727A2CA5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CD422DF81;
	Thu,  6 Feb 2025 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QSqU5rM0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3745F22D4F0
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844544; cv=none; b=Uja+a6DXYTBmHFfdWsu6xbXigja2awBG9RuSCVIAaI7LasfmigwzvLySU4/iX2MQ6x9+CzlzSVj5+zo1RzeRj6VGPtV/7lD5cvFRAiAhw9hJxiFi6Z87Fyu+SL7Nryk+bmK2DtxccVKZIaI9xgTM4bGAGW6jiOtRa9Tr1umUcIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844544; c=relaxed/simple;
	bh=NhCfl+Kf5EQ2UwVelToJ1q07HgJ+U6QdzNQaf1Pr7sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEk4J0wfbKqKumYAS4gIGbaFm863AN13zWd8JOEUSxm8K8yib0EYTj6GFsj3ohDVOg4Ap5mUotbnk1G7aEv8RxpTbnmD+iSTeh7VKLukuxUm/aAg6rGbnqzS3bgZnGFOKdkdUM3SIP2yZ8z7FGfrObuFDq3NLYplPbuey8OFrG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QSqU5rM0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso5360305e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844540; x=1739449340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+mrn6ZS9pJMG2PWPukzMUQixAlUjJ28nS6mTddW1wQ=;
        b=QSqU5rM0cTBdo5TctKOU72p1M7F3IMmamK7EhMFmlcuhv3xpyJDcJWWH+aEgH08Ff4
         bjjjcvbQcS8lk0ERWofCygAlTs8RRRaoROi9miMpjSfaPitXi8LsUyGmaSr4ad4lS88p
         4FluIwUFR8Z4iFvEGq7gNWiUNFudUG71kiyDr7tz07inEr+VHuV3lb3OaUs1K1qXsAot
         p9HcVu7UTXYO3gf7T0t3s9Qd61Ih9UAJbEHaM4CYxauGvc5g6R68B/kg2OM7xjtoD5Zu
         2Xn6aUBn8qHUAkfI1D0hBnCXZPc+1GRSJFgfyPaBCWKDLn2y/e4rT2tYGPc5ugbUqPuk
         wV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844540; x=1739449340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+mrn6ZS9pJMG2PWPukzMUQixAlUjJ28nS6mTddW1wQ=;
        b=L8nDwlbNq1r8oR1vFRo5jD8GtXvP2J1dyMg8hT0vTqhqehfTj6ywWv9d5O6OoLJaa4
         cZ01/Lw04oventNk2smfzjEU0h3EdqYaWyFTlh70BK8AfUcOEkxxlBn0EglufYwDTV4D
         nw6sOWKIWq/jbDA4vIfc+noV10QOlSfnOXeUsVbA7eHol/FQlVERevGIZqrhvy3fVT9L
         K/bsK9qAFN3J4TmJ7hSKb0aOrJC9ZOQ58TcRu2NDz3aAvzixJT/8Tr2GwjfR2Dm4TSgW
         dDZ04RLWKK+r5il03iV4yirIKpHxshkRzijCo8EE84aZzs+/OuGbsLMC5ugaAGZhV/Px
         hNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaNUl3LyDm1kBd244S1syyIc5CwAbAimB+CxOB9cfbIvxl8ByLYURHIflKqKOgwKsQq+Sl2sexfcz1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CBvhFJmozxFOQPya59jayBgMEV2LIo2YtxNoU4N+OS7bhJ1e
	Xfu6QKFnpHuN7MCnv99cfpjfSHFnxtL4RHrkd8TNPl+cjVYDtPrrnTm/H4uTCdw=
X-Gm-Gg: ASbGnct7idIbp18OpaH9H72FD9AFvbQkeVXGFGyNf0niizfQ7DqUVlrHIrbxiXdi4pm
	yahXHqTtZwXEA1E+K3oGGxzG3BatiHWJ2+RPvnLnouTPr5F4quH7ipIJNQFGDmUZRN+Z6OEdtN+
	qo9Tih9w2TgIvxUWrI5M9EDMxfWEhrGVpdZbM5qyz/w900zZeTa0RSK7P5BTmZEVeLYElKaePPh
	6Ib1vSyFPx8fnVZ+1SA5bBDYMIwEKQNNeO92we0/KgcD6He4PvmQYyHHhXzXXqPIXHssExAwZZM
	1hIT8A==
X-Google-Smtp-Source: AGHT+IFVrgW7M/Bp6vaCcU6VMr/fVkTgOefFFGZY/dcvZovk80jpgvBmbXnVUiXJKCH9k/kTPzl2cQ==
X-Received: by 2002:a05:600c:45d2:b0:434:e2ea:fc94 with SMTP id 5b1f17b1804b1-4390d4360cbmr68166635e9.11.1738844539733;
        Thu, 06 Feb 2025 04:22:19 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:02 +0100
Subject: [PATCH libgpiod v3 05/16] bindings: python: doc: describe
 undocumented members
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-5-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlyeMNUzETV2gmoXt7gFdB7Xsg0c6bLjUZNB
 dFslbOoiT+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcgAKCRARpy6gFHHX
 cpPLD/9PTBw0+0Zf7pMfKWk+YJMZcnmgtl52s5DNi9+ftSKpKgpK8sQhLv3iZ+6gudJyHLo98xu
 RKfCKB1i9JOQTgzgc2A/Kj3EimVIvjsTE4s4mq7b+Uhw/mugE1bNf/Kje4o5sIcx5N5RBvILgwH
 OBDBmAORHQtWm0VIAE2z2vwMfFJApZMnFnnzTtmNyZjjR3R5yvFsprKVzMOvQp+ltJrNwALehMU
 NNvb1M0nY8t40ChJTw1/l/0XxLYB5sNKDllHoqVN7zuSMwtERh8ygW71Vdv3k8f4bhJ6ThstMmM
 0KVYHGmMF/R7UoTGJdvJOJ7twH2+miPJmTOpgxJeSMSOJxhwSyS2EbOxEMUw42udiaCih1zNxH3
 Yd1hXJUNo9HI3cLNlggtcep52sA54K3fmLDSMTp9LN0u+SDR9U4LpNHoyMr/j1KNDhsGgHLioh4
 BeQvgLrkgGrl91nI0W5+i8G89NFwjYKbP27JbOZoyMSIAx9S/LYnGQ7ddwcqphoR1O+SdG2oaw4
 iikwBE6c5rggg/3pGAp5lx9XR/1k84Rb3f01d/tXk6uuzNHWBGc5zSdZdqRfC1FDxYtcOGYr3fR
 /2mgQgzPDgNj1m8bN/A/BpoYrUnp8+UvHCMRJy9WKoOiaVZTN55AkKOPZ14z33CNojoPZvZsetU
 15kcmjYyilvqM8A==
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


