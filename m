Return-Path: <linux-gpio+bounces-15741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0A4A30C45
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FA6A161619
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7E7217677;
	Tue, 11 Feb 2025 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S7WDezW1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92E215F42
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278783; cv=none; b=dv+p5dVGHugaOicDP++Svdbo/oH2dVYEqJO5qkW0EPMsbgg1v12A5wQzq/hT/qVt21Pxz7BUIlbcxni922nvQCOB0/CiP1DiO98bj2j0ppOgoo6AumB7rr66BmM4cLd1k303WObGcczuG8SxwI43WFpkwAd08TsY6SHLe5qRh1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278783; c=relaxed/simple;
	bh=Xhx8I1RT8tRAlh1w32C6GuYPL3m92Qx4xndok+mVN0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJIzaNjrFgGrkkCmQPENmLPiFSrIv/FvuWqjyfyAwOw2806DWPanDEVS0K1yO+8eGm1yrjQt64aR0OSC3Iyfhh6im4fuvik2DWM32+MWCgCHLKgK4/ZE66/blpu2ZInU1EVuEe8lg+28uMTFKy1MBQWtNtIyWkHpFrUsFWLcNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S7WDezW1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43944c51e41so21916695e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278780; x=1739883580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEqkRuUVrt/6To7a12oQ0QZUf+6LHMqjT8FfLiEpQWk=;
        b=S7WDezW1YA+uXqHNcQf92IKieOMZewC6pSffvCDFYUK8ol6tWhngVim8XNSznufPtU
         hGq3MQBuQsb5n4mxGRSFwGifT2MjeX8TyCz0r05uZezfYfwINpusKHPISt9vbIkd4Jk5
         FBeY+7ERFMQQONXpFpZl4xMKxKj4Tf+mNRnyF39ArJXO8tstLHW7StxFZT0zBwA+v1pg
         XunYUq2Uie5c8RET5TKf2+HjhYLFVRGP792kjvBTQxXfSkdl/OvWBTAHXhGg/vdZTgmv
         AlgTnPhgzdF9XEITbcnDp7Rk3hQVEiyrdlGF81qTrBOuip/S03eEQeUmiN3muc4hwVVS
         Wy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278780; x=1739883580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEqkRuUVrt/6To7a12oQ0QZUf+6LHMqjT8FfLiEpQWk=;
        b=C5AOsFv5VLirpiWXKWKur7yop3gMYuJZEIYVL6YzM96HdXAtTt00oi6ycYNNRwX2qH
         P2L76DlRxoCDswzJkJOFXipnvJPEXRYmzLBc0nIdSdLLhybVxh7C3IU2VDjW2MC6NRhE
         qNN0IwM4ubXlfwTQ1W+a9yWuDKfD2zpf7xOsDXa9U06G881hke2uro6brQ9AaE74fYO4
         ssbHKB+j2ZC/2BsUAuGx728qgKngUa3goVOn2ePqZY2lcJ4dk0EUuXC0+2JFZL8HNDQo
         /Ur7OBXHTxPg4BK490/0TlgzyGy9YhUGCp5bdzcadAsKppQWaD3mY8z65nf+RQl9hDCY
         +kCg==
X-Forwarded-Encrypted: i=1; AJvYcCVePXNd1Ka0YVWiHDeoBYhaOuragHehaYupSikOfSq8mOOWaJkgtBG4DbN5DeYXtrY51u80Z4szuN6e@vger.kernel.org
X-Gm-Message-State: AOJu0Yy03F0i0UqBDorf/K2Nfg0UPiVyR8+CsowwElQfxChNFx8n1yK1
	uRAl2ZC33gOc3VLzx8Ln/RiN35WTsFMm6EbWX8z68X20idDsDexX28z5pwM5wzk=
X-Gm-Gg: ASbGncs3CSKcFTR/OmTcN/bdpw397V0YvKe73DvW3ZYJZKDSCHtdUFPDcaHPdwRkkPk
	dwkZJBAZXZ70hXB0UgUg9t4neT3+s1GVcviJ5uTb2xAp0jDE80bxi9OMbE2lE82g8D+cs6VKjpA
	pbUGbTHFENCzs+NphYxxaxL7+RDnKswSssreQevTgKJq9db0XKY0i3bxJ1Wm1WT4YWAs4tHgmPL
	5XQ0TZZvJ7qtbLi5zykC0t3BLvd4rzTObVICL/gCSJXw8XnrQX5teBbi3MhHIKx3ICjmhitYOff
	811gm6M=
X-Google-Smtp-Source: AGHT+IHGXUSO0pPbwZ/qj7EObNe+fMSJu9V1qsIRXNnju8O0Hst+KLwvEOdVB5QPGzskoLkATSyhSg==
X-Received: by 2002:a05:600c:1e14:b0:439:4d86:98c2 with SMTP id 5b1f17b1804b1-4394d8699fbmr26311775e9.29.1739278780302;
        Tue, 11 Feb 2025 04:59:40 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:24 +0100
Subject: [PATCH libgpiod v4 03/17] bindings: python: doc: update the
 docstring for gpiod.request_lines()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-3-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JJ3iUo1uXw5+ZWJPe5ttDwDK3Nl44JJtkWrt73AVAtM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m1B4+X3U8f2SwttTO0FrzV5trRjoWpZvKLg
 DTqO1vbrk6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtQAKCRARpy6gFHHX
 cmVtD/4kta9h4bkbCcHDEIYZyYP32QzIoVkMWhKqRYD/t4KPr8uPLQoyTQeTr4BEMDZsA8A8WhJ
 AokyJ0DBC3ginCAkp8LIbzGXHK6KHCYM8VExDZigye6zS4EPeuP66ef0uWaqmzSEnaPA1pHTNmR
 0+nbFlIvzzVT4stMgwfJBU3ZOCt1kC3te6gXzVrZ4kEfgu1QxqS/bF9cyVhPeI4g5pVdKnqZqYC
 wQvvfdnKGnr6+hbVjer0zWiW4dnjOyMCJQPpv5FH+3v2Co1iJIYeCcnLDgGUGIRiXk6Tc1hBgLv
 WzXU4FYZ5L/ghR+qZfgazy1cP4Fvw8DVmzZWEUkcNMZWawZI2YDxEy8XgtLF6NswChDU10jHU3z
 ZrnAfWq87MknmA9nbavC8ikodV5RSLZUEpdkXNAyNXeBLz6/bW6dE9j2z+2rN48JUgfzwg3LWKY
 dqoOEMhJiuP3X3KHKgYZDe36+anpVWpzm63c6e2alYYbtc7tgKlghjurJnAvpEHCu+1sC/pep8y
 r7oO1xAaGNvEy0HcRyL+UZAbmxX/Tj94o/+lpMYT7u4Bq2oOppbuscAo/dehx4nnLk7umBpjYAi
 S5LcU7vleNhFp3Y/VflSKCuLtEtFu4il5AExVZ2JGpbqHZE2TqeCEZ77KceNsT6VbanDZwOkTdU
 aycoty+7wCEcR1A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The global request_lines() function was updated to take explicitly typed
arguments instead of just passing *args and **kwargs down to
Chip.request_lines(). However, the doc remained unchanged. Update it now
to reflect the actual function parameters.

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
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


