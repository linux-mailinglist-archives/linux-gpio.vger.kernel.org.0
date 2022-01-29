Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292684A2B3B
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jan 2022 03:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345351AbiA2CKo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jan 2022 21:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbiA2CKo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jan 2022 21:10:44 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A872C06173B
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jan 2022 18:10:44 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id c6so23798130ybk.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jan 2022 18:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R5f2OnK3Rd5Vn0tCTo//kYep8PKjilqOgT9B0rx9Skk=;
        b=RcZP0mo9kQLiE+1boTRVPlI+uR15AOqJ0zvNtNm1+WteMErlFvqLS3Dc/UdHLboU9M
         1LEtspXyTBNQX8egXxjAs9FIFrl7CtqYAQ0YPkvlIPof0VvSAClFXiu/hxjeAKzaceAd
         9CT/4Qhex/xThPEnrTtYKHW5qeAWpyBTjA+ndei9I6TMF2+kpL3JF1aUAnVOMOklA4jz
         Afud+ZzhRUYYrcxjgAgWyZHSiF3zRWEiErCBtEtYsJVVXpjRssnM9Xh1gDN2dRPh4IdX
         w8cfTRrR3dMatGer75DzInLCj/QQe0uzTrMyciaj5OJCZRYskOjYZFn3dA9Iax1FmfIY
         LGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R5f2OnK3Rd5Vn0tCTo//kYep8PKjilqOgT9B0rx9Skk=;
        b=JjjFntoIPLssAHevnm1SveC7wMbj9F5eh2xr1mknRGzasEJ1v3ebUT7sD4781ejJgw
         kUt6LG/aVDmImJUvX1SD0y5NWursIigfRsLLQVMDhOC7Fo2iCnoY7A39HjZpgCvBkNH6
         Q2XZ+nKwL2TMGN0pIRB8bDvANcCJEJJnzVse+Dbi8jWBQDvqpobynJlNqFuf+rL3kGkJ
         kwA3xhKGJ/+pU8YUWDj6aJZNW2sJxK/8gQ4g7b298a4K1vACfPZgY3b3iN+jDAxqiFdm
         zg4IRB6zGtKQw3XS0DLCEkZLul3r0FhugoDqJBzNp1eBfHEse8Jjtc0qCvCtI3AF14ut
         FpDQ==
X-Gm-Message-State: AOAM531/0ZdghILN/ZuopNgVxEQPpiJerdHQZOcdtn7f4GL2V/9WCGg9
        +xnd62juPqh5fqAYxBtkPW55VJnEWhew3Y2IxMPx6g==
X-Google-Smtp-Source: ABdhPJzBvJVAHTh7/0zc1+OGqU8AtCF5OhT9dVlcGmxGiDjOvbNcgZ2YHnWBsIQrGWW7fEK0LFQTUbImkyOVoGoH1Hg=
X-Received: by 2002:a25:2451:: with SMTP id k78mr15798461ybk.511.1643422243579;
 Fri, 28 Jan 2022 18:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20220127123028.3992288-1-clabbe@baylibre.com>
In-Reply-To: <20220127123028.3992288-1-clabbe@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 29 Jan 2022 03:10:32 +0100
Message-ID: <CACRpkdZjKBboJsDWN1_UDyZXh9bT_+mmZ0swX0XDNARPSPJ3ag@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: convert faraday,ftgpio01 to yaml
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     brgl@bgdev.pl, conleylee@foxmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 27, 2022 at 1:30 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> Converts gpio/faraday,ftgpio010.txt to yaml.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
(...)
> This commit will cause arch/arm/boot/dts/moxart-uc7112lx.dts to fail DT validation,
> but the GPIO driver need an interrupt so the current moxart DT is incomplete and the error is appropriate.

The Linux GPIO driver may need it but that does not mean it is necessary
for all other operating systems. (Could be a Linux bug.)

But I think it should be there because the hardware does support it
and I'm pretty sure that IRQ is available on the Moxart as well,
so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
