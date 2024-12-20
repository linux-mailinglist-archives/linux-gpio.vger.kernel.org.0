Return-Path: <linux-gpio+bounces-14090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC39F96CE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 17:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA9B6169A2E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 16:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EB221A428;
	Fri, 20 Dec 2024 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OcVa2DVB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E12D215793
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713196; cv=none; b=cOO+FSqnf3OAuK8cG10ajG0Zkr1fQMPqfkGQfjWIXJ0NZgtqPx/Ww0BAgaQGb8yLU5ElxBNbisNGzloLfcNR9B6d87XG3hCv00s33mu+YFfTHas3JlF/Le0D6rYwNLOxZBwOTdEiTb2mmlHsbVtWKLhoJ9mBkyN6Knq2LeZhtV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713196; c=relaxed/simple;
	bh=YilZz6A9tl3H04do/1ex0MqqUVgAZTxf2/OpwfJAKDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdeYSksqf65y0/ebo8bFILP54j843pifFycAa46AO3nHsrH5enBuywftwDAFJwfIpEfn3X8JDLngecRdXftD1GfnZlxmnywtOVLsTAzQiQLe6f70HAO3/oKy3J7HgWmhSfWey5DTZRIYuVp3GAnoHRcL/MRMwYQbQnm8FcPvHxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OcVa2DVB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43634b570c1so15749725e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 08:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734713193; x=1735317993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1J2i+9hAYKMd/cu+aN5cLBk4csvIDgvl+kPAxnJaEw=;
        b=OcVa2DVBv3x9CUq/R/JTVeRGwbqL5ol/CAWEi4CkIZbR6ZLVOg1Y0Tq91WnbukSP3n
         +kgh00zpubcnseMYWJpToIf3SKCjUEL0PSD8BwMvDt5RXpmqX73FacV8VHIT1yfYR1ij
         xhnganei/rnN/xxqZsivuIZJ475H00C5p1JkTQOlZ3QDsfFvb6JnVq6hKQ33J5LhOAIf
         yj8cpKTWfbZy/aR8u18D5qjOflqC0d/Eo/aCV7UxHewV9w9PAC5oGuVReEiwzGot6qSZ
         aDO3ylxW89Ei3DyZ2vCDUYnPTFTXo3zFtSZz2kaZ+Mu9I9576I8FHs3+YdIOGXLbbLeQ
         ShFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713193; x=1735317993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1J2i+9hAYKMd/cu+aN5cLBk4csvIDgvl+kPAxnJaEw=;
        b=aUZitUO6pSuK2XeYAC6P6WqMVJltSKuSkqxZJbbtyAdpAaGQ5PJUwISdcBt8YMFZ0e
         56TMpaAGTxjSmTQ/3JF+u86o3hPYX2YG21NIzSgR5CJrSYA96Hn//1e6EgNIiyAskanR
         2Q98Ctgb7ENuNquaC/nPUXC/LxYtTaVMqy9/sZBy1Gjvac7XEL+q0Wk4a8RkFPJ0DI4O
         duGPvKnA7rl91MKAh1BpT7niMHoVYcyGGXwDJTYferlXZT5gcu8G0vzlve1NyyCOS8K7
         OHC2UL1BTMKGsUiNxzAccYvDbGd/vyPFwO4VS4/rpWFNXsJzeim+dcSehh6UrevNSY10
         UbHA==
X-Forwarded-Encrypted: i=1; AJvYcCUENE76WIFlRgIIRSQhwyRUy99qmw6qPfY2lYqYeMvjSAiNtFdfsa4c4LaeXNOsjoIxIbT2yMOCvy0A@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe10OVtircmGO+hx9k7G67tJ7vdugQ4hRoVbec+AsKoB7gc/N2
	yqyzmdOogbByZjR4O+q97I1d6VCKkeYVgYl7+3T0oqzyFnhoXvXKTe7rQJposeA=
X-Gm-Gg: ASbGnctpdFF6H7YEc/EUrOc9zbPYMHIBE3Vog2Z3tZE40lNTJoqG06rXtgRxS0FB82D
	YugXM+IMVJbqJcbKYnjrMH0ZTmDAd4NQt0lcNlYNMOZQT6wAdeEVko1dlnFwxcIU5GdRfBubKoR
	fb39iXC+Iue5GOdpHETOrq/7tG90/Xk3g3V/EnQmYOPOaFVWDXeBcQg/4795fbtV7Tw343zyNEb
	0nWfpZ8UBCKclqo7kPIpogURSctjDcjMwQag+60SsMDCpy8BQ==
X-Google-Smtp-Source: AGHT+IG50tSvy/Q+OrOcem9rPBCIIuJGAa8ZFKAj2wNAJX45C8lq7NQwraAxdcuRENWGNFHIhOUtZw==
X-Received: by 2002:a05:600c:470b:b0:434:f609:1afa with SMTP id 5b1f17b1804b1-43668547314mr31065365e9.4.1734713192556;
        Fri, 20 Dec 2024 08:46:32 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200abesm50165225e9.18.2024.12.20.08.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:46:32 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Dec 2024 17:46:23 +0100
Subject: [PATCH libgpiod 2/5] bindings: python: doc: update the docstring
 for gpiod.request_lines()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-improve-docs-v1-2-799b86991dec@linaro.org>
References: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
In-Reply-To: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=DE6f488TgezGHpfP+C15KZ9ntYY4YymZkPrZIuz9vlE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnZZ9k5rHgf+esZQDUMYEP3hdIJLiX9BJeU7swB
 Nuoi1Lh0+yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2WfZAAKCRARpy6gFHHX
 cofnD/wJNo8WVxrRqOIy3dhXQkvmiWqpIz6FpPYM2yUCvT320I8kURYPrWg05pSADy+vy/CBZqr
 ukhbhnOcfaEAAF/qoycTLJS4/KPVni+Pi3FMtcHjqfFzNoBEtHGQToiqQhYSx3rQZUK5SJKUqLF
 +4vVyhKs/I9haC7+BepJii1kT4wBbsGFaIy23QINv0TkPsmp4bkg4/pjJGMg9dzaxChnap18rIH
 4s3nf9vaRZwfoI/lErjhQOrA7xDa+N6ANyRcfRLSPf5xUzugzUrfZ3kgZ/jLCUUxT2H6yy4FpNW
 T77uPxl1UoiaYu6rS2QO2UI15r8KHdX6ldfWvNghu+5WoLYMOj/nBHREIr1X1aJRcffYr8f0jID
 7J5eCiDigjvUP9seh3IDjemMLt02HVsCRSViCTsADJtN4NL0QS6svcchNCCZoYPgOCdKNu4fpJ8
 tY472ftX4clCJgKdJ7CBnYbpcN6IpX9HvH5VNHYj0MjeQX6wjNC9Xd7qbU4TvKaRqUYkI051RQc
 6OGBWkQ29PwbBrKbKcdbAIUYQ5MFILDajAOuVVRzWDyavSUO5RCTuGp9E4LVUzWpKCukb+hNT+6
 q7cjOIxoU5+1/6+GInyiut2f4Z7ax/O1X+F/tZzonijMNGq6c+/qSgJjctprZ/J5PCfV/kMEwwL
 FhK1FF8otliJ0Ww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The global request_lines() function was updated to take explicitly typed
arguments instead of just passing *args and **kwargs down to
Chip.request_lines(). However, the doc remained unchanged. Update it now
to reflect the actual function parameters.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/__init__.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
index 817c755..854e41f 100644
--- a/bindings/python/gpiod/__init__.py
+++ b/bindings/python/gpiod/__init__.py
@@ -99,9 +99,18 @@ def request_lines(
     Args:
       path
         Path to the GPIO character device file.
-      *args
-      **kwargs
-        See Chip.request_lines() for configuration arguments.
+      config:
+        Dictionary mapping offsets or names (or tuples thereof) to
+        LineSettings. If None is passed as the value of the mapping,
+        default settings are used.
+      consumer:
+        Consumer string to use for this request.
+      event_buffer_size:
+        Size of the kernel edge event buffer to configure for this request.
+      output_values:
+        Dictionary mapping offsets or names to line.Value. This can be used
+        to set the desired output values globally while reusing LineSettings
+        for more lines.
 
     Returns:
       Returns a new LineRequest object.

-- 
2.45.2


