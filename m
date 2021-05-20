Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C9F389C60
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 06:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbhETES6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 00:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhETES6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 00:18:58 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B74C061574
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 21:17:36 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id b13-20020a17090a8c8db029015cd97baea9so4625009pjo.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 21:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vSAhZlU3cc1f6R2gciMFVwjz3Y0xmsU0eN+/yBhrwpg=;
        b=0mpN1Faim4HtKeNt6TXGKV0MLs4V1OI1LaBLltG6s635DQj0Z2aN3x8Kj7Q/yk77CS
         7ljPE3+EYFnL8m99Y52+e8bAywN75Js1Kkcf1/tfjMfPxAtFWt29XsWJh80nt2AOmIE8
         QsSH2SeYrE+1O6/FbThzgIS9mBU6sLOif1wensg5FuQZ6kl12MvGeLDKAB/+8WeLxGDS
         jYa7eGR1cXMqwibtdUzfOFh7eRgfxHmdHEWk8ddM9YmyAdjuBcfIc3PzuasJzQGzfn3d
         oLdrhwiBSy/IQutIFPSZ3ZvCIA3n6iHsIhxLQNBGxfnXphjjI2XhT2rQdiZbmaTM2msn
         MSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vSAhZlU3cc1f6R2gciMFVwjz3Y0xmsU0eN+/yBhrwpg=;
        b=Lj01eCCd3S5+Jkx06kUOwugF1BzF2sidn1QsxAU2mT0FRLoNCxubua80oXUoZ/37PQ
         vUYL7ecjAcnVcxhGAnzIzSwc2UF4534v7DpLGOjYImkpIBaG6o7K5Z5NpR3E3o0H7200
         AjOwDvGix+WFnNlsjE2vwitH7rZu98HB2MHbEPkMMMkSE2QczERhzpTQF/5VLn8a716I
         sgWIdykzuNMlPuZrCrSVwOO0gcOa20pjvjSe/oPDV41+2iRrFsOeqtxxNPdQYF/8FnwC
         7aliYKTsIytOtjwJRd+NHCIXFwxSKXZm+DdvGgTCg9AG/ZCvHhLLwLfuNAwhkDT1Jadk
         3CbA==
X-Gm-Message-State: AOAM5303l0EPpzeWzsjxcAufNSqFnVKlZGJ38e4aQot0/2F/RaIt1HyU
        KHOCeBvgIhWnI+C4pZsoJHyid4dhcugUvw==
X-Google-Smtp-Source: ABdhPJwC+NZfBg5/s5BAg4vrE8D40RHS9LjfijOWYCDvRAAjOrfBrExkmcrqP7cNnplO8+M6GwLXHw==
X-Received: by 2002:a17:90a:c712:: with SMTP id o18mr2679294pjt.157.1621484255903;
        Wed, 19 May 2021 21:17:35 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:1ac3:31d1:689c:7daa])
        by smtp.gmail.com with ESMTPSA id 128sm707095pfy.194.2021.05.19.21.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 21:17:35 -0700 (PDT)
Date:   Wed, 19 May 2021 21:17:33 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dario Binacchi <dariobin@libero.it>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 1/2] pinctrl: core: configure pinmux from pins debug file
Message-ID: <20210520041733.GA3269241@x1>
References: <20210516135531.2203-1-dariobin@libero.it>
 <20210516135531.2203-2-dariobin@libero.it>
 <CAHp75Vd8875hRNk1JK6gkmfxjqxBSu4cRNE1zJt9TyEW7TvsMg@mail.gmail.com>
 <1735504854.166374.1621346262270@mail1.libero.it>
 <CAHp75VeADiRKdfnsXQ=y3z1WAJBbtZ+P=8tdyYtVQpJrSrQ63Q@mail.gmail.com>
 <20210519100235.GA3063522@x1>
 <CAHp75Ve5sonh1qNgqqF1yr8OiuJVWXb-UJj+kzxQa7+R-YVoXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve5sonh1qNgqqF1yr8OiuJVWXb-UJj+kzxQa7+R-YVoXQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 02:27:38PM +0300, Andy Shevchenko wrote:
> On Wed, May 19, 2021 at 1:02 PM Drew Fustini <drew@beagleboard.org> wrote:
> > On Tue, May 18, 2021 at 05:01:30PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > Vladimir Zapolskiy wrote in e73339037f6b ("pinctrl: remove unused
> > 'pinconf-config' debugfs interface"):
> >
> >     Of course it might be possible to increase MAX_NAME_LEN, and then add
> >     .pin_config_dbg_parse_modify callbacks to the drivers, but the whole
> >     idea of such a limited debug option looks inviable. A more flexible
> >     way to functionally substitute the original approach is to implicitly
> >     or explicitly use pinctrl_select_state() function whenever needed.
> >
> > This makes me think it is not a good idea to bring back pinconf-config.
> > The pinmux-select debugfs file that I add added in commit 6199f6becc86
> > ("pinctrl: pinmux: Add pinmux-select debugfs file") provides a method to
> > activate a pin function and pin group which I think provides the same
> > capability as long as the possible pin functions are described in dts.
> 
> The problem is that the pinctrl_select_state() is very limited and has
> no clear meanings of the states. Only few are defined and still
> unclear. What does `sleep` or `standby` or whatever mean? It may be
> quite different to the device in question. Basically what we need is
> to say we want this device ('function') to appear on this group of
> pins ('group'). And pinctrl_select_state() can't fulfill this simple
> task :-(
> 
> If we look at the ACPI case it makes that API completely out of useful
> context (it can be used due to above and some kind of layering
> violations, like PM vs. pin control).
> 
> Since above is the debugfs interface we may return it for the certain
> task, i.e. printing current function / group choice(s) (if it's not
> done by other means) and allow to switch it desired function/group
> (that's what Dario tries to achieve AFAIU).

A write to the pinmux-select debugfs file will call pinmux_select() in
drivers/pinctrl/pinmux.c which, after some validation checks, will call
pmxops->set_mux() with function selector and group selector as
arguments.  For pinctrl-single, this will invoke pcs_set_mux() which
will ultimately set the mux mode bits in the register for each pin in
that function.

IS that useful for pin controllers in ACPI systems as well?

thanks,
drew
