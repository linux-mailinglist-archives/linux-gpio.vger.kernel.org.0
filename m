Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D93A62D95A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 12:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234795AbiKQLZW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 06:25:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239203AbiKQLZW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 06:25:22 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B459CE27
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:25:21 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id p12so1339093plq.4
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rp18pRrUFGbUcvf7WZotj07QCDsgOYV3nBwPFqJCyuQ=;
        b=PtHmkuX+H8JVySJmAX3FKdib4GFsO1H8EjsmF4dHxXcuFwP3VLxjyIkC8tgULBCUzW
         iLuREi3L6F27+E7x5+PRANFJtlttimqGeLBDglI8fJ7iscrqD8qWp7GpBphLRt7nXIgl
         F4vleS9JlVQE8nexL5FDvWGYmrmBQ1lXPFgMqJ8iCGhbHqAUfcG9kc9TTpjOAmdN6TO4
         Pp8cSShiR2Uz9CGeJQWyFbrQ6ZdE5Brrk6QW6K/FTNEV589JX2tiVk2ejyVUETWKRbXn
         HwjicPejIgMGbFH/ggw6AFXL6oMzJ5cs+NSwsDo2V4RxDYnCiN8OVCOip93vrawapKhK
         1bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp18pRrUFGbUcvf7WZotj07QCDsgOYV3nBwPFqJCyuQ=;
        b=tW9WZKv1woIHcNKZRqJfuUl5ywX8QiW0dgVAfTxBE1zABMC3ps/9BHiRMkBXuSZf/i
         gidiioY3EaiopK9KKxXqzF7ipjyaeJK6Y/2XmxpPU4V4TSo2vWf/szdyc7m+9Omz4Bzc
         O8i3Zt/GsYZhZXuJWLKYg5BptcUbALTp+FNtB73yLKTtBnV5Aj6WdBFeyjssVpuihUtP
         ldhdmuCmnMh8viXNCR2WnIVLpRvqnl5BEERLeXwvtsP/LQzPzbnUWfDslVYZMDbnVG0N
         urfGTv+EJXogBm+Jy3uP5bEhNFu81rS9jUpZ/UzRytbmPlnNpWYR8rvuUPjLmowVtXXW
         5dxg==
X-Gm-Message-State: ANoB5plfP656iy5O5XCI8ynSBRyJ1+NLeKkB9fm7ZljtIxvBD0yYPj7l
        FgAV5jmXzTo+nEDynjyKb9s8uQ==
X-Google-Smtp-Source: AA0mqf4oEozaMBN0dSGc1mtuD3E037QHSrZPdfb9NPwqn6dwF5JIIQgghxxls98wDf+XpikcIgqN/Q==
X-Received: by 2002:a17:90b:2809:b0:212:e8da:fc3f with SMTP id qb9-20020a17090b280900b00212e8dafc3fmr8044682pjb.189.1668684321000;
        Thu, 17 Nov 2022 03:25:21 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a694300b0020a825fc912sm3307344pjm.45.2022.11.17.03.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 03:25:19 -0800 (PST)
Date:   Thu, 17 Nov 2022 16:55:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
Message-ID: <20221117112517.64fvaynvjwbcqeix@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
 <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
 <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
 <CAMRc=McUTqUJzV-9yEA-7LxrQ8ktWzaPMv+x-1mOLZ0M2W+uJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McUTqUJzV-9yEA-7LxrQ8ktWzaPMv+x-1mOLZ0M2W+uJg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-11-22, 12:15, Bartosz Golaszewski wrote:
> So I'd say - just use CC0-1.0 license in Cargo.toml?

The Cargo.toml files already have following currently:

license = "Apache-2.0 OR BSD-3-Clause"

-- 
viresh
