Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8EFC558DB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 22:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfFYUai (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 16:30:38 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:36597 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfFYUai (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 16:30:38 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 65CCE886BF;
        Wed, 26 Jun 2019 08:30:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1561494633;
        bh=1kY+bwPF4p0YA079A5v673sAjTxOqECEQoGaHNKiN3s=;
        h=From:To:CC:Subject:Date:References;
        b=VjItwXPkxG2jYM8fucFA+6U+KKGhMJlV1pdLCHpbaf911rG7qGBsY0AB0hlpWYuia
         GERmgX6YTcY7luDgnRBGjpfrtQ7DM0drgyzazpNM+oY3TQger5V1kQJe6qWlzsiLvt
         eNVRPu/JO7KHxEDJ0DEk/PYNC08SVexa9tmgu0aJUvTjJ55RdLs2S6kaM6DcJxVuZk
         OiJ5TE4tEbuDLpxPAafNDfPX4P4qEQ/aN1E26WVnWZXJP5UZHm4KmP9EIKysdHFf87
         TG+9MrQ4gB+8YmT+zVWnLdCSBrrkP9kfuQ9bBHlslQK+vdHrAtafiqh4jVcudHu8jf
         fdQywZbAJ2sXg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d1284690001>; Wed, 26 Jun 2019 08:30:33 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Wed, 26 Jun 2019 08:30:33 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Wed, 26 Jun 2019 08:30:33 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] pinctrl: mvebu: Add support for MV98DX1135
Thread-Topic: [PATCH v2 3/4] pinctrl: mvebu: Add support for MV98DX1135
Thread-Index: AQHVJVdQehuQXtWHL0SatF2H1kpYDA==
Date:   Tue, 25 Jun 2019 20:30:33 +0000
Message-ID: <f08d52a1c4864c6981f3631523965cf5@svr-chch-ex1.atlnz.lc>
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
 <20190617215458.32688-4-chris.packham@alliedtelesis.co.nz>
 <CACRpkdbSS18us3o=v7ki_=8cLXYjfDd8q321xMCounXPh11GAQ@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26/06/19 12:27 AM, Linus Walleij wrote:=0A=
> On Mon, Jun 17, 2019 at 11:55 PM Chris Packham=0A=
> <chris.packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> The 98DX1135 is a switch chip with an integrated CPU. This is similar to=
=0A=
>> the 98DX4122 except the MPP assignments differ.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>=0A=
> =0A=
> Patch applied.=0A=
> I just assume this one has no dependency on the clock patches=0A=
> so I can merge it separately.=0A=
=0A=
Correct. There's no dependency between the patches but they're all =0A=
needed to successfully boot a board.=0A=
