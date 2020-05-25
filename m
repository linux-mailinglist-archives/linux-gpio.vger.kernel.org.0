Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57D41E09C9
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731284AbgEYJOf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgEYJOf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:14:35 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA78C05BD43
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:14:34 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f189so16917119qkd.5
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mbBog8MzvKNaCFrg6v3gH2zfw8FxJzmofUMGKb8FS/g=;
        b=0DVJ6z9JKI1z7qc5wvYtWKBdWUwkPufux2KDtFjfGcSQ/HTpdUgeir5ke8EkWrN1R7
         ve3AXV7RcFUNLSFRrY/oKTXPnL+Km7rbGnfX9zVZkztjocTEWi29DoZ2fwrLU7ga1XS+
         cjuKR3w7aaZ8Dk6O99Yq1vWrMpSe/IhLTid3NgNnkJ1KlZKrzA9xFl2Nv/q9ho+2ud34
         rTsBQp9XcHO60AIHSFIeJs+r1Dtwi2Dh5oUQvXwzAFGk1eEs/QFRZ7QrzpWNsG1A1TNL
         5KCUDJ9SfSp+ljXONaUJQPltaPBLGiYWRvoO+hiUl3Fon5Kbg2JNFPnEm0PEHZpxuBr+
         Bzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mbBog8MzvKNaCFrg6v3gH2zfw8FxJzmofUMGKb8FS/g=;
        b=slIpEJMRk9TablSoD2f9ufv9exeI0Xbv2OrrAYOnpI5kDXykdsIOaqLOqOFRk36pbJ
         O/7FtAIJCmdumolai+9miUG2Dqc3BvixhD6l/IDUwzpW2J4NcChgiPstG2X3hpWqDpjj
         4s9Dqsy92lXkFX1+XsEz2r/WMZ4Ui+6jnCXCSuLsW4caQnwU0SOJWicp9YlJz+APxIYq
         VDapqjpWuqwvH8QIrw4leHKW8Y8yTENuzNsTAX8zYTg6svxQxnMSMdnraAMBD36RkAXD
         leoxJHEooQy6qCoAIGdknS20AsCZDTOi58WRwYoDlMJEF+dSV2GteGk3su91lk1e+XVK
         +ahw==
X-Gm-Message-State: AOAM531WWK8JlTAZ3St643UWZPYVvCnWeFEHxh1zKae5k26XgaxOc4G3
        aDUgHqvBFP/9uAFJcINAteb3PZkiepHWhseJmiVHcw==
X-Google-Smtp-Source: ABdhPJyS1j3T808bcO9YDCKIkb0LjajSrMv02m56SJgAqpdt5ZLZ2vrWGJHijMEL0lQyy0YDP+Uc8OGBFJg+HViUaeQ=
X-Received: by 2002:a37:dd6:: with SMTP id 205mr3478129qkn.323.1590398074097;
 Mon, 25 May 2020 02:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <1590120740-22912-1-git-send-email-yangtiezhu@loongson.cn>
 <1590120740-22912-2-git-send-email-yangtiezhu@loongson.cn>
 <874ks7okk4.fsf@belgarion.home> <3382c1df-1429-ecd3-70b6-35bc00343608@loongson.cn>
In-Reply-To: <3382c1df-1429-ecd3-70b6-35bc00343608@loongson.cn>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 May 2020 11:14:23 +0200
Message-ID: <CAMpxmJXc5-+hj5p2GTMJR4MZX95YWpTTg5FHD79au8pdcYi6mA@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: pxa: Fix return value of pxa_gpio_probe()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
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

sob., 23 maj 2020 o 05:25 Tiezhu Yang <yangtiezhu@loongson.cn> napisa=C5=82=
(a):
>
> On 05/23/2020 03:07 AM, Robert Jarzmik wrote:
> > Tiezhu Yang <yangtiezhu@loongson.cn> writes:
> >
> >> When call function devm_platform_ioremap_resource(), we should use IS_=
ERR()
> >> to check the return value and return PTR_ERR() if failed.
> >>
> >> Fixes: 542c25b7a209 ("drivers: gpio: pxa: use devm_platform_ioremap_re=
source()")
> >> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >> ---
> >>   drivers/gpio/gpio-pxa.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
> >> index 1361270..0cb6600 100644
> >> --- a/drivers/gpio/gpio-pxa.c
> >> +++ b/drivers/gpio/gpio-pxa.c
> >> @@ -660,8 +660,8 @@ static int pxa_gpio_probe(struct platform_device *=
pdev)
> >>      pchip->irq1 =3D irq1;
> >>
> >>      gpio_reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> >> -    if (!gpio_reg_base)
> >> -            return -EINVAL;
> >> +    if (IS_ERR(gpio_reg_base))
> >> +            return PTR_ERR(gpio_reg_base);
> > As far as I know, devm_platform_ioremap_resource() could return NULL wh=
ich is
> > not handled by this test (unless __devm_ioremap() semantics changed sin=
ce I had
> > a look).
>
> Hi Robert,
>
> In the function __devm_ioremap_resource(), if __devm_ioremap returns NULL=
,
> it will return IOMEM_ERR_PTR(-ENOMEM).
>
> devm_platform_ioremap_resource()
>          devm_ioremap_resource()
>                  __devm_ioremap_resource()
>                         __devm_ioremap()
>
> static void __iomem *
> __devm_ioremap_resource(struct device *dev, const struct resource *res,
>              enum devm_ioremap_type type)
> {
> ...
>      dest_ptr =3D __devm_ioremap(dev, res->start, size, type);
>      if (!dest_ptr) {
>          dev_err(dev, "ioremap failed for resource %pR\n", res);
>          devm_release_mem_region(dev, res->start, size);
>          dest_ptr =3D IOMEM_ERR_PTR(-ENOMEM);
>      }
>
>      return dest_ptr;
> }
>
> And also, we can see the comment of devm_ioremap_resource():
>
> Usage example:
>
>          res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>          base =3D devm_ioremap_resource(&pdev->dev, res);
>          if (IS_ERR(base))
>                  return PTR_ERR(base);
>
> >
> > Therefore, this patch is incorrect, or rather incomplete.
>
> So I think this patch is correct, do I miss something?
>
>

Yes, this patch is correct. Applied for fixes.

Bart
