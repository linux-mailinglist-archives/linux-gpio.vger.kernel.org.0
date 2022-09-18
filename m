Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1CD05BBE4F
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Sep 2022 16:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiIRORt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Sep 2022 10:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiIRORs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2022 10:17:48 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED5D240B8
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 07:17:47 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id y17so53999564ejo.6
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=GCngLOpiriPVcDjGNSe4Z3flJgLrJqyubPZYXv5Syrg=;
        b=yPzT20AON/wt2KXO+zhxHoHmVAhH0+1ul+dYnbINBzLjThpT71wsw/kNxcGUTFUxWg
         kpyd0VArvhq+WLibwNt0H8kv/6O3h9Oesc0flE3ZzHcW9mEHKWMr3bIGeQEnpCdxoCqZ
         5Bh3Ye+2lhRjBG6WQfF6KHRkFdM8fMYULEf9TzstCVcvxj5QkjdA0Eg0JBWQBH+JG3tk
         yYGcwqSyePau9t8Idvq0YsKMJ2Y3gFNj2Xz5/kmw+qn3FVsRkpFcGkGI0bcL0ogvStk2
         SMnXKtSTrWrOAc4qMN43Li6K59VEPxJcbYiXFkunNL0+moL072ujSbr1xxdLnG8dvyNf
         nmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GCngLOpiriPVcDjGNSe4Z3flJgLrJqyubPZYXv5Syrg=;
        b=6hx4lh41TBD9HEkv5+I0+0X6e1ZAptHDnvItyWIaqsK3yC6gIK4BjDsy9gZ1y75S79
         o0Mw4PY+S75oOpJoIYrk5GQlXjvQklVTdp3nO1aWVom/vuHLv3qgR4olJrudGtrzleaq
         OaVHJBTnhu9XNhNEEaqbgwZAeXqYXuKcr4adUb11iNalmSFv8ZVV9KdHkSc4PbKmdJU+
         mpESjG8PlcXQL4YHTV+H9YYCcEtQcaFcS2uYoQUr9YEgKgBYfXLtg2WynWhfYP6IZytD
         sQpmPGg+vFo6aTHPRMeYyb3x8KwdXdWystpoF6z9Em4Raxyumb/R5T4CQaubuCtOIIdF
         6EoQ==
X-Gm-Message-State: ACrzQf1D4Ev6aydl/5tYPulbwX6/Ul0HCdj3lX566RzdqamZ6NEnHpQU
        cLtpHfFgCUywh4QUgMpWDucSNEILJGGaGy9o1Q5rQInmi20=
X-Google-Smtp-Source: AMsMyM7VXibftbkQTCJySSHieHJubeML6O7U3VmO5IsWMaT/XmcXQOzFvodhnKbc4CbY8HSwPo4GPxXq1zlyxdsGrW4=
X-Received: by 2002:a17:907:e9e:b0:77f:9688:2714 with SMTP id
 ho30-20020a1709070e9e00b0077f96882714mr10019173ejc.208.1663510665640; Sun, 18
 Sep 2022 07:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220917213729.341321-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220917213729.341321-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 18 Sep 2022 16:17:34 +0200
Message-ID: <CACRpkdZv4sKrePMdd+ROMAXmnykAsxgo2McxFcdqCbBUmq_zgw@mail.gmail.com>
Subject: Re: [PATCH] gpio: twl4030: Reorder functions which allows to drop a
 forward declaraion
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 17, 2022 at 11:38 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> There is no cyclic dependency between gpio_twl4030_probe() and
> gpio_twl4030_remove(), so by moving the latter before the former the
> forward declaration can be dropped.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
