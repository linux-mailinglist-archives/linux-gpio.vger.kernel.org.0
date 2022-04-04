Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D206C4F126A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Apr 2022 11:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243336AbiDDJ4l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Apr 2022 05:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355343AbiDDJ4k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2022 05:56:40 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33B53BFBC
        for <linux-gpio@vger.kernel.org>; Mon,  4 Apr 2022 02:54:43 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id b13so8537308pfv.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Apr 2022 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AVm91FPyNP2NjfhVF1sWs4h47t8yJuesOsciKqzMbuE=;
        b=SwivBDK2/SPNY9kj5k/g/xJ8h6pJmImZcqibn8y+kiI62owyLkHAqW5CYurdzdfAUk
         93XNy5SsTFazZSd6rp/IwGFtQ6YxZ70p6a05uv11q8GYb3pQ+G2g+C3c/n+YW9vJ/cHr
         S/7Vk4lFkCKMxPVP9ftp/BHwWv/AIjeYPpheKDWKjsypjryehQB0JTcqoToPG1uA4AR9
         RRLioQdyONI+/FPb/VeT3fRxLMCYTOUKC5BVCo+jTpZ09ZiNX1yakLQcJcU33N6EBF4t
         O4y44K2tb/E1LH4FzBlnOC3hpTVvGl7e2/bAJLiGQOQsJlGaskeQZSkD2eYWWO6ffjmG
         iLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AVm91FPyNP2NjfhVF1sWs4h47t8yJuesOsciKqzMbuE=;
        b=Khyztzga9cstIi7P+QBgoSQZHNlfLeMNoua27DMdER7UZE8HwvbGIQxkSKAcP8Yg9W
         UyLUzghTl3H0Km4nHndHa3v0tmx0Ey7EF6nGalCPIjFZXLgFRG3KJTe/ndiBsfUKGZz2
         pM7+hGXel1aTxIqN4U8CxraKuQ0HvIiCu7VUO8QQ+t5YJBP0zuNA0mR/8ZOAAkcJyGgB
         BfovdCq3l6JiJTM7f6k7UJpIPLGSIB3xnfdSyixt1nr7gAP1QJXEtLiQQpqvezQlgY0x
         XH8yrclKXUO/lm6mSB3SmfXUyRupmSpafVJm972Z0KRdk5uvabT1TGVepu0e8MGRvclM
         dRjQ==
X-Gm-Message-State: AOAM5300W8ZztHjkIh/jhEhRXkapRlCqWa60QLNGmSubDnaHn/Mwezyi
        1zm0mqtOOFKWIiyMeUp2BeJvYl9tONjb9A==
X-Google-Smtp-Source: ABdhPJxXtA3xx1GiGGa0eO67o3yOzTIdkJEXZz1VvXeATGGGGkmn+vGE2OTTTwfEJD+hTtCoBGzRHA==
X-Received: by 2002:a05:6a00:1702:b0:4fd:ada2:b1bb with SMTP id h2-20020a056a00170200b004fdada2b1bbmr22287731pfc.60.1649066083145;
        Mon, 04 Apr 2022 02:54:43 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id l2-20020a056a0016c200b004f7e3181a41sm12131430pfc.98.2022.04.04.02.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 02:54:42 -0700 (PDT)
Date:   Mon, 4 Apr 2022 17:54:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 0/4] core: add gpiod_request_lines
Message-ID: <20220404095437.GA24083@sol>
References: <20220331011141.53489-1-warthog618@gmail.com>
 <CAMRc=MfqgEozMGR-24O=Eeoo+v2QYc8n_NHPb0A7GYDL_1bL=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfqgEozMGR-24O=Eeoo+v2QYc8n_NHPb0A7GYDL_1bL=Q@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 02, 2022 at 02:47:31PM +0200, Bartosz Golaszewski wrote:
> On Thu, Mar 31, 2022 at 3:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > In my review of the CXX bindings I suggested a top-level version of
> > Chip.request_lines(), and possibly a C API version as well, so here
> > is the C version, plus a couple of semi-related tweaks I made along
> > the way.
> >
> > The first patch adds the gpiod_request_lines().
> > Patch 3 migrates the appropriate tools.
> > Patch 4 minimizes the lifetimes of objects in the tools as I've
> > previously seen confusion over how long lived objects need to be.
> > Patch 2 is just a rename cos "inexistent" looks weird to me.
> > Strictly speaking it is fine, but unless there is a problem with
> > using "nonexistent" I would go with the latter.
> >
> > This series may be require my unsigned values patch.
> >
> > Cheers,
> > Kent.
> >
> > Kent Gibson (4):
> >   core: add gpiod_request_lines
> >   tools: rename inexistent to nonexistent
> >   tools: migrate to gpiod_request_lines
> >   tools: minimize object lifetimes
> >
> >  include/gpiod.h            | 15 ++++++++
> >  lib/line-request.c         | 17 +++++++++
> >  tests/tests-line-request.c | 73 ++++++++++++++++++++++++++++++++++++++
> >  tools/gpio-tools-test.bats |  4 +--
> >  tools/gpiodetect.c         |  2 +-
> >  tools/gpiofind.c           |  2 +-
> >  tools/gpioget.c            | 25 +++++++------
> >  tools/gpioinfo.c           |  4 +--
> >  tools/gpiomon.c            | 16 ++++-----
> >  tools/gpioset.c            | 18 +++++-----
> >  tools/tools-common.c       | 50 ++++++++++----------------
> >  tools/tools-common.h       |  5 +--
> >  12 files changed, 164 insertions(+), 67 deletions(-)
> >
> > --
> > 2.35.1
> >
> 
> Ugh, I didn't respond under the C++ review in time before you spent
> time on this. :/
> 

Not a problem - it was just something to fill in time.

> I don't agree with this change. For C API I think the intention for v2
> was to avoid having all kinds of high-level helpers and limit the
> number of functions to only those that are necessary to fully leverage
> the kernel uAPI and this one isn't necessary. I think we discussed it
> multiple times and agreed that the C library needs to be minimal this
> time.
> 
> For C++ and Python the issue is irrelevant because you can do:
> 
> auto request = gpiod::Chip("/dev/gpiochip0").request_lines(req_cfg, line_cfg);
> 
> or
> 
> request = gpiod.Chip("/dev/gpiochip0").request_lines(req_cfg, line_cfg)
> 

The point isn't being able to do a one liner, the point is to remove the
chip object from the set of concerns for the basic use case, and so
provide an easier on-ramp for the casual user.

> respectively and achieve the same result while still using a one-liner.
> 
> Unless there's a *really* good reason to do this, it's a NAK from my side.
> 

That's fine.

Cheers,
Kent.
