Return-Path: <linux-gpio+bounces-24376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7668B25CFD
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 09:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B92F21889DAC
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 07:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4BA253920;
	Thu, 14 Aug 2025 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0yL54c7u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423B5259C83
	for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2025 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156018; cv=none; b=tSbUPUjWpLRF4PwpV6s6geWyQyod+qglGM0gVUPImYMEwhjaFEFwKfS5vA2P9GZ6y6VYBxFBODQIDRJGGUDG7H2Oyed5yX367otSODLiKYsP6uylJvEBb9tcKWsNrmPZyWzbe/msIIIP/oiHcixzCAVNM8/NsGZAhFJZdRQDLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156018; c=relaxed/simple;
	bh=vs1MFcYsgr4i84q3dtW1Ra43PylyG/Hny4f25xaRtQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4JyCLJ/n9lMqfH+xFLYMJAaUMYuZCgpwx+PzRpPFJ1xudTP1GDhsk+tfdRpozLXVRBaPs5FuUn4reX0lToDL+l0zgUd51lcZ+SdGfZ1rl+nXyRrV1dLlh/3F40eDu80ipLH+TD0cipkVuNzEV+K9ahWLbeP1oi7on855vNGXMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0yL54c7u; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-333e7517adcso15066751fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2025 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755156014; x=1755760814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vs1MFcYsgr4i84q3dtW1Ra43PylyG/Hny4f25xaRtQo=;
        b=0yL54c7uT9hzpzyfLl8S///EdFEdiDE13qqph9wtGFhfp5g9ph7NRnL0kHKDXUjytY
         +roKSzrpu/Fk7K8vIieDx9wdEUe8aW4+tgk+OH0MHERAnNvpaLVAvRRI1TxAl2Unx0q0
         whXjosAYzIQMPKPnWH29ID9FHYYKZjgKOOaZ3h9WMW0PrlnYBj4PsvPKFk3Cxn+obW2E
         ZUU5yIb+ijbRjrmTnhAS2/UYspf1MzX+5DxWv+5Eja8uXG9HHFKsvECkDjvWo0gbv3Vv
         fVRtjdyaS73UIDTRK6La9B4arCZpAxjex1jchogSg2M41c33XNKwVPDSevyeJ//gH3iR
         4nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156014; x=1755760814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vs1MFcYsgr4i84q3dtW1Ra43PylyG/Hny4f25xaRtQo=;
        b=NXrFOrPlwmnPUR2vq9EE9TZyrz0oQHsB+BjC187pEkug8+7YUkvGWBYvZU62iei2cY
         nepgs4SPfTTl74L98nXk5O98p8KQeY0oYAdkU+6ltHmI6NEs6HEoI0JpxJo1d1c+sBPx
         v1jsNdUYLJORypgX9XjdLkDHYtfvv56D5Z6L/2JUZymgGaMPssEcYXYIBcGzUv7J6fFx
         OCYXP3TNT5Sa4wXrOirykocFas4ZqUSsfo4CH1DcyOV/YzGs6YFD771bCf2xtz/HRuZD
         LTecvKfy83WOqALz+vcMLj5QkWRwcT3niGi4aQmERJzaRVdaY4f4fejD9JZ7Z3TDEPrD
         nm1g==
X-Forwarded-Encrypted: i=1; AJvYcCVwhJ5kr+keJihpE4prsXqT5lp7fNN66hf5OPOqDvKDTar1whKHHFjHp5e0f/nZBnGKLEZktDLxmoTt@vger.kernel.org
X-Gm-Message-State: AOJu0YwqsK1lFPQl/5034mLtX39+2OhLlSQnj4dNhUeYYQY6NCKlGeRn
	dAYAPqyE4hhmfU15MZMtJfNAl9VT2NrV/UMsXOwEQb9JOtsIkhQ9Nct8Q+LDxxMwspZXdDWVKRw
	gE6gTP19hfyk4NZXKQUCw3+26kTlUDawNIXXBk3uMLg==
X-Gm-Gg: ASbGnctf4f6jr61Pekvhw9WuurMNYtWLN9vIQ8vKNg4hIpOxzGSARCByFFEqSLnUUCZ
	K6YK5/cz942z7qFoRnpl7SKzYfZep55t1hQY8xAdRpWNCLaPNdthHsdgZKfEeWL8aQqrJLQ9R7w
	S9mZ5w1qP88p2LAqYtHu5M53/OPqemMgubhCm7eTUNm83iklHSqPjqKrgvyQgvxKFmOLqusGk5Y
	3wzBuw9Z5IFi6i2bLGj+6bv/2GL262oyC2TqGCDfVQeR1pqxA==
X-Google-Smtp-Source: AGHT+IFTBlbhCsC67N1cmh3Rx642cXrDuTiu4TqWoZO5/6AVKV2k5/0U1k8rriHZOcjPel5pdqkogtlQ5ztMZk+8OUs=
X-Received: by 2002:a2e:94cc:0:b0:333:f53f:1bbe with SMTP id
 38308e7fff4ca-333fac83beamr3948621fa.7.1755156014062; Thu, 14 Aug 2025
 00:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com> <20250813161517.4746-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250813161517.4746-4-wsa+renesas@sang-engineering.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Aug 2025 09:20:03 +0200
X-Gm-Features: Ac12FXymdFzWV3g_JZazK_vzgETVMckCMj8Na0v79R7sG6_qTW0BLLb2z8dkgs0
Message-ID: <CAMRc=MepR_e8jkzOyRs6RwP6BTKDW8RAB7-Z2GF0KcAr4VmZ7A@mail.gmail.com>
Subject: Re: [PATCH 03/21] gpio: remove unneeded 'fast_io' parameter in regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 6:16=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot =
is
> happy, too.

Applied. b4 generates a super long list of recipients even if I only
apply this one patch and I can't send the automatic reply due to
gmail's limits. :(

Bart

