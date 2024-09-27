Return-Path: <linux-gpio+bounces-10501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C701D98836C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 13:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DA5BB21989
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 11:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD985189F58;
	Fri, 27 Sep 2024 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oea5qNMT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EDD1891BB
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727437245; cv=none; b=uN/rzuToe5yzOM50c+d3dl8h5I6hvQSJANOcwYcXRXsnqimXAtlbsY4VLT2nSBK4qHWZ/8Dyak6J/8IU944fdT7ROLj3u0UQNoQvw2bHC3XW3+Ua0BOKi/dVAyRM/WoMi6LkaVWyJF9b/N803JvXiy3yc7dUFrUrt6VrphCkTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727437245; c=relaxed/simple;
	bh=4EnKIqPTCw9/4YUSHQg8hhkFTGSTS8hHn8kIFwgcFKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SA5af+g4fCbozCoBVU8vl9VtRDNot+h4KjGj5WJU+XE0cr5S7VkvBi7gdcFDEaQdEPXlXlkiw68e8QzH+SIi9WQ5RSRprDCZpjvPdikGDLJIa/lt1H/S3/vrFEDqg56GKJBDxLGNkObfZOTcplQiYqBeEGVBO5p55xGIiJYsBik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oea5qNMT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53959a88668so780884e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 04:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727437242; x=1728042042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jyze8mrfj5MgD1MFDnxhD4qoqtYWf3ZLVXQmYdjmUJQ=;
        b=oea5qNMTrcwYuJ6FJvNWd//9u+cqoNKuRCZs9dUWp2AIAxflN6qUC7UUVuim8TRimZ
         wRhCb7jZjBbWKonS8nOUWiHAxNI9+aNmg3HIklC5ABwYh2012cVKY2i460JpQc+AvAiB
         LfOrtxJoeqi1SfuzbB1y7eqGytsqZfCDDtUUny91RoOJGlym9+MCMwgQVMIgyKKTrbzb
         7Tj7Hx2jupodMudrIf6p6D+KwWuD7KbhejGI9Bz08MBwj7RacvZT0AOphv8uy3+TlZwi
         VSNrloQWtc7nnM3gIFLTDWVkvVkwibU6ZvayPfRXQzKrTFdWH2i0jScUY2Znd2ziffeR
         AS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727437242; x=1728042042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jyze8mrfj5MgD1MFDnxhD4qoqtYWf3ZLVXQmYdjmUJQ=;
        b=WSmue91v65d3uLeHXyLyUJYqbQd1maIVOGWq97OtMZNLYcSvi7cwck05oa9+6hGZad
         wPeKc7NyEjZBZdaq71Sms0/wNh2E3HZBQm/DeIYQvYux9jeOKq5zgrARZmwOeahfrQGI
         pZ6lPa0gfq+1fuM7jPipU2cxydSa3SBpJXPhA7XJfgyq7vbJvgOFJZioc9kWEZhntCMx
         viwwO0QazbslQHBrpL3ubLQ7pvhLjegGrf93UahrvIh9StXF/RYD9cWm/Psdw4LNn4M3
         3auCN746Ir7aQbtvNZIlFblNLX+AQL+SSV40Q7w3Zu8BkHAJSScXdS5jN5tqOabxnarC
         +2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXDKfLEcxJjYD5MWf7zmg/OKAbAafnAEVwfy1u29u/MbuMF33G8H9hD/t5sS8zlAlT/sexg6pcuPMt/@vger.kernel.org
X-Gm-Message-State: AOJu0YxMPuL03lNgbV7lD08esNUovKlmIluQ4KbLzJZrqpGzJLFeN02H
	cCStlweGG/rLyqNprwJR2G/2dsEZfln2OX00jycFS/3re+EqkNRjWD5zoloPNrnMfZ1WPDYgpAK
	pxqaDeNmHNvgX1LWSipyjZBVQGnq+xjnkNaT5wg==
X-Google-Smtp-Source: AGHT+IGtRNzQlB+uJX1WtGAN3+M1XpMEsrQNdn2urubN2ERKRB+qApxAGpkLDsPz5k8Ppg7OujcBHbAX/spyAdOh2qc=
X-Received: by 2002:a05:6512:3da8:b0:52e:fd53:a251 with SMTP id
 2adb3069b0e04-5389fcac2c2mr1968758e87.59.1727437241472; Fri, 27 Sep 2024
 04:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620042915.2173-1-ian.ray@gehealthcare.com>
 <8d8462da853b6c147e3cdb790b2e3ea7d4aaf533.camel@suse.de> <ZvaYopCACdP-dQIi@852ed68de471>
In-Reply-To: <ZvaYopCACdP-dQIi@852ed68de471>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 27 Sep 2024 13:40:30 +0200
Message-ID: <CAMRc=MffD07aa=caRcBe9B=cna+SXYdJrH4z3b2V6qS1G3Z6zw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Jean Delvare <jdelvare@suse.de>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 1:36=E2=80=AFPM Ian Ray <ian.ray@gehealthcare.com> =
wrote:
>
> On Fri, Sep 27, 2024 at 11:49:04AM +0200, Jean Delvare wrote:
> >
> > Hello Ian,
> >
> > On Thu, 2024-06-20 at 07:29 +0300, Ian Ray wrote:
> > > Ensure that `i2c_lock' is held when setting interrupt latch and mask =
in
> > > pca953x_irq_bus_sync_unlock() in order to avoid races.
> > >
> > > The other (non-probe) call site pca953x_gpio_set_multiple() ensures t=
he
> > > lock is held before calling pca953x_write_regs().
> > >
> > > The problem occurred when a request raced against irq_bus_sync_unlock=
()
> > > approximately once per thousand reboots on an i.MX8MP based system.
> :
> > > --- a/drivers/gpio/gpio-pca953x.c
> > > +++ b/drivers/gpio/gpio-pca953x.c
> > > @@ -758,6 +758,8 @@ static void pca953x_irq_bus_sync_unlock(struct ir=
q_data *d)
> > >         int level;
> > >
> > >         if (chip->driver_data & PCA_PCAL) {
> > > +               guard(mutex)(&chip->i2c_lock);
> > > +
> > >                 /* Enable latch on interrupt-enabled inputs */
> > >                 pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq=
_mask);
> > >
> >
> > I've been asked to backport this fix to SUSE kernels and I have a
> > concern about it.
> >
> > You take the i2c_lock mutex inside the (chip->driver_data & PCA_PCAL)
> > conditional block, where pca953x_write_regs() is being called, and the
> > commit description implies this is indeed the call you wanted to
> > protect.
> >
> > However, immediately after the conditional block, the common code path
> > includes a call to pca953x_read_regs(). Looking at the rest of the
> > driver code, I see that the i2c_lock mutex is *also* always held
> > (except during device probe) when calling this function. Which isn't
> > really surprising as I seem to understand the device uses a banked
> > register addressing, and this typically affects both reading from and
> > writing to registers.
> >
> > So I suspect the i2c_lock mutex needs to be held for this call to
> > pca953x_read_regs() as well (unless you are familiar with the register
> > map and know for sure that the "direction" register is outside of the
> > banked register range).
>
> Hello Jean,
>
> Direction is indeed banked (see, for example, PCA953x_BANK_CONFIG).
>
> It certainly looks plausible that a race between
> pca953x_gpio_direction_input or pca953x_gpio_direction_output and
> the register read in pca953x_irq_bus_sync_unlock may occur.
>
> In practice, I think that this is unlikely to ever be observed because
> (IMHO) GPIO direction is rarely changed after initialization.
> (Disclaimer: this is true for the embedded systems I work with.)
>
> Hope this clarifies things.
>

I'd argue that this is the case for kernel users but you can never
tell what the user-space will do. I think this may be a valid concern
and worth addressing.

Bart

