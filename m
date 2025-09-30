Return-Path: <linux-gpio+bounces-26671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F370BAC76D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 037CA3BFAFA
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 10:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC90C2F8BF7;
	Tue, 30 Sep 2025 10:24:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6522F6581
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227896; cv=none; b=sNiryqnfN6gV34wD2kkPbgVwCT9lY6O4sgNHToKyzvsEZZJcWd1YbH7llvVx5/4XTbi2M7OFiGXTIOxhjKO6d66QilGc+t4xfmJ1S6JkWpn1yXAJh7ExzJY9E+jMXiEa0vToMxGlaa6uI3t71fNYGy+SpsbSFyuKxMu1tQYq1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227896; c=relaxed/simple;
	bh=NIsKp5GbFDcQPhLDJfZxN1nX/4KGoPsrwSotfE5mvdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+hxR1LzB26RYU2O7XseNa5fEIeg63rFOpBc0UcJEySDSu1lP5i5iCyyM6aDFuPLuD0P29oA8ifRAyX9/wgefsJmwfY5aMZwcg7abb1IjvrgrmnMQTBC+ZzMtWiGdOtKk04B9nCXEqDowaweM6cG6uJpWDhrvtFLRWrQGwszrPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54a98bcdedeso696604e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 03:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759227894; x=1759832694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gxwjnDPmLXoIEs1Rv4slGC0A9yr0/IqjZP6qkVdinM=;
        b=H8+/QSa4KGoIx19noo7WGiC2nMUsMFGvFeFVN57RyjSDMD6ffQtUza166mYhfMKbaX
         ZCKxX8w1b27cxXar0dQ/13eD0i3a8Fypqk/ZlOOB4Gf56k6cu6xAO6vtR/EawMp/ogPF
         w7gkyXkRq/tFGc1sG1PWrWWqDoLOJ6k1DSBpvroUynPESbMjvi1z4CYOF9lAQVkaXT5G
         Gs11Ije8TnNge6hS3z8mz8VtNnimUaYpm+2OqCh01LjpcHVWV5qw27li2JZv/wjHrGVY
         NDfPHkf+QKBtB4YGhEkNEdaJAH2AGF/bTf0o/P38FZfbIyC+D1RDRgtl4mu3EF92CtUP
         IF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPjC/LEugvLrvUhk7o8zBH12t3XHMIvpcgHB3POEXOzWlAZ+AoQLF9p/y5+q4UfF5aztC44aiXeV6g@vger.kernel.org
X-Gm-Message-State: AOJu0YyluogjB+VgdVRuG0ocTl9xw/dDWGFgKCSdRGZpW4de+myHNFnS
	7GoBrrvN+e7MzuUEechJ2EcrQC1VSuCRSUbaZEYY2w2y/4cIIilT02TQIaUEuUYt
X-Gm-Gg: ASbGncvim0DIyD9NunZlSjg6kqx+MP2CMabmHOzcz2GRxXpqhgS0E/KGbfax8Y6CP6I
	NN8JJlpUnFuldHTMJAPDdc+pOSm7oMoGx+swVsRbxaLmMKtlnmq0EvzC5b+0uZXDhLJZtjebDAp
	VTp8syostR22QAFMTpO7xs1j6Od+krp/p9XAh7dVN+P/coG0vFyvR1WxEKcDGP9L2Li5hvUgC3f
	y1JCghV8UF2zEGDPdNV1Sk13mKR3RApyKF2WgFFsccM/muiJTri17ynykv3vsFMm1BuJUHTShfb
	sj28+VAkTRwWZygVhCC8JQhqXCti27sIqAmXf9fg8fdyZUDSwl122JKFz/l5KYtZ++VlQ3+j58d
	++odVNV/QsDc66sIXpXS1YYtuQoaJbWFJjxgByquJz+E+Fx30ZQlajl+0BcR94YtvYsJHByJlxk
	HwKc5YNtfyKLbIShHJmb4=
X-Google-Smtp-Source: AGHT+IE+xRn1QU94ZYZRgzVWgOwo9b0dJ+b2dF2/CVyPccdXJ9AvZ08uNLr8ZUoIAjhNxHXxgg+Tpw==
X-Received: by 2002:a05:6122:3bd4:b0:541:fdc4:2547 with SMTP id 71dfb90a1353d-54bea1c11b1mr7431850e0c.4.1759227893893;
        Tue, 30 Sep 2025 03:24:53 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54cccc23afbsm1507733e0c.13.2025.09.30.03.24.53
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 03:24:53 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-55784771e9dso2968215137.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 03:24:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBCrqqucPatgZLw7w3Y3hS8UsqGv6HAA5I7mVmxPPPUPDVfcMovRVrfPB7mmtSoFhh7FjmBNjLNrLy@vger.kernel.org
X-Received: by 2002:a05:6102:b12:b0:525:42d2:790d with SMTP id
 ada2fe7eead31-5acd15c52c7mr8052194137.25.1759227892840; Tue, 30 Sep 2025
 03:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 12:24:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5bn1CjqNKvrtgEUTq8iQPZyg4UVh44s=6Z81XF1-F5Q@mail.gmail.com>
X-Gm-Features: AS18NWBEbbL7niL2f1QYLCCmEF_wzKXMQ4DUWPDaBIb8c5eMNT8LD5RKrVsYWOY
Message-ID: <CAMuHMdV5bn1CjqNKvrtgEUTq8iQPZyg4UVh44s=6Z81XF1-F5Q@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 9 Sept 2025 at 12:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> There is no need to reconfigure the pin if the pin's configuration values
> are same as the reset values. E.g.: PS0 pin configuration for NMI function
> is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
> code is first setting it to GPIO HI-Z state and then again reconfiguring
> to NMI function leading to spurious IRQ. Drop the unnecessary pin
> configurations from the driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -541,9 +541,16 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>                                        u8 pin, u8 off, u8 func)
>  {
>         unsigned long flags;
> -       u32 reg;
> +       u32 reg, pfc;
>
> +       /* Switching to GPIO is not required if reset value is same as func */
> +       reg = readb(pctrl->base + PMC(off));

I am updating the commit to move this assignment inside the spinlock
below.

>         spin_lock_irqsave(&pctrl->lock, flags);
> +       pfc = readl(pctrl->base + PFC(off));
> +       if ((reg & BIT(pin)) && (((pfc >> (pin * 4)) & PFC_MASK) == func)) {
> +               spin_unlock_irqrestore(&pctrl->lock, flags);
> +               return;
> +       }

To ease backporting "[PATCH v2] pinctrl: renesas: rzg2l: Fix ISEL
restore on resume"[1], I am rebasing this commit on top of the latter.

>
>         /* Set pin to 'Non-use (Hi-Z input protection)'  */
>         reg = readw(pctrl->base + PM(off));

[1] https://lore.kernel.org/20250912095308.3603704-1-claudiu.beznea.uj@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

