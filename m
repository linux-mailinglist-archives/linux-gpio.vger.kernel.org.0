Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9641641971
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 23:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiLCWUM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 17:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLCWUM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 17:20:12 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463F31ADBB
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 14:20:11 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id i131so10084361ybc.9
        for <linux-gpio@vger.kernel.org>; Sat, 03 Dec 2022 14:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m8/epBD07Gp1s/mObqLhbVKPtkwsKyQlG0FESMCGBh0=;
        b=tBEpU9QlIbCJmLEVOc0loy7YRe+0G8A8Be+6UVTMNpUE5e3xvc4vCX13kNqhNbl6kR
         o3Y377iiZKOF2mTPmVIEDp1N5YFA6Z7aeM2MhBuGZSaysIZbHEWMGn1ygUJ4Pr79imze
         kreceGvRlD243UH0cAAdHteEL1thrhuPduJ2s3kb93JEwUPkp6iEcxX5Oqn67fsau+Hf
         R0iBmtA/hJLdYH6jJyG8BRwbwZmWk8XtD7VpxpZJbB8OKkwEj2AqdIVwkh8TKyyOymht
         lnEZyaV6xYe0jFOBje5V6Ds5LFYuLvm8kRvkZ1SBSfYO+gX/ZRTvMCq6TTNINAbOlClW
         aI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8/epBD07Gp1s/mObqLhbVKPtkwsKyQlG0FESMCGBh0=;
        b=s0MPpsc6xwspfjAmHonajZYiplOk/lhqF5RSLoQ7TgwiybloGSVT8IWAMPHa6/O2EJ
         wmikIPfv0gTZPCMneJt8iPtRepZ/kES5qzt7CfKIunxeuHztWUReP2WQPWrcZdWJwv6P
         xuWXC9iAjakJVt/NsPNXD47Xt8wk680VJQDTztNSN3/DqHBIFRHqvaZJMcNuUVyv0Vlb
         lRTJ7yto3V7ThjcRhiEYWnQGGLlJGVrvXvq7sqh+QOqb5cFajfMlLTS72w1twJ4rBsaY
         5J/gBP9UvxSJl5gAREijPydkt7deUKyDI0hcKp7Qn3TWJ7aYJ/GEr6KSvBHkJmWUn5kP
         rHdw==
X-Gm-Message-State: ANoB5pk9TJ/5kwAKqc5+MOdo4iFs8YoEmyVji8DUac3gE96E0Evfb37v
        v7Yi6mQ2nyxXeXo2pXqByBwU1ZA1uTw7maj5LRO4Vg==
X-Google-Smtp-Source: AA0mqf4tyn6DuJmT8EOJsFpD2eTPmz/70GSZkI/mEl0g/W3QZIRgn8MK6WDUSAFyyY88Z2NuM+vLlRmQa+wKs3MDZaI=
X-Received: by 2002:a25:3dc3:0:b0:6f0:d54a:8f2d with SMTP id
 k186-20020a253dc3000000b006f0d54a8f2dmr45630323yba.66.1670106010490; Sat, 03
 Dec 2022 14:20:10 -0800 (PST)
MIME-Version: 1.0
References: <20221125181158.67265-1-andriy.shevchenko@linux.intel.com>
 <20221125181158.67265-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf14Q7_gMXaK+hZ8PdV2U5GiL97QRc3SGKLPqmEuSyDxA@mail.gmail.com> <Y4YbkUX+bTM5ZEGg@smile.fi.intel.com>
In-Reply-To: <Y4YbkUX+bTM5ZEGg@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 23:19:59 +0100
Message-ID: <CACRpkdYGP4GCHoo_wss4to9Mx-koakh_D9Z0NX+2m0X-o31dpw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Introduce gpio_device_get() and gpio_device_put()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 3:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In PDx86 subsystem we decided to cherry-pick the fixes into for-next.
> Some other subsystems are doing back-merges (but I remember that Linus
> T. complained about back merges, although I dunno if it's still
> the case). Some subsystems merges their fixes into for-next, dunno
> if it's the best practice either.

I usually (A) let it conflict (Torvalds will solve) if it is small and
Rothwell fixed it up in next (B) back-merge some -rcN if is is big
and annoying or as last resort (C) apply the patch to for-next
(git will cope, but not elegant).

Yours,
Linus Walleij
