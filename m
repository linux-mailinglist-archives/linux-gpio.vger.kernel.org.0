Return-Path: <linux-gpio+bounces-15596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B501A2CFBB
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 22:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425E17A225B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117871D8E12;
	Fri,  7 Feb 2025 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rx+qiwG5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9022F173
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 21:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963875; cv=none; b=sDt1hKALG0LlYL3jB/NBay10aIx7v28D0u/ZTnq5bwt48AE9+x3Nj6Lrqvwn62wXZep21dxmYMakSl9wD86pI5z7DJvJLhp3YEBwsu1zqTBCYFV6lZcT1DtGdKady8fcp5zJLbltuxl9iVdH8Is6fA2CzJ8PM5hKzLo+pPxlBNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963875; c=relaxed/simple;
	bh=5diM764rlIrZ33bn0o7GEofG1BlmyM+xQV0fM6MfU5s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uiz1u41TgZ7aOiegtMsVijVVHSQkXAF2scaUNsVkt1leu3uqXH1/OyBgvuxTnaAd531MS2lAva1MqUjrt5wzGsMn5oWON+h7k5L2Kx9rhz53ZjIZQ2jH+1DrVhMWtb1DGBcoXFnR45Jz00fvatYHXF0vZzkxm5HAgxPM/cb8jrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rx+qiwG5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab79de014b6so27824166b.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 13:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963871; x=1739568671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BopDih7yHOpwj2R0KkzxFkHGfVydC8fjj8lntQcg48=;
        b=Rx+qiwG5aW2JUWXPgHmm6QUqupktcHrf/QTNSpoAR2oYEwiA8hjBzndbhKx/znYEhp
         pSJPvLMiqtyNhuXZL90dr6S8Q1lYhNpBxYMVQMTY2GZ3Xn73ETKqH88/Rq6qFnM/c4ll
         lWQNkJk/0oT8KQSlQ3mhuJyS+LJB0SwwfUVbXxipQat8RdDXRc7oIubD8M7RCNve/G2e
         vn8X6jdRZob/MgVM5+2F2r8/H0CRn9z2phFNgk7H0DlE6hNwh4lBEkzcMwLkBqI9yjMq
         Rx6BsUum+FFU6KKx6qJJ26oFp4zVcbi4Vb9Myd94D6o13lLxYU4wldsqChXEK4aErGwK
         SN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963871; x=1739568671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BopDih7yHOpwj2R0KkzxFkHGfVydC8fjj8lntQcg48=;
        b=Z7NNjz3QBW8nCZfRLjbAV19EWNpteCxUiokjWX33luSlFjbel+N2XPhF6zOCORImnz
         82pQfs9OX3Hr7BEECjY5IMTkBCvSrtbuM0SUU6DLW+ijkvM7UlKRlpqrwTSPimSpK/ur
         HEzGEtDBvHcidhxibeHa5ry43OO2RVvLdtO8Vn3GvFAZpXlFEx/BPSmzN8YVmv5Fe95g
         1Xeovg6yxzV+XjEXTJM4YEC2Br7YV0FeU57IfBrnVtTMe2CohudqT0Cp0jlzFbiNVV5/
         nrpKNuvCIHio5pdt9IIkIVkAOmAwU8oSRFCwvrZvtK7P0Uom0Uin6QA7Etp3TOJCAp7H
         MrEA==
X-Forwarded-Encrypted: i=1; AJvYcCXTq7Ki5KAHgF9maI9v5d9BlsH7SKos1s5jBnG9Hx7T4GPPvDmwiJcdlujjDBae1AxCGlRY+19Uv2fa@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0NtV98aAjMeRx7htSfnXvYl2a8uaidkhNNAcyea1Oa8frb4/
	BiXxAufbbc3MkgOwjmB9Nq1V+ulecl+R76BXPZi3be2Lud+Lh9BfIckdvw4GERQ=
X-Gm-Gg: ASbGncsTBPIN33ItMMKU+tN74Z3GRPL6XNcQzG2ev7O+Z2updi3oEWjtD1cg47ceTZn
	Hedld1uHB8aTmqqU7XSRdySzFalA0AeLSZWdZylD2S6F1zKQQ9RZ1sKUDEgQWhUFzBLuA+JamVV
	kVPBvGAcpC7QdqGD/r7dNeW2lM1YYJ4Kcuu6CfUhvv42GWqOwuNNIiR2dMSgTW6Vndlj1CPoAkG
	yFcA8DPHAWBw3Ws/rfa3fNU/g1s5kkqnR9XfIzi0Fqy34qJAQmXQx3DPQHSlLvtYNYiF4VWR1qb
	FeSgmcVQpFWK+rxcAWkAXQvhxuUTMjh517il9wI988lbOFWa30jt8/E+ZAs=
X-Google-Smtp-Source: AGHT+IGwqrzJl2/ax1uP9MqR28vcjX4PkKe1oIs/IEEQv3qf1oee6es3/KbGoTL6JWHdxGwK20xnJw==
X-Received: by 2002:a17:907:c285:b0:ab6:ef94:6054 with SMTP id a640c23a62f3a-ab789b2886fmr568618966b.33.1738963870964;
        Fri, 07 Feb 2025 13:31:10 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77365fc7dsm330339066b.182.2025.02.07.13.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:10 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 11/11] arm64: defconfig: Enable OF_OVERLAY option
Date: Fri,  7 Feb 2025 22:31:51 +0100
Message-ID: <49da5d0cf961fef23a1622253825443eb51d660d.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is *OPTIONAL* since I'm not sure if OF_OVERLAY is a desirable
feature to have enabled by default. It would be advisable to have it included
so that 'make defconfig' can produce a kernel config that will work out
of the box on Rpi5, otherwise OF_OVERLAY has to be enabled separately.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cc70793e97ef..ca492fbd2773 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1643,6 +1643,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


