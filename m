Return-Path: <linux-gpio+bounces-36351-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qELeCTpO/GlOOAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36351-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:32:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 796EF4E4E10
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D03A30D270F
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB25939FCCF;
	Thu,  7 May 2026 08:18:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D229E348866;
	Thu,  7 May 2026 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141923; cv=none; b=ugXs0+Lm2TD1jNXEte+iZ/OusuwfxiQ69tGhIbFegw54XQU3ewnMFfHHWgIMy3BVg74KIpPjgHAFOZIOXOiAFkZGG6ZWGU9SkCxTmi+F7UJwZ23gnVcyedpGF6XDZ9BLSSoh3I2KQYpRdAwn8p7MgWkdex4EpBra4+XfR6GqJMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141923; c=relaxed/simple;
	bh=wMzmNZg95BxbGTIz5RYpu491I9FBjbAvU8UtBhit6qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJorYV0tm6mnWpEhgJWkGA/vo/gG4XXW6g53EVb01hQlXPMHDPcDbXyIQ1bBX4nUMdqzKtbWrOfHIVR6R/K8Nk22IRJyhy/Ht1aWCRZkyawSJ0X3UaI5rSb3VXkrjWmdy8RDjcGc2bVDt8TxZnEOG1zCn6UlQkfKzUfeEdz/hdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S13;
	Thu, 07 May 2026 16:17:40 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 11/12] riscv: dts: thead: Add Lichee Pi 4A IO expansions
Date: Thu,  7 May 2026 16:17:09 +0800
Message-ID: <20260507081710.4090814-12-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3m+KLSvxpI_pNEA--.42168S13
X-Coremail-Antispam: 1UD129KBjvJXoWxXw13Xr4rAF4xCFyrGF13XFb_yoW5uF1Dpa
	1IgrZ5t34kCrW7u34Yvr109F1rWF4kJF95KwsrCF1Iv3yFgFWvq340q3WfuF1DXrWrWw43
	Zrs3GF92kF1qvwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pRQJ5wUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Queue-Id: 796EF4E4E10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36351-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org,canonical.com,iscas.ac.cn];
	NEURAL_HAM(-0.00)[-0.956];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Lichee Pi 4A has 3 I2C IO expansion chips onboard, connected to the
I2C0/1/3 busses.

Add device tree nodes for them.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[Icenowy: added commit description]
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 4198dbf953f06..354f3893aa8cf 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -16,6 +16,9 @@ aliases {
 		gpio3 = &gpio3;
 		gpio4 = &gpio4;
 		gpio5 = &aogpio;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c3 = &i2c3;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -110,6 +113,76 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	status = "okay";
+
+	ioexp1: gpio@18 {
+		compatible = "nxp,pca9557";
+		reg = <0x18>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "cam0_dvdd12",
+				  "cam0_avdd28",
+				  "cam0_dovdd18";
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	status = "okay";
+
+	ioexp2: gpio@18 {
+		compatible = "nxp,pca9557";
+		reg = <0x18>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "",
+				  "cam0_reset",
+				  "cam1_reset",
+				  "cam2_reset",
+				  "wl_host_wake",
+				  "bt_resetn",
+				  "",
+				  "bt_host_wake";
+	};
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	status = "okay";
+
+	ioexp3: gpio@18 {
+		compatible = "nxp,pca9557";
+		reg = <0x18>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "tp0_rst",
+				  "",
+				  "",
+				  "vcc5v_usb",
+				  "vdd28_tp0",
+				  "vdd33_lcd0",
+				  "vdd18_lcd0",
+				  "lcd0_reset";
+	};
+};
+
 &padctrl0_apsys {
 	fan_pins: fan-0 {
 		pwm1-pins {
@@ -123,6 +196,18 @@ pwm1-pins {
 		};
 	};
 
+	i2c3_pins: i2c3-0 {
+		i2c-pins {
+			pins = "I2C3_SCL", "I2C3_SDA";
+			function = "i2c";
+			bias-disable; /* external pull-up */
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pins = "UART0_TXD";
@@ -146,6 +231,32 @@ rx-pins {
 	};
 };
 
+&padctrl1_apsys {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pins = "I2C0_SCL", "I2C0_SDA";
+			function = "i2c";
+			bias-disable; /* external pull-up */
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c1_pins: i2c1-0 {
+		i2c-pins {
+			pins = "I2C1_SCL", "I2C1_SDA";
+			function = "i2c";
+			bias-disable; /* external pull-up */
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.52.0


