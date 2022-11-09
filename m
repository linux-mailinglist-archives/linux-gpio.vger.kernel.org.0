Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3AD162217B
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 02:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiKIB5P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 20:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiKIB5O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 20:57:14 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C4F66C8A
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 17:57:14 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso556567pjc.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 17:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DzId+91DR44yke3BsJIgehnv2sZ06aOY3jOLlVgsRI0=;
        b=Oq17GcV1AxKTIBIQp0GeLXUfoOD1kUViNuxsST9UsDMzdjn3cFq0OdhCeg+ApUCg5V
         RuJI+mmdc88Yg+/PysZuu8KkiO376YY/osWZ/vn+oZsbmvE8ku1i0LS+oP6AH4Y+JOPT
         mUS+GC+z7HD5TpOHfaszLG+6FfqEPXGOBk5Dwu8+Y0oe0G12w/xx1NYrU/rNOHsUZG13
         gMj+VSGn0nUCUt+87aHjG/r8z5gQAlBEIsJxQVhD2xn1582gF9ycThTt7QM6YmyzSbUb
         3kpS+DMqaWjZhocj74P5D6Nx1Dama7vY4/CnR437crR7V2DJZpAei28EZhPEBUViu3dN
         X2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzId+91DR44yke3BsJIgehnv2sZ06aOY3jOLlVgsRI0=;
        b=WpES4Mgzm9O+E4fKisKyF23CaCRifNQrWTx9bBa5j7VFUpTYfpxDut6kdVOSBHtsHr
         CR375kD5yY5fXAjy5WqZpkowYSN/Cs4bVHVL+Q6CNHQ5ze8+0S0nmQAhf3TrvNh0s67A
         mDubeSfH+SZBiztK40NZ9SL4evLb0YlfcMDJ9HvhLuhvWeXNg8sQR0j5srOSKaMD0Y5c
         eNMKOjq60tNO2sxF+9thYx15zbo78fO71lF5xfT6ohSdBGcqFJR+11FmZkKmqVUEanzA
         8HclfENx3iGqTgGiIbj3Eqaks+L5Kt9W+SQTIaDiKT/zrBHVv/lckeGnkXg4B8c1DgSO
         PpnA==
X-Gm-Message-State: ACrzQf3WBpZQg2gQKSrqBk1OtbgGaX8Lhl72sjwcXtFQFogWnO1AcRL5
        RalZ6madHC7wcEA/H4SQvuQuFR8dPEw=
X-Google-Smtp-Source: AMsMyM4/qv5cwdG5rBPTYhrFSwSOslGFSowgxxKDYbHrBPzLH2FTYshIa4FuIa+JikS/pWwpNuOmdQ==
X-Received: by 2002:a17:90b:4f4c:b0:216:cdf6:5c39 with SMTP id pj12-20020a17090b4f4c00b00216cdf65c39mr28646291pjb.237.1667959033558;
        Tue, 08 Nov 2022 17:57:13 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id m3-20020a170902db0300b0017d7e5a9fa7sm7649606plx.92.2022.11.08.17.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 17:57:13 -0800 (PST)
Date:   Wed, 9 Nov 2022 09:57:09 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 4/5] tools: add gpiowatch
Message-ID: <Y2sI9W0t0jcsCyY0@sol>
References: <20221011002909.26987-1-warthog618@gmail.com>
 <20221011002909.26987-5-warthog618@gmail.com>
 <CAMRc=MdC9fcrKaXRTq5eQttdyLo_SwhU7qEeV9+ej3L0ENkrTA@mail.gmail.com>
 <Y2p4A6FM9nF5RLqw@sol>
 <CAMRc=MeaSyx_So_a=T4O3+FtHN7Jc0=6zapP6+Sn5X-4FXs0ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeaSyx_So_a=T4O3+FtHN7Jc0=6zapP6+Sn5X-4FXs0ww@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2022 at 07:04:36PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 8, 2022 at 4:38 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Nov 08, 2022 at 04:00:08PM +0100, Bartosz Golaszewski wrote:
> > > On Tue, Oct 11, 2022 at 2:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Add a gpiowatch tool, based on gpiomon, to report line info change
> > > > events read from chip file descriptors.
> > > >
> > > > Inspired by the gpio-watch tool in the linux kernel, but with gpiomon
> > > > features such as custom formatted output, filtering events of
> > > > interest and exiting after a number of events, so more useful for
> > > > scripting.
> > > >
> > > > Default output is minimalist, so just time, event type and line id.
> > > > Full event details are available using the custom formatted output.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > > >
> > > > Changes v2 -> v3:
> > > >    - Minimise the default output to more closely match gpiomon.
> > > >    - Add --format option for when more detail is required.
> > > >    - Add --num-events option to exit after a number of events.
> > > >    - Add --event option to report only specific event types.
> > > >    - Add --quiet option to not print events.
> > > >    - fix monotonic to realtime conversion on 32 bit platforms.
> > > >
> > >
> > > Nice and clean, I don't have any issues other than the regular
> > > coding-style bikeshedding.
> > >
> >
> > Will be renamed to gpionotify for v5, ok?
> 
> Yes, sure, just like discussed.
> 
> >
> > > What happened to the idea we've been floating about creating a single,
> > > busyboxy executable with links rather than separate executables? Have
> > > we ever agreed on it?
> > >
> >
> > Yeah, last we spoke on it we agreed it was of dubious value and a low
> > priority, so I didn't go anywhere with it.  You've reconsidered?
> >
> 
> I'm seeing that the tools-common.c file grew quite a bit after your
> rework (which is good, a lot of stuff has been generalized) which
> makes me think it wouldn't be a bad idea to not include it 6 times
> separately. It's either a libgpio-tools or putting this stuff into the
> same executable?
> 

Fair enough - for some reason I was thinking tools-common did get linked
into a libgpiod-tools lib, but I guess not.

The bulk of the rework is the resolver, and I was thinking that some
form of that should go in core libgpiod - that would also reduce the
duplication problem.

> Anyway, we can do it later.
> 

Agreed - not for this series.

Cheers,
Kent.
