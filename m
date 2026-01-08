Return-Path: <linux-gpio+bounces-30293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9174D05839
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 19:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E23683032594
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 18:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0171E2EC558;
	Thu,  8 Jan 2026 18:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ie518sbw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D1D2EC553
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 18:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895479; cv=none; b=eEHiuMjShld0AcuMoc3ZbqqSJzH/CB4gWmI2b2UJ6rOtwylmgtf/UeQIigGd/4wndSLg8fqi8mrizyulLDRy/gX6srY4EsrnpQ4J+SaDckx3/SH5zu/ox3d2l4FV1UZMP7cKLrz49qvXfUCmwrY3MokCa70Q+1QqX3HVZ0/IIdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895479; c=relaxed/simple;
	bh=Ft/A8hWSgMc15FoFEXLCHrplBht3yr5qHqlp3RAyNPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unFcCNdFEEvyfQDeZbj30SjEcTlfv37lrYGvfI2qPS2Jj8/5TrYwe4zkV3dyeYwCs+nnHtBa07AildN/yNdDB02x9alKeUvOJsOpZEe8B7PMy/qFb4616UKykobDaxLXLV5H3lI6C9inTdaMZ1cJNgteT8TG+5Jpoi9CVYAxB0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ie518sbw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E0CC4AF09
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767895479;
	bh=Ft/A8hWSgMc15FoFEXLCHrplBht3yr5qHqlp3RAyNPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ie518sbwXlFM96QDqk1hmmbaMCO5TZ9WJOs6sYvZ3IW0J8kkhfgmAoM6JP8DwrNRl
	 qVSQz2n4iwrRqhVVSqZ1Qwev/dY1Uze0l6ZqC+Y+6+WZ1t/UoaulSG6hwev8zCul/u
	 T+dbveuvdmeLpU0TRe0UA2v3qtW+LUJPNAtNUdJRb1QNXD9PiO2ImPferzitsM5LBm
	 GjsoCqzJiagIEwegS92OgNctp6WLV/ITIfBpVsA6mPYOAI/MgOuU45AG7cuFncJ6Fz
	 tTXn3JThBK0JX3KH3DZWTWcn3isTmK6wSZQRXWgBkjQetR155Kzfv/UAmUrhwnn6c/
	 5yOsIHpjUJb2w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b6c89d302so2532282e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 10:04:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlgm/aSMWa8iK/RnoZCYlBDJWNOyl+m09XBgXW8yB0WaluXJhegesqmiYSawPh7okejsjN/wAX70MI@vger.kernel.org
X-Gm-Message-State: AOJu0YzGo4kaus4GFU4E1LXQD5FMJYmVh6wsNDaIPBu/cYzhq2r0G47j
	lBh9GsYycGawGhe4OC6FerLSG2k1xzgb7CZpXx9Y+oL3RWCAeXsDw4LItHIxW9bCjKZ3/Veb89x
	5saEi+vZ8plNQPRLXUBInyydwZubM4u62MDIi9EJ9zw==
X-Google-Smtp-Source: AGHT+IEylp8rOLigBqQmnrBpIWQflwhGH3IkA/PHCIwbo0f7PPadeXyH/mRVwCiCCqhEGodItOK3rf2KUvikGP2bz1M=
X-Received: by 2002:a05:6512:3b11:b0:59b:7319:3b6d with SMTP id
 2adb3069b0e04-59b73193be6mr2005079e87.27.1767895477199; Thu, 08 Jan 2026
 10:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
 <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
 <0bce9429-1cff-4a62-bdae-57697daf2920@sirena.org.uk> <CAMRc=MeUBhDqQWKqSbRP+bpBcc0Xptdgdj9CMfOzJmgqARJMDQ@mail.gmail.com>
 <c0ded9d3-b9b9-464c-81c0-63e0ebdc0194@sirena.org.uk>
In-Reply-To: <c0ded9d3-b9b9-464c-81c0-63e0ebdc0194@sirena.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 19:04:24 +0100
X-Gmail-Original-Message-ID: <CAMRc=McAkdYc3tg7qTRBxOa3zQw_YygzgK-9Vo3UG2DjmN+Syg@mail.gmail.com>
X-Gm-Features: AQt7F2oqFz99bplEz4aI3K5nojZARYqLakd-DtWqKUbtQ9Q_Uf-hTHAI6LpmNsg
Message-ID: <CAMRc=McAkdYc3tg7qTRBxOa3zQw_YygzgK-9Vo3UG2DjmN+Syg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin between
 reset-gpio and gpiolib
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Aishwarya.TCV@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 5:29=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Jan 08, 2026 at 04:52:24PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Jan 8, 2026 at 4:46=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>
> > > We're seeing futher issues which bisect to this patch in today's
> > > next/pending-fixes on db845c:
>
> > Does the following fix it by any chance?
>
> > https://lore.kernel.org/all/20260108102314.18816-1-bartosz.golaszewski@=
oss.qualcomm.com
>
> Seems to, yes thanks.

Good, sorry for the fallout. There's one more patch[1] that fixes the
issue that actually caused so many people to be affected.

If you could give it a spin as well and leave your T-b, that would be great=
.

Thanks,
Bartosz

[1] https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1-1-5d=
bf8d1b2f7d@oss.qualcomm.com/

