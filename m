Return-Path: <linux-gpio+bounces-12567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E065F9BCDF7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 14:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F69E28334F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 13:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FEB1D7E46;
	Tue,  5 Nov 2024 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="H2x8aTqt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C991D6DD1;
	Tue,  5 Nov 2024 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730813692; cv=none; b=GZ9oLStBZbXuHVAwI8FwA0jx22j0qTl//lQBywKqauYgXs47j9n9Y9n45GOHeWjo1YoW+XSgDfd8dsDrOBMO1GmLv+zA0eGvTZxgm4CnMNAjspb0l1y+lbWHrw0I4s1Fj1T34I7KWzTME6GJV6HExYn7Ane2rwJdRIeac1SaTF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730813692; c=relaxed/simple;
	bh=3wjFrl9fs9cJnx1W+rEd1Kdu1dvILXiWPVoP33XIYb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efU/Oxnr2hrDQ/dfPlrLv2EYQOF1YR2feTlitasVPF+BQMHIA2l365nrd7TP7nw/59T+qJDUdmyJ30Yrg/kwXpZqgfOLvN+6fddtfzgQFXWM/ScOXK8Uf6jGDXgjmEZdHGuu+EpMU1MGVdzl9lAAmS4Px8hec0VrRzTII9yeVs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=H2x8aTqt; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [192.168.1.107] (87-97-112-21.pool.digikabel.hu [87.97.112.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5372D88CEC;
	Tue,  5 Nov 2024 14:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730813688;
	bh=mFlJcbl3DlbfwuDN87mdbDM9flef9BgUD38InRXLEwQ=;
	h=Date:Subject:To:Cc:References:Reply-To:From:In-Reply-To:From;
	b=H2x8aTqtlPBSwXW4aaq1VQwaAQgR7Z+au0bqVyCYgRJiwEo33knSb3Dq2BAf1eTA+
	 Qp4Gr63fZTuX4Sjfae9+D9aR7hW3pSH6VyynQ0C1tqF/B+GfQtx6BXO7RZmoiTKffD
	 7CBsm2ovA0Bu+0GfQxTpB3w/h8YY1UYEeNhJZKzqqvq19lFFiJm/UwuJpJr2ch3YYN
	 AgUMIbPt6fhzC7DxIbnp0cwr9R++G15V5ItS3yzuSJt7buTaj23O++4ZNp/mFlbnXH
	 rTqBS1Oqq5w5uZoW0XRZBo79pzZyT2qmnjc0v5OG8SO59YjcNzjgeIpLCbuCudyXwQ
	 8JYkuP2X1eVwg==
Message-ID: <c8ebdc70-759e-d51a-d63e-00898ef59d1e@denx.de>
Date: Tue, 5 Nov 2024 14:32:19 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/3] arm64: dts: imx8mp: add support for the ABB SoM
 and carrier
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Mathieu Othacehe <m.othacehe@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Hiago De Franco <hiago.franco@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Shawn Guo <shawnguo2@yeah.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>, imx@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org,
 Michael Walle <mwalle@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org
References: <20241105064206.43626-1-hs@denx.de>
 <173081219627.3053080.8796298549026571114.robh@kernel.org>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <173081219627.3053080.8796298549026571114.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Hello Rob,

On 05.11.24 14:11, Rob Herring (Arm) wrote:
> 
> On Tue, 05 Nov 2024 07:42:03 +0100, Heiko Schocher wrote:
>> The board uses an ABB specific SoM from ADLink, based on NXP
>> i.MX8MP SoC. The SoM is used on 3 different carrier boards,
>> with small differences.
>>
>> series is based on:
>> 819837584309 - (tag: v6.12-rc5, origin/master, origin/HEAD) Linux 6.12-rc5
>>
>> patches are now checked with
>>
>> make W=1 dt_binding_check
>> make W=1 dtbs_check
>> make W=1 CHECK_DTBS=y {for each dtb introduced in this series)
>>
>> as Krzysztof suggested.
>>
>> Changes in v3:
>> added Reviewed-by from Krzysztof
>> - worked in comments from Krzysztof
>>    gpio-line-names should match the actual number of
>>    gpios of the device.
>> - added comments from Shawn Guo
>>    removed unneeded new lines
>>    sort nodes, properties alphabetical
>>    rename pcie0-refclk -> clock-xxx
>>    used GPIO_ACTIVE_HIGH instead of 0
>> - added comments from Fabio Estevam
>>    instead of settting each brightness-level in
>>    brightness-levels add num-interpolated-steps
>> - changes from me
>>    fix gpio-line-names for semtech gpio controller
>>    in imx8mp-aristainetos3-proton2s.dts as patch
>>    "dt-bindings: pinctrl: sx150xq: allow gpio line naming"
>>    of this series adds the dtb checks for them and 17 entries
>>    needed now.
>>
>> Changes in v2:
>> reworked the compatible strings for ABB imx8mp based boards
>> called dtb checks, no errors for this patch
>> patch dt-bindings: pinctrl: sx150xq: allow gpio line naming new in v2
>> - worked in comments from Krzysztof
>>    - removed unneeded dtbos and build now dtbs for each
>>      carrierboard.
>>    - removed user spidev entries, as I do not know the
>>      real spi devices connected to...
>>    - call dtb check targets as described in cover letter
>>      and fixed warnings except warnings see below:
>> not fixed dtb check warnings
>> - pci (warning pops up for each new dtb from this patch, but
>>    also for a lot of other boards, which are already in tree)
>> imx8mp-aristainetos3-adpismarc.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
>>          from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> imx8mp-aristainetos3-adpismarc.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
>>          from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> - proton2s dtb specific:
>>    - rs485
>>      imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:0: 0 is not of type 'array'
>>          from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
>>      imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:1: 0 is not of type 'array'
>>          from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
>>      imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: Unevaluated properties are not allowed ('linux,rs485-enabled-at-boot-time', 'rs485-rts-active-low', 'rs485-rts-delay' were unexpected)
>>          from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
>>      do not see, what I am doing wrong, also rs485 works fine
>>    - led driver
>>      imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
>>      I use the comaptible entry used in drivers/leds/leds-tlc591xx.c
>>      Ah, may because file
>>      Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
>>      is not converted to yaml?
>>    - pinctrl driver
>>      adding 'gpio-line-names' leads in a warning as this property
>>      is not checked yet (and so a warning is dropped).
>>      add this check in new patch
>>      dt-bindings: pinctrl: sx150xq: allow gpio line naming
>>      in v2
>>
>> Heiko Schocher (3):
>>    dt-bindings: arm: fsl: Add ABB SoM and carrier
>>    dt-bindings: pinctrl: sx150xq: allow gpio line naming
>>    arm64: dts: imx8mp: add aristainetos3 board support
>>
>>   .../devicetree/bindings/arm/fsl.yaml          |    9 +
>>   .../bindings/pinctrl/semtech,sx1501q.yaml     |   43 +
>>   arch/arm64/boot/dts/freescale/Makefile        |    5 +
>>   .../imx8mp-aristainetos3-adpismarc.dts        |   37 +
>>   .../imx8mp-aristainetos3-helios-lvds.dtso     |  113 ++
>>   .../freescale/imx8mp-aristainetos3-helios.dts |   98 ++
>>   .../imx8mp-aristainetos3-proton2s.dts         |  161 +++
>>   .../imx8mp-aristainetos3a-som-v1.dtsi         | 1107 +++++++++++++++++
>>   8 files changed, 1573 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dts
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
>>
>> --
>> 2.20.1
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y freescale/imx8mp-aristainetos3-adpismarc.dtb freescale/imx8mp-aristainetos3-helios.dtb freescale/imx8mp-aristainetos3-proton2s.dtb' for 20241105064206.43626-1-hs@denx.de:
> 
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']

Yep, reason I explained above in commit comment:

 >>    - led driver
 >>      imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to 
match any schema with compatible: ['ti,tlc59108']
 >>      I use the comaptible entry used in drivers/leds/leds-tlc591xx.c
 >>      Ah, may because file
 >>      Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
 >>      is not converted to yaml?

So the compatible entry is fully okay, just the check is poping up,
as yaml file is missing...

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

