Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540813010D3
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jan 2021 00:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbhAVXRZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 18:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbhAVXQw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 18:16:52 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE86C0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 15:16:12 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id i63so4811425pfg.7
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 15:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X7CcCCq/hCJ8til5VbdztzIe2LyqyKdkDTD/Y7nvvnQ=;
        b=BnNlGzQW4KEJe2bnZpRbYMk4HdnKPlOggTor8Ezs+SJ64nBqD/hFE/DHArbyQ1amEg
         lecMNHtxGQguT82ZThBPgWdrckGHyx2zfW1IqHpTtIZ8/PlxcuCvdgg8gqdliH84u3tI
         cJXvUuNRtvAPIYT8GYZmncBfwobnGLeW3obvFzoJW0NpG+3eNnzhf5XWvNMncrnMN6ER
         cwOS0tb6bNzcZb5ysB14vz9JvrxfI2yHPR+u8JRP3xTZmeVWtuddnuNhI1uq9GcLdaVT
         Y3aHJO8IecI/SzDR3AeonKo2Gpdr4i8KfHCnDqVomEGyuBaljrMs+SV2LKFNhVy6XqjZ
         5GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X7CcCCq/hCJ8til5VbdztzIe2LyqyKdkDTD/Y7nvvnQ=;
        b=pAp92PLOPu5mz6NYqc0cx8ClEGcIkUnHCS9Ut4VrXpgWZVB12MnHLOHS1zKGleAQTg
         hObzVdlFjx9kJZrnXjWSMBqG96QW+VEOlkOeyWPKQgjCm+5+Q9mJoG6ISHwGBCTO5h8V
         1scTf8Jdu2V0onAeHm7WmX+b08ydahy9ciFie74xokOYLJMZg2VRvemHTAO/yVNw7S18
         RRdlXphRwNvN5TwWhFF7HL+tGG1qAVeniox6TzIVNLgACNa17vIbxF58cNHNk0kBQ3gM
         gkT7Kt6nDy0gmnkpEmVFWnO4hSyGEhn4ZHr+S83EtRks/x6UrXxowly6oZK01ZM2cW7x
         Yl2g==
X-Gm-Message-State: AOAM53349s8FpmkK62dgyB6gB1rjF1IuxjRNnMvVR7NZxKqrZlpoV4hF
        VrsX7EQ+L8gMmKKSxixAw+6F303JdGrYQw==
X-Google-Smtp-Source: ABdhPJyoIdjZSf0FGWy6vgl0PRqTkMPW88HzRqh+yY/lSLpsfScoyWKMURWikfuKExf/1BcfzyrdiA==
X-Received: by 2002:a65:57c2:: with SMTP id q2mr2044657pgr.86.1611357371572;
        Fri, 22 Jan 2021 15:16:11 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:7a75:92bf:7a96:770e])
        by smtp.gmail.com with ESMTPSA id i36sm3413677pgi.81.2021.01.22.15.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 15:16:10 -0800 (PST)
Date:   Fri, 22 Jan 2021 15:16:08 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] pinctrl: pinmux: Add pinmux-set debugfs file
Message-ID: <20210122231608.GA13062@x1>
References: <20210121051806.623743-1-drew@beagleboard.org>
 <CAHp75Vd5M0kyNzq+5gcZEd=6hK_7Y5_dEJ39-yQO7WuYRM4KWw@mail.gmail.com>
 <20210121232653.GA672978@x1>
 <CAHp75Vejt3mN4SBTVnRkyLkDA+jnh3Y4pC5bOGdKAdUZGCPFWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vejt3mN4SBTVnRkyLkDA+jnh3Y4pC5bOGdKAdUZGCPFWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 11:50:52AM +0200, Andy Shevchenko wrote:
> On Fri, Jan 22, 2021 at 1:26 AM Drew Fustini <drew@beagleboard.org> wrote:
> > On Thu, Jan 21, 2021 at 01:18:58PM +0200, Andy Shevchenko wrote:
> > > On Thu, Jan 21, 2021 at 7:18 AM Drew Fustini <drew@beagleboard.org> wrote:
> 
> ...
> 
> > > > RFC question: should pinmux-set take function name and group name
> > > > instead of the selector numbers?
> > >
> > > I would prefer names and integers (but from user p.o.v. names are
> > > easier to understand, while numbers are good for scripting).
> >
> > I don't actually see any example of looking up the function name in the
> > existing pinctrl code. There is pin_function_tree in struct pinctrl_dev.
> > pinmux_generic_get_function_name() does radix_tree_lookup() with the
> > selector integer as the key, but there is no corresponding "get function
> > selector by name" function.
> >
> > I think I would need to go through all the nodes in the radix tree to
> > find the name that matches. Although, I am just learning now about the
> > radix implementation in Linux so there might be a simpler way that I am
> > missing.
> 
> I probably have to revive my work towards gluing ACPI with pin control
> where AFAIR I have created some kind of radix / rbtree for something
> (not sure it's exactly what you need here, so consider this just as a
> side note).
> 
> ...
> 
> > > The following is better to include in documentation and remove from
> > > the commit message.
> 
> > > Shorter is better, what about simply
> > >
> > > # cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pinmux-functions
> > > ?
> > >
> > > Btw  in reST format you may create a nice citation of this. And yes,
> > > this should also go to the documentation.
> >
> > Good point, I'll shorten the example lines in v2.
> 
> Even better to tell that we operate on the level of mount point of
> debugfs and use
> 
>  # cat pinctrl/44e10800.pinmux-pinctrl-single/pinmux-functions
> 
> > > This and above is still part of documentation, and not a commit message thingy.
> >
> > Is something I should add to Documentation/driver-api/pinctl.rst in a
> > seperate patch?
> 
> Not sure, I think more about as a part of this very path you change
> code and documentation. But usually it's a preference of the certain
> subsystem.
> 
> ...
> 
> > > > +       if (cnt == 0)
> > > > +               return 0;
> > >
> > > Has it ever happened here?
> >
> > Good point, I guess there is no reason for userspace to write 0 bytes.
> 
> My point is that this check is done somewhere in the guts of kernfs.
> When in doubt I recommend to look around in the kernel and check most
> recent code with similar code pieces.
> 
> ...
> 
> > > > +       buf = memdup_user_nul(user_buf, cnt);
> > > > +       if (IS_ERR(buf))
> > > > +               return PTR_ERR(buf);
> > > > +
> > > > +       if (buf[cnt - 1] == '\n')
> > > > +               buf[cnt - 1] = '\0';
> > >
> > > Shouldn't you rather use strndup_from_user() (or how is it called?)
> 
> Any comments?

Sorry, I had meant to comment on that.  I tried strndup_user() but had
difficulty in using it as 'length > n' was always true and thus returned
an error.  There are not that many users of it either.

I've switched to this based on how armada_debugfs_crtc_reg_write() in 
armada_debugfs.c handles the user writing multiple integers:

        char buf[16];

        if (cnt > sizeof(buf) - 1)    
                cnt = sizeof(buf) - 1;
        ret = strncpy_from_user(buf, user_buf, cnt);
        if (ret < 0)
                return ret;
        buf[cnt] = '\0';
        if (buf[cnt - 1] == '\n')
                buf[cnt - 1] = '\0';  
	// the parse with sscanf()

I choose 16 for buf as two integer numbers seperated by a space should
never be more than 16.  I suppose the downside is that it is allocated
on the stack but it is a small buffer.

I'll post v2 so it can be evaluated in the full patch context.

> 
> ...
> 
> > > Can be simply
> > >
> > >  err_freebuf:
> > >         kfree(buf);
> > >         return err ?: cnt;
> >
> > Thanks, I didn't really like the duplication but was having trouble
> > thinking of a cleaner way to write it.  That is good to know it is ok to
> > use the ternary operator in a return statement.
> 
> Again, depends on certain subsystem maintainer's preferences.
> 
> 
> > > > +       debugfs_create_file("pinmux-set", S_IFREG | S_IWUSR,
> > > > +                           devroot, pctldev, &pinmux_set_ops);
> 
> One more thing, as a preparatory patch please move from S_I* to plain
> octal numbers as it's preferable.
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
