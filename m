Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1213556BD5B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 18:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238895AbiGHP6P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238878AbiGHP6O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:58:14 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE6D71BEE
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 08:58:13 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q82so15530079pgq.6
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 08:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bCdsOBDDTPK7PW4kN4NJMpcc9fLN0r1ZfXgU6hJc7+s=;
        b=EP0ov6RnoK38A6De4pCXrKmhA8yrwKd8/v+hBoA6BGYQCYr1jb+9cnz+/cxLhBkpX4
         rRonov8H/0BWUVf2wulyfCIOi5iTJQopoz0r++eqx7xKKYk8WsW7WgPOl+mxsQ4sm845
         gilfwtvHGZ5jGyV7GsVMytPog+otrVcJ+Kfy2TRXaFcw5et5iMn6BNdKCmxixGshXs4Y
         aa+5Sib8F02AmEdf3OVTHRHbdV/uH4nH2rIwkn8Gs8uWay2LBLyYKUjPkgFZkHC/CfiY
         uBlZ78wkcrqLj6N/ayiAflkBsQwxInHjvCDAd7MXJa1CBrO/BQ31PsLdHZ9TTwa9Qg62
         F+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bCdsOBDDTPK7PW4kN4NJMpcc9fLN0r1ZfXgU6hJc7+s=;
        b=6u6jjdzbCzK+SnDSpumW6+jwNa5yjoaLrmj0lX7eR7/c+x4SpmTwBRi6GeG+l2NFLo
         mSrEw9vInoAMMB1rb0MoKWmOKnjMPiFQyF9N8s+zjvov238+Oj8+nITPwOEYyMBH4WbC
         rOoKVh2/OSWvD9iIRvqQBWakWkIOzodDDF6rP3rkGjxaXKJ0vvq47BTR6cCWrgtJeEhv
         HgrkXHr49D7hDf3EsokSaFTVnivVlFmJyHPgiK5VFvDQpQH5t8sMKMG2MGj30Oa2eS4g
         S5fZbMNsVhPCQq+qZa/Uc8CCWqRAQnSs+sYAUY5M4eiaBH3fzZE0DHl1+IXcRDHJbpJx
         CDZw==
X-Gm-Message-State: AJIora8PooCezrBx61RxCYdD1kMtlNHo8UYSTACKbk7B6TM1tjHVbxGt
        aAYCaez8UmlPMdNSMjpyP2Wp/ko3jGE=
X-Google-Smtp-Source: AGRyM1tcQxFT36MXCjmVBs4DKlNQQpv7EQP4+sxEZrhQIs8jp4RjymMWDOyCC2shv1ub7zuC+xGAoQ==
X-Received: by 2002:a63:6cc8:0:b0:40d:e553:f200 with SMTP id h191-20020a636cc8000000b0040de553f200mr3765290pgc.166.1657295892955;
        Fri, 08 Jul 2022 08:58:12 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id n18-20020a170902e55200b0016bc4a6ce28sm8698884plf.98.2022.07.08.08.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:58:12 -0700 (PDT)
Date:   Fri, 8 Jul 2022 23:58:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
Message-ID: <20220708155806.GA111622@sol>
References: <20220628084226.472035-6-brgl@bgdev.pl>
 <20220705020937.GB6652@sol>
 <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
 <20220707130955.GB66970@sol>
 <CAMRc=MfuzzjkApJ4LBARG0OpfvfBeMqVMTRnKJuj7zV4Gvez1Q@mail.gmail.com>
 <20220708013834.GA6484@sol>
 <CAMRc=MfGT_FZ=LToa4DPqc3UqjAbt+9dpT2NtKOmMqhcFKWLZQ@mail.gmail.com>
 <20220708105634.GA84979@sol>
 <CAMRc=McSN5MEOXW0husOaX62EQq+xZyahX1SuvmimuZHOT1RTw@mail.gmail.com>
 <CAMRc=McupSnE+m0uOcMh3T9wm74J4Z+N5f_GKnQf5D2jxHoLVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McupSnE+m0uOcMh3T9wm74J4Z+N5f_GKnQf5D2jxHoLVg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 05:26:52PM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 8, 2022 at 1:28 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Fri, Jul 8, 2022 at 12:56 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> >
> > [snip]
> >
> > > >
> > > > The limitation of the uAPI is what keeps us from making it true in
> > > > user-space (that each line can have its own config). As it is, only up
> > > > to 9-10 lines can have distinct configs and making the API look and
> > > > behave as if it wasn't the case is more confusing (E2BIG errors) than
> > > > simply admitting we have the concept of defaults and overrides (to
> > > > which the interface is greatly simplified in the high-level
> > > > libraries). The idea about making the most common config attributes
> > > > become the defaults is simply bad. It would require the user to
> > > > anticipate how the library will behave for every attribute and lead to
> > >
> > > It requires nothing from the user.  They are not even aware of the
> > > concept of "defaults" or "overrides".  They just set config on lines.
> > > If that is too complicated, which is quite unlikely, then they get
> > > E2BIG and they need to repartition their lines into multiple requests.
> > >
> > > Anyway, that horse is dead.
> > >
> >
> > For a python user, this:
> >
> > lc = gpiod.LineConfig()
> > lc.set_props(offsets=[2, 3], direction=Direction.OUTPUT)
> > req = gpiod.request_lines("/dev/gpiochip0", line_cfg=lc)
> >
> > is pretty much as simple as it gets. They still don't need to be aware
> > of the underlying split into defaults and overrides. I believe it's
> > GoodEnough™.
> >
> > I imagine in Rust bindings we'll be able to chain set_props() as is
> > customary and we'll get a one-liner out of that.
> >
> 
> The code I posted here is wrong as it's missing the request config but
> it made me think: how about in case of req_cfg=None or not passed at
> all, we derive the lines to request from overridden offsets in the
> line config? In that case if the user does:
> 
>   lc = gpiod.LineConfig()
>   lc.set_props(offsets=[0, 1], direction=Direction.OUTPUT,
> output_value=Value.ACTIVE)
>   lc.set_props(offset=4, direction=Direction.INPUT)
>   req = gpiod.request_lines("/dev/gpiochip0", line_cfg=lc)
> 
> Then it will be interpreted as lines=[0, 1, 4]?
> 

That makes sense to me - I also dropped the req_cfg from my examples
as it was redundant.
Why force the user to provide the req_cfg merely to repeat the lines in
the line_cfg?

> I'm also thinking that we could allow the output values to be mapped
> as <line name> -> <value> within gpiod.LineConfig like that:
> 
>   lc.set_props(lines=["foo", 4], direction=Direction.OUTPUT)
>   lc.set_output_values({"foo": Value.Active, 4: Value.INACTIVE})
> 
> It would require us to retrieve the names of all lines from the chip
> at the time of the request and store them in the request structure
> (for reconfigure to work) but it would make the entire thing even more
> "pythonic".
> 

This is what I meant by giving LineConfig "the line kwarg treatment" in
my original review comments - wherever you were taking 'offset' accept
'line' instead (being a name string or offset int).
It makes the binding more complex as the mapping is deferred, but the
result is more pythonic and consistent wrt line identification across
the API.

OTOH I can understand if you think the API benefits aren't worth the
added internal complexity, which is why I didn't worry too much when you
didn't change it in this version - just thought you decided it wasn't
worth the effort.

Cheers,
Kent.
