Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98CB85FC399
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Oct 2022 12:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiJLKQZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 06:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJLKPp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 06:15:45 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3223E15735
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 03:14:51 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id u10so25540351wrq.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeOjosyr5u2M7MVtBWoYoVb9Bk3p95cjeefCPrwJkC8=;
        b=IfIyh9wLS22x3KmioEiReoiaJDSljH0FVVLTgHFIlCO85dVHuNF1tKi97jq9vkDVCD
         vf96D1ykpoCnKHHvEpbZkO2HY99bjvkAOt9sOnwSFXnLTmjO2xcwkqwRrhXEeYqyb10Y
         2LIY6lhVIKnX1RucCyRrC362M2AYpqUOWTt3quh9Pd+1IEuaqR5yn4HTUEcvaiaY6RAB
         JF2ZP9o+OCu02lYjZ3oQ/bcTa+s2lQh8QmhWJITeCxw2/lIGdkZHcrGLVCj/QBmalzuS
         jf0/xhx2gz9mg7ZwnKwuE30KlQqsk8OYdmE1EJdn9ISCwAunLoyV1dSWtCssdHyxYncd
         N6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeOjosyr5u2M7MVtBWoYoVb9Bk3p95cjeefCPrwJkC8=;
        b=ubgM1TONh1rzUveCz5/wBpssMW2dGnPJBooSwjmLg+m3k+Tx1d50vAAnpSyEk6efSR
         W7UOEJyPy7PIWOw9h/4SrCKIqw6spsAY0oYYmfN6AeyDF7BtCt1KXgC4N2luHlqcr5xV
         fuqhbCynm3j8FTFzHoO28pwC1nPeeZHVM4d+CIErYQd6gBAVVcpnVk+hxk+DupOhPU/M
         /E4QhYxQN/4pBmONM1ID7mS8l3kmkmmSGxyiDiNYg88IGy6N+f22wiOPBewKx7zCLxIU
         Y9Wx4R0jCHHyUMddI/KY8Nzfw2cJrSUOM0b+f1hXiweeDbgb1IYmoQ1vyUekfkvwWYT0
         Th5g==
X-Gm-Message-State: ACrzQf3bUgA4nIIxtJ3oLIULVtPQFJZciGVuasL9rr32o4AjKoZ26or3
        flWeZMYYXY2qyi6vCCcVlb+6DA==
X-Google-Smtp-Source: AMsMyM6y2xXYz4x9NLL4v6vXYngR+hifxuZO8FeTz8FWmqoJQGmH7LJIfhFlhS0UXcVQm2AjLQ+Oqw==
X-Received: by 2002:a5d:5988:0:b0:22e:5a65:1e21 with SMTP id n8-20020a5d5988000000b0022e5a651e21mr17945171wri.338.1665569689584;
        Wed, 12 Oct 2022 03:14:49 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b003a83ca67f73sm1503870wmq.3.2022.10.12.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 03:14:48 -0700 (PDT)
Date:   Wed, 12 Oct 2022 11:14:47 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/7] gpiolib: of: add a quirk for legacy names in
 Mediatek mt2701-cs42448
Message-ID: <Y0aTl9iL/22pLfx6@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-1-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v1-1-e01d9d3e7b29@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 11, 2022 at 03:19:29PM -0700, Dmitry Torokhov wrote:
> The driver is using non-standard "i2s1-in-sel-gpio1" and
> "i2s1-in-sel-gpio2" names to describe its gpios. In preparation to
> converting to the standard naming (i2s1-in-sel-gpios) and switching the
> driver to gpiod API add a quirk to gpiolib to keep compatibility with
> existing DTSes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I'm just passing through since I was curious about this 'set but FWIW:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
