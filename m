Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98354444D4B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 03:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhKDCdS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 22:33:18 -0400
Received: from smtpcmd11116.aruba.it ([62.149.156.116]:46942 "EHLO
        smtpcmd11116.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhKDCdR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Nov 2021 22:33:17 -0400
Received: from smtpclient.apple ([146.241.216.221])
        by Aruba Outgoing Smtp  with ESMTPA
        id iSWPmxR5yumo4iSWQmmgHU; Thu, 04 Nov 2021 03:30:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1635993037; bh=DZRFcy1A7pDPfjI/xc1yZ9deWpS/ap+fHvhGYQj6qt8=;
        h=Content-Type:From:Mime-Version:Subject:Date:To;
        b=N8Q8E/6Lo/V5C07x9Zz6934M8WwsfhWu8eM5yC4g709131ZDfKQ+D2c5MBrLa7p8x
         ru3wUQY9WIsXCbt/L2HiBHbiQGWmNkrQ2mWW0vwk8VXfTuQrwLsgXeT195gWsUWpov
         p5zFaVPIfEUSAGvculvT1gtSBlOeQk96cGl9ilrpLS2B8aF1nxxbK01xJlW+7xnLOT
         2UPvC5XV3ecGPXATf3UDklKW0SAkWIVa3mZKJ1keCBTn8Ps60mWQzWRHT+8F3Ky78r
         pA6IcEVkF4LDaFay0QoPvnCvQQjDNS6/yFtI72vD1ggnsBccLyiEgan2HHuiryO3cT
         AVHBkNzusU5dQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series
Date:   Thu, 4 Nov 2021 03:30:33 +0100
Message-Id: <B67A91BD-DAE9-468B-8731-251DE86E6B5B@benettiengineering.com>
References: <YYMx28VvhR7nvMlt@robh.at.kernel.org>
Cc:     Jesse Taube <mr.bossman075@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org
In-Reply-To: <YYMx28VvhR7nvMlt@robh.at.kernel.org>
To:     Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfA6GKfpXsRSNdwkIFTYQmUTZuqvvSqJg+QZ+U7tg2NH81o4pATFmJwAt9hr+3r2mNiS/sSK61vhtevF2cYqatJs6yFEDZMD5XAiD/Unil39uyjcDlR+E
 BcLXaIVZu4wKmq7xHmquyZQ9nQ3yxwcQ9iSgSki4StzrrvVTODPwjlAoDCbWXg3JeXCnJwf3N31U3quzLH0FFn7keK841utBPTSj8wFLVizEXBcybktsurWu
 vSAWrJVMfzQJqsZjAI+23fH9DD1GDdIZHmy8iAaNO/xA2EsVETe3uYkP9zIQ/2BrIcFaspiY7pBtb7q/CxnBA6dW4FakqGWyck2+HEEgVE6IyxDF4EA5AgX4
 vRQ4K7lOSHYLeJzs/ufxTJ/mMseghKr4wcjElkIZ7eP2XiQdLMNJJVZo0/OefdLTDhZY1+/rnybjvoSWOVgxCGmHfL9yn8FTO9pUA5hNE6JPVQ2MDMweeWb0
 G+5dsKEqJMQ4Mum9W+ibAj27IXt7E1u94i+Saple09dGbLXkIYWuDasXHmdEJdJobZ0xw4TF993iGYYhmRF1XYqJ9EfAU2t+X1Zrhw8KR7r2+1zASXyJhIyM
 vFn0oMrkO3YrgpxLciN1aigouwRBienWmrH22H404ZC2j5dCWnGRWg81fZE/F3hTFmCade+L94a9w45sR8gUGR6zdYeYndCEy9mlCsPRM0FoMiHqmoquhS/4
 7H1mmZz/dkqjG0dTNCLwDTR5d36gxqYxBWJb7N4W16x9E3tpaIxefOBUddegq0TPjAOla3W5UsdCMojSjykEsi4aOj57KIpNDgE7kMNRSsU3F37BESUaPTh9
 K3NgAhha3vddkCcY3pZ1YQ0QdxIrxSxM3K1ghN1U0pGG7/1T2cJ7Llfyva+k7TeMnDBBs0OV4f27BaCakDrK0CxFN1WjJmWUvm2+dBfQzwlxEANSxS9Urs3E
 RMhlMRxuU/4Ua8NvOM98GwPGVJF0No5AZb+M3grJE22WMJIFMw9RfciVdeleM15p9AcbsN6JdtHOaELVhDCxubtWKXnENjFT/Yg+Ju2qq6LUk0KtwtBnQr8N
 BCSy73MRVwLhTUucDQcoIUon2spbaJDehjTz12VXFJ+PYw7RSXKGvdT/t3XmqQiiXvoRt71Z4lN5yuyulmkB5laNulworHZJU94=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Rob, Jesse, All,

> Il giorno 4 nov 2021, alle ore 02:05, Rob Herring <robh@kernel.org> ha scr=
itto:
>=20
> =EF=BB=BFOn Wed, Nov 03, 2021 at 12:30:17AM +0100, Giulio Benetti wrote:
>> Hi Fabio, Jesse, All,
>>=20
>>> On 11/3/21 12:25 AM, Jesse Taube wrote:
>>>=20
>>>=20
>>> On 11/2/21 19:17, Fabio Estevam wrote:
>>>> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wr=
ote:
>>>>=20
>>>>>   static struct esdhc_soc_data usdhc_imx8qxp_data =3D {
>>>>>          .flags =3D ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
>>>>> @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[=
] =3D {
>>>>>          { .compatible =3D "fsl,imx7ulp-usdhc", .data =3D &usdhc_imx7u=
lp_data, },
>>>>>          { .compatible =3D "fsl,imx8qxp-usdhc", .data =3D &usdhc_imx8q=
xp_data, },
>>>>>          { .compatible =3D "fsl,imx8mm-usdhc", .data =3D &usdhc_imx8mm=
_data, },
>>>>> +       { .compatible =3D "fsl,imxrt-usdhc", .data =3D &usdhc_imxrt_da=
ta, },
>>>>=20
>>>> I thought Rob suggested to use the SoC name, so this would be:
>>>>=20
>>> Uh i think that may have been for the UART.
>>>> { .compatible =3D "fsl,imxrt1050-usdhc", .data =3D &usdhc_imxrt1050_dat=
a, },
>>>>=20
>>>> The same applies to the other bindings in the series.
>>>>=20
>>>> This way it would be possible to differentiate between future
>>>> supported i.MX RT devices.
>>>>=20
>>> This makes sense will do in V3.
>>>=20
>>=20
>> If we add every SoC we will end up having a long list for every device
>> driver. At the moment it would be 7 parts:
>> 1) imxrt1020
>> 2) imxrt1024
>> .
>> .
>> .
>> 7) imxrt1170
>=20
> You don't need a driver update if you use a fallback. When you add=20
> the 2nd chip, if you think it is 'the same', then you do:
>=20
> compatible =3D "fsl,imxrt1024-usdhc", "fsl,imxrt1050-usdhc";
>=20
> That requires no driver update until the driver needs to handle some=20
> difference. And when there is a difference, you don't need a DT update.

This solution is pretty fine, we=E2=80=99re going with that then, for this a=
nd every driver involved.

Thank you for pointing us.

Best regards
Giulio Benetti
Benetti Engineering sas

>=20
> You could make "fsl,imxrt-usdhc" the fallback from the start if you are=20=

> adverse to the first way.
>=20
> Rob

