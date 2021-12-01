Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD39464C7D
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 12:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhLALXs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 06:23:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348535AbhLALXs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 06:23:48 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC1DC061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 03:20:27 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso1140777pjb.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 03:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4NocNPKqKR9GeEJfUsvN2TtLZEJxTtyx5YfaN92j1mc=;
        b=srO61iXHOciY1oRhrJR+zyHnT7bmg5gKV8ZifiNkXe/aG/fZH5GhreVFijUO9XwYwL
         ktQqLr9iafbECJh4fkKEZVdjN78byhTgOyuLdZg8mrGxlJxWZSgbfcKS1BbfM6pEArD+
         brLOuCU/qp8VGH31uxR//mjzlB/pBZlLelDrMmF/jfR3HHJKskteyCVboPWmTT+Lk9eg
         6z9ozlE1BEBUGoEQDDM6kFbVwlZEkHalLZJSQz8UNk+ZQ1IzrBa2kN2DuJ4QaEwNppfP
         ixYpDg61PTENPaOOeXnrK244X5xYVZdRiGcxs8XaRM7GRUEE11wIJPT7CzDCIAgb+gWn
         WlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4NocNPKqKR9GeEJfUsvN2TtLZEJxTtyx5YfaN92j1mc=;
        b=zfoeU2t+LpMj6RL9z/gNoV+5lWJd1IW0p2SB/jRn2uDBj/+EIlaFCF2AePI7YgckHk
         WbC+BR2ePn1KQIPzHqFIAJ5MojHn1fiT+x5bhgnxzCQRuiWy7LgKZDkhQ9eo1MDviiX+
         W7xzGRjlplRSsDI3R9GwY8eKabujkXcI9kF/e5W6c4hSsU7MxK8p4GOvWbd+smy+AzCh
         yp5P8VhrFi58x3hHVvF+m9E43OgyupRaQT21rP5HP9zuw/gKC8ywUsM4ETnI7guED/kv
         c/2njC1PrtL6r9xbQNydLg66++zqyMzLB68vbkLPpxC1iGEOBBuuqt2iGEEWg0/NvzVC
         gDSA==
X-Gm-Message-State: AOAM530bjuJkRzkFlYdd7MI86MU3BF97tg3+6OpJPwkqKLbyPuPRrZWY
        qqJcN9cU9LO3x4QjqelL4ao8TA==
X-Google-Smtp-Source: ABdhPJya9Q24FTi9+SzRx9F7s6qP6BLIrdNVeR4DBQzOLp+Fv8dQYCxQiZyirdGIp1g29godtWyIQg==
X-Received: by 2002:a17:902:b28a:b0:142:3e17:38d8 with SMTP id u10-20020a170902b28a00b001423e1738d8mr6762494plr.56.1638357626834;
        Wed, 01 Dec 2021 03:20:26 -0800 (PST)
Received: from localhost ([122.171.9.64])
        by smtp.gmail.com with ESMTPSA id m15sm25681550pfk.186.2021.12.01.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 03:20:26 -0800 (PST)
Date:   Wed, 1 Dec 2021 16:50:24 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH 0/2] libgpiod: Add Rust bindings
Message-ID: <20211201112024.uirpirrnfyvad4ns@vireshk-i7>
References: <cover.1638182138.git.viresh.kumar@linaro.org>
 <CAMRc=Meof=kMOXWFmgueOMMZWLMr=t0X=MYr4_3f=Ct+zStC7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Meof=kMOXWFmgueOMMZWLMr=t0X=MYr4_3f=Ct+zStC7w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01-12-21, 12:08, Bartosz Golaszewski wrote:
> Thanks for the hard work on that. Before I even dig into the patches
> themselves, I'd like to clarify a couple things (because I'm still not
> sure we're on the same page) and the projected timeline for v2.
> 
> #1. The v2 API is obviously not stable yet and we're still reworking
> certain structures (like line_config's accessors). This means I can't
> merge the bindings just yet but I'm fine with taking them in for v2
> given that the missing elements are added, which brings me to:
> 
> #2. If you look at the existing bindings, you'll notice they all have
> tests implemented. These tests use the combination of whatever testing
> framework was chosen for a given language and a wrapper around
> libgpio-mockup that allows to use the gpio-mockup kernel module to
> instantiate simulated GPIO devices. I'd like to see a comprehensive
> test suite for the rust bindings too before they get into the repo.
> Except that:

Yeah, I was able to get around that yesterday, while I was integrating rust's
build with Make and understood what we are doing for cpp and python.

For now, I dropped the idea of implementing rust tests, and wait for
you to go ahead with migrating the python/cpp ones to libgpiosim.

> #3. The development of other parts of the project is currently blocked
> by the gpio-sim development in the kernel. I don't want to reuse
> gpio-mockup in v2 because it's simply badly designed. Currently the
> v11 of the gpio-sim series[1] (based on configfs & sysfs) is on the
> list

I went into details of that as well yesterday, looked nice.

> and only once it lands in mainline, will we be able to advance
> the tests for the C, C++ and Python interfaces. This is when the rust
> tests should be developed too by following what other parts of
> libgpiod do: providing a wrapper around the future libgpiosim (a
> wrapper around gpio-sim configfs/sysfs interface that I'll implement
> once gpio-sim is in next) and then using whatever testing framework
> for rust is preferable.

Exactly.

> #4. This one is something you could already add at this time: other
> bindings contain the examples directory. Inside there are simplified
> reimplementations of the gpio-tools. It would be very useful for me
> (as someone not very fluent in rust) to see how those bindings are
> used in practice. Could you please add it?

Oh yes, sure. I can do that.

-- 
viresh
