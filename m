Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75EC6600856
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 10:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbiJQIHA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 04:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiJQIG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 04:06:59 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4345C58B50
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:06:58 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id f4so4071681uav.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n7z2zqfikD651OG+4PqNGLgjVdCisNAlofdRvbyLWcg=;
        b=NdMPhGP7re2rsdLDqwAO5pjkZ0WmwEnl/DutqM++yjkYM88jbyO8FHEhHaZQp50N0r
         WVzoYtJNARRDgvkzHe7QH6BvS661UZA+eCMnFPCTZeAjmjXS/AQa5sZ43SKPR/2SKXKT
         tVA8CHHDUqavWd1yFVCtOIWJGE4WdG1i8J/L3ZGFcbYI0TT96h5G7KDCkSPbaBUCwoUf
         h3kETGy921lChCp0TPBw9sWiPlalFvv60qauMv0Pa2oDzZcBwwxSQBJ4wSU19SXUAgOg
         rWXF1t50JurYxXikU5zaZl20VQIFIE9bgyN69IaakYLI4yMrRmj9ZHsJ3RoQM8vamluo
         TAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7z2zqfikD651OG+4PqNGLgjVdCisNAlofdRvbyLWcg=;
        b=N4aq8vjGbc2O6jR6ba+Vn3WY4E9OHxz3Ej2tGMopSdz9E51aFzd99pII5qi5KxqyLs
         hOancbE7ekk6/Fa+yaG3YwjkyIK45joWqBEE4H7kTkKdE0iceTpkRoV3s+vKMrAXYJDv
         yoI6eJ3nr7S065/ZwbdlR0aQH7h1MlGfjkzOyb894uhZz9u0wC+cA/3f9N6yChjaONrf
         CNkJxZF+e91p3MRyYEbUxVWbkWCxqXKifZs4TIJVl7Pg7XQDThNjZ/2qJSxPJ5FbcduO
         LYLJ8phV7w6WDsqnsqaH6ixLlWhk5TSoTb6wdsChGMMGT/XTiaOD/qP8UbY4fMmPjQCX
         jyDg==
X-Gm-Message-State: ACrzQf180s8bmr/ICF8fpy5Q8oAbvVUSRlJBHUNc/cH0WqxFl0/X5+9J
        dpWS8hByqIJ2gvYPo2bdS56AVJ8Zw6x3pAg43HYV/g==
X-Google-Smtp-Source: AMsMyM5zKGzq/HLcG+oVMJ1IuRtu+Ts3/HzgbGWj/9vgLKcOz67M0wCJQ+LbJp5ikNVBUPZUSTKaAsCMTG02LhSp4C8=
X-Received: by 2002:ab0:2155:0:b0:3e2:bdc:cfa5 with SMTP id
 t21-20020ab02155000000b003e20bdccfa5mr3781207ual.119.1665994017309; Mon, 17
 Oct 2022 01:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221015172602.84855-1-clamor95@gmail.com> <20221015172602.84855-2-clamor95@gmail.com>
In-Reply-To: <20221015172602.84855-2-clamor95@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Oct 2022 10:06:46 +0200
Message-ID: <CAMRc=MfR50MnQo9LpBJQXojEzVn8oAzjLXHC=om=-HwkN+NOuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: tegra: Convert to immutable irq chip
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 15, 2022 at 7:26 PM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> Update the driver to use an immutable IRQ chip to fix this warning:
>
>     "not an immutable chip, please consider fixing it!"
>
> Preserve per-chip labels by adding an ->irq_print_chip() callback.
>
> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # TF201 T30
> Tested-by: Robert Eckelmann <longnoserob@gmail.com> # TF101 T20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied, thanks!

Bart
