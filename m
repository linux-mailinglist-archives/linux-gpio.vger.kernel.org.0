Return-Path: <linux-gpio+bounces-3744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8440C866818
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 03:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C14C2814FF
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 02:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D68F33EC;
	Mon, 26 Feb 2024 02:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WH+P/+XI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35712D53C
	for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 02:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913909; cv=none; b=hxNT3v/oJhRg2SiFskneqED4+Ehp5rCPKBRcTEAJRZ+iWqXj6MVVUAFe7KWejiQBSdGK459G+FFeQWj8xfPVDK67D1ejm/XBcjawQEn+m1eqWoYlCB3BF4WtGgAi/7kAsRGR+6SR7HwmzFfXQ3ZHrMGCjDDaBm9lwTnBNYD8piw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913909; c=relaxed/simple;
	bh=i2mPfz5hhKBgIesGtEKAqVUGi6/Ok6931Pv0c7OEASk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCSSo5O4D5FOHr/355HKUtYkwtIxTR/jQEMWjqRbdn0JNFoSrGATSHV3dSoSssXXGDl3ebsyV1/IYa+CLXE4Td00i6mqivUF6GK69XAc/eV18qbmWtiV6UTC6SFZT1vSieRtKmeWPgRxZguN0LpY+eFlV6kf2D2D1icPBCF3fyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WH+P/+XI; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a293f2280c7so349664866b.1
        for <linux-gpio@vger.kernel.org>; Sun, 25 Feb 2024 18:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708913906; x=1709518706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2mPfz5hhKBgIesGtEKAqVUGi6/Ok6931Pv0c7OEASk=;
        b=WH+P/+XIp2h6ilpbtuMOTqRRqaPQO2w72Us0Q2K8CPABTn10y9q4KcbvEBFWrO4lsV
         5/gY95p56dBdXeE2cJWh7rukIdnjOeKaLIo4vKecPGb7G7bEO80U59rDM7LS2YPvM5Fh
         5K997Fdr3uzn+st2G4LHX8uTKRm2qBCxr0JTVN2W/1qrLYt1/7uUINinWpWwl+Nc5aVj
         1Okycree+wZ1zGAEwfFPS5rBxFSSe3Wg7arbA+4i4GN50FkS6SlpO3BS3eaAR4RgIUCz
         z10+bwQHY70NxvMtDO4CMHYbqt1DF5+OX9/q+EwejQApnPl0Y8cDHQQ+4pErj4k7dYId
         5ZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913906; x=1709518706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2mPfz5hhKBgIesGtEKAqVUGi6/Ok6931Pv0c7OEASk=;
        b=rKKfW7Q0MNO2zWTllvii5yMwZhQ74jCxV8ZvdYFS5t6qJ9zv+r+CWVgJsyfGq8YZw1
         ScmYV1Qv2NW9rNpKOxQzMlY81f2isFpPsVEgIqO4kKtZ0j9xTuNpzwB11sWRPZbhA209
         fhR1ipzR+4ljtxTSqj8N9/At7atOqNEo3gLd0MooOOSQajEvd1bjLZaA9ufwqtiXub6N
         4qavcjUgMkMoroZiC4rP9QgispAGbRQT2+4jZ6VEwPe2iYvd86bWT2jR5yGEoeDfbQYZ
         1Ud7+gK5xK1mqcF18W+LVLrQARv6w76a6Xv2IhuduWPRwnkWQpacWbzHRYl18Ko6RKVC
         dL7A==
X-Forwarded-Encrypted: i=1; AJvYcCUa9+NHKfe1yC1UGDyHa57aqv4j20devHejKu02WdIZfGXu0hsfspTeHFI1LCw8rx+OdJKOFz6kN6VbdpEP4+Qi80oLF7onfzYPXg==
X-Gm-Message-State: AOJu0YxEpQzFrxdy6VT8llXJtJa7a9Poyth7jF4rAYNb6ahi8yqSh+IA
	9KcJbJUD9bYN6xYioWCLX71a9yJLwFqai8M1WXBgW0uHBzxbCn+2Nxrju28Qjn7eUtXAPoinrgw
	sevml9VMF+PsB7UysVO2OZQGqbaI=
X-Google-Smtp-Source: AGHT+IG4YXMtSR6+Ovg9afTjcqQBhdC+SfOMhUOP9Ekm86AA6U2NO9exkl50Tdv03vNTes7hWhi7L25b46hLMfluMj0=
X-Received: by 2002:a17:906:4f91:b0:a3e:7d36:62b1 with SMTP id
 o17-20020a1709064f9100b00a3e7d3662b1mr3289097eju.46.1708913906424; Sun, 25
 Feb 2024 18:18:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com> <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
 <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
 <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com> <522ab6e6-97b4-472d-8a1e-a495a263dda3@app.fastmail.com>
In-Reply-To: <522ab6e6-97b4-472d-8a1e-a495a263dda3@app.fastmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Feb 2024 04:17:49 +0200
Message-ID: <CAHp75VeSJ62oYBTpt4a80eH3tuyjJ_mRZe=P2w3yKKattmh1vg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 11:09=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Sun, Feb 25, 2024, at 00:23, Andy Shevchenko wrote:
> > On Sat, Feb 24, 2024 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:

...

> > So, the problem is that those architectures do define GENERIC_IOMAP
> > which does NOT have implementations of ioread64*()/iowrite64*().
> >
> > Arnd, maybe you can shed a light on why it is so?
>
> The problem here is that x86 cannot do 64-bit accesses
> to IORESOURCE_IO() mappings, so neither inq()/outq() nor
> ioread64()/iowrite64() can be implemented for it without
> splitting the access into two 32-bit ones.
>
> If you have the specification for the device that tries
> to use this, you should be able to work out whether
> the top or the bottom half of the 64-bit register comes
> first and replace it with a pair of 32-bit accesses that
> work on both I/O and memory space, see
> include/linux/io-64-nonatomic-{hi-lo,lo-hi}.h
>
> > And we have dead code like drivers/vfio/pci/vfio_pci_rdwr.c (the
> > part related to 64-bit IO accessors), which nobody tried.
>
> I could not figure out what that code is even trying to do,
> with its extra byteswap.
>
> > P.S. The workaround is to open code using readq()/writeq() [with
> > swab64() for BE].
>
> readq()/writeq() are not generally a replace for
> ioread64()/iowrite64() because they can't deal with ioport_map()
> type mappings, though the reverse is true and you can always
> replace readl()/writel() with ioread32()/iowrite32() if you
> can live with the performance overhead on x86.

The driver in question by name assumes that it won't perform IO port
access. Perhaps use of ioread*()/iowrite*() is not what we should even
consider there, Linus, Bart, do you know if gpio-mmio was ever used
for devices that want IO port rather than MMIO accesses?

--=20
With Best Regards,
Andy Shevchenko

