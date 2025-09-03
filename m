Return-Path: <linux-gpio+bounces-25469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C57B41AF1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 12:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBF76207BCC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEFD2D3A6E;
	Wed,  3 Sep 2025 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="eD1cM3jH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87123D7DF
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893716; cv=none; b=BXzqsjOXWo6+mzHp4Xs9BPiUyFmWi5UGfQqMiB6rNXioWEu/WMo05hdIQSoTpc3MlSEnjatjxearpcphdirTAmPDjJP0ImMIHLogKbgqA8xoSf3jNoIFprYtbopdeaPKImqvWMds/t17SkZ/LBx8ZIORUGYqGNKLDC7TvjJPFWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893716; c=relaxed/simple;
	bh=kHulDodA6XjjDXaF8f3RTdeG+b7HsT9DN9fR8XCqMLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rdvv3FLZjm77zPJykWWh2pepStXKbXO+sFsq2OtejfZnoaPDFC303i2UtrxKAMDHznPDS+LRNDKtQPVhX/KdEycxBPl2SxU2fY4v9pIyS4ejzABZuTBtuA2qR/SLq6uniFC0YDRqTopin55lU0K+BRh5ZpKl5bx7fIx6i/LyMBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=eD1cM3jH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3dad6252eacso674102f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1756893712; x=1757498512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ9qYB7I/+26Ck84iyosBQZh4d5xKjRCMcgtP0AqugE=;
        b=eD1cM3jHmhyyUQHGCI0l0yLMSM15MBoT9JvOWeMLaN/2Fxks8AYctLv0eRLW2hhLyx
         pClPrVdZs5nc8fg4LxDpG6JjlbkG2ZLV6pk2QoQEC2QffzfTpqMy0Fbv8LIYlP/F0iFR
         IdiMH+v6PIwM95jRMCBVS68Xs0JpTRLV7QKuKKFNNK28lNbHG47Uey9YXDYn0CoJWkbN
         aGANAcK/Nq9LBOxOnzOvOfS5Z9RhFcx4qkPIeoA0W37CZ/MKceJ7GbsledamJLKR04JD
         D+pAX/38JX8SJkmwSvIe9k6s8GH9x2k+jVqr0fhOiyMuQ767Vt0rO4ZA8w5MYZOAbxsg
         3tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893712; x=1757498512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJ9qYB7I/+26Ck84iyosBQZh4d5xKjRCMcgtP0AqugE=;
        b=jFc8N6WDXbdsqJ9Upn841w8Sn2RFMHKYbyg6NPzgNM3unjn3w/+lpkLVIausZVrFhX
         BHyzOvHAjs3yBa3oTSLhQW8Q2MhKGNNXAn+L1RasU6Ly8xpETm4n5mi3JbuICTi5hoXM
         YJzMpV69K7Gk8sgel1Cy4m2UGbraahDPhUfVT6Ix1XedmhiO9m1DNFKy3uq357e7fCP7
         1ZV79EFDQhgsF9uN/q8Ir3rCr6O+khelflJX+tTM3OO97MpgMclb0OkAgkeIjj7vNU+/
         pX7MbzsIDDgqvStFTfl1lJhcs6EoQEWidT2HfhkYaI8DkurpKScCfU2TUtBrVjhMBzO0
         dr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6wmjp3G+fObEd/Wl6azk2QFOki8SEY2Ddmh36z2F5WuPetFAZMVhugTbGc2k2vNGnIsZsQXWZGaF7@vger.kernel.org
X-Gm-Message-State: AOJu0YzRxJA0H7pidaFHXtbaE/RbxgvwrFSnBJO76yRasyJM1zq/dUTE
	4YVoOy48BSbAEGR8W1UGWIxX4MKNtPHiyuNFb2w/geUxYAg/8TGrDmolnM/wkmB4SrY=
X-Gm-Gg: ASbGnctjr0zw5sWcj1vJkSsD+++63MiKrzO22HgZQ5xj3dcSU0zdD4uRUJcKaBogKPc
	pTF5zihwu1OGzElqIIfuYL7EiKRLI8DBAphEktu5kpADUTwzy4VLON1UFZjUAIPaB07v+RAqM9Q
	B+/s/zRhJgygbcuq3IFqtyHjQm4OPd3oIhpIPO6eupkatSnZ/8N3kHe3E8WJvESKwM3tMo8ZxK4
	Ccz17NimisgnAmm+sFYROF7KlrJLJm7P1BoliHFABLI8K4LdUB4fbOffwhsRQUyL7wIWOuh8+Nl
	ui5NLV4YcFucWLFvUn+b2P8J7b0VcenX6En+v10j6gld0Zg1ddeEJud7kLXuwdzVI8KaIYzvH4c
	HWn4ztolg1NuFUfC/2qcgpjq9bf6tHXukYCsVsQa/ZrMYSLQi
X-Google-Smtp-Source: AGHT+IFlZq5oArcxA6dWnPr6LijEjpa+jLN9n3zA6K+uDuCGQ1hNKxqSyhK3P1G01ko5LeH0BDMpxg==
X-Received: by 2002:a05:6000:26c5:b0:3c8:29eb:732e with SMTP id ffacd0b85a97d-3d1df539ea3mr11440863f8f.59.1756893712086;
        Wed, 03 Sep 2025 03:01:52 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7e45:593:64fd:6612])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d729a96912sm10945323f8f.8.2025.09.03.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:01:51 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: linus.walleij@linaro.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
Date: Wed,  3 Sep 2025 12:01:04 +0200
Message-ID: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The datasheet lists this signal as PRI_TDI, not PRI_DTI.
Fix the pin name to match the documentation and JTAG naming
convention (TDI = Test Data In).

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 9996b1c4a07e..a3f433b611f7 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -847,7 +847,7 @@ static const struct pinctrl_pin_desc k1_pin_desc[] = {
 	PINCTRL_PIN(67, "GPIO_67"),
 	PINCTRL_PIN(68, "GPIO_68"),
 	PINCTRL_PIN(69, "GPIO_69"),
-	PINCTRL_PIN(70, "GPIO_70/PRI_DTI"),
+	PINCTRL_PIN(70, "GPIO_70/PRI_TDI"),
 	PINCTRL_PIN(71, "GPIO_71/PRI_TMS"),
 	PINCTRL_PIN(72, "GPIO_72/PRI_TCK"),
 	PINCTRL_PIN(73, "GPIO_73/PRI_TDO"),
-- 
2.43.0


