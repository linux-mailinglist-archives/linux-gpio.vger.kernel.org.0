Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBA4438C81
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 01:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbhJXXWE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 19:22:04 -0400
Received: from smtpcmd11116.aruba.it ([62.149.156.116]:39334 "EHLO
        smtpcmd11116.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbhJXXWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 19:22:04 -0400
Received: from smtpclient.apple ([146.241.216.221])
        by Aruba Outgoing Smtp  with ESMTPA
        id emfKmEfjAumo4emfLmfmvM; Mon, 25 Oct 2021 01:12:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1635117160; bh=j96ao78HmlujpX6unhgccWbxzWEqZn6BPNaoxLrWHus=;
        h=Content-Type:From:Mime-Version:Subject:Date:To;
        b=daAIf3QXH2JQFGjWAogfzLjHayK+JfpN9XGI7ohXoZDgifYq5FdVLRECuNKegsMDE
         QCENfUg9SqJfktPmeVfYsZIfLxUoYrRhd0AQD5Y121AUshpJZXh9ZEaXmwatUQldNi
         maxCnOCzF4vZ8xIqz6dBLrcvvKt77PvdD73OpkX4r5BH/anrTanrYLysmlZSQCoJpq
         Vq5hjE8Phef2u+gtIHNwr8pEdv2h1Zj3opffyeDVYEn6E47Fq6XbMFlrAEhFB2FVBG
         rAZCkWoAYnEzUZmnR8Ey9w7hKl+2bctvgxUhLlKzvVdlpoUuJAUkFgLabcnCRkilYa
         vgcZkGrx+UEiw==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 00/13] This patchset aims to add initial support for the i.MXRT10xx family
Date:   Mon, 25 Oct 2021 01:12:34 +0200
Message-Id: <01533F58-1A09-4C01-A5F7-85201BA39D11@benettiengineering.com>
References: <b7132b95-4a9f-db7c-6010-3f9df99a3087@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        b20788@freescale.com, Andy Duan <fugang.duan@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
In-Reply-To: <b7132b95-4a9f-db7c-6010-3f9df99a3087@gmail.com>
To:     Jesse Taube <mr.bossman075@gmail.com>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfAHL1PAEi5lW5RM2PHw3BuHcCgJ4pTmhoWiiFstJZ8Ev4b7kEXcoF6XasqgMiJ7k+05EmXjerjumXJQ/kqmxwXd79nFuArs+aqxyrc4s27tSletzXYR8
 d7d4nXGFsElHZcBAb8n39jPH8O9iSVV4Fhwnj0HsqfCMX9tknQNsd9eZHfxAFyKROb09AtReZyy5ktHYW+CCFDtcxQkmSld4ell9S3UpHW6J1E/l452PsroU
 Dgyzm36Vq5VvojCG7/GlwIal5cbzUEGDVvewPvdWWyxsBPKHDXPUVRSQalpK8BCcE4CZGdEARZEvigUtFzpw4pY86t5XV6US7/sHQW3nyM/CXfHb368d8Ujs
 vEWCv91KfndmBN0ulW6JJHLzzzCr9KFD6FaDu4FyBF3qljB1PpJRcjIFVlpG42jjIgftlttx9OnkgIs0JYCxUd2z5yPrjgz0FRgOoImKpIlCOZs2YDysRFNA
 2byfY7Z2dyvxPZsCBYwDLlh8byDD1ZdVeg8ghpvwzPZk0diyDEW1oBXEN7QfbBfc6u/iPEHaIvPQQ6tMXW7gcx194eB8eMQ1p9d8IgLzJznD24UHdZD9Oeqk
 MzOQ+fX6QzHNvcxLNstMbDhz5fSY9SeRmzs4ne4CuqUc/Gk4jThKpB/c97r16QZ3KO73cOq8SAQPy55jzApec1ok0OBEwVeFiOpor3bmD8QjkU8BllVRMZ84
 7/ABnfGZmBeTj63CihhpCNb6vDQrrDbdRpXyxRw31xgrChZKj5OJK6s0KyX15NyRunqc5W5xmXUsH8To5b38LASh9GQ/E3Nayid9BGXxJ13EfqTSByV6wRgd
 guATonnXs3aY2PRRAXGGr9NyS7i3Cim3O3O61eotDutjhQOB5QF7seP6hDdn6C8173rrEQf9a+Ac2DzOsqfFRPZbOlpv+V6y9EtwfHUsvbK+wj8oeb35u6Od
 b7HI7dclKaj4+nNAGgibEL5e4fDM26kTrtaQJAgbe4N4BlMT+HZDLAY7szksAygT3xocd2ukpeRVGqfkI1Eiqi3zB5Wx6SHgUoFqAXEnTOa5o3lgEcnkBW5H
 QqiE+43MsqfeVRgaxuOiKC1RDk0zzy+4v0RvUfZ20bnqCv9EOlmPMkHhv+W/7oc+G440g/pWBRhaE/4tmf1LBK4e/UOfOfQE79NFDr8Z8jNXHT1RFynkFde4
 R+h28VJqGF8J12FzUZ0dO5wPA2KK4+Vg/3rN5i3vIX2KIqozC1e8SoowVv3vHu+OPL9efsFf1PKdwxqfqHVegA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Arnd, Jesse, All,

Jesse and I have answered together, but I=E2=80=99ve missed 1 point below

> Il giorno 25 ott 2021, alle ore 00:21, Jesse Taube <mr.bossman075@gmail.co=
m> ha scritto:
>=20
> =EF=BB=BFHello Arnd,
>=20
> Giulio is in CC
>=20
>> On 10/24/21 3:32 PM, Arnd Bergmann wrote:
>>> On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wr=
ote:
>>>=20
>>> Add initial support for the i.MXRT10xx SoC family
>>> starting with the i.IMXRT1050 SoC.
>>> This patchset contains:
>>> - i.MXRT10xx family infrastructure
>>> - i.MXRT1050 pinctrl driver adaption
>>> - i.MXRT1050 clock driver adaption
>>> - i.MXRT1050 sd-card driver adaption
>>> - i.MXRT1050 uart driver adaption
>>> - i.MXRT1050-evk basic support
>>=20
>> Can you expand the description a bit more so it makes sense as a changelo=
g
>> text for the merge commit? It's fairly rare these days that we add suppor=
t for a
>> MMU-less platform, so it would be good if the introductory text answers
>> questions like:
>>=20
>> - what is this platform used for, and what is the purpose of running Linu=
x on it
>>  in place of the usual RTOS variants?

I=E2=80=99ve forgotten to mention the reason of Linux here before with Jesse=
.
I think that someone could find an easier ready to go environment with Linux=
(and Buildroot as build system), not that much for graphics but for all the u=
tilities starting from bash.
Graphics can anyway benefit from qt lite or other lightweight library static=
ally built.

This SoC is used around the world with MCUXPRESSO and it=E2=80=99s the nxp a=
nswer to stm32f7 more or less.

A private company already provide a commercial Linux 4.5 BSP for it(we=E2=80=
=99re rewritten from scratch), so I think this means that someone is interes=
ted.

>>=20
>> - are you doing this just for fun, or are there any commercial use cases?=

>=20
> The purpose of this is for learning and fun, as far as we know there are n=
o
> commercial use cases, but we hope there will be.

At the moment there is no request, but because of upstreaming maybe there co=
uld be.

>=20
>> - what are the minimum and maximum memory configurations this has
>>  been tested with?
>=20
> We both have only tested with 32MB of ram on i.MXRT1050/60-evk.

Those 2 SoCs can expand up to 64MB.

>=20
>> - what user space are you testing with: any particular distro that suppor=
ts
>>  this platform, and do you run elf-fdpic or flat binaries.
>=20
> We are using Buildroot[1] and that only uses flat binaries.
> i.MXRT1050/20 have already been up-streamed to U-Boot[2].
>=20
>> - are you planning to also support the newer i.MXRT11xx or
>>  Cortex-R based designs like the S32S?
>=20
> We plan to support the i.MXRT11xx, but unsure about the S32x, it depends=20=

> on the interest.=20
>=20
>>=20
>>       Arnd
>>=20
> [1]: https://github.com/Mr-Bossman/imxrt-linux-buildroot.git
> [2]: https://source.denx.de/u-boot/u-boot/-/blob/master/configs/imxrt1050-=
evk_defconfig
>=20
> Thank you,=20
> Jesse Taube.

The rest is already answered

Best regards
Giulio Benetti
Benetti Engineering sas


