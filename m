Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA931E09D5
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389281AbgEYJQA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389271AbgEYJQA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:16:00 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0899C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:15:58 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id b6so16882544qkh.11
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HeEd+c60FRjGCeCKuVMamBqIVW2/NUYQpKTyT80oXTI=;
        b=Yg8gdfXs5pSQWW3x56xKtevqhewuVztrJEEaWdVsBMSME6Y4Ypd+c0CaOMO7MvTRyr
         g+JpjYkMg4Q3dkKT82pppC7RJ3yTmqWIUXQBMUdnx8jc9479XEnY16QMqC5bbWnCOcXz
         paO0kg2XqvfByl1uiK5D5/Kl8V3ms8mQJWyQzv6c7auJdXSfLnuCEcqInEuUbb0GFiBa
         kOM0sLLwClsMN0yrx5zwAH7APBAplrB1EskhAIzgaSv5Awtv3YR2vkQIJuQE4xSBgiQt
         1ZdeIYLDmKyQtjMy9QfLYhoHgClU1DbP1TVhfzlTJbkDhWMFpSz67Jcx/rCNFHgjUWsF
         Dz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HeEd+c60FRjGCeCKuVMamBqIVW2/NUYQpKTyT80oXTI=;
        b=Maa9lJl8MdxFERMwKvzJ0hpdTx41KWEC8r8+G3i+vb51vvRiOYrAP8OMcz8YtuAD62
         aSreWAlNgyJ51BpfHRfhNHFqyrjZzpDJxeAZWI8+eAuvsU/o2WnR6kLqJaocGE/3WY/a
         7EqQegrqkSRkx+7stf341+VtlsX5GCd95y8muHibiadmRmofnkAMSbl+rYBuM7Gnqwat
         hN2/xiHctjNiS7+5rEG1oTzRd7dTq5+c5ivNdcBvBjm42atnHGWvrDM1V53xHAi8hIQj
         0eWrtj9FE5ddNvOehPjVS6Ogsa4DE2hCFSvuz2762eKpAP1jH1eB+dQvoqv6SBGgl7qw
         lZ+w==
X-Gm-Message-State: AOAM531b11g5Khs0fGkhsolXeDcowbEUAnyUaiyvzjH/b7DbbfSJLqFX
        vH81qj9MMxDDKZmz2DdWyoF2ocIp5pjy73QXjZvXfnmq
X-Google-Smtp-Source: ABdhPJzjF8ca/F3GtrPX5cQlziDTJ+OtNvbSnNvXlyUUOgKecmUmnXFY1qvK2H2gwGkFhjLE4WIVslhe6eabeLda+qQ=
X-Received: by 2002:a37:9487:: with SMTP id w129mr23848650qkd.21.1590398158172;
 Mon, 25 May 2020 02:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <1590120740-22912-1-git-send-email-yangtiezhu@loongson.cn> <1590120740-22912-3-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1590120740-22912-3-git-send-email-yangtiezhu@loongson.cn>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 May 2020 11:15:47 +0200
Message-ID: <CAMpxmJW9po_hp64yV73R4fLMQ3_5SbJuvE7Rva8hOvzjAFVHrA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: pxa: Add COMPILE_TEST support
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 22 maj 2020 o 06:12 Tiezhu Yang <yangtiezhu@loongson.cn> napisa=C5=82(=
a):
>
> Add COMPILE_TEST support to the PXA GPIO driver for better compile
> testing coverage.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 03c01f4..5e90aad 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -439,7 +439,7 @@ config GPIO_PMIC_EIC_SPRD
>
>  config GPIO_PXA
>         bool "PXA GPIO support"
> -       depends on ARCH_PXA || ARCH_MMP
> +       depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
>         help
>           Say yes here to support the PXA GPIO device
>
> --
> 2.1.0
>

Patch applied.

Bart
