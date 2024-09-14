Return-Path: <linux-gpio+bounces-10113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D66BD97921F
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 18:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F37A2840AD
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 16:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6415A1D094F;
	Sat, 14 Sep 2024 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="U7Phdwrv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7721CA84;
	Sat, 14 Sep 2024 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726332054; cv=none; b=j3BPVoSTjOGtYMGHUHb1Q3lodIEHpyhggGywfvwNPVkSt50OUM1DMPwce6UYDVhjk6Oh6XBYp4MybI5TNRXzrSXG8o2jtlUvEQdVjaaOPb+dWZb6kh4pCLVYL64jrfau10Ieh+EXQTOJrqqoJ3YbVcR0/OXqjV4pth4/ZkW8qv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726332054; c=relaxed/simple;
	bh=pUuqIKBYyesbYCq2BGQWblTqXw5i744U0pPDWcwLLPk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=WJNCcu3pFMqdUt2Ijva+UNGSVr60jRG/a3V/HsX+vl0numWARFK9wHQvOfifI+02wYCYmXipbTAioSB8O7gF1PMSH0NwJg+v4p25VQoH6lVn9UjjLWxr6+qHww3SlWDnlfKCDGuA2NKMwWZW1BhwfgaGzRnBxu9kr+x4rw417vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=U7Phdwrv; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726332018; x=1726936818; i=markus.elfring@web.de;
	bh=I1iQlt7ptDaqF8JKc8fXCDkki8rhaNUhW/GfnGYP5MA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=U7PhdwrvkH4UgL8Wlqlcfn90WJ2w7FuqyfABEyOLP1u0x+1rB4WiqikSjjDVW89S
	 oBR5fBLDae3RkgA6uodkPL4ljVHuGbuiuRC+MATWiqQBID0Ps6Nklv4T/0A58tHZK
	 YUQeNoX2sup1/DPl5VuQy7V8Sy3eIEPmigiyjldURohqPCEDzeXqdb3S42ZzbuA/+
	 Yc+A9EDkMlBhqw2M+lNY52Lr/bhs6BU7cPXZDt0JAwFsDr5E+VGSPG+f50qDapyJg
	 cKoVvby2dz7vDZWdUhetOlKN5TcK3AXnJQMwvtBdmBxugHKqK5KyGyqxuYWj+F7Zz
	 +f3PqH7V9U3vj5yo1w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MActo-1siryU1oIC-005HOz; Sat, 14
 Sep 2024 18:40:18 +0200
Message-ID: <65f9ea8f-dd4d-4b57-9c53-cf9a9b475b06@web.de>
Date: Sat, 14 Sep 2024 18:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Phu Luu An <phu.luuan@nxp.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Chester Lin <chester62515@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, s32@nxp.com
References: <20240913082937.444367-4-andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v2 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240913082937.444367-4-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lARcwLAS9l+5uUg/kMPNUy8VqiapmNJy1uLCKPH85pCZvVvUyAB
 iY7WA+e+50fG+K0bjSs9+lYQ98j9yG/IBARvjOvO0yvQdiFteDeeDJOBOAD0HpnGWB0wBBi
 3COTIQzn5raKUdjUs1n7qdAqYbq8TPcPrxQ1A12nEQNk0FcEFuVntZxrBxzlZo6/Zy0jJbp
 wml3j8sJW/41nJZnWUJrw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NhmNzHkgpYw=;5uFG1Xk0bjlMECsLHtlX+DSvDGE
 xz4C3HCKJzzpKaYx2dmvNsYaMpnop1fAIWbt7iTy48nJ3wLF0jc0pqsQebPiXyCHYIbiJzw7z
 ZosnuV9bYoVHROa787t0DGUBRYtoS6fWfkXFXaIGva0u7BvY6qA/MBlofFpsjAb0Rdy01G7ZY
 viezET4IsR9T0WJvSQPMNEuKaJOtUd5BzagsVDtBm0ZkI7K0lnO4dI8E63jCUzBJZobJmGH36
 M4/FNPDvYDowCm10Z4krZxlSrHLOcO7Q/VpsSUlmcBjRUwM4e27L/mLUnw4Q5CH1Mx2z+LuCM
 97peSht2qjIDdTM5kTr2mbtTjVyDMPRRgYHAaKL7JiXmRRmMUojTyB/YjF7JFyPuKvrGJceSW
 LgBNFNIe7e3BwoImzfJwNotPq0JsxSllUgkYWJWztnxv93QmVgRFB29t8rnOPa6LtDH9EmHyB
 nggN2osEHJG9qlr7tkjm1Bg2EBH06eGE0iBLD8BZuGP+hGCEsoB9+9sH2zhj1WxycyZK9OgwU
 XPp/Y3nAIxxnFfL1RTeB9Lkw0MBKL/Ngd8fSrIJVbF40nm35G2igSs9/kelConkZpWTSFhtMi
 LOe63eHTVri7j94n1sfb2t+T+apVnA2FWq/UFqAaohOyu77lB+0wZEvhq+RTSoWX0mG25MIYc
 z6vFwnsgxBjQhBqwOIpVq3sactJrtr4FNZtXriKnz87guIw2Jax+pKPPP4GPCbnwuTZR48T8d
 ruZg8LpYMOf+jVLOPKEo+exPt5mcXtzdZJVnrhM2cZV3MOJl0pQj7cildTh68pfWe9AdGzqTd
 0d1Dmj5mMrL4x6OvARtPhUsA==

=E2=80=A6
> +++ b/drivers/gpio/gpio-siul2-s32g2.c
> @@ -0,0 +1,581 @@
=E2=80=A6
> +static void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
> +				     unsigned int gpio, int dir)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&dev->lock, flags);
=E2=80=A6
> +	raw_spin_unlock_irqrestore(&dev->lock, flags);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(raw_spinlock_irqsave)(&dev->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc7/source/include/linux/spinlock.h=
#L551

Regards,
Markus

