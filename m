Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42518671F9B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jan 2023 15:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjAROab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 09:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjAROaG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 09:30:06 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62254521F
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 06:17:56 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id n190so31961560vsc.11
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 06:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uFMItONQcV3wHNWf9eRWkDAG7Jn0b//4scmon3jUY88=;
        b=aKWai454ujSTSFS0fZtyL9Ofw6bMu1l+gf9ScaqZz7alqskx7+l9YqvRppX31BIKOs
         8x+8A6Vq7QYehwdCVYiPpHHBSjkUXA92nMh4MwbeRt8ZBMJokFtT/18lML3oBUGyO2yC
         NT5mHKKDzcDnM+YBgoPQ9wOVhY3BAFUZpKXG4iLMvRI/x20KKLYtxQ4ccTq4cRTpBgdr
         5GR+vZkwm0ZbEA35bpQocPmUqhkQ9gshidpRSxRmofNezfZCBDaLKdPRlRtQ4nyelCl8
         H5irIe4/UuxG6HGGpcAPcOqAAaFvg4K1E3ZfphtjvOIkt/z+kH0HykGxEDdHzgzITE7U
         R1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFMItONQcV3wHNWf9eRWkDAG7Jn0b//4scmon3jUY88=;
        b=pAzyVyAT0mFIr94MjwZebEYYnz07J1ivr++wUKCvoN4sVdHMpGwpEnp2nuBRdWcw0c
         p7qOEShxje8Cg6e3+ON7YRvOhNwCl7j/7v+WQwkDnm6229H80TLGuQgvW8D0tbMcChBR
         WPn4/dOQDNJ1Rubtj/Q487a5QtrCi5k2GUt2lL81FtadcbqRNu1rGhSGDsOyiUPAAq+J
         cuyJ2rINTXWJMeY1jxum/B06L11jxaqJVu9GAK063Kb/gxF2riCjWy+Rzx63Yb/9eDvM
         As8pq1DgR1+9XlkWVR9M3uKKnahvioAwmRAWcgQNdFmemaQk8h9wEwtUIFx2ut9lGky5
         U72w==
X-Gm-Message-State: AFqh2kqm1bhzkoFhn1NzKHT1oVHGfxGdZm5QL60PR2QAKjkZjVBGsV2i
        BEt70WsXBS/jFZVpYRLDHGi58PC9ZlcqJXxObVvHrUlD/s8Sbw==
X-Google-Smtp-Source: AMrXdXuHS6Odt7c746q/SzVyx1SvpsAZROmsMt5CMpsunNF6P9iqbTAjqIzBH7aSzbl2fZn8kgrakXkULaLTFEp7qSE=
X-Received: by 2002:a05:6102:3e08:b0:3c5:1ac1:bf38 with SMTP id
 j8-20020a0561023e0800b003c51ac1bf38mr1064643vsv.78.1674051475264; Wed, 18 Jan
 2023 06:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20230116124704.30470-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230116124704.30470-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 18 Jan 2023 15:17:44 +0100
Message-ID: <CAMRc=MfR0TJ4RmuoL5-6w=vBgH9=vXGm2_a=RqxiC9Rav+0ygA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: pcf857x: Get rid of legacy platform data
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 1:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Platform data is a legacy interface to supply device properties
> to the driver. In this case we don't have in-kernel users for it.
> Moreover it uses plain GPIO numbers which is no-no for a new code.
>
> Just remove it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied the entire series, thanks!

Bart
