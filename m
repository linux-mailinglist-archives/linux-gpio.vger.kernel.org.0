Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 329535FC59B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Oct 2022 14:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiJLMv0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 08:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJLMvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 08:51:24 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87DCB2D9A
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 05:51:21 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id k6so15182434vsp.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HD1RGVPkLE5AqkdJtFT+z7c5wUscos2lGMt8KN9AnzE=;
        b=a2SFr0vtC/ymsW/k55Wbob2qrSB5n8PoL8rGzm8KkmdKNqL1KKLktU/1fibEaPpQ0+
         P2Ti5YhsaDRCnp7eCLc6Ec5zu9Mz81ybjzjo/XYhVPonjHTeiqq1JieE10qkecnsQSeq
         qGKgn6Cnck+AwBQRZ7/5uwSlOH4nzjf5ae3mY+KZxMnAP8BCPxnDCv0syoXArZY4PFxI
         t/l5s7xqq0oAcovk0DtDwBOR7Y5Gz1jg//yJx8ULUzdWK0IxXTlripXbIAR+xtfv6O6k
         y7M01vHb0+4G1w/5ixoOpywdr8dM5kVDwg1xILADQWXAqjTvweEOb03XrN7sLn+e8XA6
         mgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HD1RGVPkLE5AqkdJtFT+z7c5wUscos2lGMt8KN9AnzE=;
        b=vi+d9rdje0Lno39BFghWyXbyOIj/p1agvVRN7kdd6S7AZS2eZVL5LSF+J5zOmE/FH2
         Z0WNcjAswrn5DPdB22STgnr0qdDXZtI76eVEkCETk/efaFRfZqb6XWSjfoSVN8bSluKM
         YEaM0wlKsi2+QM1g8/fDyxWhgpX9ivmPT3zW3EWgZi2D837Hl/I3LZIcT74y63THvbI3
         +bQthivn46BuWlYUIbI6wHGdEMEvhd9hX/kbWueWzWG1iLZIqkG63KpFPFKuwYLXxYbi
         zt4PHTlKTrl/uG18r+ylMa/W9ZAArGsGj/KUekMjdVLSjbnU1iv94+uv/SgJF1Ia2DN+
         a+GQ==
X-Gm-Message-State: ACrzQf1HcjScHQuDBuzgad7huzQUh2gFYnbfl4s8RFXjf7M0pC0esJfg
        9uIbMbGZMmTF0i42TDZut1mzGwmUzDO3NAd5Ol3V3Xu1sJc=
X-Google-Smtp-Source: AMsMyM5B2uakAG9ir8C2WR0QC88nX4B3jc8KmjXNYeuyyMcOzzIWGh4ynU29+GWdJunF4M8o2ri5bSEeZUZImXk7hTE=
X-Received: by 2002:a67:ead5:0:b0:3a6:e463:4b0e with SMTP id
 s21-20020a67ead5000000b003a6e4634b0emr13845849vso.61.1665579080630; Wed, 12
 Oct 2022 05:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221007145521.329614-1-brgl@bgdev.pl> <CAMRc=Md_5cThJwu7iLW14XP=8hADBmOk2DYt2axuG=jWa-jkcA@mail.gmail.com>
 <Y0a2Fdyhh+urE97R@sol>
In-Reply-To: <Y0a2Fdyhh+urE97R@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 12 Oct 2022 14:51:09 +0200
Message-ID: <CAMRc=McbAx+m5cm-8gYX7sf-2HT655NqwfxwwG-QycKbRaS0Ww@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 0/4] bindings: implement python bindings
 for libgpiod v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 12, 2022 at 2:42 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Oct 12, 2022 at 02:34:44PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Oct 7, 2022 at 4:55 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > This is the third iteration of python bindings for libgpiod but it really has
> > > very little in common with the previous version.
> > >
> > > This time the code has been split into high-level python and low-level
> > > C layers with the latter only doing the bare minimum.
> > >
> > > The data model is mostly based on the C++ one with the main difference
> > > being utilizing dynamic typing and keyword arguments in place of the
> > > builder pattern. That allows us to reduce the number of methods and
> > > objects.
> > >
> > > Because python doesn't have RAII, unlike C++, we provide a module-level
> > > request_lines() helper as gpiod.Chip(path).request_lines(...) one-liner
> > > could lead to the chip left dangling even after the last reference is
> > > dropped.
> > >
> > > Because python forces us to dynamically allocate objects all the time even
> > > for fundamental types (which are also immutable) there's no point in trying
> > > to replicate the edge-event buffer. Instead LineRequest.read_edge_event()
> > > just returns a list of events.
> > >
> > > Bartosz Golaszewski (4):
> > >
> >
> > I fixed the one nit from Andy. If there are no objections I'd like to
> > apply this and squash the entire v2 patch series into one big commit
> > and apply it to the master branch. This way we can stop keeping this
> > temporary branch and continue the development (tools, rust, possible
> > further tweaks to the API) on master.
> >
>
> I'm in the process of reviewing, so hold off for a bit if you can.
>
> If not, at the very least  IIIIpdII -> IIIIpkII in patch 4.
>
> Otherwise you get this on 32 bit platforms:
>
> $ gpioget.py /dev/gpiochip0 17
> *** stack smashing detected ***: terminated
>

I'll wait in this case, thanks. Wanted to start testing the new tools
but thought about getting this behind us first.

Bart
