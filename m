Return-Path: <linux-gpio+bounces-29914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C7CDF80B
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 11:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 756723003061
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 10:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9672A243956;
	Sat, 27 Dec 2025 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="S82G0n9a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49233.qiye.163.com (mail-m49233.qiye.163.com [45.254.49.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D1833EC;
	Sat, 27 Dec 2025 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766831858; cv=none; b=EOWz09fP2FkVNQh6iO/NPK3qk4DmkH3Mhpgipf/LlcFbHZWAptDgTWXT4RCYEutQRsR2rsUTGycFPZBcs067nL9YFCqYRYqbErV7SGGxrcvruT+z6tTfyIlvpwnjJJOBVwt0S8VBXebzAdPIcdFIsBy0cSLDFpBkQDl4uEonPOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766831858; c=relaxed/simple;
	bh=gZFPHMAazmQJ9ZQkJ9BKBAW3nhx2gVwHprBVP/u1KBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxzesURfT7zFPq+SJ0ygdLAES/k3NmIOVc07b/ixUgk+gkfRQtnXReoVeT2tDDaQMSiIfIseKWDIxnq2pChlum81LWGewb65AR9xyUglhqN7iSP5c+6UoCH47f02o1+2oy6fQGQHQn+85MUgeYZVQliLhc4lpFclqrjcM2avRmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=S82G0n9a; arc=none smtp.client-ip=45.254.49.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.16] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2eb991a79;
	Sat, 27 Dec 2025 10:40:46 +0800 (GMT+08:00)
Message-ID: <85032ae4-4d82-4884-aa7c-b69fee76d509@rock-chips.com>
Date: Sat, 27 Dec 2025 10:40:45 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com>
 <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
From: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b5dae0c4309d8kunm0072215ab85e90
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxPS1YZTk9IGR4YS0IeQxpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=S82G0n9alxeC/lJ7wczOryWq01BiBFxbD/UAUrYkHAT5q4Gw2jqum7W2VTN3FnmUURwmsfRZc3tjkMpsZjWkngiChIgVP7F+9x/NHNkMdbaMClH28qqiyG9ICq1N0tgwznp1JGm03WC2sw9P7+SpBCDRE95qATcYzcGMl0OO1j8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=O4w+UFBbBnd7fGgwKE2LjjzpfQNimm6h/LQPdpbH+AY=;
	h=date:mime-version:subject:message-id:from;


在 2025/12/27 2:07, Linus Walleij 写道:
> Hi Ye,
>
> thanks for your patch!
>
> On Tue, Dec 16, 2025 at 3:50 PM Ye Zhang <ye.zhang@rock-chips.com> wrote:
>
>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
>> +  rockchip,rmio-grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      The phandle of the syscon node (GRF or PMU) containing the RMIO registers.
>> +      This property is required if the RMIO registers are located in a different
>> +      syscon than the parent pinctrl node.
>> +
>> +  rockchip,offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The offset of the RMIO configuration registers within the GRF.
> Can't this just be a cell in the phandle?
In my upcoming v4, it will be moved into the driver code.
>> +  rockchip,pins-num:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The number of physical pins supported by this RMIO instance.
>> +      Used for boundary checking and driver initialization.
> Isn't this implicit from the compatible? Why is this different
> between two device trees using the same compatible pin
> controller? I don't get it, I think this should be a constant in the
> code based on the compatible instead.
In my upcoming v4, it will be moved into the driver code.
>> +patternProperties:
>> +  "^[a-z0-9-]+$":
>> +    type: object
>> +    description:
>> +      Function node grouping multiple groups.
>> +
>> +    patternProperties:
>> +      "^[a-z0-9-]+$":
>> +        type: object
>> +        description:
>> +          Group node containing the pinmux configuration.
>> +
>> +        properties:
>> +          rockchip,rmio:
>> +            $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +            description:
>> +              A list of pin-function pairs. The format is <pin_id function_id>.
>> +            minItems: 1
>> +            items:
>> +              items:
>> +                - description: RMIO Pin ID (0 to pins-num - 1)
>> +                  minimum: 0
>> +                  maximum: 31
>> +                - description: Function ID
>> +                  minimum: 0
>> +                  maximum: 98
> Please avoid these custom properties and just use the standard
> "pinmux" property. I don't want any more opaque custom bindings
> for functions and groups.
>
> Reference Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> and use pinmux from there.
>
> You can use some shifting and defines to shoehorn your config
> into a single u32 and parse that in your driver; i.e. instead of
> rockchip,rmio = <1, 2>;
> use
> pinmux = <1 << 8 | 2 << 0>;
> these shifter numerals can come from defines.
> In the driver shift & mask out the components you want.
>
> e.g.;
>
>> +            rmio-uart {
>> +                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
>> +                    rockchip,rmio = <27 RMIO_UART1_TX>;
> pinmux = <27 << 8 | RMIO_UART1_TX>;

In v4, I will remove rockchip,rmio.yaml

I understand your preference for standard bindings.  However, there is a 
specific constraint here: the RMIO acts as a secondary layer of muxing, 
sitting behind the primary IOMUX controller.

The existing Rockchip pinctrl binding uses the vendor-specific 
rockchip,pins property for the primary IOMUX configuration.  If I were 
to use the standard pinmux property for RMIO, the node would contain 
mixed bindings like this:

node {
     /* Primary IOMUX (existing binding) */
     rockchip,pins = <1 RK_PB1 16 &pcfg_pull_none>;
     /* Secondary RMIO  */
     pinmux = <(RMIO_ID << 16) | (RMIO_PIN << 8) | RMIO_FUNC>;
};

Since this node describes a single hardware pin configuration that 
requires two separate hardware settings (Primary Mux + Secondary RMIO), 
I thought keeping the secondary config as a vendor-specific property 
(rockchip,rmio) alongside rockchip,pins would be more consistent and 
less confusing than mixing legacy custom bindings with standard pinmux.

In v4, I have removed the separate RMIO child node entirely.  The RMIO 
configuration is now integrated into the main pinctrl group as a 
supplemental property:

node {

rockchip,pins = <1 RK_PB1 7 &pcfg_pull_none>

/* rmio_id pin_id func_id */
rockchip,rmio-pins = <0 24 68>;
};

>
>> +++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> These number dumps are not appreciated inside the bindings
> despite quite a few found their way in there.
>
> Use something like
> arch/*/dts/rockchip/rk3506-rmio-pins.dtsi
> and include that into your device trees instead.
In my upcoming v4, rockchip,rk3506-rmio.h will be removed.

