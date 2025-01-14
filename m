Return-Path: <linux-gpio+bounces-14759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A94A1033C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 10:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01F351886AA9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 09:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E5B33998;
	Tue, 14 Jan 2025 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSMgN2Tt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E229F22DC44;
	Tue, 14 Jan 2025 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848021; cv=none; b=pfiHb5sOwxm3uBdaY+JzCr6rt2rR3bju7a/A+zBZz+vJSzsPyAj1NJKysWhY1aWPf/0C++Jwmg3eDCb90lIj5/6EnNj/NYmaeQ7QZWyViA7TPqXIq6bwnHYURqthBziC78/WBjEMxnWpAJvOmnRjo3SLdk/mGT8dq5UoOrIcdME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848021; c=relaxed/simple;
	bh=E+VrihHoR/h4+AypzLacJOvZczQ9U9IhBYbAbtlvTqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHsV/jCaEWaI43VOMeCAEyz8ZJQxma+ufw83kClyBW9mvqHwQU55dDgWdcTaQ9z0ZcF7aIuVA4Uxw7h1JL6gtVt+/aw0Eji151iJ44lumP5LqGIPNWu1TwrUR3WxNm/PyFDDSB67jYjBPpI/geEqL8dn53AIFBIeSvZbCL+ZsX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSMgN2Tt; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaee0b309adso865420566b.3;
        Tue, 14 Jan 2025 01:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848017; x=1737452817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+VrihHoR/h4+AypzLacJOvZczQ9U9IhBYbAbtlvTqA=;
        b=hSMgN2Tt0TIZjpI/MVaeBseceTrHnyQ9gwR3r/jgQPZNlCyJFcRsjRiFInrAgOldCa
         IyYTPhtnyjTnWiA5WyhKesCN9AVeQeW3K51yoX+ugeJSVOPyUmtsr+uWAKZIdbxFyI3u
         RoXTIQruit/2w5+QuBvMtck/fWTkdJNUN1PdguPUGBMK8AmiNK/1BH5Qc7yiy9wQ74aN
         zJ9FRQoNE+200aaifYSIitpZsqLDefpwkLN6avam5yDsqMRsTR6jYeksrZF6ly5it+TC
         l14ZxelJO/y5bi9z2zsx70KqpQyDNz3PcA202RO51awKR2PXxT8koykUVpqymNADe7mQ
         Ui+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848017; x=1737452817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+VrihHoR/h4+AypzLacJOvZczQ9U9IhBYbAbtlvTqA=;
        b=ImBucWy8Seu0fDjoIYbs4IzY9GJXEXPFfq8aZ8DLdKCbBfPnIy7GkP46bZDBSbBQBw
         9EfN1zA9k/T3uWk2XPRvqSHnzqkh/RHAVUhFvq7gR6AZXJoi9+POkhXiSlMezEnKstos
         MDDQIwTJkkt4W2vIwQsa0iFAGGMrTD0qnR45YHfq50OIiZhYhlaxEK5nrYCZsAGA3/bB
         A2hbR2g9w1QC6IlWOWUNvtMJw6EDNvj/b+SAIjGvIO+is7pDPLRUG3a3uqQ9CEKPOm1o
         0EPPXNIMVphJVmHEdwUYtBhw1wsJb/vgcJMEPJHtRXwJ4sh3oGh8t4Gu2lD8HnYZdfPf
         xsWw==
X-Forwarded-Encrypted: i=1; AJvYcCW95x9bsa4TJk7KkPHbd5NxMli1GkXPQ/NCVeBqhUAncVJRHpgD+H0SotLipoTzjgC8k0Gg5VjJ7Fc0RIEN@vger.kernel.org, AJvYcCWy0NcL1sq5fnZJxxYJ/wTbo1OV4QY1rtwISRsGHqg3fugDEeAG+xqOGmGNQZTJZk2bhH0Cn8JVR35v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69K65rka8f8k4ZgzeaNPgEIvi9hJuLjQApQ3ErAoTvn71GFLz
	qmovbFtI8PsV3pCFZN20tG+mVk/DVhiuODPK7WYNhHdpgbi0Ls/QtXmMngt1uXzzGT+rb5yRn1P
	/PdKwKPRiDSMdDK3WkJ0ugI+oTyQ=
X-Gm-Gg: ASbGnctx03MF6bTlsKKCYT1AmA43md6p6uC97RPPoSX52gN68AH7e0nWgf7s8w6+jzN
	dOp44tySigPQyLOZtLpAaa2jRr+FF1t5WPldyqQ==
X-Google-Smtp-Source: AGHT+IFB5/NOc1qfgm0NgEd7l8XNYPb3tMAQ0jaKenktvVwfRG8D82BYAhUkdvtS+fobYNTzvwEa9ghZFQ38VtjGxFE=
X-Received: by 2002:a17:907:97d6:b0:aa6:6c6b:15fd with SMTP id
 a640c23a62f3a-ab2ab6b52b8mr2244703066b.20.1736848017120; Tue, 14 Jan 2025
 01:46:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:46:21 +0200
X-Gm-Features: AbW1kvYvnNBxyhX_hjX1s4aWMd-PZURmFnQFTxH_PiHAl6Q2MCYnAuJKZPMjNzw
Message-ID: <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> for more than 12 years.
>
> Reverting this to dynamically numbered will break existing setups in the
> worst manner possible: The build will succeed, the kernel will not print
> warnings, but users will find their devices essentially toggling GPIOs
> at random with the potential of permanent damage. We thus want to keep
> the numbering as-is until the SysFS API is removed and script fail
> instead of toggling GPIOs dependent on probe order.

While I understand the issue this tends to get never fixed until the
entire support of iMX boards will be dropped. Personally I do not like
this series at all. Rather let's try to go the hard way and understand
what's going on to fix the current issues.

--=20
With Best Regards,
Andy Shevchenko

