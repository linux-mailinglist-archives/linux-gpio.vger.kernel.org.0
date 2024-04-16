Return-Path: <linux-gpio+bounces-5566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D698A760D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7A2DB223EA
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74D456B7A;
	Tue, 16 Apr 2024 21:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cy/srKnT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9029544C6B
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713301357; cv=none; b=WSxMdymmG6zFHyNk/LF7xNsxtpy6Yu5cSfXTyxGwzdctRM6bmAvtKiUtf1E2sQvHVR6IYNoAYwhUgtJmqUV0Ek00ph8L6Z9SocgbAvDZK7oXCbDMchJrNp9sAqYVRUKiclpySryDEaQlvDw+zngdze4RUMjO558hg9dKIOyqGPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713301357; c=relaxed/simple;
	bh=Y3PiYdajtSJ8+vbWrJQzzQVEt4RNTSDwZUzpv9kM6cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N96lIiEihLPIKjt1GdKYvVfP+kskENpSG54qo/BsAzzUPwUCvjyEqeUhx4AofvJOsfBjvhVc41WLB49bGdv8PO9hoZ0T2mpInZl0104VXEPd5qnEcFhgbDzdJNb97IBO4nsqAAx0xjjPVCLqhlviMg+xuQ0Ua1Rz+8HsfuFDNSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cy/srKnT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516dc51bb72so5544376e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713301354; x=1713906154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3PiYdajtSJ8+vbWrJQzzQVEt4RNTSDwZUzpv9kM6cM=;
        b=cy/srKnTA9/exlbx9VSCqhd7DiqfAKncmmTaODP2lH7umiPcD6OL8KUyeau8jEaseq
         C+W2iOIT1hGcLQG4TuuOi3lw1WO/35na6UEY6ksMouAQeSm4zRwb6DClBfB+E8/n5axX
         iJ2OI87JF1HT9abBP26elQkD2/5aJtlPUgTirc5CJNePMpIYcpGZ7O8AGzWBLsGADmps
         bCn7oSTGjWXiDoNTL3O7HAYODUENOIqDeuw17hGdSqdjvhpiLE2/b26mYdpv4sMee1/+
         7i8hhD1/O3KtwKb2MuTq2+w9489MoTQId0O2JzXEQO2CYtQ06Rwymzb6KRy0kYCAkd+C
         ZbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713301354; x=1713906154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3PiYdajtSJ8+vbWrJQzzQVEt4RNTSDwZUzpv9kM6cM=;
        b=ps8j48E8YF2oRd+4D7sUy8qB/aY5GQvyRWVR540QaTKx68j+mZeBL2XAVLpod3mZ85
         koDGhRtcMhosLts1GHsEGoTuY+QeDJN2EzyGcThz7FiSm1QK7A01GyPYak1egFAWefgV
         Y4FosIQuD/LHkdy9WN7G8IWZSxKc3M2Til+4KfBHSIh4+TOMvPK62if3nFDQi5zCBjQ6
         EY9tscmo8jZU4fpMhZASWH6/yyZeR6IsCYqpG/P6bCeX27mv27D80Sl9FC+eBMzAWkUE
         jKUbc8kl6ruHAKXDF5vsIog4SscFFb/xjVEUux3cWplMP6kXjqzLzHGo1YQeirt2xKVO
         pJfA==
X-Gm-Message-State: AOJu0Yw/rg87kavzg4sxyhkOSFqLPJ/dcchxEQM97W6khYp0WgLbdZaZ
	ZSOrdO3IpBoviQI8OX2Mr8odIdvZCDP53SqU9rW7Z07bm5zYL1IZXduvB+EcqdxKkgFgcJDiiHH
	GxMcx8tCso4xFuHaN/IbF5djKwAI8rbYM6Y37TA==
X-Google-Smtp-Source: AGHT+IF4nFUNrbrCQfQPT5VQmqdA1ubYu/lagzQpfHVA0pCXhaRUFXY4BH03+ynf3lxmharXyBdryzI7gbpRJWcfurg=
X-Received: by 2002:a05:6512:33cb:b0:518:d079:ffd9 with SMTP id
 d11-20020a05651233cb00b00518d079ffd9mr7829225lfg.13.1713301353501; Tue, 16
 Apr 2024 14:02:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOrEah4J2U6eoyJrUar62y48GsiR8NahJpodkv-V80RRQxQJrQ@mail.gmail.com>
In-Reply-To: <CAOrEah4J2U6eoyJrUar62y48GsiR8NahJpodkv-V80RRQxQJrQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 Apr 2024 23:02:22 +0200
Message-ID: <CAMRc=Mfxq3rLGT6A1HrRaKT2jtf9Ah7Gj3tUwAGzhUv=Lpg4mA@mail.gmail.com>
Subject: Re: [question] Does gpiod_set_value have a "guarantee"?
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 6:13=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wr=
ote:
>
> Is there any implicit or expected guarantee that after having returned fr=
om
> gpiod_set_value that the GPIO will reflect the new value externally?
>

No, this is driver-specific behavior.

> Some drivers that leverage GPIO to emulate buses, like i2c-gpio, may be r=
elying
> on this to be true in order to make a "stable" clock.
>

Well, they shouldn't rely on it because it's not enforced unless the
underlying driver enforces it.

> I was glancing at https://github.com/raspberrypi/linux/issues/5554 where
> someone ran into an issue and it looks like, at least on the RPi 4 platfo=
rm,
> that there may need to be some "flush" mechanism to guarantee that a GPIO=
 has
> been written out.
>
> If it's the responsibility of gpio_chip->set to do this, then I'm guessin=
g the
> pinctrl driver may need to be updated, but that does incur a performance =
hit
> for every GPIO write.
>
> If it's up to the bus emulator to do this, short of sampling the pin, sho=
uld
> there be some API or mechanism to assist with flushing writes out? Is the=
re
> already a mechanism to do this?
>

That's an interesting use case. We could extend both the in-kernel and
user-space API for this quite easily. We could add a new flag to
gpiod_get() like GPIOD_SYNC or similar and maybe provide a callback
for GPIO drivers for flushing the state? Then do the same with
user-space request flags.

In any case, I don't think we can make it entirely generic.

Bart

