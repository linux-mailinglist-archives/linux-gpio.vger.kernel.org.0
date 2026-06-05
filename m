Return-Path: <linux-gpio+bounces-38012-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AeWkDPjhImoUewEAu9opvQ
	(envelope-from <linux-gpio+bounces-38012-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 16:49:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FEA648FAC
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 16:49:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HAB+w2Kh;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38012-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38012-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 736E930AB151
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 14:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741B33B7B6B;
	Fri,  5 Jun 2026 14:40:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F4355F25;
	Fri,  5 Jun 2026 14:40:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670435; cv=none; b=jb6DC0kb7vSUnwNC5f6Xpb10M8veWkjkbslfGYvTU3vIeAgw+Sh+44nzaHD7fKuiWpu1LFr6oSrdAw3fTr37yVIyqY7CEh8b7BLxjt5G8inlR9UJ/P60q23S0WFA20WUz9XV12msUfVF1VPyK5Ovjh4EoVlW7FJxtpNlRUm3lDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670435; c=relaxed/simple;
	bh=7E/NOmTNocC/WEyNgoJKQWTmU7zo2ab+uVA1ao4XvWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bedfgRXOJGRBMIvAditgLy+LFx9S0eJWWeA4kfr+V/iR/qa5KHhM0IdjSKJ901q0ml+oHMxl+3c2J6X7Ort98uB4f2uGoRv7eLfcewRQzXHbHtFUf5VxmbjPcFCeZt1qP8E6bj8fj0t0t3hyo/GMHmQIj2P058oOlFsv5lT6Ovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAB+w2Kh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C291F00893;
	Fri,  5 Jun 2026 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780670433;
	bh=HBdEaxKJ/QaWxr/2mdJ3GwGXzFp8BgaoQqxpPy/Cpgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HAB+w2Kho16GGymIhaGe5gcuYH/Kd65BNSM7PWtW/9HpWhab9RYvn2qg0mrGXTyRy
	 rr9cURPmAh2E2CPwzX7JI76h9jDqwZ47+Njo+5WY7j01wCDdpzB6+BZPMeI0meBRUs
	 CHCroh7yfhWYtIxPixkdavdjIV1kCU5b+DxiAbRCmtj1YmbbOyrFJNwhtmAmcoFv4p
	 YChGrMdeB2HjIIeTIoPint6dghaOhpHGMlP0+p6Re5Yuqv9+R1Y6jd+/1AAyKyAgYQ
	 2pEZqgE8IMbiwUkEmRy6E8V8ePnkT83CH+NLQX1tBELC9fdBzo9kei+2rE4LlvAuKl
	 n53qncG7cbD+Q==
Date: Fri, 5 Jun 2026 09:40:32 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 10/14] dt-bindings: net:
 toshiba,tc9654-dwmac: add TC9564 Ethernet bridge
Message-ID: <20260605144032.GA3659201-robh@kernel.org>
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-11-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605010022.968612-11-elder@riscstar.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38012-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@kernel.org,m:netdev
 @vger.kernel.org,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80FEA648FAC

On Thu, Jun 04, 2026 at 08:00:17PM -0500, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
> bridges.
> 
> The TC9564 contains a PCIe switch with one upstream and three downstream
> PCIe ports.  The third PCIe downstream port has an attached embedded PCIe
> endpoint, and that endpoint implements two PCIe functions.  Each internal
> PCIe function has a Synopsys XGMAC Ethernet interface capable of 10 Gbps
> operation.
> 
> The TC9564 also implements an embedded GPIO controller, which exposes
> 10 lines externally.  Some platforms use these GPIO lines, so this
> GPIO controller is managed by a separate driver.  Other embedded
> peripherals (like a microcontroller, SRAM, and UART) are currently
> unused.
> 
> The GPIO controller is managed by registers accessed via MMIO on an
> internal PCIe function's registers.
> 
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
> new file mode 100644
> index 0000000000000..6e7a63dfcf86a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/toshiba,tc9564-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC956x Ethernet-AVB/TSN Controller
> +
> +maintainers:
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description: |
> +  The Toshiba TC9564 (and more generally, TC956x) incorporates a PCIe
> +  gen 3 switch with one upstream and three downstream ports.  The first
> +  two downstream ports are exposed externally, while the third is used
> +  by an internal PCIe endpoint.  The PCIe endpoint implements two PCIe
> +  functions, and attached to each of these is a 10 Gbps capable Synopsys
> +  Ethernet controller.
> +
> +  The TC956x additionally implements other internal IP blocks, and in
> +  particular it implements a GPIO controller.  Ten of the 35 GPIO lines
> +  implemented are exposed externally and are usable by the platform.
> +  It is platform-dependent whether the GPIO function must be exposed,
> +  and if it is, PCIe function 0 supplies it.
> +
> +              ----------------------------------
> +              |              Host              |
> +              ------+...+----------+........+---
> +                    |i2c|          |  PCIe  |
> +    ----------------+...+----------+........+------
> +    | TC956x        |I2C|          |upstream|     |
> +    |               -----        --+--------+---  |
> +    |  -----  ------  -------    | PCIe switch |  |
> +    |  |SPI|  |GPIO|  |reset|    |             |  |
> +    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
> +    |                 -------    ---++--++--++--  |
> +    |  -----  ------     downstream//    \\  \\   |  downstream
> +    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
> +    |  -----  ------   //PCIe port 3       \\     |
> +    |                  ||                   \======= downstream
> +    |  ----+-----------++-----------+----         |  PCIe port 2
> +    |  | M | internal PCIe endpoint | M |         |
> +    |  | S |------------------------| S |  ------ |
> +    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
> +    |  | G |function 0|  |function 1| G |  ------ |

I don't see nodes for these PCI functions. Boot this platform with 
CONFIG_PCI_DYNAMIC_OF_NODES enabled and use the resulting DT node 
structure. Anything else is wrong. This will give you the DTS:

dtc -O dts /proc/device-tree

The ethernet nodes should be just these PCI function nodes. You need to 
make the DWMAC PCI driver (stmmac_pci.c) bind to those 2 PCI devices. 
And really, a DT node for them should be completely optional (unless 
there's some power on ctrl needed).

Everything else like SPI, GPIO, UART, etc. should be under the PCIe 
switch upstream node in a pci-ep-bus.


> +    |  | E |----++----|  |----++----| E |         |
> +    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
> +    --------+.......+------+.....+-----------------
> +            |USXGMII|      |SGMII|
> +          --+.......+--  --+.....+--
> +          |  ARQ113C  |  | QEP8121 |
> +          |    PHY    |  |   PHY   |
> +          -------------  -----------
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
> +
> +  gpio:
> +    type: object
> +    description: Embedded GPIO controller
> +    $ref: /schemas/gpio/gpio.yaml#

gpio.yaml alone does not define a GPIO controller. How many #gpio-cells 
needs to be defined.

Is there no address associated with the controller? 

> +
> +  ethernet:
> +    type: object
> +    description: XGMAC Ethernet controller
> +    $ref: /schemas/net/ethernet-controller.yaml#
> +    properties:
> +      mdio:
> +        $ref: snps,dwmac.yaml#/properties/mdio

Either all of snps,dwmac.yaml should apply or none of it. Generally, we 
only reference whole schema files (OF graph being a notable exception).

> +    required:
> +      - mdio
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-device.yaml#
> +  - $ref: /schemas/pci/pci-bus-common.yaml#

These 2 are just pci-pci-bridge.yaml.

Rob

