Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA5F399BBD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 09:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhFCHmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 03:42:11 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:60195 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhFCHmL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 03:42:11 -0400
Received: from [IPv6:2a02:810c:c200:2e91:a8ab:262a:e612:b364] (unknown [IPv6:2a02:810c:c200:2e91:a8ab:262a:e612:b364])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id A5FC122172;
        Thu,  3 Jun 2021 09:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622706020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gIwmd4JEDiQKB1gSuOwKpqzBGyqsYfLPUCmg1aAPqN4=;
        b=knqp4TrkM1GcAj8BUmuvwaamDiGc6pk4ztF2RpwemuHjGONvkselLbBe8xwNxlDjGHncAr
        kkbWOySpSCktPI1daBwe4qb0Rw1gAPkH8FR9tKRr+xYqd2mw/e2I/u6i0joNl19BINeL3h
        EwbKWnyKxaLIuEmKrozo3+KKwoHPgy4=
Date:   Thu, 03 Jun 2021 09:40:11 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <f651ce02ef481eafca0ff0c95d76c6060f4f0021.camel@fi.rohmeurope.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com> <cf34b0268bf298314392b0ed8831a4d9cd14efca.1622008846.git.matti.vaittinen@fi.rohmeurope.com> <8c1f817e48bce8a4cb730d79c1ef0330@walle.cc> <CAMpxmJWmmB1tuYS-zy-n165WFnAmz12-7+3LDQxxh+jvk=QD_Q@mail.gmail.com> <f651ce02ef481eafca0ff0c95d76c6060f4f0021.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] gpio: gpio-regmap: Use devm_add_action_or_reset()
To:     matti.vaittinen@fi.rohmeurope.com,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez_Rojas?= <noltari@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   Michael Walle <michael@walle.cc>
Message-ID: <142B05BA-D716-40AB-B667-5E4C2323BCB0@walle.cc>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 3=2E Juni 2021 06:26:03 MESZ schrieb Matti Vaittinen <matti=2Evaittinen@=
fi=2Erohmeurope=2Ecom>:
>Morning Bart,
>
>On Wed, 2021-06-02 at 13:54 +0200, Bartosz Golaszewski wrote:
>> On Fri, May 28, 2021 at 7:17 PM Michael Walle <michael@walle=2Ecc>
>> wrote:
>> > Am 2021-05-26 08:10, schrieb Matti Vaittinen:
>> > > Slightly simplify the devm_gpio_regmap_register() by using the
>> > > devm_add_action_or_reset()=2E
>> >=20
>> > Reviewed-by: Michael Walle <michael@walle=2Ecc>
>> >=20
>> > -michael
>>=20
>> This doesn't apply on its own - looks like it depends on patch 1/3=2E
>> Would you mind sending it separately rebased on top of my for-next
>> branch at=20
>> https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/brgl/linux=2Egit/?
>>=20
>
>Sure=2E No problem=2E I'll respin this sole patch today unless Michael
>plans adding other changes - in which case it might be best he includes
>this just to avoid the conflicts=2E

Both are fine by me=2E I don't expect any conflicts, but I can also pick t=
his up when I'm picking the gpio_regmap_set_drvdata() stuff of the other pa=
tch=2E I'll do it probably tomorrow=2E=20

-michael

