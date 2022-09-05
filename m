Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E005AD6D5
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbiIEPr6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbiIEPr4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:47:56 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F25D5B04F
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:47:55 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id A200B41E2F;
        Mon,  5 Sep 2022 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662392873; bh=gjmIz0nVzbAw3TxWSNxeDBxLRDom162au1HI5lXkHR8=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=Bi4q9G3vK0zx66t0RQIhOdbBHDwuptPUU0sxZ6oqSa6DXt0Jqtc8sq2ug3QaBaIm+
         SIroMDLcITS/oGjrpBdSIlE0Tvh1rN1LT3FxDLFuxR6VwLZMximsbes6/yIWJTcEEg
         mcu/zMukYy+PmTUJJM2eDrhB2YfSia89OLKV4M+t0aSyp64ffABhtgpmH+/s8QvfFo
         snFUXtwYfhXJbO6TbPtnH5gG1mZyG+wJwe6WnpnKVVPSDbR4Nn+0wp/Wre363kzGWT
         Pghyyf7JIXduBjC28mZXq0SOYqJDTP1RtfMc8zG8Sp9h/TrvLk4uEjtHEC9GMvdaF0
         z2GCln2cEheZg==
Message-ID: <a703cffc-5c9b-a173-63ea-5afc45e28382@marcan.st>
Date:   Tue, 6 Sep 2022 00:47:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
References: <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
 <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
 <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
 <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
In-Reply-To: <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
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

On 05/09/2022 22.16, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 4:10 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
>> On Mon, Sep 05, 2022 at 01:32:29PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
>> Let me say again: I am not changing this. That's for Asahi people to
>> do if they wish. I am the just middle-man here.
> 
> While I agree on technical aspects, this mythical "they" is
> frustrating me. They haven't participated in this discussion (yet?) so
> they do not care, why should we (as a community of upstream)?

Hi Andy,

This was submitted 4 days before your comment, 2 of which were the
weekend. Not all of us spend our weekends reviewing patches.

Russell graciously volunteered to help upstream this patchset and I
hadn't had a chance to reply yet. I would appreciate it if you don't
accuse us of "not caring", or I might have to start pointing out
upstreaming attempts by us that were ignored by the respective
maintainers for *months*, not 4 days. Glass houses and throwing stones
and all that.

- Hector
