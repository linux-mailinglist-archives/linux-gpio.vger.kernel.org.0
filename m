Return-Path: <linux-gpio+bounces-14789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD5CA10B5F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 16:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4527718857AB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 15:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A0E1C3BEC;
	Tue, 14 Jan 2025 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGOzwNp6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629121C1F0C;
	Tue, 14 Jan 2025 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736869487; cv=none; b=h1PiProw/riHwELjcAdmnJqTEdrUsiIvQ5JVVFEkxIPd3QU502Z3JNhkEl2yPlKsPMbcIGv/nUWDlG7PcE1ghYg92SUvNUAbkv5ZIdEEpNmfeZV1z+odgmtB/ihwyjN/+Ee8qEmQCDzLMM9Jm1OxzK+wkBIzwnBrqFEJiNpt9eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736869487; c=relaxed/simple;
	bh=LtubRmGEaJ9lk7gruPEYicCWYL2k020zFZErGoSKgKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZStjzk0pTErcfZpvAEMlXRa7dg0fSyiQt3cdsf1AHpR2+5cHChWL3IlY5dphmW8wSJHk+fGveVHHlgyszEgXrFOxnzy45mgcg1mcN7s7Fn2b82T774VraYmHRU9rN2zpxLD+oO2Kr6HNRYA+yU+um+2r/gGGiG24nrsjU+h5D+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGOzwNp6; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3a1cfeb711so8358060276.0;
        Tue, 14 Jan 2025 07:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736869484; x=1737474284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNi0/jozEuL+9HXocQhbgYuX2QuWiq8swjBKC6BNVDg=;
        b=BGOzwNp6RaMJ/uYZZJobeSScai+IjHVo75LBJ1PfhPMjtdHGaTKpsb6w2WyB42K5CK
         ZrYz20/2z9gVJkZctb0Kzil4j8KsJdA8xproa6k1XF6s6f1r56kbvpHQJ+xaJeJwCeVl
         oTtc44kPdMgGHE1jQ0bkjDc7uexwButi1wrDhEtp5g/NZJZoRn1QZ1oTJRdlmr/1oVSQ
         d8hbZtntFqFylRXKuuRIfmV4q3rwXcmbHKoQXzEsBH9Yi1VPHWQd1xXc1JGEtUMz4EKg
         UqlupXQlph5pWEv368f9+60xfeYFBLAesPCqjCoI35tVVkQtUJTOrDXaXSN6sBHeEhAs
         YOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736869484; x=1737474284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNi0/jozEuL+9HXocQhbgYuX2QuWiq8swjBKC6BNVDg=;
        b=rvuUUo+mfpcYYqbT0r+k+sd9aOFpOsaX30atPVkiBW5vwiMB5Kf+Df2UF0TGozpevU
         8mLO7DFX/QvOMTsGLksINtWk/V2dbbtBwfp/G/mL/5Pvn3ib0KFF3IrUyOPV7PEvOsM6
         v+KrVD9Vmd+RyHKd93YZCbII5+XxEBLnA2i5CmQDSxE2RcY9AGrJS590vWlhcPaWZ8ij
         e6DRaNIZw/1oapgbk68Sh7UHexa50dAs6RkI1KqMR892migKOfA03K9kEv+j3pOjMhTr
         QDjUPzscJDkQlqtq4632cnauTv5e+w7KsShvM6LoHEy8uSDpObIyMuI2pxe8EiNEICNb
         XNNw==
X-Forwarded-Encrypted: i=1; AJvYcCV98ZnipAn/5CEhmvW1QFTdSaZFn0Zxxw41dorjHFgoq94eWDeaZaQdFApNmQ1ysfTCvjKLHzu53Hi5uZjx@vger.kernel.org, AJvYcCXO1vfZ/GaUgmvlH3QXH2895UqiJZZsqQ6b60voFmLpyL0yA9OIHfqcU8K1DLBseWaKhk/4NLHF4q5Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxyDxkOLeGLknTdS9YnlIJArrenP3R5mplhRAcP3EoSCU9e2yrX
	x48qS3U9pvLsydbD3ldlOkJy8srfwVOZVThFbuNarj4pqijN7/Z7GA8J/mrS9ievsntTK7Vzq0V
	D9q3ACU/uAN2pxmKAsubYxiN3Olk=
X-Gm-Gg: ASbGncttunT9NCKSf52dZ4na9DNHTF3pZ65UrGXcXIzsn43xtHVSCksNwFw2uVxEElK
	CKyPwgWoNe8uaTJYBgzCUQciqoCVmwzorRRrXgrs=
X-Google-Smtp-Source: AGHT+IGq6JzjQYkHF2BSm9oBvsJyEMXLtwOGv4ySg90Sw36Ka5oKGJe5o09IZClBJ/ix5XvYAf9so1uuVESwBX/NG8Q=
X-Received: by 2002:a05:690c:9c03:b0:6ef:641a:2a90 with SMTP id
 00721157ae682-6f5312be4bcmr197072807b3.32.1736869484290; Tue, 14 Jan 2025
 07:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
 <20250113220221.13545-1-koute102030@gmail.com> <CAHp75VeLyacKo3rY5iyq+kZnLjEQsBN2eOJExHrqHuesaVyTQQ@mail.gmail.com>
In-Reply-To: <CAHp75VeLyacKo3rY5iyq+kZnLjEQsBN2eOJExHrqHuesaVyTQQ@mail.gmail.com>
From: work work <lakabd.work@gmail.com>
Date: Tue, 14 Jan 2025 16:44:33 +0100
X-Gm-Features: AbW1kvarBylcNkpzCmezAivuMHPavfMZOSRPpngjfHe8_zBdKsBtevmKSFkWr5o
Message-ID: <CAHN=yabQB5jYDd9iQ7s1dMWTScRf3c_zuNtXL8U283+vvenfNA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: mark.tomlinson@alliedtelesis.co.nz, brgl@bgdev.pl, 
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abderrahim LAKBIR <abderrahim.lakbir@actia.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 14 janv. 2025 =C3=A0 10:37, Andy Shevchenko
<andy.shevchenko@gmail.com> a =C3=A9crit :
>
> On Tue, Jan 14, 2025 at 12:03=E2=80=AFAM lakabd <lakabd.work@gmail.com> w=
rote:
> >
....

> > +                             /* Store irq_mask for later use when chec=
king pending IRQs */
> > +                             bitmap_or(chip->unmasked_interrupts, chip=
->unmasked_interrupts, chip->irq_mask, gc->ngpio);
>
> This solution has a flaw. Where is any code that clears this new
> bitmap? The code starts with 0 (obviously) and step by step it gets
> saturated to all-1s.
>

Yes indeed, and actually the new bitmap is not necessary at all
because what we need does already exist which is chip->irq_mask (I
noticed it just now!).
chip->irq_mask is updated whenever a pin is masked or unmasked via
pca953x_irq_mask() and pca953x_irq_unmask().

The solution should look like this:

diff --git a/gpio-pca953x.c b/gpio-pca953x.c
index 272febc..29e8c20 100644
--- a/gpio-pca953x.c
+++ b/gpio-pca953x.c
@@ -842,11 +842,6 @@ static bool pca953x_irq_pending(struct
pca953x_chip *chip, unsigned long *pendin
  int ret;

  if (chip->driver_data & PCA_PCAL) {
- /* Read the current interrupt status from the device */
- ret =3D pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
- if (ret)
- return false;
-
  /* Check latched inputs and clear interrupt status */
  ret =3D pca953x_read_regs(chip, chip->regs->input, cur_stat);
  if (ret)
@@ -855,7 +850,7 @@ static bool pca953x_irq_pending(struct
pca953x_chip *chip, unsigned long *pendin
  /* Apply filter for rising/falling edge selection */
  bitmap_replace(new_stat, chip->irq_trig_fall, chip->irq_trig_raise,
cur_stat, gc->ngpio);

- bitmap_and(pending, new_stat, trigger, gc->ngpio);
+ bitmap_and(pending, new_stat, chip->irq_mask, gc->ngpio);

  return !bitmap_empty(pending, gc->ngpio);
  }

--
Best Regards
Abderrahim LAKBIR

