Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDA53CCEFB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 10:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbhGSIEK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 04:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234923AbhGSICr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 04:02:47 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F99BC061574;
        Mon, 19 Jul 2021 00:59:10 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id h9so19839550oih.4;
        Mon, 19 Jul 2021 00:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8Z/utU+FAS18v7l2xBnJ7RyZaoomYPbm1N5iy85pnE8=;
        b=Tw48Ki9ejuDLzAL4oCXFFi428yjP6mfnlNLRNNTTMii1QHcZUT4itYM/HhQTbd0NBZ
         2Sl0hYB49UwLzYKDa04/VqV6hqlBq96vc9nrFK1UJFTRKthRzlbJEKzqXk9GPJymMLmH
         Gy5WJ6v1mWjeGrnB13Ftli73H0bn+awnyXOdZuuwTGU9Xfw/gkdzzjoxoBfkM77HN147
         XiH4V8wY0qYm6EBpKD/ACWJApk0bAIkKUJMYjNAHAoyypK1gVUROFWBOi5n7ErXyM/Uw
         D0DEPSZSEMLOfD9m1wopxjKv7Cw8snsCzg3zGidf0/yx7NoEYeTOG3gXIbmqbUvWhmLy
         ByNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Z/utU+FAS18v7l2xBnJ7RyZaoomYPbm1N5iy85pnE8=;
        b=qZ+RYmJQ1jKBQM4XpW3A+XTAga/CbZ/Vr8Jz7plOQFHYvTJJLcuOVRHcm7YI2P92CN
         4lV4Y9ZnWBLXkgRm9N06kykOg7Q5NN8iyITqtzm6bMM6cHCAOZxBaxrCVOdLj63JwSal
         EGiweNRVKRqiaY/7bco5eKGLAjn6bEWQFZ61VnmiAY5GUf4oS+Ng1wU3HRKCCTraMOkV
         fYasHt56aVVLv6KKh9eN1qhNSP72TZGlNjDuv8yEn9t9mV3FivDd7nDdu90PriaEpNQq
         P43Bbe6SNoqVNTKHskrQ6jE/S/SXnngexACl4GrrFpD/39mBu6N64iUdK95yXZ3DT7VN
         IhFg==
X-Gm-Message-State: AOAM531Pp40XldFjCs6vrehlCOvk/54MJtdxFU0BOLtjzM+Kz7yXAHKL
        QhbIEBOAvOxncn2u+Qd48ek=
X-Google-Smtp-Source: ABdhPJy9UlFhztN5xCY2z8jksb+yX52P1cX3PgKapJS6/xHWX7eRKqptnV8qbGAvnTjkGcHK21Io2g==
X-Received: by 2002:a05:6808:1309:: with SMTP id y9mr20599893oiv.112.1626681550039;
        Mon, 19 Jul 2021 00:59:10 -0700 (PDT)
Received: from kessel ([12.23.111.199])
        by smtp.gmail.com with ESMTPSA id a19sm1568231oic.38.2021.07.19.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 00:59:09 -0700 (PDT)
Date:   Mon, 19 Jul 2021 00:59:06 -0700
From:   Gregory Fong <gregory.0xf0@gmail.com>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
Message-ID: <20210719075906.GB8818@kessel>
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
 <20210708070429.31871-4-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708070429.31871-4-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 08, 2021 at 09:04:29AM +0200, Sergio Paracuellos wrote:
> Gpiolib core code has been updated to support setting
> friendly names through properly 'gpio-line-names'.
> Instead of redefine behaviour here to skip the core
> to be executed, just properly assign the desired offset
> per bank to get in the core the expected behaviour.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

After the first patch is cleaned up,

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>

Best regards,
Gregory
