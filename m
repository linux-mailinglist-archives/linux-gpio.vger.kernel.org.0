Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D36FF18321D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 14:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgCLNxx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 09:53:53 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:35550 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCLNxw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 09:53:52 -0400
Received: by mail-vk1-f196.google.com with SMTP id g25so164249vkl.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z0oD7i3z8pfficOabLv0M/bTEhjkqPaLssJvmDail5A=;
        b=XGNGhjA+oZakkRthns66kwKdYOczWc44o0f6nmIE+9P+JD1xtV+j+TQ50qbdpOUFhG
         LhyT4hVP5il2+IeqDxSWG3oHssnLUdPhb2QGZW4P26TlOhRD8dymgDTCgY9kLLlave67
         EOEDX43dM2gVE2zCergAuIOl9d6MMb/SBnY1ZRDKJ3xBvK2kkm2gb5PWRaQ9DcD4tZg9
         mUpKzlw1XKWk44ePtVeaoBsP0UoJnqd0Z/8JBJxcEOzk0AX8HhkhiiATM9kFWXsKabCF
         y94ZQxJsgmmo5D/l6kACKs5OsdGvQRdauDOU/rKH67wbbDv2bJBjEYejxlWjKvU2Rc5T
         k4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0oD7i3z8pfficOabLv0M/bTEhjkqPaLssJvmDail5A=;
        b=tfGq7NcNQuDPzeIDDLQEMdflqzLVZEBqBIjV/0/xwXySUdwJzSluRelyFt8hugpXY3
         ogLoJmUzD130sf/qTCvO4tbLpPjVtCV7mIcVi9o62jiL2IXea4293k/Mwaoaj9y1JXja
         CUVxi12iMRGYRUGOdmTtx8IqM6ZYc3kmqAUZQKPuuUFnkt2tLx3lB6V7V9VUe+v2wy6Z
         3r5sT4N3etGGCXtzVOi1gy976/+DSs+/CMLk/fH4HZzKzbKQiT5IVhWdTWElIvqn8Q+C
         A0g/yvyFxeebiFy0xw2DtyWnwUW0WUdDWs5XvTdrIYsqdtCMNDDXHP5DfRXFRfgZcgc5
         QcvA==
X-Gm-Message-State: ANhLgQ03pHASFMc7IYpiLbsKmPltS44pGGv3uGGrLkP1/OCeVBw9FmVd
        /KI5X5AEKIW9VxyN0FRLY0bYutOPea36IBPlQbehTg==
X-Google-Smtp-Source: ADFU+vuVL1NOPuHCBM8iDTziNFNqLXKsqy8CqxibQJF49DVt/3ORdnnpWxWaoXsv8YIsobZn/jaqWBgYY3UZvop6j24=
X-Received: by 2002:a1f:2155:: with SMTP id h82mr5372064vkh.46.1584021231500;
 Thu, 12 Mar 2020 06:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru> <20200306132516.D45DC8030700@mail.baikalelectronics.ru>
In-Reply-To: <20200306132516.D45DC8030700@mail.baikalelectronics.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 14:53:40 +0100
Message-ID: <CACRpkdZxpa6z0zD+vgEV10NLG_CXOvYYr1BSwr_fEDfc_Pxf-w@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: dwapb: Use optional-clocks interface for APB ref-clocks
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergey,

thanks for your patch!

On Fri, Mar 6, 2020 at 2:25 PM <Sergey.Semin@baikalelectronics.ru> wrote:

>         /* Optional bus clock */
> -       gpio->clk = devm_clk_get(&pdev->dev, "bus");
> -       if (!IS_ERR(gpio->clk)) {
> -               err = clk_prepare_enable(gpio->clk);
> -               if (err) {
> -                       dev_info(&pdev->dev, "Cannot enable clock\n");
> -                       return err;
> -               }
> +       gpio->clk = devm_clk_get_optional(&pdev->dev, "bus");
> +       if (IS_ERR(gpio->clk)) {
> +               dev_info(&pdev->dev, "Cannot get APB clock\n");

Turn this into dev_err() while you're at it.

> +       err = clk_prepare_enable(gpio->clk);
> +       if (err) {
> +               dev_info(&pdev->dev, "Cannot enable APB clock\n");

Also this.

With those changes:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
