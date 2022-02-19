Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 433724BC388
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Feb 2022 01:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240388AbiBSAhg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 19:37:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236378AbiBSAhg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 19:37:36 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786E822BE4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:37:18 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id l8so8398792pls.7
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1adudf/hLmQLWsIAJMUWYO76lS0FapQwTOhPdI+tpdc=;
        b=fnFHUCPxxPIaNt1bMmga4ApyyGFy0adj9qJxzL1a/cN0jgkw4Pyfx/JRuYPP91w+f1
         mowjpO9OgKGTF0HIoyFczKIQFRzQX/Mkyy6AmAW/RQ6oOgvqiYoku0D6ugZzIA+ByFvd
         Et/+eyVE88Kkqej4y77sCo4+fRga4R6/5uIgDLTBFRns1GqFN990InphjdvFTNWX9PzA
         yauHQfIjLnAM/yv5lQ6zhLlSfWTUqhJpiVldu2UDl6O6f/HAzO3P7pJGjHiSehgKY/ZC
         JHajt4Iy6k2CWOpL3HcMzKjF3pr/T7fr9mCqPmldsYOr/nRPb5MboP/EMh55n0177VTp
         nVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1adudf/hLmQLWsIAJMUWYO76lS0FapQwTOhPdI+tpdc=;
        b=kNNeEYiy6meTnK8nVz3ppFqXDkpXv02CA6iSkXkyFVhTT29AB/4hwS5V7ncj7O9Xjr
         B1G5O70MvkxE0jndZ4tAsrpPd+RF8DGKA4OYGPr+8VQZrDBq/bpRQxzDH9UyjwVYmpxY
         YJHZ13gdblY7X6EomFOeF/oTMTZi/FKYYZHOfKK3KF7QBVOV6Np4MZwuT+7i1IUMZtPn
         5nrUosCzTNLsRiN1WZ600l2cIykRfwcwzDw5niRQu683QCrqQKQIwr/cjMWrOIWDe1p8
         YZna9QRhmHhs8eW+21iFjR1X/j2lZ2/jFM4BBzFw4xtk4rXLbPmPCKZm+0YjvlFn8iE+
         RebQ==
X-Gm-Message-State: AOAM5314Cl1KxW4dfzyPfl6CDH+Ypb7u43dfc8hxzH23nsZponcIc8AL
        ZyPz60ckDFHWDyfxcSV/5Vayq51BDrQDDQ==
X-Google-Smtp-Source: ABdhPJylogsT9D98Q0LQ4OwBf7Rt+makmu1F6OiPCc0zmAM0u/7XBT69ZM9Lsn6n3Nda+qqcoAQ6oA==
X-Received: by 2002:a17:90a:664a:b0:1bb:f3c6:56a with SMTP id f10-20020a17090a664a00b001bbf3c6056amr1095996pjm.4.1645231037935;
        Fri, 18 Feb 2022 16:37:17 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id n29sm12061123pgc.10.2022.02.18.16.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 16:37:17 -0800 (PST)
Date:   Sat, 19 Feb 2022 08:37:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH] tools: port the test-suite to using gpio-sim
Message-ID: <20220219003712.GA12202@sol>
References: <20220216150512.863462-1-brgl@bgdev.pl>
 <20220217015042.GA8195@sol>
 <CAMRc=Md4_Q5q6WxTCy_bCSwdXLri1WTcC+Gi=ANQM5u9J0SXuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md4_Q5q6WxTCy_bCSwdXLri1WTcC+Gi=ANQM5u9J0SXuQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 18, 2022 at 10:22:49AM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 17, 2022 at 2:50 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Feb 16, 2022 at 04:05:12PM +0100, Bartosz Golaszewski wrote:
> > > This makes the gpio-tools tests use the gpio-sim kernel module instead
> > > of the old gpio-mockup.
> > >
> >
> > I have a problem with unconditionally switching the tests to gpiosim as
> > that restricts building and running libgpiod tests to kernel v5.17 or
> > later.
> > That is fine for v2, but v1 is effectively legacy and so tests should
> > still build and run on legacy kernels.
> >
> 
> v1 is going to be supported for an indefinite period of time in the
> v1.6.x branch. The master branch is moving forward though. I'm
> applying changes that can go into v2 already to master and the big API
> change is still WIP so it's kept in the next/libgpiod-2.0 branch.
> 
> Only master will get this patch, not v1.6.x - it keeps using
> gpio-mockup because users depend on it - for instance
> meta-openembedded has a ptest package running the libgpiod tests based
> on gpio-mockup.

Oh, ok.  I was thinking [libgpiod] patches applied to the v1 branch and
[libgpiod v2] applied to v2. And that any common improvements, so
[libgpiod] patches that don't conflict with v2, would also be applied to v2.

That still makes sense to me, btw, as otherwise you get patches like this
where is it unclear if it is meant for master or v1.6.x.
Or is there another prefix for legacy?

> 
> > What is the benefit of the switch (other than exercising gpiosim)?
> >
> 
> So this conversion is pretty much one-to-one for now but just like the
> core C tests - gpio-sim will enable us to drop using gpioset when
> testing gpioget for instance (we can use hogs but I need to add this).
> We can also have gaps in line names etc.
> 

Fair enough.  I'm tempted to argue whether those improvements would actually
improve overall test coverage, but it certainly is more flexible and nicer
to use than mockup.
And I notice the tests also run faster as they doesn't have to do the mockup
module loading.  Yay.

Cheers,
Kent.
