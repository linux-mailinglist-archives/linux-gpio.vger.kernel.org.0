Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D58622608
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 10:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiKIJAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 04:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbiKIJAC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 04:00:02 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C751DDFB
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 01:00:00 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id a67so26167483edf.12
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 01:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz+r9yqo9SHV/VNe1RJb+OqpuJmkL2QTLiZG/HMqVuo=;
        b=fgPFGw3I4+H4BjIYJeO6KSbdY2q9VQrkYFbqHjam53bHZTvmpbpXvR+42GyawpNieE
         2+DEO9edMRhiGD6wx3MjrNVNQfcehxnq75dQaiOXKtknBJycGDIdrQUDtI9O9fLm+WP5
         iPalMCT8ONGg5pvFVSXsNrwmXbHEUuFaCcl/H0G6tEoKn/UrG4vC20tvlnPFIiNUMf+g
         d35v6J5Kju+0t1pM6bQXAgKyJ0j5mIMSbO1HvtRc90/6fQ8FcnP99bvzMe48G5I8UBUE
         K1rQCbx9Nz3VQoAsvrLae1WKL/Z0+Q3NUzqIQP0CtQaLdYeHIGg49w5RJUfha+VpBXnL
         rEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iz+r9yqo9SHV/VNe1RJb+OqpuJmkL2QTLiZG/HMqVuo=;
        b=X0zht9pOy0OGxZNoQWkVWCEQ/vNmEe59wOEcMejo3NHR6B21ajN3bPvxLaE7zIU9CR
         k05GuZ9k/3vlERp6SrFKTyHPb29q6xfj3n5MVYZKtMIgv9D+JsQquU1B+vkFCvAGNPap
         hUo0JozY18Q939EwzsTSldN3CEFBOYrxcsb2yxA8o6dQInxG96Ow4UyxSBJUlrawUYGF
         oRgDn88/04OZarejYMvOq3tupaMlnTyu90h9MG+zLZvc3+kxAEsgJjwgYld6KE09PIrx
         q8VgCaRjRMeydPn2KDP3/HFBVSiFoqFE14zgUm50u/LWokFCrUk7ssO9WpbxtWmtF4X/
         uXEA==
X-Gm-Message-State: ACrzQf2uase3YIE0spS5pjrCO7C3jptpYwSs90lp6d35nNwVt2ANc6vv
        vl3iSqwDVpR1xSd72ZUpWF4r6XS7MyxZv7Vjko71pQ==
X-Google-Smtp-Source: AMsMyM5G7pSTQw6/ibxoxNJ3eAwaFwzhpNv7niA7XULqY84ZqtquUHbyz68wB1vWoJv6Zuv3jFWoewxekHU0hLQ+eWA=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr59365805edb.46.1667984398730; Wed, 09
 Nov 2022 00:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20221108133853.61884-1-andriy.shevchenko@linux.intel.com> <20221108133853.61884-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221108133853.61884-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 09:59:47 +0100
Message-ID: <CACRpkdYEB7e9ADKmrLN2fOG7oQCh2M6YUcEriQTiXufzFhWo2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: of: Integrate of_gpiochip_init_valid_mask()
 into gpiochip_init_valid_mask()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 8, 2022 at 2:38 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In preparation to complete fwnode switch, integrate
> of_gpiochip_init_valid_mask() into gpiochip_init_valid_mask().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
