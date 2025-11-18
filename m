Return-Path: <linux-gpio+bounces-28642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BFEC68A10
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 10:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 4967A2AA04
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 09:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28D831B114;
	Tue, 18 Nov 2025 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="opnsJPdm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762142EAB64
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459246; cv=none; b=nlcDgTcpLbrqlJMfn4bFBmz7d2rWOWGUvbcJjt8Y/GFtCvuwGXAKXu2nOyNC5hAEiFdEnq6QgwCx1274hoaQ2XJt6bBaD7fFw6qlRCJmLEMgbzhZqGEOJDPrynn/N90XU9DMlOwfHwiSbcbe8blUQPomlbyhC04Zvypcqm/kZq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459246; c=relaxed/simple;
	bh=NSDit/mHJlhkuZyhSitu2JvNgHl8gNj+Tf2PzvgTGRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhkow72RlDRwFO2BncQ0DdPRoxv5zdr9547AVdkoBuAR/6Y5A2/01opuLHuPzg5zu8QNUqlkpokZvOKDNtD7V3ExdB+FYMwfoqc+JnxntcioZOUssngLoUxVOb2ktvqFs5UpONb6uhDER5DPqS64G7hIie6TiWq8cqeggFp2oaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=opnsJPdm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957753e0efso5592535e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763459242; x=1764064042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMVWh4fXZBKxZ6isW9HD5sLU8SwmoT7bOn5vyBPfKmg=;
        b=opnsJPdmzhM5tdnQJbfSjsg0bFk0p8LPV66XHrp6enVsUH8qX6ziRRQl7HuZ92SzsV
         V/RUf32TQuAJbpZ5fhfkKphvbG2g3OT0c06HLydsLCwXxcd/8FC4NxesAVTAIYjHGe11
         57p4nQ3sLfAWX6HBI0Vkq5KTlgAr0UbhEMyCNX1EQby8Hp4xGr0eNHRkiGMv9yaXUx9+
         Z9Yl7FuxTHEcbFZcSIENmFvabrxplOyodborRcWFDhwD0urfYzmT5/crdFlR4nUSI9ik
         aKdnDFv6fx59R0jWhxbE+a8a6JFT8efPEANJeSUgRuEYs81jZ4KfWpJVZyfXGj+fHB0X
         kEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459243; x=1764064043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VMVWh4fXZBKxZ6isW9HD5sLU8SwmoT7bOn5vyBPfKmg=;
        b=Ok4vUa/7Wl8WKPg08iXnUxZ84LULanlrraJ7WuA/l5eQOMgp9XDG2I6NNZyjRzoxDh
         dunRXDxf4ilc3MlC4j/FPzvcB4aRgmi57HAwPdLmLk8pNknrAwePaToGpW5Z+FcY4g29
         BpzuTZI41YBQZWs0VfXx/vJ7Tz8sP35WzGQ2Wik6NOUm3EeZnPId4JJXgClnUvhB1XS4
         Z93c+CjuF3yPeShyLWQOHKziFvNXvKIgJq5WSh7PGUBGplcJptF3ZVOdp12lbYiq1HL0
         1CNwdyrm+LwiAo9kc+kbRHdEEE51dIG7HR/gYsJs5xA5u1VIJrDHJKLc9Ub/Lbe3hBJi
         xHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWWfCjxR2afTvFZTJkhZb9YsLqB6XavizhElDCTLTZ2noCP0YA39hs9ZxTIv/jtphLbbjx1kyLbqut@vger.kernel.org
X-Gm-Message-State: AOJu0YyPGrBIcjEPFAwL1wWkk5SoKu8BFGkjMS7txLFk41uhvVMHB9dp
	LrGSy8Wby4fPMHBNPWkVdaTKCGhG0LIgPdddbyfbYg7hdibS6OZPi8kI2UwNQn48leTuSzpRct0
	wCOtQ8L9zHyMFcPSA1Hmmbs8dCkDDmO1ymFpxwiAIYg==
X-Gm-Gg: ASbGnctTDdpq5tyRAUMKkkK2HJnbvjaStZmha3iFWhCK6acIq5/2StAQXdPHjA9g48F
	zTV/Eo7ImPLFUCNRXGdtWhrdTSQFLLc3hhu/VtyPEB6aHGJDCc9rZ/pOePR3l4QZNaGJGGGGTLt
	0Iy6J6BtJs8TCAnoM8CYtvNf/D6EDqMKgOhxtRLZQzlfXn/wdRv52c8XoxEgjGgtDey/PVxus8F
	cJgIMb9Z+RA0PJyCmUkOFkCNs6vMC7VCVwS3FhRARPtoeU57BwsJ5rtaXLLWUzxAelBNhje8d89
	n74YSXHwQAjw8ndd0B05TPLj8lUa3ecR0Fjk
X-Google-Smtp-Source: AGHT+IEKSj2qpQvKe0IfkTOGZF1jV6/WKVJLO2A/Txv4rPC3yDvwMdMydDTZhNC5mLXfB6q+qgnbPN4NmYCtJAA3Qgk=
X-Received: by 2002:a05:6512:39cd:b0:594:4b55:d2dc with SMTP id
 2adb3069b0e04-59584217be0mr5314684e87.47.1763459241858; Tue, 18 Nov 2025
 01:47:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org> <202511171230.F83EE85D0@keescook>
In-Reply-To: <202511171230.F83EE85D0@keescook>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 10:47:09 +0100
X-Gm-Features: AWmQ_bkhi1H3-46xEmuP3pqCgeKjE8VDjqsBb0GhCZL7ntExaLQpYRSDFU-8VEY
Message-ID: <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] string: provide strends()
To: Kees Cook <kees@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:33=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Nov 12, 2025 at 02:55:30PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---

Hi Kees!

Thanks for the review. I already queued this for v6.19, so let me
address the issues in a follow-up.

> >  include/linux/string.h   | 18 ++++++++++++++++++
> >  lib/tests/string_kunit.c | 13 +++++++++++++
> >  2 files changed, 31 insertions(+)
> >
> > diff --git a/include/linux/string.h b/include/linux/string.h
> > index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..929d05d1247c76eb9011fe3=
4250b487834b2d3c9 100644
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -562,4 +562,22 @@ static inline bool strstarts(const char *str, cons=
t char *prefix)
> >       return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
> >  }
> >
> > +/**
> > + * strends - Check if a string ends with another string.
> > + * @str - NULL-terminated string to check against @suffix
> > + * @suffix - NULL-terminated string defining the suffix to look for in=
 @str
> > + *
> > + * Returns:
> > + * True if @str ends with @suffix. False in all other cases.
>
> Maybe added "empty strings never match"?
>

But they do, please see the test.

> > + */
> > +static inline bool strends(const char *str, const char *suffix)
>
> These are required to be non-NULL, so we might want to consider marking
> them as such with the "nonnull" attribute. We don't use it much in Linux
> yet, but I do see a few places.
>
> e.g.:
>
> static inline bool __attribute__((nonnull(1,2)))
> strends(const char *str, const char *suffix)
>

Ok.

> > +{
> > +     unsigned int str_len =3D strlen(str), suffix_len =3D strlen(suffi=
x);
> > +
> > +     if (str_len < suffix_len)
> > +             return false;
> > +
> > +     return !(strcmp(str + str_len - suffix_len, suffix));
> > +}
>
> We should probably add it to strlen and strcmp as well. :)
>

Sure but that's outside of the scope of this.

Bart

