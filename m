Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290C21BF77
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 00:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfEMW34 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 18:29:56 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41434 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfEMW34 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 18:29:56 -0400
Received: by mail-pl1-f196.google.com with SMTP id f12so5152149plt.8
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references:from
         :subject:cc:to:message-id:user-agent:date;
        bh=ETQhQAaaEpynYwTuUBGU6E1kF1yOq255ZbmhFrac2JY=;
        b=lCF4YE1X1gC3tjBCZVAp3rx/olsWV+J0XAb6jJx7FkuG9YOdGM/BbF8eJHo/allGDv
         Xza4Bszn9mZYOtgpPYXpRbmXa0YiZXqUmAIf+TdTK41cPnxeyXgD1nTVhOEyntS6On/y
         dZSHK3jML6Vc39MREPTHKjqPL4lmey9RcItFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:from:subject:cc:to:message-id:user-agent
         :date;
        bh=ETQhQAaaEpynYwTuUBGU6E1kF1yOq255ZbmhFrac2JY=;
        b=e2fDJuASX7p7TV16KcU+cXkiLZ68f9hTytOpMLUK2lOYVY0RbCv+DOgdDB+tLbORv2
         ypabUFMXMmjauQfQ0d/ikT0D14o0y9vAGloI/M3lINg8HCtrSDOMy/v4M8D/2fMsDvjS
         0K0MBd6c1XomFTZThA50iQZnJ18e7RrbYjyrDt9vKGx5QrBGs1mg2zvE4Y8H2pz60Klh
         +u3Ca3+27kKcScrnat8RjOtZUNB5DIts1UBlqC32+ht7yhhfnVcG53V3jKV4bTVB6fFJ
         f8LBenzdlHZ3qionSbcgEjt5J2iNIfAmC7M9G9aYdIWRJQnbPPysIWqVzpjlbvOTg64z
         9oEg==
X-Gm-Message-State: APjAAAW4vdvwP2mpdYJqiv6Q6UJD/7qt1dKodTlLzNUzZMHQH2yqBskQ
        30iCCocxhaGJuiP2/S0Y5jz19w==
X-Google-Smtp-Source: APXvYqySS1GyiV5EFWAvvxpDWM4HKOFcG2K2g8mylOnrI7fyLakxzGwBsPFhohtLtxgeH0oftSnzmQ==
X-Received: by 2002:a17:902:f096:: with SMTP id go22mr35230296plb.49.1557786594965;
        Mon, 13 May 2019 15:29:54 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f87sm21668997pff.56.2019.05.13.15.29.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 15:29:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190429035515.73611-3-drinkcat@chromium.org>
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org
To:     Nicolas Boichat <drinkcat@chromium.org>,
        linux-mediatek@lists.infradead.org
Message-ID: <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Mon, 13 May 2019 15:29:53 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Nicolas Boichat (2019-04-28 20:55:15)
> During suspend/resume, mtk_eint_mask may be called while
> wake_mask is active. For example, this happens if a wake-source
> with an active interrupt handler wakes the system:
> irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
> that it can be handled later on in the resume flow.
>=20
> However, this may happen before mtk_eint_do_resume is called:
> in this case, wake_mask is loaded, and cur_mask is restored
> from an older copy, re-enabling the interrupt, and causing
> an interrupt storm (especially for level interrupts).
>=20
> Instead, we just record mask/unmask changes in cur_mask. This
> also avoids the need to read the current mask in eint_do_suspend,
> and we can remove mtk_eint_chip_read_mask function.
>=20
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

It looks an awful lot like you should just use IRQCHIP_MASK_ON_SUSPEND
here. Isn't that what's happening? All non-wake irqs should be masked at
the hardware level so they can't cause a wakeup during suspend and on
resume they can be unmasked?

> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediat=
ek/mtk-eint.c
> index 737385e86beb807..7e526bcf5e0b55c 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -113,6 +113,8 @@ static void mtk_eint_mask(struct irq_data *d)
>         void __iomem *reg =3D mtk_eint_get_offset(eint, d->hwirq,
>                                                 eint->regs->mask_set);
> =20
> +       eint->cur_mask[d->hwirq >> 5] &=3D ~mask;
> +
>         writel(mask, reg);
>  }
> =20
> @@ -123,6 +125,8 @@ static void mtk_eint_unmask(struct irq_data *d)
>         void __iomem *reg =3D mtk_eint_get_offset(eint, d->hwirq,
>                                                 eint->regs->mask_clr);
> =20
> +       eint->cur_mask[d->hwirq >> 5] |=3D mask;
> +
>         writel(mask, reg);
> =20
>         if (eint->dual_edge[d->hwirq])
> @@ -384,7 +375,6 @@ static void mtk_eint_irq_handler(struct irq_desc *des=
c)
> =20
>  int mtk_eint_do_suspend(struct mtk_eint *eint)
>  {
> -       mtk_eint_chip_read_mask(eint, eint->base, eint->cur_mask);
>         mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
> =20


This alone looks like, write out the mask to only allow wake interrupts.

