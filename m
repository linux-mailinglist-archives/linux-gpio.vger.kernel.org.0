Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85B225EE2F
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 16:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbgIFOaQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 10:30:16 -0400
Received: from crapouillou.net ([89.234.176.41]:49254 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728910AbgIFO1Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Sep 2020 10:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599402405; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KMIg6gSjoUBBkt1vAul5NwvJlELxUbfxEDSLNOU8Bco=;
        b=I3kztgB55Yjx2lb2vme0LIw94rJJmvRipu9FG+441WmmD/Awg+Rs/Ynyv0MDsvP5DuwIS1
        TxYrsN9sM0A9Ytpf5bUa9VrA5yPlAnFm+g6dN6KGBDG/RnFzjrbZl3NOLW2u4Y0xkMm1zA
        5+JRvk5g9r3z6g1k+0aSJJCP7R/QZ6Y=
Date:   Sun, 06 Sep 2020 16:26:34 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/3] pinctrl: Ingenic: Correct the pullup and pulldown
 parameters of JZ4780
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, aric.pzqi@ingenic.com,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Message-Id: <ASQ8GQ.DEHG1O3SW93A3@crapouillou.net>
In-Reply-To: <20200831154324.64951-3-zhouyanjie@wanyeetech.com>
References: <20200831154324.64951-1-zhouyanjie@wanyeetech.com>
        <20200831154324.64951-3-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Zhou,

Le lun. 31 ao=C3=BBt 2020 =C3=A0 23:43, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Y=
anjie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Correct the pullup and pulldown parameters of JZ4780 to make them
> consistent with the parameters on the datasheet.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v2:
>     New patch.
>=20
>  drivers/pinctrl/pinctrl-ingenic.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 00f29fd684fa..ae7b8876d3b4 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -1035,6 +1035,14 @@ static const struct ingenic_chip_info=20
> jz4770_chip_info =3D {
>  	.pull_downs =3D jz4770_pull_downs,
>  };
>=20
> +static const u32 jz4780_pull_ups[6] =3D {
> +	0x3fffffff, 0xfff0f3fc, 0x0fffffff, 0xffff4fff, 0xffff7b7c,=20
> 0x7fa7f00f,
> +};

PE15 has a pull-up in my datasheet.

The rest looks good.

Cheers,
-Paul

> +
> +static const u32 jz4780_pull_downs[6] =3D {
> +	0x00000000, 0x000f0c03, 0x00000000, 0x0000b000, 0x00000483,=20
> 0x00580ff0,
> +};
> +
>  static int jz4780_uart2_data_pins[] =3D { 0x66, 0x67, };
>  static int jz4780_uart2_hwflow_pins[] =3D { 0x65, 0x64, };
>  static int jz4780_uart4_data_pins[] =3D { 0x54, 0x4a, };
> @@ -1301,8 +1309,8 @@ static const struct ingenic_chip_info=20
> jz4780_chip_info =3D {
>  	.num_groups =3D ARRAY_SIZE(jz4780_groups),
>  	.functions =3D jz4780_functions,
>  	.num_functions =3D ARRAY_SIZE(jz4780_functions),
> -	.pull_ups =3D jz4770_pull_ups,
> -	.pull_downs =3D jz4770_pull_downs,
> +	.pull_ups =3D jz4780_pull_ups,
> +	.pull_downs =3D jz4780_pull_downs,
>  };
>=20
>  static const u32 x1000_pull_ups[4] =3D {
> --
> 2.11.0
>=20


