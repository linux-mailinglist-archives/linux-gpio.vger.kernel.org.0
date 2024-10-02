Return-Path: <linux-gpio+bounces-10750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF398E38C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 21:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA285285C82
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 19:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20B6212F1A;
	Wed,  2 Oct 2024 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="BMFrkAZM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C905157A6C;
	Wed,  2 Oct 2024 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727897834; cv=none; b=izZMOWLaSIJflopj1lTsUca0BhuS43k6WPu9VNh46xo9aTQPThanem4gFMpD4r6bCoj+rUHte0tCizrGfZW8GPedOReIU9ma7I7Rd5b4TSBOJmENQIA+3QK93so7VOXTe925stUfpCb7Xd+gKhuIytJaEk222tbaNoyslHvcX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727897834; c=relaxed/simple;
	bh=RoFKBVRxYfTHWfBz6uS38ckS7VuXYibcgS/2JavRY7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCNYXT2G5t0HSd0tIM7RlJc7haH9yyGbYTHZQpdvXMiAOb/Uw9z6bAR2QNTDivJ19j2dU4G6riSWYsirXZgb+yQB8VaDomWZcnQuUQ4EnErsQOEGOkiO/Wm+pE2oouszX/zoeLrwxMCCmQfBb2YrAzRfyIA2/uVg9ct1zrgmmOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=BMFrkAZM; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1727897824; bh=RoFKBVRxYfTHWfBz6uS38ckS7VuXYibcgS/2JavRY7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BMFrkAZMQg/Uxb/7vcM4o7BbiH+chLwVFy+EHYXuy+i1aL+Ym2XwSZtj4pEv6yTuY
	 E1VHLcL0qaaQE4HonN0nDjrHmlPAJUEjZO2tlPnfNpZrpd9qtbRyfT4On7ppjMoYsH
	 PCeEtRvCO5BXUMpUXs62y5SA4bhom53lY2cL/LzNvX4kldDNdooyPfKoXhTSK4dWxR
	 eFtC3TuZwDfxSfZ3aLKMgx4Wix0AY+nJgJjGnvK15WxwJCgLxSTFOr0nYhvUPAKqPw
	 GBmldsRIiaMjpbqlTWwD/zKQilAbHs74x/ovUEjltOwUo8UXewvrK02vWEefcWmH4l
	 DNlqkfwS5ehiY0X1yIQwLkA6GLCcMR1fpY8IRJCWg3SwnEPlN9pLd0McatOsoZSiFC
	 xJfnGehxadjFaK9Gs+O7Ib8nKKkOuJesfbh4T8+jtUaAkKhL7fOPQHqhW3DLvnWCzq
	 FNlGuxcdtBDwV99itYAyW3FHya7oQpoEqGL5crsJGQF334t1ZzSl++drGiK7Yk9f6A
	 SFFoGwUYYf8DG9b57SeIdcwg5agVDrGTJ3ZE8aOqvCkPAmJpV+2j9VRNZastgS8Glt
	 GyMxQix/SC1J5wEqMjPBuPrZnKo7GFDdCf2A/mq067rACCL7SLI1Zv6oIeXNZldj9d
	 KYBhB3vYrU4qWpT2wIJVXstc=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id A8660168387;
	Wed,  2 Oct 2024 21:37:02 +0200 (CEST)
Message-ID: <87770518-5f63-4adf-b6ea-c7f92b58ce22@ijzerbout.nl>
Date: Wed, 2 Oct 2024 21:36:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
 <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Op 30-09-2024 om 21:50 schreef Drew Fustini:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> Add pinctrl driver for the T-Head TH1520 RISC-V SoC.
>
> Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [dfustini: use thead,pad-group to identify the pin controller instance]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>   MAINTAINERS                      |   1 +
>   drivers/pinctrl/Kconfig          |  13 +
>   drivers/pinctrl/Makefile         |   1 +
>   drivers/pinctrl/pinctrl-th1520.c | 907 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 922 insertions(+)
>
> [...]
> +static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
> +				 unsigned int fsel, unsigned int gsel)
> +{
> +	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
> +	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
func can be NULL after calling pinmux_generic_get_function
Please add something to avoid NULL pointer dereferencing in the next 
statement.
All other callers of pinmux_generic_get_function have something like this:
     if (!func)
         return -EINVAL;
> +
> +	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
> +				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
> +				 (uintptr_t)func->data);
> +}
> +

