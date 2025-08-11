Return-Path: <linux-gpio+bounces-24190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E4B20C9B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 16:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14AF3621160
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B722DF3D9;
	Mon, 11 Aug 2025 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZEyTMBY0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA60D2D663F
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923514; cv=none; b=PgbNx6I6v1EZbEpUZEn04PIfvANGaKa1XeOujp0eFWYB0eE4wKb9VOVzq60aBkkxy1JeslJD/z1FTjQ4tEdav6xSZ8hrpjx16K/P7smnuhh9fO3ZouMRoArbhrTIA3Rxd2J/OOZPbp0nfKyPVEDq8AuWiBpLimnP7uDsVQ+FO34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923514; c=relaxed/simple;
	bh=oJXpSUxbmCeHsDnOy8JZhNvTTwmX1fqgMDN4BLD8bgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMsQA0KzzMStKc7rSgLIn66/aTzunTO9IW7sKBzXkLFZiokrA75W83c9rgtSxGP6Aa1sHAMxY+XnVNjm/AaaTZ7I9esuJlz9bEZ5LhfagS9bAnxrxQSzklbGZy7psprNvTsHHu/FoCMZMgo60UMeGMZdxdgnY4NHAUtDpipQJLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZEyTMBY0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afa15bc3651so80331366b.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754923511; x=1755528311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvvYWX4uUCJA11NdZsypviiNiCsCxuB8xCdKgutIRlc=;
        b=ZEyTMBY0uqZ9Xo5f2DWE9K8pApVDCIbAu9OKkTetniyKCUfgEclw58tBZwtfGOjCLa
         EmsvF+X81ZDdanpwLkfCUFhCwxeCf4Apu8alz4CFrWL+na1YcyzvVDd1FOa/t5X0CCXa
         KD2DpBSCRi1o9wlU2NwkM/3ptGX4xroDrzHIYt6uBWg+wRhCf3U/K1v0ySXvuP9OAKIQ
         oypichEYryrPV02MqNiyufJa8vxPWwK0Acm0PbjC952gqR3oi3ncVAhbsipp8yPsMOhB
         ABamJf1M0NrO5mvf2lXeE/WcofxlW71Q3KaB/Ansz9c6BRkKqnMLiISQjHgBo+pmCOJ6
         v5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923511; x=1755528311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvvYWX4uUCJA11NdZsypviiNiCsCxuB8xCdKgutIRlc=;
        b=rF387pkLtU0HSEMniVLzMtMbphguTvA8f2WzFBfLwJlf2mR3dhBNcmHBj6Gj3iwT2T
         oBKZXWLyy/GDYF7hE51W25dECckWdMLIaSi/UpkcEUZFL1f6trht3UqOt4JzJEeY95H+
         w8pvqlQ4+siX7ptohRFuc8IOMQ6t9MELi1zzpvxDkJwtRQIBl/r3MBJrbdXediP1Ru3G
         oA90B6aRdeF4594GxOGiXi0+FsHvmgEGqgUM0HNNYfpQKsN2oYodsib1Si4ujt+ee7Cb
         cfJb7P+60lh7I/MEBMXOeykhpwGPVwTLUczjV4FOM/pisJ13gk2oqSfaboXndBRVbYUL
         +cnA==
X-Forwarded-Encrypted: i=1; AJvYcCWiuFzLnZcAmw7hd+BhLYW0/g+LwTAMfMyf9DvG4/PUATPwtyUiFyJQUfkYS7fVNrKT8shkgn+spQfS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo97ygvNue2JDTo1ScGX9v02xVxr6yY3W0HHjGzEZDzC5s6RIu
	acSct933roBt3GlOdpkbY9eFSEACa3RVDFQoDkqEvKWGN0CpO+O3QxcPJFtUiU4LSl0=
X-Gm-Gg: ASbGncsVdZ9V3ewnAOKAnUoISZpnDPV168iXJ7ezU3okaLrTsuc7C/chUg3/cMH+PDg
	3mMECO78Vr3S0R3+9dWVt4MgS80EuZP77T7TrBpuGukR32T4o6W5WdB+Bn89HertkTebNogfU9s
	B1oDLThTQbw+OjLs/Yd82yXU6ON/RKRAkuVUeN+Zrg8F75A3tbBHJaOExEjgwr4N5Ip2jCDrafh
	RGmm4fgmvYd7g5g6sYbG+hmmN1OLDPEQNwpJdDGFd+phrsKZeWitoOxEkgx5HfTzI9jKJhkLXsD
	ZAImi/NMjS7+qlVg4aFfdW+lMx5HWrstcTqSaRdm+4VV9NfmuJf+hoPxaVfmUNI7spZ3UeowJBI
	gEMtI1mcahCMssZVjGLXgjICklZFA0RFcabCoGcFXegvZbvsXEoVIaUz2rD2GdJKC1g==
X-Google-Smtp-Source: AGHT+IGIMsN/o17k+oKSTruxBNbnndkPTU0uiI+77stT/J27GNCFWaBwTt34E55lvek8PqTlJtXltg==
X-Received: by 2002:a17:907:26ca:b0:af9:5b3f:2dfc with SMTP id a640c23a62f3a-af9c6542d9amr1187895366b.47.1754923510770;
        Mon, 11 Aug 2025 07:45:10 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af9965a8d17sm1042961066b.63.2025.08.11.07.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:45:10 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 3/3] arm64: defconfig: Enable BCM2712 on-chip pin controller driver
Date: Mon, 11 Aug 2025 16:46:53 +0200
Message-ID: <04c67a8fc50f2688fd3a6616bc03b3ac4d4977fb.1754922935.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754922935.git.andrea.porta@suse.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
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
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..fafcd7851eb2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -592,6 +592,7 @@ CONFIG_SPI_TEGRA114=m
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
-- 
2.35.3


