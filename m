Return-Path: <linux-gpio+bounces-9754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DFF96B33C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ECB1B25717
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1E8148308;
	Wed,  4 Sep 2024 07:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie7egf12"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1D71482FE;
	Wed,  4 Sep 2024 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436061; cv=none; b=D721Apj50W2gUe98qI3kLE/Wyqx+NDKZ+OEBq9NtppTBM4tWquorS++usx/a8fNHCqbifLWNmTu7jOK/mC9Z4CD6qtBWN0QwKduk8iQ2mhx0eyXZJgMBKTJK3EhPbrV9D+oYKHlHn+Jp9ZqiwDbJvJRj2uViZkp4EV1i5PYuGIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436061; c=relaxed/simple;
	bh=5glsy4fj5oiFr495gRqtLldsStL5x4QDUV7Dr6TaYYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmeqtxrUoz+uWVNd/myKh9l2QBlkDfl9yQGrwT30WvV2XlT75rAa0rAIKU99gWx3Ssit7N0EEMICpWvoCT7Q0Wz82rRECTigB63Yu/EEKyVEiUAwD7TauZv/7KQEEldq52+LjdqKy6DEvCCSZT62gNnRTrq2JA+alQgR4YZEiN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie7egf12; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5353d0b7463so10527699e87.3;
        Wed, 04 Sep 2024 00:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725436058; x=1726040858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgqQ4ytDkeYT+let/Ki8TVy0ffHS875kR1D+tJTKOx0=;
        b=Ie7egf1255jtwn50hGma7PCIRr+xyaz298qYilyUbM2Kf1tK9LrHC9tFP9IPcmIcxk
         mYbQmfkG/97RVfkeHVw5hb0+3EKwmTEdrlL37a73z6Xr+d71fO5pNDJLnjt0WgLhW3gS
         nzpt8abTYjJwDC5Ln6UL6ksMHBGADcddskdZ6FgF50zRPgUyGGb3qSuws69HNeP+W3q1
         cAvX7qmAUYTbU0omEM+cgBuUpL8fmkFdSPi6io02+bpNs4+ta3YQclppyXLDWtdS609m
         uEwXSXkKN748O/Us0fKEH4ZoGu4CcBLKLNZjwMSf79Z8zeCPiie0pIOyY1aeHymnH8Gs
         eimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436058; x=1726040858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgqQ4ytDkeYT+let/Ki8TVy0ffHS875kR1D+tJTKOx0=;
        b=Rd6VPWkX3psn96Il8fYJhjMN/3sSqQxh/2aOA1Q1l/7bz16EO1LygV1FVGaQ/uuDZS
         Kuot8wPE+v+QZXAZNfzVsVSHoWiHuqio0u7N+bYzkaEibtdog7728nsGmZgYrBoJaK+/
         Y+KgFahqWUIEraefRBNbj+ZNXrqrzu8D587ZA5h5immrjDXN0aE8DmLy5ADov7Xg6DGK
         BxBwMdzNvCgke/IWxsFByVBG4XkwdQ1/bIOyXmQ9/Gp+ZswMNXK2NDnOSkxhdWIGnRKA
         Y//H3vV8eUKCXeTSYUmPvPd07yz9Q6BUWoHui8rEekUUKR6qj2cnBPiaGjCzeYgjP01I
         VPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlRE/7IaLpsUPdlsqye979qQoxLFFJHzYO6Ej71EIubuj3KCBVG6Bg0d8U2tMKyWRRuLG5vYdkeeM5@vger.kernel.org, AJvYcCXeQJZwAdKzFMq9fNDgXtvo/SpTrFgrg+2cNdDtZReNIa1G8+UvUu0I1gyqb7nGgcROD7NrxHn9zEof4zAl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9i6c+sFMPRYGjyZgsurmWSbfz1P/ACS4X/VKNOvKCB3wIBUHS
	zAKtZPg4g9vj+yLmoq5P0i9PyiFRHyDXTLdxRKpb7C8toIABcoK4X/8TntF8a33fOaFmE8QKR50
	lHU5V9PpldRO/hhh7N3pygx/spMA/gZcua/0=
X-Google-Smtp-Source: AGHT+IHu4NsSSxUEthVjsFF3xhq327k3pHTkvCDsGUcunnugfGusqVQ650t78YDsauYaqkDrSxOCEYm8fAfOhygxcz4=
X-Received: by 2002:a05:6512:281b:b0:52c:ddef:4eb7 with SMTP id
 2adb3069b0e04-53546b38dabmr13156569e87.20.1725436057393; Wed, 04 Sep 2024
 00:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903170752.3564538-1-andriy.shevchenko@linux.intel.com>
 <20240903170752.3564538-2-andriy.shevchenko@linux.intel.com> <20240904050551.GB1532424@black.fi.intel.com>
In-Reply-To: <20240904050551.GB1532424@black.fi.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Sep 2024 10:47:00 +0300
Message-ID: <CAHp75Veb+ycdEVdSPVF7vOE3dcSNVUfPXdDcR35OCo3NPYJPCQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Replace ifdeffery by
 pm_sleep_ptr() macro
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 8:05=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Sep 03, 2024 at 08:04:49PM +0300, Andy Shevchenko wrote:
> > Explicit ifdeffery is ugly and theoretically might be not synchronised
> > with the rest of functions that are assigned via pm_sleep_ptr() macro.
> > Replace ifdeffery by pm_sleep_ptr() macro to improve this.

...

> Can't we make this a stub when !PM_SLEEP?
>
> #ifdef CONFIG_PM_SLEEP
> static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
> {
> ...
> }
> #else
> static inline int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
> {
>         return 0;
> }
> #endif

There is no benefit. It's actually the opposite, i.e. it expands more ifdef=
fery.

...

> > -     ret =3D intel_pinctrl_pm_init(pctrl);
> > +     ret =3D pm_sleep_ptr(intel_pinctrl_pm_init) ? intel_pinctrl_pm_in=
it(pctrl) : 0;
>
> Then this still looks like a function call and not like some weird
> conditional.

I understand that, but the point is to make all PM callbacks use the
same approach against kernel configuration. Current state of affairs
is simple inconsistency, but it might, however quite unlikely, lead to
desynchronization between two pm_sleep_ptr() and ifdeffery approaches.

Approach that I have before this one (and I kinda agree that ternary
here looks a bit weird) is to typedef the function and do something
like

pinctrl-intel.h:

typedef alloc_fn;

static inline int ctx_alloc(pctrl, alloc_fn)
{
  if (alloc_fn)
    return alloc_fn(pctrl);

  return 0;
}

pinctrl-intel.c:

  ret =3D ctx_alloc(pctrl, pm_sleep_ptr(_pm_init))
  if (ret)
    return ret;

Altogether it will be ~20+ LoCs in addition to the current codebase.

--=20
With Best Regards,
Andy Shevchenko

