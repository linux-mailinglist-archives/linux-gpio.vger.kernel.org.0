Return-Path: <linux-gpio+bounces-10132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11F97947E
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 04:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 483E3B22D86
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 02:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20BC101EE;
	Sun, 15 Sep 2024 02:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="SandgtTN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E82CA6
	for <linux-gpio@vger.kernel.org>; Sun, 15 Sep 2024 02:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726368242; cv=none; b=ki+A0KvbKOGiTfw/X1DnPn/tfNVrdBmIs3UPXAWQ99Kz3fe4h6AV4dyq3VwwO4iKmWIj35TMcRCdSpK1Udc3SWsPiSZVN3pGWC067OFUkTQzqUs2Lnh5wzBa7zcEiNpV0LsoAghiNKhDdklyG0C+HGx8/WYaG90RkKC91Pdh8sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726368242; c=relaxed/simple;
	bh=HfD283oA9J+y4Ws1aDfqcKBEJxdpADZfKLsu878/aS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZWf9SLjqzcBprB+sowADwLoEn+Cig3+bIn4kwLQDGq9QPcspFYzm5EYNaRo0s/3mGUw8ueKljstpjDEvWoRd8ESK8gFWO7HDO2JRssQcwhRpfRm+TzjRBVTE2x3vPswXxxav9NgnXkUBWufZDR2mkSvi+u664oWUhQ65L6WfXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=SandgtTN; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d3f4218081so31363817b3.1
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 19:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368239; x=1726973039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q35mWPAy5chjBGIgQ12zyoacjaj9qPPf+2nGjCp33vM=;
        b=SandgtTNA8Vu8cFQ1HedHYIPqt6PCK60HVE5492CiNrxs2gU8z7hSKh1cqcY5snV8s
         h2viGKPuk4+Y2/L/7Oay2AwjoZ0QzaP+mqd5R9RIWTjMJvcapKV3VwqSf6RrTYUtY52k
         /sZfJLslkkeoYYqJHGjmhrs5HLDjZFTjs8C7Ra92tQm6FjL5MQT1/nPqQWh9r7w6s2FV
         fHpwKUwSx5XLrAHghDKrWlLGIyLb66osQYlMHBWUQc+Mn26B0vF5aAtMsJJIN5Vf+a3F
         e7GSvNw1GPGaocQ0M7fahCre5Ugxl2mv8+BNobv0dxRP0oA/TAqm4+SA9T7+DdkK+FYG
         Mm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368239; x=1726973039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q35mWPAy5chjBGIgQ12zyoacjaj9qPPf+2nGjCp33vM=;
        b=N2/bbDv1xSItwjGI3r/LG/o7Q7tJNOOU1uR+KY9ZHr3GFu7PfrAG4clUsti8/Uucl1
         MMeRu0bu1U61hR17y0/A+VSHMGfRXgI9KVKzX6XYXibiJhPIOPtGrAqD0mTN8i1l3sBh
         tGQzyO9gu/qiZKfSx/Ia9144L7cy0H+Qbp37wnG49yffOsUHRavSBbjRjlp3Lbr5h81l
         Laa1PRrUg07rROhT0GrXXNQB/yx9OgRdEzrCfyResasecHvtRUGLdarMWhbPylXjS8FT
         nmIVJKRvWRmZR7iiO6e8mnG8JzGYcjMLIqNDTRncEZu7+ud6w3yxyuoDgMdp56ex1oqO
         WcbA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7q1blXjRUJCeI/qyCSRKOo0HkcTcyypYIfzezJ/Vq8azkh6TwtCtAnd6jdNabcm6xKhsqzcR+2rp@vger.kernel.org
X-Gm-Message-State: AOJu0YzIpPjfS1Xc2rZ1u3GmrHq0pru+vR6aVnjUls7aOirzLk7p/gXe
	JMhPVetifSknYIt0jOnXAvEyHAElWon+bbbf6e8Hqsiy9OC+XORfWMzfxkEVU6c=
X-Google-Smtp-Source: AGHT+IHbfE86FpqgLsLA2mWbe3GEJAIVOslJn/4hA8axLKg+UUrOPeCOEEOUG68yn+6Frv8Na+Js4g==
X-Received: by 2002:a05:690c:113:b0:6bd:8b0a:98e8 with SMTP id 00721157ae682-6dbb6b390f7mr106869937b3.24.1726368239202;
        Sat, 14 Sep 2024 19:43:59 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:43:58 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:55 -0700
Subject: [PATCH v2 7/8] riscv: dts: thead: Add TH1520 pinctrl settings for
 UART0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-th1520-pinctrl-v2-7-3ba67dde882c@tenstorrent.com>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
In-Reply-To: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add pinctrl settings for UART0 used as the default debug console on
both the Lichee Pi 4A and BeagleV Ahead boards.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 26 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 26 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index c48f6fd6387b..c5356f674f85 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -82,6 +82,32 @@ &sdio0 {
 	status = "okay";
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 0ae2c20d5641..932838c55f90 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -29,6 +29,32 @@ chosen {
 	};
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };

-- 
2.34.1


