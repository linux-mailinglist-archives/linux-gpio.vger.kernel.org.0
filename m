Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EF41FAB9E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 10:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgFPIuT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 04:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgFPIuT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 04:50:19 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E64C05BD43
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:50:18 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id d82so1226383qkc.10
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RVGu6PAcvTn1Y9na/crur5lRNO3jpGTKn65gyjWomTs=;
        b=NfMvBfPgpryL2bUTBbncoUwqL6NQfkDWPPsZMFnsPS4iwUjsmMjF+0SoT6yhDi2mjj
         U04I014RrOBw9UJGfNaoriO/Beqf7rBxRpoNL6NCxVQRo3cpJSJe8sDk3n5dNnS25GDm
         VK3Zpy3MQMxWGVq/RI+L3cL4cCyW9P0n2f0LyW2ENuIp+dSuBLCq7Y4awXpYii7jiT3F
         op/ZKIRufkJMbGbaavCy2B8w6UHjY+cXdLs84t975/4XQuNMIaJjc6y2F/Tny+eI/EcF
         ME2Sd7QeAIMkvYfWdC6tcBjt2UKoipAHLNXd4V2Nehv3xwZh0IPQ7AfIIz9xmL/PTe/7
         StOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RVGu6PAcvTn1Y9na/crur5lRNO3jpGTKn65gyjWomTs=;
        b=elbcrI2p9+6dOipcuzZBAuS0/8pxwXwr6DUzFOKTqlEtaBV/7EqqsBdiD3qu1xwUly
         n6TnQZNgbDQbAOezy6fhHtW4dqSkcgpsEkXZcZXBGh/FphVpL6BmF1QLbSZqa9KCaIbA
         NwUUG6gF+U5M9wDGoxNrI+Ez4/t/NFWzrAwjEX8cygP4V6Lg+IMtt+ljNAvy7J64+NS6
         6OiR3beEcjocrb8yijiGi57eWx+Zp8F6ES9sBXea5MpOPXmsoKt2HcocsYKydnVkMLik
         ruyihv0rxL4LczPPa4GriYmfmjEW0fpVHwFSutK4FoMz0kj/F46bRZ7phLWAFUPkxSGu
         5sGA==
X-Gm-Message-State: AOAM531B1cCN5P6Lu4hJs+TK4RX2gt4MdhD9WSnrK0hpiwWD1ode7nKX
        y8T3sihU3lZKeyqt9rYJ8lBN91JzAUhN7b5nktO8V9M+
X-Google-Smtp-Source: ABdhPJzHsHHV9iDdm3KT3PEY16dBCNueo47F4xXAfBIzQeXxnvTko9WPEtISdUCzsY8ukXzSk1Z3VzoJmSNThF7CXjw=
X-Received: by 2002:a37:aac4:: with SMTP id t187mr17406503qke.263.1592297418121;
 Tue, 16 Jun 2020 01:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592227348.git.jan.kiszka@siemens.com> <213b571eda0ac65a2605df83e60fc20a9b37070a.1592227348.git.jan.kiszka@siemens.com>
In-Reply-To: <213b571eda0ac65a2605df83e60fc20a9b37070a.1592227348.git.jan.kiszka@siemens.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 16 Jun 2020 10:50:07 +0200
Message-ID: <CAMpxmJWMfu31=tG-puG2Ca=vKiUYTEq6ASu+=CextsxC9PcHpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: pca953x: add nxp,pcal9535
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 15 cze 2020 o 15:22 Jan Kiszka <jan.kiszka@siemens.com> napisa=C5=82(=
a):
>
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> The NXP PCAL9535 is an extended variant of the PCA9535.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Do=
cumentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index dab537c20def..3126c3817e2a 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -19,6 +19,7 @@ Required properties:
>         nxp,pca9698
>         nxp,pcal6416
>         nxp,pcal6524
> +       nxp,pcal9535
>         nxp,pcal9555a
>         maxim,max7310
>         maxim,max7312
> --
> 2.26.2
>

Patch applied with Andy's review tag.

Bart
