Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4178C32AD15
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380265AbhCBVWq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448893AbhCBPnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:43:15 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3760FC061221
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 06:46:17 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b1so20883709lfb.7
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 06:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=amBRx7OsHLG8syzyhriE5lIAg0ZcKXI0PCXzAll+h1g=;
        b=okuph8tEua/vZwDWPYC/uAy6+lUKHcDrD7wDmdNTYki2O0N9YYTsjHFwEWansPyVVk
         u4MrVkSqYu7nUvEFBc505YRebXnsIlOAy/nbQRQtXnnlt206p/R6WQtAWgtxIjvxzTA4
         iJfhvoR4j2aUfQpH52Vql8KAXOuNXMYBCOJVZ2VFmzm+XrKNGpjh5jGOjGY4+ZzqAn1L
         udCmOku/J1xw+GgD9hsw8AnK31U3wGI+Tf7lQ1+3TTdOxr3NzHa2ACuhyuhEuIaWmZed
         ZhEJK/hQ062nIceopzoidmoOWZPJTMBQCAotC4oCUK2IZ8iegcp21ggzXO6qwgkAMGKK
         V1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=amBRx7OsHLG8syzyhriE5lIAg0ZcKXI0PCXzAll+h1g=;
        b=rKb05A5vJZF7Rky0vf095RV6QzJMI84f8hYnSjckDmb5S5xCmCoHkg2nGw5BTH0LNQ
         TPzv0smmBtF4Hu0/jS8rN5TPIQKydWrBjHH98O5mR3P2oNypgGws5XZD5vbjTi3K2KK2
         0hQfEBNwwJ/wolb6aHzfAhxZHt3kp9Yzi3S7M23sQ66k88/6pqFJs3wH8D1YOeW3IeUj
         KH4KAGTbnghiVNQ/JjmpTOHw0MwPBfVrpPVVq1/AaJZ8zTwk6NVBgrF2RJPKMP9e3DoC
         EsxPQCGG5+yphPbQtHUF08Pv/2khJhvLVO7BFZyuyumPaBOj7qYNymuiDiMgoKf0iXRx
         fBDg==
X-Gm-Message-State: AOAM531z7jE83sEYCamN3u+Pasw1qJzop4B0TvY57A+T1fCJzG47jE3+
        4AQvbamL5YGbwzJdn3HXjWasg7q5YaV0icCgayespQt5iDbPZQ==
X-Google-Smtp-Source: ABdhPJwuRhVtn1XcskxjNr8/9I//fnLOXGY9UhY/X+BWNFWrCvkaK1bDMA6eSC3BaXsBL7YRKRHNw25G+cGXJe1GJUY=
X-Received: by 2002:ac2:5d21:: with SMTP id i1mr11989893lfb.649.1614696375764;
 Tue, 02 Mar 2021 06:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20210225083306.25792-1-julianbraha@gmail.com>
In-Reply-To: <20210225083306.25792-1-julianbraha@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 15:46:04 +0100
Message-ID: <CACRpkda2Jbm3DmOhxFyyxDZRrUk01TtPbD+OOG=U7o2mnxEB8A@mail.gmail.com>
Subject: Re: [PATCH v1] drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB
To:     Julian Braha <julianbraha@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2021 at 9:33 AM Julian Braha <julianbraha@gmail.com> wrote:

> When PINCTRL_MSM is enabled, and GPIOLIB is disabled,
> Kbuild gives the following warning:
>
> WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
>   Depends on [n]: GPIOLIB [=n]
>   Selected by [y]:
>   - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])
>
> This is because PINCTRL_MSM selects GPIOLIB_IRQCHIP,
> without selecting or depending on GPIOLIB, despite
> GPIOLIB_IRQCHIP depending on GPIOLIB. Having PINCTRL_MSM
> select GPIOLIB will cause a recursive dependency error.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Does it work to just:

select GPIOLIB

instead?

The driver needs the library so...

Yours,
Linus Walleij
