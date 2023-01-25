Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE5D67ADB7
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 10:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjAYJZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 04:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbjAYJZm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 04:25:42 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342AE4709B
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 01:25:42 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id k18so17319894pll.5
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 01:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ynGRIYQMDWLnxRatTzr3xwHJu8df3xKrZu0ehvviQas=;
        b=gwedR+xYqXRq0jg7AoLAhVVmDJ6rrgd4CBKyfd82W3b12pCRB2UCfZcC+llaMVBm8C
         bdpie3ZuRTzjB52Kub4wk1L2t1j2TgBojHsxftqA8UqnAfcbGqwcbN0WdrS3aVNJWZ8T
         Jr8Ng31ysAqjKqPiC9UukB2VoL1Y5K/dNPx3+L9OO81KKae/o3daU+loM78U8lsYGcmK
         VT8bYrA3v1lmOs6OI9YrX7hAh5I+tieGTBsIFwSw5keW2P9obLpL5yKO8HJNBqAoM030
         9mBq3yJmgPKNApGr4zAFw8HHYYsfaqcK4fpdEIUV1ZjhDRikwYSMpphY9+5Lnj5j+UE0
         vu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynGRIYQMDWLnxRatTzr3xwHJu8df3xKrZu0ehvviQas=;
        b=zCmxusNzxNKSweIgVkGe4jRWtWbDpV48tJCeIzIpAR8l7p7UwwE9u/VuzZygnE66h6
         XUrJXRxI/jKjOVpP2zuxcAMHDcxU8LRzaE9/QCS0DAqt2aVKgRnXbTpsPEiwOUWcqJfv
         4GPQirzNxzIhVkkzCK4Mlpwe1rpMb6r9ejCwVXie1RdPvkGGWXqUDaaQVs0h5f56pm4a
         PLMuS3aAlJyWD3nh4qEaMoheOxUZWHhir2DROhlkEA/e0qhciOolWAOk2E/PBnkNZvwQ
         wtZh5FIVkfe959at7TuRrNyOPPoXg6fxN/KHEB9N1eL8fy5tr/dRwUXwgDqgrng7sJtr
         x41A==
X-Gm-Message-State: AO0yUKUsBZM49149KLma0xzo8+gNU8A+ee4mHPluuZy4nBUINfxJ1Zf8
        9+EFPgG77Xmm/V3O3f1NNeAhOA==
X-Google-Smtp-Source: AK7set9dtmX0fFUd2fb9JBT9sRadfAvmLo1hmd98id7scMb1612Ko/rhWloyEXYl0xDrTp9ATEJi5Q==
X-Received: by 2002:a17:903:18f:b0:196:cea:487a with SMTP id z15-20020a170903018f00b001960cea487amr8564103plg.53.1674638741775;
        Wed, 25 Jan 2023 01:25:41 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id r8-20020a1709028bc800b00178b6ccc8a0sm3170879plo.51.2023.01.25.01.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:25:41 -0800 (PST)
Date:   Wed, 25 Jan 2023 14:55:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2 8/8] bindings: rust: provide
 line_config.set_output_values()
Message-ID: <20230125092539.arbppp5qkbheapsn@vireshk-i7>
References: <20230120094515.40464-1-brgl@bgdev.pl>
 <20230120094515.40464-9-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120094515.40464-9-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20-01-23, 10:45, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a new function to line config allowing to set a list of output values
> for requested lines. This works very similarily to the C++ version of the
> new C interface.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod/src/lib.rs           |  1 +
>  bindings/rust/libgpiod/src/line_config.rs   | 24 +++++++-
>  bindings/rust/libgpiod/tests/line_config.rs | 62 +++++++++++++++++++++
>  3 files changed, 86 insertions(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
