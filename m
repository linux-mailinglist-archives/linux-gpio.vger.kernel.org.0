Return-Path: <linux-gpio+bounces-8546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2759462E0
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 20:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFB5F1F216FA
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 18:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E00165EE7;
	Fri,  2 Aug 2024 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="CAOOp2Py"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE8B15C145;
	Fri,  2 Aug 2024 18:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622174; cv=none; b=MQR/TjriCroWgzPe/5Ixteidtzih3L6bnF9AkzBbv+IvLMzbjlggr7//3ohUGjNXt22V5cWf7ngwSzsOvBQLO2mPSMjCXSTIvMyTavmm2aFEdv2Fr16MY7wM9c556UN6HMiPNDx4c4vOMlH1owXEQbU2vIxVtBztovQGi2P1JSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622174; c=relaxed/simple;
	bh=63taoprHUoM1wWqbF0vQX24VCyWny7xmFX7DPitrGQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYwfMsTJFTmUa9Qzxn3DviLSYZvBnuVXruQT9s05w3OuHXfpltpMyafg/Q7lHg2GGAkdPBhNfnYAyK+RLCtKu68KhRsqk5SFs4DUrsFx7/m2Tnhec8I+YtAICysFzJlbx+I4deMPsxEueLpXCY52GE+i+jTmzBS3Ox+RZQtDWQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=CAOOp2Py; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722622157; x=1723226957; i=wahrenst@gmx.net;
	bh=dQd9LubES5a0X1Zb8zT31m5nR5MPgg5QjYdJeg3LV+8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CAOOp2Py79+/I8XZv0QhC0CwGF9KnGFHo4mulPrRiY1S86FW31y+Fkme2Z7a/JCi
	 ctRfuo0BuQS+fVpiVR7SjzeaDl6wEv+6KVjQXwrE881TLdckqTusECiPNkLErVc+r
	 dK1Xnp9nUGyoHTeFk7G885zkhQwXhOQXIPhQKef8Bs403cXmV/vMQkWVqVpUS2KEF
	 oi8LPzesy7VLFwRfZGnqqxCcXtLBnyKdOLaAu6tuh1yrsTsvyqyQ4uA4CtJhlKR29
	 QWjbVF9tfKwayxhSYJnXiDwOTi5nC75qXPTuy7ZpkRUXHGzflctBNrimD2ZPTAKWT
	 2HSb1u1obwHt4OiqBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6qC-1rolSz2Kcu-00dM7u; Fri, 02
 Aug 2024 20:09:17 +0200
Message-ID: <200d54a3-bedf-4bd3-bb7f-0d834c43ea78@gmx.net>
Date: Fri, 2 Aug 2024 20:09:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller
To: "Ivan T. Ivanov" <iivanov@suse.de>, kernel-list@raspberrypi.com,
 florian.fainelli@broadcom.com, andrea.porta@suse.com
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh@kernel.org, linus.walleij@linaro.org
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-2-iivanov@suse.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240731062814.215833-2-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QwB1aX5a63jum2EWptOzfeijiA9+mROhvakEsfWi62MVArvvgTx
 UPNlC6inXTlyQGM2I3Xh9V4SZ2Kl7ouypero0sM8T2I79iqN9SNQFkUOqdrRFeZ9AdfwzCx
 e0Z70nIPPi+BECLe7PJy4JlEJzU6f8QDVfDxdPrQbbtJHtEe+4YTbMgEYLc/JAU1bomfASA
 4VpW237YUMi8V3EfQ3/sA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5A8IXd+3JPE=;aOfge7evHe82z3dxluroDE6SK27
 tH7/xA+z9bEqUq5ES6H3PcH2KZ/Ci2J/KzLIYpYFD28ikXOU4U4u9SD26o33mRSCtn7IK2OjU
 3sZvpIS469+vqV3J5nnnvTs6CJcsrePinyR86nwrGlk/zCOdOAdGc5F8nIldRLQoU1GcqxT3E
 l3iEZZ0qL6RWqcGRGxV5rEAdFpbXTNTyiLEj1pRyEq+PQkaxl5XegzY9texphruaayNFvCcOL
 tASOLf0BjAptmc7Ynn+F/YAPflJhFBgrvz6WyoMZmLHcsuzAMJC/UCe7V8InN6AZ5qgdnQ9AE
 u7pljs956QOG1Jfduyd1rNU9TiyeZl0h592SJx/kwcjniiwN22phAzkPeoUXwT+5l2u/uj/qu
 qnxs7k6ThNU5lGiNsZsbCXHQ1XZpHtxCBiDxhzR8tLAWNVTbyrr0MW/LESz5L3ZEjkDsREulT
 gMrHBsqQH9FMiBE6eTpmrKJsmbuPULCGSJeBAnu21Ta21BwPOc2KQprvYkNAC2PDOB0pwEKJ+
 zKQ/BvKF6i57JaAPf/i0NsbpC2R7JlaN2h3MwW/nuHVAEyDzsHknpPeFzGqTkw3AfcqSAwk3X
 Rb5rF3HWXS1xvO+ubriaN79e4g3N6UgHLZWs3wbZ/H1Kge+dKA41aMMz28FlvjE3SQFEMzLT9
 eiuMgmqXm6sBo8auxw1nf2vSkPeg3uS248LNsEQ9270JF5I0tWiCbjk1D3hlEi8CapTC9bYus
 agNgX0m2tg5e6qcLXueyFUw9PaszfGYxVYEFrKLzpQs68+eDBvxqT+Av0eyhsE8r5K8+42ZTl
 dPnLfOA4QYO1ggfY8b6xLZKTTfwwPz91x9kUY+2r/0TIM=

Hi,

[add official Raspberry Pi kernel developer list]

Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> It looks like they are few revisions of this chip which varies
> by number of pins. Perhaps not all of them are available on the
> market. Perhaps some of them where early engineering samples,
> I don't know. I decided to keep all of them just in case.
The BCM2711 had also some revisions and we avoided successfully multiple
versions of the RPi 4B DTS. So it would be nice if someone can explain
if C0 & D0 are available in the market? Otherwise we may end up with
multiple versions of the RPi 5 DTS.

I'm missing an explanation in the commit message, what's the difference
between brcm,bcm2712-pinctrl and brcm,bcm2712-aon-pinctrl?

According to the driver brcm,bcm2712-pinctrl is the same as
brcm,bcm2712c0-pinctrl. So the former is more a fallback?

Thanks
>
> Cc: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>   .../pinctrl/brcm,brcmstb-pinctrl.yaml         | 73 +++++++++++++++++++
>   1 file changed, 73 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,brcm=
stb-pinctrl.yaml
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.=
yaml
> new file mode 100644
> index 000000000000..c5afdb49d784
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yam=
l
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom STB family pin controller
> +
> +maintainers:
> +  - Ivan T. Ivanov <iivanov@suse.de>
> +
> +description:
> +  Broadcom's STB family memory-mapped pin controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm2712-pinctrl
> +      - brcm,bcm2712-aon-pinctrl
> +      - brcm,bcm2712c0-pinctrl
> +      - brcm,bcm2712c0-aon-pinctrl
> +      - brcm,bcm2712d0-pinctrl
> +      - brcm,bcm2712d0-aon-pinctrl
> +
>

