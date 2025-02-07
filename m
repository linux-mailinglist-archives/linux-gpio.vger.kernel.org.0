Return-Path: <linux-gpio+bounces-15522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE109A2BE8B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 09:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FCFB16A15A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD641B4F0C;
	Fri,  7 Feb 2025 08:57:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9F1A4E70;
	Fri,  7 Feb 2025 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918621; cv=none; b=A72Ksd2qQuLwzG4nJKSn++5By+d2eLWStqZ8pffNOwIedCEdngWlA59acwVKhgHApMM9o/KZUiNGAn1SMR3+igAYfSAFJmb/j5KXgbKN3AJhYhnSWN0DmprNjPdx/hbc9t6m0+0+W2I0cCRS6w2kseOOU4xCTvJOKdo/V2+QGd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918621; c=relaxed/simple;
	bh=qdT/29cyc7JB1ssT2HNf6SixytB1jtRpLJC5tR/8pH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q87Drw+7ai7qedwQHJO3rgAOC06BG0C0Nd92YrpvoVzOakModm30jJ8Qi+8nOFhW8G0K7U2e8NeuDuhJ8WmUz+RSbF+3heZZgn3b7BRcbtU9/A0UzO3X68PlL737ocyOrgooxnpKx3UQ30TGpYlqPGeLGpppGMi7oLlSAgGiuws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-867044e979dso295605241.3;
        Fri, 07 Feb 2025 00:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918617; x=1739523417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87zAwDqn4YRpNZcopP/g+d7cMXIfHWmwxzZ93OsCwSc=;
        b=pzvGiWOfnr720wPqV4U5NpETG7oxigksU5Yzh44QuHbM+1ukY2HlPSY9Hdwpv6mx9r
         FlAazpXLplGG7SMy+ZGOgwWa2VXN2+lFZkohzR44Lric44/snmevVOmARlXRc+yOCmBL
         VMK+WtJhvRU4Yu7r+ohnvgTFbDxKsVmftj1S7QIFYrKBKMy3nJm/AL7a/FmziWen3fmx
         jWqgvLbxMVRQeOn0D4bKVGMGY3T9y7tUO91I+BeU98HWFhK7uYFkNOfIUhLJyINzjkVZ
         O2x1gLy8EcBKy2+tnoUfplDDdoIH78CxEVoYs9h9gFkBXdr3ckI2JrB+AzJcTUJlHdi6
         SzGA==
X-Forwarded-Encrypted: i=1; AJvYcCVAnnumOLMWFEU6c6aOKHYhBhovO8kXAcwhdWpQxiPH5YEO9N7WwnW2eC+t0wED8VV3zh5kQ6dL8qTAyjgtGGrl@vger.kernel.org, AJvYcCVNKsc78zsbKyF4purpPKdrNfJcvxvAsKYpml3uuj6QYGjT1wI64ZgX6dNfsvJQY5ZbuMEnkRAv5CviPtQr@vger.kernel.org, AJvYcCWnfQVYojzPMVLBE4REDQE1yBOkW71J8oTPt5xdOvHuwWgtl2CQmIHabN5vvtBEw16UkRKck6Y98qOj@vger.kernel.org
X-Gm-Message-State: AOJu0YwvFmLs6H/mOPlXTQ1+aVl6TIV0275g2cwN/62VlJXu2zg4lVlp
	GMM8dgO+nXK0cqckyDByPStWLqrBSGgBp3M53+IysVfIdhy2bBC0gqVrDz0D
X-Gm-Gg: ASbGncvhf7s+mkgR2VqD9HtdR6mtS6ehGDPbuKfsBKDAocQNJu71bAsn0Yj0xjfyOp1
	iyd7jRKibWoOd1kvTirniP3x9DzF0YH90jOm3zJqmXU3tbDOEheDb/CJ6PL1CREElyqY8pWszq4
	A0k187bbATEsUR3P63wyiyDKvltfmxG5V2bdO1LFU3FMdigKLczHRk1rWXR/Az4xnz7j77UeKKx
	VsxnoV2rQ6+nH+jAxqR/CMF1P9r5B3jrizYkkZED2Tp2kQNQJG7h9Ej04mX8fdzILWCtV+oO/LC
	pyMbsgHoitvLjdeBX35trlH8kUzFt1nZbfFrxLA6LV6MciwecXrhpQ==
X-Google-Smtp-Source: AGHT+IHYF1s3U6smqly/1sjDLk79FxMLI6Ytr+The15rXusrXwotkHkd4AFJB4m+1SxSnFuRdqJFHA==
X-Received: by 2002:a05:6102:94e:b0:4af:98c6:bc97 with SMTP id ada2fe7eead31-4ba85f03c21mr1306012137.19.1738918617516;
        Fri, 07 Feb 2025 00:56:57 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d9237sm514886241.26.2025.02.07.00.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:56:56 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4ba791bcc06so568213137.0;
        Fri, 07 Feb 2025 00:56:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4w9jiFYDIbA9G13B9FmSl1fEkUt17hZEFCEAri/Bo4qZCCSbBvZDejeZwKllk93dvYZ+ogm/U0e0a@vger.kernel.org, AJvYcCVQVXN8dzvgOKuvVzTaydGt77IZppw+1vAg3cqxWy7xHMB3EjTTrj8Ifv6sMA8wnsPy20dYiIYuidldy6Dh@vger.kernel.org, AJvYcCXOsRg3xDM67NrS73zRjBWu5YHbJfVCvAl3zcfailkRqmR6ihmrDbEHV4TsEOVsUlnjQ6g5A31ASnSL9AiV5VZ/@vger.kernel.org
X-Received: by 2002:a05:6102:5088:b0:4b2:cc94:1877 with SMTP id
 ada2fe7eead31-4ba85e4d571mr1335521137.13.1738918616642; Fri, 07 Feb 2025
 00:56:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com>
 <20250203121843.3183991-2-andriy.shevchenko@linux.intel.com> <CAMRc=Mc+obxRPpMWNmSk5Tab6NmwM4gSzoHE8JtFf=k+u23QSA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc+obxRPpMWNmSk5Tab6NmwM4gSzoHE8JtFf=k+u23QSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Feb 2025 09:56:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHnRybYHyx2tOJkc86Bo=p3R9Z8MA1Z9zfqavAD2k4Gw@mail.gmail.com>
X-Gm-Features: AWEUYZljf0IGGMytcBRCTOMEDxbwhlJ-40zK3OAP4RuiK1d2KIt4lu9Kk5amk40
Message-ID: <CAMuHMdUHnRybYHyx2tOJkc86Bo=p3R9Z8MA1Z9zfqavAD2k4Gw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] gpio: 74x164: Remove unneeded dependency to OF_GPIO
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Fri, 7 Feb 2025 at 09:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Feb 3, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Remove unneeded dependency to OF_GPIO which driver does not use.
> >
> > Fixes: 3c7469514dbe ("gpio: 74x164: Make use of device properties")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index add5ad29a673..56c1f30ac195 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1790,7 +1790,6 @@ menu "SPI GPIO expanders"
> >
> >  config GPIO_74X164
> >         tristate "74x164 serial-in/parallel-out 8-bits shift register"
> > -       depends on OF_GPIO
> >         help
> >           Driver for 74x164 compatible serial-in/parallel-out 8-outputs
> >           shift registers. This driver can be used to provide access

>
> Geert: Just Cc'ing you here because you yelled at me last time I
> removed all dependencies. This driver is under the SPI section so it
> does have the CONFIG_SPI_MASTER dependency. I think it's fine to drop
> OF_GPIO here but I just wanted to run it by you.

That's fine, as there is still the SPI_MASTER dependency, and the
driver uses device properties.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

