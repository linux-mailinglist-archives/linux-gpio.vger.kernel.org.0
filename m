Return-Path: <linux-gpio+bounces-37612-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEqiCof5F2oWXwgAu9opvQ
	(envelope-from <linux-gpio+bounces-37612-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:15:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3E5EE602
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A11F1308DAD3
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CCB366049;
	Thu, 28 May 2026 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="K0pJTyW1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA7830E0F8;
	Thu, 28 May 2026 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955371; cv=none; b=CEfrEsF9yFtzib6F3h3pAu7+5fbXZZes4TV6Ct5/BnZfeaWodMRT63xoIjpN0GHRLfwCl7LTroqLYpvB/YoX2To1gLN8hsqteJAVDUgBdD+UYbcL93b+/T9YEqZd5T+lkof3hu4OjXl+NUmvHUEu8/fsscgy1QyVHVIk292P6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955371; c=relaxed/simple;
	bh=QW9gXVGW6LlKeGowDKXk0ycOCa1aUIqKcc9+r0dKpFY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=eQ9Q3cgdvHUdpufrybOsM7j1Y1O22X0dqqqlaVitCnJ7n7zA7wpcD1nb/yPcm6pTcxMOhC8Gawc5QsNQ3R5olhwgfLSZ0idjAZ+lA2/gpDNCSpjkOtM7iH/htj5QW11cigfChLWg1tvgdOtZabOloyf/u+byXj8OSW5EZLg1c9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=K0pJTyW1; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=qTyBdHXdVTvD5p7mBh3Y3ebiYH14OcrNA
	ZjgSGACkUE=; b=K0pJTyW1jpEVqB6hu5Z+gfurAFWl+hqy28OzKtTt6jJaomtA2
	L83VGQCadGGfiW79QmCrDFhMLRviM/tyE3NOY7SjndjYzRNbMjXqk//zSClPF/oP
	D6fp2M7dr3BVzWtUPhivUJaAJdJh3UyuE0fKRiwHbmuqnshbkNTelIkGd0=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkPC9hdqkqcGAA--.7964S2;
	Thu, 28 May 2026 16:03:14 +0800 (CST)
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
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
In-Reply-To: <1a4a54bc-1013-4ab0-85e9-7ad5cf7146cd@kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
 <1a4a54bc-1013-4ab0-85e9-7ad5cf7146cd@kernel.org>
Date: Thu, 28 May 2026 16:02:34 +0800
Message-Id: <177995535495.929162.14360417218918332099.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779955355; l=4993;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=QW9gXVGW6LlKeGowDKXk0ycOCa1aUIqKcc9+r0dKpFY=;
 b=78XIM9TKCYrIwTTdVasxyRqtRZrTHxEkM6mLN/IjmBDW8NQhk69ZA64gHbrvbpxqCSI6HixEe
 Cw7xbF1LDK2CEZbeeJ/2UA93kAQTqeXkQ5ZuqFuFRBVVikC9qbPlCDI
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkPC9hdqkqcGAA--.7964S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXryrAF1fJF47urykAw1fWFg_yoWrtrWDpa
	nrCrs8ua9ruw12934Iv345JFnxJr48Wa4ru3W7tFyIyrs8Zr48CrZaq3s0gFn3Xrn8J348
	Cr15uFyIkFnakaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgAKsM
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37612-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:email,ultrarisc.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DEE3E5EE602
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-21 22:59 +0200, Krzysztof Kozlowski wrote:
> On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
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
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	i2c1_pins: i2c1-pins {
> > +		pins = "PB6", "PB7";
> > +		function = "func0";
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	i2c2_pins: i2c2-pins {
> > +		pins = "PC0", "PC1";
> > +		function = "func0";
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	i2c3_pins: i2c3-pins {
> > +		pins = "PC2", "PC3";
> > +		function = "func0";
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	pciex4a_link_pins: pciex4a-link-pins {
> > +		pins = "PC0";
> > +		function = "func1";
> > +		bias-pull-down;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	pciex4b_link_pins: pciex4b-link-pins {
> > +		pins = "PC1";
> > +		function = "func1";
> > +		bias-pull-down;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	spi0_pins: spi0-pins {
> > +		pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5", "PD6", "PD7";
> > +		function = "func1";
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	spi1_pins: spi1-pins {
> > +		pins = "PA0", "PA1", "PA2", "PA3";
> > +		function = "func0";
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	uart0_pins: uart0-pins {
> > +		pins = "PA8", "PA9";
> > +		function = "func1";
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	uart1_pins: uart1-pins {
> > +		pins = "PB4", "PB5";
> > +		function = "func0";
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> > +
> > +	uart2_pins: uart2-pins {
> > +		pins = "PC4", "PC5";
> > +		function = "func0";
> > +		bias-pull-up;
> > +		drive-strength = <33>;
> > +	};
> > +};
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
> Why is this disabled? You just added final board, so it cannot have any
> nodes disabled. Disabled at this point means you add dead code without
> explanation.
> 

Will drop them, reset/poweroff is handled via OpenSBI SRST. Thanks!

> 
> Best regards,
> Krzysztof
> 

Best regards,
Jia Wang



