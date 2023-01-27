Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 275D767E6D4
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbjA0NfG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbjA0NfF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:35:05 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDA11D92A
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:35:04 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id d8so4033404ybe.9
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cxdDbkfbjax6StuKhKjuEzztvcuIR/QFeGE1cvRqqik=;
        b=dKziKWKTOTSN3neoeDfIHyuFG/+T+J/G6UhPO9UQsKuMUDXrlYToCd4W+eWtVxOmhX
         zO1Lza2RbFw+hJTIKFCvaQWbHGk0zW6sWYDFXZIXAZbh4Zfqn9hnXI8kYt0Ea2Wct6ra
         TlPMZo8DVwjL67y0a534ENw885bxmZAYBQ8Fu/ddfXHKnXPol9Je5zWN5L92DWxS3Wvx
         BTfIDVwTNczy2aVo1ZwYAqn2TG05mRZRxqIqhDhA+ah7iE1iwldUBHBdr+fWkfCX9LwH
         qWNxsl4JEP/pUntiNbfU0Nqy1DBZ5fhmS8YTo+MKKjOklPqTVu0BJquJspsUFNelQN0r
         eHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxdDbkfbjax6StuKhKjuEzztvcuIR/QFeGE1cvRqqik=;
        b=1aOANxjQHAtIU71QIqh7FmJMV2RdL4gF2UY83CLK/kK8DxnK7PjZ7VDJb2QBob5m6P
         7NoRwTe9+wg7nFxuvg3wg7RqAdAqux6oPfm5VZLHDZCpyDffQ1qLdd8E3zcgby0AYUe/
         fn8ztKX0EGkcfyvLFelkFBjujd6TBTpwxEr0MRrjc1B7XM84DeWNHpCDNeQBnNkoae2k
         kapvOcairxLmU7lWZHDEgZXKQIcQ88PcmzFmyb2q26MlYhIxWH3cGEbXLDO+m9WFYonC
         tVotIRDCQCI143UIHrZ+i4hqkIySzXsaC4524yKYAjamu1z/Gg1DwnJFaGgAVaIT8m+v
         Cd6A==
X-Gm-Message-State: AFqh2kpX07tptq9/y4OD2DglPs6Eau2ohirMvRJ9JL7A8ZPDxMyjvlul
        OoZ8qjRisqT5LhT3b7gJc4R0EDVA71qTUpq5kzsyWQ==
X-Google-Smtp-Source: AMrXdXuLgqxGLLAgDbAiFglEdET6adHL4S0ijAmEHgy4fMq9WszDjnSdjSz46NopHVfnKHaxpoRzzrFAGGle4n2J74c=
X-Received: by 2002:a25:9d88:0:b0:7c0:acd2:6300 with SMTP id
 v8-20020a259d88000000b007c0acd26300mr3768499ybp.520.1674826503269; Fri, 27
 Jan 2023 05:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20230127101149.3475929-1-arnd@kernel.org> <20230127101149.3475929-3-arnd@kernel.org>
In-Reply-To: <20230127101149.3475929-3-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:34:52 +0100
Message-ID: <CACRpkda2WQsGyBaZp2mdjphBppyyF1pwQvqDkBZ1F_q5icwdBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] gpiolib: coldfire: remove custom asm/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 27, 2023 at 11:12 AM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that coldfire is the only user of a custom asm/gpio.h, it seems
> better to remove this as well, and have the same interface everywhere.
>
> For the gpio_get_value()/gpio_set_value()/gpio_to_irq(), gpio_cansleep()
> functions, the custom version is only a micro-optimization to inline the
> function for constant GPIO numbers. However, in the coldfire defconfigs,
> I was unable to find a single instance where this micro-optimization
> was even used, and according to Geert the only user appears to be the
> QSPI chip that is disabled everywhere.
>
> The custom gpio_request_one() function is even less useful, as it is
> guarded by an #ifdef that is never true.
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
