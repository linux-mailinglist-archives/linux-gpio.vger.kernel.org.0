Return-Path: <linux-gpio+bounces-8603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC9A94A2D4
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58EED28124B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E811CCB38;
	Wed,  7 Aug 2024 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpSOzAPA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE64C1CB329;
	Wed,  7 Aug 2024 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019336; cv=none; b=KFe0eSLhf3NwotLaUOuSb1GXZaTRMWSswiUtdIPFPVIA+79CE3GFVwsvP/M0T+V2P8O/sRo8Q52n9gLzC7gJFA3TYMyCntGVJr65YFOJy5jX+LzgvWEQ6Na2N22Gs5wChCrgVgN5Az9+N+VyhkARqgaXpf0VRBDOcjZxmim6Yl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019336; c=relaxed/simple;
	bh=up95Jn8z/CKAklzlcCZlanIzyTryeAkc/O0UiDkh4mI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V379r8/MVEaJyBExoIf+FHQhTT9LAVWn8BqGVkA03zMaGiPLQcoUbck54xSwEotwEpcPMQX9R1xU6OHbcF0mkksvckVHh4CK33yYVSa5JSQtQ7nSLRhdKysudr12RGRQOHQRTKm9LuQG23TmH72OoEYIJ6TIb6f/kSV87cDIJ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpSOzAPA; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f1870c355cso16094651fa.1;
        Wed, 07 Aug 2024 01:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019333; x=1723624133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gUuyh8rLO5bGZ5tbLoo+24t4EoSFzCOVBoDsdcOt5M=;
        b=bpSOzAPAmsWTlwySFUjnVrgTaY4mYLZyNnXPsAd5z28qrUrahgCIVb5oqdKXs/l+n/
         R+JyQzpwvcsPPGkY1YJ6jFhrUGUSQQo279vhVf9fr/1Ch+4xlsiOp7WLcsw+WtsDWI0p
         7uFANSLJtECrlXaS0XW4qzhhcG0XilsaJeyMk3ub0I1wIkXlqCWiWyMwe75JXlCq6rWa
         LG3p+scAFtv5YCQpvQyMt/yBees5gi+9BvOlXIA6ZM7Mawi97piKEsNQ0oxaXtQI8Pqn
         1CTRvuKfzI3fTWre1MuJucEd9ILFfPDa13rXPD5zUdQ+G9F8/GX4qDaHrVfCIxXsEWHZ
         IRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019333; x=1723624133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gUuyh8rLO5bGZ5tbLoo+24t4EoSFzCOVBoDsdcOt5M=;
        b=hBR66/I1sngaDvMGo094nXhmcRchf3iI6mYi+a7xOV9sf5D+k2625nmdPs7rpLxcae
         eG4Vc20bD/RUOyUCAZxKBE49OeqJO4spozUjeTUcCpfEp3T9D2bynnqusJStvKZ52X4V
         RLUse3AhimyrUCMlX5TK1MykEzMUJ7rvn4bkU2a6CttucjbHVqU+iEKmuZGZ467bFV2O
         N9n0rXNDNcJeBfuRCDr6Z7zuq1312V2F+EriymJvoKvMGre/NUlACwRgPJQWDnoS3+oQ
         KcK914jZq6/q84DBUpVJ/m1r1yFZpyFmC22HlzeD7S2eCTF9fzo/iZK4UAW5+UopzrzG
         UjxA==
X-Forwarded-Encrypted: i=1; AJvYcCXxZz4l7DizXq16VlgSC9ZvyMiArPG7mm/hAxWA5w9g4MurT4Are+GG3fKDlB4qmRR62fy2UIL0dnPse0UD76XtN73O8rQ+Cmteh5jxI0zxDV3CkI/0vtSxpJpbhpYW2RHhXDKpLKH5AVjPvpLLCLtyWJLn1V6NpcmEbVif5WOIhxwuyYM=
X-Gm-Message-State: AOJu0Yy9zRtWB1yRKf9ZRYDNX/0/3JhkOYSRG3q9UJ0PJACeouIjNZLp
	nGyUY91F1snFp+h72Qd9e8XB+6XHQEd3PKFe2jMfVzyUwY+KXyma
X-Google-Smtp-Source: AGHT+IFclHItqjl+JfPv0vgmCE7zzOImnX3XXBHjSN2Cgaxtb9iv4GT8BTDq/2R8pB463B1cZuynxw==
X-Received: by 2002:a2e:91d5:0:b0:2ef:26ec:44ea with SMTP id 38308e7fff4ca-2f15ab3507emr114538301fa.39.1723019332973;
        Wed, 07 Aug 2024 01:28:52 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:28:51 -0700 (PDT)
From: ivo.ivanov.ivanov1@gmail.com
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/10] soc: samsung: exynos-chipid: add exynos8895 SoC support
Date: Wed,  7 Aug 2024 11:28:35 +0300
Message-Id: <20240807082843.352937-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Add EXYNOS8895 information to soc_ids tables. This SoC product id
is "0xE8895000".

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b1118d377..2f794cee8 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -57,6 +57,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7420", 0xE7420000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS7885", 0xE7885000 },
+	{ "EXYNOS8895", 0xE8895000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
-- 
2.34.1


