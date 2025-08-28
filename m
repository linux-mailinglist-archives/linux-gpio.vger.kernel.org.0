Return-Path: <linux-gpio+bounces-25052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A83DB39DA5
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 14:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7160B1BA4941
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 12:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBC530FC36;
	Thu, 28 Aug 2025 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EPbx2oD+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D9E1A76B1
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756385157; cv=none; b=RNF+6Rzn5wa9B5FiCy08lJd/QV9ZqMjJNHAop9hGEdiKwbnsPvYRObzXBISUCogGKIrZ2OcP2v6SuI1YtXb00CQZhFoAt0QmZvk/+kr3fvYIXOxX4evcayrq5pspBQ+lhQS/z8nSiYp7YoMFAneXUTZmPAsOm+aIoT7+k53CU54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756385157; c=relaxed/simple;
	bh=2/h75LC4QC05CD1+ReHV0CacW5rn5FqjyW+yHnAE8pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+nkkDoJaxfe71XiDPEHD/hRwU8X7Bbp/Q/6QvEJKgU/Khjisq3udLXdigvj6adjhQLunW2l05nNZ3w2aKxRTE5XtX952u8N+2pCWD0oQ5EmE/T94ZZpiuk1plWT0G2a1DZ/ZnfkKa2isLWkNbYkZgqOxHVE1aYMhyXt8MrGqhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EPbx2oD+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afebe21a1c0so138120566b.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 05:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756385154; x=1756989954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcHld7eWfS9k/YycQdQCcj1jL0BjbTeZ29msr8uUtu8=;
        b=EPbx2oD+csIbjuwTq1/K6hmbrd6qHZjsuN6mSfh647WSdJg1yeq3/N6SQx4UXvkoW5
         SYEsmvJ6N2TW2smH/fPnzjRCcUEh7ENVC+Yx2wSZvqgWtBH0EfroEKzrH73EooXwA2GQ
         SMljvug19Uwv54IxWnvXTsyB3YAfLHncyEj7RepS/tR2TrscbPbYdPF5IulMmwV5KrHg
         HBV40fwAetc0Tg6qytaaCG82imDBpbUB2L8LVUNOYZrhyLgSHCDtrDr7xLAwPLa4wJPx
         nXW6SOe+Av/zzKDvQlXcHMmJ27FxyODF6KcPvE+FkFrUUzXisosPa5FSMZGMLQVk4ULw
         mc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385154; x=1756989954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcHld7eWfS9k/YycQdQCcj1jL0BjbTeZ29msr8uUtu8=;
        b=slt0Gd5pTg0zRo6JsgXOkDyrMbZ6Y9AP4WZEB41k5TPTYCQKri5jlb1mE5Tqib7Sb1
         web5xC9KdYJLMpTpWSR3XcZ5FFxWAVbps8Tjp4Heze3mcPU9/7TWcn9D42SJmtvTK9Ys
         5Brw4CHIFWCHn0TKf9ZtC6wRIE5nPhNK55huRsvC6yfT46WcZbqBOg7tVW84qT/P2jTN
         YIi5wqCfFuSC6KpfGLLynm4FbO35AVbsNGCxCvDgMfiPMKeLAjLVh93lRCYh7cCGRbG9
         8grjXf7B3FjwOFTCB8fVOhMvnS4RL1L5b1ulOQfdiXyOOCDk9dlUbh5jSqraKr6KWeVX
         zi+A==
X-Forwarded-Encrypted: i=1; AJvYcCXFxRjssr3hXHAC1AZhwpVwF2ngS9aJuyXbxivxrCsn6vo0X57i/K9gP/V4P5A3a1wgw3Y7d/HpeCaU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjp/B4B93XyhIJ4JS9DpFMt7xC/Cow97/DLuHZTdecSq2f9V6A
	CZ2nb1A0rubQxXsMdWhuVngUie14k1MlqgRj1lfM2ecnlxAZKuaZpN0U54lX8OD67Oo=
X-Gm-Gg: ASbGncv8f8b2S6AVfbCeQme2TRBGe+WbyIC5Lr+Ggx69QT8SQGYtLoD88Lkacz6NaUC
	QasUN6sXts2KdTVWFTXVB0KMu0Xv+U381n27lZZMcA/osILTjMFj0gMF4Zvu1DQPwiqkfmf4C0m
	9kqZKJ7An8df/V54xm34X97L2xFfmXcEcLLumm8pMIvk/606ItfAnByF2SD/gGoJlMqaReqpQue
	KqSCn6C87t2iaLtS1I4T+vpMYG6XfRVAHJcp6m8P0JhIIAC0FaEf6llLLKRfXwhnUPJyj7qrXMD
	flHGJBOVZjxYuwemYUXYwYPwLIK13OPNxF6o5wHrGrqXJ+M5Zq0dT6C8S9Zx7Gw8kSbprNDo8qS
	Sm/urJu/ZjgeQ43/O4vTVisZ/fna9PN4NmMMyzt7YKT/9eZQJLnywwhCxUkaZIt3kHF5aHIKhDp
	dO0H1N8oz5M5bQF63DdrPDHYc+Z44=
X-Google-Smtp-Source: AGHT+IHTlEX0jDh5wp25sL0tVvvc1vBRnSxN+hiigX84aZY8E/p/0EJNR7c73UuEDJXxDs1etOxKiA==
X-Received: by 2002:a17:907:7e9c:b0:af9:d863:5ce4 with SMTP id a640c23a62f3a-afe28fc281emr2095490466b.15.1756385154182;
        Thu, 28 Aug 2025 05:45:54 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe91744c66sm733090166b.88.2025.08.28.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:45:53 -0700 (PDT)
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
Subject: [PATCH v4 3/3] arm64: defconfig: Enable BCM2712 on-chip pin controller driver
Date: Thu, 28 Aug 2025 14:47:40 +0200
Message-ID: <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756372805.git.andrea.porta@suse.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
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
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..d4c3853d885d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -592,6 +592,8 @@ CONFIG_SPI_TEGRA114=m
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PINCTRL_BRCMSTB=y
+CONFIG_PINCTRL_BCM2712=y
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
-- 
2.35.3


