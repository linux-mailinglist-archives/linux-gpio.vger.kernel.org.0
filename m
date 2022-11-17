Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E72162D8C5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 12:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234674AbiKQLF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 06:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239726AbiKQLFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 06:05:13 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439CDDD9
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:04:41 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so1594817pjd.4
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9F08DR853gUiA6Fxhg0RfcFKUVzCcQu3N+OYqBQ5R4=;
        b=zt3P1E28LH/11vq6QuUKN/HNpm+DhqBQgzcmTfa0i8WhwCx1r0VngZGvgh1BQtrnnL
         n9LVbdflQvE+i9/msJGwbZ5deAHFrY8Gieu3TGy187zdyjgbvKOY6DIe3XFb/B1hoxTj
         6rrcKBZD0J3Sc8Lajfaw7Lx/iO/EEeqC51NchQ2hvj5FoCgspOk3vAjdWYrJ/n492FN8
         PYz0PQUfCZPSHlErAM5y1tPzneWU7AmGl/XFpsMfqT7ctNvlTT7IGadZcr2N9i1E4giL
         B2dtkKReg1+UJbZJiQgtTkCA+s59sDPAG2EZjwzV3tV0QO7uSihTPGt5PF5ozqySwKfr
         t3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9F08DR853gUiA6Fxhg0RfcFKUVzCcQu3N+OYqBQ5R4=;
        b=5zpxC07h54EKK5r5gv7cwf2M1AfHIdi6CnEXRcbTs4Mot5PE96ja89/fZpp2Qe3jUN
         xfB2ohkvkQR+R7fii6D0tPjV5rC2sMu47X5jgNqgZvVK8zdk9SoMINgS6aTo7ncZRtuL
         WfDHdlri5il6+df4cpIttVW/uZOgnOvUGdXoIJ8SGyiRsw3QPkrHUkwrRohqHW5kCuzD
         nyEMynimPLtMmsXlDpDka4Iy9DfhFbNNxEUShbuNTOOBoD/5Azh8mT+xtst5BV0JRjif
         yGhIKkYIAmEVPJ0AgERpsMc8UX4Wrm3E1mH6xQlJqJXo8FflJfS4QWxCerce3WcX6hV8
         M2uA==
X-Gm-Message-State: ANoB5plcrXKJoyJLtmyORLZIGEUPQ8FfyEk7gaIFY85X2LMdiAmWXaJ8
        7BpW9Ll+dnxCsCHosfVTHIDv1g==
X-Google-Smtp-Source: AA0mqf7foIt6usdmzl/t2JoWKdEwPxTv4yKb2/XW6hTv8qNI+kGUc4e9r3LS+xa3lNGn+qYnYTy53g==
X-Received: by 2002:a17:90a:49cf:b0:20a:61a4:9389 with SMTP id l15-20020a17090a49cf00b0020a61a49389mr2288000pjm.20.1668683080777;
        Thu, 17 Nov 2022 03:04:40 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id u3-20020a170902714300b00188f07c9eedsm984249plm.176.2022.11.17.03.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 03:04:40 -0800 (PST)
Date:   Thu, 17 Nov 2022 16:34:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <20221117110438.o6im2ejmyj5qmv45@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
 <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
 <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
 <CANiq72n70mY4QGW+3uNLaS-f1Y40cR0aZHq37YSt7uZY17SnoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n70mY4QGW+3uNLaS-f1Y40cR0aZHq37YSt7uZY17SnoA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-11-22, 11:51, Miguel Ojeda wrote:
> One thing I may have missed: why is there a `-sys` crate for one of
> the bindings but not the other? It may be a good idea to document the
> intention as well.

gpiosim ? Maybe yeah, it should be gpiosim-sys too.

-- 
viresh
