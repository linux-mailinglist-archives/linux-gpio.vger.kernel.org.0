Return-Path: <linux-gpio+bounces-24755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4198B2FD26
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 16:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1575F1D21E35
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0982EDD49;
	Thu, 21 Aug 2025 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRWFxu/B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69E2E7F3F;
	Thu, 21 Aug 2025 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786517; cv=none; b=sEOx8Zn5Ds2KHZ8c2im3NGR+v8VF7vkP2/5WN7hl5enR5jn6ytyLAOE+zC4+VP9hyLTwcFO4D22zPXXSnApvmOnDSySRELzioN42aVlr/tBHABGK1u+v4LbAsSIYmqEtX9HvEuxu41pcAC7mDE0b5oTR/uv8+LE7unfyxVNM2oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786517; c=relaxed/simple;
	bh=EMbz8+HtiX+wFGU2pxupJmg8opMHOLpXmJiRY9CoOkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHRcQvlpNbOVndltqYFkaGlpKLAesjDtBAWIuUFgqRlqlP+aHexZ+UAGp8xHxDb4WbI1o5GLRzQb0qydk0RKSLJkkgMtlKuz1a0OwmW4Cgz4NqGUhb4AGATAGSiFRjxuI3TyZcm/2qTexoCdnWzCUkuXg/gwBtfHS/Yt6X19Qww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRWFxu/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B29C19425;
	Thu, 21 Aug 2025 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755786517;
	bh=EMbz8+HtiX+wFGU2pxupJmg8opMHOLpXmJiRY9CoOkI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cRWFxu/BPNpqodDqvt1FLl5BcGeujMeWAQcrQgctw9TvOthgFPwJv1EskTamU7fst
	 mQzi80HtrNlWRLg8/x71MRaPtHwEuWMxVGi67R1kGUrxlAA6QFv8jFd5QoSlaTNJc9
	 VsHsCf5X8u9pKEhGkTtbvc8EN3W6Ae2VU/fRH/Ow3b4FO95fADdG3ogjEWMdNd/lD/
	 MQ5A6HSKcraqM1G8VqbvE9p2wcJmdnN5Lcp9SHT1IF+AJxNJwqIz3ABs1IVIbYmzES
	 o/3J9fZQXk4/j33zoTvzyRiIXVcQsND7pDp6sn7sm1vM2daBOnRpjj8tQfvpxPSGjL
	 0VVxJB8bhvpIw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so2243276a12.3;
        Thu, 21 Aug 2025 07:28:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+x20Y+PsnfxC9k37MQQLbpSZirPWr8ydUr9xX74F/GbaJg5+fcqUYlauM9dIW2fzCMVMmjQPr@vger.kernel.org, AJvYcCUP49j4TgZCZ7h9FcC1KjbOon8RRi7SeR/ac96WFypXUbjB1AAo0e5pEoMdf9IipCA+Ml+SYAbjAOaQYB0=@vger.kernel.org, AJvYcCUcuPn2jZeAQXSs9ZPq9LW70oo0mTVYF+sTCMV/UOKNYM5PvnjPe861ArFJh9gjMOWPwSAjgDli7t65p54=@vger.kernel.org, AJvYcCUlTdFCrAgvjbHP6bmuMggi3iPOeiduZtibDETnwh2n7MJ5GoZpqRqtErsYmy0Gq333vQGECZhMF8kQ4ZQ=@vger.kernel.org, AJvYcCV9sBcHFRbihGWgc0nxUHkjdj1cnwl08WF8W2hqHHw+7BVGfYWEh4bK2/VrOrIW6S/R5pYrzxoL+KYz@vger.kernel.org, AJvYcCVce0ywP6wF/Jwx44DlbRT2yMiqp60+aGrjyhFpNM7RnBsx4Y4EvQy0EG5ULWMc/A6DBSLgxl+qr3cJpHoU@vger.kernel.org, AJvYcCWsGbRPb6gnze0u3cNVZFEaqNi8lQvh0MNW9Y0jGekMJ0NcBtNABQxBOWE/v6JXu2rF4cWH4G9NY5vo@vger.kernel.org, AJvYcCXuQimHS2Gi0AIgAiPK3MU+Z22Nul6ytz0C3FC8VoP/UpjdcqJPmfHFh6tcfQb+Eq0KoXl4zxvPVheqfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuPEb1BYhWn7jB14Ov2vu8frAwlOq9oZG6AMShUcEHJA0S148E
	6T9a298BTyRkgAYlRYWTR6LB6VEgPDg7XJhiPu3rEN5ANP8CLMtjWVMDLm8gYjioEgj9iUUAeFY
	WMRMLe9aGOwvHJ+HxHKRqCBA+wsXsew==
X-Google-Smtp-Source: AGHT+IFBppYBOkX44YlxMo5/Wkh7Q5eWgNuxdz5vrG5HqTxZPVhTa0iHjCUIJQBUOqi7fhL4+BSSlpYJWfsZYnSvbZ0=
X-Received: by 2002:a05:6402:1ece:b0:61a:9385:c798 with SMTP id
 4fb4d7f45d1cf-61bf8747b36mr1919506a12.37.1755786515468; Thu, 21 Aug 2025
 07:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com> <20250820171302.324142-5-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-5-ariel.dalessandro@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Aug 2025 09:28:23 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+K72Kof-Z3q2DSh3FKO64npLF6hDJnqnTzNBUoOoVQFA@mail.gmail.com>
X-Gm-Features: Ac12FXyETnp9uvywF5eryvs_DLFHAynyRYtV9sBUVnGCpXqqypbV2hkfxFtEdCo
Message-ID: <CAL_Jsq+K72Kof-Z3q2DSh3FKO64npLF6hDJnqnTzNBUoOoVQFA@mail.gmail.com>
Subject: Re: [PATCH v1 04/14] net: dt-bindings: Convert Marvell 8897/8997
 bindings to YAML
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	linus.walleij@linaro.org, louisalexis.eyraud@collabora.com, 
	maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, 
	pabeni@redhat.com, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 12:15=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
> Convert the existing text-based DT bindings for Marvell 8897/8997
> (sd8897/sd8997) bluetooth devices controller to a YAML schema.
>
> While here, bindings for "usb1286,204e" (USB interface) are dropped from
> the YAML definition as these are currently documented in file:
>
> - Documentation/devicetree/bindings/net/btusb.txt
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/net/marvell,sd8897-bt.yaml       | 91 +++++++++++++++++++

This needs to move to net/bluetooth/

>  .../bindings/net/marvell-bt-8xxx.txt          | 83 -----------------
>  2 files changed, 91 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/marvell,sd8897-=
bt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx=
.txt
>
> diff --git a/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml=
 b/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
> new file mode 100644
> index 0000000000000..6539868c08b8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/marvell,sd8897-bt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell 8897/8997 (sd8897/sd8997) bluetooth devices (SDIO)
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +

Needs a $ref to bluetooth-controller.yaml

> +properties:
> +  compatible:
> +    enum:
> +      - marvell,sd8897-bt
> +      - marvell,sd8997-bt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  marvell,cal-data:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      Calibration data downloaded to the device during initialization.
> +    minItems: 28

Just: maxItems: 28

> +
> +  marvell,wakeup-pin:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Wakeup pin number of the bluetooth chip. Used by firmware to wakeu=
p host
> +      system.
> +
> +  marvell,wakeup-gap-ms:

This unfortunately needs a uint16 type. That will cause a warning
which has to be fixed on the dtschema side.

> +    description:
> +      Wakeup latency of the host platform. Required by the chip sleep fe=
ature.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/pinctrl/rockchip.h>

Please drop this and just use a number below.

> +
> +    sdio0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        btmrvl: btmrvl@2 {
> +            compatible =3D "marvell,sd8897-bt";
> +            reg =3D <2>;
> +            interrupt-parent =3D <&gpio4>;
> +            interrupts =3D <RK_PD7 IRQ_TYPE_LEVEL_LOW>;
> +            marvell,wakeup-pin =3D /bits/ 16 <13>;
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&bt_host_wake_l>;
> +        };
> +    };

I would drop this example.

> +
> +    mmc3 {

mmc {

> +        vmmc-supply =3D <&wlan_en_reg>;
> +        bus-width =3D <4>;
> +        cap-power-off-card;
> +        keep-power-in-suspend;
> +
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        bluetooth: bluetooth@2 {

Drop the label.

> +            compatible =3D "marvell,sd8897-bt";
> +            reg =3D <2>;
> +            interrupt-parent =3D <&pio>;
> +            interrupts =3D <119 IRQ_TYPE_LEVEL_LOW>;
> +
> +            marvell,cal-data =3D /bits/ 8 <
> +                0x37 0x01 0x1c 0x00 0xff 0xff 0xff 0xff 0x01 0x7f 0x04 0=
x02
> +                0x00 0x00 0xba 0xce 0xc0 0xc6 0x2d 0x00 0x00 0x00 0x00 0=
x00
> +                0x00 0x00 0xf0 0x00>;
> +            marvell,wakeup-pin =3D /bits/ 16 <0x0d>;
> +            marvell,wakeup-gap-ms =3D /bits/ 16 <0x64>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt b/=
Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
> deleted file mode 100644
> index 957e5e5c2927c..0000000000000
> --- a/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -Marvell 8897/8997 (sd8897/sd8997) bluetooth devices (SDIO or USB based)
> -------
> -The 8997 devices supports multiple interfaces. When used on SDIO interfa=
ces,
> -the btmrvl driver is used and when used on USB interface, the btusb driv=
er is
> -used.
> -
> -Required properties:
> -
> -  - compatible : should be one of the following:
> -       * "marvell,sd8897-bt" (for SDIO)
> -       * "marvell,sd8997-bt" (for SDIO)
> -       * "usb1286,204e"      (for USB)
> -
> -Optional properties:
> -
> -  - marvell,cal-data: Calibration data downloaded to the device during
> -                     initialization. This is an array of 28 values(u8).
> -                     This is only applicable to SDIO devices.
> -
> -  - marvell,wakeup-pin: It represents wakeup pin number of the bluetooth=
 chip.
> -                       firmware will use the pin to wakeup host system (=
u16).
> -  - marvell,wakeup-gap-ms: wakeup gap represents wakeup latency of the h=
ost
> -                     platform. The value will be configured to firmware.=
 This
> -                     is needed to work chip's sleep feature as expected =
(u16).
> -  - interrupt-names: Used only for USB based devices (See below)
> -  - interrupts : specifies the interrupt pin number to the cpu. For SDIO=
, the
> -                driver will use the first interrupt specified in the int=
errupt
> -                array. For USB based devices, the driver will use the in=
terrupt
> -                named "wakeup" from the interrupt-names and interrupt ar=
rays.
> -                The driver will request an irq based on this interrupt n=
umber.
> -                During system suspend, the irq will be enabled so that t=
he
> -                bluetooth chip can wakeup host platform under certain
> -                conditions. During system resume, the irq will be disabl=
ed
> -                to make sure unnecessary interrupt is not received.
> -
> -Example:
> -
> -IRQ pin 119 is used as system wakeup source interrupt.
> -wakeup pin 13 and gap 100ms are configured so that firmware can wakeup h=
ost
> -using this device side pin and wakeup latency.
> -
> -Example for SDIO device follows (calibration data is also available in
> -below example).
> -
> -&mmc3 {
> -       vmmc-supply =3D <&wlan_en_reg>;
> -       bus-width =3D <4>;
> -       cap-power-off-card;
> -       keep-power-in-suspend;
> -
> -       #address-cells =3D <1>;
> -       #size-cells =3D <0>;
> -       btmrvl: bluetooth@2 {
> -               compatible =3D "marvell,sd8897-bt";
> -               reg =3D <2>;
> -               interrupt-parent =3D <&pio>;
> -               interrupts =3D <119 IRQ_TYPE_LEVEL_LOW>;
> -
> -               marvell,cal-data =3D /bits/ 8 <
> -                       0x37 0x01 0x1c 0x00 0xff 0xff 0xff 0xff 0x01 0x7f=
 0x04 0x02
> -                       0x00 0x00 0xba 0xce 0xc0 0xc6 0x2d 0x00 0x00 0x00=
 0x00 0x00
> -                       0x00 0x00 0xf0 0x00>;
> -               marvell,wakeup-pin =3D /bits/ 16 <0x0d>;
> -               marvell,wakeup-gap-ms =3D /bits/ 16 <0x64>;
> -       };
> -};
> -
> -Example for USB device:
> -
> -&usb_host1_ohci {
> -    #address-cells =3D <1>;
> -    #size-cells =3D <0>;
> -
> -    mvl_bt1: bt@1 {
> -       compatible =3D "usb1286,204e";
> -       reg =3D <1>;
> -       interrupt-parent =3D <&gpio0>;
> -       interrupt-names =3D "wakeup";
> -       interrupts =3D <119 IRQ_TYPE_LEVEL_LOW>;
> -       marvell,wakeup-pin =3D /bits/ 16 <0x0d>;
> -       marvell,wakeup-gap-ms =3D /bits/ 16 <0x64>;
> -    };
> -};
> --
> 2.50.1
>

