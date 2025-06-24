Return-Path: <linux-gpio+bounces-22097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A6AAE6FEA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9316A7B1019
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21172ED149;
	Tue, 24 Jun 2025 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYt+v66u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1AB2ECD1B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794100; cv=none; b=hrqhyeqoUI1fyA0k8G0/iowi0OCHg4oVpFqBSjZMKTVFGd2hqWyzBc21UEPqQnesjb8qxyFpfrjfmEDza7ZDsoAFs/orrthNKIvbMC7ejd2487ntxlpOrk2VjZM+jxFrr2fLEPMGhUOq0IANPUUaV9BqjoD9OA8k9lW1bsDfZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794100; c=relaxed/simple;
	bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIfuZvkaW9iH0GaCxQbGilzl0axK5qHM/4lodOU2dDn9W3zou1TD7QQNk2sDxOvOyu0/BBpGpGDX9AlUf91Sf5QCCCRa/QqyLqhwRXF+aWvEG+57MvEMcrqRbfJyx4ol5+vB56IEydfAtCxNHS1dlP0pWG340tEYiioNx21Gico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TYt+v66u; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32adebb15c5so42782261fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794095; x=1751398895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=TYt+v66uVRtdBCH9H4QW6IdRV6c/mtAgiEKCU2v/jOAZP1gJ1A/c5/GLBlLxt7rdiO
         AutgSujhqabyUhE2uifVgFIZ9/6zpUAsIgUXgUYKRh/sB90YlempQGeq00/4ERqNCBWr
         enb9QwoEC4r8SDamuq3aZh5kZJnzN3Vu3SnDdg//2EOu55sw/6ZzlBXOq6L34r0/CzQt
         Lv9Q5KSzOLsg8gqwiXQEFcdOKmo8oMNjAsZGm7FaPRXrCBFtm8dnTvqkyIbaemVY1wlQ
         Gr/7OuTfpPuCldYQIYA7fCZuXCHbgWuHfTXem+gfFHKDcvoGCqQgjMOnonWNsxP6epzB
         oaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794095; x=1751398895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=Weu9usjI5RqRL8wEcUi85N/3qtGt/BngP2Mt4hHL8XNv4i7P3a58vnf7HK3SiGDnx3
         qqGHEZEEp3oTbhS5JEPDCyRpKSQh5KC4ev5Uo/8gG7pYWjgq1pO1xWhmBuTKJZYiz4/f
         fkrUrOG8yxC61dR07JSmRNrvaxPsXPMEPWGWOANQMlooSL71Pn+fVLooyv0bZPeoC/dP
         ndRBANt2tlY6cO+ogAPWtAq/oxxFuQ/x/1AlQEUPqjc7hqsZhsISxga2mM64gyqMfaIp
         dE9wrXcUa/D52nfO/TSFw4AKgPRbjd5T9Nnwh6x/FuHgG+tAJLFPiWaFLj7oG+iedh96
         OQxA==
X-Forwarded-Encrypted: i=1; AJvYcCXTO/mMxIq+6eFm5uHLtYAHIFM1fHYotN2+8qxB990p040YZ2p86ztQbWg0eYWgACVtkmlP7lAIohA/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+RRoEsnY8xERJ3mogOl+CQgfdAGWeLq7YLo43IfagnRenftKC
	m273T+fIvYgC+mgpTh4d8rcmTmLzcRPxDCAHLzUHNvKIUN0Se/VYZXtdpxuh1vLIAGQI5hIG1kd
	mtkKITBRSqk4RwkK/sKU7NBDPa2SLHTnzwZ6Q+K6JLA==
X-Gm-Gg: ASbGncvllsoGX9GLq6K1I+JVxYFapPAj/IM5m73fe41wjRmeTewrCxqMBYj/4abGd2v
	rapbfnkizSafpW5uEoFnrq0jVETu+XyvuWvgwOXWz/ZyXx0mVd2OSytjeSB/LHiWX0pSgjiG2Y+
	Ehsx3STTjx4u2g9YbGxU93qInVQ2/hRPkYZN7DZ8HwVOg=
X-Google-Smtp-Source: AGHT+IGgAuc3iJtRYb+OK2rDM3TlkSrDgGEbgeVIFtkTDVdAbZ8WB/KP/SQ/rIDTOfAZi97Vwex02jPn22o+QO9h4sI=
X-Received: by 2002:a2e:a4b6:0:b0:32b:8778:6f06 with SMTP id
 38308e7fff4ca-32cc64fe7edmr63161fa.18.1750794094847; Tue, 24 Jun 2025
 12:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:41:23 +0200
X-Gm-Features: AX0GCFu-CBprmbPmDb8uoIG_yV6pNxQGi2vFucZMy5qL34U2BG3ecQIKj4_p--o
Message-ID: <CACRpkdbG9WSuErEvcNGnt6bSqMVk31PuLGykaLw8XToVFnAc-Q@mail.gmail.com>
Subject: Re: [PATCH RFT 1/6] gpio: mmio: drop the big-endian platform device variant
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are no more users of the "basic-mmio-gpio-be" platform device ID
> in the kernel. We can safely drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

