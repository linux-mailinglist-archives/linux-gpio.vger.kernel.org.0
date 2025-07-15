Return-Path: <linux-gpio+bounces-23325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B604B06613
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01C9018802CE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE022BE057;
	Tue, 15 Jul 2025 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IbGTewHz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80ED281513
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604214; cv=none; b=pDCd62Y40PdBqt4aE/w8+4XjNennQPByJ+Wx9iR5BvVsA/R0JWHTq+oapu9jkzN8nhaw2XlooU7ogvmKOAZ3B0P3LKjZF/togAhvii6H0hHzn0P380VFSVcNR0E+x30Y9JwuG9LneuUxnzk5NtRn7AnDYR2WFyBFcFJ8JH60ulc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604214; c=relaxed/simple;
	bh=0Zz+G1AeNmuHMtiESKx2Dh//8cBSsDNEuTYMBdpH/uU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BrTdVQFV1ZDvMynn4LcNb2D/azE7g7znXIQwGEJYsyQYSxmQDaOVYIfEc/2oiE0yhNu7lVf5lZiS8nj7ik7Wptma6TIp3X0Q8maKNw45EJNDl/yaY93N1gZhOxnu0+F5OQRPoT2d/FVLSiKPr8HckeqtHWvN8qZgkHBS3cLDLJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IbGTewHz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0c4945c76so930434266b.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604211; x=1753209011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMKpzUOtQQ4RnSGMZoG+pKA2TVUGTMT2Lpv20Jd2YaE=;
        b=IbGTewHzcvan6e91j2XcPN0Ts1wVykmLmYfN6oL2pMXMfWOpJmrflv8UN34bh7c87c
         kVFkpUt25oucG+zNnhiU0kCQX1WeIHTVyAoWB4K3z8XOVY1BwDSe+hGDVi20hm3e7Do/
         xTpz3NUSuq5T4Kum8YrPYLutYsFy49MI5qHurYDuEt7mY7zB2UegiiUXGxB1HIdk2njS
         2NojuN74Ej6fHdQGYn8tHF5pbG2hfXQli/tEKWt7zigDOz/PNMPNkZfGA0pyC4iq/Wen
         wf+cL9nZNQozUdgcP1rt1ywITp1xq6J+kE5T/QlcOkPE5mCoy6FkWpIFcwIO2hwB5eDf
         6cTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604211; x=1753209011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMKpzUOtQQ4RnSGMZoG+pKA2TVUGTMT2Lpv20Jd2YaE=;
        b=SLvDJXvbpEqdPEPKyYXFOWmDJSYKrXxvI3Run71w26F5pgzdcHUT9qiurpGgZxQlaH
         0p2PUe0TEiHEa2WiC47gxAniPM61JuOfm4dMAR2Tp7XxHPlSdrvcsLPEmHX4EMWqC3lU
         uSWbU0RNRJB1FvZc2uk56lCZ24s3bgyA+J0oPQ1hPD9o75hdFHbpnau4V1uhfSNC/hbd
         NfCjKyddg9ONRrBvtmObcpXhghjl16JlwV2jrhtygLcwF6g19Mr1jJnVRhPhG+IdIHVz
         dhTgFpW8eaYNMgGFyE5HHsxQqKQE1mtgTlYh3lgvg5YZBGG1ZtXTWy4xtKbK7iNpOt2n
         RCMA==
X-Forwarded-Encrypted: i=1; AJvYcCUodbvF9u2SLrS7XcVXTa3DKYJp8tm8Zc6YcQYNGoS1Cy7feUgy6ePt7UllkdpqZuj+L6OR3m1to1dK@vger.kernel.org
X-Gm-Message-State: AOJu0YyM8BiEQyHh4En3eihQ3/IBcrYcmQ733SEOwB4NAP03OWDrsVxy
	KWImn23RQ412P75epm5Gtxo/fDqzJoLFNx1Sy/JPw4Lzo9VHDZ9gmlMxoGRfMinwpwU=
X-Gm-Gg: ASbGncvQQmH+aNjBj4BuRF+UkyvHzae/sNBokmGaxmAvVqneEMcx8DicAa40pMS/+nW
	RM6vohrdlTrysWhxvfHB/vq/w6SQQ/1dyjpxplE6uh6/4C54ME17VSGj5shaSWATSWVeWfU1n3D
	Xx8nk3N8/Nt7tXwnmVjf7U5gvQkipVuXx7ewyndojrvNVlV0MrzpwAot+sO55q+Iadopk/I+o6U
	3+HeT2ir0RhZIptxTGK3PY11lJWAGcbOORpaDcNOz95alrj1Mjd4O61BIuv7pR++WjRktBeVIGL
	cPRzcASPea4TvoZSj4zsKgDJjA86VubnsVEM9TyVp/OtJE07JFrXhtRXGfjR9wZ8F6Sfwhz2wuE
	mVFXaxs5V/4U96y/vXNHLQRdPGTTJp+4b7quzXG0BXBLspuqhzg24rDnBfEz8EP1un7YS
X-Google-Smtp-Source: AGHT+IFD+rL0b8mfG/XC5RLUsZeAfk82DWW6oFEzqb1ZtsiTH24r6hlO5g2/DzPIAAnRpqh2cuGFuQ==
X-Received: by 2002:a17:907:3f95:b0:ae0:6a5a:4cd4 with SMTP id a640c23a62f3a-ae9c99588f9mr46308266b.12.1752604210988;
        Tue, 15 Jul 2025 11:30:10 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee471asm1059372766b.54.2025.07.15.11.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:10 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 7/7] arm64: defconfig: Enable BCM2712 on-chip pin controller driver
Date: Tue, 15 Jul 2025 20:31:44 +0200
Message-ID: <602a968606ea6426a7fd4dbec719a002f157be48.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the on-chip pin controller driver for BCM2712 SoC.

On RapsberryPi 5 devices it is primarily needed to operate the
bluetooth and WiFi devices, to configure the uSD interface
and the power button.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is based on linux-next/master

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cc82faf1371c..da5647c521b3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -590,6 +590,7 @@ CONFIG_SPI_TEGRA114=m
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
-- 
2.35.3


