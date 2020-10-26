Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23500298F71
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781638AbgJZOem (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:34:42 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43170 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781551AbgJZOdR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:33:17 -0400
Received: by mail-ed1-f66.google.com with SMTP id dn5so9569832edb.10
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NL7oE/FOu1FdsHVXtgRhlmVNZvxP63/3P1s2iUbijps=;
        b=dK5R82NlOAMd7fUkIrlIbQkTB2oerujWd4Mw9WtN4FTE/lPkGh171HrY27lBvKr6vu
         qjeipXZx6EA0OZLi04vOur2lkzUlmykDa5Peh3TMCwIaXnlrVZmmmSCHtC9EHGluDTSj
         tYj+lv8ffsMq6neJxq2dtDet7+yC0lJRaaJjDyyKthx41MdC8b86hIecqPKtSLemLD/t
         zIZTwFv6lxsX88YYwjCy3zHyUGPgC93hjOO0r4ks2iHDE5V05fhH0E36/UBhLyv1CHO/
         Ufsvsj1cxwWXG+EyElFbNdTmz2hNcg/YATpDxiXP/JVY6Wq3RnrFEwzqBJgBLlCqLGhy
         rnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NL7oE/FOu1FdsHVXtgRhlmVNZvxP63/3P1s2iUbijps=;
        b=ZjWDhbrz93vU0vPyaYfEnUxY+Ok8kgn0jR42Uhgf2IelI4ftVywP6Y5NiAH9RPVcdV
         6rflu+TqsDhJwn/hi92yBj/u41/woi73xsGpYUj78ZkNps9Nr6gAci80ICmqqGtj0zIX
         PTPi9sBXpUFwPimZawHjjHyk5W8qRsi8X7fZ45T3gm5zJ7snxVyjBPrFz+tBB5WYpDHE
         p2Xnlekkpd2xbdnGrQ9W5ypG9Tb/w8sjAMvckY+48JeMGCbf8z7bUB7Vl8q/SYsBU9+O
         68i9SWUonA1GWCrH4eGx21yqt7iAuwEJeK8jeNFCmmjhoi93JQcNGnb3l/2131s8zLUe
         eT/Q==
X-Gm-Message-State: AOAM533NlvzqM7KrHNSYnW01sPYY8TTcAbjtGvBUz2XddHHPxYJQvBFz
        HVKyGpXfVPlLx+f69mmg3tiiiEydmpbq6BmVwGS0kQ==
X-Google-Smtp-Source: ABdhPJzKi4tmV2Cv4sbeMgWAKFUg/xRJTcrF5bAtYkBBrbRRCZ/yk3UOFCsJ5Ct+BNZnK7a4S1TUBkEdvwENFEdk8+E=
X-Received: by 2002:a50:99c3:: with SMTP id n3mr6280737edb.213.1603722795508;
 Mon, 26 Oct 2020 07:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201009060302.6220-1-mike.looijmans@topic.nl>
In-Reply-To: <20201009060302.6220-1-mike.looijmans@topic.nl>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 26 Oct 2020 15:33:04 +0100
Message-ID: <CAMpxmJVkM_Jp-PZwgYU2mrACy1z8-aCk+OkihKq8idWfobU3Qg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: gpio: pca953x: Add support for the NXP PCAL9554B/C
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

On Fri, Oct 9, 2020 at 8:03 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
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
> v3: Devicetree bindings in yaml format
>
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index 183ec23eda39..f5ee23c2df60 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -48,6 +48,7 @@ properties:
>        - nxp,pcal6416
>        - nxp,pcal6524
>        - nxp,pcal9535
> +      - nxp,pcal9554b
>        - nxp,pcal9555a
>        - onnn,cat9554
>        - onnn,pca9654
> --
> 2.17.1
>

Hi Mike,

please resend this rebased on top of v5.10-rc1 with tags collected if
you still want it merged.

Bartosz
