Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843536334A4
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 06:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiKVFPr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 00:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiKVFPq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 00:15:46 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2E32D1FD
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 21:15:45 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id 130so13332763pfu.8
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 21:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIJo46bM4ZiEQzdYzGlFB6gHs3fzV6/8ntjcz92lQFM=;
        b=gnQDngk4bGLEVSdpbd6bj8QyPbXk5bRCUXPiyb+YnOFF3J4YR2m2qTwuRV1sswRH89
         r/fzkjIhIY9N0+LG8KxiwsB1Gc8O/MEREqw+SAlbppwgJURTArIsT48s7DtUX3iaTpm9
         hPjQ6cGeriH+vmEkRRBphplqtXTjRdm1G3QeSRDXjEW0Sbf47xUyysIi3ykOZQRUkH1K
         TYg6icAjuBTvDZXvLi+pDDE4Av669pPFS0w+d1ylB3EZqlEJ+YNfZpg9Wl1dp0jmzIow
         S6mJfdrX/gl1/Ddx5w1zJ0+fKiCGFgN/xNsReuuZCCvx/YTMl2tbVHJjiWwYLmgrNJCb
         WZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIJo46bM4ZiEQzdYzGlFB6gHs3fzV6/8ntjcz92lQFM=;
        b=VzwG0Sc3y+wJukoOpAYLb8nMygHT5aOgx+cE49VjgKkW/zGyk5Y5b7vUidkuT04/6U
         BFaFulBJYyQzsTO7aqwM8xWqLFmlcfibj0SyrvcgRYNWK1Zatxd4GFWL3SIDNog/8eHy
         Vn7hsKi0PewozUs++x7ne/vlxVetoDOS99Kt1VVknvvK0myMso4eFGk62KPN8N8g7EYT
         xQl9cpgObuG2OFWhpGL1o0OSg7kbyGH67Ry8k7ph/6lbD9917YVLH5Bw3peWb6hXSaTS
         lDksbaQ6cdJG/Cs7/mUFa54d0F/ran3yGtW49a5oRiKYofjnkq89YN5vKYhlqOvCe4IY
         aESg==
X-Gm-Message-State: ANoB5pmqK5wV7VCy2HwcesRxFZhFAX901ty/t/HkjPN/of2Wi8M3NeWN
        q3DO3Lwgasp2hEReWwWSnHkYwA==
X-Google-Smtp-Source: AA0mqf4ah0/g5v4pLTAmEGARpIsm3Sb3zMfOEf3vVwY95+us10rPEU6ihoV3bmRX4dttEfA6piwffA==
X-Received: by 2002:a63:d816:0:b0:43a:a67c:4f61 with SMTP id b22-20020a63d816000000b0043aa67c4f61mr3004175pgh.549.1669094145332;
        Mon, 21 Nov 2022 21:15:45 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id u8-20020a1709026e0800b00186b06963f9sm10679456plk.180.2022.11.21.21.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 21:15:43 -0800 (PST)
Date:   Tue, 22 Nov 2022 10:45:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V10 2/6] bindings: rust: Add libgpiod crate
Message-ID: <20221122051541.j54z6ix6ojhzilut@vireshk-i7>
References: <cover.1668768040.git.viresh.kumar@linaro.org>
 <daa3021e4c148d33a8d50c54841719082836c43a.1668768040.git.viresh.kumar@linaro.org>
 <CAMRc=MeXTD10OVZzp2zGTR6Vs2PXemzkrvpBqFE=YojS9mrMPw@mail.gmail.com>
 <20221122043831.hemnrbyily25rhhk@vireshk-i7>
 <Y3xZgDch57EyTr9x@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3xZgDch57EyTr9x@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22-11-22, 13:09, Kent Gibson wrote:
> Which is a library that reads the envvars set by Cargo at compile time,
> so you could also just
> 
> const VERSION: &'static str = env!("CARGO_PKG_VERSION");
> 
> and provide a function that returns that.

Right, this is what we are doing currently:

/// Get the API version of the libgpiod crate as a human-readable string.
pub fn crate_version() -> &'static str {
    env!("CARGO_PKG_VERSION")
}

-- 
viresh
