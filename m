Return-Path: <linux-gpio+bounces-6312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CC38C29FC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 20:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4119C281945
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 18:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6142822F19;
	Fri, 10 May 2024 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="trVSDYiL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4149611713
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715366244; cv=none; b=uk+8z5h3EB6LR4n9mSYw9fGG7yvc4YKLGXFuzoOgTuG2DIYTvgf4M0CoA0SjGW9q0ofSLYBLc+YMss9+g0UuQmrus4hdGLyT/v0ilEak5f3Dy5gEYDHf+QZGnZH6fjkS8pGlessA1LLuI2Hgzfhio5hElwpBuDs5sAi3Z1Gs08Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715366244; c=relaxed/simple;
	bh=TVPVV41vcgpeCfHVl0ZhgdB6HnKcIffOIN+q5l9EpU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9A/HxDzyFQZlEtFk8d65nTM+71D/nWnu5iYQ1Lrb/7r/TuSa3+wOpQ6A5+Iff41zh6SiZd+ySkVKv3GJoSMMyc50JcvsrhcXJzB1JxcnLxVxM4P6khX3M9i/hyoCyK8JxEZSHurlY3g4bhvFRceZz3fHmcZkojtea7ceZbUWrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=trVSDYiL; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52192578b95so2654554e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 11:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715366240; x=1715971040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbxfQ07P+AzSTDVKU8DHWUy13TbVvOYw6U+FUG+TGcU=;
        b=trVSDYiLlRvS3YwPmhMH2ehU2O2b3awiK6HyUtHWJgcywQfzHXOnA8YqxY+eaiJIxu
         A8seBgbFEtp4DbOZ22l97BN3MQmYVlDINJFy2PeS+QsNqUgLll/5QLmz4CcbwgDOC0t3
         dSPBLOP6neMxwYUTlcY+Jg7GJ6evDlTVmJpHmD7bUqLaDej8qDYmZWG1l5WNYVzX9Szc
         SRoa3kfVQ5QQhirMcw22g/bl9bcsJL14Fs4l9TAO5I7wW8sWaoROY/6d08XSdkZbVQUm
         QeZziShYY/dFtiZ2ZwAjkaBWqUsS5v5hcM74c4P5VqoQibtPao5D79uO+x5pCI3mFFND
         xCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715366240; x=1715971040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbxfQ07P+AzSTDVKU8DHWUy13TbVvOYw6U+FUG+TGcU=;
        b=fPrqj3MQNoeihmOCZBr6boTX/45ep9cCrHAJdsgRWLnnRCEmoubCLSCnGUX+z81OAR
         sBJ+SClQJ1+W/pb33IKwi3GFK8Jl8gYgoh+VqySD+mhTtT5vRSD1wIjsf7lmHzttJS2T
         ZNm47/KN8/o7VCfG+cPA66ZjpTevT4G8C9xqnrndYW6L5q7sw98Nbo9bikrNAD+78fqF
         M92DvxqzokH3eCGmjfeRQWDwauAQ+nVjNG+HTNH9SZ43YT0xQRkml/u+RotmVbhPJ23g
         lL45mqbqmry3IYMT5reyccn8lYB1S/DPGHmobc0L12wI3Ow9In/rhw9Z145JyBkOZ5Gb
         A/SA==
X-Gm-Message-State: AOJu0YzRECWgt2y1P/pSRA2us4zauF8MHckThgUhXdZQzF2Gpo4LNhZL
	//stZdCMqWqbSn9ZmJS6gP385ysStEucogvsaILFQ1X71AMdRG1qZuThzcyGBOojL4ZABgdBBHV
	rZ66EMBRn1e5NN9er9RHoUjp1vlWrSkvPSQ83FkJbL65xsOgj
X-Google-Smtp-Source: AGHT+IEEw5KbMN0mfLWmT4QNBcaeK89xRVXKm0iHcXeZhPjE17NpVjbMLRrveOWwybGsgF02k4UXLOQL7Yoo/4tVNqs=
X-Received: by 2002:ac2:4284:0:b0:521:e065:c6c5 with SMTP id
 2adb3069b0e04-5220fa71b3bmr1994732e87.11.1715366240251; Fri, 10 May 2024
 11:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507022106.GC26136@rigel>
In-Reply-To: <20240507022106.GC26136@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 May 2024 20:37:08 +0200
Message-ID: <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 4:21=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> Hi Bart,
>
> I realise you want to keep libgpiod minimal, but in my latest survey of t=
he
> problems that new or potential users are finding with libgpiod the most
> common one was that it is way too complicated to do simple things.
> They just want to request an input or output line and play with it.
> They think that should be an easy thing to do, and will completely write
> off libgpiod because it is not - the learning curve is too steep.
> And they have a point.
>
> I've raised this before, but I think libgpiod is in need of a small (and =
I
> emphasize small) set of helper functions to simplify basic use cases,
> like just requesting a single input or output line.  Maybe functions to
> control setting bias, edge detection and debounce on inputs (using
> reconfigure after the initial request).
> The functions would be separated from the existing functions by naming,
> e.g. gpiod_helper_XXX, or some such, so there would be no confusion with
> the existing.
>
> Any chance your position has changed since last I asked?
>

Ugh... I really don't want the core libgpiod to grow... This sounds
like the old ctxless stuff that was awkward and I removed it in v2.

Do you think that users actually use it (core C libgpiod)? I would
think they stick to python and C++? Would providing the GLib bindings
help in this case? We could extend that no problem. Or maybe a
separate helper library linked against libgpiod but also existing kind
of adjacent to it?

Bart

