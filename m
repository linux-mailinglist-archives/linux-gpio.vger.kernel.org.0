Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1B725EF57
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 19:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgIFRYH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 13:24:07 -0400
Received: from crapouillou.net ([89.234.176.41]:56808 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbgIFRYG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Sep 2020 13:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599413042; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k8j/AC8bV0KlcBb+vpqMlguXYyK8flN2OGzM6fHP+5E=;
        b=K6zL5CvyL0T0LzdAamKMDEVil1dY5X1bY7izxpPT2166tt954yhIurMC9TJZpuqD2iYMA/
        9F7Tk9qDHinvwd2OEoMIrJb64CX5djSplVGUdg2GAXXvRW+1HDttzpHmuuFii1P3Mv8RAC
        vwaNFxhy3qxo4iRZyFEI17wvr96M9LY=
Date:   Sun, 06 Sep 2020 19:17:09 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] pinctrl: Ingenic: Add SSI pins support for JZ4770
 and JZ4780.
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, aric.pzqi@ingenic.com,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Message-Id: <LOY8GQ.2OY4RM9U5CX13@crapouillou.net>
In-Reply-To: <0bdd7132-cdbf-02eb-0078-ec644b6611ca@wanyeetech.com>
References: <20200831154324.64951-1-zhouyanjie@wanyeetech.com>
        <20200831154324.64951-2-zhouyanjie@wanyeetech.com>
        <1QY4GQ.ER1P2TWMJCKH@crapouillou.net> <NDQ8GQ.2F1QH5XYPGSV1@crapouillou.net>
        <0bdd7132-cdbf-02eb-0078-ec644b6611ca@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Le lun. 7 sept. 2020 =C3=A0 1:09, Zhou Yanjie <zhouyanjie@wanyeetech.com> a=
=20
=C3=A9crit :
> Hi Paul,
>=20
> =E5=9C=A8 2020/9/6 =E4=B8=8B=E5=8D=8810:17, Paul Cercueil =E5=86=99=E9=81=
=93:
>> Hi Zhou,
>>=20
>> Le ven. 4 sept. 2020 =C3=A0 15:27, Paul Cercueil <paul@crapouillou.net>=20
>> a =7F=C3=A9crit :
>>> Hi Zhou,
>>>=20
>>> Le lun. 31 ao=C3=BBt 2020 =C3=A0 23:43, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zh=
ou Yanjie)=20
>>> =7F=7F<zhouyanjie@wanyeetech.com> a =C3=A9crit :
>>>> Add SSI pins support for the JZ4770 SoC and the
>>>> JZ4780 SoC from Ingenic.
>>>>=20
>>>> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@w=
anyeetech.com>
>>>> ---
>>>>=20
>>>> Notes:
>>>>     v1->v2:
>>>>     Rebase on top of kernel 5.9-rc3.
>>>>=20
>>>>  drivers/pinctrl/pinctrl-ingenic.c | 267=20
>>>> =7F=7F=7F=7F++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 267 insertions(+)
>>>>=20
>>>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
>>>> =7F=7F=7F=7Fb/drivers/pinctrl/pinctrl-ingenic.c
>>>> index a8d1b53ec4c1..00f29fd684fa 100644
>>>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>>>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>>>> @@ -633,6 +633,46 @@ static int jz4770_uart2_data_pins[] =3D { 0x5c,=20
>>>> =7F=7F=7F=7F0x5e, };
>>>>  static int jz4770_uart2_hwflow_pins[] =3D { 0x5d, 0x5f, };
>>>>  static int jz4770_uart3_data_pins[] =3D { 0x6c, 0x85, };
>>>>  static int jz4770_uart3_hwflow_pins[] =3D { 0x88, 0x89, };
>>>> +static int jz4770_ssi0_dt_a_pins[] =3D { 0x15, };
>>>> +static int jz4770_ssi0_dt_b_pins[] =3D { 0x35, };
>>>> +static int jz4770_ssi0_dt_d_pins[] =3D { 0x55, };
>>>> +static int jz4770_ssi0_dt_e_pins[] =3D { 0x71, };
>>>> +static int jz4770_ssi0_dr_a_pins[] =3D { 0x14, };
>>>> +static int jz4770_ssi0_dr_b_pins[] =3D { 0x34, };
>>>> +static int jz4770_ssi0_dr_d_pins[] =3D { 0x54, };
>>>> +static int jz4770_ssi0_dr_e_pins[] =3D { 0x6e, };
>>>> +static int jz4770_ssi0_clk_a_pins[] =3D { 0x12, };
>>>> +static int jz4770_ssi0_clk_b_pins[] =3D { 0x3c, };
>>>> +static int jz4770_ssi0_clk_d_pins[] =3D { 0x58, };
>>>> +static int jz4770_ssi0_clk_e_pins[] =3D { 0x6f, };
>>>> +static int jz4770_ssi0_gpc_b_pins[] =3D { 0x3e, };
>>>> +static int jz4770_ssi0_gpc_d_pins[] =3D { 0x56, };
>>>> +static int jz4770_ssi0_gpc_e_pins[] =3D { 0x73, };
>>>> +static int jz4770_ssi0_ce0_a_pins[] =3D { 0x13, };
>>>> +static int jz4770_ssi0_ce0_b_pins[] =3D { 0x3d, };
>>>> +static int jz4770_ssi0_ce0_d_pins[] =3D { 0x59, };
>>>> +static int jz4770_ssi0_ce0_e_pins[] =3D { 0x70, };
>>>> +static int jz4770_ssi0_ce1_b_pins[] =3D { 0x3f, };
>>>> +static int jz4770_ssi0_ce1_d_pins[] =3D { 0x57, };
>>>> +static int jz4770_ssi0_ce1_e_pins[] =3D { 0x72, };
>>>> +static int jz4770_ssi1_dt_b_pins[] =3D { 0x35, };
>>>> +static int jz4770_ssi1_dt_d_pins[] =3D { 0x55, };
>>>> +static int jz4770_ssi1_dt_e_pins[] =3D { 0x71, };
>>>> +static int jz4770_ssi1_dr_b_pins[] =3D { 0x34, };
>>>> +static int jz4770_ssi1_dr_d_pins[] =3D { 0x54, };
>>>> +static int jz4770_ssi1_dr_e_pins[] =3D { 0x6e, };
>>>> +static int jz4770_ssi1_clk_b_pins[] =3D { 0x3c, };
>>>> +static int jz4770_ssi1_clk_d_pins[] =3D { 0x58, };
>>>> +static int jz4770_ssi1_clk_e_pins[] =3D { 0x6f, };
>>>> +static int jz4770_ssi1_gpc_b_pins[] =3D { 0x3e, };
>>>> +static int jz4770_ssi1_gpc_d_pins[] =3D { 0x56, };
>>>> +static int jz4770_ssi1_gpc_e_pins[] =3D { 0x73, };
>>>> +static int jz4770_ssi1_ce0_b_pins[] =3D { 0x3d, };
>>>> +static int jz4770_ssi1_ce0_d_pins[] =3D { 0x59, };
>>>> +static int jz4770_ssi1_ce0_e_pins[] =3D { 0x70, };
>>>> +static int jz4770_ssi1_ce1_b_pins[] =3D { 0x3f, };
>>>> +static int jz4770_ssi1_ce1_d_pins[] =3D { 0x57, };
>>>> +static int jz4770_ssi1_ce1_e_pins[] =3D { 0x72, };
>>>>  static int jz4770_mmc0_1bit_a_pins[] =3D { 0x12, 0x13, 0x14, };
>>>>  static int jz4770_mmc0_4bit_a_pins[] =3D { 0x15, 0x16, 0x17, };
>>>>  static int jz4770_mmc0_1bit_e_pins[] =3D { 0x9c, 0x9d, 0x94, };
>>>> @@ -703,6 +743,46 @@ static int jz4770_uart2_data_funcs[] =3D { 0,=20
>>>> 0, };
>>>>  static int jz4770_uart2_hwflow_funcs[] =3D { 0, 0, };
>>>>  static int jz4770_uart3_data_funcs[] =3D { 0, 1, };
>>>>  static int jz4770_uart3_hwflow_funcs[] =3D { 0, 0, };
>>>> +static int jz4770_ssi0_dt_a_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi0_dt_b_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_dt_d_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_dt_e_funcs[] =3D { 0, };
>>>> +static int jz4770_ssi0_dr_a_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_dr_b_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_dr_d_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_dr_e_funcs[] =3D { 0, };
>>>> +static int jz4770_ssi0_clk_a_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi0_clk_b_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_clk_d_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_clk_e_funcs[] =3D { 0, };
>>>> +static int jz4770_ssi0_gpc_b_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_gpc_d_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_gpc_e_funcs[] =3D { 0, };
>>>> +static int jz4770_ssi0_ce0_a_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi0_ce0_b_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_ce0_d_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_ce0_e_funcs[] =3D { 0, };
>>>> +static int jz4770_ssi0_ce1_b_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_ce1_d_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi0_ce1_e_funcs[] =3D { 0, };
>>>> +static int jz4770_ssi1_dt_b_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_dt_d_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_dt_e_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi1_dr_b_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_dr_d_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_dr_e_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi1_clk_b_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_clk_d_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_clk_e_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi1_gpc_b_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_gpc_d_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_gpc_e_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi1_ce0_b_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_ce0_d_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_ce0_e_funcs[] =3D { 1, };
>>>> +static int jz4770_ssi1_ce1_b_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_ce1_d_funcs[] =3D { 2, };
>>>> +static int jz4770_ssi1_ce1_e_funcs[] =3D { 1, };
>>>>  static int jz4770_mmc0_1bit_a_funcs[] =3D { 1, 1, 0, };
>>>>  static int jz4770_mmc0_4bit_a_funcs[] =3D { 1, 1, 1, };
>>>>  static int jz4770_mmc0_1bit_e_funcs[] =3D { 0, 0, 0, };
>>>> @@ -763,6 +843,46 @@ static const struct group_desc=20
>>>> jz4770_groups[] =7F=7F=7F=3D =7F{
>>>>      INGENIC_PIN_GROUP("uart2-hwflow", jz4770_uart2_hwflow),
>>>>      INGENIC_PIN_GROUP("uart3-data", jz4770_uart3_data),
>>>>      INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow),
>>>> +    INGENIC_PIN_GROUP("ssi0-dt-a", jz4770_ssi0_dt_a),
>>>> +    INGENIC_PIN_GROUP("ssi0-dt-b", jz4770_ssi0_dt_b),
>>>> +    INGENIC_PIN_GROUP("ssi0-dt-d", jz4770_ssi0_dt_d),
>>>> +    INGENIC_PIN_GROUP("ssi0-dt-e", jz4770_ssi0_dt_e),
>>>> +    INGENIC_PIN_GROUP("ssi0-dr-a", jz4770_ssi0_dr_a),
>>>> +    INGENIC_PIN_GROUP("ssi0-dr-b", jz4770_ssi0_dr_b),
>>>> +    INGENIC_PIN_GROUP("ssi0-dr-d", jz4770_ssi0_dr_d),
>>>> +    INGENIC_PIN_GROUP("ssi0-dr-e", jz4770_ssi0_dr_e),
>>>=20
>>> The common acronyms associated with SPI are MISO / MOSI, I think it=20
>>> =7F=7Fwould make sense to use them instead of DR / DT. What do you=20
>>> think?
>>=20
>> Just noticed that the X1000 has already SPI pins named DR / DT, so=20
>> =7Fdisregard my comment, it's better to use the same name convention=20
>> =7Facross the whole file.
>>=20
>=20
> If necessary, I can send a patch to replace the dt/dr in X1000 and=20
> X1830. What is your opinion?

It would break ABI - there might be devicetree files out there that are=20
already using these names (although I doubt it), so not worth the=20
trouble. It's fine as it is.

-Paul


