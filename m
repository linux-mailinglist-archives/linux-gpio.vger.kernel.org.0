Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2256577EAE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 11:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbiGRJbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 05:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiGRJa7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:30:59 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8FF1AD80
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:30:58 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id k85so17103943ybk.7
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ETadlc5WR+cdSdhQBtCnvBiXQmamfAs+bjcU0XUO/o=;
        b=jiCfD2hPDd8J66Uw12NCPlDA7KTp4MUPDb+JClZW+X8MipwypLVZCwjdLSsPQOiApE
         9z1SeTN3tSolyhdQoQQUH9y8B6SQzye28hGzJLH1y/6YzPt+ilTwfepDbVL4LaLcjhHQ
         UVLrpUQ6/EI6d9VwVdRXcIE9aUcE/30npvy+ElaD9kUQAwXq0mu/9mOjbbOfvdijJjOM
         F4eTj/twEhXkBOvLFd0AuF2XmnpHzGozFNkOm3NBTbtbuzh+wM+c/6Qd8WkINE5/ynw4
         at/AB0hR6mzZ3Vtkopch0lGdgrQg96UlxQAijyNI7hGki/WZZHIgt4lrfWF2fUIxWGji
         T0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ETadlc5WR+cdSdhQBtCnvBiXQmamfAs+bjcU0XUO/o=;
        b=3zXFwSGQgqgztNPshqcGzuBm0KElEI2ZFwDCaEllArfb7OMttMZ7vLUzYCBkiqyZP8
         sNZHkHqJGizMN4eCjQMsBUrbyk0TlNh1U5EvDB2l5TikCbyeX00fuj7/z/I0aE8rI9UZ
         6MTPZemprTvvSlw7a+vnMiSO0kAwRVYZR+YJ0qhVmnDcMQMK4WWjYRZeiIFrrVS/s4Pd
         YDpL9XCHSXqo2u61oU9nugA6WBufeDs+SXESWjG8qNSxARWhJk6npcXOl3OdguuFqoNz
         06q1bDMTYi54tXn8bot4GpyQ/wGaNO6XNHVz7yuCzOGZYUbKZyy6Xt2nuLw9oCiS2Fm8
         A8lQ==
X-Gm-Message-State: AJIora+jJjEo/dc7c5XpyinL+h1tHgWqtTE78CuFRvE45us+NVmszDYQ
        TCyKbR1SOmGoVyWT73sWVyGjzpBExy3xgCcgB29s32WVshPTZA==
X-Google-Smtp-Source: AGRyM1sMWLRJa+yo8mHDDgZmptOyLmcyUxAkIOwiufduKP0LpPc8V4lzgfUAenozsDTfztw2AvD2kYvYakVWfrjnXNI=
X-Received: by 2002:a25:8c91:0:b0:670:5c00:7c6a with SMTP id
 m17-20020a258c91000000b006705c007c6amr1203030ybl.66.1658136657814; Mon, 18
 Jul 2022 02:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220714020319.72952-1-warthog618@gmail.com> <20220714020319.72952-4-warthog618@gmail.com>
In-Reply-To: <20220714020319.72952-4-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:30:46 +0200
Message-ID: <CACRpkdZWZMJod2B1B8bNGrF3FSu7-zgjda0-ma5kvxmj9huYHQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] gpiolib: cdev: replace if-else chains with switches
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, dipenp@nvidia.com, andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 14, 2022 at 4:04 AM Kent Gibson <warthog618@gmail.com> wrote:

> Improve readability by replacing if-else chains with switch
> statements.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Yep that is more readable with the switch syntactic sugar on top:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
