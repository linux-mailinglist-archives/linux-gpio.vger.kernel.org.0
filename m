Return-Path: <linux-gpio+bounces-37168-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMZSAdkhDWpptgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37168-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 04:52:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94645586F8B
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 04:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12C313021B6F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 02:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628E830BF5C;
	Wed, 20 May 2026 02:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="idpJif2T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BD930F533;
	Wed, 20 May 2026 02:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245520; cv=none; b=ilZR6mpawEeY/quHbEkwUWJYymmZHuv9IuDGYBFQn8CbYMuA7lx6jUUpP3It9MBlcH5eOehDdNoBXQ9p9ffDBnTPN4lxIoqChad4dPcJHxEF6XzjM9Pj21mndNpcC58cEQLzi4z9bD5B1Z5U+CUhamUXH6eOFCx4cjK78pp9cI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245520; c=relaxed/simple;
	bh=tBnK7FyvogEsBPyj9UIGf20iu7dQO1C4RRU7a4GBkXQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=V1945y/mg8B7I19lgHQwHFCLBu0YeGSaFFKVdCMwY/OBB2ocjdUOUwxV46m/hPNSHLFDybSLjlms/rhogdUhz1cEivjpa4/8iMX1EIA7fJ60dfR2XkleMmu599eQoHIPbK6VkD8OSlitZN17vtNP74L35nvsXiuUCQPBGHG62wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=idpJif2T; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=8o/MhnUNZWT1WGTDrZsWln4E3tY+IHs/b
	KhMTsc1YcE=; b=idpJif2T6/tATUovGvTnMs5EJJlqF/+a60+gQDQt2i+rjtiSw
	vTIp+7mMCS4rYeM4CKDtwohxzHQ2WpLMoZKqY81mx/QvjI/vi6LBBMx/Je7/9AH/
	c6/tMxRhPwiYWO/h3/kh6PPkCmpkaQK08wiJgSy1u+0ahC1aGYhMJYSMoc=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkPaIQ1q9ecEAA--.6715S2;
	Wed, 20 May 2026 10:52:10 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 5/9] riscv: dts: ultrarisc: Add initial device tree for
 UltraRISC DP1000
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
In-Reply-To: <20260515-morbidity-rule-d8504467b252@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
 <20260515-morbidity-rule-d8504467b252@wendy>
Date: Wed, 20 May 2026 10:51:29 +0800
Message-Id: <177924548998.823562.8301642486475031179.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779245490; l=10168;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=tBnK7FyvogEsBPyj9UIGf20iu7dQO1C4RRU7a4GBkXQ=;
 b=/9TuA3qqHx17N3IZgj0Srpkk2Av3uO+IpmsYf00E+bxZWbCBFcONRAINKTN0+iD5Kma9jJkWL
 C6GA3Nb/lEkBi5MQzz7XHjdEC24rMu8pS8Qa3mnpOEu6+io7MA5dtiu
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkPaIQ1q9ecEAA--.6715S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AF47Jr15Zry8Zr15try3XFb_yoWfArWDpr
	WDWay5tF40qr17A39aqFyUGrs7Ww4kCF98Wr12qFyjkr9Y9r4rJrWUKr15GF1rWw1DZwsF
	9Fnayr42kwnxK3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQALEWoKjMQAHAAEsr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-37168-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 94645586F8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-15 11:26 +0100, Conor Dooley wrote:
> On Fri, May 15, 2026 at 09:18:01AM +0800, Jia Wang wrote:
> > Add the base device tree for the UltraRISC DP1000 SoC. It describes the
> > 8×CP100 CPU cores and essential SoC peripherals including the interrupt
> > controller, pinctrl, GPIO, UART, SPI, I2C, PCIe, GMAC and the DMA
> > controller.
> > 
> > Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-2-98935f6cdfb5@ultrarisc.com/
> > Link: https://lore.kernel.org/lkml/20260429-ultrarisc-serial-v7-3-e475cce9e274@ultrarisc.com/
> > 
> 
> No blank line here FYI.
>

Thanks for the review.

I'll remove the blank line in v2.
 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  MAINTAINERS                               |   1 +
> >  arch/riscv/boot/dts/ultrarisc/dp1000.dtsi | 851 ++++++++++++++++++++++++++++++
> >  2 files changed, 852 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index baaaa46b1a56..832e01898ae5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23087,6 +23087,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
> >  L:	linux-riscv@lists.infradead.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> > +F:	arch/riscv/boot/dts/ultrarisc/
> >  
> >  RNBD BLOCK DRIVERS
> >  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> > new file mode 100644
> > index 000000000000..1aae53fc1a2b
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> > @@ -0,0 +1,851 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +/ {
> > +	compatible = "ultrarisc,dp1000";
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		timebase-frequency = <10000000>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible = "ultrarisc,cp100", "riscv";
> > +			reg = <0x0>;
> > +			device_type = "cpu";
> > +			riscv,isa = "rv64imafdcbh";
> 
> Drop this property, its replacements (below) should be supported by all
> users.
> 

Will drop it in v2, thanks.

> > +			riscv,isa-base = "rv64i";
> > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
> > +					       "zba", "zbb", "zbc", "zbs", "zicntr",
> > +					       "zicsr", "zifencei", "zihpm", "ziccif",
> > +					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
> > +					       "zicbop", "zicboz", "zkt", "svade",
> > +					       "ssccptr", "sstvecd", "sscounterenw",
> > +					       "shcounterenw", "shtvala", "shvstvecd",
> > +					       "shvsatpa", "svvptc";
> > +			mmu-type = "riscv,sv48";
> > +			clock-frequency = <2000000000>;
> > +			/* L1 I-cache and D-cache:
> 
> FYI, the comment format outside of drivers/net/ has a newline after /*.
> 

Will fix the comment style in v2.

> > +			 * block-size 64B
> > +			 * 4-way set associative, size 64KB
> > +			 * per-core.
> > +			 */
> > +			d-cache-block-size = <64>;
> > +			d-cache-sets = <256>;
> > +			d-cache-size = <0x10000>;
> > +			i-cache-block-size = <64>;
> > +			i-cache-sets = <256>;
> > +			i-cache-size = <0x10000>;
> > +			next-level-cache = <&l2_cache0>;
> > +			riscv,cbom-block-size = <64>;
> > +			riscv,cboz-block-size = <64>;
> > +
> > +			cpu0_intc: interrupt-controller {
> > +				compatible = "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells = <0x01>;
> > +			};
> > +
> > +			l2_cache0: l2-cache {
> > +				/* L2 cache:
> > +				 * cache-unified, block-size 64B
> > +				 * 8-way set associative, size 512KB
> > +				 * per-core.
> > +				 */
> > +				compatible = "cache";
> > +				cache-block-size = <64>;
> > +				cache-level = <2>;
> > +				cache-size = <0x80000>;
> > +				cache-sets = <1024>;
> > +				cache-unified;
> > +				next-level-cache = <&cluster0_l3>;
> > +			};
> > +		};
> 
> > +		cpu4: cpu@4 {
> > +			compatible = "ultrarisc,cp100", "riscv";
> > +			reg = <0x10>;
> 
> Sashiko correctly pointed out that this is wrong.
> 
> > +		cpu5: cpu@5 {
> > +			compatible = "ultrarisc,cp100", "riscv";
> > +			reg = <0x11>;
> 
> And so is this.
> 
> > +		cpu6: cpu@6 {
> > +			compatible = "ultrarisc,cp100", "riscv";
> > +			reg = <0x12>;
> 
> And this.
> 
> > +		cpu7: cpu@7 {
> > +			compatible = "ultrarisc,cp100", "riscv";
> > +			reg = <0x13>;
> 
> And this.
> 

Will fix the unit addresses (cpu@10..cpu@13) in v2.

> > +	clocks {
> 
> I've commented on this in the cover letter.
> 

Thanks, I saw your comment in the cover letter. I’ll address it in v2.

> > +		device_clk: device_clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <62500000>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		timer_clk: timer_clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <50000000>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		csr_clk: csr_clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <250000000>;
> > +			#clock-cells = <0>;
> > +		};
> > +	};
> 
> > +	memory@80000000 {
> > +		device_type = "memory";
> > +		reg = <0x00 0x80000000 0x4 0x00000000>;
> > +	};
> 
> This looks incorrectly placed, memory should be in the board dts unless
> it is actually a part of the chip.
> 

Will move the memory node to the board dts in v2.

> > +
> > +	soc {
> > +		compatible = "simple-bus";
> > +		ranges;
> > +		#address-cells = <0x02>;
> > +		#size-cells = <0x02>;
> > +
> > +		clint: clint@8000000 {
> > +			compatible = "sifive,clint0", "riscv,clint0";
> 
> Missing a device-specific clint compatible.
> 
> > +			reg = <0x00 0x8000000 0x00 0x100000>;
> > +			interrupts-extended = <&cpu0_intc 0x03>, <&cpu0_intc 0x07>,
> > +					      <&cpu1_intc 0x03>, <&cpu1_intc 0x07>,
> > +					      <&cpu2_intc 0x03>, <&cpu2_intc 0x07>,
> > +					      <&cpu3_intc 0x03>, <&cpu3_intc 0x07>,
> > +					      <&cpu4_intc 0x03>, <&cpu4_intc 0x07>,
> > +					      <&cpu5_intc 0x03>, <&cpu5_intc 0x07>,
> > +					      <&cpu6_intc 0x03>, <&cpu6_intc 0x07>,
> > +					      <&cpu7_intc 0x03>, <&cpu7_intc 0x07>;
> > +		};
> > +
> > +		plic: plic@9000000 {
> > +			compatible = "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
> > +			reg = <0x00 0x9000000 0x00 0x4000000>;
> > +			#interrupt-cells = <1>;
> > +			#address-cells = <0>;
> > +			interrupt-controller;
> > +			interrupts-extended = <&cpu0_intc 0xb>, <&cpu0_intc 0x9>, <&cpu0_intc 0xa>,
> > +					      <&cpu1_intc 0xb>, <&cpu1_intc 0x9>, <&cpu1_intc 0xa>,
> > +					      <&cpu2_intc 0xb>, <&cpu2_intc 0x9>, <&cpu2_intc 0xa>,
> > +					      <&cpu3_intc 0xb>, <&cpu3_intc 0x9>, <&cpu3_intc 0xa>,
> > +					      <&cpu4_intc 0xb>, <&cpu4_intc 0x9>, <&cpu4_intc 0xa>,
> > +					      <&cpu5_intc 0xb>, <&cpu5_intc 0x9>, <&cpu5_intc 0xa>,
> > +					      <&cpu6_intc 0xb>, <&cpu6_intc 0x9>, <&cpu6_intc 0xa>,
> > +					      <&cpu7_intc 0xb>, <&cpu7_intc 0x9>, <&cpu7_intc 0xa>;
> > +			riscv,ndev = <160>;
> > +		};
> > +
> > +		pmx0: pinmux@11081000 {
> > +			compatible = "ultrarisc,dp1000-pinctrl";
> > +			reg = <0x0 0x11081000  0x0 0x1000>;
>                                              ^^ extra space here btw
> 

Will fix it in v2.

> > +			#pinctrl-cells = <2>;
> > +		};
> > +
> > +		spi0: spi@20320000 {
> > +			compatible = "snps,dw-apb-ssi";
> 
> Missing a device-specific compatible here, can just fall abck to the
> dw-apb-ssi one, so no need to make driver changes.
> 
> > +			reg = <0x0 0x20320000 0x0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clocks = <&device_clk>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <19>;
> > +			num-cs = <3>;
> > +		};
> 
> > +
> > +		i2c0: i2c@20330000 {
> > +			compatible = "snps,designware-i2c";
> 
> Same applies here.
> 
> > +			reg = <0x0 0x20330000 0x0 0x100>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clock-frequency = <400000>;
> > +			clocks = <&device_clk>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <20>;
> > +		};
> 
> > +
> > +		ethernet: ethernet@38000000 {
> > +			compatible = "snps,dwmac", "snps,dwmac-5.10a";
> 
> Surprised this passes dtbs_check. Same here, you need a specific
> compatible.
> 
> > +			reg = <0x00 0x38000000 0x00 0x1000000>;
> > +			clocks = <&csr_clk>;
> > +			clock-names = "stmmaceth";
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <84>;
> > +			interrupt-names = "macirq";
> > +			local-mac-address = [ff ff ff ff ff ff];
> > +			max-speed = <1000>;
> > +			phy-mode = "rgmii-id";
> > +			snps,txpbl = <8>;
> > +			snps,rxpbl = <8>;
> > +		};
> > +
> > +		dmac: dma-controller@39000000 {
> > +			compatible = "snps,axi-dma-1.01a";
> 
> Same thing here, I'd like to see a device specific compatible too.
> 

Got it. I’ll add device-specific compatible strings for the relevant
peripherals and update the corresponding dt-bindings in v2, including
clint, spi, i2c, ethernet, and the dma-controller.

> > +			reg = <0x0 0x39000000 0x0 0x400>;
> > +			clocks = <&device_clk>, <&device_clk>;
> 
> This kind of thing is what makes me think that you're over simplifying
> your clock tree. Sure, maybe you do use the same clock here for both
> ports, but it's suspect.
>

Thanks for the review. I’ll re-examine the clock topology to avoid
oversimplification and ensure the DT matches the actual hardware in v2.
 
> Cheers,
> Conor.
> 
> > +			clock-names = "core-clk", "cfgr-clk";
> > +			#dma-cells = <1>;
> > +			dma-channels = <8>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <152>;
> > +			snps,dma-masters = <1>;
> > +			snps,data-width = <4>;
> > +			snps,block-size = <512 512 512 512 512 512 512 512>;
> > +			snps,priority = <0 1 2 3 4 5 6 7>;
> > +			snps,axi-max-burst-len = <256>;
> > +		};
> > +	};
> > +};
> > 
> > -- 
> > 2.34.1
> > 

Best Regards,
Jia Wang



