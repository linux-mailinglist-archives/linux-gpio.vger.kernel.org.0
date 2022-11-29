Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B734163C179
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 14:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234423AbiK2NyX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 08:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbiK2NyW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 08:54:22 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96F81902A
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 05:54:21 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id y18so5044583uae.8
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 05:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ACm/Az41qy+XibIm4SbENv9P8eamk45P3AFUesKhiU=;
        b=A1ZAtGz16RDzD/aNVmyi/MsfskIYrRgRZQYReHKIdHjOokzRJjhEOspqbIhvl8TIQ5
         V8FDgCBPdh4kUINwpYbOPIwXZ0npDbGhwV6+klT1ZaHXrlfp5veafQbKJJK0UfhiH752
         fV+MGy8Zp5jCG3V+uMt+oS/YCiV14uapr78wq/PClusRHTsB14mAFBZfrs0NbdxMoJ0h
         5hUHa/kiavVSTrRj7cCQ87TST611O1p+myRKJ7xeH2SR3fvlLnLn9GMLl+wM/p37WwBi
         IbJ0EGCLIeAvCu0bWJ7F9UqcP6ufHL0p9OuRiE0QIX7ueu5ZkSGKHGeW/kulPFit2AGE
         TJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ACm/Az41qy+XibIm4SbENv9P8eamk45P3AFUesKhiU=;
        b=fahnocKOJA4fzUwCgtT2oQn5yKJcIkZ8/JPEKHrsr3BC5LMSICf5y+2rFhxr+tXmTb
         ldQ5kb9LmrjzT5Zj1p5CWWMscbal7znvEN6z+ewwcS+MRqWjVcR8tyiyOrXkRn2uyg+g
         X0Cx2qYZ9dtIvWBaAjpXTksMSkv6ZxOOfEiSqUnukqpZCPpF0AtKAhjqVLrRsSwmOivk
         XneS9BbfCiaPAv13JM6F5wqPRE1nPKSZ5fmDUzlEcr3EOyZGAwZ38bkqNUzs2LuUm7An
         Fex/YVy9YM6iwpgXFg+TBI5yvij/GIp+9ajADeoguYQF3h1GUELKGrsTXAm3ECtWysqL
         Xakg==
X-Gm-Message-State: ANoB5plNWDkRFeVKoa9FdyeFfllq3rNva6T1D8h26sidLAd7QxyfJzul
        aZLU2fCcdohgu10/bvhIbVJ0sSie+wHucdejCRmVJppbpGc=
X-Google-Smtp-Source: AA0mqf7cG+Vyh2cxzHNR7Th0puM/2QveKjZKj4nRn7U4k3pGSlFnLeTGberZqqQECQn0YfdRPK1+oEwAB4iNJhucPUM=
X-Received: by 2002:a9f:3588:0:b0:418:7beb:6f42 with SMTP id
 t8-20020a9f3588000000b004187beb6f42mr25871368uad.92.1669730060926; Tue, 29
 Nov 2022 05:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20221125181158.67265-1-andriy.shevchenko@linux.intel.com> <20221125181158.67265-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221125181158.67265-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 29 Nov 2022 14:54:10 +0100
Message-ID: <CAMRc=Mf14Q7_gMXaK+hZ8PdV2U5GiL97QRc3SGKLPqmEuSyDxA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Introduce gpio_device_get() and gpio_device_put()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 25, 2022 at 7:11 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Introduce gpio_device_get() and gpio_device_put() helpers
> and convert existing users.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

This doesn't apply to my for-next branch, can you rebase and resend
(just this one, the other is applied).

Bartosz
