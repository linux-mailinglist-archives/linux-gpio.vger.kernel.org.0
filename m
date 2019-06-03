Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31D032AA6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 10:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfFCIUU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 04:20:20 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:33152 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfFCIUU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 04:20:20 -0400
X-Greylist: delayed 738 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Jun 2019 04:20:19 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559550019;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=twJxv4tuoQeDLx+z1KicRx3gDedu38lYE4/ggZsdzNI=;
        b=rWy59qlR5h4amjkTTprGd9cn2tNjs5hQRi8PvfA7xNNwNFvWh40/M2XzmpGSuY9lTv
        zJUBPCWT4DdSNwcA+YPrtN9XOtGPFEYQWBzxK9vVqkSJSoyXtTfHLtYw5T19GvXNYB6v
        sMNuxsUQWAvzHDtLhLOlZAXqqsYJL2sA3r28DXiq1vFRrVIOEYibTMqImL1ZsXvWaEpc
        ks1mIbIsNcA0HL+zfxKGaXDAm5nVdIHK0JxFNNP3niZVtuNHB2JU6urmu3i/fj2TkW7J
        e2PiEsz5yxYEM3E7aescakjgTyAk6ael3/vdZCc0dAPa0pmy5epmzp9FxUkDgIWgpWbi
        1bjA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCyhrHcWveo6dYddJLwU7zfP8dEA8ZeyIBhBhmPt"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2643:ce00:3513:fe32:ce68:90d3]
        by smtp.strato.de (RZmta 44.18 AUTH)
        with ESMTPSA id j04dc1v53880Cwv
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 3 Jun 2019 10:08:00 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: BUG: gpio: pca953x: 24 bit expanders broken since v5.2-rc1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CACRpkdajVu2H-9zX4gAEnHHR8gd=4jseabLGsHB=0CF1BKH-JA@mail.gmail.com>
Date:   Mon, 3 Jun 2019 10:08:08 +0200
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Nandor Han <nandor.han@vaisala.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA845A5E-65BE-41A4-A2CC-37C6DA432E6E@goldelico.com>
References: <F29452FD-AFA4-422B-992C-D348FEEAE0E2@goldelico.com> <CACRpkdajVu2H-9zX4gAEnHHR8gd=4jseabLGsHB=0CF1BKH-JA@mail.gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> Am 01.06.2019 um 23:57 schrieb Linus Walleij =
<linus.walleij@linaro.org>:
>=20
> On Fri, May 31, 2019 at 7:06 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>=20
>> Now, this was not a (visible) problem until patch
>>=20
>>        8b9f9d4dc511 regmap: verify if register is writeable before =
writing operations
>>=20
>> enforces to check the register number before invoking the
>> callback pca953x_writeable_register(). pca953x_writeable_register()
>> seems to know about REG_ADDR_AI (through reg & REG_ADDR_MASK) and
>> accepts 0x88 as a valid register number.
>>=20
>> After the regmap patch the register is checked against
>> pca953x_i2c_regmap.max_register before applying REG_ADDR_MASK
>> and 0x88 is obviously beyond, explaining the symptom.
>=20
> Can we simply bump the .max_register in
> pca953x_i2c_regmap to 0xff for a quick fix with a comment
> FIXME to figure it out the right way?

Yes, that might be a quick workaround closer to the correct code =
location
in the driver.

There seem not to be many regmap accesses with randomly toggled =
REG_ADDR_AI
bit and therefore risk of seeing two different cache entries where they =
would
assume the same is low (and not higher than before we fix anything).

I'll give it a try asap.

BR,
Nikolaus=
