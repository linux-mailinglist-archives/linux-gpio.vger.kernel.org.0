Return-Path: <linux-gpio+bounces-1547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321FC814AAA
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 15:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6568F1C218A6
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 14:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167C736B10;
	Fri, 15 Dec 2023 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="JveIQFn2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5B7364B2
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 702C73F737
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651154;
	bh=RobAsopvkyaJG4ZlGH6Q+ihyPFqhE+HxeBCHD/K5fRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=JveIQFn2hQtiyEGthTh3fz27PLBh02oceELhU88h2YjgRTXCJYOY0JUZ+vYeU3i3W
	 d8ToUf4a3ADU9cvRYxnL7sp7OnVFU+kdzfBlHhAXj/cLKY+DhCgEklXlR5MiWV1IQG
	 K4OTjk1gGeDQNunql/fABmy0Pt9168sPtJz8DnDnLSium2duC9Ysvaz62cTPyo3uNw
	 qRoCmrbIQLAeRFfO0WNhWAZVi7u1RsihmSVxcBNt8p4vCHJilN+ACd0DdzB/LUd/GQ
	 6wBgNRZ090lYheME1O2MGw6c089o0Cz3wcVzR3C5k9dcd26eJTENBpHPvZFZLb4Kwe
	 ywC/z0ICQJ51Q==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9fffa4c4f28so28484866b.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 06:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651153; x=1703255953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RobAsopvkyaJG4ZlGH6Q+ihyPFqhE+HxeBCHD/K5fRk=;
        b=r+SW/s6AXbJl2LaKRQVswLN3X+SyIs75SqxiHR9mELCITz0oH5qtfM4Dl81o7Oj7xk
         OPdsZl06MSQiehunHQNYUn+KLcnFi+Ve6f38tSWGTzZJ0O1dYCdpFUiLYwmTnIfGoID1
         z2xyQ2eqQrUALRVWBQdqeoWBLN8LFN4e/ZaH3As3ywYeG4Bhoq1cQ5H7UBcxLFl6rUSY
         ZJCDQtm7FL2OE8ZtKFGh1ZAxyJnOlUh8UJTQF1zwMgnDVaX4xB5uPePDx5+96y7NskEI
         5uxgTm3Pk5WiKmTsyZP470FMT7KoZy4Juf36e5/fcqQerSVgkyRghWXGb75Q3+Tqew7d
         83yA==
X-Gm-Message-State: AOJu0YxJ787VdGJq0+0CAZJqZzleuf202anNeBW7m4rhHVGJkG3gk7Sg
	H2C1/4lnKsUo6sUVbisGjHrgZnbp/mzGhTFmfXV8O+lYjZApIC46+EdPVaFU7Zqk1TYrwpECCmZ
	tjgFtRGehSEaQSSMFKtYUGKwkPpSbfsp8ebo7HEifavt3nhI=
X-Received: by 2002:a17:907:9714:b0:a04:bc39:c1c7 with SMTP id jg20-20020a170907971400b00a04bc39c1c7mr8341368ejc.36.1702651153752;
        Fri, 15 Dec 2023 06:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMJ/XNk1OcnlxBlTONG8qxR+NbDMfjb9FP+RE/bMN9YTONgYiMhiDoaYwky2i3vk37hslVhA==
X-Received: by 2002:a17:907:9714:b0:a04:bc39:c1c7 with SMTP id jg20-20020a170907971400b00a04bc39c1c7mr8341347ejc.36.1702651153594;
        Fri, 15 Dec 2023 06:39:13 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:13 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v1 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Date: Fri, 15 Dec 2023 15:39:01 +0100
Message-Id: <20231215143906.3651122-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ba4d2c673ac8..397d5c71bd3d 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -242,6 +242,11 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-group2-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -278,6 +283,11 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-group3-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -414,6 +424,11 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-group1-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;
-- 
2.40.1


