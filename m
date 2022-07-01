Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16E085632F1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 13:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiGALwg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 07:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235877AbiGALw0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 07:52:26 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE2583F1C
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 04:52:26 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ge10so3606436ejb.7
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 04:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AI+hMYcv8CiZucQCip8zsTOmBURIRoTIws2k9nJ71ZA=;
        b=2OjWoLBhm8B+z+eiNbm2S8SV9T48uHi8RJUQ2qyhTYAJe6mO0goHF0hm84ADBH25Qx
         S4qwIUuqJ+qd97FgjBtxjLzAzGpvXr8BuaU7x5UGUedl78bOKZJjjvbioXsjyCVFwh9L
         A7y5bHlLZYx5H2WmJ4fFrQjG/ZtBAP1lSycjC4QV+Z2+gkgeaFJlfsS1IC7O+bY7qGYG
         7b4YQpYeMMVYnG0BuFjpjpoLRc+WugEfHLTvSAmVHa8498z1Un8t8Xmb+yr4X+Dvogx5
         cxdzKU4eP2g4tySFiVD+A7qrrATySh3RtQuCo5bPFZkTVzFPxsDQsJxWB3jVWd/9hKQy
         8nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AI+hMYcv8CiZucQCip8zsTOmBURIRoTIws2k9nJ71ZA=;
        b=DelMHUuNhsdFQkSBIHSBLsq3s6NVa01+dH+eaVGgtIpC7h2VPNNE/tWnXifWZ1AfKW
         kItmnmnrDtAR2E1tspYCOLkSh9mZULQV3X7jxJ//MnaHRCJ6oTNFDBl/2FMIt0FBNoQz
         kKlYOnDLWwN0EO2O0Ys9xh0KILWUaWASQPkNSVv9XYD3RT5wBFfBG7YR+p+X1FSBpDW7
         DQs4mrD/C02wyqXeTu2QsftsNKbt9YXn+ssrlbuETIUbPIQDSwU0PNabTxwRCgZf1KF6
         1Hl0paE3kGXk/8ZxEDbMPbQn5SBqoqCwO4O9I4/xUOsRlGi4cCN3gjRSYC5iehCi8ZV8
         d4Cg==
X-Gm-Message-State: AJIora9Sb9U+YLQ9L6xU05UYaw+TaJthwqrdifMOAK8qVgCoVpsoQc2g
        mxjqyy9RQpFAOWDPgs9MWFNRfi71gBdxJ3/trmjsXu6Rjxs=
X-Google-Smtp-Source: AGRyM1vsTnAO2FJqbgk/fDhtnmiT1M5Wc3VC1zDg1i03jCAa+OVdhjPne+j6b1b1ILdYfzuDmbmorN26Vpnc0RQnbPM=
X-Received: by 2002:a17:907:2815:b0:72a:4eda:a35f with SMTP id
 eb21-20020a170907281500b0072a4edaa35fmr10411158ejc.636.1656676344843; Fri, 01
 Jul 2022 04:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220701110025.58399-1-brgl@bgdev.pl> <CAHp75VeG3=uAk6V6MD9soFytrjsDgVnWNK8CodDW+_aY7f5Dug@mail.gmail.com>
In-Reply-To: <CAHp75VeG3=uAk6V6MD9soFytrjsDgVnWNK8CodDW+_aY7f5Dug@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 13:52:14 +0200
Message-ID: <CAMRc=MeCxzwhQqY8N-PH7nk-HXZWuXNJ1VJbyL5z29m6MBoBiw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH] treewide: allow polling functions to block indefinitely
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 1, 2022 at 1:10 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Jul 1, 2022 at 1:06 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > All polling system calls have some way of being instructed to block
> > indefinitely until some event is registered on the file descriptor.
> >
> > Make both the gpiod_chip_wait_info_event() and
> > gpiod_line_request_wait_edge_event() accept negative timeout values in
> > which case the underlying ppoll() will block indefinitely.
>
> Long time no user space done by me, so here my silly question: how to
> kill a task that is blocking indefinitely in ppoll()?
>

Send a signal to it. It will return -1 and set errno to EINTR. Unless
you explicitly masked all signals. In that case kill -9 still works.
:)

Bart
