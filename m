Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0CE49B033
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jan 2022 10:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1454777AbiAYJ2w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jan 2022 04:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1572980AbiAYJS3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jan 2022 04:18:29 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE11C061243
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jan 2022 01:13:17 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id m4so29116017ejb.9
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jan 2022 01:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m3vz4K1cVFxkkZgxl+94bcQ+gdSebDBC3L0OFBYI+gI=;
        b=wwKwalFIdRZU/Tdudj95kPncu6eVBEFqiUctk9Ry4HB2QDqDev6XJnraAHxSJ+36eV
         gfJZIya0esm65p0LebvssGsiLOIOt5Ag/ODMrBUNzqX4qoQ9qo/iGqihQO1vepOkE094
         Rbng7qvbgi0jP6d14HYexooHGRWNtER6rudYcpM7ISXkFAwpqgscUvy4zuo3b/d4AijY
         cv0orhFfqgUFocTkIZdPiYFCikaEwk1+bSHsU1eJLTvuuiudpvcLcfe4Wi9xwX26qooa
         8dYHnSm+/qnB6p4BvYlKrIAdf/4KYMFCIBk8IjQQpa5z9YJ1M+7GOuWYk94YRKO6CeJM
         Q1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m3vz4K1cVFxkkZgxl+94bcQ+gdSebDBC3L0OFBYI+gI=;
        b=at6v4BGhWMyP1wZZtmuk1+7VwGLEwjxamuiyhea+BAvyPjVqu99Yjc5wfhKBpTErmE
         TJoEhDW+yHLjRNpDfgR91RQF1FmDaqh6Pw6NUqR9UyV74kRxhNlC7+uPQNGmU/O4FI5w
         cWowT8kCQqXIxzYvcme79acuTSJLtkQ9E1SS6X0Dl9GMBvl/RVqgYBAVQwu85N1Sc7gk
         fgz93pEzuaxFGXA2d7MZr7EL70PJb+bmkBjEe8bwotZfir1MwFq26C8rB6IZkL149jiG
         NcnGHr+4XkgE+cf8BAoTWgQfJDjwlUMoDqRB6IxLV1Z+T0WzxiH6lgitVomd78BHEIGn
         UqbQ==
X-Gm-Message-State: AOAM531id+GxgL8dechlaqA7xmx6hOTM0R7FUjIiW8i80HZbbi+c1cdB
        rqvftBPpZ5RIugM6XVWPXVWtt4gryIDL8GdSriVHSA==
X-Google-Smtp-Source: ABdhPJyKED35BiARsyi5JjkQILds3vmoy8nNLHmR1XxangMF+3k3jjmDTcZF5xnFaqXGnDk9Tr7DzrwnSr3rG5yCxv0=
X-Received: by 2002:a17:906:274f:: with SMTP id a15mr15375119ejd.492.1643101996062;
 Tue, 25 Jan 2022 01:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20220114141507.395271-1-marcel@ziswiler.com> <20220114141507.395271-3-marcel@ziswiler.com>
In-Reply-To: <20220114141507.395271-3-marcel@ziswiler.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 25 Jan 2022 10:13:05 +0100
Message-ID: <CAMRc=MdHeGPNMcp23aY+YTH0rz-1WjPPqozWjZE8Onnwz0V5Yg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: gpio: fix gpio-hog example
To:     Marcel Ziswiler <marcel@ziswiler.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Rob Herring <robh@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 14, 2022 at 3:15 PM Marcel Ziswiler <marcel@ziswiler.com> wrote:
>
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> Even if this is no yaml yet at least fix the example to be compliant to
> later schema as e.g. found in gpio-pca95xx.yaml, fairchild,74hc595.yaml
> and gpio/fsl-imx-gpio.yaml.
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Acked-by: Rob Herring <robh@kernel.org>
>
> ---
>
> Changes in v2:
> - Added Rob's ack.
>
>  Documentation/devicetree/bindings/gpio/gpio.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index a8895d339bfe..5663e71b751f 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -213,7 +213,7 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
> -               line_b {
> +               line_b-hog {
>                         gpio-hog;
>                         gpios = <6 0>;
>                         output-low;
> --
> 2.33.1
>

Applied, thanks!

Bart
