Return-Path: <linux-gpio+bounces-25766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D380AB49A67
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 21:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80084205EB9
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D382D5C67;
	Mon,  8 Sep 2025 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="WuspcEjl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A21D1E231E;
	Mon,  8 Sep 2025 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757361364; cv=pass; b=HiW8rPVPUhv3jc8h7fHLTG3RNp82HmE8E/A9VlS9nwydj7vi3c1qHk6jyKAbcByqf0vCo6yzIxZW1MxBQ9mckQNvee5TLHL9MIH+tcaNPq1c2EZVjocQZOsSoJf+H7wGyggwpUh9CocZqPuubtHC5GVnczP2h+AV/mIwif/2RPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757361364; c=relaxed/simple;
	bh=MWpV4A2WRkUfqblRPidOKOMyFxPO/XuuQrBHbl8uMQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUxeZUZLouoAhqIhaVJAaz7Pb0Gw1Dslw9ChUD7T+y+XI0WEgU7fRF1IRFSHg4aCRLVLBNkisnIGTh3HcJL1DjnNL6vm+YErA2a8xnASXxcmUJmNy4I4xOd0el2ejuFIVEUdRq2e4RjGebPsTQnGAv00jnzOn+AnU5Z4tFb6Amk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=WuspcEjl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757361303; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mUzmnkI7ls4AvpKk9PkLBBYeCu+pH9kCHwMoKRU9mS8Va3Rk3P1EnjIukFHIQ1sAgt4nQPlbPOXlK83kFmYc2xVS75KjHCPk94ELyPusE++ff8czzuFzys66QYc4l6TbNekfLo+fBNe1sVSwmyurSAX0CZXICiNB/U581LhcNrU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757361303; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M/VFSbxaoCdLjJSeyTwHsH+gRgpx/aAWpUtZlGe7uGk=; 
	b=BaZlsaht09RzyFGIw897Zk6xphgJqy43DTSQKT9TkRm0X5MkO3meBCJ4cTbsHdUbbD2SEdI/5kc03gzpBrHIl+mADS6abfJXQtNg+5HPGSQoyur59mlSQ7Ia3ZhxJAtvYUVT99Q1iWwbwHsF4hvHTz/xFr1r9Snnsvu9tXKFPY0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757361303;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M/VFSbxaoCdLjJSeyTwHsH+gRgpx/aAWpUtZlGe7uGk=;
	b=WuspcEjlUBylmJh1B0BghZqg5B6vUEjxtdYtMYSmMk6RsbTPP0bLHXw0NlWAcceJ
	xsO8L1flgUuEeUGRtXTkjsV0T9f76hnyQvEhLCzhzUA5H4Yt1V6Miux3sq5qAOgM9B+
	4LA1qn9GmOhsgJZge5/qJBesfNjPEAzNODbFUE/w=
Received: by mx.zohomail.com with SMTPS id 1757361302113105.67245372545813;
	Mon, 8 Sep 2025 12:55:02 -0700 (PDT)
Message-ID: <0b1d77ab-7b39-4764-9f0c-4b4a15aa0e56@collabora.com>
Date: Mon, 8 Sep 2025 16:54:46 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/14] net: dt-bindings: Convert Marvell 8897/8997
 bindings to YAML
To: Rob Herring <robh@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com,
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com,
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com,
 krzk+dt@kernel.org, kuba@kernel.org,
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com,
 linus.walleij@linaro.org, louisalexis.eyraud@collabora.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
 simona@ffwll.ch, support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-5-ariel.dalessandro@collabora.com>
 <CAL_Jsq+K72Kof-Z3q2DSh3FKO64npLF6hDJnqnTzNBUoOoVQFA@mail.gmail.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <CAL_Jsq+K72Kof-Z3q2DSh3FKO64npLF6hDJnqnTzNBUoOoVQFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Rob,

On 8/21/25 11:28 AM, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 12:15 PM Ariel D'Alessandro
> <ariel.dalessandro@collabora.com> wrote:
>>
>> Convert the existing text-based DT bindings for Marvell 8897/8997
>> (sd8897/sd8997) bluetooth devices controller to a YAML schema.
>>
>> While here, bindings for "usb1286,204e" (USB interface) are dropped from
>> the YAML definition as these are currently documented in file:
>>
>> - Documentation/devicetree/bindings/net/btusb.txt
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../bindings/net/marvell,sd8897-bt.yaml       | 91 +++++++++++++++++++
> 
> This needs to move to net/bluetooth/

Ack.

> 
>>   .../bindings/net/marvell-bt-8xxx.txt          | 83 -----------------
>>   2 files changed, 91 insertions(+), 83 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml b/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
>> new file mode 100644
>> index 0000000000000..6539868c08b8a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/marvell,sd8897-bt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Marvell 8897/8997 (sd8897/sd8997) bluetooth devices (SDIO)
>> +
>> +maintainers:
>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> +
> 
> Needs a $ref to bluetooth-controller.yaml

Ack.

> 
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - marvell,sd8897-bt
>> +      - marvell,sd8997-bt
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  marvell,cal-data:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description:
>> +      Calibration data downloaded to the device during initialization.
>> +    minItems: 28
> 
> Just: maxItems: 28

Ack.

> 
>> +
>> +  marvell,wakeup-pin:
>> +    $ref: /schemas/types.yaml#/definitions/uint16
>> +    description:
>> +      Wakeup pin number of the bluetooth chip. Used by firmware to wakeup host
>> +      system.
>> +
>> +  marvell,wakeup-gap-ms:
> 
> This unfortunately needs a uint16 type. That will cause a warning
> which has to be fixed on the dtschema side.

Yeah, that's what I thought but wasn't sure on the proper solution. Will 
fix in v2.

> 
>> +    description:
>> +      Wakeup latency of the host platform. Required by the chip sleep feature.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/pinctrl/rockchip.h>
> 
> Please drop this and just use a number below.

Ack.

> 
>> +
>> +    sdio0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        btmrvl: btmrvl@2 {
>> +            compatible = "marvell,sd8897-bt";
>> +            reg = <2>;
>> +            interrupt-parent = <&gpio4>;
>> +            interrupts = <RK_PD7 IRQ_TYPE_LEVEL_LOW>;
>> +            marvell,wakeup-pin = /bits/ 16 <13>;
>> +            pinctrl-names = "default";
>> +            pinctrl-0 = <&bt_host_wake_l>;
>> +        };
>> +    };
> 
> I would drop this example.

Agreed.

> 
>> +
>> +    mmc3 {
> 
> mmc {

Ack.

> 
>> +        vmmc-supply = <&wlan_en_reg>;
>> +        bus-width = <4>;
>> +        cap-power-off-card;
>> +        keep-power-in-suspend;
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        bluetooth: bluetooth@2 {
> 
> Drop the label.

Ack.

Thanks a lot for your feedback and help!
Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


