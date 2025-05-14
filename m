Return-Path: <linux-gpio+bounces-20160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1772AAB759A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A233A17F239
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 19:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7506F28A71A;
	Wed, 14 May 2025 19:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhyDBNLP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A751E9B0C;
	Wed, 14 May 2025 19:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250329; cv=none; b=a8ESar+box48TrMmBm7qzc3dKeCTggnCiAc/vLvkmKGCfRPhBWZ5MMgY6rMfW9S37cl3mIZeXFyxewXiKyPPMGJj3QQM+btrk1L0CmmTWa1YsLuGyvuR2Rqu+Ewinw/WhWmzPqF/KD0JEh2BKavocLaRw/Mvk0z+yD7jvoqdC28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250329; c=relaxed/simple;
	bh=6Szgs5ZgAKhhejy9bd5sdKVyqZl7jtCcEZRRMTPsa28=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MIE48lvN9jVzBFc7K4IYUgdrsP1VfVoALQa824zdbr3Bb07FKzokyV66brrehBTn8WvdHY4LoBgASsqxZCFKuR+O02D/RG+9ueaXyP7MGZL4meDN4aRAS7fRSUSlHkyFO0jehkXY6JA95lEDxg1gZF0U14ADN/c30VJOeqzLlA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhyDBNLP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442ea341570so1054155e9.1;
        Wed, 14 May 2025 12:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250325; x=1747855125; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BtbSxTybdtcFtS1jNyktVMyxuW9cSflR46MX/L5XT0=;
        b=jhyDBNLPqGrNpfMxIH4Vm6ztYGjwiCS1GQwoDDsiUT5Nby9Tspg7INqB0QOyoXNdX+
         7BWOwzj8df7+lJwsL/Ya3Eb2YKvDsYvNVm7YMJqz4x/4AHDZnCNJEakL1vNFvBVxz7RP
         c3uvSOn3KUsd24oqJ1LgacyozranENsJw2g4ZA3Yf0AKGsVQfPQnBVmlcxd8mO1uTekW
         4h6/HOHfWmjVayXebgtBU6b/HI4BUX3xV8UbVcPNYDhCFghRY71cMdlG3hvM49EPUByK
         X50NIZwh6tV4yY4/ps+CukL6iIIB/JjjHhfqJol2LpWZuUebaCf/sYiAVoG8jnIhnXyM
         R4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250325; x=1747855125;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BtbSxTybdtcFtS1jNyktVMyxuW9cSflR46MX/L5XT0=;
        b=gQIDocJwNlkgnByQyclgglopE/EiCldF/vgTSOau43mEG8kTESPJFl2rS5LdqqaoPE
         PcFM40o4/C2V6ESTBQyp8tLnNKFyub91F9SOkMqXZkQ8jp78ztpb+QKAVRFBe2mMU3KZ
         3YG4yp5i/E4Ho5SMIB4yfqstPFJuUnbK9PCGcZYupj2m23CxnJ7dzTPcbnVUZuhUfIcl
         1uoh/lV8jK17h5/FgNN/pQz+ADXEGVlx2D3fIdbPmqo0D1Z8IJy7VJwEajM7vgIQtqtK
         +JjxN2xg34QWKSBaGQQzOvJPBUJLB9YSXM4/fkvrKBfKfZN5Wzu/DZgwrniAyEglsJWZ
         kENA==
X-Forwarded-Encrypted: i=1; AJvYcCUaB94pTbH+d2e3A5TWLwdwj53e/I6YRpxFdM/LKpPX3b6+QmOtWBFJ13Bh6ZqZRcPMekehMEXKYJgM@vger.kernel.org, AJvYcCUrbDG+alSVRdcs2PqfFosfnvu7ls4ghkUd7IxwQSEw3kaI4EeCxBQ13ZO/TQB1+dMYNaTf7W5L@vger.kernel.org, AJvYcCXVjTsxBrKhqrKf3jfl5gHPEKyOtvQl+mMaMmT10WDW95rFFR6NT33Npf8AkguWfxf2zAmGaPyql9+X5cL9@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ7YC6273FQZAaS4a2vRbl1nMWPziLv0vcORuHSLLTjKmOPOlc
	iFoPVlifb4+wLjMjbMbfNsRodTyH76Z0hhxKVPI8LduWY+HDG268
X-Gm-Gg: ASbGnctgZG0CP9F/m+Qj+B3lfFc1gKv3HptgJx5WRxG3krsM6HTk/n/vVkN6DC64HEO
	MiI2BWf8JrFHBHi1Rl2mGCq9kfzlCoYhjSQ2Bxn05M0gpWXdARwU+/npMX3E5JXANdpsdqBFWeB
	xSdSSxQCVbnag5q57iOhC/1hlswbI+StJ4QSUA9ENfUZP16DmbhBGAV0k+DM3tBt2LxG3lylnI+
	CEAs2SVSWuZLOH+h2ziLcp+kHiHu17NGHYpj91y17p97nCNgvzsUxE1ucya3uidQIHM2ZZu2NaT
	MAJDBvDWg91iEKPLb/EYqukH/eGxsqY8pcm9NxGNxJwm+c7ETmpmbHSzmztn5tye8VVUGTC/rcq
	MJjE7
X-Google-Smtp-Source: AGHT+IFKFToRN7zXhbHdXQ/cdww5PsgDL/Kla5r5RaA5iyZqqiHLzqal1BkIz+g9xpxoUT2qzwYoxw==
X-Received: by 2002:a05:600c:3483:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-442f2168b73mr39019935e9.24.1747250324619;
        Wed, 14 May 2025 12:18:44 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:44 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v2 0/7] pinctrl: armada-37xx: a couple of small fixes
Date: Wed, 14 May 2025 21:18:31 +0200
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfsJGgC/32NQQ6DIBREr2L+ur8BKrV11Xs0LhBBf6JiwBAaw
 91LPUCXbyZv5oBgPJkAbXWAN5ECubWAuFSgJ7WOBmkoDIIJySQXuNGqdz+jujUpoaVkAj4fVvW
 6lrrnHIq5eXMWRXx3hScKu/Of8yTyX/p/L3JkONQNs2WQ35V8jYui+ardAl3O+Qvqep+CtgAAA
 A==
X-Change-ID: 20250512-pinctrl-a37xx-fixes-98fabc45cb11
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

The series contains several small patches to fix various
issues in the pinctrl driver for Armada 3700.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - remove 'stable' and 'Fixes' tags from the error propagating patches
  - collect 'Reviewed-by' tags from Andrew
  - swap patches 2 and 3 so the bug fix in the latter can be applied cleanly
    without depending on the change in the former
  - Link to v1: https://lore.kernel.org/r/20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com

---
Gabor Juhos (7):
      pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
      pinctrl: armada-37xx: set GPIO output value before setting direction
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_direction_output()
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_gpio_set_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 35 ++++++++++++++++-------------
 1 file changed, 20 insertions(+), 15 deletions(-)
---
base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
change-id: 20250512-pinctrl-a37xx-fixes-98fabc45cb11

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


