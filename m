Return-Path: <linux-gpio+bounces-20373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9159ABE6C0
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 00:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF9751B65762
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 22:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6908825D8E4;
	Tue, 20 May 2025 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXxQds9W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E84620DD4E
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778961; cv=none; b=LOSb3YTfJaMcBouaFgfOSmHifz5Pn0ndfb9nz1NtsTUcaJM1hEewbg2GiNov/hFVWCNOQ13vjUITJ9d+peKme7IrhuQx/fXa9Y91X7kwzX1fNeJGrVaWIoD2jS1K8pryHO17jgbc6jKu73nnYwZkQB+eao/EMZ8+9JPoICz3TD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778961; c=relaxed/simple;
	bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xrbqt3GSDGwyt+zDXIhqbeeLL4ngvAdW0MdAhCJpSncVO71k18KI8XVhWg7Q2yDshmSAae0wl6UDPoPCudpacd2fsa60DTTdtoft9lGxzSH8f7KaL16ofIhVpdKSUJOfit/t6k8XU+w+kbZ7L4WE5IrzAjqG2rjz2o69zVJYTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXxQds9W; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3280b1a25b1so40134271fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 15:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778957; x=1748383757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
        b=kXxQds9WJE5ExFVqwoDfR2GDf6QmPSyRr2o5LlJd4431twbWsr86m523JEQAppzsA3
         HB3lHzmVD7oGKUXV17UntYDhSqYW+BBMr/Wx07HwH8fJLniKqtKeISFbtDlbRLqExHkj
         MzhkERe6mSLNmp33IbTI1W7Zgp8ItpmHPfe33U1wwSLHE6DCkGUIAPSPqLhAXtvwu48G
         2xnKNy269clSO3A3OzpFRiKLhrCEtFtr93WR3SiSnjKsNdPhTqg4y/Yzra1MEEeqtVuv
         9ZmF/LSIKsBJF73v6eBRXyR3T3LRCUfDiQzdL6x/T0WgUZagwUBAW/kcqKqO6OnF0Y70
         cgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778957; x=1748383757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ratdE9jXoB0SJ0Y0w3wsjguEzkshW/vmeLVeCaT31+I=;
        b=AtbRXWpaEyp2uobG3iCS/6iMqsehNwAJaia+Gr5hl2qd0Y5LgcqYLf/+lLjhcDn/FC
         wEqGBjVWC5zPQP9p76xRJP9NHoEpwhTYvu+l4i8EfNz5ulac09Gs7TcModR9QXp2xSje
         Q0Di5XFxk/QbCK7w1yfoBjNxoZzwhKdjq3dNE10r0IItRFmF+/S+kbJZcvuthvrv+dqa
         Oe+Sif0m5t+r+CFh1EvmzM8yazNfeGwzHsJ0fncZCAJ+zNjIqop8vPXAkjNabb2YujvE
         B17rJTlL/2AyNHJT3iacYpe9uMAGf4DHrCulfA/84bIrM/rSsZqnqUB2SUQFQqazTCVn
         aBUA==
X-Forwarded-Encrypted: i=1; AJvYcCUyktKrRotuxWYgWPP+d3hAcJ7ODOOI+8ek7p+5EuBTKabKl5z7KRwE/6DM3gWsWGZsFasyl7zdK2NE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87BWYKuW73Dq0/lLaUjbMDCmlVgER+aJy/UXthM5NknThsjID
	LdiGKVNW1HGVle8FcXNkjxi0Ny76xi5zLJHoC3GLaIV5EVXvHG63bLDpPK3iu1EUOgYkvRFUnXe
	roAFJqe6Wa4I1MTWzu29aul3WvIhAnyV9MnjnzK0fFA==
X-Gm-Gg: ASbGnct92BA4Iq5n03HFth5e8rEVLX8eGKtlcjfbA/TASa++umFWiiDCJYFULg8nKV9
	oQ5bT3sn2880rzZSDoa70Uo97elLNrYYQUu/z5jqPcPT4lEH0Yr3CMAHwo/Aku6BttG2CTZyN3y
	HhwCYzsrY3glk/cQiK0/6iwxGxZ26jNCxCLBLyThpZpzY=
X-Google-Smtp-Source: AGHT+IHDDQJhnWX2kmTO5v1Pk0nimoh123FoAZWbqbQl+FUgai9VCQfwTjo/Tn4PNUMetJyi+2gPAW5SomZT1SLUvWQ=
X-Received: by 2002:a2e:8a87:0:b0:30b:d05a:c103 with SMTP id
 38308e7fff4ca-328077a2e75mr64717311fa.29.1747778957098; Tue, 20 May 2025
 15:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
In-Reply-To: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:09:05 +0200
X-Gm-Features: AX0GCFuwZ5Uj2GFu8v9SUCd9XbxxK9oH9Hmv5mkp9JeCnQEfeHNWxb9r3Wl8bto
Message-ID: <CACRpkda6D_OayG2DDFG6+sQ5vyYCrTojHs2H1ZVUMw4rpbuC9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, peng.fan@nxp.com, wahrenst@gmx.net, 
	conor@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 5:44=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:

> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
>
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

