Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E0F6A042D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Feb 2023 09:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbjBWIup (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Feb 2023 03:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233666AbjBWIuo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2023 03:50:44 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2D839294
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2023 00:50:42 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id d73so4804831iof.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2023 00:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0k9jKD05OxtjSZUk6bMGF2fV3WT2sf3ooVEf+qjO17M=;
        b=FPdmoPKFW+jfyOyJ8s+BGODY4LPwUyLyHRGMN7YMr6lsQ331Qvo0Z/7E9zUF7te44N
         DeNIr4fP9hh5g5yRhPG4s2yQ4egCHF+JBJgyz3n+6ZfKO7RPQ2aBY1GMM6voaftCXeex
         /6mDxxcc8cdsKONIP/98kGw9KRFce1B4UKPSjqjYdBOncJXXX011+Pc9jTFcgt0di1sd
         owBsXZXRUkzhdZOwyjViDC1Y63W7CsqIMHJVLIZOBbYobSI5MSN2f5nJZbIw1HO3v2vT
         xkGJ3yE/7uqX7waoWyLG712GECatO7QKsD0H6pEFqmoke5pXvzvAEmD/EMBhuLIX/d04
         tKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0k9jKD05OxtjSZUk6bMGF2fV3WT2sf3ooVEf+qjO17M=;
        b=ZnTvODjugReIM6xagXPUvpgM1j8PYoKSGAh9OAj81zv1QuzoTe6KNRTx6Aoo+gOpuI
         QToMGWtaZclH97pF7Oe6Q4EtyXP+C6GgdTEAupzM1pL7q2jt7MYjIxrdtSS0+nglBUhv
         E3n87a00nUUI+LXkWpkCdo2pJI+aMxsGRMbDrJ4UfjJr6DbEeJCVjsdWt9SuCKM60wNI
         XWwjAyDGFWdQeOQVtW6KrnLEerQ4XVeQjuqgrRuFy5EHzuXFvj3eAQwHV9ZTQzSiBLVn
         CXaUQC8AUdSkTWT7vHmnahtr9RjXu9mbvpYnMRblxOZe74fiMS2MroKn/qLvUHY4PyvS
         c3KQ==
X-Gm-Message-State: AO0yUKV81TEA6ueUhnrFbJxLAVW6SOvZ2IR4Fuq9qQrB1bnZSG8P9PjW
        yfXk7E5iCwfwUGpdMwEdCgUqpFrHka1mqyFC0/kMyg==
X-Google-Smtp-Source: AK7set9UQqFb0+ZFU39E0PUxaMjUVNwiCvB67agmIDIKaz/cTznuaEp6hRCnZL0i11oy9MKaeKbCQEO+EKtS54rJCwY=
X-Received: by 2002:a6b:7d47:0:b0:6e4:e844:22e5 with SMTP id
 d7-20020a6b7d47000000b006e4e84422e5mr1236213ioq.63.1677142242103; Thu, 23 Feb
 2023 00:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20201209072842.amvpwe37zvfmve3g@pengutronix.de>
 <20201211170432.6113-1-nicola.dilieto@gmail.com> <20201211170432.6113-2-nicola.dilieto@gmail.com>
 <20210117130434.663qpp6noujptdyt@pengutronix.de> <CACRpkdawMpuznr-XC2uvZm8PvOj-jObpnbz6iptV-Q4OFxjesw@mail.gmail.com>
 <CA+TH9VnrsSQDUfvXk8c+q6Sx2Jc5TCN5XLYCRLtgv55-6voLWg@mail.gmail.com>
 <Y/YPtJK8nVBthCML@surfacebook> <Y/YuJoxkz+o0Omie@einstein.dilieto.eu>
In-Reply-To: <Y/YuJoxkz+o0Omie@einstein.dilieto.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Feb 2023 09:50:30 +0100
Message-ID: <CACRpkda5Mt1fVL8fRPWX=qgbu0d90xYp8a+LtaR1NE9LssQtgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pwm: pwm-gpio: New driver
To:     Nicola Di Lieto <nicola.dilieto@gmail.com>
Cc:     andy.shevchenko@gmail.com,
        Angelo Compagnucci <angelo.compagnucci@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

On Wed, Feb 22, 2023 at 4:00 PM Nicola Di Lieto
<nicola.dilieto@gmail.com> wrote:
> On Wed, Feb 22, 2023 at 02:51:00PM +0200, andy.shevchenko@gmail.com wrote:
> >
> >Seems not much interest neither from community nor from author. Maybe later
> >people will look into this?
> >
>
> It's not lack of interest, but rather lack of time. I should be able to
> have a look at this sometime the week after next.

Thanks Nicola, I am also interested in seeing this driver upstream.

Yours,
Linus Walleij
