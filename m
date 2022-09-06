Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE46A5AE045
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 08:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbiIFGwO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 02:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238709AbiIFGwL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 02:52:11 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B9672EEB
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 23:52:08 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id DB979424B9;
        Tue,  6 Sep 2022 06:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662447125; bh=uLvZQy1ys//svTswtJKIXy9FyXyhsGDSRJ6kS2w5l80=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=dnhz4KaHvFvTdeWNTRtFSZKHzOf75ZFh58qAzhOQeCcoO8LnG/V0vrCGEEkxB1ij3
         GLckX0POfdmeqXZUD0QczOF5vJi1cXjn0bgvuItUyF05TeeT9kk9XpTOZVHCxCUlvs
         8J+ebjRJRR0yFgnmyZOdW+Ee4aVonk4EZk/6X/UjElJl2Tn6+JmTW2MtqeFSFs5Zeo
         auOR+Omi9D6bJ7cbSkmwHAhFVgLdh0bc4MnEhJ4hhMUOtpcb8vSUSHWpGkBY6lg4Mm
         Z5NLEQbbz89UyA/vw/j1yLY2kXZA8Ce4jWpBof2vPmbHN8/a9j+4mb1RwlTuq47mq/
         +LRUXDFHsRuBQ==
Message-ID: <35f8d09a-bd46-c401-babf-8a98677b61b7@marcan.st>
Date:   Tue, 6 Sep 2022 15:51:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
Content-Language: es-ES
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik@cutebit.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
References: <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk>
 <FD0C690B-DFA6-4CF0-8C54-8D829F0ABE2B@cutebit.org>
 <57c02bdd-4f98-40f7-22a9-4f39508159e8@marcan.st>
 <YxYgL+MAJ7oUmLQd@shell.armlinux.org.uk>
 <CACRpkdYEQGobV30EDVd_ZYJ=PYE9nqyKhNT_W9xEjM3Grwrb5g@mail.gmail.com>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <CACRpkdYEQGobV30EDVd_ZYJ=PYE9nqyKhNT_W9xEjM3Grwrb5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/09/2022 04.10, Linus Walleij wrote:
> On Mon, Sep 5, 2022 at 6:13 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> 
>> I suggest that I try resubmitting the series with IRQ support dropped,
>> and with the %p4ch support in it and we'll see what happens.
> 
> You can add my
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> on the result, and the code should go in when Hector & you are
> happy with it. I surely trust you to fix the final polish.
> 
> I don't mind the IRQ patch either, but I understand it's a bit
> annoying if you can't test it on anything.

Thank you!

FWIW, I wrote that commit as part of working on PCIe power saving and
the SD card reader specifically, where the SMC GPIO card detect pin can
replace the internal card detect, and this allows us to completely power
down the SD card reader when there is no card inserted. But that PCIe
power management code isn't anywhere near done yet, I just tested that
using the SMC card detect IRQ works as expected with sdhci-pci. So it's
perfectly fine to hold off on that patch until later, and submit it once
we've actually been using it downstream for a bit and it gets some testing.

- Hector
