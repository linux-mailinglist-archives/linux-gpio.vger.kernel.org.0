Return-Path: <linux-gpio+bounces-23190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6CBB02C9E
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 21:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09CD3AE1EA
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 19:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD7028DB78;
	Sat, 12 Jul 2025 19:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WhaAgGSX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F24B28D8ED
	for <linux-gpio@vger.kernel.org>; Sat, 12 Jul 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752348432; cv=none; b=ffARTgtfHeh2xup2l3BBgc52ZK49HzgMKrk9L5uOgUADiC6OoyKMZC7LCoh8Pyh3W8RlqLnQQdLzSlBxiBfenasSDV5201dF3wBtWKYiM5Mrkz7gUN+8PQVmkKOJCA6a0jhJ4Eecl1/DFIT7gYKWkrGTuZaF2xCQQ4+TObAsa1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752348432; c=relaxed/simple;
	bh=/hOKuusE5jMFtwzQjB1VDvpOrtRiFiTDNJiNJFK2Dmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGyQRM6tJpzXe4y7IfcmfSEh2uwvMr4O43EYOtjASRVaCW6HeQVr91uncrpJ+4AZ6QAu906o9PZ3/h/CgIXWZIErf/eDudE0YeWct2/WowsKTHLtaBgaHrKzAVqt5wlNOz3pVJZhqoVtBsKUOzbeRuwkk8/MIBC8jqjAaPT7YbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WhaAgGSX; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b5931037eso23539361fa.2
        for <linux-gpio@vger.kernel.org>; Sat, 12 Jul 2025 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752348429; x=1752953229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmdrDokSvSEbkPXVz0WTUYECUUDrY3dIue4l79myHLA=;
        b=WhaAgGSXAZ2GkhcFDEsP6qj+RKcZn8+l/TjHOEB0rc5PFabu3pbbhJKkKcGNOjN/XS
         x58mToAJHF0fTCi79Km1iUhMdQ+WUraWoGTrV6zDdtnYEbpGEWWOFfyT6KxCX6fc0kJj
         rX/Et2DH8vPoHqnQNHUQf8PRakWhKpNMuI0W5PH3cU4JgL5REt1UEcWVvEgPMZyS6E6n
         Msv1LhhXTSFkn3sCAJ0GXDhVH2/g0xUEaEFG2qcVjCBhSEe1a3qQ08SrV6vv0obAIEvt
         J9SY5jzLcS1zzrg+9ZvcX6/Vq9e5o8fJoRMTDoldYcsHjtlBjezR2yapWFfJHIc4wUtH
         a2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752348429; x=1752953229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmdrDokSvSEbkPXVz0WTUYECUUDrY3dIue4l79myHLA=;
        b=Wd74GKxaWf7SYHvXY2Hs/MezybGlOXFz2DkmVulHiTXqea91keWKOWIdtHIqyUVWMO
         xI6YInah5YZW6ya5/xXxOwfm5mLq4iJwXIA4g66tFug8V7TbvjuRYR9C3emGkykcs9ze
         PO7zZ65R/iKdlJRSjHK0+956vvOFwmWqSgHgJtSh3s0KpT9KiOMPFV5FPNQpgNJmk9GO
         QoPdMs7dYd3AmC5e47GYkQesdQnLf6uaFL5LemQTHMdTrdd3ABXvi0j4sf8kFnRWq3Gn
         gTknYYHN4sElHBIPAqxrb8KPXCfXT86bOhqhUkgeykxXaro/aePvvtDOmvr+yBJOsp4k
         THdw==
X-Forwarded-Encrypted: i=1; AJvYcCV9+A72WYbT5oVSsSCgclU7NZOfl7qlllCqq3oVEJOiDGXw46DnrvxeUwloGbC3b4r5pGUDv5sdSoWN@vger.kernel.org
X-Gm-Message-State: AOJu0YzDlyifUzi7hXfV8poi6zOJBB7KM16fRQJx1lWtECmpunwwmfwx
	CSOuNPzwGDXjrXJ1TO4c4/DFjKxpFqB21u2zEyMWOGd3iJLdkngp0Zmb5rqBP0bMc7MAP6E/dRn
	6rwuvOWuB+G6vwTTkUwlrZ9fRSXGQD4F2abPwrEd6VQ==
X-Gm-Gg: ASbGnct/BjoU+t7NF1h+6J3tVC8LZ9YB79KIj+Z/UnCsTuJ/36PEv+gPFFBsBW1Obfp
	UQowg/7pk28OyjcGUTAY5FzVlBIO2lWi49KlS5zXZ9Ufn8vH91SV02jIkT6YeQLR4SxF0yEb/t2
	CweoxlIGXJlnphFitQFe6yQngho4vbgsmbX8d9ep5moztY2Wr9FOjEZEQrDCKEngwZrGgkvTirt
	VmJYjs=
X-Google-Smtp-Source: AGHT+IEg/39vWPjh633ZUj8UqZLuNkeQ4zJb+DeEXqhdOGqkb2UzJv4loDelR2kMaTSHX23IkdKGCBQxVkP3ySeashA=
X-Received: by 2002:a05:651c:4ca:b0:32b:755e:6cd7 with SMTP id
 38308e7fff4ca-3305509f9c8mr19310751fa.32.1752348428638; Sat, 12 Jul 2025
 12:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710002047.1573841-1-ksk4725@coasia.com>
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Jul 2025 21:26:57 +0200
X-Gm-Features: Ac12FXwfRBs5js5oSquCaRb4DKz10a2pVgF5CqiS_5Na7OWkjOlWh-jR8X6bLJY
Message-ID: <CACRpkdaxAr8i-AByUsxnBmoSNtEDvik3VFvxAzk525GD=pH97Q@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
To: ksk4725@coasia.com
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, kenkim <kenkim@coasia.com>, 
	Jongshin Park <pjsin865@coasia.com>, GunWoo Kim <gwk1013@coasia.com>, 
	HaGyeong Kim <hgkim05@coasia.com>, GyoungBo Min <mingyoungbo@coasia.com>, 
	SungMin Park <smn1196@coasia.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, 
	Shradha Todi <shradha.t@samsung.com>, Ravi Patel <ravi.patel@samsung.com>, 
	Inbaraj E <inbaraj.e@samsung.com>, Swathi K S <swathi.ks@samsung.com>, 
	Hrishikesh <hrishikesh.d@samsung.com>, Dongjin Yang <dj76.yang@samsung.com>, 
	Sang Min Kim <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hakyeong,

thanks for your patch!

On Thu, Jul 10, 2025 at 2:20=E2=80=AFAM <ksk4725@coasia.com> wrote:

> Add basic support for the Axis ARTPEC-8 SoC.
> This SoC contains four Cortex-A53 CPUs and other several IPs.
>
> Patches 1 to 10 provide the support for the clock controller,
> which is similar to other Samsung SoCs.
>
> The remaining patches provide pinctrl support and
> initial device tree support.
>
> Hakyeong Kim (9):
>   dt-bindings: clock: Add ARTPEC-8 CMU bindings
>   clk: samsung: Add clock PLL support for ARTPEC-8 SoC
>   clk: samsung: artpec-8: Add initial clock support
>   clk: samsung: artpec-8: Add clock support for CMU_CMU block
>   clk: samsung: artpec-8: Add clock support for CMU_BUS block
>   clk: samsung: artpec-8: Add clock support for CMU_CORE block
>   clk: samsung: artpec-8: Add clock support for CMU_CPUCL block
>   clk: samsung: artpec-8: Add clock support for CMU_FSYS block
>   clk: samsung: artpec-8: Add clock support for CMU_PERI block

Out of the 9 patches there are 7 patches related to "CMU" without
any explanation or even expansion of this acronym.

Camera Management Unit? I think I'm not supposed to
guess. Is is an Axis-custom piece of hardware? (Would make
sense.)

Please expand this acronym and state clearly that (if this
is a correct assumption) that you are not supplying any
bindings and even less a driver for the "CMU" thing, just the
clocks. (That's fine the actual CMU can come later, but
it should be clear *what* it is.)

Yours,
Linus Walleij

