Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2F0443B94
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 03:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhKCCvh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 22:51:37 -0400
Received: from smtpcmd11117.aruba.it ([62.149.156.117]:35086 "EHLO
        smtpcmd11117.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbhKCCvg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 22:51:36 -0400
Received: from smtpclient.apple ([146.241.216.221])
        by Aruba Outgoing Smtp  with ESMTPA
        id i6KdmWeslumo4i6KdmXOCm; Wed, 03 Nov 2021 03:48:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1635907738; bh=vn0en0EIlHgkPwPZZERx136vgq1/nmIMJ6ZT4dkZqag=;
        h=Content-Type:From:Mime-Version:Subject:Date:To;
        b=J9naTf+IAohR2xOuGFgEzMfooC6CT8nvH3rCcxEWgk4ynOkf9Na/5Aqb8CB1TYo6O
         E72mOAH0K6Haxm+L3WXrEe/q9WMjDSlZd5pngARGRVwsq1+tUy5onszIqxfCDTHDSw
         FJqY5awdjZXgfm/Z33r99rSTvYbfrSaei0yvkgo895UNDUgzzsfwvlsL4GZT5zf8g4
         mlgBpKAQEB6xb/Nih89L56sQBD2benwgBCFHMJXdhbWd1w9XRNB2i+f+KJ5UaLAXax
         xyAM63MAPZlAmH/xCTEiZZWeY0G7t6TrNo2hUg29dncGJPIvgBy6Z765r06VGFHqS3
         /ZU34wbBbftfA==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
Date:   Wed, 3 Nov 2021 03:48:54 +0100
Message-Id: <D0A3E11F-FEDE-4B2D-90AB-63DFC245A935@benettiengineering.com>
References: <CAL_JsqJR6EfDsmwPmXxgdaC1GB7CLGYpjmDnOkD_f53Frsq6LA@mail.gmail.com>
Cc:     Jesse Taube <mr.bossman075@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Anson Huang <b20788@freescale.com>,
        Fugang Duan <fugang.duan@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
In-Reply-To: <CAL_JsqJR6EfDsmwPmXxgdaC1GB7CLGYpjmDnOkD_f53Frsq6LA@mail.gmail.com>
To:     Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfATmIMv5GA3j34nA+iOgc1h+7L3tNW3abl9oCE6PZB8OMXI5H3mb85Frc03sGYy21FlO+oJkV4yTBbwgW5Rj/0du+RvtJQeN4d3pTWoUGmPhXXFYvLcV
 QNuPaJZ09aPj0+mshEem7c3H/dDtmBF6Js+GbUpl3X77ZVu54p7RysYHkjD72LZmj1H9nrKMau+2FU6gAH8OfwkJcqu+K/QuRnCIGQyGPr3XRSCMWIAeXcnh
 14cBS5S+yv55Rx3kGkl8t/GASJe4FVaWXcwh2TmSlklGOJv0BnitVeN15pb+g3w02oFJrUgKwPJ60fOGTuEBSmuaWhDSUp0BnITKWVtU8NWjCdg22E/rK3ua
 UvuthcK4Gt+pMHdeNuelu7OQNeUa4osFW/xmS2SqnXAjQ/zXPIoKDZ9wYTW69+lVlUjcEQaQSIL5cDlAWhgyLYe58s0lVB+PUteYTjf5XPopnlNbF4BlhSUn
 1703ZYebBfSnDYcMuwywTgcke/l6oZOuiSXUAER9Kw+NQDUTm6vTA1zd63V6/2mI8V6fIuErDfUgGhwidKoWGZgy8w0lMux5lnPF152l3b+t+PRXsgoo8Fup
 vyE5oPOG87RvxafyxS+PGYtiDRSgb5g6gBK+6HKCBnCITIepAP0MxaYELLdoZIxHd2jQNXlyEXbPoapsLfCN839NHGj5xtHTF+RdCX6xRJLv7QbeBGv2lxdk
 WQuMJJl1glCO71l/9HImQMgssA4qHKsCwrUS4eVH4UwdhuKJRRfzXYZJNepCANMb5jUUomkTVI3BMVMYPLFcPn2lylrtW6uuvCzwHaPbLJuHEchajyGi9mPy
 cNs/j1wljxUbrkXF2DSbjxuGxED1hrUDrV4auoDE5lUYgSroodiTneWziQtrRVB/JzYl4C6iYazCH18QbLDLZc0W24SBjADnoy2c3JaRoN05Me4ZYOFsc4Lp
 Rc/MtcuLY1/6kPE7+x4/Pu0oLxAPRi9gvMjOAn+TcU4p3/lAW2Cj8/Kzy9ZtRUlfltDpjFZJDqdxAgCh7oCj9sIreifIVrSwfCx6JcENijeCT6gpQ4OzTaxq
 mwcnYVUpvxOA21nMdUUvMEJlVoadyglqlr9tgcp/tZNlXbX2jPakmS1Bx/8Q/gOFJTP6kTQF5NkXBVxbUWxgSoRnllcDGy2LlCt2WmbbdKWGh7d8jt98gwJD
 czQA9XU4BZVnndLpD6YTF4YbKlfBqXsPIzN57bT3ahyvfyxxMEVyQ+no+RY503EiVcfZf3vMJa6jb/9lw3xxrA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Rob, Jesse, All,

> Il giorno 3 nov 2021, alle ore 01:49, Rob Herring <robh@kernel.org> ha scr=
itto:
>=20
> =EF=BB=BFOn Mon, Nov 1, 2021 at 6:34 PM Jesse Taube <mr.bossman075@gmail.c=
om> wrote:
>>=20
>>=20
>>=20
>>> On 11/1/21 16:13, Rob Herring wrote:
>>> On Sun, Oct 24, 2021 at 11:40:22AM -0400, Jesse Taube wrote:
>>>> Add i.MXRT documentation for compatible string.
>>>>=20
>>>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>>>> ---
>>>> Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>>>> 1 file changed, 1 insertion(+)
>>>>=20
>>>> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b=
/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
>>>> index a90c971b4f1f..4b4340def2aa 100644
>>>> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
>>>> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
>>>> @@ -21,6 +21,7 @@ properties:
>>>>           - fsl,ls1028a-lpuart
>>>>           - fsl,imx7ulp-lpuart
>>>>           - fsl,imx8qm-lpuart
>>>> +          - fsl,imxrt-lpuart
>>>=20
>>> Actually, 'rt' is not a single part is it? If the variations are same
>>> die, but fused off then no need to distinguish. Otherwise, these should
>>> be SoC specific.
>>>=20
>> I don't exactly know what "but fused off" means I would assume
>> disconnected but on-die?
>=20
> Right. Or not pinned out is another possibility.
>=20
>> The imxrtxxx is a series that has the same UART
>> controller across them. Should I add ACK?
>=20
> Looking at the errata docs briefly, there's at least 2 die as some of
> the errata docs give the mask id. So they aren't necessarily 'the
> same'.

Thank you for pointing, we=E2=80=99ve missed this particular.

> You want the compatible strings to be specific enough to handle
> any differences or errata. If you only care about the imxrt1050, then
> I'd just use that and move on.

We plan to add from imxrt1020 to imxrt1170 and eventual new SoC, so we defin=
itely need separate
.compatible strings.

@Jesse, can you please update with =E2=80=98fsl,imxrt1050=E2=80=9D?

> Otherwise, maybe someone from NXP wants
> to comment?

Any NXP comment is welcome!

Best regards
Giulio Benetti
Benetti engineering sas

>=20
> Rob

