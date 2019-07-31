Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B058A7D1C8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 01:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730343AbfGaXTn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 19:19:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34099 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729885AbfGaXTm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 19:19:42 -0400
Received: by mail-ot1-f68.google.com with SMTP id n5so72105851otk.1;
        Wed, 31 Jul 2019 16:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RR0iaPSwLXzlYnEnnE6sJ2Z50c2cBYsQK/byKd2lzSQ=;
        b=XghrIVe/ANewP7KvtDUMyMdYaFBsiH9ofCvLR0iGIO7BjPcmCE25oVeVou9qmzACcy
         0HOkufZE9bP+j4UGjc/DSIvEM5iVj59ZjaPUauX8dZJJUXTx8bHVZe3rUb6P3C+CqNNB
         HUCzSt3oHzv9lYC+MYuJL7T2uU4RQTMVUPa1TbjfxBZcqVazVdP59gHATDlo5x5O8yjm
         4IyElNpSqk7AO77dCHtUhf1ZV/dU0SERjUieu9tBh5bP1a0bzcEzJJi3lE7AleWmxaQN
         UYydpeYh1G9CeLCR5A36NFiPMSZqAyvSO3hiyVvkjmqza/a9HUHiYIkZS9VpbpOuTKKH
         ijMg==
X-Gm-Message-State: APjAAAUSbg5LXAzqReTmNqC6zBmoMqZC4iWYsTMUUmYUtiq0xU3FEUT/
        YLbM12TG2vVLzvrQROvO9u4cgJdVtNI=
X-Google-Smtp-Source: APXvYqzp4daYfecNm3P1UHhEbQTdllzv002BXy73fOcBPOY/q2+FUDhRaica1roP+SWNcshLj/4hxw==
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr29454206otb.81.1564615181909;
        Wed, 31 Jul 2019 16:19:41 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id q20sm23508788otm.32.2019.07.31.16.19.41
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 16:19:41 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id l15so72019433otn.9;
        Wed, 31 Jul 2019 16:19:41 -0700 (PDT)
X-Received: by 2002:a9d:6d0e:: with SMTP id o14mr55644910otp.205.1564615181289;
 Wed, 31 Jul 2019 16:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190529083254.39581-1-chuanhua.han@nxp.com> <20190529083254.39581-3-chuanhua.han@nxp.com>
In-Reply-To: <20190529083254.39581-3-chuanhua.han@nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Wed, 31 Jul 2019 18:19:30 -0500
X-Gmail-Original-Message-ID: <CADRPPNQhRjEx=0Rr-XkHXtLTaWGM_b5zsjrL7vhhzzmQc35j9A@mail.gmail.com>
Message-ID: <CADRPPNQhRjEx=0Rr-XkHXtLTaWGM_b5zsjrL7vhhzzmQc35j9A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: ls1088a: Revise gpio registers to little-endian
To:     Chuanhua Han <chuanhua.han@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 29, 2019 at 3:32 AM Chuanhua Han <chuanhua.han@nxp.com> wrote:
>
> Since fsl-ls1088a Soc GPIO registers are used as little endian,
> the patch adds the little-endian attribute to each gpio node.
>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 661137ffa319..3e6d20d065bd 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -272,6 +272,7 @@
>                         compatible = "fsl,qoriq-gpio";
>                         reg = <0x0 0x2300000 0x0 0x10000>;
>                         interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
> +                       little-endian;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
> @@ -282,6 +283,7 @@
>                         compatible = "fsl,qoriq-gpio";
>                         reg = <0x0 0x2310000 0x0 0x10000>;
>                         interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
> +                       little-endian;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
> @@ -292,6 +294,7 @@
>                         compatible = "fsl,qoriq-gpio";
>                         reg = <0x0 0x2320000 0x0 0x10000>;
>                         interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
> +                       little-endian;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
> @@ -302,6 +305,7 @@
>                         compatible = "fsl,qoriq-gpio";
>                         reg = <0x0 0x2330000 0x0 0x10000>;
>                         interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
> +                       little-endian;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
> --
> 2.17.1
>
