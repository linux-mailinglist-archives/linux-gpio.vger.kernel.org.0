Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 659964D9AC4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 12:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348100AbiCOMAl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 08:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236841AbiCOMAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 08:00:40 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A8E52B2F
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:59:29 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id p8so19266794pfh.8
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hYBWwtUTK7KlMJ9MX3Q/EaA0Jyi/NvvrChWBAr+kF+w=;
        b=Z00kbcwxJ8iGoGT8nDDE9neUvwHIPOLdjDBJ5mNFpS56Qiq8US6y7wm6EtlhRQk0OD
         21dpXqI3wcyox7J6zIVybfltlX914bIzKbyP51mHJEg4MxgksWWYm4l77mFstLTKyncw
         vYufyRIEhIsSOOvTTqyS1VY9ZJfKJLLeDn7jTAzErnaGOyJ6ao3wFPOaHOz9WWslhdT1
         +zpb1SU8K6kv7eUK7rgIZSsuebohB2D96nFW/eRAr0VnkE7k8a8SqpPSFH+tcrB1C/GK
         bF/PLwcIYyvrnBczOff/SXHkkPPF7iNZUuIO2dewgziEU6xNq/AzixSgunua2nzaLlXx
         LsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hYBWwtUTK7KlMJ9MX3Q/EaA0Jyi/NvvrChWBAr+kF+w=;
        b=H5D55HIKinhmLugQuNAuAOdNmhD4Z//dhdnIlteUXDPN/aXtVBI7jVK6vgLF4krgdo
         H39jD+ecmQ7eKgKD4N4oVevVWzPQ3i3+ZG5HeMr2yufC8HiOAFQVljn8mHxgiUXKIPWg
         f345Z8NnQcfXULVFJwcpJctMC9wRCqI9x56PtzLP1B9/7zJqCTW2qETjwR+64JOnlND4
         nBHg/H+mslhwR5f50RuaP+R2nft/NXRw4+7yKZxXYimVXwU3tLWMKfbeo2ZNmsV+oIFJ
         RdLZpdt7ftlKaYy+/v+IYFjQ4Q4DGLbmjvKvpiRmoPpCN+RWDutyrf+3wl9uKUYeKspA
         rTng==
X-Gm-Message-State: AOAM531hVbnBbuAaIpTxqy8Y6dLXwtyBPXNejXMzgun/KihcH9KFGyLa
        fbJXsFcBdu71UQ3hx/RU05OniKISxILDwg==
X-Google-Smtp-Source: ABdhPJyCbQAthDTvQkFlF0KWqgpSrO5sYpiMp4i5lhN1PS8d/qgYHj4/dtrhVLfcA32vU0CtmYMfUw==
X-Received: by 2002:a05:6a00:190c:b0:4f7:e318:1a3f with SMTP id y12-20020a056a00190c00b004f7e3181a3fmr7342002pfi.43.1647345568573;
        Tue, 15 Mar 2022 04:59:28 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id l2-20020a637c42000000b003644cfa0dd1sm19449708pgn.79.2022.03.15.04.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 04:59:27 -0700 (PDT)
Date:   Tue, 15 Mar 2022 19:59:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 2/6] API: rename
 gpiod_request_config_get_num_offsets to gpiod_request_config_get_num_lines
 to match line_request pattern
Message-ID: <20220315115923.GA173724@sol>
References: <20220311073926.78636-1-warthog618@gmail.com>
 <20220311073926.78636-3-warthog618@gmail.com>
 <CAMRc=MfDmc86mK=8U_srVJg6fFvFy5hx+pnYmN8wS8rd4KWobQ@mail.gmail.com>
 <20220315112305.GA170151@sol>
 <CAMRc=MeUs_yLC_=rE4OPeoE0BDw=Zhpnwyb0vYgCFB99Y6wOpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeUs_yLC_=rE4OPeoE0BDw=Zhpnwyb0vYgCFB99Y6wOpA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 12:39:56PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 15, 2022 at 12:23 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Mar 15, 2022 at 11:52:21AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Mar 11, 2022 at 8:40 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Both gpiod_request_config and gpiod_line_request contain a number of
> > > > lines, but the former has a get_num_offsets accessor, while the latter
> > > > has get_num_lines.  Make them consistent by switching request_config to
> > > > get_num_lines.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > >
> > > IMO this doesn't make much sense because we still have
> > > gpiod_request_config_set_offsets(). So now you have set_offsets but
> > > get_lines. At the time of preparing the request_config we're still
> > > talking about offsets of lines to request, while once the request has
> > > been made, we're talking about requested lines.
> > >
> >
> > Oh FFS we are always talking about lines.  Whether you have requested
> > them yet or not is irrelevant.  You WANT to request lines.
> > If we had globally unique line names we wouldn't give a rats about the
> > offset.
> >
> > And take another look - you have actually have get_offsets and
> > get_num_lines functions.
> >
> > Offsets is just one of the attributes of the lines, and this approach
> > still works if there is another fields of interest. e.g. values:
> >
> > int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
> >                                          size_t num_lines,
> >                                          const unsigned int *offsets,
> >                                          const int *values);
> >
> > which you then complain about in patch 4 as I'm writing this.... <sigh>.
> >
> > You could equally argue that one should be num_values.
> >
> > While we are still preparing the configuration, we are preparing the
> > config for LINES, not offsets.  Using num_lines is a reminder that you
> > need to provide the offset for each line - the two are inextricably
> > linked.  Using num_offsets could be taken to imply that
> > gpiod_request_config_set_offsets() can be called multiple times to add
> > offsets.
> >
> > > I would leave it as it is personally.
> > >
> >
> > I know, I know :-|.
> >
> > Cheers,
> > Kent.
> 
> I didn't know I would see the whole extend of Kent's wrath after that
> comment. :)
> 

We're still way way off the full extent.

Though "libgpiod v2 - the Wrath of Kent" does have a certain ring to it.

> Anyway let me try to defend myself before I wave the white flag and
> surrender as usual.
> 
> We're setting VALUES so it's only normal to speak about NUMBER of VALUES.
> 

But you are happy to call it num_offsets?  I'm confused.

> It's like when you have an array of of X that is an attribute of Y,
> that array still carries a number of X and not Y.
> 

I get that, but in this case the offset is identifier for line.
The mapping is 1-1.

> This is for patch 4 but this one has another problem. What if we
> extend this structure to - besides offsets - accept string identifiers
> for a request? Then we would want to use get_offsets and get_names (or
> get_ids) and the corresponding get_num_offsets and get_num_names
> accesors and in this case get_num_lines would become confusing.
> 

Good luck with that - no matter how you name things.
If you allow multiple identifiers then you have to deal with the
overlap case.  Just don't go there.
And what happens to gpiod_line_request_get_offsets where the size of
the buffer is determined by gpiod_line_request_get_num_lines()?

Much simpler to stick to a single type of identifier for the request.
Oh, and them the 1-1 mapping still holds, so you can still use num_lines.
No multi-dimensional thinking.

Cheers,
Kent.

