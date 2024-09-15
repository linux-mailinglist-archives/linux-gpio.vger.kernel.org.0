Return-Path: <linux-gpio+bounces-10156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4326979745
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 16:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04EB21C20C44
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 14:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515261C6F64;
	Sun, 15 Sep 2024 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkOU3+Xv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DDC2CA6;
	Sun, 15 Sep 2024 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726411556; cv=none; b=b3ah0vGCzXQEUgfB64AgYQJg2CvvpSo5ejwsADO/e2eYoMBE0+umjoIWN23Z6m3V5mGwK3EbTJXsaZf5gzLv5KVQLN+CYApJfKFKXOl0/GZ2vxp0nc4Y62Ed/bCM2jypYY595uw5Td3+ZL71+wG55GjadfCEL0/Yy2Ol/mcsVK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726411556; c=relaxed/simple;
	bh=XKlqn2qBPAQwB7FQy33H3UzWfqVd/zCG6tFfCMV4LuI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=JDbpm40DSOQyyGxqNUKtZPFJrSHl+L1VDXaKuOfFp9h1Ahknhx9jM3ea6pEvX+1aK0yh83PJe+Nqipb861VNQ5V3R9mT6U7VPe0nKyhB4ygpvz071JL1sPvXWO1ELQuMpJGpFpizWx15WbL4RmfLKSZNJi+QZ/QeCU/JmYVS58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkOU3+Xv; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6c358b72615so34387376d6.0;
        Sun, 15 Sep 2024 07:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726411553; x=1727016353; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:reply-to:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaNRwlrs/nOlui6L6+29frsiLzSV0vI5EdNksEn8QUY=;
        b=VkOU3+XvH4HfZhYIwb9L/6FBTnjvQtOuJE3tvFPT1n19zuSwsoFeSuLM+z83euhCiG
         fozIzeP71vKS/0yO0E52vuMncOtvHqpFLX0UloVAMG7CmaN4+avvs2BzhHCvl3sLKr/G
         AM8iJ+2DPOYVK8rRGTtgzH3QU4GGos6DwJBXmZ+y4u8J7THcUHm7BDpc4czIdDKjAFiK
         Vwr+VeSATt5FXXv98M7/Pwc3JcVmYjib4McsvUbiiBEFIjr0+5X9HZlSIM5IIYeEIpBu
         wcM1rxulIcqegzRCq7DcCYHkODuXm2ylo1F09OUl+tMM2sChA3MFb8UZuqCs85sNd4e3
         0TNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726411553; x=1727016353;
        h=content-transfer-encoding:subject:from:reply-to:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TaNRwlrs/nOlui6L6+29frsiLzSV0vI5EdNksEn8QUY=;
        b=wQ696I3PJWhhe0jcTnFDgGdcnr+z3kR37vW92JSZxHtfq19IcCNZHAhc9tUoQMiQeh
         PQK9DCL/MUCPq7MZEowLjpNEcUQLakycKMduR8JvHRor6UInMgIthoDelH8qbWLViqzX
         2SMAq+6kjEhIm+Q16jsMt6SfN9DVZDf9TKoO0awh1TfKHvVH2j+jF4v2POZvgx9rSk02
         uDzuzzHltcOfRLVpXQmv+u//X2d9pIysgEUaYCpnLLlQrgyrGTC/pPIU/mf9/Kz/rO92
         wL1qLShOx+M3JJgNzjasCEX1pVPp60xMZxGuxooD6adiZ5iczILp7+TJiRm6kixv0l/o
         99FA==
X-Forwarded-Encrypted: i=1; AJvYcCUxAigwSc9XWHpUeGXudRTrLvzqiWmBOPLh0cO4bMvk5qehsDRW8fYoKZg2a0PILJwCHTaqDrpU3TtJ@vger.kernel.org, AJvYcCVtK1DBVCugJkiVQpFyIpJQtKOjeL94bPmwNo+DtLYNRd2XopbVCnTyiBvtneb+g+IIJurVFDjHXmGIDCUN@vger.kernel.org, AJvYcCXw17ha5YaFycEu4KT0rIc2sOwMdoSS21TbHsTV6Sc9A/MD5Ge6A55FY5KmnUha4u84r6jagsjpPniSCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBWZmZRjrgRkwcvbFRBrZua6z9ANY0wrzRsQMgjNfSU0oI2HL
	eJyzEhcEu9aIUrRS5I1tb0DFT01Iarc7g+asY1Bdc5W9iABMpX82
X-Google-Smtp-Source: AGHT+IF0Ccu/apzaKszAgwuDU09i5bpQP/2PO0Ybjid8wUTXxRNJ0MJtie4khQMTSISV2Fa8X/CfoA==
X-Received: by 2002:a05:6214:468a:b0:6c3:5db2:d999 with SMTP id 6a1803df08f44-6c573556d57mr178765296d6.9.1726411552883;
        Sun, 15 Sep 2024 07:45:52 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c626346sm16073526d6.29.2024.09.15.07.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2024 07:45:52 -0700 (PDT)
Message-ID: <7ede7ca6-f8db-4b38-a1cc-8be3d0db7fae@gmail.com>
Date: Sun, 15 Sep 2024 10:45:51 -0400
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Yixun Lan <dlan@gentoo.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>,
 Meng Zhang <zhangmeng.kevin@spacemit.com>, Meng Zhang
 <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Reply-To: 20240903-02-k1-pinctrl-v4-3-d76c00a33b2b@gentoo.org
From: Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v4 3/3] riscv: dts: spacemit: add pinctrl property to uart0 in
 BPI-F3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Before pinctrl driver implemented, the uart0 controller reply on
bootloader for setting correct pin mux and configurations.

Now, let's add pinctrl property to uart0 of Bananapi-F3 board.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  3 +++
  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
  arch/riscv/boot/dts/spacemit/k1.dtsi            |  5 +++++
  3 files changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts 
b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 023274189b492..bc88d4de25a62 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -4,6 +4,7 @@
   */

  #include "k1.dtsi"
+#include "k1-pinctrl.dtsi"

  / {
  	model = "Banana Pi BPI-F3";
@@ -15,5 +16,7 @@ chosen {
  };

  &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
  	status = "okay";
  };
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi 
b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
new file mode 100644
index 0000000000000..a8eac5517f857
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K1_PADCONF(pin, func) (((pin) << 16) | (func))

It would be nice to have a pinfunc header like
arch/arm/boot/dts/nxp/imx/imx7ulp-pinfunc.h.
It would reference and encode the data of "3.2 Pin Multiplex" in
https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned 
, the document you attached in the summary.

Otherwise,
Acked-by: Jesse Taube <Mr.Bossman075@gmail.com>

+
+&pinctrl {
+	uart0_2_cfg: uart0-2-cfg {
+		uart0-2-pins {
+			pinmux = <K1_PADCONF(68, 2)>,
+				 <K1_PADCONF(69, 2)>;
+
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi 
b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 0777bf9e01183..a2d5f7d4a942a 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -416,6 +416,11 @@ uart9: serial@d4017800 {
  			status = "disabled";
  		};

+		pinctrl: pinctrl@d401e000 {
+			compatible = "spacemit,k1-pinctrl";
+			reg = <0x0 0xd401e000 0x0 0x400>;
+		};
+
  		plic: interrupt-controller@e0000000 {
  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
  			reg = <0x0 0xe0000000 0x0 0x4000000>;

-- 
2.45.2

