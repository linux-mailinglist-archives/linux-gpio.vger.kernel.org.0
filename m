Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DC25AD6E8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237068AbiIEPxC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238686AbiIEPxB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:53:01 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889D55F136
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:52:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id BE74B41F78;
        Mon,  5 Sep 2022 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662393173; bh=Ra3o6r5W8eESsw93yHTiwc7uW/oimDp1IFWslWumMc8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=hbDFQOVIABdVF7kdJ1z1Mav3dov0Ja9+ZKrq/RJ2cJPsFlrBN7MX+FcDWyfJGytLz
         D+LNbh57tdhvsch7LXB1/IDh3ILSSe2ikP+8TTbLyyR/c03WloBfTxY3u5FNuyI6qc
         ZgJyoMt3HS9etSf5A7KvQsNdXI6hVtsiuoySHgT5ydDpjYh2RUNLpLFV90GgZCIeHM
         uWVRloc3CvePFLYRrgvcIawvpysNk2eNWwdqFkgZU2UaQuGl87RwoYkoaMiis7SHrq
         xBpaeDdcNIgROcSFTGsTJ0L+LWgg/7MnkOTJbLq84iQCjU+CpnPwrW8luIfTkYTnOl
         TjJgJKCyCwS2Q==
Message-ID: <0457bda4-8449-dede-1d85-e4e1317dff12@marcan.st>
Date:   Tue, 6 Sep 2022 00:52:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
Content-Language: es-ES
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
References: <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
 <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
 <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk>
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

On 05/09/2022 23.01, Russell King (Oracle) wrote:
> On Mon, Sep 05, 2022 at 04:16:27PM +0300, Andy Shevchenko wrote:
>> P.S. Do you have a platform to test all these?
> 
> Yes, but that doesn't mean I can do testing sufficient to ensure that
> the modifications are correct. As I understand things, the SMC is not
> limited to just aarch64 hardware.

FWIW, the RTKit backend is limited to aarch64 hardware, and that's also
why I kept all the endian-munging there. T2 and legacy x86 backends
(which don't exist yet, so whether things need changing for those
platforms is an open question anyway) would respectively do whatever
endian-munging is appropriate for them.

So at this point, only Apple Mx AArch64 SoCs matter, though I *tried* to
write the code in the way that I thought was most likely to cleanly
transfer over to other SMC platforms by just changing the backend code.

- Hector
