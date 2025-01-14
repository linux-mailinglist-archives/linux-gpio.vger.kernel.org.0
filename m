Return-Path: <linux-gpio+bounces-14758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 651CCA1031A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 10:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A582160249
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 09:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02270284A75;
	Tue, 14 Jan 2025 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnFMOQLK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E828EC6E;
	Tue, 14 Jan 2025 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736847430; cv=none; b=Vz4ck3imC6wcHcEjwv5xQB2Kwyw91nkMC6SwY9QWynr/jOmXp+rHpzGGfkM7JK5+fOBcIFH7dqqdVwdcxZKE0UZRDX7/5R3mvmOZsLPpILeyRkeG0KjGThhK41UZN5k9dUeioTLO6lVYrrgoMgSvjKh+MFn7uqSNnyLqKlVB2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736847430; c=relaxed/simple;
	bh=SO7CzM2EKxc6gg9BfJYOG3CbGoh61vS8Tk6aBeKiB6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBVAd4rm61E6MlsHuswIA2GdVn+RF5xW1QAe47k7T0KFzSR83kl3hoz0gMRMgLINkMZ9hB5TBqOj2APTPfPKW8/FBp9fgIf8U+91/zj/B9Z0OBpBry7bo7DtZIs0dlNTLXKeENP1qauDCz+XUY2pNRXRlQQFYCf/qQfNM9BITqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnFMOQLK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa69107179cso970581466b.0;
        Tue, 14 Jan 2025 01:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736847427; x=1737452227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVSqr/owyhYJimoSe2jruotwwG7PLxMqig+6Auis1+Y=;
        b=jnFMOQLKUJhhvtBVXQM/h4xj1Wwrm0rjpUy9A992eiycJFRTKAAbOz2Rr1R+CE2GG3
         Ldvjo45xqaeZMnhVsBOG4cbVWFEJHjRm9kHmi5cqNIqyOb1BtXeOlvNs7Dm7FTIs7+Iy
         7XwvvfTptzjs4zvVmpfOnPlQgE3m7H/r3JlcODRNMkyyySM2yl4w9EhVID4ZzF1WxSX0
         k0dSYCgb7+cs3rSiLtGYmlqN3FknFmuaQMTxDiJVSypxF6045G9oyQ8aKWn5BKHWPMdl
         fCEVwCteP00Bjoy2YpiFwX1gJ3Y9CXlKip+//kGhSakWVkHpHm3EyeYB5t02sBIB2Xfl
         txJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736847427; x=1737452227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVSqr/owyhYJimoSe2jruotwwG7PLxMqig+6Auis1+Y=;
        b=V4L4762a2rzMiWSRjIYNTx2XA9q+jGBdcqhx6L/9t6z0tTnnDMKrDKxBCJ8cmIj7PE
         RE/en7GYewvlctjF+a4x+D6sP5UHYSAhFBJ50VZkrcMMm/YOpOjE6XBQAhvQdqxlLBvQ
         PvlhTTwRAF1JMoTv7vEFbZ4St8n5KWvnBmv82vcYHLWyJkHpLy1/NkRX81Dmwt/dcL20
         mYDJtqAMfaVS3t5CsJ5h6+vzl29MaBdJiEVE51If/sl5PKwHjkcJc74OkzEfo1vO5pKW
         iMP/BF/Oa35hfraZZ0lmoeFCcrNHqQdWMW07kLW3lqoQtwHthA8m3GGazBck3h5tF16C
         O00Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOIbm3af8yAlt4i3beoX+Mx/37BuSmLaDuT/Am/eVmGIf240VpzoJ+EzLp0ICOtzenIlikCk3uQRwkpM7w@vger.kernel.org, AJvYcCXSBgIBpUnBYweX3fUvovBh+/LNKe9DeztsjEnVbPH0kpHwMaQBrBHo1pJer11faCKEBDNYy5oe6QDN@vger.kernel.org
X-Gm-Message-State: AOJu0YwY6Pop46UPaJnL+/AUQaIZyZ8NZZ88Qz/B9ztqnxrFfz/2kjeI
	bcli1e2iH22NPiB6n/Gyt66YUOp76KoWc/RBF2Uff/B1rk8onZrjAxAD47XsYl+FRTCT3eyt190
	jaWotJkDVjEBlcePQyy9IKXV+pKc=
X-Gm-Gg: ASbGncufJjpLXy63yU19kAU+7pYRPIiQxqemdGIytGD1OWWoSlz/9Ypj14AmvT+OqLD
	6WgAuLxiYkk8WVq+4M5D+sMe+CABH5w6j6O2kwA==
X-Google-Smtp-Source: AGHT+IEyA8d3S2V8pvW7W8qMP3H2RlhbjQS1owjmto/cR9B3uhpF+VKB0irZtijxsuP2VTTdhqJ6uv27lFiEzAVsYlk=
X-Received: by 2002:a17:907:72d0:b0:aa6:5eae:7ed8 with SMTP id
 a640c23a62f3a-ab2ab66cea6mr2145020766b.6.1736847426786; Tue, 14 Jan 2025
 01:37:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
 <20250113220221.13545-1-koute102030@gmail.com>
In-Reply-To: <20250113220221.13545-1-koute102030@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:36:30 +0200
X-Gm-Features: AbW1kva13i_BMZiNZWMjyBbNW_jwCvD0HhRlgluibBmoCWkMdMR_GUz0UBQwuqs
Message-ID: <CAHp75VeLyacKo3rY5iyq+kZnLjEQsBN2eOJExHrqHuesaVyTQQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
To: lakabd <lakabd.work@gmail.com>
Cc: mark.tomlinson@alliedtelesis.co.nz, brgl@bgdev.pl, 
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abderrahim LAKBIR <abderrahim.lakbir@actia.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:03=E2=80=AFAM lakabd <lakabd.work@gmail.com> wro=
te:
>
> Hi All,
>
> I'm encountering exactly the same issue, and there is indeed a problem in=
 the process of pca953x_irq_pending().
>
> Mark has already explained the issue, but as apparently the discussion st=
opped, I've tried below to add some details to help better understand the i=
ssue. I've also a solution to propose.
>
> The issue:
> In the current implementation, when an IRQ occurs, the function pca953x_i=
rq_pending() is called to fill the pending list of IRQs. This function will=
 accomplish the following (for PCA_PCAL):
> 1- read the interrupt status register
> 2- read the latched inputs to clear the interrupt
> 3- apply filter for rising/falling edge selection on the input value
> 4- filter any bits that aren't related to the IRQ by applying a bitmap_an=
d operation between: value calculated in step 3 and the value of ISR in ste=
p 1
> 5- return True with the pending bitmap if not empty
>
> The problem here is that any interrupt that occurs between operation 1 an=
d 2 will be lost even if latching is enabled !

This is clear.

> Example:
> * Interrupt occurs in pin 0 of port 0
> 1- Interrupt status register read (port0) =3D 0x10
> ** Interrupt occurs in pin 4 of port 0
> 2- input register read (port0) =3D 0x11 --> resets Interruptline
> 4- bitmap_and operation will remove the newly changed bit:0x11 & 0x10 =3D=
 0x10 and the returned pending bitmap will have only the pin0 interrupt !
>
> The latching helps with very short interrupts to not be lost, but in the =
situation above it is not relevant.
>
> Proposed solution:
> In the 4th step apply bitmap_and between the filtered latched input and t=
he bitmap of the unmasked interrupts. This will ensure the same outcome by =
letting only pins for which the IRQ is unmasked to pass but will not remove=
 newly triggered interrupts.
> This new unmasked interrupts bitmap can be filled in pca953x_irq_bus_sync=
_unlock() when an irq mask is getting set.
> Also, by applying this, we can discard completely the read of the interru=
pt status register in step 1. Hence, the only I2C read that will be sent is=
 the read of the Input register which minimizes the time to interrupt forwa=
rding.

...

> +                             /* Store irq_mask for later use when checki=
ng pending IRQs */
> +                             bitmap_or(chip->unmasked_interrupts, chip->=
unmasked_interrupts, chip->irq_mask, gc->ngpio);

This solution has a flaw. Where is any code that clears this new
bitmap? The code starts with 0 (obviously) and step by step it gets
saturated to all-1s.

--=20
With Best Regards,
Andy Shevchenko

