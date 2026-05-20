Return-Path: <linux-gpio+bounces-37187-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO4vMv58DWoTyAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37187-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:21:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6043458AA07
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0604F305A8D5
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923603D092E;
	Wed, 20 May 2026 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="KCHYRv4z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B7F3CF665;
	Wed, 20 May 2026 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266436; cv=none; b=bsW93LbzpBcmtQ/04/k4NUGrW/MPJIu5Ru7f467Fr/zA39AsqjAP3zPHeBWbaIny5nU2UdWsnH5wSbD8/BioBq+QV8uyQKw9DY/ik+kmafDZscPwruE504RRjkRIe7b5VmUxSbbTUbB5/XnXUX0TFKfuDZgUJ39RxVxpKwK4sjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266436; c=relaxed/simple;
	bh=0YfzwFM4TkbuwWH8IkXdR07nKm5GoPXCKV3UI9DD0Ic=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=mfbasAd5Ru3TiOSTCP4bKg5xFVNM5inQg7x40BtZxoOfj8uhO3jZFqhxw7g8YPdysbNgmPcObXAlZa390DpN8erGPyNlyJhOetYBLKTl0Tyo8m9Vml21zyF/5zKpYggoUxP05l2u6Ed5eW2WeEIqdr5saVsW3rz6vCUewGBnB3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=KCHYRv4z; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=MEvCnrMS2FHdXOn45fiP0INsUQjEFvQ+z
	ETMtLv4Bsc=; b=KCHYRv4zZl/h4oUggXkn+pFpePvTSqmjAGevJSCsAmw58SN7W
	asdo33f8OUJMGmEVfJIjlTFyp1F/cXVeHLtYgaD6eVXVWGiD8pK1HwntH5hdEH2j
	4EotQiO2gwUtOMnzlpMen7QKyuUD4n7pGKqIVlppTbUJRoJIX/LMeyKMMc=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOacw1qCu8EAA--.6803S2;
	Wed, 20 May 2026 16:40:58 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 7/9] riscv: dts: ultrarisc: add Rongda M0 board device
 tree
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260515-frisbee-clench-4029b6dd8169@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
 <20260515-frisbee-clench-4029b6dd8169@wendy>
Date: Wed, 20 May 2026 16:40:17 +0800
Message-Id: <177926641764.943957.18316342442301070235.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779266417; l=5372;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=0YfzwFM4TkbuwWH8IkXdR07nKm5GoPXCKV3UI9DD0Ic=;
 b=SwifmTQo72mWpg5nqGNCxAAX306CBjPWMhjw1/VBtWATJVLAUmB0C57ucVktGk6T7MHlGv/l5
 0Z4YlPJGTyuCAx8bjASS+zgu4V1HJymF4OV04WVGba3wreWPaAWz5E3
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkOacw1qCu8EAA--.6803S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCryUAryxGrW7Kw1ruF47XFb_yoW7Gryrpr
	W7Grs8GF9rXw12k34Sqry5WFnxtF40gFyDuw42ga4UArsxurW8Crs3Kwn5Grn3Xrs8Xr1r
	ur1UuFWxCwn09aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sREPrc3UUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQANEWoL3kQAGQAFs6
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37187-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ultrarisc.com:email,ultrarisc.com:dkim,0.0.0.32:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 6043458AA07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-15 11:28 +0100, Conor Dooley wrote:
> On Fri, May 15, 2026 at 09:18:03AM +0800, Jia Wang wrote:
> > Rongda M0 is an mATX motherboard based on the UltraRISC DP1000 SoC.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  arch/riscv/boot/dts/Makefile                       |   1 +
> >  arch/riscv/boot/dts/ultrarisc/Makefile             |   2 +
> >  .../dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi    |  85 ++++++++++++++++
> >  arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts | 111 +++++++++++++++++++++
> >  4 files changed, 199 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index 69d8751fb17c..702882974251 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -12,3 +12,4 @@ subdir-y += spacemit
> >  subdir-y += starfive
> >  subdir-y += tenstorrent
> >  subdir-y += thead
> > +subdir-y += ultrarisc
> > diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts/ultrarisc/Makefile
> > new file mode 100644
> > index 000000000000..d01a770d3cba
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-rongda-m0.dtb
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> > new file mode 100644
> > index 000000000000..101b416b1079
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> > @@ -0,0 +1,85 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> > + */
> > +
> > +#include "dp1000.dtsi"
> > +
> > +&pmx0 {
> > +	i2c0_pins: i2c0-pins {
> > +		pins = "PA12", "PA13";
> > +		function = "func0";
> 
> This is what I meant about func0 btw, and having this be "i2c" etc instead.

Right, agreed. I will use semantic function names instead.

> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> > new file mode 100644
> > index 000000000000..6f72d60ad55e
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> > @@ -0,0 +1,111 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> > + */
> > +
> > +#include "dp1000-rongda-m0-pinctrl.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model = "Rongda M0 Board";
> > +	compatible = "rongda,m0", "ultrarisc,dp1000";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	gpio-poweroff {
> > +		compatible = "gpio-poweroff";
> > +		gpios = <&gpio_b 0 GPIO_ACTIVE_HIGH>;
> > +		active-delay-ms = <100>;
> > +
> > +		status = "disabled";
> 
> Why bother adding the nodes if they are disabled? What enables them?
> 

Understood. Since the board uses the OpenSBI SRST extension for
reset/poweroff, these GPIO nodes are unused and do not need to appear in
the DTS.

I'll drop them in the next revision.

> > +	};
> > +
> > +	gpio-restart {
> > +		compatible = "gpio-restart";
> > +		gpios = <&gpio_b 1 GPIO_ACTIVE_HIGH>;
> > +		active-delay = <100>;
> > +
> > +		status = "disabled";
> > +	};
> > +};
> > +
> > +&i2c0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c0_pins>;
> > +};
> > +
> > +&i2c1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c1_pins>;
> > +};
> > +
> > +&i2c2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c2_pins>;
> > +
> > +	rtc@32 {
> > +		compatible = "whwave,sd3078";
> > +		reg = <0x32>;
> > +	};
> > +};
> > +
> > +&i2c3 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c3_pins>;
> > +};
> > +
> > +&spi0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&spi0_pins>;
> > +};
> > +
> > +&spi1 {
> > +	num-cs = <1>;
> 
> Why is num-cs set at the board level here?
>

`num-cs` is set at the board level because it reflects board wiring, not
the controller capability. On Rongda M0 only one SPI1 CS line is routed,
so the board DTS restricts `num-cs` to 1.

> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&spi1_pins>;
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_pins>;
> > +};
> > +
> > +&uart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart1_pins>;
> > +};
> > +
> > +&uart2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart2_pins>;
> > +};
> > +
> > +&ethernet {
> > +	phy-handle = <&phy0>;
> > +	/*
> > +	 * YT8531 RGMII timing on this board requires no PHY internal delays.
> > +	 * Using "rgmii-id" together with rx/tx-internal-delay-ps results in RX CRC
> > +	 * errors and no usable traffic, so keep plain "rgmii" here.
> > +	 */
> > +	phy-mode = "rgmii";
> > +
> > +	mdio {
> > +		compatible = "snps,dwmac-mdio";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		phy0: phy@0 {
> > +			reg = <0x00>;
> > +		};
> > +	};
> > +};
> > 
> > -- 
> > 2.34.1
> > 

Best Regards,
Jia Wang



