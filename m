Return-Path: <linux-gpio+bounces-20054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C857FAB5582
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E358A3BAD7C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0ECF28DF2C;
	Tue, 13 May 2025 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzDc1MxF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D514B28DB7D
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141483; cv=none; b=Sbm1jN7zJzfiFZpyhXqr6zXtdNfkUrAge8rinFji8jIbpHGbFbC6AyCTCBWRksgPiRaHaN+UfbgbjXSxjIaLSKo5h3HaNSrLV6lTvhlwKN6QHau1z44vf0lelRe0ki+i7kLu8qLs/GbFZqt6YNt1CI/2qeV38EeB/ysRT5L9P+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141483; c=relaxed/simple;
	bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2BIZ3fh74FN+iDSGDJV99hlF98y+mRjtUnybwNffu+hDB14gBuuU2Q4W5DQiTuKMen86Ff4isxxe/syTQhEyj2g0Fsralz30MehqEOwiB/QDv0PRwdIg8+LuIPU1Jy9f3a6My7goq1QfxKosbL3m80M/ABeCdsDR3ML97MnFY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dzDc1MxF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b166fa41bso7233270e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747141480; x=1747746280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
        b=dzDc1MxFX9l0eKW09Qiu4n1QLoU2CGDka1JcQKsBBpJReUKrnIrFXwbwyHY/aTt/TL
         GIFigvw6T58hxPtWMWwUvarXLcHwfiaQBHzg5sn2YdOxJyVjRvoy/vGzuluuQeWLFbZb
         x4ndBLz1CN+dyERQLXyTPBMVZZn0Y7yNLPmY8EAZktJzeXepld0iP+lzOxNrSvRN0g4j
         67hqRBd2/H5cr0CZFTUrECADQoqbATyWg69ukw4/VbxuPCIljXltzJ/asDGRTdqWKbmR
         xOWtyZx7Uzityi5uc9NjwVh8O2GTneXbcoZ1k0xMzBaU1NX/biSNTaHOE8UyqGFcUzGH
         2+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141480; x=1747746280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
        b=ElQ82QT3voLvYgA8biU1ItBcyRbUnFCPv6ooXmleELd2/VIcHjsLe7ohFyRafmmK58
         KCW+J/7hIxT6YKfIMLcwDy96jimg8JlOfv5UM5doOXrkl5NzTfu6R67xMy1j5V35z7I8
         +ETMs+QMKYr2c8tnkyQDUoM2UkFpy9B1biUn18UX5AdR5diKNEsjwnVFq1MAfBfnsOWC
         BMEnBoucRgboZk/wgiNF/sSX2AJKebtsP2WXZh+vNUb4fICytPS+u322zBMcs5xtq+kK
         vwuY5lG6Na+cEaxPCRQhxGKPDyNGplyzKagi3YPPHk4mUmDukUH2QwjWHqKpclSP/cjo
         M43g==
X-Forwarded-Encrypted: i=1; AJvYcCU1yWjj1r3EBhIvitPG6mweWoOqeWbJNQGnR9b/g9xw1S3yhEz6O6/wzuCSBrSQNg+GXdTm5B7HqTBn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1GpMhUFYtNjygYnoHahTPjMgC3AUKUBX0Gb8srxVNf7LydsZL
	YdqdhAIzkCsBg9PW/lnf7uZEINgCEuVAXoW6se/HV9jSYkT+bFsySrH9rtF8YTXrQCbxbUEssos
	7c12rYVmAjZDHvBCo8ou5gQL2/lsX0cvaAv8z8A==
X-Gm-Gg: ASbGnct/PumEfADrbaNnESGtoulMD1meuh8+1qUsrPAl76Crd7nnoMz9BdXt/iZCUl5
	wtMawynxItIyKmSLDEoXYWZSJK71jthND0AyoCzkU/SPnvCVKUpi+5uqjK7QuN3lV5pl4Mj9VCw
	JidTptnOCFAs8hsfJVWE7eAkxDxp3zGCfg9WF8VIxWzIM=
X-Google-Smtp-Source: AGHT+IHvP0gooDDmu568VdD7x6FFv8psYcJXM3XY47vCtvEw04TEGbdJAZqsD4ocAj63/kyy4PnOyiTDBOr/SlE5CrE=
X-Received: by 2002:a05:6512:608b:b0:545:1e2d:6b73 with SMTP id
 2adb3069b0e04-54fc67b5d02mr7159396e87.13.1747141479717; Tue, 13 May 2025
 06:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
In-Reply-To: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:04:28 +0200
X-Gm-Features: AX0GCFt0sjPwjvA5EozAKBAvIh0YXGHalZHBo5O9eCpuXVR3ChNSqR-rASM-_dk
Message-ID: <CACRpkdaBrxwWd4JPAJCZRj1Ov8a_6U+idGzi2pnEr4MJ0Eyf2Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 3:07=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.d=
e> wrote:

> i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), a year after
> device tree support was first added back in 2011.
>
> Reverting to dynamically allocated GPIO base now would break most
> systems making use of the sysfs API. These systems will be eventually
> broken by the removal of the sysfs API, but that would result in GPIO
> scripts not working instead of essentially toggling at random according
> to probe order, which would happen if we unconditionally set base to -1.
>
> Yet, the warning is annoying and has resulted in many rejected attempts
> to remove it over the years[1][2][3].
>
> As the i.MX GPIO driver is device tree only, GPIO_SYSFS is the only
> consumer of the deterministic GPIO numbering. Let's therefore restrict th=
e
> static base and the warning that comes with it to configurations
> with CONFIG_GPIO_SYSFS enabled.
>
> [1]: https://lore.kernel.org/all/20230226205319.1013332-1-dario.binacchi@=
amarulasolutions.com/
> [2]: https://lore.kernel.org/all/20230506085928.933737-2-haibo.chen@nxp.c=
om/
> [3]: https://lore.kernel.org/all/20241121145515.3087855-1-catalin.popescu=
@leica-geosystems.com/
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Well that is an interesting way to do it. OK I guess!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

