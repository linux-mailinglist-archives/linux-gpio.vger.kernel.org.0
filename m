Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126F4619089
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 06:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbiKDF4R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 01:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbiKDFzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 01:55:52 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFA12AE34
        for <linux-gpio@vger.kernel.org>; Thu,  3 Nov 2022 22:52:40 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id g129so3541108pgc.7
        for <linux-gpio@vger.kernel.org>; Thu, 03 Nov 2022 22:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iu33dAA/yW36a1VSAl7oiwACcXYBlWFObMg5Mf2LO6w=;
        b=plODNXahQL3vbjn4BU7nQifw0ltJ7DzkT0YkHqtO0WihLrtO9MZcUzOvXBTUzZG85t
         swCJYIkJgSHix1CcOePXxzemc6mQzAjhu+GEIEDdq813qrA65J9iediPlMWAvhkUJLVd
         BoUqlNHXOAe15DHEpK+7xtcU9Mpt/rPHiBuuE2cbyq1aal/M3vQHOgLwGBcYDeaPuPsF
         L6sSeHJi3KXg4lkoa+eAZKUwr0Na7Andgvr7RleLFRuLNKGQUj0xn8/1Vvkv1qNw1tKq
         Hoe1nj4tWJHAFB073VBeqYCCWDs5Jhb4D+WSLAksdb9JBDClI0FN0FeaScqv5j3YiqTP
         AwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu33dAA/yW36a1VSAl7oiwACcXYBlWFObMg5Mf2LO6w=;
        b=1jYU55JlJwHu9ssS4z606gtRgrkOb/jM33ofk3uP7nn8mCjDeUPkAJ5Ak8LLZ9+g4w
         3Jsf8DqrWyWmyBc4cSoC/jOesCSn+udVF9X6SZTiZDPs9G2lqAuupRbNhcNS+qlH8PxW
         1TXi/2MpTsnFlE94OSwswN1MR1LUr7gpJKnuu1Kx1peB6FsxP/KNrEpl8jyl0oWTmo8o
         kQg32B4hVYmz3eSS1gv1l2AUIjvUPcmoAL/In/r9K/S75R3UVTU3JWPOMRMnda5wIWrR
         Pdl8RJMKyMOWSK8IY3pU8FwBdzQzvoUBqSB7OVvpkU9m+vsVTPRWYTPMHyKUXL/f30Yt
         B6tg==
X-Gm-Message-State: ACrzQf3qXjINmm4W8AS7dEmob6Dof2Ww9uhlhrXQb1L18Ue67RmwLy0T
        zaxynXQx//2Lygg1YtARvKKXEA==
X-Google-Smtp-Source: AMsMyM6+hKOHSJHr9RFtNAbcmWSqZC1agjcf84anQAQSnKcrnRdu7CAXmC5uSMyt7YCrRVErFPiRSw==
X-Received: by 2002:a63:cf0d:0:b0:46e:96b9:2760 with SMTP id j13-20020a63cf0d000000b0046e96b92760mr29034590pgg.328.1667541133354;
        Thu, 03 Nov 2022 22:52:13 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id iw15-20020a170903044f00b00186881e1feasm1676166plb.112.2022.11.03.22.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 22:52:12 -0700 (PDT)
Date:   Fri, 4 Nov 2022 11:22:10 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
Subject: Re: [libgpiod v2][PATCH V8 7/9] bindings: rust: Add tests for
 libgpiod crate
Message-ID: <20221104055210.nisy53pi2coaukf5@vireshk-i7>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
 <0e1deffab733e0a8458d1626bc20cd496cbd5099.1667215380.git.viresh.kumar@linaro.org>
 <Y2JtYTCqYM2sTuRC@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2JtYTCqYM2sTuRC@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02-11-22, 21:15, Kent Gibson wrote:
> Those drops are now redundant as the events are returned by ref after
> patch 9.
> I assume they are ignored in the build, as the tests build and run,
> but clippy complains.

I have now added "--tests" option in my clippy's alias. I should have done it
earlier, my bad.

-- 
viresh
