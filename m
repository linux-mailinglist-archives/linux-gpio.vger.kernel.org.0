Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89CD1491DB
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 23:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbfFQVAn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 17:00:43 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:51322 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbfFQVAn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 17:00:43 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A3317886BF;
        Tue, 18 Jun 2019 09:00:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1560805241;
        bh=GTADMuzdK/ZS3g8VOZ9XtxpUP/TjXPNtpzO+owLF9lQ=;
        h=From:To:CC:Subject:Date:References;
        b=AoT2VV+BGgHwvP21C9mhXWKBNIbQBsSXM4ydqI8gyQCpqxkmnhCjnAz4pBa51NqN3
         wtlT06hKqcbWp6OB0rUuxzRpwmhWh0bPkU0TekxSeuW7EguafGtkrte1rmv7Rmq7ob
         qldqNwTpwLZhHTCNzRC0SRLw9rNDYiCmts9bJ+il+BnRfMr8BkAwMcgamggj6mFXwt
         5wdOFZL58X5Zv+mmMm0/x3zaXiIPraiXdBv7sRGgDLYFk1PEyr2Vik30iGqjkZqQoA
         8T0bjITcmOA2Y2frdhW/PTuJD9EonKYzdd0PItWNHaiHpecYYZTYh6rCjcgEyZnmBQ
         MzcL6LG61HF3w==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d07ff7a0000>; Tue, 18 Jun 2019 09:00:42 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Tue, 18 Jun 2019 09:00:41 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Tue, 18 Jun 2019 09:00:41 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andrew Lunn <andrew@lunn.ch>
CC:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: clock: mvebu: Add compatible string for
 98dx1135 core clock
Thread-Topic: [PATCH 2/4] dt-bindings: clock: mvebu: Add compatible string for
 98dx1135 core clock
Thread-Index: AQHVJPQWO1K5IrBk6023sLSGAZWOmQ==
Date:   Mon, 17 Jun 2019 21:00:41 +0000
Message-ID: <52f0fe4f276e4088ac7ad47bc761722e@svr-chch-ex1.atlnz.lc>
References: <20190617100432.13037-1-chris.packham@alliedtelesis.co.nz>
 <20190617100432.13037-3-chris.packham@alliedtelesis.co.nz>
 <20190617170931.GG17551@lunn.ch>
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

Hi Andrew,=0A=
=0A=
On 18/06/19 5:09 AM, Andrew Lunn wrote:=0A=
> On Mon, Jun 17, 2019 at 10:04:30PM +1200, Chris Packham wrote:=0A=
>> Add compatible string for the core clock on the 98dx1135 switch with=0A=
>> integrated CPU.=0A=
> =0A=
> Hi Chris=0A=
> =0A=
> Should there be a list of provider IDs and clock names?=0A=
> =0A=
=0A=
That list would be the same as the Kirkwood/Dove. I thought about adding =
=0A=
it but decided not to to avoid unnecessary duplication. One compromise =0A=
would be to change "for 98dx1135 SoC core clocks" to "for Kirkwood =0A=
98dx1135 SoC" which would fit with the MV88f6180 line above and make it =0A=
clear that it falls into the kirkwood bucket.=0A=
