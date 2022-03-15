Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BE74D9A82
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 12:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347932AbiCOLlV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 07:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245326AbiCOLlU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 07:41:20 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4534E38A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:40:08 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id p15so40602187ejc.7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DOQYxcCLTNjFHvCe0N3i7+LHA6JM1B5ISBFxDXItV6s=;
        b=NRUcLDfMVdj9YCqMAtcI7jSQ8LFJa4NO7Zt3VOvRp8M3bttCZvHRD4gZDiTCncF54L
         W8QkcxC8RDmuqt4wVTlSJMG6Dg8Ll2NVWcofuF2npzh9gHsodXHXgo/KhnjEo0qwho2d
         mX1rc2gKQah2r+npYuzGYLWRF2y9m5nz7C9lSgTS34ih18NTMZwzS/MOrmo5b9vu6OQp
         /HTQeitxqn2uR+NMEp23vzpiIcGFNvi46zbvcBeleC9mlhEpekKk2UyPNMr1nRu2miB1
         5SYIZwq+oTvCGaVMc9HlBW1qN7I0g2jFWisMEzHrzcLc+3YwSHZYrfr16J1esOn8J4H2
         EoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DOQYxcCLTNjFHvCe0N3i7+LHA6JM1B5ISBFxDXItV6s=;
        b=WVhYJSH8scFrZ6KbfWNdx0rfXmbr9js08L6wLplzoeWuV1dCXc/116DCYeWkpaITK8
         2bNAL31S+Kcn2dOuhftcdU0Y3pQ6b/mqMynAXxuaVQKh675Gpant93k72uXSzZ1V/WE9
         2RoCCr7nc82127FJmtkbZFq9LJsFPWgkHp4/HUr80jl2XNgJUdyJZiBoJlTWd6bXsvpH
         qJyhO5KRrHTZOvkfNkA9UPyMIc/l4+t48MjjUtNVmRZ2hAik+/ikytMYu5TUDCRSE1P2
         N24ZHJCdiI/2O/tbgpAhoW13URdk0Gz5cuCkyIrMzTL2afLsPDouzhp1Z1nnJmuENebx
         v5rg==
X-Gm-Message-State: AOAM530Av9vJ+Hv8c+OQfuh67tZayuG5ByDyJJNYUAlRPR3/Vp8r8T2e
        4Xwt79M1Ev8QHtVoTdQ/qWQ4+E6RwTh75MVF0uSfmhzJ/bDe+A==
X-Google-Smtp-Source: ABdhPJwK24dj3b7zTZakXD2hx37vA5sP96Lvr4fN69I8BJzGyG8qTjpEEPW1qMXRfK4osRJSk6W2VdKddyrj5CVgwtc=
X-Received: by 2002:a17:907:168b:b0:6db:a7da:2d4d with SMTP id
 hc11-20020a170907168b00b006dba7da2d4dmr15676266ejc.101.1647344406630; Tue, 15
 Mar 2022 04:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220311073926.78636-1-warthog618@gmail.com> <20220311073926.78636-3-warthog618@gmail.com>
 <CAMRc=MfDmc86mK=8U_srVJg6fFvFy5hx+pnYmN8wS8rd4KWobQ@mail.gmail.com> <20220315112305.GA170151@sol>
In-Reply-To: <20220315112305.GA170151@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 12:39:56 +0100
Message-ID: <CAMRc=MeUs_yLC_=rE4OPeoE0BDw=Zhpnwyb0vYgCFB99Y6wOpA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 2/6] API: rename gpiod_request_config_get_num_offsets
 to gpiod_request_config_get_num_lines to match line_request pattern
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 12:23 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Mar 15, 2022 at 11:52:21AM +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 11, 2022 at 8:40 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Both gpiod_request_config and gpiod_line_request contain a number of
> > > lines, but the former has a get_num_offsets accessor, while the latter
> > > has get_num_lines.  Make them consistent by switching request_config to
> > > get_num_lines.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> >
> > IMO this doesn't make much sense because we still have
> > gpiod_request_config_set_offsets(). So now you have set_offsets but
> > get_lines. At the time of preparing the request_config we're still
> > talking about offsets of lines to request, while once the request has
> > been made, we're talking about requested lines.
> >
>
> Oh FFS we are always talking about lines.  Whether you have requested
> them yet or not is irrelevant.  You WANT to request lines.
> If we had globally unique line names we wouldn't give a rats about the
> offset.
>
> And take another look - you have actually have get_offsets and
> get_num_lines functions.
>
> Offsets is just one of the attributes of the lines, and this approach
> still works if there is another fields of interest. e.g. values:
>
> int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
>                                          size_t num_lines,
>                                          const unsigned int *offsets,
>                                          const int *values);
>
> which you then complain about in patch 4 as I'm writing this.... <sigh>.
>
> You could equally argue that one should be num_values.
>
> While we are still preparing the configuration, we are preparing the
> config for LINES, not offsets.  Using num_lines is a reminder that you
> need to provide the offset for each line - the two are inextricably
> linked.  Using num_offsets could be taken to imply that
> gpiod_request_config_set_offsets() can be called multiple times to add
> offsets.
>
> > I would leave it as it is personally.
> >
>
> I know, I know :-|.
>
> Cheers,
> Kent.

I didn't know I would see the whole extend of Kent's wrath after that
comment. :)

Anyway let me try to defend myself before I wave the white flag and
surrender as usual.

We're setting VALUES so it's only normal to speak about NUMBER of VALUES.

It's like when you have an array of of X that is an attribute of Y,
that array still carries a number of X and not Y.

This is for patch 4 but this one has another problem. What if we
extend this structure to - besides offsets - accept string identifiers
for a request? Then we would want to use get_offsets and get_names (or
get_ids) and the corresponding get_num_offsets and get_num_names
accesors and in this case get_num_lines would become confusing.

Bart
