Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D014D9E18
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 15:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349385AbiCOOwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 10:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343923AbiCOOwW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 10:52:22 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BEC755752
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 07:51:08 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id g19so20070645pfc.9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 07:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ljm6n2Ech5IQZc/hkc3TJ+D/NPl3xnOkiEdzFLlwRhI=;
        b=GA7Cg6//qD+sfLANdPJjfo1Fq/JfVDnhCtKqILN92N9poH53bDf+M90iZbcR/cm038
         8rm4yaf9FF5Mx7UXCG8ZcI5dIThzOfAtYxo1QxWen/MB5a/6Lkg8L/q9PQpgJKQjAnWK
         VZdOjnVt8qRemQ8J7pkAsg+Y9nPrEv5YlqRHzUuQU2qyz8ejjcGQqBfuEQSbf+xYxDjo
         ssJx8bsHp/bxoVSAZ/U/96cPIjAG6+vrh/lK1vlXkmbvQVhEdoB/o/wE1N7w6i7BtiRl
         bpZ/t/tKzRxsNhQ6S1WRAiQ9p25LL6VH6exIpVTRbeLl7LJCcLNDiaKxaP91eujRRBQD
         69WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ljm6n2Ech5IQZc/hkc3TJ+D/NPl3xnOkiEdzFLlwRhI=;
        b=vg8k1+rCjqQDE3UM/Z7cmmfm+Ff+L1U5Ro9F1Z89Z3i1nHkYd2DF13uAx+4i1KLmdB
         RnXPIyTsgp1PFSIuRiCRkmWzxjurhEdjEz3jBeVHjF0+JXpYLX57xve2q83ndADg+WBk
         JovSnlAYK5YCyxiHlDuMh2p2/+LdLCJ2Ytzko9j33Y2oYovjyLG19hxl5azQVgz236GK
         IDkQHleV0UBXd6z54eytDpNkg7gaT80S8sjEk0nbrRDG9jP96fKcN1oO/pt4nCQ3JZkI
         orJKbtJdWM2NnkRjpLq21sQh6HsW812v/CKN0Yvb9drYcEfOQ763cMGsx6kygYkBirmW
         ZzEA==
X-Gm-Message-State: AOAM533X+zQTdH7/R+HMCULFlmkkCxJeNaWeKRrridmrp5rGoe5S6vmQ
        XvMNg+n3pT1WE2xgr10SGRdWqy3rwjuO1g==
X-Google-Smtp-Source: ABdhPJzKPpva1K1jjkdKoA0aZzD8QqRwd+/1/3irKpeLWvRM3sQQkMuB09XybfUw561ZW1K39ln4Ww==
X-Received: by 2002:a65:6a4a:0:b0:380:fd52:1677 with SMTP id o10-20020a656a4a000000b00380fd521677mr20783373pgu.597.1647355867688;
        Tue, 15 Mar 2022 07:51:07 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090a560100b001bf72b5af97sm3446337pjf.13.2022.03.15.07.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 07:51:06 -0700 (PDT)
Date:   Tue, 15 Mar 2022 22:51:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 2/6] API: rename
 gpiod_request_config_get_num_offsets to gpiod_request_config_get_num_lines
 to match line_request pattern
Message-ID: <20220315145102.GA216863@sol>
References: <20220311073926.78636-1-warthog618@gmail.com>
 <20220311073926.78636-3-warthog618@gmail.com>
 <CAMRc=MfDmc86mK=8U_srVJg6fFvFy5hx+pnYmN8wS8rd4KWobQ@mail.gmail.com>
 <20220315112305.GA170151@sol>
 <CAMRc=MeUs_yLC_=rE4OPeoE0BDw=Zhpnwyb0vYgCFB99Y6wOpA@mail.gmail.com>
 <20220315115923.GA173724@sol>
 <CAMRc=MfN0UPz9heH43sU+Rgd+zy7KtmMaaa7yEZckFyEEG9gNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfN0UPz9heH43sU+Rgd+zy7KtmMaaa7yEZckFyEEG9gNQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 02:43:28PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 15, 2022 at 12:59 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Mar 15, 2022 at 12:39:56PM +0100, Bartosz Golaszewski wrote:
> > > On Tue, Mar 15, 2022 at 12:23 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Tue, Mar 15, 2022 at 11:52:21AM +0100, Bartosz Golaszewski wrote:
> > > > > On Fri, Mar 11, 2022 at 8:40 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > > > Both gpiod_request_config and gpiod_line_request contain a number of
> > > > > > lines, but the former has a get_num_offsets accessor, while the latter
> > > > > > has get_num_lines.  Make them consistent by switching request_config to
> > > > > > get_num_lines.
> > > > > >
> > > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > > ---
> > > > >
> > > > > IMO this doesn't make much sense because we still have
> > > > > gpiod_request_config_set_offsets(). So now you have set_offsets but
> > > > > get_lines. At the time of preparing the request_config we're still
> > > > > talking about offsets of lines to request, while once the request has
> > > > > been made, we're talking about requested lines.
> > > > >
> > > >
> > > > Oh FFS we are always talking about lines.  Whether you have requested
> > > > them yet or not is irrelevant.  You WANT to request lines.
> > > > If we had globally unique line names we wouldn't give a rats about the
> > > > offset.
> > > >
> > > > And take another look - you have actually have get_offsets and
> > > > get_num_lines functions.
> > > >
> > > > Offsets is just one of the attributes of the lines, and this approach
> > > > still works if there is another fields of interest. e.g. values:
> > > >
> > > > int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
> > > >                                          size_t num_lines,
> > > >                                          const unsigned int *offsets,
> > > >                                          const int *values);
> > > >
> > > > which you then complain about in patch 4 as I'm writing this.... <sigh>.
> > > >
> > > > You could equally argue that one should be num_values.
> > > >
> > > > While we are still preparing the configuration, we are preparing the
> > > > config for LINES, not offsets.  Using num_lines is a reminder that you
> > > > need to provide the offset for each line - the two are inextricably
> > > > linked.  Using num_offsets could be taken to imply that
> > > > gpiod_request_config_set_offsets() can be called multiple times to add
> > > > offsets.
> > > >
> > > > > I would leave it as it is personally.
> > > > >
> > > >
> > > > I know, I know :-|.
> > > >
> > > > Cheers,
> > > > Kent.
> > >
> > > I didn't know I would see the whole extend of Kent's wrath after that
> > > comment. :)
> > >
> >
> > We're still way way off the full extent.
> >
> > Though "libgpiod v2 - the Wrath of Kent" does have a certain ring to it.
> >
> 
> Love it, let's make it official. :)
> 

Maybe not - one of the good guys dies at the end of that one, as does
the eponymous character :-(.

> > > Anyway let me try to defend myself before I wave the white flag and
> > > surrender as usual.
> > >
> > > We're setting VALUES so it's only normal to speak about NUMBER of VALUES.
> > >
> >
> > But you are happy to call it num_offsets?  I'm confused.
> >
> 
> Wat? No, the only num_offsets are present in get/set_offsets in request_config.
> 

My bad - you were being abstract and on first reading I took it literally.

My perspective is that you are setting the ATTRs on a NUMBER of OBJECTS,
so looking at it with the scope of the config, not the individual function.

But I see your point.

> > > It's like when you have an array of of X that is an attribute of Y,
> > > that array still carries a number of X and not Y.
> > >
> >
> > I get that, but in this case the offset is identifier for line.
> > The mapping is 1-1.
> >
> > > This is for patch 4 but this one has another problem. What if we
> > > extend this structure to - besides offsets - accept string identifiers
> > > for a request? Then we would want to use get_offsets and get_names (or
> > > get_ids) and the corresponding get_num_offsets and get_num_names
> > > accesors and in this case get_num_lines would become confusing.
> > >
> >
> > Good luck with that - no matter how you name things.
> > If you allow multiple identifiers then you have to deal with the
> > overlap case.  Just don't go there.
> > And what happens to gpiod_line_request_get_offsets where the size of
> > the buffer is determined by gpiod_line_request_get_num_lines()?
> >
> 
> The string identifiers would be translated to offsets at some point.
> Here it would make sense to retrieve the number of lines ACTUALLY
> requested and get their OFFSETS of which there are NUM_LINES.
> 

For the tool prototyping I've been doing I went with stringified id -> line,
with the stringified id mapped to line depending on the other
command line options, so it may be a name or an offset, depending.
Behind the scenes the line is always (chip,offset).

But that is really a higher level of abstraction that should be built
over libgpiod core, not builtin to it.  Unless it were also added to the
uAPI.

> > Much simpler to stick to a single type of identifier for the request.
> > Oh, and them the 1-1 mapping still holds, so you can still use num_lines.
> > No multi-dimensional thinking.
> >
> 
> I don't see a problem with current naming. You set offsets ->
> num_offsets, values -> num_values. Also: unlike function names this is
> not even part of ABI. We can even name it `n`, `nelem`, `num_elem`
> everywhere for all I care.
> 

A generic might be the way to go for the (offset,value) pairs split over
arrays case.

Cheers,
Kent.
