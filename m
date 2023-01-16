Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78AB166B6FD
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 06:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbjAPFzN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 00:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjAPFzL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 00:55:11 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CF78A60
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 21:55:09 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id z4-20020a17090a170400b00226d331390cso30032360pjd.5
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 21:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lAXcTbaccOmvP5WxZ6U4GKqsidV7RmM8O0oIur3X7Y=;
        b=NhS+euPyEnyq7wiUCd4j5g+J9nU3VPi+kI3E/+Q426Sizo+MSfM5diDdxLjrrS15ym
         3BHYrMV/b6v3IpF9bAKYRfEfWbT6ScqgB2VuprVh3csvNyW6Uq4I11n6NC1U4/YasYEI
         zpG6dOvAvW8fOJAjqzRkB7ZACq5KE28gDSANQMVi1K9QyV6UXaMlpq7tRqaiWNnyFIxs
         UYhF9nBDlU+kO7Z2oI+xX7epG30YMQ0f7vqVCNu6K5gUcUWBRYilrBHnemadBjqEPXEX
         r10tNEO3abEcRpvmpjijnNlC57n9X38pk7bF2EdAxgaBVHwojeWksCy0+x2CzDufacep
         /BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lAXcTbaccOmvP5WxZ6U4GKqsidV7RmM8O0oIur3X7Y=;
        b=tC5bIO9yq53buGB+fFbLLrnlgIS+RD7hRrLoNAtRYdkOhmh1glPJAi9n3R5MKIx4zp
         zUhWdof26VN74g7lMoqiD4jbiEQlKMbuPpvUvEggKubc8hZRc+2ZeISKd2s/LL8y4OUw
         Ep4c1U1001M0hMlxdDBpYPfFVdIH2EGDfiE3F/E6en/gvJrfTH3syOIxb4lPHkiOht7Q
         8GRg6PGqivYA8UxI74UJ9ZX2rlycyRzlvUW4xsm9raChd6LOAJOInLeWINs6fAqTjir7
         k1HfdLosWMCqzJU6wkrDv2++jQm0ImAb0JjshB3xq+RjXL9LFWMhB6kFuNt1AWFLnaA2
         w0HA==
X-Gm-Message-State: AFqh2kpGHHNAu+5c5NYv+BanWDBYAh/vzTFTlKwJ65JaSyaF8up78B2Y
        mWA0EGTAQ8sSXyLOpYeYibt/t9c2PIuIRCfG
X-Google-Smtp-Source: AMrXdXvbVzPbGB6pRm8cUs9968GwvSeiRCQLqiQL8jKYqKvWbU8f2J1m82KgPeeB7D1O1HiAkLfquQ==
X-Received: by 2002:a17:903:404d:b0:194:91e6:1e69 with SMTP id n13-20020a170903404d00b0019491e61e69mr2735056pla.12.1673848509343;
        Sun, 15 Jan 2023 21:55:09 -0800 (PST)
Received: from localhost ([122.172.81.45])
        by smtp.gmail.com with ESMTPSA id e18-20020a170902ef5200b00187033cac81sm18365221plx.145.2023.01.15.21.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 21:55:08 -0800 (PST)
Date:   Mon, 16 Jan 2023 11:25:06 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 14/16] bindings: rust: make request_config
 optional in Chip.request_lines()
Message-ID: <20230116055506.6vg3mduwc2ymlhtb@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-15-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113215210.616812-15-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13-01-23, 22:52, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Request config is not necessary to request lines. In C API we accept
> a NULL pointer, in C++ it's not necessary to assign a request_config
> to the request builder, in Python the consumer and event buffer size
> arguments are optional. Let's make rust bindings consistent and not
> require the request config to be always present. Convert the argument
> in request_lines to Option and update the rest of the code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod/examples/gpio_events.rs         |  2 +-
>  .../libgpiod/examples/gpio_threaded_info_events.rs     |  2 +-
>  bindings/rust/libgpiod/examples/gpioget.rs             |  2 +-
>  bindings/rust/libgpiod/examples/gpiomon.rs             |  2 +-
>  bindings/rust/libgpiod/examples/gpioset.rs             |  2 +-
>  bindings/rust/libgpiod/src/chip.rs                     | 10 ++++++++--
>  bindings/rust/libgpiod/tests/common/config.rs          |  2 +-
>  bindings/rust/libgpiod/tests/info_event.rs             |  2 +-
>  8 files changed, 15 insertions(+), 9 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
