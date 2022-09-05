Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C78A45AD376
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 15:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236946AbiIENKY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 09:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiIENKX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 09:10:23 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E05A30F76
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q7Tn+bJtqu2ODEUZhUagZB7W1ZndM1AXeo/8XCGEiHQ=; b=Hd3Ldw6ItyYIP112rXFDq35lZh
        +vW7V04B3KnkwmmXcIngBRllDioGS5o0Y45gVwcDEm3Ko7YqRxuxIuz+rPpULe/Ufzw02jRz48qbj
        sFhZN35Qt81yVNggCpNScIrOho9vxky3W5onBvTpMjLNvVAwLHFeY95wZaC+yxpYw8/+mc2tdC/iG
        /clrOlana0Q84Glf8xuW0p00E3ng91vjI6W+kx4umDHGwIbAWiCxlRLBB9RhJneG6znGloHssk3vn
        o4tVtq6oDdGzI2LzRgZuixxPA3uLyaHOE4+rXz0AO512XcKbXdv9sEgD0IlTW4aOruiCP8lwXAsUx
        ntiFEumg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34110)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVBre-0002Mq-8C; Mon, 05 Sep 2022 14:10:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVBra-0007J2-Fq; Mon, 05 Sep 2022 14:10:06 +0100
Date:   Mon, 5 Sep 2022 14:10:06 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
Message-ID: <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 05, 2022 at 01:32:29PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 1:20 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Fri, Sep 02, 2022 at 06:43:36PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 2, 2022 at 6:34 PM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > > On Fri, Sep 02, 2022 at 05:53:25PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > static int macsmc_gpio_nr(smc_key key)
> > > > {
> > > >          __le16 foo = cpu_to_le16(key);
> > > >          u8 result;
> > > >          int ret;
> > > >
> > > >          ret = hex2bin(&result, (char *)&foo, 1);
> > > >          if (ret < 0)
> > > >                  return ret;
> > > >
> > > >          return result;
> > > > }
> > > >
> > > > which you also didn't like,
> > >
> > > ...based on the wrong suggestion below. That said, the above is fine to me.
> >
> > To be honest, using the endian conversion macro there doesn't feel
> > right and is more prone to programming errors. I can't tell just by
> > looking at it that either cpu_to_le16() or cpu_to_le32() would be the
> > right thing here - and if it's not obvious then it's a bug waiting to
> > happen.
> >
> > As if to prove the point, the above suggestions turn out to *all* be
> > buggy.
> >
> > The initial suggestion gets the k[0] and k[1] assignment round the
> > wrong way. The second, le16() is definitely not the right conversion.
> > If we start using the endian conversion macros, then this is going to
> > screw up if someone runs a BE kernel against the SMC (since the
> > _SMC_KEY() macro will still be doing its conversion.)
> >
> > This seems utterly counter-productive, and I've spent quite a long
> > time trying to work out what would be correct.
> >
> > At this point, I'm not sure that changing what has already been
> > established in the Asahi Linux tree for something entirely different
> > in mainline is going to be practical - it's a recipe for repeated
> > mistakes converting keys from the Asahi kernel to the mainline
> > kernel.
> >
> > It's not _just_ the GPIO driver. There are multiple other drivers
> > that will be impacted by changing the scheme here.
> >
> > Any change to the scheme for these SMC keys  needs to happen in the
> > Asahi kernel tree by the Asahi Linux maintainers, not by someone
> > pushing the code upstream - doing so would be a recipe for repeated
> > trainwrecks.
> >
> > So, I'm going with my first suggestion for the hex2bin() conversion
> > above, and adding a comment thusly:
> >
> >         /*
> >          * The most significant nibble comes from k[0] and key bits 15..8
> >          * The least significant nibble comes from k[1] and key bits 7..0
> >          */
> >         k[0] = key >> 8;
> >         k[1] = key;
> >
> > because I needed the comment to prove to myself that I wasn't breaking
> > this code. Maybe it's obvious to you, but it isn't obvious to everyone.
> 
> And how is it different to the key being __be16 and all operations
> against it be correct with the endianness helpers?

First, the key is not 16-bit, it's 32-bit.

Secondly, the "key" returned from the SMC is always swab()'d before
we use it - and before we pass it back to the SMC.

There's a big open question right now about whether it's the Asahi
developers choice to arrange the four character key in big-endian form
on LE platforms, and whether this is application processor endian
dependent or not.

It's packed into a 64-bit integer:

        msg = (FIELD_PREP(SMC_MSG, SMC_MSG_WRITE_KEY) |
               FIELD_PREP(SMC_SIZE, size) |
               FIELD_PREP(SMC_ID, smc->msg_id) |
               FIELD_PREP(SMC_DATA, key));

in bits 32..63, which is then written using writeq_relaxed() to the
mailbox registers. However, the keys returned from the SMC are the
opposite endian-ness:

static int apple_smc_rtkit_get_key_by_index(void *cookie, int index, smc_key *key)
{
        struct apple_smc_rtkit *smc = cookie;
        int ret;

        ret = apple_smc_cmd(smc, SMC_MSG_GET_KEY_BY_INDEX, index, 0, 0, key);

        *key = swab32(*key);
        return ret;
}

where apple_smc_cmd() does this to get the returned data:

        if (ret_data)
                *ret_data = FIELD_GET(SMC_DATA, smc->cmd_ret);

which comes from apple_smc_rtkit_recv_early(..., u64 message):

                smc->cmd_ret = message;

which comes from apple_rtkit_rx():

        if (ep >= APPLE_RTKIT_APP_ENDPOINT_START &&
            rtk->ops->recv_message_early &&
            rtk->ops->recv_message_early(rtk->cookie, ep, msg->msg0))
                return;

which ultimately comes from apple_mbox_hw_recv();

        msg->msg0 = readq_relaxed(apple_mbox->regs + apple_mbox->hw->i2a_recv0);

So what _is_ the right endian for the keys? I've no idea.

> Adding redundant
> comments when the bitwise type exists seems just like being afraid of
> the unknown. Ah, I see that in one of your long letters the proposal
> somehow switched from (implicit) be16 to (explicit) le16... Still to
> me it's not enough justification for the comment, but since it has no
> effect on the code generation, add it if you think it would be better.

If you have a clear picture what this should be throughout multiple
drivers (it seems you do) then please explain it to me, and make
proposals to the Asahi Linux people how the SMC key stuff can be
more understandable, because quite honestly, I don't think I'm
qualified to touch what they have without introducing a shit-load
of bugs.

And in that circumstance, simple obviously correct code is better than
a pile of steaming crap that no longer works. Even worse is when
there's a fundamental incompatibility between what we have in mainline
and what Asahi folk are using. Even worse is if this breaks on other
Apple application-processor architectures.

Let me say again: I am not changing this. That's for Asahi people to
do if they wish. I am the just middle-man here.

And yes, we need to do something about the %p4ch stuff. I have _no_
idea how to properly solve that right now - and how to properly
solve that depends on what comes out of the discussion about what
endianness this "smc_key" thing should be.

Unless I get some input from the Asahi folk, I won't be posting a v2,
because I can't address stuff like %p4ch without that. And I'm not
going to mess about with endian conversions in silly places when it's
not obvious that it's the right thing to be doing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
