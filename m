Return-Path: <linux-gpio+bounces-27450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F27BFC1F2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA39D5607DD
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA1926ED2E;
	Wed, 22 Oct 2025 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWMXMMEO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8F26ED26
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138992; cv=none; b=KiZ0vXCr7QElIZ0cpB1DeuQxuqPDEj3Mq0600lFD8M5DZ6K9mO9fUI8cEDnAONYq+utAVcdWll7d+ckEDvaw1nLBmU36+x9/Hq3ROMN7jAeUbVNFsH5gllkfO+hHjpyxd8Gzip0MwYHKCQqr33LIGpsaEF0IatkN+++OIcFCXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138992; c=relaxed/simple;
	bh=zvYhW0E/NfaKLcNEog0Jt6EFa/wkTU/DJcI7TSuBYwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ONMhyfAsKCaWDvx7absNKhbOmpHgN6WBKOTl+bU+H4Eil3ZyKRjvpItefg+UyNcHgii4oDHGkV5FfJFJviJPFbu8WpHRr+ah/BdX27kdGxhQfr+gGlq6WohvBX8ubhoRDQtJIbY/FE7whGKA8GjpalcBdQJSja4UIIdHNhkrLIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWMXMMEO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3737d09d123so66301001fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761138987; x=1761743787; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHNGHsJTDSarRstQIna7zzX5ToX7uKhO1i0WvaDHaZU=;
        b=CWMXMMEOLY+LynIW45VQAU4F1fs2kM2IBC+sL4+kY4XPoGRz2zBZtX812VePkQQ2Cq
         WJ+Myu0aEduUs0QNBXBAB10RlN7D+7jkY32cSL3QBJYi+wJ44Qaf6a5OE3wEx05fkY77
         IKTecKwWImrxdA5KiRRJQBrhZ31T2gorIacUpIB9Ep5PbEGyALW7i1IPDN4y6rk93W6F
         cFASyVclSJRsTYz+7bW5YYL7p9vexLEEWhtRukNgZ+xS6lhYHSHi4ys8CBYEZqEbUqtj
         x4ad6fArqSEh/VQAmX275a2ixQPItuqgoiVGrgt4jrQW6kSPruU5EkF0StQhydhiuXc7
         mUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138987; x=1761743787;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHNGHsJTDSarRstQIna7zzX5ToX7uKhO1i0WvaDHaZU=;
        b=G2M55zRd4eo9pyWkqvQb//iY1BLIoIu6A/jJzn+4UUcPLxvyHhRf6n6wzlwH1tVpfi
         YNnj1Bf9dZ4xYuU8sadputtnBvt7efrylGwjTmnljzOH1aAnQmk/p09wbPzOMc2yMyOD
         AUnLNQffQENFywC7SrpUNXM5AYhgJNPzdzuzxiJ0fz4oe5qWwwjPMYpW48s3A0U8J1jm
         2O4yJSFY+zj4udCc5KQ84csh109Vboi2nexpYHCDYK+rhqIWP1bCezPcBVuKjQpdHHBJ
         JWOvpfdKiHgGXG7NFcV5A8zIhkl1sS2Dlb4zcWFk+aoch68vm9q0cz8PX4x6GxThIEZh
         2xfA==
X-Gm-Message-State: AOJu0YwfFuH5543YYM7A6wTWpB9sln824Br3oY5362LlO/pwhoURPUTQ
	JX+H5BZTrfmy3H6JGYMWRE6S8/DI9zqrGMtxllYBONpTlLhIDYoHGCs3d5qRNAKdqTc7mOsKky/
	N36Gq4LU=
X-Gm-Gg: ASbGncv3n+IJWTOcdaiJCXKr0mx8LIYPqonnlPuFXPwzznMhwSUIK5ny2aYz8QsaWP1
	eHWPqyCFKF3c0JiFdfMaicbeG6C935K+EuuQ7E4wUYI8S1WkKHVWNy5ZkW2pXo4DGc7juW6Q2ux
	njiSCpPO1+5x9yJIxsuIaLhskH0Ex9ZLWVGIcZh0pp7nYVVeXks6nv3FwoysnhY6h0sLa1HrlXP
	raQKUjq0/eocH3/cLJyz1v9LJlRfs5eg/o5EZCPZ7sRpLg0Zo0KOZLzlIebUWwPzq6p6Ts4ffqQ
	caCP3Av1lUgoFN6uh/paH3ucbONVuVTdnYgfkz3rw1k5fMyBhjVKzuzXBzFAQg1SqpR8l5tcgoZ
	t0rD+ayh5j0xoKRWYBcPo07EPu9VtD2JHkO/EriU2bVSHLTD7pi05B2LAI63ZHxbNYB2UT6CiR2
	1Zav1SHiOFjsI=
X-Google-Smtp-Source: AGHT+IGYeO5/7sUGZw3nlxkUjV/CbtbrkkH46shvJxlUG/M4s0/vRNTVx2rkHpfUBOwIZ0Mvjs2QWg==
X-Received: by 2002:a05:651c:154e:b0:378:cd74:a289 with SMTP id 38308e7fff4ca-378cd74a6admr6663991fa.42.1761138987500;
        Wed, 22 Oct 2025 06:16:27 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378cfb3511fsm2996811fa.30.2025.10.22.06.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:16:25 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Oct 2025 15:16:22 +0200
Subject: [PATCH v2] pinctrl: pinmux: Add missing .function_is_gpio
 kerneldoc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-function-is-gpio-kerneldoc-v2-1-e1f200a94c5f@linaro.org>
X-B4-Tracking: v=1; b=H4sIACXZ+GgC/42NQQ6CMBBFr0Jm7RhaqwZX3sOwaOkUJpKWTJFoC
 He3cgLzV+/n5/0VMglThlu1gtDCmVMsoA8VdIONPSH7wqBrfVa1MhhesZvLCDljP3HCJ0mk0ac
 OdeNKfGictlAEk1Dg9y5/tIUHznOSz/61qF/7l3ZRqNDQpTG11e50DfeRo5V0TNJDu23bF0NSr
 t/FAAAA
X-Change-ID: 20251014-function-is-gpio-kerneldoc-29b9b9df9b2a
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This callback was undocumented, add the docs.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Think over how this function is actually used and make the docs
  more useful.
- Fix grammar and words.
- Link to v1: https://lore.kernel.org/r/20251014-function-is-gpio-kerneldoc-v1-1-4e6940a2b37f@linaro.org
---
 include/linux/pinctrl/pinmux.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index 6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81..468f38b7b7ed189cc0cae026e9715fc5f1683260 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -35,6 +35,16 @@ struct pinctrl_gpio_range;
  *	name can be used with the generic @pinctrl_ops to retrieve the
  *	actual pins affected. The applicable groups will be returned in
  *	@groups and the number of groups in @num_groups
+ * @function_is_gpio: determine if the indicated function selector passed
+ *	corresponds to the GPIO function which is used by the accelerared GPIO
+ *	functions @gpio_request_enable, @gpio_disable_free and
+ *	@gpio_set_direction. When the pin control core can properly determine
+ *	if a function is a GPIO function, it is easier to use the @strict mode
+ *	on the pin controller. Since a single function is passed, this is
+ *	only useful on pin controllers that use a specific function for GPIO,
+ *	and that usually presupposes that a one-group-per-pin approach is
+ *	used, so that a single function can be set on a single pin to turn
+ *	it to GPIO mode.
  * @set_mux: enable a certain muxing function with a certain pin group. The
  *	driver does not need to figure out whether enabling this function
  *	conflicts some other use of the pins in that group, such collisions

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-function-is-gpio-kerneldoc-29b9b9df9b2a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


