Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5983566D5B9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 06:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235436AbjAQFoq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 00:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbjAQFoo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 00:44:44 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879EE1EFD0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 21:44:43 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 207so6506416pfv.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 21:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6WgxXe6sJD5bT3adxSIyTrrR1HAkNNPu+5k1KWwcd0=;
        b=Xa31MndbXBsokYdVwH5rPVb+1xlj8G6h50ZYpH2O5qDKjYnK3LZBMSJ3mqjmbnwQe3
         Y+/6+mrSbgzZAF0PYE87FKYKMmPDx53WbFCSo5UzcfOe57mOu4SyD1b5RceaXhECQt8w
         /I97GY9FkfatM3JuGtjNmbmukKBN7qEVciNyBimJB1vVBSCZUjnngKgCq8tlVXTOzlQy
         Ng3jBnntoiiAI8SXMyMfTM0COX6Ks/i41WKl+KPTOeUEu0Cyai1+5kgVonA6WyNKaJqX
         iGXnldYdUmkF3Of6JL7kOaAdlizLoVk4SGZtW3fePZEtQboMDUD/bl8YMgzURKCvizDj
         wGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6WgxXe6sJD5bT3adxSIyTrrR1HAkNNPu+5k1KWwcd0=;
        b=OAAo8FNhDOy9l/z7eRxdWNOT55ZJet2ysho6Mb9QAyZO8ToTR4tQEJ2LnhljxzYIVp
         U5RqWngSuUyEVhU7kuMYCCS0UKhtEo4AltQhj9uxIwD4b5AXUEardUBMvughk7H//FZk
         8mMArMDCckLcEe3efIp6JSNX8HK26NW/0oiv7ECU955rl2Lj+nWz5Go8Z8jEA5Iypok1
         oN22iA4Pi/wPd/CUQU1Hqv17nM2j6noIh57ukHxid+7zIyUUNKjZ3kgd3m6QQRPrVZVD
         nmWYdyB7iGAaQ9l9Yw26hMhiDHB1vCuZY484nFcB8eYO4wcGGX+zt2rxJuM7my2fmE1X
         /2pg==
X-Gm-Message-State: AFqh2kpPIE2BJOzj23g19Ugo27TK0fzBxWrKXxqNmmCWl6G6FQx6Ar2n
        bEYt4///O3BUKazlubhy7hY4/Q==
X-Google-Smtp-Source: AMrXdXsb6xd3ksq+FAb8SeB86esW/6sFyBT3fB0yrlobltdHVz0dwjLdgTiXmdHhF7eg0zWsT8WCiA==
X-Received: by 2002:aa7:8bd6:0:b0:588:e132:a2f8 with SMTP id s22-20020aa78bd6000000b00588e132a2f8mr2172987pfd.23.1673934283016;
        Mon, 16 Jan 2023 21:44:43 -0800 (PST)
Received: from localhost ([122.172.81.45])
        by smtp.gmail.com with ESMTPSA id s2-20020a625e02000000b0057ef155103asm17579107pfb.155.2023.01.16.21.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 21:44:42 -0800 (PST)
Date:   Tue, 17 Jan 2023 11:14:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify
 gpiod_line_config/request_get_offsets() functions
Message-ID: <20230117054440.rtgmbupz7wap4qh4@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-5-brgl@bgdev.pl>
 <20230116055209.b6ydvderreqtqedp@vireshk-i7>
 <CAMRc=Mfm9ENHh5T4MguXh9YaPYdvSwsOWXyvHYhQGS47xOZcTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfm9ENHh5T4MguXh9YaPYdvSwsOWXyvHYhQGS47xOZcTQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16-01-23, 22:39, Bartosz Golaszewski wrote:
> On Mon, Jan 16, 2023 at 6:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > +        let mut offsets = vec![0; num_lines as usize];
> > > +
> > > +        // SAFETY: gpiod_line_config is guaranteed to be valid here.
> > > +        unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
> > > +                                                                 offsets.as_mut_ptr(),
> > > +                                                                 num_lines) };
> >
> > Can the returned value be < num_lines here ?
> >
> 
> Ah, of course it can. Need to add a test case for that. How do I set
> the size of offsets to whatever this function returns?

Instead of any heavy operation, you can rather do something like this:

let num = unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
                                        offsets.as_mut_ptr(), num_lines) };
for offset in offsets[0..num] {
        ...
}

-- 
viresh
