Return-Path: <linux-gpio+bounces-37550-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDhLNW+YFmrmngcAu9opvQ
	(envelope-from <linux-gpio+bounces-37550-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:08:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC895E0398
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A566E3056DFA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 07:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7892B3B7B9D;
	Wed, 27 May 2026 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="OOYXhsgE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA2F3B1019;
	Wed, 27 May 2026 07:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865477; cv=none; b=VZRAA3+p4s1//1UC3tUnKE0DKJsUzMIy/ez64jRE9yKpyg7BGIRJk2G40vKxCJ58NCUGYdTL/QnekV6Vpn10NiTiMPLNAjhHzxVYIxaV1bdgq53zzrs5QOF9Q9yh71yGumxm+chsTcvm0n12JoUaG0aga77TATNE7q4Vfpm7Sms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865477; c=relaxed/simple;
	bh=tGdFSqzMEN3NmxQwAjal9tpkjB0+/g95acl0NbBI+Jk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OclicmfA6vaMJzKj1ttAS6dH7bz98CXPJouAXBcaJRQ5gnRqxanF2++6VVRtaptYPgdqP6fzZmnX/pbacI4dqEAEO7IYtl1WvZfBud1W9QK6xdmsFyasntXIkSV718FKmbecSIFTuSXFzugQG7r6DbFOYbdMvrM4fvjRcn/tq4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=OOYXhsgE; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=1WM/39//WGvXHW1V0RC8H+uIQUK0lDDH9
	5c7F7QKUkc=; b=OOYXhsgEop6fWzrQZ2+wRysohytXyUu0TBcwJqX4JNINKm4aX
	5k+1/pV3RLB26wjjvEmZxhHyCJdV1idxQeSVkQCXvQslru/9xxmYP2iose21o4Re
	obfnX0WFwEvggvIBnF4CVDhacz9E0Pl/zB3sMDGrbvMczeKJ7x1jjMWKVE=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUKWlxZqrVUGAA--.7991S2;
	Wed, 27 May 2026 15:04:54 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/9] riscv: dts: ultrarisc: Add initial device tree for
 UltraRISC DP1000
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
In-Reply-To: <2d7b660c-97d4-4896-97df-7868b1d2fb50@kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
 <2d7b660c-97d4-4896-97df-7868b1d2fb50@kernel.org>
Date: Wed, 27 May 2026 15:04:14 +0800
Message-Id: <177986545456.2389245.4189212092340927900.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779865454; l=14219;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=tGdFSqzMEN3NmxQwAjal9tpkjB0+/g95acl0NbBI+Jk=;
 b=0zqjQQ3oPHK466iw08X4uM2f7R/QiRS81acc5nydWc/5nzQR/ki4e9kKfDpvmahypsBZx9a8Z
 MCxEnVpGBWvDJX1LpE+uTvnOXLNyo6jkobYL4C6boKdnmE75GqJEv2c
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwA3cUKWlxZqrVUGAA--.7991S2
X-Coremail-Antispam: 1UD129KBjvAXoW3ZrWxGrW8Jw1kAr1fur4DArb_yoW8JrWruo
	Zxtrs3GF48Ga4UJFn5t347tF4jkrWvga13KrW5GF13JF1Yga48Gw1rJr4jyr45WrWYyFyq
	y3y293WUAayqyrs5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYH7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoVGMYADgAFs6
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-37550-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4DC895E0398
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-21 23:05 +0200, Krzysztof Kozlowski wrote:
> On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> > +
> > +		cluster0_l3: l3-cache0 {
> > +			/* L3 cache:
> 
> Use Linux coding style. In other places as well. Even netdev does not
> use that style anymore!
>

Will fix comment style, thanks!
 
> > +			 * cache-unified, block-size 64B
> > +			 * 16-way set associative, size 4MB
> > +			 * per-cluster.
> > +			 */
> > +			compatible = "cache";
> > +			cache-block-size = <64>;
> > +			cache-level = <3>;
> > +			cache-size = <0x400000>;
> > +			cache-sets = <0x1000>;
> > +			cache-unified;
> > +			next-level-cache = <&l4_cache>;
> > +		};
> > +
> > +		cluster1_l3: l3-cache1 {
> > +			/* L3 cache:
> > +			 * cache-unified, block-size 64B
> > +			 * 16-way set associative, size 4MB
> > +			 * per-cluster.
> > +			 */
> > +			compatible = "cache";
> > +			cache-block-size = <64>;
> > +			cache-level = <3>;
> > +			cache-size = <0x400000>;
> > +			cache-sets = <0x1000>;
> > +			cache-unified;
> > +			next-level-cache = <&l4_cache>;
> > +		};
> > +	};
> > +
> > +	clocks {
> > +		device_clk: device_clk {
> 
> You need to follow DTS coding style.
> 
> Anyway, something like "device clock" is completely uninformative or
> even incorrect. I really doubt such thing as "device clock" exists...
> 
> Please use name for all fixed clocks which matches current format
> recommendation: 'clock-<freq>' (see also the pattern in the binding for
> any other options).
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> 

Will fix the clock naming.

As discussed with Conor, I will also introduce a separate read-only clock
driver and binding in a separate series to replace the current fixed-clock
usage. The DTS will be updated accordingly once this new clock is in place.

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
> > +
> > +	l4_cache: l4-cache {
> > +		/* L4 cache:
> > +		 * cache-unified, block-size 64B
> > +		 * 16-way set associative, size 16MB
> > +		 * shared by the SoC.
> > +		 */
> > +		compatible = "cache";
> > +		cache-block-size = <64>;
> > +		cache-level = <4>;
> > +		cache-size = <0x1000000>;
> > +		cache-sets = <0x4000>;
> > +		cache-unified;
> > +	};
> > +
> > +	memory@80000000 {
> > +		device_type = "memory";
> > +		reg = <0x00 0x80000000 0x4 0x00000000>;
> > +	};
> > +
> > +	soc {
> > +		compatible = "simple-bus";
> > +		ranges;
> > +		#address-cells = <0x02>;
> > +		#size-cells = <0x02>;
> 
> <2> This is not hex and definitely does not need padding with 0.
> 
> > +
> > +		clint: clint@8000000 {
> > +			compatible = "sifive,clint0", "riscv,clint0";
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
> 
> So hex or not hex? Please fix your DTS so it is consistent.
> 

I will clean up the inconsistent hex/decimal formatting across the DTS and
remove the unnecessary padding in the next version.

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
> > +			#pinctrl-cells = <2>;
> > +		};
> > +
> > +		gpio: gpio@20200000 {
> > +			compatible = "snps,dw-apb-gpio";
> > +			reg = <0x0 0x20200000 0x0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clock-names = "bus", "db";
> > +			clocks = <&csr_clk>, <&device_clk>;
> > +
> > +			gpio_a: gpio-port@0 {
> > +				compatible = "snps,dw-apb-gpio-port";
> > +				reg = <0>;
> > +				gpio-controller;
> > +				#gpio-cells = <2>;
> > +				snps,nr-gpios = <16>;
> > +				interrupt-controller;
> > +				#interrupt-cells = <2>;
> > +				interrupt-parent = <&plic>;
> > +				interrupts = <34>;
> > +				gpio-ranges = <&pmx0 0 0 16>;
> > +			};
> > +
> > +			gpio_b: gpio-port@1 {
> > +				compatible = "snps,dw-apb-gpio-port";
> > +				reg = <1>;
> > +				gpio-controller;
> > +				#gpio-cells = <2>;
> > +				snps,nr-gpios = <8>;
> > +				gpio-ranges = <&pmx0 16 0 8>;
> > +			};
> > +
> > +			gpio_c: gpio-port@2 {
> > +				compatible = "snps,dw-apb-gpio-port";
> > +				reg = <2>;
> > +				gpio-controller;
> > +				#gpio-cells = <2>;
> > +				snps,nr-gpios = <8>;
> > +				gpio-ranges = <&pmx0 24 0 8>;
> > +			};
> > +
> > +			gpio_d: gpio-port@3 {
> > +				compatible = "snps,dw-apb-gpio-port";
> > +				reg = <3>;
> > +				gpio-controller;
> > +				#gpio-cells = <2>;
> > +				snps,nr-gpios = <8>;
> > +				gpio-ranges = <&pmx0 32 0 8>;
> > +			};
> > +		};
> > +
> > +		uart0: serial@20300000 {
> > +			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
> > +			reg = <0x00 0x20300000 0x00 0x10000>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <17>;
> > +			clock-frequency = <62500000>;
> > +			reg-io-width = <0x04>;
> > +			reg-shift = <0x02>;
> > +		};
> > +
> > +		uart1: serial@20310000 {
> > +			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
> > +			reg = <0x00 0x20310000 0x00 0x10000>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <18>;
> > +			clock-frequency = <62500000>;
> > +			reg-io-width = <0x04>;
> > +			reg-shift = <0x02>;
> > +		};
> > +
> > +		uart2: serial@20400000 {
> > +			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
> > +			reg = <0x00 0x20400000 0x00 0x10000>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <25>;
> > +			clock-frequency = <62500000>;
> > +			reg-io-width = <0x04>;
> > +			reg-shift = <0x02>;
> > +		};
> > +
> > +		uart3: serial@20410000 {
> > +			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
> > +			reg = <0x00 0x20410000 0x00 0x10000>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <26>;
> > +			clock-frequency = <62500000>;
> > +			reg-io-width = <0x04>;
> > +			reg-shift = <0x02>;
> > +		};
> > +
> > +		spi0: spi@20320000 {
> > +			compatible = "snps,dw-apb-ssi";
> > +			reg = <0x0 0x20320000 0x0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clocks = <&device_clk>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <19>;
> > +			num-cs = <3>;
> > +		};
> > +
> > +		spi1: spi@20420000 {
> > +			compatible = "snps,dw-apb-ssi";
> > +			reg = <0x0 0x20420000 0x0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clocks = <&device_clk>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <27>;
> > +			num-cs = <3>;
> > +		};
> > +
> > +		i2c0: i2c@20330000 {
> > +			compatible = "snps,designware-i2c";
> > +			reg = <0x0 0x20330000 0x0 0x100>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clock-frequency = <400000>;
> > +			clocks = <&device_clk>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <20>;
> > +		};
> > +
> > +		i2c1: i2c@20340000 {
> > +			compatible = "snps,designware-i2c";
> > +			reg = <0x0 0x20340000 0x0 0x100>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clock-frequency = <400000>;
> > +			clocks = <&device_clk>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <21>;
> > +		};
> > +
> > +		i2c2: i2c@20430000 {
> > +			compatible = "snps,designware-i2c";
> > +			reg = <0x0 0x20430000 0x0 0x100>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clock-frequency = <400000>;
> > +			clocks = <&device_clk>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <28>;
> > +		};
> > +
> > +		i2c3: i2c@20440000 {
> > +			compatible = "snps,designware-i2c";
> > +			reg = <0x0 0x20440000 0x0 0x100>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clock-frequency = <400000>;
> > +			clocks = <&device_clk>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <29>;
> > +		};
> > +
> > +		pcie_x16: pcie@21000000 {
> > +			compatible = "ultrarisc,dp1000-pcie";
> > +			reg = <0x0 0x21000000 0x0 0x01000000>,
> > +			      <0x0 0x4fff0000 0x0 0x00010000>;
> > +			reg-names = "dbi", "config";
> > +			ranges = <0x81000000  0x0 0x4fbf0000  0x0 0x4fbf0000  0x0 0x00400000>,
> > +				 <0x82000000  0x0 0x40000000  0x0 0x40000000  0x0 0x0fbf0000>,
> > +				 <0xc3000000 0x40 0x00000000 0x40 0x00000000  0xd 0x00000000>;
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			#interrupt-cells = <1>;
> > +			device_type = "pci";
> > +			dma-coherent;
> > +			bus-range = <0x0 0xff>;
> > +			num-lanes = <16>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <43>, <44>, <45>, <46>, <47>;
> > +			interrupt-names = "msi", "inta", "intb", "intc", "intd";
> > +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > +			interrupt-map = <0x0 0x0 0x0 0x1 &plic 44>,
> > +					<0x0 0x0 0x0 0x2 &plic 45>,
> > +					<0x0 0x0 0x0 0x3 &plic 46>,
> > +					<0x0 0x0 0x0 0x4 &plic 47>;
> 
> Why PCIe without any devices is enabled? That's a bus.
> 
> Please look how other DTS are written because you created something
> pretty different than entire kernel style.
> 

I will review the PCIe node and update it to align with existing DTS
conventions in the next version.

> > +		};
> > +
> > +		pcie_x4a: pcie@23000000 {
> > +			compatible = "ultrarisc,dp1000-pcie";
> > +			reg = <0x0 0x23000000 0x0 0x01000000>,
> > +			      <0x0 0x6fff0000 0x0 0x00010000>;
> > +			reg-names = "dbi", "config";
> > +			ranges = <0x81000000  0x0 0x6fbf0000  0x0 0x6fbf0000  0x0 0x00400000>,
> > +				 <0x82000000  0x0 0x60000000  0x0 0x60000000  0x0 0x0fbf0000>,
> > +				 <0xc3000000 0x80 0x00000000 0x80 0x00000000  0xd 0x00000000>;
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			#interrupt-cells = <1>;
> > +			device_type = "pci";
> > +			dma-coherent;
> > +			bus-range = <0x0 0xff>;
> > +			num-lanes = <4>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <63>, <64>, <65>, <66>, <67>;
> > +			interrupt-names = "msi", "inta", "intb", "intc", "intd";
> > +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > +			interrupt-map = <0x0 0x0 0x0 0x1 &plic 64>,
> > +					<0x0 0x0 0x0 0x2 &plic 65>,
> > +					<0x0 0x0 0x0 0x3 &plic 66>,
> > +					<0x0 0x0 0x0 0x4 &plic 67>;
> > +		};
> > +
> > +		pcie_x4b: pcie@24000000 {
> > +			compatible = "ultrarisc,dp1000-pcie";
> > +			reg = <0x0 0x24000000 0x0 0x01000000>,
> > +			      <0x0 0x7fff0000 0x0 0x00010000>;
> > +			reg-names = "dbi", "config";
> > +			ranges = <0x81000000  0x0 0x7fbf0000  0x0 0x7fbf0000 0x0 0x00400000>,
> > +				 <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x0fbf0000>,
> > +				 <0xc3000000 0xc0 0x00000000 0xc0 0x00000000 0xd 0x00000000>;
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			#interrupt-cells = <1>;
> > +			device_type = "pci";
> > +			dma-coherent;
> > +			bus-range = <0x0 0xff>;
> > +			num-lanes = <4>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <73>, <74>, <75>, <76>, <77>;
> > +			interrupt-names = "msi", "inta", "intb", "intc", "intd";
> > +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > +			interrupt-map = <0x0 0x0 0x0 0x1 &plic 74>,
> > +					<0x0 0x0 0x0 0x2 &plic 75>,
> > +					<0x0 0x0 0x0 0x3 &plic 76>,
> > +					<0x0 0x0 0x0 0x4 &plic 77>;
> > +		};
> > +
> > +		ethernet: ethernet@38000000 {
> > +			compatible = "snps,dwmac", "snps,dwmac-5.10a";
> > +			reg = <0x00 0x38000000 0x00 0x1000000>;
> > +			clocks = <&csr_clk>;
> > +			clock-names = "stmmaceth";
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <84>;
> > +			interrupt-names = "macirq";
> > +			local-mac-address = [ff ff ff ff ff ff];
> 
> Drop. Not a property of the SoC.
>

Will drop it in the next version.
 
> > +			max-speed = <1000>;
> > +			phy-mode = "rgmii-id";
> > +			snps,txpbl = <8>;
> > +			snps,rxpbl = <8>;
> 
> I doubt that Ethernet is complete on the SoC - without MAC and all other
> resources. IOW, it is very weird that this is enabled here. Please explain.
>

I will move the PHY configuration to the board DTS and keep only the MAC
controller description in the SoC dtsi in the next version.
 
> > +		};
> > +
> > +		dmac: dma-controller@39000000 {
> > +			compatible = "snps,axi-dma-1.01a";
> > +			reg = <0x0 0x39000000 0x0 0x400>;
> 
> <0x0 here but why in other places is <0x00?
> 
> Write consistent code.
>

Will fix to use consistent hex formatting across the DTS. Thanks!
 
> 
> 
> Best regards,
> Krzysztof
> 

Best regards,
Jia Wang



