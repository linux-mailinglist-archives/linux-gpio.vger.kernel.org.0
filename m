Return-Path: <linux-gpio+bounces-8633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC594A3D4
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D1221F22FD9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0EE1D1738;
	Wed,  7 Aug 2024 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GUaJms5Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3187F1CB30E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021881; cv=none; b=YhlsHhpxzaUnvov0SvCk6jku7IMdcWEg9AJTGSAfX/NAlt67vKAXz/tylaUBTaAuRKExwuxffgTDDkO0EKeelDzurElcMoBxTFhDkBaaypGMk/LwZFcIz7Sj5IHSCte4OAXtleKMBY6HMoPON/aZqIudBB9dMwPo6DVVCTrNKz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021881; c=relaxed/simple;
	bh=7jenabtNWenx7I8R7ceF3Ws1B4ti/sVn4dhPomjueEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tm7Lt35KFw2j6BX3cjgxgbBpYnMEDURmiDxBFgGxwrz0XOnlK+W8lJ2Yfr7NjtMxNoZxtPbfjGQ5FIqBEA1fT2z9AxFFVLjBnTU9hTm4y7S3IFYjc6eLuVzJKWsD4b56blFuAxSr4eSuISzppiiFxTbt946X6VRfa7Ym0fZnWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GUaJms5Z; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef7fef3ccfso16557571fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021878; x=1723626678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDLk/fIApf4puRlKWFi5IhtCsHjKDrzzDuybhTWSeho=;
        b=GUaJms5Z7bOPu9/eLmLqsrLTVOfPTaUDbXYfeHlLk7vhwc1lEBLVc2MM0HuAvTbQI7
         q+WUmrG+/pJv3wCqtzBK3DEzwl35dTp15kqTic++P8xoAPtTTqWOH4OOxdmA3u/mC7i1
         2QKNsK6y45akq4IdQaebOmSil/Q13pXSdKvIrMi2PL+EC1Qgktnwav+Z1pl7JkbcQBXq
         m2+GQey8aQ5MvxKQ1QormYSDsb/eqgIkhwNk7vK0RENUNgmdxpPBcrLPIDiQy9gop0bX
         /vgpNeH6ikNTPYPngvLbff6cp50DtZzhB/69XTtJMi08qWKM1KaUkYmvK7mJTMKghfQ0
         1AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021878; x=1723626678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDLk/fIApf4puRlKWFi5IhtCsHjKDrzzDuybhTWSeho=;
        b=sZLpxDbpw7lNz1yj1A4EmV7e5MUenFdupaB32iWyipw6Y2T9YDUQaCtk8nwkOnR9os
         HIH/J5RgNTe4ij3IiZyZhgiG9c5ixKgYKjbBtqewHEGMpRhWBIov4VlzRMqtuzpfLX42
         QdQZTeg4x67UsRM8A43xRpu9A4rkes4BPa6YeXYPGt4+CFT1YiU5IsJ7eEfrcEF9Zz1p
         x6qL5n55tBb+93bNq6QLn0Aa2pICdTBtwdkSJFGAZk8X91s3dL/v4QLCjvTCSVv2GRc4
         Wwp5jnFVJKUiDQmo7Db4P+jEkk04djcQvTTR96eqftmLfK7MqAjS5GD+ll6K6f550H0J
         HT3Q==
X-Gm-Message-State: AOJu0YyaEgTkkZ7brTzlNiP4eER4nMqkMMERRtzsa+A+x+oNb4FQ0wud
	K2p4QF+NrUVyk4JP9xc4Lxdt+UfgHE4n2PLzLKDcwqhXEZizIcI1TbqAGL9dnRc=
X-Google-Smtp-Source: AGHT+IHXVfYyqJzByjAX09tVualFn1t1AnxvncPvMh4EZvYhdyBIOsRYYAKuGSb31HYh3ncLxc1sng==
X-Received: by 2002:a2e:330e:0:b0:2ef:2472:300c with SMTP id 38308e7fff4ca-2f15aab0abfmr105233031fa.25.1723021854911;
        Wed, 07 Aug 2024 02:10:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:10:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:39 +0200
Subject: [PATCH libgpiod v4 08/18] README: document GLib bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-8-64ea80169e51@linaro.org>
References: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
In-Reply-To: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1RfIuKDmdlsvZxR2wxOXsvxi+ZRtSkhXrPgsmfKsvsc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoRDS5xyS6Nb+BV9OT3Sw6uPDKq6fCAHbmCX
 9bXJ6zKnJSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EQAKCRARpy6gFHHX
 cuCYD/0SvmZUtFQEloXBe4myGssxseU6bf+eI0pSvGGcu2n98CWMz3aN77UsmkUflW++vwGld8g
 a7/0tcomU0u2PyWbxkMfWyeazYI5h39ylILzPFKhXFqZ04x/1XXYTzK0YqG50WHOOYAVsj4pH+U
 wkRFb5exmUbUH+Bhqhi2edHlLmtGrQM4sFiT2WKrjF/oBaRYjCWGDlrSZvoXON21CAqlq4Pbyj1
 3eZhX1ILhAzkxy/8VJVXrF/f5Nn3TZi0ZCqtRFVrVvclUwH39sPsC/0M9JshdpwN0m3ujYK5a3p
 uGyICDKaNQJBST5qRJwv0UzUYX/ee4VmwbI5WtE8iuz60n6sak8tPOIMJc3HTOY4gBRY0jdVp5d
 wUjEmDfb+apVzLRbldTCeTzereNqRSofD6HT8c1ALwFzMI6yeb9O60qs6P8SmB6MRJMdQuj59AZ
 EYLAoFAX+f6nfWS33oxH0DlsF8d1bztFfT+BgtEW4AzCEAL6bxCyx0qX4Gckkb14uiClOMeRZt4
 qM0HHQZEK8AtrrzMEUvEfKHTjqp2enhjI0xSyfQK4wwODd4erkh714SsC8gF9Tw/BRQIt3GF8Fi
 0s6COwS9NQfoemdgDrn9M7eJ7706gkx3Dy2tEiUYXamsSTHFEwfo2jfQKXgBSxN9xrVsoWhirhp
 klk81OXXSAm8C8Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add information on the requirements of and the configure build switch
for GLib bindings to libgpiod.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/README b/README
index a01cfc5..658a77e 100644
--- a/README
+++ b/README
@@ -211,13 +211,16 @@ Examples:
 BINDINGS
 --------
 
-High-level, object-oriented bindings for C++, python3 and Rust are provided.
-They can be enabled by passing --enable-bindings-cxx, --enable-bindings-python
-and --enable-bindings-rust arguments respectively to configure.
+High-level, object-oriented bindings for C++, GLib, python3 and Rust are
+provided. They can be enabled by passing --enable-bindings-cxx,
+--enable-bindings-glib, --enable-bindings-python and --enable-bindings-rust
+arguments respectively to configure.
 
 C++ bindings require C++11 support and autoconf-archive collection if building
 from git.
 
+GLib bindings requires GLib (as well as GObject, GIO and GIO-Unix) v2.54.
+
 Python bindings require python3 support and libpython development files. Please
 refer to bindings/python/README.md for more information.
 

-- 
2.43.0


