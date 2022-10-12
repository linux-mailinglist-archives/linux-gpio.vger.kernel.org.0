Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1E45FC584
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Oct 2022 14:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiJLMmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 08:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiJLMmE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 08:42:04 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6B4C823C
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 05:42:03 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso3398676pjq.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1CABL0gSqILtkHWqp18H/N851AaVXnlDKONGKqzOaQ=;
        b=R/fKnztKiv4BiSVII7jDYF4/bp/hj2k3wpgLZBPAVC7lEc7rkOd0GxzNT4KKmYTyuq
         dl3iYR+edfPDBzI5X7RhcBxb817PGW5qYdv0/K2XgO2ifME0OUTtd5OudZBmlU9Uyy51
         UyN8mRbMpqTnOC21XAFnpO1wEeBSD9jP+Yaw82mGaokaPXmHI2jDYg/RS6+MfKo3HT2F
         Pod31j7ZAwlVCUsnfcpOXY6YhEIczLOvhW2XimuLvgXSuV0sjIhFml9dulCn8Fs9oPTm
         hnNODW+JsWXZVHzvv5FnLERhBOnpCOhoMpT1h7i6TR2a0Pn6wPRnIJTRcVwXFDxRkmcA
         ogBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1CABL0gSqILtkHWqp18H/N851AaVXnlDKONGKqzOaQ=;
        b=Ciaemwjm6SFRKh42mFn5BuR8yc6jJ2k0iEOCH8x7fdFLP1kCjkBlBNio3hAkh25etK
         89hf2XnlsKowqUG2yJlJq6fsSPiW8ZtjauLrv+F0H6fDPcVpwLmAIonkxiftN46EHVYL
         vdcOiVXUD7+e8vgGCfpI4XGZimX07whEstCNpGgUL6/aCMszQUWY+e1Aa8fJPScDEcoO
         1okK1tpjk2ulZWrfgI94ObNyoC6ENAGHaNMrycmevQSN7vyJy+xLEMtliMyKqiUIOoin
         43k47OkwotezB7rFLS01Zqf84wLTwXKNixDaSYXtK9Ba8ZsTlnrHmAx07QUr6n4xCxnM
         wK0g==
X-Gm-Message-State: ACrzQf14CL/DoLZpZy7TD3Kl9tCW8My8mGIvFuR7gtYBD4F9Ef0g3sUh
        z4xb5+rOQzBYIye/wdWF5nw=
X-Google-Smtp-Source: AMsMyM5raPZowZ6QWXrTiFdqFQ7sO/xGt7ZcAFM4CeIkqGfWLJpMNXS+dE0LTONrJv3hD0VV7i/wig==
X-Received: by 2002:a17:90b:1d8a:b0:20c:a6db:5713 with SMTP id pf10-20020a17090b1d8a00b0020ca6db5713mr5025231pjb.135.1665578522704;
        Wed, 12 Oct 2022 05:42:02 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902ce8800b00178b77b7e71sm10618913plg.188.2022.10.12.05.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 05:42:02 -0700 (PDT)
Date:   Wed, 12 Oct 2022 20:41:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 0/4] bindings: implement python bindings
 for libgpiod v2
Message-ID: <Y0a2Fdyhh+urE97R@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <CAMRc=Md_5cThJwu7iLW14XP=8hADBmOk2DYt2axuG=jWa-jkcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md_5cThJwu7iLW14XP=8hADBmOk2DYt2axuG=jWa-jkcA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 12, 2022 at 02:34:44PM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 7, 2022 at 4:55 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > This is the third iteration of python bindings for libgpiod but it really has
> > very little in common with the previous version.
> >
> > This time the code has been split into high-level python and low-level
> > C layers with the latter only doing the bare minimum.
> >
> > The data model is mostly based on the C++ one with the main difference
> > being utilizing dynamic typing and keyword arguments in place of the
> > builder pattern. That allows us to reduce the number of methods and
> > objects.
> >
> > Because python doesn't have RAII, unlike C++, we provide a module-level
> > request_lines() helper as gpiod.Chip(path).request_lines(...) one-liner
> > could lead to the chip left dangling even after the last reference is
> > dropped.
> >
> > Because python forces us to dynamically allocate objects all the time even
> > for fundamental types (which are also immutable) there's no point in trying
> > to replicate the edge-event buffer. Instead LineRequest.read_edge_event()
> > just returns a list of events.
> >
> > Bartosz Golaszewski (4):
> >
> 
> I fixed the one nit from Andy. If there are no objections I'd like to
> apply this and squash the entire v2 patch series into one big commit
> and apply it to the master branch. This way we can stop keeping this
> temporary branch and continue the development (tools, rust, possible
> further tweaks to the API) on master.
> 

I'm in the process of reviewing, so hold off for a bit if you can.

If not, at the very least  IIIIpdII -> IIIIpkII in patch 4.

Otherwise you get this on 32 bit platforms:

$ gpioget.py /dev/gpiochip0 17
*** stack smashing detected ***: terminated

Cheers,
Kent.
