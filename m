Return-Path: <linux-gpio+bounces-37301-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLXBKqlzD2r4MQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37301-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 23:05:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B19165AC038
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 23:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 774F330028CE
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 21:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC965348C69;
	Thu, 21 May 2026 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cg9W0NPf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5719F2FC876;
	Thu, 21 May 2026 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779397512; cv=none; b=RvsFpHV3/XGc1sYx8GFL0CjNb3Uzn0U6Hu2P9RvQTlg1R015/fq8E0To7oRz08VSO/cHSAmjwSn7Q8UEJNyS2TBh8AHSsP0aBJRyWG8yX+urG4yL4KFI9iS67Cey2oFpobE666nXPs4wyR3kwrQ9J/kR0dAwq2yvmDG2gQtq9Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779397512; c=relaxed/simple;
	bh=V/8r92jDsB7yNGI77pttSfh4DTcRzv3wdPSsEpfCMtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHbLwYoSljSRyHwONhBPQc/ykaYoDeVzE0F3WHEdkz6S0lt1jfk2elY4ioCt9gjUMArQfze7ns9xKud891GELyRIpfjfdSuRY9VV/8Tloi19RGy2Gb4sShbZt5mHfoIwVK7tR9v/j8m/jXNavDJ0n6ra2qD/fIUVxWD9y0T6oYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cg9W0NPf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9F71F000E9;
	Thu, 21 May 2026 21:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779397511;
	bh=5AWNyw7xv54cZ/1ArFonp6jAGLeDjgfl10hGzCZA8hY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Cg9W0NPfcSjMS1KP6aUNxLw8NxKo1uK3MtD+Bn5mIg/+eZe/a8GCEBa3HtIrsgtPr
	 h/TmBoZqQN+x4R8p8fCzdyvuO0NogdNHt2yQ1mPF2LmTjSVCSUpmH2kEnuVMF3ONsY
	 zjsDjecweqiwtu4JiWuP33eC+N7YBZnr2dQqJZ3sSMd0f6rnErs9d75NO6swwXd23s
	 YibzvCmj+HczOsDWMudJPO31eurpRBynZ4kqsF7WEc4NssBee++mRUKmD6EW/eOL6l
	 3wvM/Cm+JmfEkfEf3S87u4YMqZsDZ5X1nthOyvpGR0DAc/tBRknBXYJDudsqBy8MV7
	 3EjJkfvPk3lXw==
Message-ID: <2d7b660c-97d4-4896-97df-7868b1d2fb50@kernel.org>
Date: Thu, 21 May 2026 23:05:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] riscv: dts: ultrarisc: Add initial device tree for
 UltraRISC DP1000
To: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37301-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B19165AC038
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> +
> +		cluster0_l3: l3-cache0 {
> +			/* L3 cache:

Use Linux coding style. In other places as well. Even netdev does not
use that style anymore!

> +			 * cache-unified, block-size 64B
> +			 * 16-way set associative, size 4MB
> +			 * per-cluster.
> +			 */
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <3>;
> +			cache-size = <0x400000>;
> +			cache-sets = <0x1000>;
> +			cache-unified;
> +			next-level-cache = <&l4_cache>;
> +		};
> +
> +		cluster1_l3: l3-cache1 {
> +			/* L3 cache:
> +			 * cache-unified, block-size 64B
> +			 * 16-way set associative, size 4MB
> +			 * per-cluster.
> +			 */
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <3>;
> +			cache-size = <0x400000>;
> +			cache-sets = <0x1000>;
> +			cache-unified;
> +			next-level-cache = <&l4_cache>;
> +		};
> +	};
> +
> +	clocks {
> +		device_clk: device_clk {

You need to follow DTS coding style.

Anyway, something like "device clock" is completely uninformative or
even incorrect. I really doubt such thing as "device clock" exists...

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml

> +			compatible = "fixed-clock";
> +			clock-frequency = <62500000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		timer_clk: timer_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <50000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		csr_clk: csr_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <250000000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	l4_cache: l4-cache {
> +		/* L4 cache:
> +		 * cache-unified, block-size 64B
> +		 * 16-way set associative, size 16MB
> +		 * shared by the SoC.
> +		 */
> +		compatible = "cache";
> +		cache-block-size = <64>;
> +		cache-level = <4>;
> +		cache-size = <0x1000000>;
> +		cache-sets = <0x4000>;
> +		cache-unified;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x00 0x80000000 0x4 0x00000000>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		ranges;
> +		#address-cells = <0x02>;
> +		#size-cells = <0x02>;

<2> This is not hex and definitely does not need padding with 0.

> +
> +		clint: clint@8000000 {
> +			compatible = "sifive,clint0", "riscv,clint0";
> +			reg = <0x00 0x8000000 0x00 0x100000>;
> +			interrupts-extended = <&cpu0_intc 0x03>, <&cpu0_intc 0x07>,
> +					      <&cpu1_intc 0x03>, <&cpu1_intc 0x07>,
> +					      <&cpu2_intc 0x03>, <&cpu2_intc 0x07>,
> +					      <&cpu3_intc 0x03>, <&cpu3_intc 0x07>,
> +					      <&cpu4_intc 0x03>, <&cpu4_intc 0x07>,
> +					      <&cpu5_intc 0x03>, <&cpu5_intc 0x07>,
> +					      <&cpu6_intc 0x03>, <&cpu6_intc 0x07>,
> +					      <&cpu7_intc 0x03>, <&cpu7_intc 0x07>;
> +		};
> +
> +		plic: plic@9000000 {
> +			compatible = "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
> +			reg = <0x00 0x9000000 0x00 0x4000000>;
> +			#interrupt-cells = <1>;
> +			#address-cells = <0>;

So hex or not hex? Please fix your DTS so it is consistent.

> +			interrupt-controller;
> +			interrupts-extended = <&cpu0_intc 0xb>, <&cpu0_intc 0x9>, <&cpu0_intc 0xa>,
> +					      <&cpu1_intc 0xb>, <&cpu1_intc 0x9>, <&cpu1_intc 0xa>,
> +					      <&cpu2_intc 0xb>, <&cpu2_intc 0x9>, <&cpu2_intc 0xa>,
> +					      <&cpu3_intc 0xb>, <&cpu3_intc 0x9>, <&cpu3_intc 0xa>,
> +					      <&cpu4_intc 0xb>, <&cpu4_intc 0x9>, <&cpu4_intc 0xa>,
> +					      <&cpu5_intc 0xb>, <&cpu5_intc 0x9>, <&cpu5_intc 0xa>,
> +					      <&cpu6_intc 0xb>, <&cpu6_intc 0x9>, <&cpu6_intc 0xa>,
> +					      <&cpu7_intc 0xb>, <&cpu7_intc 0x9>, <&cpu7_intc 0xa>;
> +			riscv,ndev = <160>;
> +		};
> +
> +		pmx0: pinmux@11081000 {
> +			compatible = "ultrarisc,dp1000-pinctrl";
> +			reg = <0x0 0x11081000  0x0 0x1000>;
> +			#pinctrl-cells = <2>;
> +		};
> +
> +		gpio: gpio@20200000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x0 0x20200000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clock-names = "bus", "db";
> +			clocks = <&csr_clk>, <&device_clk>;
> +
> +			gpio_a: gpio-port@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <0>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <16>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupt-parent = <&plic>;
> +				interrupts = <34>;
> +				gpio-ranges = <&pmx0 0 0 16>;
> +			};
> +
> +			gpio_b: gpio-port@1 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <1>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <8>;
> +				gpio-ranges = <&pmx0 16 0 8>;
> +			};
> +
> +			gpio_c: gpio-port@2 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <2>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <8>;
> +				gpio-ranges = <&pmx0 24 0 8>;
> +			};
> +
> +			gpio_d: gpio-port@3 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <3>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <8>;
> +				gpio-ranges = <&pmx0 32 0 8>;
> +			};
> +		};
> +
> +		uart0: serial@20300000 {
> +			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
> +			reg = <0x00 0x20300000 0x00 0x10000>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <17>;
> +			clock-frequency = <62500000>;
> +			reg-io-width = <0x04>;
> +			reg-shift = <0x02>;
> +		};
> +
> +		uart1: serial@20310000 {
> +			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
> +			reg = <0x00 0x20310000 0x00 0x10000>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <18>;
> +			clock-frequency = <62500000>;
> +			reg-io-width = <0x04>;
> +			reg-shift = <0x02>;
> +		};
> +
> +		uart2: serial@20400000 {
> +			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
> +			reg = <0x00 0x20400000 0x00 0x10000>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <25>;
> +			clock-frequency = <62500000>;
> +			reg-io-width = <0x04>;
> +			reg-shift = <0x02>;
> +		};
> +
> +		uart3: serial@20410000 {
> +			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
> +			reg = <0x00 0x20410000 0x00 0x10000>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <26>;
> +			clock-frequency = <62500000>;
> +			reg-io-width = <0x04>;
> +			reg-shift = <0x02>;
> +		};
> +
> +		spi0: spi@20320000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x0 0x20320000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&device_clk>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <19>;
> +			num-cs = <3>;
> +		};
> +
> +		spi1: spi@20420000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x0 0x20420000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&device_clk>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <27>;
> +			num-cs = <3>;
> +		};
> +
> +		i2c0: i2c@20330000 {
> +			compatible = "snps,designware-i2c";
> +			reg = <0x0 0x20330000 0x0 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clock-frequency = <400000>;
> +			clocks = <&device_clk>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <20>;
> +		};
> +
> +		i2c1: i2c@20340000 {
> +			compatible = "snps,designware-i2c";
> +			reg = <0x0 0x20340000 0x0 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clock-frequency = <400000>;
> +			clocks = <&device_clk>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <21>;
> +		};
> +
> +		i2c2: i2c@20430000 {
> +			compatible = "snps,designware-i2c";
> +			reg = <0x0 0x20430000 0x0 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clock-frequency = <400000>;
> +			clocks = <&device_clk>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <28>;
> +		};
> +
> +		i2c3: i2c@20440000 {
> +			compatible = "snps,designware-i2c";
> +			reg = <0x0 0x20440000 0x0 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clock-frequency = <400000>;
> +			clocks = <&device_clk>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <29>;
> +		};
> +
> +		pcie_x16: pcie@21000000 {
> +			compatible = "ultrarisc,dp1000-pcie";
> +			reg = <0x0 0x21000000 0x0 0x01000000>,
> +			      <0x0 0x4fff0000 0x0 0x00010000>;
> +			reg-names = "dbi", "config";
> +			ranges = <0x81000000  0x0 0x4fbf0000  0x0 0x4fbf0000  0x0 0x00400000>,
> +				 <0x82000000  0x0 0x40000000  0x0 0x40000000  0x0 0x0fbf0000>,
> +				 <0xc3000000 0x40 0x00000000 0x40 0x00000000  0xd 0x00000000>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <1>;
> +			device_type = "pci";
> +			dma-coherent;
> +			bus-range = <0x0 0xff>;
> +			num-lanes = <16>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <43>, <44>, <45>, <46>, <47>;
> +			interrupt-names = "msi", "inta", "intb", "intc", "intd";
> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0x0 0x0 0x0 0x1 &plic 44>,
> +					<0x0 0x0 0x0 0x2 &plic 45>,
> +					<0x0 0x0 0x0 0x3 &plic 46>,
> +					<0x0 0x0 0x0 0x4 &plic 47>;

Why PCIe without any devices is enabled? That's a bus.

Please look how other DTS are written because you created something
pretty different than entire kernel style.

> +		};
> +
> +		pcie_x4a: pcie@23000000 {
> +			compatible = "ultrarisc,dp1000-pcie";
> +			reg = <0x0 0x23000000 0x0 0x01000000>,
> +			      <0x0 0x6fff0000 0x0 0x00010000>;
> +			reg-names = "dbi", "config";
> +			ranges = <0x81000000  0x0 0x6fbf0000  0x0 0x6fbf0000  0x0 0x00400000>,
> +				 <0x82000000  0x0 0x60000000  0x0 0x60000000  0x0 0x0fbf0000>,
> +				 <0xc3000000 0x80 0x00000000 0x80 0x00000000  0xd 0x00000000>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <1>;
> +			device_type = "pci";
> +			dma-coherent;
> +			bus-range = <0x0 0xff>;
> +			num-lanes = <4>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <63>, <64>, <65>, <66>, <67>;
> +			interrupt-names = "msi", "inta", "intb", "intc", "intd";
> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0x0 0x0 0x0 0x1 &plic 64>,
> +					<0x0 0x0 0x0 0x2 &plic 65>,
> +					<0x0 0x0 0x0 0x3 &plic 66>,
> +					<0x0 0x0 0x0 0x4 &plic 67>;
> +		};
> +
> +		pcie_x4b: pcie@24000000 {
> +			compatible = "ultrarisc,dp1000-pcie";
> +			reg = <0x0 0x24000000 0x0 0x01000000>,
> +			      <0x0 0x7fff0000 0x0 0x00010000>;
> +			reg-names = "dbi", "config";
> +			ranges = <0x81000000  0x0 0x7fbf0000  0x0 0x7fbf0000 0x0 0x00400000>,
> +				 <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x0fbf0000>,
> +				 <0xc3000000 0xc0 0x00000000 0xc0 0x00000000 0xd 0x00000000>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <1>;
> +			device_type = "pci";
> +			dma-coherent;
> +			bus-range = <0x0 0xff>;
> +			num-lanes = <4>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <73>, <74>, <75>, <76>, <77>;
> +			interrupt-names = "msi", "inta", "intb", "intc", "intd";
> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0x0 0x0 0x0 0x1 &plic 74>,
> +					<0x0 0x0 0x0 0x2 &plic 75>,
> +					<0x0 0x0 0x0 0x3 &plic 76>,
> +					<0x0 0x0 0x0 0x4 &plic 77>;
> +		};
> +
> +		ethernet: ethernet@38000000 {
> +			compatible = "snps,dwmac", "snps,dwmac-5.10a";
> +			reg = <0x00 0x38000000 0x00 0x1000000>;
> +			clocks = <&csr_clk>;
> +			clock-names = "stmmaceth";
> +			interrupt-parent = <&plic>;
> +			interrupts = <84>;
> +			interrupt-names = "macirq";
> +			local-mac-address = [ff ff ff ff ff ff];

Drop. Not a property of the SoC.

> +			max-speed = <1000>;
> +			phy-mode = "rgmii-id";
> +			snps,txpbl = <8>;
> +			snps,rxpbl = <8>;

I doubt that Ethernet is complete on the SoC - without MAC and all other
resources. IOW, it is very weird that this is enabled here. Please explain.

> +		};
> +
> +		dmac: dma-controller@39000000 {
> +			compatible = "snps,axi-dma-1.01a";
> +			reg = <0x0 0x39000000 0x0 0x400>;

<0x0 here but why in other places is <0x00?

Write consistent code.



Best regards,
Krzysztof

