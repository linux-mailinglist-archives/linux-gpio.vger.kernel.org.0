Return-Path: <linux-gpio+bounces-30255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C14EDD022AE
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 11:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDBFC30E1E4F
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 10:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B1B42A579;
	Thu,  8 Jan 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Ht5H13V/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE85142A10D
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863998; cv=none; b=EXIu/15N+SZvTzLKjsQJVORSPUGbHcmI6rY8A4AaLQ9l8cOj3FRwiSIK/7f9CTQyb6eBRDBmTjqiZa+9JCrCAowizOgLu49Eexkxnij8FSP4MMk8B527cXeoqw9y3V/Edrk1w3bbbbeo6ww18VhfMCVFPZMDSzbsEx1VFO+sAbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863998; c=relaxed/simple;
	bh=Wgj+4sWlbTZiYZVFnmSzlamtzMr5Kpp4tfxxJSWkUUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXdsdkdCCs0c/I6lp6f1k+fHg4jGamv6/YV6UFtpV/PChqCV7lA8xhpRJE1DdvwnKO273wruVazJOF1kF12FklX1YfvpTl3rkF1qkDmYRIE2BLfK7onpdQhDCPz7ybwhCsOKgGT7mZK/JcGcQHztzo0YmMto+d6ToIYWK677pjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Ht5H13V/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so4587286a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 01:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767863991; x=1768468791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSWk+daih+0dcW2IbaUD/x8J5yWGCv5DCL0EJcNKnxo=;
        b=Ht5H13V/j2ufBD7wrDt040WCPHhHlKoy3EaRNbk2wk4ONwH8mQhAjQZKZIFBdpkE3a
         rw/LUDglmzYlu5MSn0bQRsFwCfTKrUAJyIoL72OVPpXN/umopgUnXwjxYP+pSW2Py1pB
         kYd/M+uL7P+uxkpxwAWYaCRxewE6QLCfj7uNXEEz9ilgPkzgo2V3qgvtsp/gHPQ490TE
         zIJ0QbY8yCU7d5nY7zzVKDREzJpObO6dT0gVO8HTaMagqIO3HuTPphz+jMCaYD0VmfMR
         Mb8CWyk2BaqvN1lJ1zA5P4qZBAl3H9YGrST5tlSRQxyVRU2BvFYFcse8vidngX2S4i3i
         flBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863991; x=1768468791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uSWk+daih+0dcW2IbaUD/x8J5yWGCv5DCL0EJcNKnxo=;
        b=TkWPLV22ErUZLxHZaKrFBMm3mve9u3mPlZQkukPkW/5NiCBJlTbDb0n5tuHaLFv1XX
         x49OI6kMlpEX8g3aGZvFVm3i8QXrreuaVOVvKI9Yb5XjQ2elddV1sH+OlqA6kDq7h1Yy
         MENxwQS2NDHbU1F3ceUAnEnEoFguhBhTIBszrPcQkWHFeuGbohokMnn0O31Z5Qnl8xug
         fPPdaaey4OBeDIwnebLuFTY5mYnZHUehjAF8yQ+Q5iM6uIxSXgNr3j1mvLKQk+zoTBA0
         G5ojZcDlwUcNtYnwPMzjK8+TCiHrRc0A5TN2f+4VA85YVihuoeRX03x+d/miZZP/alZA
         fxXg==
X-Forwarded-Encrypted: i=1; AJvYcCWTi/dXByvlZNimyXLxlxI7nHyeeyZF9XpCJQgCzJUpJ1fRMwti5D0cDQuoSh/Ew4U2LM6grp9ZYrQz@vger.kernel.org
X-Gm-Message-State: AOJu0YwtleGuyHEltw8Mp/uWk/zO2xS0K3fsw7/8BTJdeojljxVko2ER
	buKjmM7RfXp5AMCLVlzOPFOZ16TgrgzlAVtYpVCNRZ8kC1oT2+KfC6SaF9AVS8+/bBAwStUtyPP
	k59fwQW2CAW1B+45bxS9gq2+j1Gfd8W5UIqTAvbtW6g==
X-Gm-Gg: AY/fxX5kCDyKkTfsOzV7E09ziTSCcOfNG7AXCTtCy9HmbWw0zoFyVrO9Id4XNnR+Cmr
	4JbM/vnDSVRTWeqP6NSUgE4wVwJdL1zjOKdSwL3PNyfyruelgwdOIouN/g/h+3HQuW6QATc8vzc
	pBu4ygS43PEdjbV+15x2ECyzKrHhc+poT5j2vi6NFpFtaq+FNPfmMLrcm2As/ETz0UA4KODtJzp
	S5OvRuw6wW4Bb+jImlaKCdgHJc7s6FDNaWWoDT2qBmfaPCjf/ysnG2PF8C2MqBUcCh8WBKhEael
	ts6NqPb9AHpkw7c+V4rXBnYeXeuSSBySOKnp2AEE8nOTG/ERvhFs
X-Google-Smtp-Source: AGHT+IE00MHpztfRgchQeGP/f2ooYyVtMi7AyWqnLeBU3CPVoAkxAn+0KTp6fWjIR0AcDJJ7MovQGCEBnq39XJm1UUc=
X-Received: by 2002:a17:907:9445:b0:b73:5958:7e6c with SMTP id
 a640c23a62f3a-b8444c4cf47mr589432266b.3.1767863991080; Thu, 08 Jan 2026
 01:19:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108034217.2615017-1-rdunlap@infradead.org> <CAMRc=Mcows9Mq9UC+307HzdV06zqRLgB9Bz=7igamT8k0mTCEA@mail.gmail.com>
In-Reply-To: <CAMRc=Mcows9Mq9UC+307HzdV06zqRLgB9Bz=7igamT8k0mTCEA@mail.gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 8 Jan 2026 10:19:39 +0100
X-Gm-Features: AQt7F2pA6Juwwhvk4KyqhqdfJPuhWgIYPteS51oqtyXGhnVdp-p4OW84W-x4vvM
Message-ID: <CA+HBbNGdmkyzNqsKAimNZ=PqSaCbDEhwoXk=Yyi5HL657Hb5GA@mail.gmail.com>
Subject: Re: [PATCH] gpio: drop Kconfig dependencies from symbol GPIO_TN48M_CPLD
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 10:04=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, Jan 8, 2026 at 4:42=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
> >
> > MFD_TN48M_CPLD is an undefined Kconfig symbol, so remove its use
> > in drivers/gpio/Kconfig.
> > Drop COMPILE_TEST so that the driver can be built at any time.
> >
> > Fixes: b3dcb5de6209 ("gpio: Add Delta TN48M CPLD GPIO driver")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > ---
> > Cc: Robert Marko <robert.marko@sartura.hr>
> > Cc: Linus Walleij <linusw@kernel.org>
> > Cc: Bartosz Golaszewski <brgl@kernel.org>
> > Cc: linux-gpio@vger.kernel.org
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> >  drivers/gpio/Kconfig |    1 -
> >  1 file changed, 1 deletion(-)
> >
> > --- linux-next-20260105.orig/drivers/gpio/Kconfig
> > +++ linux-next-20260105/drivers/gpio/Kconfig
> > @@ -1621,7 +1621,6 @@ config GPIO_TIMBERDALE
> >
> >  config GPIO_TN48M_CPLD
> >         tristate "Delta Networks TN48M switch CPLD GPIO driver"
> > -       depends on MFD_TN48M_CPLD || COMPILE_TEST
> >         select GPIO_REGMAP
> >         help
> >           This enables support for the GPIOs found on the Delta
>
> I see the core MFD part of this driver was reverted by commit
> 540e6a8114d0 ("Revert "mfd: simple-mfd-i2c: Add Delta TN48M CPLD
> support"") years ago. Should this driver even be in the kernel? It
> seems to be useless without the parent driver that supplies the
> regmap?

All of the TN48M related drivers are useless without the simple-mfd parent.

Regards,
Robert
>
> I'm asking, because with your change, it will pop up in people's make
> config and I've been yelled at before for displaying useless options
> so I'm hesitant to make it visible for everyone.
>
> Bart



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

