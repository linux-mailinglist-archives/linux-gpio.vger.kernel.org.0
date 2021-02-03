Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9480230D971
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 13:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbhBCMCl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 07:02:41 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:24662 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbhBCMCR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 07:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1612353736; x=1643889736;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version:content-transfer-encoding;
  bh=OY3C0w/qB4gbjMLf0w66f9/0UFos7giSpFcEYMgKDd8=;
  b=GMdUBdeWjOwW4UurIaEaPwEdl1OhAEnRmN+Nj09lLtXiFLPRiIxU8Y2n
   lBWyOcSCZlSloO2QsrcOssnX2pNSiLhsvl7a/W7Rll/+3O5JOjy2hycru
   ZxeEDKZZgJYij/Dp2WjkiqRSFEAfSVn/vCa9IEq0gYAv9CpVhY3p9FwRG
   AcptsEvuwRVGhah0P1jCDcpgJTFoGE2ZDBgd/FtA4QIJ1AtUanI0LApCW
   u527Po42ami7Gqmouwiwv607NyBWI3M9SLWSAIS4m6Sg9NWVMnF1R0eQR
   U/rN7qRUPrmaM+5kpWFbhLniurOdTiVUTnUCJn5UQh2VlHw/AakveliUy
   g==;
IronPort-SDR: sBRoDZ0vfnhXEg0SYuX0KSo6U0/qX6+tboo9q9CYqw91vf0pAY1Ujff6RlofAbD87k1gEbDY4B
 heHfViheRg9O/vWQJqhtQCC4FP0RlXGMJpD4h4Mjk4qGZxhprDkvY+bv1w75mrq2zCeI9YB4o8
 pyYnDPSRuINy7BzPGuZpLE0bgvSiYBl1yxLCQxV1fErWtcgBCZynsumE+RFx6Chsnk9BSLImsY
 1WoZYe9MTfTQpiQDhMmJ+YHF0zqpaQB9p0Q1lyWN88ugt4b6XuWf8dhWJHkY7+14tBgO13Xh8I
 yZw=
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="108345529"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Feb 2021 05:00:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 3 Feb 2021 05:00:56 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 3 Feb 2021 05:00:54 -0700
References: <20210202113423.GA277746@embeddedor>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>
Subject: Re: [REPORT][next] pinctrl: pinctrl-microchip-sgpio: out-of-bounds bug in sgpio_clrsetbits()
In-Reply-To: <20210202113423.GA277746@embeddedor>
Date:   Wed, 3 Feb 2021 13:00:47 +0100
Message-ID: <87o8h1uzrk.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Gustavo A. R. Silva writes:

> Hi,
>
> While addressing some out-of-bounds warnings, I found the following bug:
>
> drivers/pinctrl/pinctrl-microchip-sgpio.c:154:57: warning: array subscrip=
t 10 is above array bounds of =E2=80=98const u8[10]=E2=80=99 {aka =E2=80=98=
const unsigned char[10]=E2=80=99} [-Warray-bounds]
>
> The bug was introduced by commit be2dc859abd4 ("pinctrl: pinctrl-microchi=
p-sgpio: Add irq support (for sparx5)"):
>
> 575         sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER + SGPIO_MAX_BITS=
, addr.bit,
> 576                          BIT(addr.port), (!!(type & 0x2)) << addr.por=
t);
>
> REG_INT_TRIGGER + SGPIO_MAX_BITS turns out to be 10, which is outside the=
 boundaries
> of priv->properties->regoff[] at line 154:

Hi Gustavo!

Thanks for spotting this - the "+" is misplaced. I will submit a patch
asap.

Cheers,

---Lars

>
> 151 static inline void sgpio_clrsetbits(struct sgpio_priv *priv,
> 152                                     u32 rno, u32 off, u32 clear, u32 =
set)
> 153 {
> 154         u32 __iomem *reg =3D &priv->regs[priv->properties->regoff[rno=
] + off];
> 155         u32 val =3D readl(reg);
> 156
> 157         val &=3D ~clear;
> 158         val |=3D set;
> 159
> 160         writel(val, reg);
> 161 }
>
> because priv->properties->regoff[] is an array of MAXREG elements, with M=
AXREG
> representing the value of 10 in the following enum:
>
>  28 enum {
>  29         REG_INPUT_DATA,
>  30         REG_PORT_CONFIG,
>  31         REG_PORT_ENABLE,
>  32         REG_SIO_CONFIG,
>  33         REG_SIO_CLOCK,
>  34         REG_INT_POLARITY,
>  35         REG_INT_TRIGGER,
>  36         REG_INT_ACK,
>  37         REG_INT_ENABLE,
>  38         REG_INT_IDENT,
>  39         MAXREG
>  40 };
>
>  52 struct sgpio_properties {
>  53         int arch;
>  54         int flags;
>  55         u8 regoff[MAXREG];
>  56 };
>
> Thanks


--=20
Lars Povlsen,
Microchip
