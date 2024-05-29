Return-Path: <linux-gpio+bounces-6845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1178D376B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6461F24B94
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDCC10958;
	Wed, 29 May 2024 13:19:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD2101C4;
	Wed, 29 May 2024 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988762; cv=none; b=YJtuStkJZ8bPGzZ/AoKjIZ58/pZ7AgtUBygI1uPZ+R22C5Ooh3IGKPqkzKH19W56eav78cLjS+2fN+RXxNxLc2Ek36L+7E0Ty//0DEkQUeTcz+Aa86lqwLRhekEX8BXwn9xK11Dj4bs+u/hgrrFKdWxuln4WyoXcH7YZ88vi0JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988762; c=relaxed/simple;
	bh=m1eNwxHOo0xq5PruMH6TSKX6wAmY5QvLsMPD0jdhJp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABx/skUHQbgTOMT4VsdEV3zery6xbzit6AKlOU036EzZ2vlYCYWIiwuDhi72AwX04DYBs3tUSBPrYEZz4GvvBppmJH5MtyOPD+IK+qhEh+GHzSwbuSgVZgOAvCJfj6gFu9U73AvOGr5dYAvtvhLoDejwbwOt6KPaZ/LzvjQ6z4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-62a088f80f6so8132727b3.0;
        Wed, 29 May 2024 06:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988759; x=1717593559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8k1IGbQ5u070P8JazZPLAom/I0Z76SjM4QN7ew+IbvI=;
        b=BrDmiZNrrcnS15h04YaSEdxsTrPf3/1JwR0GJOIkqqMjbJ8z42wCOSAbZ/WTpdG+cf
         OgSM1Xvp6N190OJmpKpkYaw1wuPnHp6RUw/nHNFHvhvpqzGR29uUUMdqjKlWjqtu7z19
         T75RZD2ITdHJtziouWG+ifU9o+dULzi91qVp4EqXVN8Q76x7USXQ0DafLsVVVYASAtwo
         GTiCg7GeZ/mld4zcgqkkzW+AXZLfwPdkSpq2RG67BNxvp7YgPb0JniTDnOQMKE5Gx3Nn
         GcPoq5A+RblhfciwMWrFktvfqmHpRSUuS4/a0XdQfNAO4om/mOUl6cIoYLKRj35uTQdU
         WeGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTixzLGUZwPILFD/O73rFJkjPsITDhZTLVbMupLpxnHPbUOkO1ji7VWvZRWGiug96vTk133PDTodc+Qd8OzFv2SYCLAsEuVzH/k1KGT/W6CxpHUPfaeD6lg2UHPRHOJw2Va01XzD1GRXS72JcLNnkmMUBX3YnCU76io1a5yzjvFS+1LxA=
X-Gm-Message-State: AOJu0YyDpgTpoElLFIjrkWOH7oAH6q07Dfl+cli+97Mg/kf55wJEzreF
	EphAbK4LI71kvCqqhmX3gO9b1UjZCBz/8uv2SQpEOuYYV4HLSbzU0XA7sF/4
X-Google-Smtp-Source: AGHT+IHQWvWmw6u95qhGpqZCDt0uaZ3TWxTg2fL0mCkBgRuoOxlDMntTjjOTbRM9s6w09/KYrxBk5w==
X-Received: by 2002:a05:690c:c12:b0:61a:e979:427e with SMTP id 00721157ae682-62c5d2cdee5mr15528597b3.11.1716988759535;
        Wed, 29 May 2024 06:19:19 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a5347a1sm24204247b3.114.2024.05.29.06.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 06:19:19 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-df79380ffceso772127276.1;
        Wed, 29 May 2024 06:19:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYQSXTMF8Kszyo+YslexzhbNvl+i3J9aGWATlcGwr27S9a2+tQY7nPSQ77yz47C+y7+zxWcsBenKtmna/wcqWxmABX9SymUdQnUjPSy2czlBUahTg80XIXydpNqpoIlokiQypnytf5y+kvFPAYcf2MJq7q/lx57SIH8iwiFc83v8H2uaw=
X-Received: by 2002:a25:b55:0:b0:dd1:6cad:8fd3 with SMTP id
 3f1490d57ef6-dfa464c41e0mr1389492276.27.1716988758013; Wed, 29 May 2024
 06:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b80d65600641e6dcf00da53ae797f4a40a80e2d0.1716976062.git.geert+renesas@glider.be>
 <ee5798e5-bcc4-4715-9c93-913094160b97@sirena.org.uk>
In-Reply-To: <ee5798e5-bcc4-4715-9c93-913094160b97@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2024 15:19:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUud7=6dK3rUHXKC+qJPJr-vt-AjtxiOBe5ghQYp1viHg@mail.gmail.com>
Message-ID: <CAMuHMdUud7=6dK3rUHXKC+qJPJr-vt-AjtxiOBe5ghQYp1viHg@mail.gmail.com>
Subject: Re: [PATCH v2] regulator: gpio: Correct default GPIO state to LOW
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, May 29, 2024 at 3:15=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Wed, May 29, 2024 at 11:49:51AM +0200, Geert Uytterhoeven wrote:
> > According to the GPIO regulator DT bindings[1], the default GPIO state
> > is LOW.  However, the driver defaults to HIGH.
>
> > Before the conversion to descriptors in commit d6cd33ad71029a3f
> > ("regulator: gpio: Convert to use descriptors"), the default state used
> > by the driver was rather ill-defined, too:
>
> That was 4 years ago...
>
> > I have no idea if this has any impact.
> > I guess most/all DTS files have proper gpios-states properties?
>
> That seems optimistic, and a grep in mainline shows some users but not
> really as many as I'd intuitively expect.
>
> > -                     /* Default to high per specification */
> > +                     /* Default to low per specification */
> >                       if (ret)
> > -                             config->gflags[i] =3D GPIOD_OUT_HIGH;
> > +                             config->gflags[i] =3D GPIOD_OUT_LOW;
> >                       else
>
> The risk here is that we start glitching the power where previously we
> didn't.  This does make me nervous.

/me too

The alternative is to change the GPIO regulator DT bindings document
to match the code...

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

