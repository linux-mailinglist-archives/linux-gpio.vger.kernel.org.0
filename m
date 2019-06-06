Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1C1036DBC
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 09:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfFFHtT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 03:49:19 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:38403 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFHtT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 03:49:19 -0400
Received: by mail-it1-f194.google.com with SMTP id h9so1667923itk.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jun 2019 00:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PcZKwq/QD7LJ9zOMqPBkBZNVNvBl9KD97CXS9sN46Ic=;
        b=tslJI5N8NVUXGgSYyFDm6Rx/IYywuSzoAMmRxkLMt2p+Rkws1bC12MUcQUVV6XICKn
         SeRyYKTpJI6IXFNceW6UkugB5Xzfu12Zxiokks8+oY+44WayWNL/dwu7VK1lozagBJG1
         R0aJaEdXMStztEXMk7SE01TbjnyvkxOADgc0T2Urm4kEc+rX18oH/jov9lzcAIs+Ymop
         rGYhGmC1Uu8GsH5IglOL2e+k4Evdano3zltIFlkQIXs19TswkBXzgdh9ZHl56VM692QH
         sLUNrdb0RD8OaLAvklfwLNop7i2G+mGH+e1xSosTSK13ldsKtrMuaSAkFaHhwLFEUxFJ
         y6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PcZKwq/QD7LJ9zOMqPBkBZNVNvBl9KD97CXS9sN46Ic=;
        b=G8xr5OlwYAQYYk4ixphzIdMwvnopPMWccfDTxVI4J0XMNpS3/i/6gf5umY7wof+i2n
         3SQmS9rLVLOag/IDXNVuhKBADaHHe0cJ26Rj18gQtFeWFH7xZoLunzG3zkNzAIe6hXbX
         LlA7m5NFhNT/tll6r25EDcAHGmJ4qEConmmcsPfcPwecnXdcxM1u1y/ZTxwlJV1c0Tgk
         3PBSPQmySaBv7dwKuz6ZLcFLM5a26dJoBJZYg5pHh8O9CYA7B77HxrsGzz3r03hQRNPA
         BXVb3ESWGAFhtVEwXNfjpNwgbQPRKGWbd1l9FlMhzH+IJSuL8SnxsYUuCj3lWFm9MECW
         3oxA==
X-Gm-Message-State: APjAAAX9xmqVC3BXFsPhE36R+1azIDiPyrFNvcuwaAkJZhsI44uchtQI
        fc9UgXUGP6U1m+UV6EYdWlnnnRaPEbff0QYOQJ0QbQ==
X-Google-Smtp-Source: APXvYqwY1eUY0+k0Cf3njMKrLihozk0MzOpSW1lrQzK1tT6QCcAba90QQwPbH08U+8lE1IIyz4SrsTiB3UnwXw5oF4Y=
X-Received: by 2002:a05:6638:cf:: with SMTP id w15mr9341723jao.136.1559807358196;
 Thu, 06 Jun 2019 00:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190605080259.2462-1-j-keerthy@ti.com> <20190605080259.2462-3-j-keerthy@ti.com>
 <CAMpxmJXjMX20TAEsfEa7pqZx5-aW_rMKwS+6g9NTvRNEfuAyeA@mail.gmail.com> <96dbfd50-2a45-e3dc-3928-47fbc52f9269@ti.com>
In-Reply-To: <96dbfd50-2a45-e3dc-3928-47fbc52f9269@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 6 Jun 2019 09:49:07 +0200
Message-ID: <CAMRc=Mfe+K=s4OZp7VWRik7JtSU6Fpufx0yDZtYCMNh5+LSJuQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: davinci: Add new compatible for K3 AM654 SoCs
To:     Keerthy <j-keerthy@ti.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>, lokeshvutla@ti.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 5 cze 2019 o 17:12 Keerthy <j-keerthy@ti.com> napisa=C5=82(a):
>
>
>
> On 05/06/19 7:56 PM, Bartosz Golaszewski wrote:
> > =C5=9Br., 5 cze 2019 o 10:02 Keerthy <j-keerthy@ti.com> napisa=C5=82(a)=
:
> >>
> >> Add new compatible for K3 AM654 SoCs.
> >>
> >> Signed-off-by: Keerthy <j-keerthy@ti.com>
> >> ---
> >>   drivers/gpio/gpio-davinci.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> >> index 0977590eb996..fc494a84a29d 100644
> >> --- a/drivers/gpio/gpio-davinci.c
> >> +++ b/drivers/gpio/gpio-davinci.c
> >> @@ -632,6 +632,7 @@ static int davinci_gpio_irq_setup(struct platform_=
device *pdev)
> >>
> >>   static const struct of_device_id davinci_gpio_ids[] =3D {
> >>          { .compatible =3D "ti,keystone-gpio", keystone_gpio_get_irq_c=
hip},
> >> +       { .compatible =3D "ti,am654-gpio", keystone_gpio_get_irq_chip}=
,
> >
> > Please add a patch adding this compatible to the binding document as we=
ll.
>
> https://patchwork.kernel.org/patch/10976445/
>
> Posted but did not add you in Cc. Sorry about that.
>

I don't see it on GPIO patchwork either. Please resend it as part of
this series.

Bart
