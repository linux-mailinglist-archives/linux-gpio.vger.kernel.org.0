Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAE112282F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 11:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfLQKBs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 05:01:48 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:40092 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbfLQKBs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2019 05:01:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 9727927E1650;
        Tue, 17 Dec 2019 11:01:46 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id S2QYEGo2Co_s; Tue, 17 Dec 2019 11:01:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 37FBC27E1660;
        Tue, 17 Dec 2019 11:01:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 37FBC27E1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1576576906;
        bh=J6UvZCqnt+1FaLsYt26jhq2jShGIHN4B8Z5QlxdoSr4=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=OxkvjrxE9+L7MQ0ve+xpOzkswW9uZAKGd3LP8Q8vy56gRlEodZLl/mBSByuNcrC0E
         CASgrF7MUaRyWD/KKbflXf+QmUGgLHB9C3j2SM7TQizeD220RSP+NhEUYjuiKxU8Us
         Cqeeq8ryRFtMh7T9QL4CBNIIC4+QjCoJ/CVsKVIE=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ZT01oR6xFUjb; Tue, 17 Dec 2019 11:01:46 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 1E77727E1650;
        Tue, 17 Dec 2019 11:01:46 +0100 (CET)
Date:   Tue, 17 Dec 2019 11:01:45 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list, GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Message-ID: <1686073939.96973784.1576576905628.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20191216213959.GA957@bogus>
References: <20191204101042.4275-6-cleger@kalray.eu> <CAHp75VcqqqAv1iiwjNqGVcadmdzbjHt8f_ap7DKd3LWC=wwkhw@mail.gmail.com> <696316719.95315119.1575467579136.JavaMail.zimbra@kalray.eu> <20191216213959.GA957@bogus>
Subject: Re: [PATCH 5/5] dt-bindings: pinctrl: dw: move sps,dwapb-gpio.txt
 to pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.12_GA_3794 (ZimbraWebClient - GC75 (Linux)/8.8.12_GA_3794)
Thread-Topic: dt-bindings: pinctrl: dw: move sps,dwapb-gpio.txt to pinctrl
Thread-Index: R4uog0tu9bwnlu1QxaRaSzHOJ2tCkA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,=20

Indeed, I could do that if you think that's a better option. Andy however s=
uggested to always register a pinctrl controller.
Both options suits me. Let me know what option you want me to implement.

Thanks,

Cl=C3=A9ment

----- On 16 Dec, 2019, at 22:39, Rob Herring robh@kernel.org wrote:

> On Wed, Dec 04, 2019 at 02:52:59PM +0100, Cl=C3=A9ment Leger wrote:
>>=20
>> ----- On 4 Dec, 2019, at 13:45, Andy Shevchenko andy.shevchenko@gmail.co=
m wrote:
>>=20
>> > On Wed, Dec 4, 2019 at 12:13 PM Clement Leger <cleger@kalray.eu> wrote=
:
>> >>
>> >> Since the driver has been moved to pinctrl and now supports it, move =
the
>> >> documentation into pinctrl folder. In the same time, add documentatio=
n
>> >> for pinctrl properties such has snps,has-pinctrl and description of p=
in
>> >> alternate functions.
>> >=20
>> >> +- snps,has-pinctrl : If present, register the pinctrl controller.
>> >=20
>> > I'm wondering why we can't always assume pin control?
>>=20
>> This hardware IP is configured when instantiated to include support for
>> muxing. If configured without support, the registers will exists but won=
't
>> configure anything.
>> I guess that it's not really a problem but it will lead to unusable
>> pin muxing.
>=20
> Can't you determine this by the presence of child nodes?
>=20
> Rob
