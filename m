Return-Path: <linux-gpio+bounces-3406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40698857D8F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 14:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F170F282D44
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 13:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFBC1292F2;
	Fri, 16 Feb 2024 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D5B7Hw53"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BFE266D4
	for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708089675; cv=none; b=ZXF1l3vUp62seaxGkY0MVWTwfBPIn6AUzQwsJOYpoG1asVS7fYE+HZXksbWk1tV1x6FhbDBiP32/xhjFTV0QhFnfaVlfgB7grNLZjZjjLiCLISQvOxlgJ8a+/P3Uhr9tDIn31A/IbogDJAZuFkUF3wQPgBNeYPhppVckMlttLos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708089675; c=relaxed/simple;
	bh=udSul/eRgtJRJ6ARIbkr4NL1MgBVE7MGsgqQqJxfgPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcoliYso8LTB4MPBUUXloyTObCbabPGQtKq/FIEbI0PIztXdbO+saSJ9Rs4JvRUCb67ll+UAnjQzg4vghKrnJawTdYlJY9pIxOMzv8/UMr+2gmQ/YbJVZ7lyME8pjo07cNYCUS1UzZsIh76VTkwGlYOYfrYLlJ0HGbeZ+00bz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D5B7Hw53; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4affeacaff9so274758e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 05:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708089673; x=1708694473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udSul/eRgtJRJ6ARIbkr4NL1MgBVE7MGsgqQqJxfgPQ=;
        b=D5B7Hw532AoRkHriohZsnR4IMiOIUAhHjtXgwZuz/OGSpug3sPxDMwt0zCJQ73De9/
         3ZzyAjTphlZh01tivRvDu490p9jK5s1z3gV/3esaABUqeEqebcFvRAr6dJBgCkgDDSI2
         VlnG+a70e1m/E1fxhA1NVoL13AJtaIncnWuxRvter5Nv7BvFL68MTmS5dfQ+R5oysXdB
         AOKHSthxdmpLZfFfjAGI2PXkpoPnVS4fD+GLNcWzME5JC50LfvlF1PlXRQuPTTFxiYPF
         PzT0rlfg9UO0T+4f5UyZDoXMDJgf/Z9EpIvpelf2xzm47aS1Hu3fO2NtqCXus/fDBAik
         tnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708089673; x=1708694473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udSul/eRgtJRJ6ARIbkr4NL1MgBVE7MGsgqQqJxfgPQ=;
        b=PlH8GUoBZqMWAsgHsaSHLUSKickzBHWDv/icuLDcRwy+TKh211s2KIJwXH3qXDzO62
         hObnZXhdp6CQrOMoLkbxJTMYLWhHrxS65uQpzNoZMTInuxZrHnOB8qDHkjeFNb0nY9KE
         9cG9bvs0gLj7zRlRhRmJIno6Kuk5vX6cucI1SQQ5ovmbV5jCusgmZGPaDh5xgrB0fRj8
         pe+60uq7McsWrA6vB4Qrd8qLl6nfd1eZFc2sKsyuIhPWbzK8WuhRvXslc1h+jCMmWU5z
         b0K5iDQFmKC943p0utNGbjPiJbYQT2qYI8Xyz3RoUm8lK3/M4W1Bb5p6fg/71EGvCY4h
         eehA==
X-Forwarded-Encrypted: i=1; AJvYcCXe0NZYrLwQjGfJeRiEms2ZZ2uCLkGhisCcuIWpjmWJcuQhrV5w+5aBk4TQegbr4l92B1yZ+NY4gfxDDzAckl3YY7xz8+QJNPxHxw==
X-Gm-Message-State: AOJu0YwPIIa/Z3yswUQAef7+edw4K9W27Mj/impWvNzYswKGC4Wz4n9E
	vnKLCENpi1hFW90GdvzgiPbNDdg6my6lkqDHYy2WOOhii9qeH43paz175hYWs42tPxi9cHLei+E
	XxUgpmm41Umn5O11RgT2bxf3iFLYyujQ/2yVVBQ==
X-Google-Smtp-Source: AGHT+IE6Rs+3kC/mGaITISiSLYMyE7rbdrnqU0kK14bpT+3x+Kt63SJ4/IF4wI+sIkYlYdvl/LaSiYLL/7AvNsnJzIQ=
X-Received: by 2002:a1f:e043:0:b0:4c0:5e95:b9f3 with SMTP id
 x64-20020a1fe043000000b004c05e95b9f3mr4382436vkg.5.1708089673107; Fri, 16 Feb
 2024 05:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240216105945eucas1p15af2e143fe2090cd33fabb91ff012571@eucas1p1.samsung.com>
 <20240216105930.16265-1-brgl@bgdev.pl> <1542ef65-508b-45be-ad5c-63ad124cb1a2@samsung.com>
In-Reply-To: <1542ef65-508b-45be-ad5c-63ad124cb1a2@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Feb 2024 14:21:02 +0100
Message-ID: <CAMRc=MdCYp=EPe2Koh4NKvKTUWYZn7TRNKXVG39RLYxRxEsiAw@mail.gmail.com>
Subject: Re: [PATCH] gpio: cdev: fix a NULL-pointer dereference with DEBUG enabled
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 1:35=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 16.02.2024 11:59, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We are actually passing the gc pointer to chip_dbg() so we have to
> > srcu_dereference() it.
> >
> > Fixes: 8574b5b47610 ("gpio: cdev: use correct pointer accessors with SR=
CU")
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Closes: https://lore.kernel.org/lkml/179caa10-5f86-4707-8bb0-fe1b316326=
d6@samsung.com/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks, patch applied.

Bart

[snip]

