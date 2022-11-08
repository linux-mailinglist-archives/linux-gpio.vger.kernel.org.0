Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC2C62187B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 16:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbiKHPix (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 10:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234337AbiKHPiu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 10:38:50 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BEE5657A
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 07:38:48 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id io19so14505129plb.8
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 07:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=imHLwLP5LqolAl6H4jLjTLrCyjCUYpNEsrPPoIuPG8A=;
        b=BgY8gYr4DX06Nl1xSAy+yz90Ua6CsSjPrFdy6RWetctOfxzFhuVe2oePhv2tF+q4fK
         9VVw2XUzsANCyMVEhvCvy+2cHbLMbw6ndJNvLd7YGW1HxVBoEfg+SvCEFaxtb+kKuBo6
         s2IXk+OV321o0TrQrYArOJD2lh/mpJGZnggwj5LUQP/LZvyoCmYfcEuXOpei0bQiGX4z
         d4opjAoCHmxQTFtpR/Bx5QITqfEdNLoq19R0iK3OA2pV61/q8CUiOPJccLgcXoPu2AHu
         8PEsLorCbnYV4Z4/UqieISXNv6jtQkdXr0Ppw9je9SQgwT9Us+ZXzxdYGUSIT53CECDU
         +EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imHLwLP5LqolAl6H4jLjTLrCyjCUYpNEsrPPoIuPG8A=;
        b=ksYFaQhwbjSPq3mGwCqNCYWHfxwPM0y34Fri5/zghGNhD104YcbpU7s3s+kA8AMhRz
         9rUD8cmKXFausF0D9zduYj/1N2JKyWInfqlJHcocR0XUswcgBMlBdvPkhlMPWLVjM+Dw
         sexycjOd1Z5/+83kEO3kQvJ9uH58smPrXeEJ0OOAfllZUu4RXWIfYmCZKItjRtD1N7VM
         hNL4oHlem715gdOj3PQspUoFopZuOtyrE7poYtSKgS1Oyoa+fAAskib4m0FQsFAy7JXP
         OPVtV4T3LMloFOSp49SIFFrk7vfYP34YsHSyVUlJQtdo0ohl9EZwb1qmwaYSA3p0dwVE
         QNwQ==
X-Gm-Message-State: ACrzQf3mOJWiDvcj5l7kY8k7eFtL9T7aEWnlMQ7ErASwBVU50jb4VMjr
        6WiQh0mOuC5nadvIEYCIfBU7s/MHiaQ=
X-Google-Smtp-Source: AMsMyM47bUbA+Srp1sASeyWT8QAUovDR/JExoSnnCvFlCIpaU11pZxaW6MSnvweXsHtVfYgAOiyy7w==
X-Received: by 2002:a17:90a:5b03:b0:213:e4bc:fbf4 with SMTP id o3-20020a17090a5b0300b00213e4bcfbf4mr49540226pji.74.1667921928072;
        Tue, 08 Nov 2022 07:38:48 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902e80700b00186fa988a13sm7169021plg.166.2022.11.08.07.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 07:38:47 -0800 (PST)
Date:   Tue, 8 Nov 2022 23:38:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 4/5] tools: add gpiowatch
Message-ID: <Y2p4A6FM9nF5RLqw@sol>
References: <20221011002909.26987-1-warthog618@gmail.com>
 <20221011002909.26987-5-warthog618@gmail.com>
 <CAMRc=MdC9fcrKaXRTq5eQttdyLo_SwhU7qEeV9+ej3L0ENkrTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdC9fcrKaXRTq5eQttdyLo_SwhU7qEeV9+ej3L0ENkrTA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2022 at 04:00:08PM +0100, Bartosz Golaszewski wrote:
> On Tue, Oct 11, 2022 at 2:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add a gpiowatch tool, based on gpiomon, to report line info change
> > events read from chip file descriptors.
> >
> > Inspired by the gpio-watch tool in the linux kernel, but with gpiomon
> > features such as custom formatted output, filtering events of
> > interest and exiting after a number of events, so more useful for
> > scripting.
> >
> > Default output is minimalist, so just time, event type and line id.
> > Full event details are available using the custom formatted output.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >
> > Changes v2 -> v3:
> >    - Minimise the default output to more closely match gpiomon.
> >    - Add --format option for when more detail is required.
> >    - Add --num-events option to exit after a number of events.
> >    - Add --event option to report only specific event types.
> >    - Add --quiet option to not print events.
> >    - fix monotonic to realtime conversion on 32 bit platforms.
> >
> 
> Nice and clean, I don't have any issues other than the regular
> coding-style bikeshedding.
> 

Will be renamed to gpionotify for v5, ok?

> What happened to the idea we've been floating about creating a single,
> busyboxy executable with links rather than separate executables? Have
> we ever agreed on it?
> 

Yeah, last we spoke on it we agreed it was of dubious value and a low
priority, so I didn't go anywhere with it.  You've reconsidered?

Cheers,
Kent.

