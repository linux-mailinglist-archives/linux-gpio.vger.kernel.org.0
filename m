Return-Path: <linux-gpio+bounces-5276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F45089ECBB
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 09:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E38051F21820
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 07:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F185F13D292;
	Wed, 10 Apr 2024 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DjW/HCsb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59E98BE8
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712735643; cv=none; b=B1nBsoq9lu1drHAIblgm56LhSSFF0waLbv+o5vWn5q3AlwD6qO8+fMlZVnLI4S3X8Q0vqYPkuQ7oqU9FryRU1JkJW8A/Px3h3w0aGZwiRXYPZCvzjPssCSsR7OmiM2ljn15teT0DfVvBUO/vmn3RZ4Pn0hXsookn/1wt0X3Xb88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712735643; c=relaxed/simple;
	bh=nR0IWHqtkSfIjg+soMmvLFJ4DL/3ZoW8xJc6mrIk52A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFU8dokZHVTmrjmflOReXkvVlPZJNJFx/VyYxtZSbyQi+7NTyLZMgFxlqhw8RMx7r3j34focwWHzPbicwLIbVH7+k5LBaszoNM1KtpJk6pbnYcVW9Wdyhb0zqJIYiWHH1X1+E953J/yrPVf6GvvBK+nWn0gXXOeWMqk7Ji9iL4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DjW/HCsb; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d485886545so112914711fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 00:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712735640; x=1713340440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4oTJnxyJQlNOfZuMx5BC0HCjDFBZT3NKLWCDu+9kCc=;
        b=DjW/HCsb4WumD3VS/JM6nzn+r+Rw38IpA6NMiRcIWXCc7QzSaOPgnFtSb2gPCvNCGU
         YwidsfRxjSEbHtbAtRHzXXSEPKrlOCt2CFu2kEN4Sbduweb5XmzioT4+HDCRZ7JZv3M9
         1Pf6HrCDxrzylTlpNs1RrdpDx/bRuO7XTTyyq98GuGsdqaN/F8tjyDbWLtH2HJ7Fs3P6
         nRFqK5UV8P4oF//PWFGusxc9TUfmw+V/Ni5GQbEFsbS0SLgZNDJf2YU+ZiD9YK3Cajxx
         kN1MfouipDLzOgrtGwwaPOdU27nxbXOnIV2ajIF8b0GXi1qqBQsY54MGpPyD/BQJlk9j
         M7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712735640; x=1713340440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4oTJnxyJQlNOfZuMx5BC0HCjDFBZT3NKLWCDu+9kCc=;
        b=lES7FiZRgZqBgOJ9LJqepVvDKvjDtQtF143h5g4/oi2aNW/c4YEIq/a//cxuBjcS+I
         GTk78pCUTStjnYLqkoZf7PGelNw2fmOcB02wN1TY5BiW+Z9QdGkhTa1cMGVxn5aUseJs
         /kDCdbuBguuO5VmkHwdj7py3GcPnfwxjpy5m5KfZliFyovNO2qjEKkjTCj9qIvf23Zv0
         8sn5L4jXk4dPUL3XVTaV4rmI+oinE+pzhWP+ckUWirEUOgFZxU87lrhjD26s7J2SmAhg
         pnGPJBwA51de5cr8nbtgpFIaFYIp8p8D4Tf+DfERcLroxiR2JN+aTpbsO1mRwia+F5TM
         ZF8w==
X-Forwarded-Encrypted: i=1; AJvYcCX5iz8s0oTDn0WpAkvUlL3c7URzZ4GpIaoOfJneR+6ZMDHFi+yY/iiZ1hO+UE9StIea7z5abLplWJKgQGe9t2uoUnZyG4/UNQOIJA==
X-Gm-Message-State: AOJu0Yz5Kc31gjNKh00hKj1hEpyDPMEw9dZh+hJXHzRvARmfw+8hJWiW
	5kw2wdJxvHTz56pWLkZ4nV8QFRR/yoR6n9x/gMCPtLLs9bRrCM3E/JD8X2Ce9/kpBjobUKidLSd
	RyPieqH69E61s2VqqRBZMKYarmTQJfpL7413VXg==
X-Google-Smtp-Source: AGHT+IGIKZ5T4W3tveinr9vgbenPXBsr0YQOdk5u+mjRMfPQJMHDTGs3QF62Fy/0ZG+iXT03Gt4XItI5HLkRyx2Wmuw=
X-Received: by 2002:a2e:8e93:0:b0:2d6:f5c6:e5a1 with SMTP id
 z19-20020a2e8e93000000b002d6f5c6e5a1mr1536198ljk.12.1712735640058; Wed, 10
 Apr 2024 00:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409093333.138408-1-brgl@bgdev.pl> <20240409093333.138408-3-brgl@bgdev.pl>
 <20240409125551.GA69328@rigel> <3f31c7bc-de8a-4552-ba48-4432b335f413@igl.se>
 <20240409160516.GA211845@rigel> <CAMRc=Md3U=sEypUOSzSiWwQasOxqLn1LGCCHE2fUU5ohnCkKqg@mail.gmail.com>
 <20240409233747.GB3000@rigel>
In-Reply-To: <20240409233747.GB3000@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Apr 2024 09:53:49 +0200
Message-ID: <CAMRc=Mem+PaLK+CyWXf3z47U1R4myZxFH5TEj3rmTyqOqHXYSA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/2] tools: allow longer time periods
To: Kent Gibson <warthog618@gmail.com>
Cc: =?UTF-8?Q?Gunnar_Th=C3=B6rnqvist?= <gunnar@igl.se>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 1:37=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, Apr 09, 2024 at 07:24:43PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Apr 9, 2024 at 6:05=E2=80=AFPM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > >
> > > On Tue, Apr 09, 2024 at 04:58:52PM +0200, Gunnar Th=C3=B6rnqvist wrot=
e:
> > > > Hi, Got a use case where a hold period is measured in more than sec=
onds?
> > > > Specifically for a get.:::
> > > >
> > > > I can see a large number of use cases where the time can be hours, =
days and
> > > > weeks. In my case, pin 17 controls a relay that heats water when el=
ectricity
> > > > is cheapest. It is ok to only have seconds as unit but the range mu=
st be
> > > > larger. /Gunnar
> > > >
> > >
> > > I was asking specifically about the case for gpioget, where a long ho=
ld
> > > period makes absolutely no sense.
> > >
> >
> > One could argue that this option doesn't make sense at all for gpioget.=
 :)
> >
>
> And one would be wrong.  The point of the hold period for gets is to
> allow the line to settle after a config change before the get itself is
> performed.
>

One is indeed wrong.

> > I don't think it hurts to support a longer period of time even if only
> > for code reuse and less surface for bugs.
> >
>
> Well that is a complicated bit of code.
>

I'll submit the daemon RFC tomorrow or on Friday. Maybe this change
isn't even needed after all.

Bart

> Cheers,
> Kent.

