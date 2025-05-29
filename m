Return-Path: <linux-gpio+bounces-20741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28555AC7E04
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 14:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDBF41717EB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 12:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3FF22DF8A;
	Thu, 29 May 2025 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MJm+XqXn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C68A22C328
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522568; cv=none; b=onYyW5fLMeIdb4PrBHKAGm8juCDjIQb8H6GcxTdxA7fgPcF5Wk1B+iFNEAcDsOXtXlZDjDlxCVUKx1GBqjtlQciOZjRI6PXEpcNl5Ci3O4jzPVFeg2/umrEQnRYKExhQtHFfpaBTPIhIn5DT8x8gb/J8IuNZHHyDeHzWxrMRafo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522568; c=relaxed/simple;
	bh=tcS1OdtYYeMI7g/XHAbOHs513PqKnIFqXgFxXuW43MM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilpoMB3I6LRthixGVtJOyItfOP4XLLekoCtjbvIrvSwt00ZHJEEKgrwlyRhNl3YIof9I8mkl1ea2goVxq6eJ1o6P65J3NCkt1gz+soJCMydHlSAbKjmxz2GiE7t/HYTf4zWou9ZdxAOgyomSyI3VzhtzTp9WptEf9o5Choq79RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MJm+XqXn; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-602346b1997so1357982a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522563; x=1749127363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=MJm+XqXn2SyFbhWOOfRlY6rtFiPKE9l8yoJuCRLLfqttrCiYBF7Tg5bvVqctcGTyJn
         TZ4uqQgb2pE+zeRrbrWUao33MZO6VAaN4PRyy3H+7jJavM8dpCm+pj1+uXRvLWo1RG/G
         /ZYytdEgGqL3y031XIbXX71SQSMYESCYk2bctOu00fBjX+RrZw65R8aXE40DfQWsOIyd
         06oXjNuOupKdh8NRkUwbLZnUiTbnp5I0dJ2N/3UeUDutJWX16H0ne0kZL8aqiD7b2pCM
         ofGUUVvqnln+agexJ7nLyRZwi7IVoFHVOPRcu99W20gbS121VxMw8r1N8eHcIygpKRKM
         w+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522563; x=1749127363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=LlaAeL0YB5iHLuVLPFYJOgd13tXpSTfACk72zYvJ9c4GrUgTKKBfvWrRW26Yr4RL1R
         WzboXrHYeaR9qvdgNA3bk3bwRC5b6qPx07xeOGUPaNRAQFBk/dhFBIKV/ZWCZza9XUoI
         UTMUqUSPcUqa0cD872H3JTfgOZbUKh7NOI8VfzTze1wB8rL9YBxErtwr0Ouq+2kfv9aN
         +/hOpE6BmvfP2+lLQ/NQ5sPlwrM+xqBBF1b4jtmm25GC6QJcMn/eGtb1fnez+Jibv7ZS
         /NJXS1SrmQ+RD8bXkdTXVbESDY6xtbvAuKiX6Sp+WhAb34SFYQVe0+Y2SmQI/ni+mGPm
         Rt1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBXzAVu8nvGXMW52nLFIIPwzyDnMF1ahhzRbBUgdkL1iw7vb+dsmi18OkYoD6YYK/Lj5uWGxCWjRgn@vger.kernel.org
X-Gm-Message-State: AOJu0YzORdbvOB5GFh7osJY+b3+GzR0n+8pAcWQeFaoVePbqXEHiXH8J
	lVY8OL3+3rdrQ2QrBH4KEiHHH0v0D4NBIUP1OMmu/nLYX94SGH1/gnHlZDrDOV0uqso=
X-Gm-Gg: ASbGncvoHbBQSQu+u0nMHE3nqan72gbBCGCeoc3hcCpU6Wbgfxj+Zs8fmfCIAKgX6+S
	K+ffBP3m1eK0AGkD4MQfbtrQxkCpI4sqAKyQwyVhq2IL1ndIuZUDL9RceR11QbT8hKYT3IwQ2Bi
	b1Q5hQNLdjUaojtPT0xCzLsyN+jlOxPizD99YkiOZRvQId7MlqxRVZWImHxV3//0b4GIgsfomR1
	0ZjfVkMeF0JKYaF2N55iPQJ2/BtI4qzeB1MBM2ymYca7ii3q9eOsViIjboka8qvR/7BzhNE5geC
	2fdDY4VbwKM+NFaii4/G+c9rC8tiGgrQOA/JyutWypLcrtKqB2K3yEtkyB3vhyCXClw2gjJMj47
	bc/N0WjMxkAuohjVOBLVfMQ==
X-Google-Smtp-Source: AGHT+IHryfaMX1R4GUnBG1aUg7/5bkW4Kn1TXAXHNfS5nQo87GficabaeaZc6nwlybjG0MJv0P5uAg==
X-Received: by 2002:a17:907:3e13:b0:ad8:9257:5737 with SMTP id a640c23a62f3a-ad89257592bmr966243466b.25.1748522562865;
        Thu, 29 May 2025 05:42:42 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39409sm137309066b.148.2025.05.29.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:42 -0700 (PDT)
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
Subject: [PATCH v11 11/13] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 14:44:00 +0200
Message-ID: <20250529124412.26311-6-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..f6e9bb2a3578 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -620,6 +620,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -702,6 +703,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1299,6 +1301,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3


