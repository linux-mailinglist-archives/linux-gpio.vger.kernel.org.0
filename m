Return-Path: <linux-gpio+bounces-22964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D28AFE122
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 09:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 546FF3A944C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 07:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5664726E71E;
	Wed,  9 Jul 2025 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XpdV2YJD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E126E16F
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045510; cv=none; b=rFBOcs5ZvpT4zw3ods584Fv6C6kFx0IkoHAQasjjxziCEG0PnYlhvM8zi25JgXRHpON4hc7o5GUpMs3hXJ4maTJMk8SR3jeWTN8B1TezJefq156kMqgqosr/GgKvhbUZMxKZzt+VPPd9pdlxA9ev5dIsb2g6eBZNwjmMIsMrbEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045510; c=relaxed/simple;
	bh=Ddy5ENchC8Pby5S0MOfdmqgHPdAdw03PZN+2E24a8IY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bAt0VgJ9uJwumxEpFEtpVdOb1+xG1cI4ds4wYbRJEe4I2sh54y2tgQODFPaM2uyvdw38t1LIGR2T4FFiIL0SamGU/ppvDnzbnLg7Tzes8HFerd6CKCD1Gd10G+4YkHhGzwFlquTgzRT1SonZjousYFyIs122+V3byHsdNsh6TEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XpdV2YJD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d7b50815so43361245e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 00:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752045507; x=1752650307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xtv+1mLTLiyUFNereTR40eCeaJSXQXpysVVt35ux7D4=;
        b=XpdV2YJDsfmIlnjn7GbJaLOdz/Hm/MZYBAARSZV1yxz7VzwW3fbR7SNTVPAxrffjRe
         Yd6tWQc9h1qKleM6z37puX46mRnGafMLPChO1C7HVL24IFygC3l+qvt6Gw0XXCF4/d6F
         iJA167gdKw1xsdvTIrZREZLQMfv95CPMOfS3je+hEVxo68dgL42KwRxFePmHMpM5wWj2
         hf3A/daqnJ8clAseytiy4eXJTDZY0zxBhaxLHPNE+cQxdf+91tqBCx2EpiirrzwzANg0
         ZVZwFI1FsH9apNEzlIANu4rMnN90W3wTBmEKhjE2+oVBrOxQitiRMUdEDe5a2N0NaZ2T
         jHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752045507; x=1752650307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtv+1mLTLiyUFNereTR40eCeaJSXQXpysVVt35ux7D4=;
        b=wRyTRXRAo+mf8/ZRUmc/4tdvuFVDC+KeJif2TR95Tqy6BJY2i2nuVQl6t/hy/Ughx7
         0F8HcqM79bPhvvH0dfNd74cUCXens9FrwfXIAWFDioMqVpz/09kUXK1yLUPzGkqyF5HD
         3cGRFsyN7bxC4P4Sp9N1sxIZHenWVgn2lp1HWptMaCifALZXMO62HHpQ7K/RvAVYTI45
         KT/tS/o9HKoMKGeWd17tQuXMzn+Y04CX2aQonSCvTA7LFEnvOhoPG2BJWNAMoVPs0tp+
         u9rilujMjbnpmnG0U2IEkuM+t5MnPIfaupuYjXHyZgeZvBSHAszdLjztjOMxG2VsBSjQ
         44Aw==
X-Gm-Message-State: AOJu0Yy4IJcKu1V3pc04wWIKl0W+ef/C8PXy5Rz2TJlh+ZZBMXT1zXYY
	ddclJIMmuBkFYZ5BmcEx5Nyuh8ImT+QtdS4ySGgaZVGEtYN94Ly13RSUYjmEw5ECKv4=
X-Gm-Gg: ASbGncvlgpsTkyv+ciMKspA32Wy0d/AWVs65DuuRM3ENjRg0hMCydRdRvV1aJLgRgF/
	W1g0ePLhCM6a+yAb+GygGc5zkHLBmvheC8IuX/T8WdZQ7rpXfP3PGgabnsYruVRZN4uvuLm1tbZ
	Wy3Pdpa1+YGsb2r3F/qsdupKnIbO1VpdwcCbvGQABTC0oCoQ8Me0jm7fnjLMOsGiWJAWmNvrLq3
	tCnvFl+QLKGHHJCsNxK8I4ACYFk8uQ/m67du4lTC2FgA+4bijvEyV5P2ZqbFyQ2erNodr3d2r2Y
	nxMYRByTBCJcq4AoBRsKr9TnbUjdrHI9SieDNcMUoWLa9ANN277nCOoE1HUvvms=
X-Google-Smtp-Source: AGHT+IHZLT5m6UPMi7jYTe6v9j0pZaYgHdcmkPwroJWH5KTaPc4HHxNeC1qoPfJaNQBmnJqjAPmosw==
X-Received: by 2002:a05:600c:8518:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-454d5301cc2mr12592015e9.3.1752045506726;
        Wed, 09 Jul 2025 00:18:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50508a1sm12603595e9.12.2025.07.09.00.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 00:18:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] MAINTAINERS: remove bouncing address for Nandor Han
Date: Wed,  9 Jul 2025 09:18:24 +0200
Message-ID: <20250709071825.16212-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Nandor's address has been bouncing for some time now. Remove it from
MAINTAINERS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 MAINTAINERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index efba8922744a3..c780cbd11ffb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27466,13 +27466,6 @@ S:	Supported
 W:	http://www.marvell.com
 F:	drivers/i2c/busses/i2c-xlp9xx.c
 
-XRA1403 GPIO EXPANDER
-M:	Nandor Han <nandor.han@ge.com>
-L:	linux-gpio@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
-F:	drivers/gpio/gpio-xra1403.c
-
 XTENSA XTFPGA PLATFORM SUPPORT
 M:	Max Filippov <jcmvbkbc@gmail.com>
 S:	Maintained
-- 
2.48.1


