Return-Path: <linux-gpio+bounces-10603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3E98B545
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 09:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2494A2826F1
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 07:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4C31BBBE8;
	Tue,  1 Oct 2024 07:15:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008843307B;
	Tue,  1 Oct 2024 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766941; cv=none; b=lrdFtglDaSJd1WuDYwnmqzHDS94q91eN/zbqxYZmYTLbDSduqKa7zPAghNKrU6+vRHQwgbjekLx3WU0wse/6riGVl6O0JpZ8YqoTAvh0ruNvXn1QvPKbjR6/ZGnPhSLXEp4UWYy1yRnK7g9q1LpMS07tdm2AVUvmH6+6bziR9S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766941; c=relaxed/simple;
	bh=lYZMOGe00wcQ7E0o9l0fGqVBBQu4VhUkYZgpHiNT5q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJXH86qcc63YjV/VwtiOyVb0H+5zBHqZy7xO1b5Bx6jl7o5sYt4HEC4DHRuvJ/5H5duElBjNDAI1qyXXDsME74pY8eZLfqjv+7XGVv5mZnKDkfXW5wfJcrHuLlZueAImS2dlDryrCYEIiIMuVhwsR+bGV9iw/t/ZRibhAoYk5sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e25e4023cafso3313908276.2;
        Tue, 01 Oct 2024 00:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727766938; x=1728371738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7FOKhnsCSPjhnW3xt/aqccz+r2uBpJG1OXfNkCG6K8=;
        b=TEqtOhVA5xmIVJ07stpbeYvM2L2X3zu2AgWxLE80BZ8HcOcMQ/mGWMGhxgqLZtmJYR
         C15bYPovNZCPT4UhdpMHg3EIX+COrHF5dUoPc8lbRdosW0MmLF8l96kIdgKotsSIqhNK
         uzc0MPQiBSS79O57rhErKXnynlUww7xh7cILaaBoVM9ZmWSMB8fLvKBA5HwZwTBdiG5p
         Yd2mRLlrKZ5F9JzcdIl0vzqjIxit12fpDHcYz/SSkYGVpE7QDBF9WSfWJFnKK172zo92
         Z2YNHTpem/ZsMcT9S4aNPeZr1c1ADX+SAuB4KMGiEG+bNIHsxZdAF5CT+z71idptTiQg
         GQEg==
X-Forwarded-Encrypted: i=1; AJvYcCVHtp73flEbCCeWERY2FNWssNpOD7etTjBiNIzntdSJFcq+M8sIh4QhR6Odp6oEUjzBQJOQX23cWbWN@vger.kernel.org, AJvYcCVwiwlabnQth0u6PtibmPwift7xlrF3L9TC2jc7z0Ei5qszHRU8zY7TuxixRw5dSYrn3lW2Y53bZVGRg3ANPH5sAk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqbPgWQaachfrA4ptPCCONRUf1r3Kr+grBs3LdZUC3GEAiQchX
	mVCZbOi8BY25mADZmzX60ozJftYO9VXXQff/disAwrC+FFlJ0htpxM2qBfiH
X-Google-Smtp-Source: AGHT+IHsggLxkxr0Uf5t1yJMc2RcZUy6pFdoR68DQJ/3LnyNJvXNUhtv/Uv4V0Ft/C2A+DU0nZbD5Q==
X-Received: by 2002:a25:7b03:0:b0:e25:abb9:ad5a with SMTP id 3f1490d57ef6-e2604b6646amr8884568276.34.1727766938518;
        Tue, 01 Oct 2024 00:15:38 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e3efab1dsm2950036276.6.2024.10.01.00.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 00:15:38 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6dde476d3dfso41242157b3.3;
        Tue, 01 Oct 2024 00:15:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPSImsXF/iYxJEzvxq7/6OTb/mcpQPJ0jqhESte4rC3owMnqYTdRipZpfpJVmWjh950UlWjZ3tesDXEocB0IyUEV4=@vger.kernel.org, AJvYcCUtC0+85pHFrBbcOfMrOx1cjd8mQkzDuRyyKoo7ZAPc1PwQEyQF5YNUmasmHTSt6xJqXiDRobTBnzPh@vger.kernel.org
X-Received: by 2002:a05:690c:389:b0:6e2:71b:150 with SMTP id
 00721157ae682-6e2475d07c4mr92213587b3.29.1727766937992; Tue, 01 Oct 2024
 00:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2862093f7701dcaf29f37c0b2f9268234168338f.1727711124.git.geert+renesas@glider.be>
 <Zvr5H1YR8PEdDTL6@shikoro>
In-Reply-To: <Zvr5H1YR8PEdDTL6@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Oct 2024 09:15:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJ+djCJZnc_f24wB3wuzRKObz+a01L2=PjfDW3KaHZnw@mail.gmail.com>
Message-ID: <CAMuHMdXJ+djCJZnc_f24wB3wuzRKObz+a01L2=PjfDW3KaHZnw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza2: Mark GPIOs as used
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 9:16=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Mon, Sep 30, 2024 at 05:47:19PM +0200, Geert Uytterhoeven wrote:
> > GPIOs showed up as unclaimed in debugfs, so they could be muxed to
> > something else even though they were in use.  Mark GPIOs as claimed whe=
n
> > in use to avoid that.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Maybe also?
> Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Sure ;-)

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

