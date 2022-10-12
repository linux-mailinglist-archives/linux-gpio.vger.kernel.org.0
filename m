Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECB15FC5D5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Oct 2022 15:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiJLNDK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 09:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiJLNDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 09:03:09 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A038052B
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 06:03:08 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id p14so12094118pfq.5
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hGyVb2k2hRPWDdvl4LwBLJHvkgJoeS6W2++NRfPZiXs=;
        b=hluwxbQ4ia4MmQ0p/cigqQ0iuKDTxG2qPJlbpoj42g9RsbJOp0QnBWWP0zcxGYDcjv
         vw6zx5/NZs8vYwv4PHKHR6jYX7lkxLq2n6s7tpugWrvvrHSXC3wz8o6YxPCqw27l2ps9
         DwpxKGvuwzw75YzbJQSOP9Cy2UxDWJhZpsuAvd6+J4bsUf8x+BZ1tc5OqQ11ZPYOX9xo
         wH3Gdi9L/mC+hz0p28IsyczGrNxussihkGFMVxxS3/m8IrVlymzFndoUi9RtsVITphwq
         K9SpqkE/+hYLokzfbOHW6uGXv2bnj+IJMZ0ERkW3ngWGusZ7Sbk0GOkScS0pRmcO7JC6
         iDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGyVb2k2hRPWDdvl4LwBLJHvkgJoeS6W2++NRfPZiXs=;
        b=ejNih60Fu9domx1JhOC23yb9Q77Jy+WIc4uFBs6mjRte0ZULd+2WmUte1VGdD6OuiU
         L9tb2BthCcOpCGh4fxjFw41i8UOzgmgnyt6BP0GcQTM8rvZE2qnm+2o04CUgq/2UKCMa
         wQbfc10GCWJE1Dr4vZceCupJtNc1P2YkpwksopuBuhU+E2Y6z29pFIzLqDvRdrfeqg53
         n1aB1JwVA7vasUGZsDABdKxFGygrCgY7mxIJyRYOr6QfLP1yxG6DEQXMDXQyaXwg0uyC
         RxDGfJPAnnW9l6afVuK69i37wTTJY6ylfH1e5PPlgL/wXDojYJkrRl5AEPJRtrmFVQJZ
         IqqA==
X-Gm-Message-State: ACrzQf3LgseVSlZFGtvFuIhsI5VH3oj6IYTxm97Oa2pcbf08KLdHL2Kx
        c90zSOANJjd5ikM8x9x+M2Y=
X-Google-Smtp-Source: AMsMyM5gqhTJyISkVBOQAKA/kbxPd7BOHl7IGoJRc5N0zQ4ldMk+mls2gRdtDr84D0krmTIH2uSFcA==
X-Received: by 2002:a05:6a00:3406:b0:55c:e661:6d31 with SMTP id cn6-20020a056a00340600b0055ce6616d31mr31134715pfb.42.1665579787557;
        Wed, 12 Oct 2022 06:03:07 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id r11-20020a63e50b000000b00463cd99cdb7sm3696840pgh.50.2022.10.12.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 06:03:07 -0700 (PDT)
Date:   Wed, 12 Oct 2022 21:03:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 0/4] bindings: implement python bindings
 for libgpiod v2
Message-ID: <Y0a7BrPiIAzwYuwH@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <CAMRc=Md_5cThJwu7iLW14XP=8hADBmOk2DYt2axuG=jWa-jkcA@mail.gmail.com>
 <Y0a2Fdyhh+urE97R@sol>
 <CAMRc=McbAx+m5cm-8gYX7sf-2HT655NqwfxwwG-QycKbRaS0Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McbAx+m5cm-8gYX7sf-2HT655NqwfxwwG-QycKbRaS0Ww@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 12, 2022 at 02:51:09PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 12, 2022 at 2:42 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Oct 12, 2022 at 02:34:44PM +0200, Bartosz Golaszewski wrote:
> > > On Fri, Oct 7, 2022 at 4:55 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > This is the third iteration of python bindings for libgpiod but it really has
> > > > very little in common with the previous version.
> > > >
> > > > This time the code has been split into high-level python and low-level
> > > > C layers with the latter only doing the bare minimum.
> > > >
> > > > The data model is mostly based on the C++ one with the main difference
> > > > being utilizing dynamic typing and keyword arguments in place of the
> > > > builder pattern. That allows us to reduce the number of methods and
> > > > objects.
> > > >
> > > > Because python doesn't have RAII, unlike C++, we provide a module-level
> > > > request_lines() helper as gpiod.Chip(path).request_lines(...) one-liner
> > > > could lead to the chip left dangling even after the last reference is
> > > > dropped.
> > > >
> > > > Because python forces us to dynamically allocate objects all the time even
> > > > for fundamental types (which are also immutable) there's no point in trying
> > > > to replicate the edge-event buffer. Instead LineRequest.read_edge_event()
> > > > just returns a list of events.
> > > >
> > > > Bartosz Golaszewski (4):
> > > >
> > >
> > > I fixed the one nit from Andy. If there are no objections I'd like to
> > > apply this and squash the entire v2 patch series into one big commit
> > > and apply it to the master branch. This way we can stop keeping this
> > > temporary branch and continue the development (tools, rust, possible
> > > further tweaks to the API) on master.
> > >
> >
> > I'm in the process of reviewing, so hold off for a bit if you can.
> >
> > If not, at the very least  IIIIpdII -> IIIIpkII in patch 4.
> >
> > Otherwise you get this on 32 bit platforms:
> >
> > $ gpioget.py /dev/gpiochip0 17
> > *** stack smashing detected ***: terminated
> >
> 
> I'll wait in this case, thanks. Wanted to start testing the new tools
> but thought about getting this behind us first.
> 

The idea of getting the tools patch out was to keep you busy while I
reviewed the python. Unfortunately I got bogged down in corner cases so
that took much longer to get out than I had intended.

I only started looking at the python today, and I don't want to commit
to a completion time at this stage, but shouldn't be too long.

So go play with the tools for a bit.

Cheers,
Kent.
