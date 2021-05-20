Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA70389F82
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 10:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhETILt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 04:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbhETILt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 04:11:49 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB19C061574;
        Thu, 20 May 2021 01:10:28 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id 10so11809240pfl.1;
        Thu, 20 May 2021 01:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fgc3MSJEF2dvUk6J7VrW1TUKtv/b5izfCPz91BOaza0=;
        b=fWtJFnkBqwr4/yT89SomaJ3S6WBdDp0OG4kypY94b6UdCw6ipsBwPeD5DjLw1O1b7i
         BlKnNzo7HhhPX/XT6+yPfWx8TAvA4f1PSiMOewiV5L7gkVyK75mb8/03NaiJ/MnhPOeH
         4oYfhT+cTHeot+gwslIG+A6YQXVzv1hbRmeRwDTp6k4aHpl+iaEpOtiql+fPQQ8MI4+z
         300RmnrFlhXo52Cg0X09mwhgVZjgfei7TlphhegLuHil1Ri2hqtwegFiR+5NeJ4/6mhX
         pMzYc0YFSgCOWh+g+/d8CNKmWaowoCt+xuwtZGQiu8U4iUmczwctGn4Yc7x66fr0gvDW
         DT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fgc3MSJEF2dvUk6J7VrW1TUKtv/b5izfCPz91BOaza0=;
        b=ewGo306VYeuphfYUpd4wpXzo2CcuYsVZCxAxSyBIe7SY1xTJqIubhA1dcSPLZsTz1g
         3Ykf1ZXIjUNgoMl9NxrtHEei45cTOvKZ1w7fwtIZTU6kRHgvKKt3XOrELkMq5MG6xte4
         ISKuQ4mJ/bSbFO1/ogVRmoi2FZxJJDqhDx+9JRsN54f+OsY0sbVZmsyyCg4Ff96RzVwX
         pAtk1m1Z2aaqcCF/WIJsKpFFBbGdUvGuTGALapUDAzAIpV5W/n6Kh9/q8ezdfKELnXG4
         e8CqSQHGQPPRi2wbWcvcX+fu0SYGENrmSMaECsVJjjNoE8v3SR1NRkxfGaM26ufG8KcV
         YUOg==
X-Gm-Message-State: AOAM5300DQTFGtaVDc57D42iTtNzAkn2TlzACoQ5DSMjEYmOb9229uDZ
        ZExkDs7quvpRd9FACQbUHEO/r4gouZh5MvAuhCxN/IWxLEg=
X-Google-Smtp-Source: ABdhPJzoXv56PX9mE2cvK/ACtqsNaEmJeuGetWOrhz3jz9/Ayz3RB5OFwKJlT+lIffywJ8ITr1kYnFhIB6RbZ03EDeY=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr3377788pgc.203.1621498227612;
 Thu, 20 May 2021 01:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210516135531.2203-1-dariobin@libero.it> <20210516135531.2203-2-dariobin@libero.it>
 <CAHp75Vd8875hRNk1JK6gkmfxjqxBSu4cRNE1zJt9TyEW7TvsMg@mail.gmail.com>
 <1735504854.166374.1621346262270@mail1.libero.it> <CAHp75VeADiRKdfnsXQ=y3z1WAJBbtZ+P=8tdyYtVQpJrSrQ63Q@mail.gmail.com>
 <20210519100235.GA3063522@x1> <CAHp75Ve5sonh1qNgqqF1yr8OiuJVWXb-UJj+kzxQa7+R-YVoXQ@mail.gmail.com>
 <20210520041733.GA3269241@x1>
In-Reply-To: <20210520041733.GA3269241@x1>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 May 2021 11:10:11 +0300
Message-ID: <CAHp75Venn3Z6qz2HsELW108QORzZoLYdY8mDTxaKX-8c_3p3hA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: core: configure pinmux from pins debug file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Dario Binacchi <dariobin@libero.it>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 7:17 AM Drew Fustini <drew@beagleboard.org> wrote:
> On Wed, May 19, 2021 at 02:27:38PM +0300, Andy Shevchenko wrote:
> > On Wed, May 19, 2021 at 1:02 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > On Tue, May 18, 2021 at 05:01:30PM +0300, Andy Shevchenko wrote:

...

> > > Vladimir Zapolskiy wrote in e73339037f6b ("pinctrl: remove unused
> > > 'pinconf-config' debugfs interface"):
> > >
> > >     Of course it might be possible to increase MAX_NAME_LEN, and then add
> > >     .pin_config_dbg_parse_modify callbacks to the drivers, but the whole
> > >     idea of such a limited debug option looks inviable. A more flexible
> > >     way to functionally substitute the original approach is to implicitly
> > >     or explicitly use pinctrl_select_state() function whenever needed.
> > >
> > > This makes me think it is not a good idea to bring back pinconf-config.
> > > The pinmux-select debugfs file that I add added in commit 6199f6becc86
> > > ("pinctrl: pinmux: Add pinmux-select debugfs file") provides a method to
> > > activate a pin function and pin group which I think provides the same
> > > capability as long as the possible pin functions are described in dts.
> >
> > The problem is that the pinctrl_select_state() is very limited and has
> > no clear meanings of the states. Only few are defined and still
> > unclear. What does `sleep` or `standby` or whatever mean? It may be
> > quite different to the device in question. Basically what we need is
> > to say we want this device ('function') to appear on this group of
> > pins ('group'). And pinctrl_select_state() can't fulfill this simple
> > task :-(
> >
> > If we look at the ACPI case it makes that API completely out of useful
> > context (it can be used due to above and some kind of layering
> > violations, like PM vs. pin control).
> >
> > Since above is the debugfs interface we may return it for the certain
> > task, i.e. printing current function / group choice(s) (if it's not
> > done by other means) and allow to switch it desired function/group
> > (that's what Dario tries to achieve AFAIU).
>
> A write to the pinmux-select debugfs file will call pinmux_select() in
> drivers/pinctrl/pinmux.c which, after some validation checks, will call
> pmxops->set_mux() with function selector and group selector as
> arguments.  For pinctrl-single, this will invoke pcs_set_mux() which
> will ultimately set the mux mode bits in the register for each pin in
> that function.
>
> IS that useful for pin controllers in ACPI systems as well?

Yes, the debugfs interface is useful independently of the resource
provider. What I was talking about is the boot / driver load time pin
muxing and configuration as well as PM transitions.

-- 
With Best Regards,
Andy Shevchenko
