Return-Path: <linux-gpio+bounces-15101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A101A2328B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 18:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C68AB1884774
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 17:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B062A1EEA43;
	Thu, 30 Jan 2025 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lajg19n7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71D1DDD1;
	Thu, 30 Jan 2025 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257049; cv=none; b=Ikp6XabhXIEB1aZm/M3efPG0ifJh0Slqtdi6rfO34JQlPsCfokEH4Vz6n6h4N4mB9P09ESbbxSabz2AJhj9QuWV62XhOuvCXDYsNxb0bSb0Ojcx1cGGXvw1Ea4sk5WNqHHYfZ1lkvvT+BVt1SsBJHXHpOc9lru0FrNbP/Azidvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257049; c=relaxed/simple;
	bh=PxtybYSxgsuwZVcwghTaYuaHXmTHWbwCzDuTXGP4NhE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZOc3F6GjFZZLFqw5UQtBURhszq1Hg/aISyp4s7KRrOp2vE+JngX/tYCSByrQTe0byS2kEYRSSNNCwVLbiUG7JR2+MgxweryVaazj0U/gCfqmSZ+445RP2W/amYpIVqlj6//r1L+4Wo42tVsjWrf0yfOPiaD/yCcWwqa8dtX9fWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lajg19n7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so1852326a12.1;
        Thu, 30 Jan 2025 09:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738257046; x=1738861846; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyi3Ntf2szBW5h6F6hgF0KHfVDRaAzVDcHs5RUl4h3Q=;
        b=Lajg19n7iabDuVVRdhWT/fT12Kv8Cu7ppMcqilAMmIHyeIqIMR1D28Ci1RMudeULUh
         mk/O7BsQquriKEYocPj1lPXGy3rLq51B4mjWpKxw5ASgj+0xThVD6nedVUGwtzxoy1YB
         zrseQWs1wJpQvRGGrwr2Q9kLraVA4BjMLpv4ZVsdNbPIZKzejHqZieVxKCYrDIUoiL7A
         isGtfcAOuyj6pcva0D92+mJeE9w3/AUBR3WvV3pJCrCElieMkviec6/Qw0g2beU20lhl
         YlyHuY/yx8rPFWh1no9pMnwaroayVfqySkWI0sEE9VyAlZsEhSsIV/GKGPzyL3HY10rc
         cdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257046; x=1738861846;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyi3Ntf2szBW5h6F6hgF0KHfVDRaAzVDcHs5RUl4h3Q=;
        b=HkHLWJm1zfC1g9PMrcgBgYeySy1bDyHTON1dtimfKrzCnEh0W5HVpbkn/+xqiwwVyv
         0kfuPyM1O6Er/naE1wwEr2LdVuVNrZklnIKYOBUUU07Njz+bYX6cg49eTh84w8/+ND3p
         7ew2ZQCoFYROO5TulD36QmudszNfJXjIlxNSQ+PCT6ttQU0pQWD5g47jlXxTKPZjUzJ4
         L618zNjkBVxMT4opD7Yk7qp6D4HLJiI4/r/N1JU5FMO0oVTacgzoRUzgEVDl3MnXQh31
         h8W1lIuinbjNeyPGNQ5qSnsyJP4YDTPPGlJfQpmhYZrtBr+kJt23Zw6tLD9aSFfK7F3/
         KRLg==
X-Forwarded-Encrypted: i=1; AJvYcCVb7LAm/fzggYzwSprNSsyVV1VZdZECon/BbFPpwInW44ObK5i0/elpXIrB2XV9Z/Q2/Y389pCLrZDfqAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkxXX+E12iPdQCNXsx60njiFMZeEGS2BrponcL+FukiZaDKpga
	YCv+CWqgBS4zi8yUJ0UmX35ADqlnj4WuccrcNKZeTXeTXVLOBSS2
X-Gm-Gg: ASbGncuKiHrOO0CwMZrA+/BMD13CGuufPgS40dMbJ/5gh+DkfEXfvnudOM7uxY/4YRV
	9GIC9BEAI2tftqdes887ECVnUBMPH0Br3/i875R6PV1YXqDtl987U3FOc1mliDBwo85EPT9LY36
	iA+APKaydZe7liEgPfq0cbZHmFiZKQSpXZJkZcDJaFq24HjVgo6quGZXrM1/HHR5ynCyY1qvEWO
	Q190CyGBbaSwUZ3bA8g8cbvakw9Wa3B9+B448g8xHOGV5nUorI7tAVQVWu1oEh2r/Ckv8owAC+w
	VuxamgjDQk8KT7kMu/poq0vF8M9qxunPx7qUXOFLlthBkZV38q+O5FcD397yGQ==
X-Google-Smtp-Source: AGHT+IHuH7tNl9Bb9Su6vnpYDZHYYanacyBZ/Eejqsa8vLrRR/2fxK8KHZyEMp9Wes5Q0gARcP5/hw==
X-Received: by 2002:a05:6402:3511:b0:5dc:6c5:69d9 with SMTP id 4fb4d7f45d1cf-5dc5efb82aamr7345749a12.4.1738257045952;
        Thu, 30 Jan 2025 09:10:45 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9da7sm1349021a12.79.2025.01.30.09.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:10:45 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH 0/3] gpio: bcm-kona: Various GPIO fixups
Date: Thu, 30 Jan 2025 18:10:36 +0100
Message-Id: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyym2cC/x3LQQqAIBBA0avErBtQS8OuEi2iRhsCDYUIxLsnL
 R+fXyBTYsowdwUSPZw5hgbZd7CfW/CEfDSDEkoLOQi8YtjQ3xzR8UsZDU2jtpqMdQradSf6Q5u
 WtdYP2p0DO2EAAAA=
X-Change-ID: 20250130-kona-gpio-fixes-6e74595e69f2
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>, 
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>, 
 Christian Daudt <csd@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738257044; l=1120;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=PxtybYSxgsuwZVcwghTaYuaHXmTHWbwCzDuTXGP4NhE=;
 b=yIN8LeDh1lxlrHbTAtHCgCr1A6ElSJZix9sgmrXY74M5oBWn2YVhUoBoKk5nW19NbV+C/ITZ5
 8xLp7itDpO3DSfG9YrxRRYX14WBu2JbegOFsg5GD7ifD4/ALKoWF9hK
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Fixes two issues that were preventing GPIO from working correctly:

- Lock/unlock functions tried to write the wrong bit to the unlock
  registers for GPIOs with numbers larger than 32

- GPIOs only initialized as IRQs did not unlock the configuration
  registers, causing IRQ-related configuration (e.g. setting the IRQ
  type) to fail.

Also includes a minor fix to add a missing newline to an error message.

Tested on a Samsung Galaxy Grand Neo (baffinlite rev02) with a BCM23550
(DTS not yet in mainline).

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Artur Weber (3):
      gpio: bcm-kona: Fix GPIO lock/unlock for banks above bank 0
      gpio: bcm-kona: Make sure GPIO bits are unlocked when requesting IRQ
      gpio: bcm-kona: Add missing newline to dev_err format string

 drivers/gpio/gpio-bcm-kona.c | 73 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 13 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250130-kona-gpio-fixes-6e74595e69f2

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


