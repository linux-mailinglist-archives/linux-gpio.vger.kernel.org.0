Return-Path: <linux-gpio+bounces-7336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1858902FC6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 07:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89131C230F6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 05:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5AF170859;
	Tue, 11 Jun 2024 05:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szioNOFz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72B763C;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718082660; cv=none; b=jmcxGIA8UMyvpPNiqfn1WCQgv6o1SIpwB/vL6e+z8H10ssvG5mt0Ma2M2oAgzPgjOZdRuchANchaYA35tyKkqK7SePZ/gqReTEPbDZOG3WfDkIB3DXCE5cqTiM2qlw1I6wWVOWJgJH5xio7wmB0SnboF8iBg6ufBMEAHA2dUz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718082660; c=relaxed/simple;
	bh=fNglPpq1OR578DdMVdAmSf59MmLIadxgL7Jtj0YqXm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgSlgzVYCkYsYbQjdQs/zFYTh881syiaIuET/lnw/UndqLMMvR9RnZ/K199nD7Yow0oiaLfOnbhjZbLjxLbJqeEtpPMN19mfD1ziBIjwkObqyi2dvITCkDqkqpxhbYCHqVku5fvCDZbdwwlkLtKVdpVBfrF+AiQiBcpiPDR8v/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szioNOFz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 781D1C4AF51;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718082660;
	bh=fNglPpq1OR578DdMVdAmSf59MmLIadxgL7Jtj0YqXm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=szioNOFzEU16gF2REnhbCPQsvmebHMEDMhgN7l7rcDdPIi3BWJnTZc46OdZoUOMgz
	 uxCw/oYU3bLzKNaBoo0JkUBO+qMr9Ma64tLaP+UXQhxNUtK3ESBd4xgIquAREdF7eF
	 sJrM+by1SsnF+xLRSvPb9Bd5uofiF0xeyQ5ub2+EBoZnSl1XoygdpKnZunDpACL58V
	 cjMgC+TvO/yxTHYNv/8qVCsxKJPlwoMSckc21vJlwHneXMJWpBzVtf4/T5xT1dxfzM
	 pdpiI6waVMe3ANqi1rCpsy/aqE0eY9S+y8+AczpVm4wbZ5ca+5l8K8aZ7D1LhM+QTP
	 Y80tJnWgau/0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63950C25B76;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 11 Jun 2024 13:10:59 +0800
Subject: [PATCH 3/3] arm64: dts: amlogic: a4: add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-a4_pinctrl-v1-3-dc487b1977b3@amlogic.com>
References: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
In-Reply-To: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718082658; l=1392;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dK1sBro4y44HxdZ7xq97Zu8WXKXsyY0hjnlhV/Rfko0=;
 b=fPWr6+NYpqH9T8KWCXZZwBxdMkk0QoKEll2gzJAqwC8lX8rYr4earPV3u9ulD3JKWLmCCM0Er
 J/t1A1E3N49DhS0Sn5+Kwlpv/+j4TTt7DWisWrT3bHqlHN9cgK+8iQa
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..5d858bb93eb7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -47,4 +47,40 @@ pwrc: power-controller {
 			#power-domain-cells = <1>;
 		};
 	};
+
+	soc {
+		aobus_pinctrl: pinctrl@fe08e700 {
+			compatible = "amlogic,a4-aobus-pinctrl";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			ao_gpio: bank@fe08e700 {
+				reg = <0x0 0xfe08e700 0x0 0x04>,
+				      <0x0 0xfe08e704 0x0 0x60>;
+				reg-names = "mux", "gpio";
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&aobus_pinctrl 0 0 8>;
+			};
+		};
+	};
+};
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,a4-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio: bank@4000 {
+			reg = <0x0 0x4000 0x0 0x0050>,
+			      <0x0 0x40c0 0x0 0x0220>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 0 73>;
+		};
+	};
 };

-- 
2.37.1



