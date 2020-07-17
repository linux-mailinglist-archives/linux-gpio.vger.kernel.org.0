Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9833224499
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 21:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgGQTuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 15:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgGQTug (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 15:50:36 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C588C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 12:50:36 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o2so18904558wmh.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 12:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cKkwHo3dGm++6DP5ugT/LyD0lLk8abpGWcCQb6GKZMc=;
        b=vDIMYlvwH5ljESb2YT7DRqzMpw4zlYCQACKHBGTLEr/yui3eGufGq7Oy0emJ/a1cfH
         RI7vuRCC1ouYkb7oOp2Y+av7Nkv9cbykJtG9YKLEefYMucfmbNYanONzA8HSnmexVlfz
         +3GjCNINRoBLeb3yI9ohVEZ46Tl4LtlhPWkOt9Nk80LVZiNN1zGJvUzw22WapG0rHqaH
         aCpcAOYFpRfcHHqp5twkswJZRGxdTjyFKyp3wYCkGK7qHKaNg0qHlMREMOC9I1S3GdzH
         UIEsZgRRcMOkiCn4FZCl9flWPO8UQYugdIorbwE1jmXnDCthAwHHzJkoPtM2zdasg1SZ
         GakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cKkwHo3dGm++6DP5ugT/LyD0lLk8abpGWcCQb6GKZMc=;
        b=kX47EfKbgLCo7V6DVmMS233zvuC23v5sC57hfM/EhAceSiEgFj6zms7t+AdceTBA/Q
         H95ffXO0mPyyt6mM4T74RXqfw/HT7zd711lAnlUc1s1YAJ1A6SWvGvH7qnJK5O/qf1OY
         iy6peSDXrq98kbH4u0wXpH59nAyjgjthupLRbDSuCzJvLzP7/HNhxOr0jg7C+XR6UNBF
         e8Wi/b8WPc32KzsxgPHRRWjjGGeqe7Enbf0mWVRnoK7MB/hY2Esql9hD/MXeAAeIfx95
         0vEnVqgvYMed9zmIVmF3DYtSKVPtTa1HBUiski5WmjzBBSaEXEXAy71uMLd9pcZAU4AW
         +kUQ==
X-Gm-Message-State: AOAM532CTLV8IuVBVpvt2r8WVgeDmIZRXPpXe+L3Nxo3Bo9GpznJ5w1l
        mdDQ8I/h8sacwx1xcIf2hOA91g==
X-Google-Smtp-Source: ABdhPJxyhe96hSE7hC0LJ2IqzuOF4Jzi0rfudABw3yLj78f2XSPiwIMuVUxqwBR2sXoH0iS1pFHu8w==
X-Received: by 2002:a1c:5581:: with SMTP id j123mr10419425wmb.75.1595015434273;
        Fri, 17 Jul 2020 12:50:34 -0700 (PDT)
Received: from x1 (92.40.249.21.threembb.co.uk. [92.40.249.21])
        by smtp.gmail.com with ESMTPSA id u1sm19631335wrb.78.2020.07.17.12.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 12:50:33 -0700 (PDT)
Date:   Fri, 17 Jul 2020 21:50:28 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] pinctrl: single: print gpio number in pins debugfs file
Message-ID: <20200717195028.GA1775511@x1>
References: <20200717013338.1741659-1-drew@beagleboard.org>
 <CAHp75Vd_s-W7Z1iG4fA5JvY51OzstkTYUcQcd=OGJUQtcJ75Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd_s-W7Z1iG4fA5JvY51OzstkTYUcQcd=OGJUQtcJ75Ww@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 06:14:06PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 17, 2020 at 4:36 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > If there is a gpio range mapping for the pin, then print out the gpio
> > number for the pin in the debugfs 'pins' file.
> >
> > Here is an example on the BeagleBone Black:
> 
> >   pin 0 (PIN0) 44e10800 00000027 pinctrl-single GPIO-32
> >   pin 1 (PIN1) 44e10804 00000027 pinctrl-single GPIO-33
> >   pin 2 (PIN2) 44e10808 00000027 pinctrl-single GPIO-34
> >   pin 3 (PIN3) 44e1080c 00000027 pinctrl-single GPIO-35
> >   pin 4 (PIN4) 44e10810 00000027 pinctrl-single GPIO-36
> >   pin 5 (PIN5) 44e10814 00000027 pinctrl-single GPIO-37
> >   pin 6 (PIN6) 44e10818 00000027 pinctrl-single GPIO-38
> >   pin 7 (PIN7) 44e1081c 00000027 pinctrl-single GPIO-39
> >   pin 8 (PIN8) 44e10820 00000027 pinctrl-single GPIO-22
> >   pin 9 (PIN9) 44e10824 00000030 pinctrl-single GPIO-23
> 
> Wouldn't it be better to have this for all types of pin controllers?
> But I'm not sure about the format of output.
> 
> -- 
> With Best Regards,
> Andy Shevchenko

I added the gpio column based on Tony's feedback [0].

I'm not sure how I could do it genericly.

The pin_dbg_show callback is implemented in pcs_pin_dbg_show() which
prints the contents of each line in the 'pins' file.

Any advice on how I could implement a gpio column for 'pins' file
without chaning the pin_dbg_show in all the drivers?A

thanks,
drew

[0] https://lore.kernel.org/linux-gpio/20200713180519.GN5849@atomide.com/
