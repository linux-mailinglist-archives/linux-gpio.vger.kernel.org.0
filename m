Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AABF5876DB
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 07:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbiHBFon (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 01:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbiHBFol (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 01:44:41 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFAF47BA5
        for <linux-gpio@vger.kernel.org>; Mon,  1 Aug 2022 22:44:39 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso14576363pjq.4
        for <linux-gpio@vger.kernel.org>; Mon, 01 Aug 2022 22:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bgQUIAIE3uDdkqWet+XH2lBp5btd5lOVdoV3a8qDbHw=;
        b=yyaTmGjDDf28ocKgPi80oKjYSaxpWut73FZem7Q3Pa8EaIALQytcWhFbzukEbCDOXN
         Z829SdjYx6nVCt5yeb9yJhE9IO5BDyedQHVvoY8P3cU8FRU+5I+S1HiUXqlI+5dzjRU5
         tZYX+FP+uUVeLyAdsXAqoPMnYC/z0JP3JkHnkS4er4tth9yV2Jtdku4OB9uaKCgbrmzA
         ManjoAkSvemg7eAwZZ1rNkD6xWgmhX7E9/AO1WRsF6oMPLLqMHwSI5Y4AgELyiNjVBRU
         iILp+kQvNL+G+bBbD4WZBsAzppbl99FzELp1kZOV6fU5ODR1n6la99t9ggcSYu8Xsayx
         ijLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bgQUIAIE3uDdkqWet+XH2lBp5btd5lOVdoV3a8qDbHw=;
        b=6jQqJE1ZhtbGhimfK/WGA6+lhIaO4cOALZejY9AgMre9z8xMnG8jzwisjFcX3umA45
         smhDJ6zOQSl8pklkdcLum1ml1nqHNRe9RC2a1yfURsDzIpo23MHdZzPIvfopLhifLGkM
         7q/HqMXCdZhnx3kEWTkQRJFeoZfLBEGaSsPPKfnLVaOCOrw5Fna4iGVa4jB4Rm0oyJQr
         mEh0m5VZ+OxW+GcTP9vjZNmJ5TCdXb2LIWI4CL35mK1c9MecA4JCLk2U6C4gt+zvUnAl
         BVKbZfiuU3WpFiKIdPmSviIQpwL0w6zpR9RY3ILI2vH2PWoU/HDXxGkNSiSh32K3fc2X
         excA==
X-Gm-Message-State: ACgBeo1l0xkkAP8NWOJRPuOafjOYIhD/bevkaY3jebl71OUaaOwf2YVS
        a0ZLvM41abgP7kI6f4IsbmRDrA==
X-Google-Smtp-Source: AA6agR7MImCGe2ZAZDm0FlrsnMHK0nsLu3jglqLqtFNZls7XJHbpY6hBBHVj0TzWyttT+Qk3LYKeNQ==
X-Received: by 2002:a17:903:2113:b0:16f:6ee:65f2 with SMTP id o19-20020a170903211300b0016f06ee65f2mr1204458ple.76.1659419079185;
        Mon, 01 Aug 2022 22:44:39 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id w16-20020a1709029a9000b0016dd562430fsm8526331plp.120.2022.08.01.22.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 22:44:37 -0700 (PDT)
Date:   Tue, 2 Aug 2022 11:14:34 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 7/8] libgpiod: Add rust tests
Message-ID: <20220802054434.prvmgvv6hklilbfq@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <78b3ee21dec2a66003c2eae2800e9699a8ecd180.1657279685.git.viresh.kumar@linaro.org>
 <20220727025847.GG88787@sol>
 <20220801115402.uk4gsptesrisohvk@vireshk-i7>
 <20220801123806.GA42433@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801123806.GA42433@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01-08-22, 20:38, Kent Gibson wrote:
> The request_lines() could be considered sufficient to test
> the conversions for both request_config and line_config objects.
> 
> But testing request_lines() and reconfigure_lines() doesn't just test
> those conversions, it checks that the functions don't mess with the
> config along the way.
> If you want to take that as a given then sure, just testing the
> config variants for request_lines() will do.

Okay, so we want test setting various flag types in line_config and
then see if request_line() fails or not and verify (read) them later.
Right ?

Very similar to this is also done in tests/line_info now, where you
suggested:

"Test that you can read all supported values for all fields."

So I set all possible values for fields and then read them back.

Lets see after the next version, if they are sufficient or not. I will
happily add more if required then.

Thanks.

-- 
viresh
