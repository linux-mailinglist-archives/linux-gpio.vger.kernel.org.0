Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFCF659A34
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Dec 2022 16:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiL3Pvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Dec 2022 10:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiL3Pvo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2022 10:51:44 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF6AC764
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 07:51:44 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id i127so19712115oif.8
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 07:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F656lMOposhMckkjCGjS5NjDE/VCVOvwvNVXUf+PeSw=;
        b=q9KhtncsHTQ9Ify6p0bGyTOm2n64gX0fIkSM54PoOaYAVYiU41+fYETKwn4vLgdfwC
         J4O9RXBDf6c3GiI1i9h0spItlYOh27mEv5S/DNZ+LgqIHKIUkEH/vSAJ3xS+CmSsayvw
         RxiJwj2cVg37rOYT0V55dMWnN5t5ttPqZ+pfvwss2ef/N9AOx99AZ6c9Tee3gtK9pKyv
         VUDviHy7ddITLAOWwEjABNcMzv//CFbTdAy50K2UCHGrcwYZ/B/jhxUaSu3Fyit03Sky
         pJ4z8wve+t/f60ws5M3PDyZiZNBYagSdTFnoQfUZCmwjhSo4Wbm8IsTtfMe/JPaFCQLC
         ITZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F656lMOposhMckkjCGjS5NjDE/VCVOvwvNVXUf+PeSw=;
        b=UPrj7CbmkcApa/m79AD7xRvBMJh3Ce99PP7SvGVji3cwHwrtx4b3Wj+EpJLUDI4a15
         ImKYMVJl1ngyD+P2831buRaM9GyLdcIHOZkaU22y9ybIOA0gmh4Gsg4Gnx15+o8HE/u+
         F5VHAkJ2GAaIRwV669Z4z5ValBt7yHJ/uzwW+TZj5dKeRKbelrIxdxIlQ0XHgc+KMiwK
         +ufpfvE5v9EpNL61W358WZkgv4usJty5N60H27dnT6fpIHug8E+RvuVdCvm+xQP8RBcY
         MpduptJJWMRXZdrDXadu61wyxmkOdf9FQfUPdTVmva2nyFabhVskHiSijn+dYiTLq9la
         dbkg==
X-Gm-Message-State: AFqh2kpqnaVKdSaOjPLGy4Sg0WagDG8QqAZjyhso+LKElh0IOQkqbzwo
        wWFBvAofdUCjQGz9GeRMSzYqv9Bafa2CNioOGpHxMw==
X-Google-Smtp-Source: AMrXdXuTY0+jFO1zHE2LSUiACUdxijn3DzB10hNf9rWgHZj3JVyKEaiK0B9P4P3EbIovcXxqRBz6EtbYJ67WUdY6TI8=
X-Received: by 2002:aca:3dd7:0:b0:35b:8358:aed4 with SMTP id
 k206-20020aca3dd7000000b0035b8358aed4mr1698246oia.291.1672415503475; Fri, 30
 Dec 2022 07:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20221230100044.23000-1-brgl@bgdev.pl>
In-Reply-To: <20221230100044.23000-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Dec 2022 16:51:31 +0100
Message-ID: <CACRpkdY72tihcurkf98pupYWiHOj0nCbX4uAp93KdG4xoscZ1Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca9570: rename platform_data to chip_data
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 30, 2022 at 11:00 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> By convention platform_data refers to structures passed to drivers by
> code that registers devices. When talking about model-specific data
> structures associated with OF compatibles, we usually call them chip_data.
>
> In order to avoid confusion rename all mentions of platform_data to
> chip_data.
>
> Fixes: fbb19fe17eae ("gpio: pca9570: add slg7xl45106 support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yes this is more to the point.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
