Return-Path: <linux-gpio+bounces-20726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ED2AC7CDB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 636144E1B30
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 11:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C3B290BD4;
	Thu, 29 May 2025 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OLltV4hv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EB328FFD2
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517754; cv=none; b=WdLxP9bZOTe7BJn7AfJhiYWPs8sGv8DKzTJbmL0X//QBkr/kF7U5LTDYcIgRYWuN8ZVMJjmvpHnWnT019RctIpBJmrz7DBeDyzBdgo8JX+nEVGgZCxKphVKAnocn4WGQq2+gvghgQvIMk6xslaBF1dZ1eXTFYEmpQJ9SrIEJn68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517754; c=relaxed/simple;
	bh=RRM404hdZVflbCbuZ7OBxFTgWWaneCmtEfkgg/Xp1Lk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM4pZhlSIFkipFEDVEaBof+lXQ8MiYGoyYRhVJj6MRKh+PxRh6q3SmNbZT04plIeMIjDew4GY4HdIfpsLAO0KV9pyjIHGnQ8dYYEOo41FuIhmMri/5Vyr1xWfwQbhhdx9qvpn3NttjrdfxC0oLyEnNUmWnTlKODTUshLLJVnzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OLltV4hv; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-604b9c53f6fso1485710a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517749; x=1749122549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=OLltV4hvknXuVnFrkc6OH76sfwxPheNSSKO9WAhv27oqOhYFwUZ0fcYM66jggE2qMb
         dhSXD3dUgnLcRpgTpYpFfB5ARgsWeO7ugUXeq4KRD8tYPpwiQo2mqjgsETUTGiCCTelo
         5Y36I2RBrVZlDsgMVsIqHPeACpL2yNrvJf4qjzjBtdTT8SZ7KMgHAhZiOx5qDGz/JO79
         hY9tqzJOeeUAqDHqmO7+TF3csmABHyZIlPFdiIwGV1PaTxcQsOw4FirU7rFZDDcMeYPn
         ascXf/f7bhNLfZgURyCuD8xjfMCdBeP47c/S8+6+ftGVf8uLjiu5knFrN0IEl+LsayBH
         DV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517749; x=1749122549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=oQgEwWjJ66dOPfbeoJsL6Ym34Zv9/JZDshc41Br73myKYLqte3+aLBGX5irRT5us1j
         4wuTcQTANjwjKfV3PNNtcM9KoW612NwKiQtEi23PJTfTkSLA9MaLSrzlmyIJsRJqGa0T
         hsd6JSJ1ZAU70HuofsBOZUxEshOQrJPs/eLxVfJZMT5NEgfLPhJHIILWnXngJOVXfMAQ
         /Q4qLjQWn/h0mxCWhuF7jCW+t5rvubR//PCmob3WCaA3H7zzm3kyxmTaCEKyHzdBepiG
         UQsM2/QpjzXHEMgLGORdDk9Qm5O0lsmLPg8eT8UUVk9KqeHhkerI309RPM7Na52wmFWS
         naZg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Z9QjZ1Cd4FI6cVkPj6nP0p5F5OWubOCr1T0+mI7q82LU3TQPZm+2AxGFL3yPlH+BjVZ7/HIjPrMl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6NCHFioEgnwQEvXBJtu3QkmAGEkiGrJq3kU6s93ld0X1IZJxD
	260r1NHOOGrFmcDXePNSyD9yvPF/xMThC3Uhq7EkbVWH6QaPVI7PAp0D3Y1FGRBJ1eA=
X-Gm-Gg: ASbGnct1fmLDaCiY5eChq/uyjQsS+9hWZ+x14OSxVhdn5DmxIV7pKg3+xLpaS6fzUSu
	cpgVsItAfPxi0dGm/s3SB60UFDvCF3YT3XzF21v0Cn46KvantL9u+1AsUauTJr1tWh5OYvTwgLz
	mXPzcxNEDbqSFs/nJ3+oojW7Chb6K/kf4N1qVucBfYSrJbrbSF8I1+euGL+66j06NgJ4/pgBOoE
	tijV869D5WLIMNABsMXf/1tbiR+nQUDyhiqV80qX+n1Zo+7o+LUMh8IE4m/fBgG31x0TBzaBzG3
	ISvkvP7mhLP8+FK19FfJ5sbGLIaiovjqsF2XyLtD2nnidXctol4QqCf2NRL5Hr7qchexlZRdhpF
	lGbP5GeBfVKiZQKcjK2YoDjQgpimO7ooo
X-Google-Smtp-Source: AGHT+IGIHEB4AcuERSFwVfLZXlxZybEzRkofnOTwqfs80hqrEJ33hE4h3yIsIdTYmxCJoTKFbmQFHA==
X-Received: by 2002:a05:6402:90e:b0:601:9531:68b8 with SMTP id 4fb4d7f45d1cf-605460f42f1mr1154010a12.18.1748517749396;
        Thu, 29 May 2025 04:22:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d6091d9sm2291814a12.44.2025.05.29.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:29 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 12/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 13:23:47 +0200
Message-ID: <20250529112357.24182-7-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
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
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6e9bb2a3578..ccf2f50673a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1659,6 +1659,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


