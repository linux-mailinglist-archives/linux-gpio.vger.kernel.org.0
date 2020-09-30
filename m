Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE2E27E55F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbgI3Jke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3Jke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:40:34 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18419C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:40:34 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e22so1089540edq.6
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pxwl6vJ7NlP3+dTWpMovM7e1DudeEOjt0JB5STP1e8w=;
        b=ZitIgb1o3RtIlUrhpJ50PCc/UK8UVLIRyv79th9TeWsA8csJknxt1K/sb9Ht6tYoTx
         BLtAWOb+pSfZDkg+9pRWdog0HwUnFm+uL/WMhoxcOffuEKjIbluG4WHAJ3qXvKiKzYIh
         3TJvXpz0sSfCNGC0TkdOtY5jd0duQ+r0RlVqXXG6P8EqcaezSN3KIIM9c8YfDK1MBaht
         do4yJAVcsApOJYZ5TBHdmoJJ3BXniQcBifxCWLVrb53mwJVQ5t67v0T6xkjsLw6FiBix
         xwHg9y1q51Hc41LthumOPD2TbOVFjIvYk+kgItPFb4RwJzD49bMDP83q1xfWheTB49EK
         aCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pxwl6vJ7NlP3+dTWpMovM7e1DudeEOjt0JB5STP1e8w=;
        b=FP6TR2O0IJgpSN/ny3j73myItHnGgN/X/qQxqhsHBiarnloZKoztl8ZxY3vv9yiXOr
         e9EBQyT9awRsa5e8jpb1MHT2vtM4lae4AhvZlrdGnmHakCn72AkQ93CTL5avJ0LCl/dH
         NXx9m/LL5DUz3RkhkFqf1d9wTcMM1HeIuBhg4EmJEgWOHW0gwxSTQgce3aUIVoOLG1pa
         ewf3v1njebcoYdBjkwtjGnfdNsQzX4G32CKljQIUDiU23pOkRClxdoOSOs+k7Qfq8nO6
         8h7s5hYc5QI91f7tL3lj5S3WSNJ8jQNnOzh5IiFVcx9wm1S7ybtvVlLvv+SDVZcnXvMK
         9zsg==
X-Gm-Message-State: AOAM533pluN+QpAK5RoWPQKsMCHyVCbVlgdpNBgDo3Dm5350NWjlpB8j
        YZqBz1PPkTLpGzYvU2+YMK7kveNnoDTrxN+9ERVz8g==
X-Google-Smtp-Source: ABdhPJzwbGBzKP6VvMUQcxMG01XenJjUKeVs2qSsw3fsj4YoYAy9TZVtvNOrKyJwfTgT8Op4iITpLqXD7NLusQrUxfc=
X-Received: by 2002:a50:e442:: with SMTP id e2mr1802575edm.186.1601458832682;
 Wed, 30 Sep 2020 02:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200930092053.2114-1-mike.looijmans@topic.nl>
In-Reply-To: <20200930092053.2114-1-mike.looijmans@topic.nl>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 30 Sep 2020 11:40:22 +0200
Message-ID: <CAMpxmJVdRfJJ_Wvf-fVdpvbnEWvpOtiYhRwkoASZnvFAjTDmGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Add support for the
 NXP PCAL9554B/C
To:     Mike Looijmans <mike.looijmans@topic.nl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 11:21 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
> The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
> with 8 GPIOs, latched interrupts and some advanced configuration
> options. The "C" version only differs in I2C address.
>
> This adds the entry to the devicetree bindings.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v2: Split devicetree and code into separate patches
>
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index 3126c3817e2a..99dc1936f633 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -20,6 +20,7 @@ Required properties:
>         nxp,pcal6416
>         nxp,pcal6524
>         nxp,pcal9535
> +       nxp,pcal9554b
>         nxp,pcal9555a
>         maxim,max7310
>         maxim,max7312
> --
> 2.17.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
