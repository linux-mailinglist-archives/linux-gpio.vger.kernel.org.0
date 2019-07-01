Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0387117D5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2019 13:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfEBLDb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 May 2019 07:03:31 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:50230 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbfEBLDa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 May 2019 07:03:30 -0400
Received: by mail-it1-f194.google.com with SMTP id q14so2573929itk.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 May 2019 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t6qFScCGFm+OjY65pkD+W15TAhL1Jfr5D+WuGdpbCR8=;
        b=LUSO+WRC99FAZkWEItfHPPFIHsjrnxCYbDXt3s/nQMb8ZJVh4ay76TBCBlPIWKMc49
         Ru0VVLcFAFTrahByDg6zLQDUXOqGEHfdSR9S3Wi/ggtyffdEIjX0VPiow4nAYHImi+Sn
         Ou535enfb1L9vx2XUWQ+kBe0O4psVGUsFIK+UM7pC0hZESX7fWMP0UcJtTbuPzPYYPnE
         y1TK1Iw8Dgc2dwK/xJ/obVI+2dvTZlWRMgiQsrQI6RUW/iBaI47zfTm8v8D4b7fBbFlQ
         vku+dDmd3y14p6152FrKBlMMN5S8G0m0EymH8uCNj5id7Dw13mCUOErqdYGWg/nNQvOg
         EIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t6qFScCGFm+OjY65pkD+W15TAhL1Jfr5D+WuGdpbCR8=;
        b=UVRzJgstF5DpxuCwdakcnkGpxq5hxBtu2UNNQPEdBboVJRT1RrbxpMtLbwTdFi1isR
         QJudttRFrxESgr9Ap7v69axooiVfSICYAsFx4dIyskGDDA+mzTJJH5Jqf5hccnYuPlMK
         5V1QGeaQIOWSkpOy+Z0l/S6R03Egr5iPca4eR+79mJfBH16lBJ2EZgNhCdkDo4aKPxKz
         MQN8wqS11h6mHfFUchA11TokW90FvLeZIR+F0TiPnhq/EpoAIf6XqtZt9+7VEtV7AXEu
         NWRQbQ8cDzLoD49+OhytaIuR28FWoc243CbMEES0XFVPCXpVf0YWpTtcCIQYLXENffXA
         GcnQ==
X-Gm-Message-State: APjAAAViglaa6+7iSc8MUd/DA22pglE/nJR97kUVuK+Uk/tKJz1+I1Io
        gR+0EsMM8d/MPmxC+zXC7FAx+/+LGf+19cA3npXQaQ==
X-Google-Smtp-Source: APXvYqwnwYPjLFgFQ08DslFzYPdjWB5WeGzReY62upJhpAn3HttdD91biXn/ByvMjR734VKTkLmBogCfHmp44/jOy94=
X-Received: by 2002:a05:6638:94:: with SMTP id v20mr1953066jao.2.1556795010051;
 Thu, 02 May 2019 04:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190429131208.3620-1-ard.biesheuvel@linaro.org>
 <20190429131208.3620-5-ard.biesheuvel@linaro.org> <20190502080255.GS26516@lahna.fi.intel.com>
In-Reply-To: <20190502080255.GS26516@lahna.fi.intel.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Thu, 2 May 2019 13:03:18 +0200
Message-ID: <CAKv+Gu_TEpTuwE3zB1VxMojHnevNAUSX5PkaW_uCVtV6jNx-LA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] gpio: mb86s7x: enable ACPI support
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Graeme Gregory <graeme.gregory@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2 May 2019 at 10:03, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Apr 29, 2019 at 03:12:08PM +0200, Ard Biesheuvel wrote:
> > @@ -160,13 +177,15 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
> >       if (IS_ERR(gchip->base))
> >               return PTR_ERR(gchip->base);
> >
> > -     gchip->clk = devm_clk_get(&pdev->dev, NULL);
> > -     if (IS_ERR(gchip->clk))
> > -             return PTR_ERR(gchip->clk);
> > +     if (!ACPI_COMPANION(&pdev->dev)) {
>
> Since you don't use the returned ACPI object, you can also use
> has_acpi_companion(&pdev->dev) here and other similar places.
>
> Regardless of that,
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thanks Mika. I will use has_acpi_companion() instead.
