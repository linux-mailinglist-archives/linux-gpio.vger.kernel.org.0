Return-Path: <linux-gpio+bounces-4651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190D088CB22
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 18:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C8881C60701
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 17:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C6E1CFBB;
	Tue, 26 Mar 2024 17:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="PTLoOMzB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1005C1CF9B;
	Tue, 26 Mar 2024 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474887; cv=none; b=e+PvoBU2y9wsleIBpwtmsPJVPG5CLTUdwMosnYFqrgbMBmDQNkYpRBg82nFdiJQOiAghZwTxtf2fA4t97K+ligZbQ9M9BhcVZ19rOx3fPheyTnlPcC5L2LMbotVjhzr5a0IERVlRhI9EuXvjllYpp4Bike/rA8EvXL9ST7ujVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474887; c=relaxed/simple;
	bh=FcCiRFq4/D2KsdqGVj5h6wLR5Zz9DlYGXxZ3bEr2Kbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2eSLZFfLcthy+Dnw/yuvv1UBYs+ddX+5L7D/QJDwixJUK4gi4MD04+8yNHCbAFw7jAnR1cetuWVcJCzmy3TYEHaAZtP+JIc9xUrMc0LCmwos68ydP5q+k781yBmDp57z/WZlC2obUUE49sYGyXkkUoX+BdiOxpgqjt5NOqycl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=PTLoOMzB; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711474854; x=1712079654; i=wahrenst@gmx.net;
	bh=Twv0HdwGpjdmBx7foIRQFga4TAVjmfZL9+Kw8jNlZcU=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=PTLoOMzBjzCKcjfzHU3Z3eW2hqFJzKkfr3zaiw4T4lNvZFuCif3MELQ1RNkT7Hp3
	 K3VTFoxpNKO9gWN6sjZ+H/0l6MaT/Pi/WTI54RLxP1uMUPxF9CCE72486te7kCa/P
	 9TxJeVwublL3ieEVKc+Vzzc/W0ie6vS96Mc8rzoWJq1QPKKz29Q81/9r4PjDE1tdC
	 Zn3/XxOwdGIKb90M1H/q6csRBzzHyI2X8zHHEK3TmqR5l5rQRuKdVUnnS41SiHJhU
	 rDn0NhmXhySzhJ79Zzu63kpRfV9y9LF4teaZGUarPg3dD02ty+O/r61cI3T/TRsCl
	 o4ekimgGvSOucRfc9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1sCtwq08La-00OmKH; Tue, 26
 Mar 2024 18:40:54 +0100
Message-ID: <e6334490-501c-4967-a48b-168868acfd39@gmx.net>
Date: Tue, 26 Mar 2024 18:40:52 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware:
 Add missing properties
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rob Herring <robh@kernel.org>,
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
 <45242028-edf7-49fc-80bf-be9eb242b4cd@gmx.net>
 <20240326171837.GB17067@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240326171837.GB17067@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HJKiDLda4cA/48N67K/UZZDCEYpr996JqZbsldO9pfxQBWT3hJ4
 793Rq/KAU+tc5/s48TOPFeVXDaKVKhWrihKF32b6BwrLkaRgSEibe45/T3zSRFScId9HT08
 QyZA3n/6AggfkNVYTheR8Kd2TZpxxr/BI3TBYyaVSneToGpKA7gHLfdwPI/AsoC6uus7Lg0
 0iyIAnpPqxQ5um1O/iNCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9XViSxL8z9c=;Rg4+LKVfNLuJzLCp2hG8hBE4iq5
 4CJVbFOkpOCBAoOlpRg/R+eElhlFpt8578nijsaR6blDPH89uXqwuKZK5Q8uSevh5OALJJO9i
 jexiNcJE3PUFimRGRx36FtsnmBrSASIRZnjKF6I2/r6canyLcIVGwV9jFQLusytQOGyMx2qh2
 vqZJNK+E7i99eeEZsEXj/T+oACwP90myYkVVOzIJeHp35u4tzjsS7tK4REacZSNk7q/sMq70Z
 S/mg+nZxMm8Huq74ctX5LYZ6AswM+rJljgZfUirgRXjCELzQj53DPZ3CYuysdRZz+nrsEwLoM
 f7+hsiFcohaADUFdK4b54xq9OE9UV9pYLafF9UrRobh9RroJxSj2+hhIY0fgtsPkykrvjBcvz
 ON05O1qz4FaBywifMQ3bU/WmoD101uaVnz87RnJ5deyvBq8QnJN6TLp/CDu1A0Z3OgPr+5Jms
 9HRCcSzSBitcEdLti8fquGlj1ngVT19ngA0opG2VYU8HxgE/p9f14EPWbGEdgFCBtk4KiH6hF
 VcwnW4r9UJHzTpvIEgFfNNHrotnRgWfak7cb4HImXNvdiFsyE4OY77r11sIr/EdfNMnge5/+3
 L/GGaYpZ8mWNO5fbgq9r17BTCmr+MARxz8zBUL6SA8jQH+5YI4rbugoGHFmrBGKzLFLQ9d7oF
 WsdsxPFglJ/YHE3guaPzgrXKRvbQje3TibXKnzPvIUIgjzATYpHYZppohNLY3LXGbD1W7WQGF
 lzoHupz39eOKtxE/PdbpmZqbcb4rizdTELlMSNchgcw6jA6TqnoDe8kbaiQuSXN7418t0KUqV
 svWd9S/cgULSzyBnwtLa4WEwBDRn9p19TBHLZRUqDl7ME=

Am 26.03.24 um 18:18 schrieb Laurent Pinchart:
> On Tue, Mar 26, 2024 at 12:47:34PM +0100, Stefan Wahren wrote:
>> [add Dave since he's working on DMA for Raspberry Pi 4 and maybe have a
>> opinion about this]
>>
>> [drop Emma Anholt old address since she is not involved anymore]
>>
>> Am 26.03.24 um 08:06 schrieb Krzysztof Kozlowski:
>>> On 26/03/2024 01:49, Laurent Pinchart wrote:
>>>> The raspberrypi,bcm2835-firmware devices requires a dma-ranges proper=
ty,
>>>> and, as a result, also needs to specify #address-cells and #size-cell=
s.
>>>> Those properties have been added to thebcm2835-rpi.dtsi in commits
>>>> be08d278eb09 ("ARM: dts: bcm283x: Add cells encoding format to firmwa=
re
>>>> bus") and 55c7c0621078 ("ARM: dts: bcm283x: Fix vc4's firmware bus DM=
A
>>>> limitations"), but the DT bindings haven't been updated, resulting in
>>>> validation errors:
>>>>
>>>> arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: firmware: '#address=
-cells', '#size-cells', 'dma-ranges', 'gpio' do not match any of the regex=
es: 'pinctrl-[0-9]+'
>>>>           from schema $id: http://devicetree.org/schemas/arm/bcm/rasp=
berrypi,bcm2835-firmware.yaml#
>>>>
>>>> Fix this by adding the properties to the bindings.
>>>>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Children do not perform any IO on their own, because everything is
>>> handled by parent. It is really odd to see dma-ranges without ranges.
>>> Referenced commits might be also wrong.
> Comunication with the firmware goes through a mailbox interface, which
> uses DMA transfers. See for instance
>
> rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
> {
> 	u32 message =3D MBOX_MSG(chan, data);
> 	int ret;
>
> 	WARN_ON(data & 0xf);
>
> 	mutex_lock(&transaction_lock);
> 	reinit_completion(&fw->c);
> 	ret =3D mbox_send_message(fw->chan, &message);
> 	if (ret >=3D 0) {
> 		if (wait_for_completion_timeout(&fw->c, HZ)) {
> 			ret =3D 0;
> 		} else {
> 			ret =3D -ETIMEDOUT;
> 			WARN_ONCE(1, "Firmware transaction timeout");
> 		}
> 	} else {
> 		dev_err(fw->cl.dev, "mbox_send_message returned %d\n", ret);
> 	}
> 	mutex_unlock(&transaction_lock);
>
> 	return ret;
> }
>
> int rpi_firmware_property_list(struct rpi_firmware *fw,
> 			       void *data, size_t tag_size)
> {
> 	size_t size =3D tag_size + 12;
> 	u32 *buf;
> 	dma_addr_t bus_addr;
> 	int ret;
>
> 	/* Packets are processed a dword at a time. */
> 	if (size & 3)
> 		return -EINVAL;
>
> 	buf =3D dma_alloc_coherent(fw->cl.dev, PAGE_ALIGN(size), &bus_addr,
> 				 GFP_ATOMIC);
> 	if (!buf)
> 		return -ENOMEM;
>
> 	/* The firmware will error out without parsing in this case. */
> 	WARN_ON(size >=3D 1024 * 1024);
>
> 	buf[0] =3D size;
> 	buf[1] =3D RPI_FIRMWARE_STATUS_REQUEST;
> 	memcpy(&buf[2], data, tag_size);
> 	buf[size / 4 - 1] =3D RPI_FIRMWARE_PROPERTY_END;
> 	wmb();
>
> 	ret =3D rpi_firmware_transaction(fw, MBOX_CHAN_PROPERTY, bus_addr);
>
> 	rmb();
> 	memcpy(data, &buf[2], tag_size);
> 	if (ret =3D=3D 0 && buf[1] !=3D RPI_FIRMWARE_STATUS_SUCCESS) {
> 		/*
> 		 * The tag name here might not be the one causing the
> 		 * error, if there were multiple tags in the request.
> 		 * But single-tag is the most common, so go with it.
> 		 */
> 		dev_err(fw->cl.dev, "Request 0x%08x returned status 0x%08x\n",
> 			buf[2], buf[1]);
> 		ret =3D -EINVAL;
> 	}
>
> 	dma_free_coherent(fw->cl.dev, PAGE_ALIGN(size), buf, bus_addr);
>
> 	return ret;
> }
>
> fw->cl.dev is the device for the firmware child node. That may be where
> the problem comes from, shouldn't we use the mailbox device for DMA
> mapping ?
>

 From devicetree perspective this is the mailbox DT part [1] and this
the matching dt-binding [2].

[1] -
https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm/boot/dts/broadco=
m/bcm283x.dtsi#L100
[2] -
https://elixir.bootlin.com/linux/v6.9-rc1/source/Documentation/devicetree/=
bindings/mailbox/brcm,bcm2835-mbox.yaml

