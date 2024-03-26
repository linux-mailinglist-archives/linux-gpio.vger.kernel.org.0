Return-Path: <linux-gpio+bounces-4635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2740588C122
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 12:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FFB4B21F91
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 11:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F325A0FC;
	Tue, 26 Mar 2024 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Tdux0Hp8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925325810C;
	Tue, 26 Mar 2024 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711453675; cv=none; b=Rusve/FtOfyFA3bEjNuG8e7FLKZ0bm2NszWLjkCyjvDGbZCaMCydLBQY1/bw+NmkKh+OLQflXWuibVKlipG+xoSb03pwfRtNavGMnFm2dvAc5PjWDBz1exCT2Wm1c4GWTIIFM29c0lrfiKqLJi+SJ57WQteRaCmAa8TBRqUrmso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711453675; c=relaxed/simple;
	bh=mLLbzPWqXCShXr+6AYIKfaKc6jG654PC5mrnkOY5qLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dh1LO6/niZfxqwRArG5IkBO7Mgv5pQAaEKgPOrL7viT2UiYS6v9t3wtr3Pn6HlZMsznfQN3XQZdXJX8apUz9f5jBMKw/DYVEUrzQ9IDivPKUgZisEwjV3zXxiwI5rOwskh7F2+Pxk9gn1qOvo4/lC31WOWN8g9jFyS1WqOnu3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Tdux0Hp8; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711453655; x=1712058455; i=wahrenst@gmx.net;
	bh=N6f/j1hvugJht7nU9PzJXYDvvBRoYWFcCZF6PpD/4A4=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Tdux0Hp8WrZs8vQwzzU2WIcKwlFlMpe10zN/x+4b/w2NPCjET8am4A1YVJ+cj1Nl
	 jV+eF5TsMyKhPoFmwwPX+/GUSKz7BCRVtr9xe6MlUvU7MlS1i1svk6AzebvtfzJ4X
	 6GdqIxv8RlPQrXr6tWmh+g7uLaIQVxJxyEDOD0VYiDyGGi1erGX1ZshT0bfJA/BBM
	 mKY9zlSycTD9J/r07KA1SknnB2kx/+qTmL6fsiIzy+b17QA2Xb9ZsZA/hnpsxmCKF
	 3BpA5uw5GSF/K3tIuYoO5KC2b7HQvJHCPn6PMt0d6baaR+6/dVUP4or1BCPRnsXuv
	 7aEZS6KtlW8ltSlcZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUZ4-1seazL2bsa-00pxzP; Tue, 26
 Mar 2024 12:47:35 +0100
Message-ID: <45242028-edf7-49fc-80bf-be9eb242b4cd@gmx.net>
Date: Tue, 26 Mar 2024 12:47:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware:
 Add missing properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
 <20240326004902.17054-2-laurent.pinchart@ideasonboard.com>
 <6cc81b1a-12e6-4d81-b6c4-6297c213d5c9@linaro.org>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <6cc81b1a-12e6-4d81-b6c4-6297c213d5c9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sFkdjVxCxLwEVxvh/tMZQaKz5ESRm5BSy2RVwrcpgn94EW6rDMF
 MgjIxThREM+jSIeNikhvlM6hc20tbtghCFeqBPBp/CC87HLg6yIYMPPo6nj49r0nvhdClnB
 OtjFwLNVFblYviI+QYwtQ66Mbw93s65DkgHvPTcWaL0bEygYj/qDl6cQlyRbAiPViDXoMRI
 tr5KUXHJPGnct51TMTwEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0IOOzE2zISY=;VoanODvOF82VvAMZfHgxHNEhRsQ
 kGIqhjczfnvsix0gw1AqbFR/C1o8tnGyJ1zguFXXUcljDWlIG8pTJ1hN3BHWt/f78FceP3qFT
 yKb5ZmVi+bP876lO2crq3q/xNR2+CwMcWBCXJ8dXlS90Us2za+OcCDfY0o9/u1/6sK1Eb+lu5
 eCKc2+FD6R0YpYJpbSNTjC4JbGCYZAofDSaCJl3qIvQXJmF46ju/WAWZm7ftQSYFT5JTHe1sv
 fPCcbHAWHjJEHj9B/o8l62Jx6gt8WnMct+cAyVAFm1AoZStAfhfgozs6IPPUZI7z045cs9y1N
 3Y3BEN7wjEDi3kVm47GHqlJGYOO7Z9RBXqfcHtiJuhT1ZaWY2kIAyBRp6gdy6kzngqT3O4RLB
 WbDNOo/R7VwldgYRCoLndC0IMw8b7qKxq/3hwb0hQDmAbfN7iWWOko+QeHRv38WAJ2wldi9TW
 4tl1Pod957l3EU58xlkoYTkCNltiJ0B5McNbvdDud4Ue5xavfc/kfbCRAtIniG7rELqX5mJjX
 GtjRrPCj5S7IJ3k/CqXtAzUX4c4VRUujFVI8R5tI/efIIxn6v88KKVGOt1tTJT74lWJOryv+S
 PXZeOC+P9jLKUqJyOE0R4akT1eeSexePlq3wiARwo5tDOOYwgPOXEJOMbkClXbYhMwa55DNAf
 1B4pZAgWuaKZxXm3TmhOKzcdUeum+tjY3+6WQr7L1UWFTWWOcPn4XLy487YYLhlgImjfQg1VO
 6AAYQpPnZ1aWNr9gFj+Vr7xOWNy6VlUPWUIRekydAffVCAWl/4vwhS5o29CgbkV+eIT+7LGsA
 7BZTMfbdIcbemOvFzhuuJe9963YiyfpBWads29zVsRfbM=

[add Dave since he's working on DMA for Raspberry Pi 4 and maybe have a
opinion about this]

[drop Emma Anholt old address since she is not involved anymore]

Am 26.03.24 um 08:06 schrieb Krzysztof Kozlowski:
> On 26/03/2024 01:49, Laurent Pinchart wrote:
>> The raspberrypi,bcm2835-firmware devices requires a dma-ranges property=
,
>> and, as a result, also needs to specify #address-cells and #size-cells.
>> Those properties have been added to thebcm2835-rpi.dtsi in commits
>> be08d278eb09 ("ARM: dts: bcm283x: Add cells encoding format to firmware
>> bus") and 55c7c0621078 ("ARM: dts: bcm283x: Fix vc4's firmware bus DMA
>> limitations"), but the DT bindings haven't been updated, resulting in
>> validation errors:
>>
>> arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: firmware: '#address-c=
ells', '#size-cells', 'dma-ranges', 'gpio' do not match any of the regexes=
: 'pinctrl-[0-9]+'
>>          from schema $id: http://devicetree.org/schemas/arm/bcm/raspber=
rypi,bcm2835-firmware.yaml#
>>
>> Fix this by adding the properties to the bindings.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Children do not perform any IO on their own, because everything is
> handled by parent. It is really odd to see dma-ranges without ranges.
> Referenced commits might be also wrong.
>
> Best regards,
> Krzysztof
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


