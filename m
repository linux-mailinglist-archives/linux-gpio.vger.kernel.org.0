Return-Path: <linux-gpio+bounces-26812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 035E6BBDDC3
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 13:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A5F3B328A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 11:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7451F26C399;
	Mon,  6 Oct 2025 11:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cMWj78wA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1D326B96A
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750085; cv=none; b=Ga7/ZBiX793LuXrLC3e234WqVYIln2ko+MSFJI3+i3oVnHB4R0Ubo4cf0tqW8WH899IwxZOgZVeK6IYeI4Qsl0VnTWq0M60YvxrmNA3ERxabNDvSzeR+EAoeHesgZaNICO4qyz0EWvfy8PQtGnTBTXLkj991961+vWyLH/b6rDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750085; c=relaxed/simple;
	bh=PTghvdcN7Rm2Xi8LjpyETL48quuDa/EhCTSCXd5alwY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pgL4B3cWMlVuISiBkcLIz422HaWiJ0fIFQPB+fZ0OU02yH7fV2Yw3LnoWEW0VXT6TST4dC9B3vTNOQCzIvA28CKpgJHEOAV0MF15yhUL4M3+fAneGPcfsTBx8WpH1rbkdq+VER3jri4tI2Rt6YnEtD6lHcB2D1mFMB5666jye9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cMWj78wA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-421b93ee372so2225349f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 04:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759750080; x=1760354880; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gA4RXGap/OesRcpuV1u7RzSvxPuJOYavsm+cPLgLGK8=;
        b=cMWj78wAkit9SCqUXXf+sLpnHU9VM8UmIMy6ljMRQMA+nZD4+CniySFveJ4q9zHtQA
         R9o1ca4QBApxhAV/4o7yBkxQfUBsYB+VUxlnI7ogbGc/HcRTa2XPZD/0ABQSWdJugJkF
         db2USXBIDxY9rYnBPzlkKXPMzQa/ENt+txcI1zgquWlt8CsEsqekLQ9B5nrDWQkfAk3E
         okHZgWXbMKBlqQvvbBOJT7WG+sx9wShmcWwIhMO1NQiwDGnPlRZvNgGdmFjtnJZwsQSl
         f2OZWxOn8ozsWe5aDzhm36XE6mHB3SWkOb8sGpZUXU+10mal8KLoxZa1MtVf8V6CiCSB
         PgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750080; x=1760354880;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gA4RXGap/OesRcpuV1u7RzSvxPuJOYavsm+cPLgLGK8=;
        b=mPgDBQWTO4SuKsWI2PvlOpzFoG+ch/p2JF/kdoJ/0DM1n4FnK6kYuY+bpKqiyTMuUr
         YvCaMof+8gUc4N6AX3bqeycRdlzISxQIooCRivd6N2k8Qp+kw5w3QqAqhjShrwWAEIvn
         ikHMBs4plyLdV8M2oA0BNAfT2UrSOyhZkxwOHQQthCZazlaiiszojFzkuciPiFgzfdAg
         Tfg6O4q2z0wQp5ceSjTAWFfIlePwMUXZI1oqcTDanw/8lePZq5oDh9U25brTI2lX9aSi
         jZW7bvWdH3ckAfyn4l0f/neSNUJaaZemVN7WjvtGBHvqGzvaceed2q8+l21yJ0UaAW5q
         Loiw==
X-Gm-Message-State: AOJu0Yyt7UUC0MhUJDLNq5ufReSBIBo2OeJPZF9nbvWn07NtSakqY45J
	9QlZ0emIr2lTn5UPzF0dUaw+yMZbnCkcCFRHg3JJuDoH/zOg+qbtCqeANhNbnA9Y0oU=
X-Gm-Gg: ASbGncu7qyqqxB62O80luYXtwWg4g48kW5k2zkHCIjWRQlr/VXDmN8Qor/NS+vFmFAD
	RSNPG0Gb5QK8ZpTlNEsV8ONc6pK+AWxRDZVi7VqWTp1GgIbsu+iLcAU5pxQS/6fhbcHGBIBEbm+
	yEu4ULhuVrN1KndkECiiffWH9rKw6PSYjhodGK90pofvI+ZaB11Ld00cyTCArzsOc0no8L17NOz
	zo/2QowM4aqRdVBi7Glk6fHuQAT2pJrlqxla6NEqntdB9cFa4q9ISzz9e4GAm4CkNw9TtITF7WP
	lTKl3lp5bODZV42gSgtyWMyrJwuoS3x5bmw7JelFWy75yek/31igTz4fEok1d/9/MHyQdkIdthD
	c+afv/r2oqUG3WtyoW+k+5lcn9WjLeywh+HD/2O939iiiBAddenUcpJ0pcusRzhU=
X-Google-Smtp-Source: AGHT+IFDwZhjkYsYtm/ByxDf1qVt0YcgJhSWWkUByEvcm7nfxTW+EIJvSRXcqYRtuqiWqXKgY+t5DQ==
X-Received: by 2002:a05:6000:2401:b0:3ea:e0fd:28e8 with SMTP id ffacd0b85a97d-4256719e9c6mr7077313f8f.32.1759750080245;
        Mon, 06 Oct 2025 04:28:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f017esm21078167f8f.47.2025.10.06.04.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:27:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/7] tests: update libgpiosim tests and add a uAPI
 test case for valid lines
Date: Mon, 06 Oct 2025 13:27:45 +0200
Message-Id: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGn42gC/x3MQQqDMBBG4avIrB2Ioq32KuLCdEb7QxolAyKId
 zft8i2+d5Jpghq9ipOS7jCsMUdVFvT+THFRhuSm2tWt613Dy4bV8OV9ChAOiGrcPf3cPaSVvvK
 U5ZZ0xvG/DhTgf0ZovK4b/5ozJ28AAAA=
X-Change-ID: 20250904-gpiosim-valid-lines-87bf86d5d91b
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PTghvdcN7Rm2Xi8LjpyETL48quuDa/EhCTSCXd5alwY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo46e2zf28ySu36WLlYVUnxapIPcigGXLqnfK5q
 FFVhrEdG8CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOOntgAKCRARpy6gFHHX
 co0nD/4miB4YRRTMv9luttri2BGuqFOExYVVS9ta/1QYztv4tdW97whrMHCcBaRlzfvtd5tUQYf
 2VZ5o3LyitgVjXkqCJfPJKSZaL8Ymr8XGel9NNfw0wsk+IWJe2VbvOBJQKIC2xnUJbX+24btb1n
 HBfGc6/BexhJjAT5d8wpMLGfDcwaFiCi++NrpcgXG9PjL9lQ4beUYu3KN0rR+RpWeHMK5taSgcx
 /5IX+eHoWihoe02FFlD7nU44ZyyJ59xSWf/j3QTb6TzjzHY2mfl5mYoKBXdc8dIoEodsGfgMBDb
 uys2NzgiizKTp6tCXZf8dX8ER3tdohhY183K/h1LhPYHDJmcFuw7mwVxVR66GoX7Q/oBjqXj9Ta
 ZLeJgwhk6OrfwjYDego5hNixuPaG+k2zBao89Df3j8Nqty7FdXVBOXY4ZSly1QZrrj7gpI0ilp/
 ETvkpzrHZIblDGbny88y4LMsZYrYLYpIl2aMcuzFqsegNQRF6I+r3KGTAhx31XjVKF4J0LYsUHK
 cirurN2IdkKPM+gmv1GhK+12jHeukBrPgEesudY6wdwj/CnIJcQiPz/WHLUjahbe78RJ2s6R1TO
 JZgGy+sMIekjogWLcdKE1bjtynDXd3rcbTKnozS463nrdwHBKdpwbv9YjtfhJS6T+1G0wB6dO3T
 PeRfEwLxSyDjntA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This series fixes a couple minor bugs in tests, reworks the libgpiosim
selftests a bit, adds support for using the new feature of the gpio-sim
module that is marking GPIO lines as valid/invalid and finally adds a
test-case for validating the correct kernel behavior with invalid lines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (7):
      tests: harness: use correct type to capture a boolean retval
      tests: gpiosim: don't allow clearing hogs on active devices
      tests: gpiosim: selftests: shrink the self-test code
      tests: gpiosim: selftests: add more test cases
      tests: gpiosim: provide gpiosim_bank_set_line_valid()
      tests: harness: support setting invalid lines
      tests: add a test case for checking invalid lines

 tests/gpiosim-glib/gpiosim-glib.c |  48 ++++++++++++++-
 tests/gpiosim/gpiosim-selftest.c  | 126 ++++++++++++++++----------------------
 tests/gpiosim/gpiosim.c           |  23 ++++++-
 tests/gpiosim/gpiosim.h           |   2 +
 tests/harness/gpiod-test.c        |   4 +-
 tests/tests-kernel-uapi.c         |  29 +++++++++
 6 files changed, 155 insertions(+), 77 deletions(-)
---
base-commit: 727d07ee53493219a339ffe7c65512eb85548e6f
change-id: 20250904-gpiosim-valid-lines-87bf86d5d91b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


