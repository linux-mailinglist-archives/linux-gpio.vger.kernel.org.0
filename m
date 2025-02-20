Return-Path: <linux-gpio+bounces-16304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 522FAA3DB42
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5A11798BA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFD71F8AE5;
	Thu, 20 Feb 2025 13:24:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC41A8F6D;
	Thu, 20 Feb 2025 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057897; cv=none; b=pkMJ4zzUw/mXHX0she+62nRJSoe3vjnyKbumODwdGnY1Iz1SrqC9k3k72gCk+ExOS5UapquAjWOJ0YZ14/M4iXx+dkxvurvPPkpkcHlGsCphkiqUEMCx4WvCbkqFfUqJCi6WdYdStzQNzKuCYxVTNtexdXqIK9YrSK9fSft2cwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057897; c=relaxed/simple;
	bh=4S/kokfs2M+hLO7xvXIOpnR3Kb18m2Ufc7Fsfw5/c+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4IcgA9TyCs7JJHRF3FVZIrCAvLktwWY2/V4W9l3Mq6zWE7MJ6OZM7KKlkKsFcvQaWUyQyfw3ZhSaC/cKS+o+hvzY+gNl9jUa9n587QH1FoDIK+KfCgcXvO+auIiltsV6eDpHScFjAXvCAgT6c3cYJOG6fpXpiCdkfUybCB9obs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4ba0eb3b0f9so308584137.0;
        Thu, 20 Feb 2025 05:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740057894; x=1740662694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7HV2h0jzFh0K1uqK6Lel58fwsmoRdy+eb+pLMM2vV8=;
        b=XDsDQxW+Zay+IbsRzDGorBrQNfy4tpFeZ93hgHbnc+ae+9nTs4satIWLa/sMqG6mbt
         zFW9cdKm09G2Mupt7mWcDyPU0MWRdD2Z4cty5++6IO6E5JIy2ha8HWif6FPi2kaP8lXB
         zY5Q6Z69KvjZzwm+rLYNlKaQnB8loeYZaaY69v68TAq4Jgp5m5kKXOoh36AP8rFj1iwx
         0DBjjQ/xlOUaa800nvqmX+PkjEIyXEyRdpeYq5bywREof8KKeygtl4pAdAv3pXGj4D1L
         VaBc3FVsO3D0rYkacajsa9zjbxPbMniZXSBSdFPFgiKzHyBXs34MwuVRApxcQk7+5zqI
         6xZA==
X-Forwarded-Encrypted: i=1; AJvYcCXEpcCG0gAN06/+VESvrgT3MvdMOGykloM9VfGJgGflLEZfKxFAhvCtJ6oXaT1u9AxcKpDX+BPcyCmj@vger.kernel.org, AJvYcCXMO82SCxj+youhtt21072IoktaKg/GQMNVQ4JuzbBgJ2TCqdhqKynJlC9cXIf7QfqJQAtS0jTZzmW5isdZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxOmEHi6vkeFoo6G0gie9PdlVQ3theugeeBJ2NAzwth0ldSFUV
	RcTRw2021N3UL5XXTyqkre+A0JIYGRGgSSnrvLXg3SSG+2Opi/LrMA4EYa6C
X-Gm-Gg: ASbGnctV9v88L0gKs1I00Cj28bWNYCbGJmVJed8H4NNs9ZnyUAhZaArwz2FHCQiJsHW
	krWQUWgS9cAi3KabVHgxpVFXFtEQfDIarBblP8727Em/npiuURxV5FBwDXej/Z6hcCmk6uRbQ2Z
	F6IYpSOIcHVQ4iEJORjkRxKUBByF2bfuW2pKU5w33bHNdQWozrPUQumqULLi75VmfJHXfaY4EFQ
	E8vqt3idO4AfykicVM4YsLON5+nJdiPQ1AHqvpoqVPKhO8aNx6jHdq1t1/m14bFP0+QqiLQoTOd
	2JvIvwGUn2ZNTakJ0N5kr6jtNqWNB+mr0TzoY5nTsHlP8to1q4HekhVhdA==
X-Google-Smtp-Source: AGHT+IFj25L+BiHGQ34JaeACDzhHKkjY6XfDwAPEDmH53axbxNo9knHFdbiWIWTF+EuCEPpSI2V4RQ==
X-Received: by 2002:a05:6102:80a3:b0:4bb:c8e5:aa79 with SMTP id ada2fe7eead31-4bd3fc9f720mr14006428137.8.1740057893765;
        Thu, 20 Feb 2025 05:24:53 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be638f00b9sm1857412137.12.2025.02.20.05.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:24:53 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5208736db3fso292431e0c.3;
        Thu, 20 Feb 2025 05:24:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/tt0IXR1GPjAAfXxkdX7J2p8gndz2zsmIw3CZMyZ7NpAkrwrMpGBA/XjYuaTSLsXRlevisdKgz2Av@vger.kernel.org, AJvYcCVTT76JP3BwjfxGQ/QViL4qjIuIRkdyWwRn84JAjQonsEWex9hVR/crasabiRATyaQcBBw3KA6kG21HlaTh@vger.kernel.org
X-Received: by 2002:a05:6102:3e12:b0:4af:be6e:f0aa with SMTP id
 ada2fe7eead31-4bd3fe573cemr13509534137.25.1740057893368; Thu, 20 Feb 2025
 05:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218160333.605829-1-koichiro.den@canonical.com>
 <20250218160333.605829-2-koichiro.den@canonical.com> <CAMRc=MfmG0okVjV1nH78Aw18dFcoOAZ-UwU-iFc1VKb-BVcTxQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfmG0okVjV1nH78Aw18dFcoOAZ-UwU-iFc1VKb-BVcTxQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 14:24:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULzDfdg-7HBk1f-Z+AZ5L2WGUEiPMqtvk+bNSkLb38BQ@mail.gmail.com>
X-Gm-Features: AWEUYZnEUyvkz6-PGkijtGsKAP82ZuwbgMK-ONQvuZoqvpUjaHNaiyoeQgSQm1Y
Message-ID: <CAMuHMdULzDfdg-7HBk1f-Z+AZ5L2WGUEiPMqtvk+bNSkLb38BQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: introduce utilities for synchronous fake
 device creation
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, 20 Feb 2025 at 12:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Feb 18, 2025 at 5:04=E2=80=AFPM Koichiro Den <koichiro.den@canoni=
cal.com> wrote:
> > Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> > platform device, wait for probe completion, and retrieve the probe
> > success or error status synchronously. With gpio-aggregator planned to
> > adopt this approach for its configfs interface, it's time to factor
> > out the common code.
> >
> > Add dev-sync-probe.[ch] to house helper functions used by all such
> > implementations.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1863,6 +1863,13 @@ config GPIO_MPSSE
> >
> >  endmenu
> >
> > +# This symbol is selected by drivers that need synchronous fake device=
 creation
>
> This comment is unnecessary, please drop it.
>
> > +config DEV_SYNC_PROBE
> > +       tristate "Utilities for synchronous fake device creation"
>
> Please don't make this available for users to select, this should be a
> hidden symbol only to be selected by its users.

It is still useful to make it visible for compile-testing, i.e.

    tristate "Utilities for synchronous fake device creation" if COMPILE_TE=
ST

As it does not depend on GPIO at all, I think it should be moved
to the end of the file, outside the big "if GPIOLIB ... endif" block.

> > +       help
> > +         Common helper functions for drivers that need synchronous fak=
e
> > +         device creation.
> > +
> >  menu "Virtual GPIO drivers"

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

