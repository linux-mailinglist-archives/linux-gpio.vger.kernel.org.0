Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221634D9C8D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 14:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239029AbiCONoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 09:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239682AbiCONow (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 09:44:52 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E1412AC4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 06:43:40 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id h13so24246413ede.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 06:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DRiJzlAE1P0E/5Hn7BGMe8nHcfG/7XWMs3CVoCKY7LM=;
        b=7Eazfmwv3ljQMSvCLrTtYssgqc+rpU7cEtGSNdGxsNZxoSNERzUH4yuT3lWkJupHMG
         +8pnPiSri3mQ446MtT29rVBe5YMzoTUtktlDGOCj0Vf93wDRtEao2gqkMo38dmzL1t+d
         0av9jqHw/BK634dJn6Bisac4bKEK6AVXdjVu+tTyVs5+7ioYqIgFKvLsK23gKESMfKmz
         BeynK7zm3PZs1RdgUpw4adMRXARKlmiQ86fRhtLba05E4bPxZYvIISpdxabOM4QaZeeM
         v5yFQURh3qBGo/Aw1482Kh/rlLGzwG0RRrdZRLZINMmCKcC8yld0hpLHNfcyvkkNb/mP
         JzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DRiJzlAE1P0E/5Hn7BGMe8nHcfG/7XWMs3CVoCKY7LM=;
        b=m4844sCvWxDY6VfOrE8l3yc2UVQfjC0u8Ztg/iRsRAgIhBIvMZoybJ9h+SYrhexITb
         a1XuVuhaexJjTJiiwuSiM+PzO7dKk33LSFAJT8l8BMLHPtbXDWcpC76xA1oHwu3y7Yiv
         EgN04/KrEbw8yFMny/cuW+PS5nItHk/Y9Wb50h6AvkF60z9gCwYkt7VEnlxa713lnPnU
         3/VZuW70eESEYYTprmOmRx5oeHyL+9xPtYQjjCaurZ0hSpsbOUt6zJrhEWJUbVOAlACC
         Ez6UGwvTf3B9c9azze01hhiRZHQLDp/Dx/+ZI7lOuAtBPVavcad4yFT1oiG2Za7BNPfD
         PBPg==
X-Gm-Message-State: AOAM532AEjwdEmbMIe2D/rgSBfu1f6Em3q0eek8RNGnfZy6FIDqElD1G
        vwYxAxKlVrrmN9lvpW/ZZGEHe3D1+AuyEs0acpzEyV8InUobAg==
X-Google-Smtp-Source: ABdhPJzNT3f1/8VMdeLa0aRXSSt0sbovuhB4A/ZYsms86IorRrM+u1tGBYswY7NHAeei2DdRwzHcFBHrwd9tZZ4ckfs=
X-Received: by 2002:a05:6402:183:b0:410:fde:887a with SMTP id
 r3-20020a056402018300b004100fde887amr25096199edv.243.1647351818622; Tue, 15
 Mar 2022 06:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220311073926.78636-1-warthog618@gmail.com> <20220311073926.78636-3-warthog618@gmail.com>
 <CAMRc=MfDmc86mK=8U_srVJg6fFvFy5hx+pnYmN8wS8rd4KWobQ@mail.gmail.com>
 <20220315112305.GA170151@sol> <CAMRc=MeUs_yLC_=rE4OPeoE0BDw=Zhpnwyb0vYgCFB99Y6wOpA@mail.gmail.com>
 <20220315115923.GA173724@sol>
In-Reply-To: <20220315115923.GA173724@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 14:43:28 +0100
Message-ID: <CAMRc=MfN0UPz9heH43sU+Rgd+zy7KtmMaaa7yEZckFyEEG9gNQ@mail.gmail.com>
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

On Tue, Mar 15, 2022 at 12:59 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Mar 15, 2022 at 12:39:56PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Mar 15, 2022 at 12:23 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Tue, Mar 15, 2022 at 11:52:21AM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Mar 11, 2022 at 8:40 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > Both gpiod_request_config and gpiod_line_request contain a number of
> > > > > lines, but the former has a get_num_offsets accessor, while the latter
> > > > > has get_num_lines.  Make them consistent by switching request_config to
> > > > > get_num_lines.
> > > > >
> > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > ---
> > > >
> > > > IMO this doesn't make much sense because we still have
> > > > gpiod_request_config_set_offsets(). So now you have set_offsets but
> > > > get_lines. At the time of preparing the request_config we're still
> > > > talking about offsets of lines to request, while once the request has
> > > > been made, we're talking about requested lines.
> > > >
> > >
> > > Oh FFS we are always talking about lines.  Whether you have requested
> > > them yet or not is irrelevant.  You WANT to request lines.
> > > If we had globally unique line names we wouldn't give a rats about the
> > > offset.
> > >
> > > And take another look - you have actually have get_offsets and
> > > get_num_lines functions.
> > >
> > > Offsets is just one of the attributes of the lines, and this approach
> > > still works if there is another fields of interest. e.g. values:
> > >
> > > int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
> > >                                          size_t num_lines,
> > >                                          const unsigned int *offsets,
> > >                                          const int *values);
> > >
> > > which you then complain about in patch 4 as I'm writing this.... <sigh>.
> > >
> > > You could equally argue that one should be num_values.
> > >
> > > While we are still preparing the configuration, we are preparing the
> > > config for LINES, not offsets.  Using num_lines is a reminder that you
> > > need to provide the offset for each line - the two are inextricably
> > > linked.  Using num_offsets could be taken to imply that
> > > gpiod_request_config_set_offsets() can be called multiple times to add
> > > offsets.
> > >
> > > > I would leave it as it is personally.
> > > >
> > >
> > > I know, I know :-|.
> > >
> > > Cheers,
> > > Kent.
> >
> > I didn't know I would see the whole extend of Kent's wrath after that
> > comment. :)
> >
>
> We're still way way off the full extent.
>
> Though "libgpiod v2 - the Wrath of Kent" does have a certain ring to it.
>

Love it, let's make it official. :)

> > Anyway let me try to defend myself before I wave the white flag and
> > surrender as usual.
> >
> > We're setting VALUES so it's only normal to speak about NUMBER of VALUES.
> >
>
> But you are happy to call it num_offsets?  I'm confused.
>

Wat? No, the only num_offsets are present in get/set_offsets in request_config.

> > It's like when you have an array of of X that is an attribute of Y,
> > that array still carries a number of X and not Y.
> >
>
> I get that, but in this case the offset is identifier for line.
> The mapping is 1-1.
>
> > This is for patch 4 but this one has another problem. What if we
> > extend this structure to - besides offsets - accept string identifiers
> > for a request? Then we would want to use get_offsets and get_names (or
> > get_ids) and the corresponding get_num_offsets and get_num_names
> > accesors and in this case get_num_lines would become confusing.
> >
>
> Good luck with that - no matter how you name things.
> If you allow multiple identifiers then you have to deal with the
> overlap case.  Just don't go there.
> And what happens to gpiod_line_request_get_offsets where the size of
> the buffer is determined by gpiod_line_request_get_num_lines()?
>

The string identifiers would be translated to offsets at some point.
Here it would make sense to retrieve the number of lines ACTUALLY
requested and get their OFFSETS of which there are NUM_LINES.

> Much simpler to stick to a single type of identifier for the request.
> Oh, and them the 1-1 mapping still holds, so you can still use num_lines.
> No multi-dimensional thinking.
>

I don't see a problem with current naming. You set offsets ->
num_offsets, values -> num_values. Also: unlike function names this is
not even part of ABI. We can even name it `n`, `nelem`, `num_elem`
everywhere for all I care.

Bart
