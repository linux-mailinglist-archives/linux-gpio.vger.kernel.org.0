Return-Path: <linux-gpio+bounces-6712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B428D162F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 10:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95121C220DA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 08:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9DD13BC30;
	Tue, 28 May 2024 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KSoWFQFF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F11DA22
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716884762; cv=none; b=Pl47jvzYLP49GuasGTWwaxZFYRroEqkfnUn2Lhu7hKvbf9p+wA6iozItNB0mB5d8rG/khpeB8oxniz25/eGxjmnNZIMZrbZULDhSRHmbzU1qoKWFZOTQMgtbi7sMgc+3FxqosaWEmfD8eenkviVrTgRvzCPrBFd6r3oHpMgBNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716884762; c=relaxed/simple;
	bh=7JUwVClKHRVrHt0UXPvOSBTu054O88OuJZx7AXY9gqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k9pf9e8UFCzPE/rkxFCTsYIrmzp0+xa//mNcWbZp9/9kPqvIF3cVuL5hAYXvZG0TuwLoZnrQIQSEEylICDI89rdduv8I+Tllw2NHjEKtSsN1xyL68eC1DB6JAxUJiJ3kZ7LOcTvxP+Or3IEfDJzdUxV7F/cr60W7ap/l91b4mgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KSoWFQFF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421124a04d6so3962535e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716884759; x=1717489559; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wmikxksbf6RRxeO9kTIqGW85bhxJreqFm94GpH2+ifs=;
        b=KSoWFQFF3G8/+81cDXBo5mF2QLcy5RO08XOnYbvIBaakJedE/PX4dUGpwl5TCiQqHR
         cn4TcYXa/nGbO3mkR91a++ugvY9/3N4dnQ529y5HIUk98h4/Pw1087a7I9Io1VPdHVQv
         dTU7eltUUco5nV4jdrKJilqxIPDUVX3pAV/6EBnC63YhNNEyL+NnOYSQS0ltQ4ulWCL9
         ENPHC2K+8l+7s0AhT7dinjBgLCUAud8b6PUIgjLeNO8KCXiqhjxRMyBlA55sKltMrOHV
         FcHnr6LUosbGTwq/e46sUVvIjwh+n5yGPJMWWql/FYIGEgYYJ/yWJj19hRZI031NlVjr
         1zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716884759; x=1717489559;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wmikxksbf6RRxeO9kTIqGW85bhxJreqFm94GpH2+ifs=;
        b=AhdJFbjKb1ixw68upe6dsUimorLtFL35+XWVGaP+be7ElzOxUQqbQvF3ItJo39Jl/V
         /OmHjGSPSZwaMKTqoTP7zzwhyQkdxBNu+7V7ldzvmlP/gcErnMZzzcFFNB2U9+TtXBBh
         97oOkrJWIDcJ2Hw5Bzk82hBJIQddfXfsdV9YpJkDg4saFh+z2kgBf/132X2R0zPaee+w
         aVDRb921nBkbEhASz7kyiXlXeZ/JHtCdNKqLIjVLzNrpEVMPXoEVs25mTpYNlvKwIrXX
         1Ic1PHBEBwgqLdc9xhpoNaThk/hQtMGPjBtiub0uE1dJaWvYRsdIkOg1VXSl29+i83UT
         1/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIGlvAjJhT2snb96U8MWYYu4gbTDQ2T2DJZDrYI5O3lAaBwEC6O8v6Tp97ZHnnqPkLMKFs3qYcWoZX2Fx1dB6xwcTo9gprhn1OAg==
X-Gm-Message-State: AOJu0YwP+5dDrCRBD29/BXpLcTuy6ER+0uCgCM6uCc7LTFwC9q9t0RCS
	Uj7T8cMGK+a4l/4g+SBDW+ogFe+jKCZSe/qWSpoVRgAbPvWXJyX2LAZAycj4Wic=
X-Google-Smtp-Source: AGHT+IF8EIFa6vOhgo03LXSgGy9Uicm9jgSa5q1kkR8ZZ0i+/ji7NnymfPTVeprixO/vzElt3QZ9FQ==
X-Received: by 2002:a05:600c:54d1:b0:41f:e720:eec9 with SMTP id 5b1f17b1804b1-42108a031a4mr92982375e9.25.1716884758851;
        Tue, 28 May 2024 01:25:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fd37d5c0sm96207545e9.1.2024.05.28.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 01:25:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v3 0/4] tools: tests: fix a few issues in bash
 scripts
Date: Tue, 28 May 2024 10:25:47 +0200
Message-Id: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAuVVWYC/3WNywqDMBREf0XuuikxD4Nd+R+li7zUC2IkkdAi/
 ntDVi2ly2HmnDkg+Yg+wa05IPqMCcNaAr80YGe9Tp6gKxkYZYJKJsiIT2J0msnu056IFNKMrBN
 CGQ4F2qIviyq8w4Jm2jA4eJRmxrSH+KpPua39P2luCSUt75VVnCquu2HBVcdwDXGqrsw+efXDs
 8JT6XpqvWbCui/+PM833rfC+vcAAAA=
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7JUwVClKHRVrHt0UXPvOSBTu054O88OuJZx7AXY9gqs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVZURrokBUmerZeaGBVLxvF91R9QU/yWcishdL
 CrTdKKy9oKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlWVEQAKCRARpy6gFHHX
 cpo4D/4sYsJSPFaMpY1sZoeeqoUxlwisupGX095kioZrwK7vPJOrCnNqmk35v1s3DRdLLMFBbFJ
 pLj1DyS+JMg+XERdWfpdCOBiSXFxSt48qU4vn8kplm/32G/mfajg2IPw0Hv6DUKrADHkbsghxNW
 yl6BpscaEnl36GFrPXc7k9LOHHspThp4pykvRnIOqUSE0JCTVvPIY1FtXfNAr+p01bLviN1jbpF
 fc9tj9bYO3jSikZ7OB0p2s+sAzaoSD4KZaasTPQRtCQyrhEiWR6EZDXKZRyuKhML+8hK3rbi4L9
 ty9m/qbaJovwMq7tqh/4nxR8iGgLAy8A4QidL55nhHmPtNVynZyJfEtYAEGFmbB6fq4FjL7klvO
 U4tGNXFcePGcbJZbFoNwq3EiEiasF6EJ7YvToBGIPIaZvcX01vA53OM66Cx2WFJdvan8IhaTnih
 FIgW2mEg436XSd2EKtZX9WyT5pLi9Vh5FFZeIlhg9YW7MO+oG+ijB8dylxCZJk4IYhrlpBn2wtb
 useO3GxH3gtESYzAKh6mo7/Qu4t14kJfCbl/yuV6vEAIhGJs2S5Ab4pdrKZxKzUhYfPnXBghqUg
 GARmVy1lmwRlQdiz2bvtBVoAuRChx2YVPiV76bCwhhEdDywdaSSBmLXCgLYaNaz1+ot81hcmNm/
 p8iLhBcfdqFfplg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Fix a few issues with tools tests reported by Andy.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- Use $* in the message string in assert_fail()
- Make shellcheck happy when using find exclusively instead of find + grep
- Link to v2: https://lore.kernel.org/r/20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org

Changes in v2:
- Use double quotes around $@ to prevent globbing but allow variable expansion
- Link to v1: https://lore.kernel.org/r/20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org

---
Bartosz Golaszewski (4):
      tools: tests: use tabs for indentation consistently
      tools: tests: use "$@" instead of $*
      tools: tests: remove unneeded ';' in while loops
      tools: tests: remove dependency on grep

 tools/gpio-tools-test.bash | 46 ++++++++++++++++++----------------------------
 1 file changed, 18 insertions(+), 28 deletions(-)
---
base-commit: 27fe10150f6d5fa78d1a1ef1e922dc8395d1154d
change-id: 20240524-fix-bash-tests-545bf26447b3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


