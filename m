Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378BB4A43EA
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 12:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239528AbiAaLYv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jan 2022 06:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378703AbiAaLUh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jan 2022 06:20:37 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E980C0604FE
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 03:13:30 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id k17so39239536ybk.6
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 03:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U0Pw1BfqGZvVWUtyLjOHuhJwlMA1Use2yqcwgUkQnwE=;
        b=F/ECo8ebBP3ogDbxQiY4hhui7DC5U/UMWgo9Zxz2mCrE3YKYlRwsn8i6WMbi1ujwL+
         F6RWtT6HBlFzfySG6LZv1PSv0vwGis3HZwYSpSS9Hc29Ez3WcAtHPDp0M0EniYkeFuQP
         vMA+VOZ1Ign8qZkpcj+5tqUlZrYNyhl+lbsyQ3EgkkMF+kIkkfA4B52aHxnb2frXX0a7
         Hf5Jj2Ip5PmM4TVjHH23jDBAmknumfzIEPYA2ny7XV1pVboUBrBGG0Zl6M1/y8c1kbyM
         NyLWqgGFxGTvLnD6/N2khaA9Rqn+cJcUH8dVK5IIzrye3eEHB5fbTpdShnNmFP/AZ8Ef
         Xb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U0Pw1BfqGZvVWUtyLjOHuhJwlMA1Use2yqcwgUkQnwE=;
        b=yFDlxDXAp9Dr6iy+Qp0p+fYXpvnNKyFH6rwPWylQnOtwGNsrJX/nX7AcQarqCS85oK
         lMLGrNvdJgP7cfG/SnN+39WV8A7mpC+U/dQJNvJVxljA9hq4lVeJb4Rk6bDsk8XWcobW
         couahNllxdnhlQ4JxNKgRY9Cxtaj2qkAl9HfRo2M1Qe6NSP5A1w21/bTfdcNAJPWNWim
         yfVZB6BfUt6mPZFAYoI+TSEW0ov7rt9zDVP8C+PzlJRJhjbvySCARr2ccHUEWsxRBmah
         e+YT2zKsHk/W+WSF95kbSuCd27NDvj4fLfUzuVBvwXjnNLU99BN3D4uIHzZ/E7fbhP/D
         48JQ==
X-Gm-Message-State: AOAM533knSWNogxs+OEGZWeu90K70at8X839oK3mu1pGPn2BS6NhYe7/
        CJUYKmGdxx7kWxjV7G1Y3k1t5iDlH0BYINaFmP64aw==
X-Google-Smtp-Source: ABdhPJwnjcbKcmXqxkDyE6M/D5slJFtoF8e/5OEa0RJfRa4THHqn7fj5ZGK9wLiBaPNsXouP0qEB6ly0WbzNmpDFVXY=
X-Received: by 2002:a25:5143:: with SMTP id f64mr30614251ybb.520.1643627609604;
 Mon, 31 Jan 2022 03:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name> <20220130145116.88406-13-nbd@nbd.name>
In-Reply-To: <20220130145116.88406-13-nbd@nbd.name>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 31 Jan 2022 12:13:18 +0100
Message-ID: <CACRpkdY38VWT_95jz25NTNtsqzkkVsSONNLswQ35JApT0HUXXQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/13] gpio: Add support for Airoha EN7523 GPIO controller
To:     Felix Fietkau <nbd@nbd.name>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     soc@kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, john@phrozen.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 30, 2022 at 3:54 PM Felix Fietkau <nbd@nbd.name> wrote:

> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs. Each instance in DT is for a single bank.
>
> Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

This one and patch 11 with the bindings does not seem to have any
build dependencies on the rest of the patches at all.

What about Bartosz just apply these two to the GPIO tree so we
have less stuff to iterate?

Yours,
Linus Walleij
