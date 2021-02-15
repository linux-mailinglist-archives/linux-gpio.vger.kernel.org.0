Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9EB31C36D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 22:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhBOVKf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 16:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhBOVKc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 16:10:32 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5788AC061788
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 13:09:52 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id b8so4351505plh.12
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 13:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ou8P1Li7E2gyeKtwfnYhdaQdgF2O0F8yVAbqRLCEDE8=;
        b=E1IHFqJBAhABl3o3qXIIXC/7j+N9OPZcNtf8P1Afsfz8RvG/bSRLhSEjRBA/9S5w7q
         jhCC+F3CB0G3LAGdmylE3Re7XOYvLpxv+1/u/Q7Hzg788gaxaEYCUgJl2yS4ttaMEBfs
         ll1VfIwhczN1r8mZRJ0nEdy2UJou7RY4Hg7XCOKkSAJak7CUv2s6F8LZqEKUH7vRv/8J
         tiTq8E28dH96z7IfrRSSbsL+7aAj/qXeVK3LiTDZr6K9zsQq2r0JWR5gDA+s4aF9+Ufx
         FctwvHyMrokBS8KEGb/HQrEUqGZAi6+ozPHHV7YObpTsxlvSa/iGFMesmuZBJLGgLL1H
         2i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ou8P1Li7E2gyeKtwfnYhdaQdgF2O0F8yVAbqRLCEDE8=;
        b=B7apx2uhPDyK6buwMSyEQ1OpkobWgJkwZ/PV5J6FUVzwA1c2TXUAvRTVzDieuvewQN
         xQYxupNOz65URM+DHy+Gcq2i0ZlDNzm0CiPwU7zIVVwMqcl6Xjh3e/hCC3cMd09WlDDB
         wPuG8W1fCdic84/03tExRlcku2Xu21zJjoGmgQLxCqfrXsxcUnvW7Otceo8AUdew+ioO
         iz2oUC82uzdY8smE9+gM/xd2FtDHv6/do5bIwjbLAEyV79kaS1qbfHqX2Gr/VDCMxk5K
         ED86Ottzr1hnID5dDXKtQxo6PPcC8nkQgkHEm2306K8gQceivXH9glviOvQWhHz63pfG
         POeg==
X-Gm-Message-State: AOAM531Md4dnr7uoPsfh6soBCrRlIvsblFTz3K4SOfL82FTq+EzZh1II
        s6M6Cu7pbQJhnpeyCNj+7Hugpw==
X-Google-Smtp-Source: ABdhPJzPv8GpdagdwQO8hWEQDmYqvev39zfpfDqqhw3o5h5pjW+8z3S9DYWJ4RxZeKRtCIYi3ksmAw==
X-Received: by 2002:a17:90a:de8d:: with SMTP id n13mr477375pjv.136.1613423391915;
        Mon, 15 Feb 2021 13:09:51 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:7fd3:1922:5d5d:c85b])
        by smtp.gmail.com with ESMTPSA id n1sm3308579pgi.78.2021.02.15.13.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 13:09:51 -0800 (PST)
Date:   Mon, 15 Feb 2021 13:09:49 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210215210949.GA1012667@x1>
References: <20210212223015.727608-1-drew@beagleboard.org>
 <20210212223015.727608-3-drew@beagleboard.org>
 <CAHp75VeqbKjg7pLCgO9-vd2NnqQy6VPaRFKrAWn-1TaJgi1-SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeqbKjg7pLCgO9-vd2NnqQy6VPaRFKrAWn-1TaJgi1-SA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2021 at 09:04:20PM +0200, Andy Shevchenko wrote:
> On Sat, Feb 13, 2021 at 12:30 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > Add "pinmux-select" to debugfs which will activate a function and group
> > when "<function-name group-name>" are written to the file. The write
> 
> The non-standard way of showing parameters, I would write that as
>  "<function-name> <group-name>".

Sorry for your comments, but I don't understand what you mean by this
one.  I think we wrote ""<function-name> <group-name>" the same way, no?

> 
> > operation pinmux_select() handles this by checking that the names map to
> > valid selectors and then calling ops->set_mux().
> >
> > The existing "pinmux-functions" debugfs file lists the pin functions
> > registered for the pin controller. For example:
> >
> > function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> > function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> > function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> > function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> > function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> > function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
> 
> Format this...
> 
> > To activate function pinmux-i2c1 and group pinmux-i2c1-pins:
> >
> > echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select
> 
> ...and this with two leading spaces (for example) to make sure that
> people will understand that these lines are part of the example.

Ok, thanks.

> 
> ...
> 
> >  drivers/pinctrl/pinmux.c | 99 ++++++++++++++++++++++++++++++++++++++++
> 
> Still needs a documentation update.

There is no documentation for any of the existing pinctrl debugfs files.
I was planning to do this as part of a seperate patch, but I can make it
part of this series instead.

> 
> ...
> 
> > +       const char *usage =
> > +               "usage: echo '<function-name> <group-name>' > pinmux-select";
> 
> This is quite unusual to have in the kernel. Just return an error
> code, everything else should be simply documented.
> 
> ...
> 
> > +       if (len > PINMUX_SELECT_MAX) {
> 
> > +               dev_err(pctldev->dev, "write too big for buffer");
> 
> Noisy, the user will get an error code and interpret it properly.
> So, please drop them all. Otherwise it would be quite easy to exhaust
> kernel buffer with this noise and lost the important messages.
> 
> > +               return -EINVAL;
> 
> To achieve the above, this rather should be -ENOMEM.
> 
> > +       }

Thanks, I will remove the usage message and change the return value.

> 
> ...
> 
> > +       gname = strchr(fname, ' ');
> > +       if (!gname) {
> > +               dev_err(pctldev->dev, usage);
> > +               ret = -EINVAL;
> > +               goto free_buf;
> > +       }
> > +       *gname++ = '\0';
> 
> I was thinking about this again and I guess we may allow any amount of
> spaces in between and any kind of  (like newline or TAB).
> So, taking above into consideration the code may look like this:
> 
> /* Take the input and remove leading and trailing spaces of entire buffer */
> fname = strstrip(buf);
> /* Find a separator, i.e. a space character */
> for (gname = fname; !isspace(gname); gname++)
>   if (*gname == '\0')
>     return -EINVAL;
> /* Replace separator with %NUL to terminate first word */
> *gname = '\0';
> /* Drop space characters between first and second words */
> gname = skip_spaces(gname + 1);
> if (*gname == '\0')
>   return -EINVAL;
> 
> But please double check the logic.
> 
> ...


Thanks for the example code.  I'll test it out.


> 
> > +free_buf:
> 
> exit_free_buf:
> 

Ok, thanks.

> > +       kfree(buf);
> > +
> > +       return ret;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
