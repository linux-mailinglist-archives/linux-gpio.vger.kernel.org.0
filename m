Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29DF56729BE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jan 2023 21:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjARUw2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 15:52:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjARUwN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 15:52:13 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E254613F1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 12:51:39 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id i185so44725vsc.6
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 12:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8sTaR9y3YYaESxEw+FfxqvPN76aBfaH3595KkehvtcI=;
        b=KK2EqPGuk4RwZ6lEyPIoZ4PR9hmxxr3NCJ0fiYeDujP0U7yViKygm5jotGa5LBhNGm
         kqpARuBwQp6qZ3VpSdoZyO6Mz38ZP25FgN4//iS+36EmJA1pKcngo8vnUmI9Bt9S2PCd
         M3JDfSPPtk3TWxCkLashJVXlDmKCdeWw9Laz1UPKHdzsptlZzjnX2NjU+cqqrVnO8qDn
         G68fJ8IbVumUyjzPEJKaBNxZEQbzRqE6WlbQfNcwOaPGmdmxIgNUEOkA1RQvCngMNv8M
         0qrBgsRPihB6pjhYZ1BirgjEGie7yp5rAP9B2Y3sj8rX3O3Nx0EEpwHjEzaAoy3v41eN
         hMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sTaR9y3YYaESxEw+FfxqvPN76aBfaH3595KkehvtcI=;
        b=K/kJF2kaxjM3MFCn1Y+gfkv5e3zYD+ytEAlemUkA9g6TpcFdpBIRqgon8u2xIuutSk
         qCV399OZ1hNPc2BXSHfDw5yzJ9GixtYzcPF55rScJocUUBWTJsNVakWEjQQPmD8+Mf2T
         1C5ty+NxoE1te8lu7U0CLJhse9BhqamLlSEwjX8ex1wtOSTS6LzI8YmEA+N9kxVDuCul
         KK2uq7QOMamM5E8gyXaaZt+OIr8VGIHWmALiRNS2oEnfNKvhKKIfdcNdt4fsaPmk+rDz
         8CovqXiZf3ZpCjLqSx/WEm3y4Smjhh7mawkY8bYCrS+o0GYM3F2M75Tfo+NttOTZGSuK
         jLBg==
X-Gm-Message-State: AFqh2kptSMhDhvyTakADy3HIm7HlOnbGlbEpJIAF9Q3hMKeqxx1v4TJC
        zaq5eGNosM3Dtby+b9PRz5stBbIuRtKfdKMgZLpKepePC+vmqw==
X-Google-Smtp-Source: AMrXdXsbPckmI8JpaOoyGA/N1jFfW73tGxZ40YAQaQ8tiPHxhfgVfWe9I1+5e6gltnxuKi3c2noq6eLrtzJA3zqIkrM=
X-Received: by 2002:a05:6102:3e08:b0:3c5:1ac1:bf38 with SMTP id
 j8-20020a0561023e0800b003c51ac1bf38mr1275090vsv.78.1674075098512; Wed, 18 Jan
 2023 12:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20230113215210.616812-1-brgl@bgdev.pl> <20230113215210.616812-5-brgl@bgdev.pl>
 <20230116055209.b6ydvderreqtqedp@vireshk-i7> <CAMRc=Mfm9ENHh5T4MguXh9YaPYdvSwsOWXyvHYhQGS47xOZcTQ@mail.gmail.com>
 <20230117054440.rtgmbupz7wap4qh4@vireshk-i7>
In-Reply-To: <20230117054440.rtgmbupz7wap4qh4@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 18 Jan 2023 21:51:27 +0100
Message-ID: <CAMRc=MfiUfNwUOgYT6LmDDVDj_kiB1FfWXe+Z+CtenwgKb3vvQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify gpiod_line_config/request_get_offsets()
 functions
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 17, 2023 at 6:44 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 16-01-23, 22:39, Bartosz Golaszewski wrote:
> > On Mon, Jan 16, 2023 at 6:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > +        let mut offsets = vec![0; num_lines as usize];
> > > > +
> > > > +        // SAFETY: gpiod_line_config is guaranteed to be valid here.
> > > > +        unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
> > > > +                                                                 offsets.as_mut_ptr(),
> > > > +                                                                 num_lines) };
> > >
> > > Can the returned value be < num_lines here ?
> > >
> >
> > Ah, of course it can. Need to add a test case for that. How do I set
> > the size of offsets to whatever this function returns?
>
> Instead of any heavy operation, you can rather do something like this:
>
> let num = unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
>                                         offsets.as_mut_ptr(), num_lines) };
> for offset in offsets[0..num] {
>         ...
> }
>

It sees 'offset' becomes an instance of std::ops::Range. Is there
anything more to add here?

Bart
