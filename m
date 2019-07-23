Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 377507140A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 10:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731367AbfGWIek (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 04:34:40 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38479 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfGWIek (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jul 2019 04:34:40 -0400
Received: by mail-oi1-f193.google.com with SMTP id v186so31692221oie.5
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jul 2019 01:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Hh2BDdxorbNR5zjiFLHeW0WcNUHrtRdBmZjV1bKD+A=;
        b=C8EaRj9dizNUQ30NV1vxEnvoyAtMoMieHRuWAMgEq33P8Rdt6e2gzLQqMAgHG9Ffa2
         4s44+JpxPoMF3U2PuGmYAQCFGFVNTMAJ52xkS0SM78s7J4gLGp6oQIIZj11qeOlH9/Q0
         dnqgniXDFf1w3iqnM89GSv87EKmvNTDQ2EACRub+SHySCFt6WQ0doqB1e+1JXqUU4B8x
         OTeYOM98OBEU53HbYwuH2Y+V2R1PuMQBCCBMGZneEItuTwJjUfwLVR0hOA2ndopu1jTe
         isqBZ+ltTJi7Nn+/wtqt7p12iocoplRWCqFy/F0yI1joVHX1o17YUOIhN91HQFHNHvnC
         Cu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Hh2BDdxorbNR5zjiFLHeW0WcNUHrtRdBmZjV1bKD+A=;
        b=M7nqJZbEIc2MDeiWMHdJqruqtZ9kFDLImEW+rbjWYgFou/sQsmEBTeXhiKcS5WVr7D
         jMwc08lCAI+0T7Mu9Njk9U6FAdPxWotkMl5DH60HoW70j5Gge0frk1j4EBgs1sQ+wQX+
         ZNYEjtO/HXpVJEBBB2OQTK7AuqLm1/lrHx5QBwHeqegYArTiCSVneoMF+BNtcYNV96LM
         pOhNMLNifWFSqRN+Xh/mGHwJRDMGu9Eu5TUZPmfNHRKT6sw2bgWjwq6hud0EZ0N1cFmf
         lXvnmtI3co3OOEJsg++CUpppW2H1LxHlRx8YSBOke5Xmb8biW0dmIGhhnQM4e4qKBe29
         XkiA==
X-Gm-Message-State: APjAAAU6YwC2SHrf2W/TDqUcGUNFgT7pLO3JVZ9u79RdyhKMtid1gYG9
        o7mTG/0zgxrwYRtgzsPZ8PzzCNUn2KObOxSLO4srLw==
X-Google-Smtp-Source: APXvYqxPprxyQgUcu70VVe/gOmJvo832yuXPevAMsW/OCjoAGEfXxz1uiB03FDomjcjBM0MHTn5JSzFhEXjcqjJEnjw=
X-Received: by 2002:a05:6808:f:: with SMTP id u15mr37441232oic.21.1563870879302;
 Tue, 23 Jul 2019 01:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190723082933.21134-1-hslester96@gmail.com>
In-Reply-To: <20190723082933.21134-1-hslester96@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 23 Jul 2019 10:34:28 +0200
Message-ID: <CAMpxmJUCPCyC-n9V+o5veMTm-yui8H2vdn1ceqZN=VG+yosLOw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Use dev_get_drvdata
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 lip 2019 o 10:29 Chuhong Yuan <hslester96@gmail.com> napisa=C5=82(a=
):
>
> Instead of using to_pci_dev + pci_get_drvdata,
> use dev_get_drvdata to make code simpler.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/gpio/gpio-pch.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
> index 1d99293096f2..3f3d9a94b709 100644
> --- a/drivers/gpio/gpio-pch.c
> +++ b/drivers/gpio/gpio-pch.c
> @@ -409,8 +409,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
>
>  static int __maybe_unused pch_gpio_suspend(struct device *dev)
>  {
> -       struct pci_dev *pdev =3D to_pci_dev(dev);
> -       struct pch_gpio *chip =3D pci_get_drvdata(pdev);
> +       struct pch_gpio *chip =3D dev_get_drvdata(dev);
>         unsigned long flags;
>
>         spin_lock_irqsave(&chip->spinlock, flags);
> @@ -422,8 +421,7 @@ static int __maybe_unused pch_gpio_suspend(struct dev=
ice *dev)
>
>  static int __maybe_unused pch_gpio_resume(struct device *dev)
>  {
> -       struct pci_dev *pdev =3D to_pci_dev(dev);
> -       struct pch_gpio *chip =3D pci_get_drvdata(pdev);
> +       struct pch_gpio *chip =3D dev_get_drvdata(dev);
>         unsigned long flags;
>
>         spin_lock_irqsave(&chip->spinlock, flags);
> --
> 2.20.1
>

The subject line should start with gpio: pch: ...

Bart
