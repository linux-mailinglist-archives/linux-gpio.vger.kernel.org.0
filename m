Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61FB16010C1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 16:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiJQOHZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 10:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiJQOHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 10:07:24 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A188F57E2E
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 07:07:23 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id l4so10859498plb.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WQZcE2kH6pJ8P65lar+6sDjpd5hFwyPDScQK2oTIUFk=;
        b=MMe3A+BgMVR6+/uZg9nTKn+/f92EODmi4OE53lXsetqxExgyi8mOHurJ7YDgPVUlF/
         hjJGwwLqpwtCtbN2+RTO2QpWrkoNu1k6pMjkzs8FyiOXde+uuYjM+VrE2rdmPgi5SLeH
         xEQROOKzZzZdjm1ojdBN9JnbGEttrh/WaqAsonr/szcorOnN0RQVoZowzMtZfOQn5MZS
         95YXtLITjTUMRrfNRgwmWxhdKje3hYv7ydL+Ccig4GtkZMz7tT9TvIRdxCZo3nMraZf+
         Mf67rxZ2dFZVkxVoWFkMdZ3ZAHn06EbnAhImk7x/7/i+/n5sksEQYllkQ4Qk+8PJ/1/5
         w2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQZcE2kH6pJ8P65lar+6sDjpd5hFwyPDScQK2oTIUFk=;
        b=FHOSPiW2G9PqWsFyQoFjuavQUmu2pin+JDYLA1vaNHzI39kXBU952EHyFF5nexPOZL
         wC3m15JF4F/Aisi24rO98cU46GlOV8pRXHcfCA+REWdrfuRH1lSxq7tWXSzB7Gmj3RZp
         nEM+IE2c/WbjG96l7OwnwxNNAv6970N8hKnbqi4PkY9EiHKG/p8Cx+x5zs4jtCc5Q2xB
         P6wA6tAQuaxerpHyZGTAYU5PxVWRTZlT6aEGOvpGRztngZUBU4ny+8Z/18UBZeeq5a6a
         2I0XO0diBTtW3xAPsmeuj9Z5xvSb8h+0pQerb4PtZ2bdxcsFuOTJ9xKeQwj9GEdJn5yo
         39Tw==
X-Gm-Message-State: ACrzQf0WrAT/rsr6OByORfzFppziFX+xbX+I2t88++GjXceCqPKaBZyK
        B2mWGu/sljzDayHmmPRy8dgj1UQQMRU=
X-Google-Smtp-Source: AMsMyM4UVjlkzfLhIzRfIE9kAYsqNi1VhlOITa8KvlfkvP70V2kSuvIqtxRtGsU0TAcBB4B2u2+CBA==
X-Received: by 2002:a17:902:ecc4:b0:180:3104:2fc0 with SMTP id a4-20020a170902ecc400b0018031042fc0mr12533231plh.56.1666015643144;
        Mon, 17 Oct 2022 07:07:23 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id g12-20020a17090a578c00b00202fbd9c21dsm6195622pji.48.2022.10.17.07.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 07:07:22 -0700 (PDT)
Date:   Mon, 17 Oct 2022 22:07:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y01hlUvj7cSdpCcx@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol>
 <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 04:49:55PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 17, 2022 at 08:11:28PM +0800, Kent Gibson wrote:
> > On Mon, Oct 17, 2022 at 02:00:15PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Oct 13, 2022 at 5:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > On Fri, Oct 07, 2022 at 04:55:19PM +0200, Bartosz Golaszewski wrote:
> > > > > This adds the regular set of example programs implemented using libgpiod
> > > > > python bindings.
> > > > >
> > > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > > > +    path = sys.argv[1]
> > > > > +    values = dict()
> > > > > +    lines = []
> > > > > +    for arg in sys.argv[2:]:
> > > > > +        arg = arg.split("=")
> > > > > +        key = int(arg[0]) if arg[0].isdigit() else arg[0]
> > > > > +        val = int(arg[1])
> > > > > +
> > > > > +        lines.append(key)
> > > > > +        values[key] = Value(val)
> > > > > +
> > > >
> > > >         lvs = [ arg.split('=') for arg in sys.argv[2:] ]
> >             lvs = [ (x,int(y)) for (x,y) in lvs ]
> > > >         lines = [ x[0] for x in lvs ]
> > > >         values = dict(lvs)
> > > 
> > 
> > An extra pass to fix the int values.
> 
> In Python we have map(), which I think is the best for that kind of job.
> 

My understanding is map/filter is old school and list comprehensions
have replaced map, as generators have replaced filter.

i.e.
    list(map(function, iterable))
becomes
    [function(x) for x in iterable]

Either way, what we are missing here is a parser function that gives us
exactly the (offset,value) output we want from the command line string.

Oh, and we need both the lines list and the values dict, both of which
are easily created from the interim lvs.

> > You could do it in one with a more appropriate parser function.
> 
> It seems we need some Python guru to revisit the code, because to me
> it looks a bit C:ish :-)
> 

The for loop or the list comprehension?
Last I checked only one of those is available in C.
And yeah, the for loop version reads as C, so not at all Pythonic,
which is why I suggested the list comprehension.

> Maybe I can ask colleague of mine, if he has time for a such...
> No guarantees, though.
> 

Maybe I'm wrong and they've flipped back to map/filter.
Stanger things have happened.

Cheers,
Kent.
