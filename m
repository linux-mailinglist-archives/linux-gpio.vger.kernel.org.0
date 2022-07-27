Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7551158202B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 08:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiG0Gfd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 02:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiG0Gfc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 02:35:32 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68E120BD5
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:35:30 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id e1so4909278pjl.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A5asaeAClikFJExaQYwMprIDuk+D9ccbJBa5Xw8uVU8=;
        b=iFj29iJggxoseVtkiAZSj5kBbZWNsTgXKhKPRlBVy+oKDGplBYqLt1eBicYu+PhRAN
         kpfW21GptWLrhv7IO5qcNsEgVHc1dQYVMcQixVYfAAObXm32D+5mC5E4HbYPRiIbfKeV
         RVRDPnOcCK9x6xJf/ZcMw9wd0jm0NNwvw4ymNi5fJli+V3ix78xTaebQXyYQKrgQ+sEc
         0t+GejYtE2LB/LIbnym5Q4PnL7cb1aEjfRBj8laUCEBHeKd2DvHDCA5kUliStfEtzW1Y
         uRDnAyvdP2Q2s3Oq6t9cPi6mvNfAf1mFCtad22Akzp9G3wAADHkbqmuaIGHSf6zi8nPz
         xyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A5asaeAClikFJExaQYwMprIDuk+D9ccbJBa5Xw8uVU8=;
        b=ysvIlUlH60ELiLM01XeUegsa0vor+o59mBcjFrCG7v4P6YXAAsOzqIFg3maDQjNnxJ
         7kEQ+nNddXXWSIoT5TnFA6kZ581dyXQxQjQbKFLUBUwxSHSzrKbZy5E5UZyTpD/rjNTD
         T/SVaPZf5jROgXbude6BsVW5ESSBJfh/kzZio1vanIdmTQfAd0KFsa3g0MuV1MvpWe8F
         AGIeJX0LZtLxtfZwuf57W5HLlLd5f29F0ch8qOJ5H6sAWZngOA+u96GJkd4OiRO/gbCK
         VXAyhQMUddkseXgrH/bwoTJPREyFRHZ1x1O1YD7u6GQtuwdQB+hTIJBxvMwVfpNMPta/
         BRTQ==
X-Gm-Message-State: AJIora9nR4j0fAPgLx829IbXbMWg+aR+Hyowtt1In5UJ4b1+wXeMg4i5
        FmQPTP7Kkv37Bt2R5iY8WX5ifA==
X-Google-Smtp-Source: AGRyM1ty5pcSwe1A2uHzVr7QnmECIOG7QjPIjZav22nl8NLhyMIXBcVvNB+QgGRWHtPmJKZE9WjOeA==
X-Received: by 2002:a17:903:41cf:b0:16d:68b4:fcc1 with SMTP id u15-20020a17090341cf00b0016d68b4fcc1mr15315528ple.21.1658903730173;
        Tue, 26 Jul 2022 23:35:30 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id b28-20020aa78edc000000b00528bd940390sm12970333pfr.153.2022.07.26.23.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:35:29 -0700 (PDT)
Date:   Wed, 27 Jul 2022 12:05:27 +0530
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
Subject: Re: [PATCH V4 8/8] libgpiod: Integrate building of rust bindings
 with make
Message-ID: <20220727063527.xspojxe3w2tpg7k5@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <584910baf342bee3511361c3e486ad4f3e5437f2.1657279685.git.viresh.kumar@linaro.org>
 <20220727025903.GH88787@sol>
 <20220727061824.lune6xhtv2hpgidv@vireshk-i7>
 <20220727062557.GA111905@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727062557.GA111905@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 14:25, Kent Gibson wrote:
> So you can't run tests on those platforms where bindgen is problematic?

Specifically for my case, that environment (rust-vmm-container) never runs
libgpiod tests, but just vhost-device/gpio tests. So it works.

-- 
viresh
