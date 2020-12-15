Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BC22DB495
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 20:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgLOTjS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 14:39:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728353AbgLOTjP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 14:39:15 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FACCC0617A7;
        Tue, 15 Dec 2020 11:38:30 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id t8so15118711pfg.8;
        Tue, 15 Dec 2020 11:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZbJ6SJgre0dF80DUtFgnvaN2enctWrPlJJXkPG7QaY4=;
        b=KLkRaKAC0dKQyYyO97Ta73bjPAYU4548DUBIbsvXFAc8bCfzw8MaR3VILYuNdH9nyD
         1LQa2Kd8Lj4XlPXiUyqYLkJJnuY+JrTridHESZlSFaH/hn9mDx1VMKnNvdV8fTWM/rnC
         PPD/cDszwBkEqhHDz7c6pFX3MAox8tKlU4y0CkKzSknekjrb9SzHwU5aXoc6y4NkPjo6
         1DFQeZR0rlJMrzLv3ssDVvF5SgyC4RQFR+scokwS2yiCJf9I2CkFAxUvP3pe8usnhF0b
         24UiJTPze/31842OWGI/wSG0XJO7ThHS3H7UAHP7TnrNqY737wKWUNU7lBCzM+L3PZk9
         zieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZbJ6SJgre0dF80DUtFgnvaN2enctWrPlJJXkPG7QaY4=;
        b=Cp1QAUymOkEFi01y2/qc57REyGkElx3mBE9KR9F+ykw8cyEWH/wdPVcRH8z/IABWg2
         7a0wTHlCLly2BP1yXePRX6zkmXICbKcpg23ST/tovCcReBcci3WrkCk04T5SL+Oo3Df5
         PVfiMTElTHeuC5qdoeFQw5VSHi7VmJ+LHs5bbEZkdtdlg39BL6CewXLWiMdTQm7osk8s
         p6YP/oV9UdPInsOWQZm+CtSul8/RCr2UIpxzxHA1kPeNbj1LwgbtE8vQ2PUk1Qc/BB64
         8NjABo54dC53xecyZlpMNQH5fBgjgtg5N+DtfcOuEaTAlLBfWDt2jgXL+8C0N7Mf8wbl
         w56w==
X-Gm-Message-State: AOAM5302KFIIn+NXBYE7JHWwDt2eJ5CNF+UHxp0/86kWI7wziTweVRui
        Yf2FOYugRaxaZ9VL4AQOlO3BQfx+t+Vv6tB66pdKQ4Bw6Z4k+A==
X-Google-Smtp-Source: ABdhPJx+7Sm5/L9uMvdL4mjDgGLf+E8+AH63NJs9rxOMLXhsK2o2HQxbxch7q1Pq/jlMsR1pJroN7yGn0X63u96gQ1Q=
X-Received: by 2002:a63:c04b:: with SMTP id z11mr3992898pgi.74.1608061109811;
 Tue, 15 Dec 2020 11:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20201211042625.129255-1-drew@beagleboard.org> <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
 <20201211234304.GA189853@x1> <CAHp75Vf-=nM-M2K-v_8iyME4t6ZF-gvSZ5ePsxQFhObJ_0YHsw@mail.gmail.com>
 <20201214214419.GA1196223@x1> <CAHp75VeN9xLUKFBXZfo=XzNkdv=BSRJW59=cUjyY0TekF1JONA@mail.gmail.com>
In-Reply-To: <CAHp75VeN9xLUKFBXZfo=XzNkdv=BSRJW59=cUjyY0TekF1JONA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Dec 2020 21:39:18 +0200
Message-ID: <CAHp75VdGEe9F69=uzaDiCf9C8byh6ThuCJLMch1dBXEH4MA2Sg@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in debugfs
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 15, 2020 at 9:36 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Dec 14, 2020 at 11:44 PM Drew Fustini <drew@beagleboard.org> wrote:
> > On Mon, Dec 14, 2020 at 07:55:12PM +0200, Andy Shevchenko wrote:

...

> > With regards to parent directory, I did discover there is
> > debugfs_lookup(), so I can get the dentry for "pinctrl" and create new
> > subdirectory inside of it.  This is the structure now:
> >
> > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_35_pinmux/state
> > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_34_pinmux/state
> > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_33_pinmux/state
> > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_32_pinmux/state
> > etc..

Missed part to comment.

I was talking about

/sys/kernel/debug/pinctrl/<$PINCTRL>/mux/<$PIN> (maybe folder, maybe node)

-- 
With Best Regards,
Andy Shevchenko
