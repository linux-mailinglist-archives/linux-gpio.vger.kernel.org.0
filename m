Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3055AB4EF
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 17:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236312AbiIBPVb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 11:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236357AbiIBPVM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 11:21:12 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C167A17AB7
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 07:54:02 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id l5so1558893qvs.13
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Z1FoDByrTZWQf8xOYstthBmZfghp9AbTB8bp4TVFvqE=;
        b=djvHEyvX0810i2C3OIadD3Ac8GkGncpPI4h8WBwIdY4Vb03BTtsCtckMvnaaBaKW9n
         XDejN62TR44iwMD4cKwRX29G07/UMNhFgdkinB7ol9dX0D/2N5Z/xORtTQ1lgua9rsz0
         7TFP1scrofVPDw70Uj+3pQ1/g+aIsXunmk3uIYMz1IZTRJA7mIjNiQ2Zbi6MmhcK4fAL
         Es/TKW2U/eiv35DLHz7nHPZMgx1GTy3+0tHSPK7VvsvmN/DuuZ/JlorO5EXhS0jLLCiY
         I4mTk3Ss86rJML9us41OPdmcTN30isCF2PnoxU4QXzAHMcWPTu/hnHTSd6hkap83WWGh
         AWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Z1FoDByrTZWQf8xOYstthBmZfghp9AbTB8bp4TVFvqE=;
        b=aWglRGO071O8oTcbCCr2G1E/aBSzga1M7mCNFqJGFQSa0u+5T9lj6qC99uqh9JNd4o
         PbIipYiC6DCkYVPoUAD7uiJmEYzu4kXSR3u+gobGWgWuIiDO5r2ioAMAK6qevcqXxE9F
         QNwS1I2CmA7dtT2xPkWBNJFW5Z7qjCZrFXiSoEW/VcRnJQ5vm02RFfBCiaQ+Ywtt9LDz
         a/9s+wYO/ukPGb9LmpKiCeQGC3M9qDyrcKB1ssOP9GTyc5iKRSNqTsHaCPQjdT+bFKIv
         coFqMzVjdh6VFmrKeuo3Zke+dkw81/wSAlXZNIp5F5q5GcjJzTkqbz3JsvdLNse3ZrBn
         bQLA==
X-Gm-Message-State: ACgBeo036VAbt6z2xSboVnINybZ93v98F9tuCxY/1hjb+B1ppT5u3HBX
        Wyj8790B09eOQqieCzlp3r0HOazEG0hiYM9rSOA=
X-Google-Smtp-Source: AA6agR7Wuy9szq8bHjZpsQQxogigYXgKA8UiUmgZN03dfUBr82HV3q1iyIocqv5H4Nb0EiZuwrSHjR6MCBxDmDydC1k=
X-Received: by 2002:a05:6214:c8f:b0:499:21eb:ba3b with SMTP id
 r15-20020a0562140c8f00b0049921ebba3bmr10744195qvr.97.1662130441457; Fri, 02
 Sep 2022 07:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk> <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk> <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
In-Reply-To: <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Sep 2022 17:53:25 +0300
Message-ID: <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 2, 2022 at 5:46 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Sep 02, 2022 at 04:39:16PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 2, 2022 at 2:33 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Fri, Sep 02, 2022 at 01:37:14PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 2, 2022 at 1:05 PM Russell King (Oracle)
> > > > <linux@armlinux.org.uk> wrote:
> > > > > On Thu, Sep 01, 2022 at 09:55:23PM +0300, Andy Shevchenko wrote:
> > > > > > > +static int macsmc_gpio_nr(smc_key key)
> > > > > > > +{
> > > > > > > +       int low = hex_to_bin(key & 0xff);
> > > > > > > +       int high = hex_to_bin((key >> 8) & 0xff);
> > > > > > > +
> > > > > > > +       if (low < 0 || high < 0)
> > > > > > > +               return -1;
> > > > > > > +
> > > > > > > +       return low | (high << 4);
> > > > > > > +}
> > > > > >
> > > > > > NIH hex2bin().
> > > > >
> > > > > Is using hex2bin really better?
> > > >
> > > > Yes.
> > > >
> > > > > static int macsmc_gpio_nr(smc_key key)
> > > > > {
> > > > >         char k[2];
> > > > >         u8 result;
> > > > >         int ret;
> > > > >
> > > > >         k[0] = key;
> > > > >         k[1] = key >> 8;
> > > > >
> > > > >         ret = hex2bin(&result, k, 2);
> > > > >         if (ret < 0)
> > > > >                 return ret;
> > > > >
> > > > >         return result;
> > > > > }
> > > > >
> > > > > This looks to me like it consumes more CPU cycles - because we have to
> > > > > write each "character" to the stack, then call a function, only to then
> > > > > call the hex_to_bin() function. One can't just pass "key" into hex2bin
> > > > > because that will bring with it endian issues.
> > > >
> > > > With one detail missed, why do you need all that if you can use
> > > > byteorder helpers()? What's the stack? Just replace this entire
> > > > function with the respectful calls to hex2bin().
> > >
> > > Sorry, I don't understand what you're suggesting, because it doesn't
> > > make sense to me. The byteorder helpers do not give a char array, which
> > > is what hex2bin() wants, so we end up with something like:
> > >
> > >         __le16 foo = cpu_to_le16(key);
> > >         u8 result;
> > >
> > >         ret = hex2bin(&result, (char *)&foo, 1);
> > >         if (ret < 0)
> > >                 return ret;
> > >
> > >         return result;
> > >
> > > This to me looks like yucky code, It still results in "foo" having to
> > > be on the stack, because the out-of-line hex2bin() requires a pointer
> > > to be passed as the second argument.
> > >
> > > Maybe you could provide an example of what you're thinking of, because
> > > I'm at a loss to understand what you're thinking this should look like.
> >
> > So, let's look into the real callers to see, oh wait, it's a single caller!
> > Why can't you simply do
> >
> >          ret = hex2bin(&result, (char *)&cpu_to_le16(key), 1);
> >          if (ret < 0)
> >                  return ret;
> >
> > in-place there?
>
> This is not legal C.

I acknowledged this, sorry.

> Please can we back up this discussion, and start
> over with legal C suggestions. Thanks.

Suggestion was given as well, let's create a helper used by apple
stuff and later on we will consider the separate submission for the
(new) specifier. Would it work for you?

-- 
With Best Regards,
Andy Shevchenko
