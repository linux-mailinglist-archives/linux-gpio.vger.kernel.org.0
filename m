Return-Path: <linux-gpio+bounces-10793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199B798F0B8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 15:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BE7D1C20F4C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 13:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55EA1991AC;
	Thu,  3 Oct 2024 13:46:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF668C07;
	Thu,  3 Oct 2024 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727963185; cv=none; b=Zo5zV9f6CmlI1xfJd+MTNT30qwSBCSv3IYpSrtxJjCUTh3OpW3em5pMEi2XGlO1dIPvQ8uWvpk7984+jmhhFMt7xgMoHEtgeg9fhSKmXVdyp+mCxFYGSs38YYTiwaJtu8FfrHIX2Jb8Yo66n4rakVjo8uHs4LUYFHCm7e9o7DrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727963185; c=relaxed/simple;
	bh=qrV+a7hrgx9ymUEkSMtlkXA0HGKn702MhfqunwmhFWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtH64F6ee8TzBSRHHkecXk/AuAmnSXXNkSDgibn6L7CSmnbuHXdE69D8ZJm/phRqwEmmnZCnAmlnrc7l6/CkycBLJhieFf9Ol1/WNPNjIFNc7KWrdQVt8CfJhGbgsK0q90D1GiyPW7ZhTI8cciTPzcFIxDP6SZwrGVyyYGh+yN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e1f48e7c18so7085287b3.3;
        Thu, 03 Oct 2024 06:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727963182; x=1728567982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAoZCzATdza81ShITb8W5CF8H9VjglTMiXMKyURvYrU=;
        b=jF3W+rTcl8KAW5qsJu9ChNaAnhNCG3I6/F/MsU0YihVFo86SHMSxDzGVb7SHWCCfju
         Dcv1AOvTUNFMAPThTIXK3dh3UOWttvJmaasHmX5HEFh9ECliB+hYW8WztSIcGDXtBH1/
         qYxBxINDkv1WR/OzLDLKrlQiF8Prhnnf/qI7ZNSAvlx29APGIHdSHF233B4D0+8y6rTk
         3KqJWXgcECO3oTIfBoSayECGQUA1/FdBldSPCm8x73B/wxcbNLxTJTC8vRKZjRdHLPVx
         cmxeiHC98EquG5skZGcRM4YXW3tQVE3j2JtLDqynd6asVaN3EqWIAJgV8K4Vvliic2WI
         lYJg==
X-Forwarded-Encrypted: i=1; AJvYcCURYIlgX7J4PUhSrs+xwEEe7ZjqMVpgAJn9dOzA8meHG2hA47bcn6tcd2vkFEWDj2nR0ZwujBKlzBgO@vger.kernel.org, AJvYcCVO5pQkdKIPx4kRYpxZJ34QFd7ESlFN8mj6vGbnjlfyikC1jCpcPmnEGMYcjPMyye4HM5mhmrs0YllovZpS@vger.kernel.org, AJvYcCWr8uWClQ/EyStj6gac8aSzWIxRwJ/HPuZCkbhlfnHdadCqNVLpiC+Ny9GjmfOOjP4/pnYqKgDelD7Hc4wIftspJ3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjxDReRVv+PlZo/Fpx+1IVNiHCRwrLpodB1y04sBaqqseRD0h
	cwDgeuC54RtSYdYT5B6w4Zdtiy0+LLU488ki2GHLBtUT5dBOG5O6oWxqk7T20nk=
X-Google-Smtp-Source: AGHT+IFAG1D9kQ43y3azZ5e32BXSnm2EY1WvCXssj9uPWJ1lmmW7AHBMukFMqt7Bh4mLZ/ZeNp/B7g==
X-Received: by 2002:a05:690c:d81:b0:627:24d0:5037 with SMTP id 00721157ae682-6e2a2980306mr66592957b3.0.1727963182051;
        Thu, 03 Oct 2024 06:46:22 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbbb7baasm2218507b3.11.2024.10.03.06.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 06:46:21 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e29c50ccbaso8765417b3.2;
        Thu, 03 Oct 2024 06:46:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTBg4fdRI3EhyzCh3vqHkISbF5RSnUTG6ZLEGHSMx6WCBOwXYWgsZGtiKRu0oi9zoPIyakpBsmJY80D9o3XtNDCeo=@vger.kernel.org, AJvYcCWrg84DZtEQA+6tI2gOwKsK+5ttpEbg3FPOwaSChx0e/MYNOxWCVr5hm81cvqNWrKD+mnV/gKlykckS@vger.kernel.org, AJvYcCXMqJ/MbpvQ3d/zKmrdtmax4lMg9Zq2ya01wJ+c+3+NSizuGgmO2JBKqmi2WdEEgMNNG7hHEPvIyb+PMBr8@vger.kernel.org
X-Received: by 2002:a05:690c:c90:b0:6ae:e4b8:6a46 with SMTP id
 00721157ae682-6e2a2e47f90mr64480937b3.44.1727963181650; Thu, 03 Oct 2024
 06:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003131642.472298-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241003131642.472298-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Oct 2024 15:46:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVknArz3W5XhPVj-ZGCu97SWyf2EqHhJRXOg6pJ1=tF=w@mail.gmail.com>
Message-ID: <CAMuHMdVknArz3W5XhPVj-ZGCu97SWyf2EqHhJRXOg6pJ1=tF=w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Always call rzg2l_gpio_request()
 for interrupt pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Oct 3, 2024 at 3:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Ensure that rzg2l_gpio_request() is called for GPIO pins configured as
> interrupts, regardless of whether they are muxed in u-boot. This
> guarantees that the pinctrl core is aware of the GPIO pin usage via
> pinctrl_gpio_request(), which is invoked through rzg2l_gpio_request().
>
> Fixes: 2fd4fe19d0150 ("pinctrl: renesas: rzg2l: Configure interrupt input=
 mode")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> Output before this patch on G2L/SMARC:
> root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctr=
l-rzg2l/pinmux-pins | grep P2_1
> pin 17 (P2_1): UNCLAIMED
>
> Output after this patch G2L/SMARC:
> root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctr=
l-rzg2l/pinmux-pins | grep P2_1
> pin 17 (P2_1): GPIO 11030000.pinctrl:529

Just wondering: is this restored to UNCLAIMED after releasing the
interrupt (i.e. after unbinding the ADV7535 driver)?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

