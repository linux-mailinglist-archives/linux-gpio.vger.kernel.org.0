Return-Path: <linux-gpio+bounces-28761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D497C6F248
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8E6783479F9
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE93735F8C6;
	Wed, 19 Nov 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhdH4gPH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6B32FE045
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560765; cv=none; b=ZkwtZk4pg7je8tiUi4v3T3mzAXNRBPpMbX8sOs5tHo6ySTlCr39cgt8P4xSrOtdqrTQE5zvinIJy72PT6Y3Az4pltO6V/j37E7cercZ+LP5AObjFihB2gXpu4Ocx7Bhne04Ea0dhX9c1h6YnbttGFk6TwfM3n1XGEDaZlb/bsDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560765; c=relaxed/simple;
	bh=/za41zUvsjTNwKhGeH5ufFsQKpXwXaeXVAYiU780DDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpzD93N3mWRsifcyMUPWcr+6YpjeiVWQyvm741izcTiiV4A268IzRADIJJPz5AA7noDEmM/3o6A8vhIQx1y5SNGITtcX80771zRZbu53Nae/RdiAieNIZXX6ZC112ACoN4OnydZ/itiUhmA/cQlaPYKU3antmkjW5iTq5mZdAOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhdH4gPH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b735b7326e5so165030366b.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763560762; x=1764165562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/za41zUvsjTNwKhGeH5ufFsQKpXwXaeXVAYiU780DDQ=;
        b=PhdH4gPH0+6EzH6occOmGLbJy09FqCoD4YcjmumwxyunZSd0m7UH2f1bVcbKS4JDXR
         qwYh/SyyXCHS/GZXAXJVxdXi3GM5YUjjgmHXXm73N2tQgnsyWDlrF066XiYMb8b+Vgr6
         L7p95ee+4nLiaqjnUorCPcpyMJR9akOv8Ilny7QYdNIPFEorj/XeEoM/MzNrgN9SugEb
         isILYvpV/Ix8fN95FvKHdNXGOfYYxUkkab3oGb3fYLy2HmtfteirWgSXQKrYj93bBUbf
         JrKrN5GmRbyG6mj2CDRvzUFbbdtk7L8l5ZaBO1sGcQ8S5Qa63qWJDfNzn6uZAM3HM7+X
         YXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560762; x=1764165562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/za41zUvsjTNwKhGeH5ufFsQKpXwXaeXVAYiU780DDQ=;
        b=nohw7PN2B9CW6dcQBJ+0hx0JJNg+PUm6dj46QiIqJ7wwBUR6LsKt6YLHQs0v6I8Omn
         Hx5vAofObGlMm7yRdHs9AhXvZ1BKzjtQML3ji/E9/2sSBjlmc8UJfebxagzPKmEBSnkM
         xI7g/rbnaZ2qOgPoEyTvzQlt+cuC+Dr0TQCpb6tHwKBvmeBAQHyqXxQKgLRni1LBm2vK
         v7c+5wyyR0bi7EYLMJeVymN32l4Fk6rqtHGaeJia7osy5Cj3fRNhOCXtDpLOHSv0OCcJ
         DD1L9A1ORCD00DEYTpIc81Fo57OeHIgmoZs/P1v46aIBwx5tHmoTioV68ZS0YaJrlLrD
         8iAA==
X-Forwarded-Encrypted: i=1; AJvYcCUdR1bDLNrIj69vQIm+NBiTOsLJQU9k34Q1NdiHUSC91a2SGY6LpwnFpSdEKU/K/4K8FobvPSqP75pP@vger.kernel.org
X-Gm-Message-State: AOJu0YyTvz4fP5jYekZdgFPMgO6Uj2fQ2R3g9Z/P6NIJCO+T/JbBIMrf
	BaAXpak0rWJ54LfStN8QWyPG+h/8Egy4rk9S3xkSaL21Mqik1i/trNf2J7bPv9vI1z+SlKfaNvy
	3+2WsizFRTwU0VEDDtSxSyITQXNK3Rg4dmj1J
X-Gm-Gg: ASbGnctvSpV73CePtOTweciHvyNaHA0kgq/uY/Mouz/wY4wAKru7w3jzlFUL9vAaodb
	b0lND0R0L3+beYfXGf/fom3s2klHAchQDftNrwWjmHVqQJnZJUgoS1OSQlf2uoT5fw4wTksqejE
	tWP7xoSjlxDS6xdCtiIkvs25Qh5HnK9XvEMXlkLNoGwb9e2FwWd0EZe0UYY4nUfezN20VCn2xJ4
	p0nbbivlFokX1HaKRJm5N2dkOSRfRw/AFgR6rgqyoTXPg/co87wKGxrN+KX04ftFX0LcK2v6iVM
	481A6a0FkwOs9YexjyjMesxQl+hXh9T48s7TiD01T5cIHO7zcv9H4TXBuW/DjBIj0AVuGRg=
X-Google-Smtp-Source: AGHT+IG8ULbZ2gakwAe+AEo25vXjOIbyjJHqtq9Z7iOt7eHBk90Bam96Us9dXGPQT1lyjruKv6oC+ZwWggEZWRjTk/E=
X-Received: by 2002:a17:906:7952:b0:b72:d577:11cc with SMTP id
 a640c23a62f3a-b7638d97082mr264614266b.12.1763560761898; Wed, 19 Nov 2025
 05:59:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
 <m2ecpvm20y.fsf@free.fr> <CAHp75Vf=HYugUGDOPdXGaMo9tDLcji0H9ZX7NehN0NoBGYjO+w@mail.gmail.com>
 <aR28aq0xHQOOISYq@xhacker>
In-Reply-To: <aR28aq0xHQOOISYq@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 15:58:44 +0200
X-Gm-Features: AWmQ_bmVZ5aFiHmgx4Eep-EcRGLL1HO2Ewhh8OL2t0SuZRjUtbzyv0Nheh72k40
Message-ID: <CAHp75VfA-N70QY4o=GbB0s0+L_o=+YKgCwdLUK56ggc-tKO+-g@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 3:05=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 09:56:12AM +0200, Andy Shevchenko wrote:

...

> I have explained the reason of embedding within the cleanup/modernize
> patch. Could you plz check?

I already proposed a compromise. I like the new PM macros and less
ifdeffery in the code, but let's decouple that one from the
refactoring of the data types. You may send them separately with the
cover letter describing the reasoning.

--=20
With Best Regards,
Andy Shevchenko

