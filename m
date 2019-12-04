Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99E2B112CF6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 14:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfLDNxB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 08:53:01 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:45892 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbfLDNxB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 08:53:01 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id E665927E06C1;
        Wed,  4 Dec 2019 14:52:59 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id AXnIOwQeJpuJ; Wed,  4 Dec 2019 14:52:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 6571027E1514;
        Wed,  4 Dec 2019 14:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 6571027E1514
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1575467579;
        bh=l+sKtua1XQcGeyC5IHvScFDmfWCdcMfwZhdZEKd20y8=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=FPxnmvX/7mQY7hzhONZ5AQctLwUL5cCyFuyZSoaKqfQpT2V4V2BHx36FhxL2fkoUy
         /1v63znvh7sOuaRt+5DHR1JXFL+4NvoFr46S2tEwOY6xpvvYQiGvZ8Vw0O5r+Qts4x
         lwc3LiT0SPxR7vvWNOypzGzw4usO1atEA+WMaWp8=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 2LF3YxJNRt_T; Wed,  4 Dec 2019 14:52:59 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 4BD8127E06C1;
        Wed,  4 Dec 2019 14:52:59 +0100 (CET)
Date:   Wed, 4 Dec 2019 14:52:59 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list, GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Message-ID: <696316719.95315119.1575467579136.JavaMail.zimbra@kalray.eu>
In-Reply-To: <CAHp75VcqqqAv1iiwjNqGVcadmdzbjHt8f_ap7DKd3LWC=wwkhw@mail.gmail.com>
References: <20191204101042.4275-6-cleger@kalray.eu> <CAHp75VcqqqAv1iiwjNqGVcadmdzbjHt8f_ap7DKd3LWC=wwkhw@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: pinctrl: dw: move sps,dwapb-gpio.txt
 to pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.12_GA_3794 (ZimbraWebClient - GC75 (Linux)/8.8.12_GA_3794)
Thread-Topic: dt-bindings: pinctrl: dw: move sps,dwapb-gpio.txt to pinctrl
Thread-Index: G/WlHVySL02P41vqPDBPH0jBOUDTkw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


----- On 4 Dec, 2019, at 13:45, Andy Shevchenko andy.shevchenko@gmail.com wrote:

> On Wed, Dec 4, 2019 at 12:13 PM Clement Leger <cleger@kalray.eu> wrote:
>>
>> Since the driver has been moved to pinctrl and now supports it, move the
>> documentation into pinctrl folder. In the same time, add documentation
>> for pinctrl properties such has snps,has-pinctrl and description of pin
>> alternate functions.
> 
>> +- snps,has-pinctrl : If present, register the pinctrl controller.
> 
> I'm wondering why we can't always assume pin control?

This hardware IP is configured when instantiated to include support for
muxing. If configured without support, the registers will exists but won't
configure anything.
I guess that it's not really a problem but it will lead to unusable
pin muxing.

> 
>> -F:     Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
>> +F:     Documentation/devicetree/bindings/pinctrl/snps-dwapb-gpio.txt
> 
> I guess this should be a part of patch 2 when you move driver w/o
> changes to a new folder.

Agreed. I will do that,

Thanks

> 
> --
> With Best Regards,
> Andy Shevchenko
