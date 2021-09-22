Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB4F84149A2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 14:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236084AbhIVMvs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 08:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236050AbhIVMvs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 08:51:48 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65792C061757
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 05:50:18 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id c7so9331960qka.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HndHJ7ZUEW+xisuoTw70puWbLmjsMn7XD42T3lfhJeA=;
        b=5ZeAMwUCt0ve0hDwYkIUvwCnhz/Gl9TGdTKCjpoZqDQpIvi5WGyVoZabBgdRCrUCP6
         QgfvEUIrnEQhybPkp7uerSQzcwEdY3ILVWHzm6WFJtSImwJ+zV31ZHsgjhG43G35rQKK
         BGrbs+gROzLtW+mpFjBw7ts0zkx3vPl3qD9gI4xANVXJTfWvELo6YewiNFbA0ESAQAOW
         CV+LdO9KZXaJbmNhg/PSiBCPUrZHfHT1mRHfEM4tNmgKXLargI36mgRgw5l9Ry/4GBuP
         Q0JY5PPyoTNaeNOANoAz3PJJdbNzbCXj8mt3MAsyKA1SVo4rKGO0/AopD8wenhSGtSon
         Gw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HndHJ7ZUEW+xisuoTw70puWbLmjsMn7XD42T3lfhJeA=;
        b=CnPL6O926RCK1yNDeIht/kQJIBM/0OBlYRXq1eYocF0IrPLU65w5wZGgqkcm3kkG7j
         Ie6alQ76BoSuYU8/isPAE9K+XAmUDZbDgOCPdHrx+K58pU9n9Lxcre14di1mUVM7tq7+
         ncyvIk5D/ftDMlZvHH1v3sA+g9AzeI+KrbNoCIMgL+Ao71heJrv7+R44MB5WUSbxJ212
         xjb276AXgglxo6h/uzYqqjstdnL5NhDrcBHIwRcwB+kxCtHCy3gbof+jB712N9qQJVCE
         hR9fQ6c9jk6Fye45nq5wGxOiOwsuBn8PSMY74LS6pD0KLC3cZjgP+GOm6fZ1IQZ0eGsz
         RnxA==
X-Gm-Message-State: AOAM530s2pWROCZeNC8msaSq6UrfRN1zFbARL48HONIIXzcLSJ0lsto0
        rywC1oragmlsqN2CmaHQq1eWr6qpvsBRheYkSoeYoA==
X-Google-Smtp-Source: ABdhPJxUFVjiblcTCC3jDe1LZWVRPuDRtn1tONvxJnHGP+NBYcE7+e8ypUKHjLNNSF4K1K/9XsQ3iVtcmdJ5U6C8VME=
X-Received: by 2002:a5b:783:: with SMTP id b3mr41042313ybq.328.1632315017572;
 Wed, 22 Sep 2021 05:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045627.1739959-1-daniel@0x0f.com> <CACRpkdbE+_DJFhBCmtz5JwJupf7QkkWZhXrgf1KG_3rPqvEm0w@mail.gmail.com>
 <CAFr9PXmFHanrx4Frg3hQwo-RbAY-UXxC=FOAj++cshSHa99z3g@mail.gmail.com>
 <CAMpxmJUoG7qPhy2CxapCn1M=w_AssOQsEmyvXO18OpedM6hBjw@mail.gmail.com> <CAHp75VdU52rwKY3AA0Nxt3VGOFr71XtjCDqZbSxR4GNczSqihQ@mail.gmail.com>
In-Reply-To: <CAHp75VdU52rwKY3AA0Nxt3VGOFr71XtjCDqZbSxR4GNczSqihQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 14:50:06 +0200
Message-ID: <CAMpxmJUSvBSa=T1a1Bq_YhAGib9BcXf4xYMSOfyprHbG0t_QWw@mail.gmail.com>
Subject: Re: [PATCH 00/10] gpio: msc313: Add gpio support for ssd20xd
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 12:52 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 22, 2021 at 1:21 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Wed, Aug 25, 2021 at 1:50 PM Daniel Palmer <daniel@0x0f.com> wrote:
> > > Hi Linus, Bartosz,
>
> ...
>
> > > I just noticed I hadn't to'd Bartosz about these. Is there anything I
> > > need to do for the first patches?
> >
> > I only have a part of this series in my inbox and patchwork doesn't
> > have it at all - can you resend it with me in Cc?
>
> Have you tried to use the `b4` tool? It is capable of getting
> everything from the lore archive.
>

I haven't tried it because I have never heard of it. :) Thanks for the heads-up.

At the same time - is it too much to ask of people to just use
scripts/get_maintainer.pl? It's so much easier to just actually get
the patches in my inbox than to have to look for them manually.

Bartosz
