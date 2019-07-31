Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133E37D1BF
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 01:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbfGaXRX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 19:17:23 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35073 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfGaXRX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 19:17:23 -0400
Received: by mail-ot1-f68.google.com with SMTP id j19so33552435otq.2;
        Wed, 31 Jul 2019 16:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kSejrbwgUdMQ99bQrxJUA8zIPWxPSd8aucGAjk9aCgY=;
        b=bH+8O8VJFaTCmEBvljLo0b/Qv1bkCQxEdcJeke7+zSZYcmJ4Krfc4rsOKoruhvMIwY
         ybvjRmTUUkzTlrhhNp/bVgTMpxy3NgITtJ5qvYriP5gEbIw9byPMqHi/Q7scRSIlQ8W2
         rzUJFPAzFtSPfImPz5/lK6uAtayQ6Z0NSXx4JRrL5r1uSzKr2V9SfshmQ+wssK9xBHUN
         OLZJSh9XY95OxiiQTlGmJyJ5f22nt5cVjois1GLoHzDSWhsBMHYeBJ3Faw1e0szHMNTp
         UK9+vqeFqERvOAVO9v2loIcjrEyrPCIofTQm0x4/WpfjWbYH7Ra8xEd05jWSSKlh8noC
         6ZRg==
X-Gm-Message-State: APjAAAUjd3eGjRG0pXjQv/z6iyaaW4s5PMfLZ3/xmiVWLFwQTLSrogR2
        6B3N9ehhBT8osIUvOAVqTiXftsimwCs=
X-Google-Smtp-Source: APXvYqxyTX07lvKBrxanly5ckKsAan9H+TZlg2y5CpeD3cgEC5Jcn0c5YUdLZNDVSjDTfUkOd6URYA==
X-Received: by 2002:a9d:6959:: with SMTP id p25mr10360425oto.118.1564615041816;
        Wed, 31 Jul 2019 16:17:21 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id e78sm24753741oib.50.2019.07.31.16.17.20
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 16:17:21 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id o101so72017209ota.8;
        Wed, 31 Jul 2019 16:17:20 -0700 (PDT)
X-Received: by 2002:a9d:6d0e:: with SMTP id o14mr55638119otp.205.1564615040807;
 Wed, 31 Jul 2019 16:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190718094902.15562-1-hui.song_1@nxp.com>
In-Reply-To: <20190718094902.15562-1-hui.song_1@nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Wed, 31 Jul 2019 18:17:09 -0500
X-Gmail-Original-Message-ID: <CADRPPNT3A_1apr3FNjRbQhCHWLqvAQC0Oz8cGbOjNetAF8zghw@mail.gmail.com>
Message-ID: <CADRPPNT3A_1apr3FNjRbQhCHWLqvAQC0Oz8cGbOjNetAF8zghw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: ls1028a: Fix GPIO work fail.
To:     Hui Song <hui.song_1@nxp.com>
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

On Thu, Jul 18, 2019 at 4:59 AM Hui Song <hui.song_1@nxp.com> wrote:
>

Change the title to be something like:
arm64: dts: ls1028a: fix gpio nodes

> From: Song Hui <hui.song_1@nxp.com>
>
> Add ls1028a device specify compatible.

Please submit a separate patch to update the device tree binding too.

> Make gpio as little-endian deal.

"Update the nodes to include little-endian property to be consistent
with the hardware."

>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 7975519..488602b 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -277,33 +277,36 @@
>                 };
>
>                 gpio1: gpio@2300000 {
> -                       compatible = "fsl,qoriq-gpio";
> +                       compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
>                         reg = <0x0 0x2300000 0x0 0x10000>;
>                         interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> +                       little-endian;
>                 };
>
>                 gpio2: gpio@2310000 {
> -                       compatible = "fsl,qoriq-gpio";
> +                       compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
>                         reg = <0x0 0x2310000 0x0 0x10000>;
>                         interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> +                       little-endian;
>                 };
>
>                 gpio3: gpio@2320000 {
> -                       compatible = "fsl,qoriq-gpio";
> +                       compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
>                         reg = <0x0 0x2320000 0x0 0x10000>;
>                         interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> +                       little-endian;
>                 };
>
>                 usb0: usb@3100000 {
> --
> 2.9.5
>
