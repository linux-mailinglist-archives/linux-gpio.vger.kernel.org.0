Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DB54649BC
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 09:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241799AbhLAIfP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 03:35:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhLAIfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 03:35:15 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D15C061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 00:31:54 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id r11so98455033edd.9
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 00:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d5HOck1fEk2VUiruxwewQWZzWWWlPc/W2sLGU1bYMrc=;
        b=tcvSR5VNdA3GOJ0wdRaUkZ12xaQZCRclO2Rmxaf/cusWemvGwLfvHTqq6FLFEr6fZk
         nPj7+B/CK4LARDHsHbYrxJyHX53LQUjKXtkeBcrRXx0bSjSSO1KXRyG+X/il5UXsuJFG
         z9g0hS1eNWXOOxUeWht/oXKSDTeF63Wd2nYK8cqmSyKIfUi7fb97ZUES0AGBxwzNjtCz
         3LP6Zdv8Bef3bNkzKgh8Ek/C4LuJgI2TYO/QJzL+wz5i8VMOfS1fNms+HCA1Q15O08DJ
         cwMYNsqMB04F/4hhIMjjKiwG3egZhTkblyQjzJFEigZfjCs/6pN/GXXk/UWnzNP8PB5J
         6JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d5HOck1fEk2VUiruxwewQWZzWWWlPc/W2sLGU1bYMrc=;
        b=L9EfElKCDcjB43efeMEcBQekooEzpEajh+0t+dW3LhVPXQCPnDYQrkH3itmh9aRKOZ
         7H2wYzV897mxd5K8kdDj+NhLkdeE+8KyWkbkCjQGeMD+FzxPm82/LeBhl7IESz1GITO4
         K0BRPVXUWuA+nYx91YqHVSQnx7ZXPGTg5qzlzov0c0OodUDDfwhg7ZTsROPDNAV3SW0V
         m9AsYD0fUkuhD7vSrwsS3zIGh9kYpMLFczgtEoCKCoGyD3daVlJlVJiRSRHPsK932utq
         g9Pwo8MB8lcdVwTli6BQqoq6gE6OoKcLSq2kWTgxKX3GpvWEvkGFpt50+5k+yQGm5lhZ
         n9fA==
X-Gm-Message-State: AOAM533jHsyk6oqWufL4Eaciq4jaJkvRpuS1bxfusU4NakMaT/zx45kZ
        9GkMtTmJ1okgSm88juYfeD6wwrReQ+hTIESx0IgU6Q==
X-Google-Smtp-Source: ABdhPJwc153YPxsCmrMpC83eX6OEq/+lb+TpgYJaHlvE++shwkC6Y1HTqxmqyp56ZKFJLq4p0tdfAhGegMst5hWjvDE=
X-Received: by 2002:a50:e611:: with SMTP id y17mr6611165edm.270.1638347513444;
 Wed, 01 Dec 2021 00:31:53 -0800 (PST)
MIME-Version: 1.0
References: <20211125152043.162655-1-geert@linux-m68k.org>
In-Reply-To: <20211125152043.162655-1-geert@linux-m68k.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Dec 2021 09:31:42 +0100
Message-ID: <CAMRc=McNjiOhth7YURTppWnL_rvd2Erh97PJt09cchCqbGrQsw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: sifive,gpio: Group interrupt tuples
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yash Shah <yash.shah@sifive.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 4:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> To improve human readability and enable automatic validation, the tuples
> in "interrupts" properties should be grouped using angle brackets.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index c2902aac25145205..e04349567eebb72c 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -77,7 +77,8 @@ examples:
>        gpio@10060000 {
>          compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
>          interrupt-parent = <&plic>;
> -        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
> +        interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
> +                     <17>, <18>, <19>, <20>, <21>, <22>;
>          reg = <0x10060000 0x1000>;
>          clocks = <&tlclk PRCI_CLK_TLCLK>;
>          gpio-controller;
> --
> 2.25.1
>

Applied, thanks!

Bart
