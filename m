Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2D275A9F2
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 10:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjGTI5d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 04:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjGTIjU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 04:39:20 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D1A26B0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:39:19 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b9d80e33fbso3308885ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689842359; x=1692434359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O1aNw6XCtnwwBXVGSb02eWVXMLe/UMnVFRJc7pZdGyQ=;
        b=Z1DRlyRGbnsBe5D1ziqILbkuPw0TaDrRwBKzVh5PluXwkMPJxXkq+iepSitG9UZFOX
         +MqYiftWz3FcKIG+U24xfTvwu/RvbDCz90X/aykE1ylHO3b9nkEQSifo3EEJ3e6iw3oF
         8qNyjSrUdfN4n6cvBoKR/K8ryuhZa6y2KweDHnQJGB6z64WKOXx+VdRWTp2YrGcx81I/
         R6Lw1g0UZApTzND27IMwh1j16Up8aJXJ2abmX+i0zuFPq4THruPqE//40lzzh7xzcLNY
         KvfOml/lVhBg/LXa8eynHk+ZhdjEt1Y8Yi1mU09AzbpbTuv4vnj7xZ5pGTrYiyjYehbg
         EEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689842359; x=1692434359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1aNw6XCtnwwBXVGSb02eWVXMLe/UMnVFRJc7pZdGyQ=;
        b=QokWLMncTqN8gCDGDojZdDqwaPSOJ5gKlqNRmQ+SMkD6j0uEg23+fRKh7299015xcF
         QKGfKXRO0nW4TRv+cEfX3DBpT5uM4yS9Z5U5CfcFwivERxhUPxfXZg7OSGZWHbgha8nw
         X17/OXh/USaTS5PQpooIkxmrKThZyBrFbasQ54jKSfOJcBWh/GadENZMFqYBJCVwC4DV
         G8qJuipbRfhEJu2w1skzYzvAq2nPwCzrEudCPp5FtVe8yBLDFGQAdWS7aLrauff5Oo9A
         KXCdOLi0A6i1/8J/wXK+hBCt1tdBVQS4XGExhqjIiMzNusbvkXg/z0VDlBOAJKYKZn4r
         406w==
X-Gm-Message-State: ABy/qLaMseim4N5eOHJBP1Bzfb9cLVj6h/oLxqLG9j3eI1w8dQihpv7T
        op2xjl6CYFOuxC7kXoXdwYTf0JQwm1M=
X-Google-Smtp-Source: APBJJlEAfIijj9CaWUlAUxROAfxsrug30Vpxz/zmMMz1X2aZZlCB+QnZUhIbuVZzvYu3jBzbkWvqjQ==
X-Received: by 2002:a17:902:cecb:b0:1b8:b288:6274 with SMTP id d11-20020a170902cecb00b001b8b2886274mr4256727plg.18.1689842359102;
        Thu, 20 Jul 2023 01:39:19 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902d51100b001ac741dfd29sm673572plg.295.2023.07.20.01.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:39:18 -0700 (PDT)
Date:   Thu, 20 Jul 2023 16:39:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
Message-ID: <ZLjyscgZM50A/PLb@sol>
References: <20230719192057.172560-1-brgl@bgdev.pl>
 <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
 <ZLjqtVcTCcStYac4@sol>
 <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 10:25:14AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 20, 2023 at 10:05 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jul 20, 2023 at 09:59:00AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jul 20, 2023 at 5:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > While working on the DBus API, it occurred to me that while we can obtain
> > > > > the list of requested offsets from a line request, this information lacks
> > > > > context if we cannot get any information about the parent chip on which
> > > > > the request was made.
> > > > >
> > > > > We cannot reference the chip in any way as its lifetime is disconnected
> > > > > from the request but we can at least provide the path to the character
> > > > > device used to open it as a way of providing some context for the offsets.
> > > > >
> > > >
> > > > No problem with this conceptually, the only question I have is which
> > > > one of these should be stored:
> > > >  - requested path e.g. 'a_symlink_to_my_favorite_chip'
> > > >  - canonicalised path e.g. '/dev/gpiochip0'
> > > >  - chip name e.g. 'gpiochip0'
> > > >  - chip number e.g. 0
> > > >
> > > > In this patch we get the requested path, right?
> > > >
> > >
> > > Yes, I think we should just use whatever filesystem path was used to
> > > create the chip as it would be the one allowing the caller to reopen
> > > the same chip.
> > >
> >
> > So there are instances where those four don't map to the same thing?
> >
> 
> Not in a typical situation, it can happen if the chip was removed and
> another one took its place which is very unlikely.
> 

And a symlink could get changed as well.

> I just think that we cannot have any "hard data" as in: a programmatic
> reference to the chip in the request (their lifetimes are not
> connected), so the next best thing is the filesystem path.
> 

Indeed - the chip fd used to request the line is out of scope.

But the number of possible requested paths is many, whereas the other
three options produce a unique and comparable identifier, in a searching
sense.

On a related point, does the DBus API allow a client to access lines
requested by another client?  And if so, how can they be sure they have
the right line?

Cheers,
Kent.
