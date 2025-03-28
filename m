Return-Path: <linux-gpio+bounces-18079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F311CA744CF
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 08:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6B6B7A6B40
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 07:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984E6212B21;
	Fri, 28 Mar 2025 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0SNjDWR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC20211466
	for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148261; cv=none; b=aqwE7UZqDOcyfN25z8DbYgUnRGZY1NLXj2HVrzQ39llnTca+QpgI4+NdoLV1Vwy1ewbWV/4bBdP+KXC7StD//12mPVpcz7ixzqsJQRVZxzCXrc/Udpk35sfmx8pcaL1Ci/Q2D1dMfz1KU2NDZvoHdZ0exHqQ65BnMAsppQbzZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148261; c=relaxed/simple;
	bh=Bp20qO40fgduH90YbAXMSJkPgrjllUsyzwuKVLOfjh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7QvetkwcyoqRaFeWZ8nOo2O4K4myOKLWuR0fgPEjwaxRjZfPsZ7gsOOvciwhKKSklRtsPdHoDScj+NwsMG/u+1uqMsktszo4JYBuWQY0NSJTar8GQelAAyjcdma6nvmhS2sg/FtnHGvcHJw0Qck8+y5H7aawzcgnXyynBGsbNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0SNjDWR; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549967c72bcso1882594e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743148258; x=1743753058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bp20qO40fgduH90YbAXMSJkPgrjllUsyzwuKVLOfjh4=;
        b=j0SNjDWRkElFp6nitgN0/gi9OZ+iJeydAwb4fOciqT23LBBJcKeqN6OMdcqq9R1M9R
         WiYd+BPfBTklhiOWorMpsc5Icr4T5W6dR5ESCbW+RHauJAPIqqjvT0KJekQ7B32lQOXp
         26VcSn9ZAGb59FV+KTvNiOUJXSGxxkQaCTahhTXw4n+Iby/BzEqtejjs+2rciY0qXQ0i
         jFKiTzeerLuOVqarJnDYo+3EjTRuGCrN28OrQYa3WjH4SKifZ8nTt1ywk9DGfRg+ErXq
         ng5GSkto8TVj6dRuxSQ7DqOX5yTY5yyhHNyC4r/D1Vajjhj+GFtk3clSwyAPkvIkq/pf
         QHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148258; x=1743753058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bp20qO40fgduH90YbAXMSJkPgrjllUsyzwuKVLOfjh4=;
        b=ury3m2DGIfdZTDL4eWXqvNK+FS9qeOICMDGBN5L69enn49CWMaUjU/myskSnChMKsi
         gTTTMec9SDTuAUj+WfQOuSiiM4mIlzJY1NTFhnqCUz+H2d1jA4sI0rJUp8Ml7UKRdDTQ
         0zWHjzd5bQIJVStIpHWkWk8CG2Nbr0+upd1CR1WbyqBesnbCbPnQG0F6BoZkUVuBfR8K
         hf3+32NYnsU+T6/nMt0Zg6U2yy1K6aKNVk5GcT+OsdYqf0bHrXddMuz4v+HgFm0T+h9n
         AJeC5Keblz7AUw7fTtlHg+1rkXA8oICUhgXhcWWF3Z5S1wd3zCNCamXuGsXx6eLYpjny
         GjBg==
X-Forwarded-Encrypted: i=1; AJvYcCUa5Qe/HgqOnuwWifoB0c1WhfpxHGbn5WZZ3QgCKdWYhU5lOXyPuo7y4kd9Mf5iU9Dor0DIJrNoYjYG@vger.kernel.org
X-Gm-Message-State: AOJu0YwtA40NR6LrLgb2jvjq5wACJEKUHe3SPvxCtCS4AIbGJv18MHy4
	ybfrabYZwMgCvp1DiV4wG2nWY64hNyaimkl4Q5/UXGxIVE16nCzk1Pw7O53s48BNEUGJUbhwXxu
	gZUV0qZ597V5E830zecJXE4IHx/KGVG8naDSWYA==
X-Gm-Gg: ASbGnctp3TAWRQNU4otbDonJAvGdPkBY+rKoAKAF2mLofDQv5n6Gh2u5k/0LyIcFTCZ
	upKUycy6QW1GSnnWW6EyFwlvNKSrMzFdPCFPLg5/519CUbwYeOhp33wP6p4DgSDkVcMeJ1jLxvK
	1iHrQ+gfMlhbUG9CMfUggN5dRbfSJrCMD1Og==
X-Google-Smtp-Source: AGHT+IHL97IFoFHdmUomdi6+d9psXeOGxZaODIYnk2/zI5sJDSAilLWx2geAZLmq49kMG3BjZmtKdBJNxWJvaiG7uyM=
X-Received: by 2002:a05:651c:511:b0:30b:b7c3:ea4d with SMTP id
 38308e7fff4ca-30dc5e21b61mr27657321fa.12.1743148257818; Fri, 28 Mar 2025
 00:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250327004945.563765-1-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:50:46 +0100
X-Gm-Features: AQ5f1JrY_w-ZK0hNuiLg0Fi4CMfpsjTOrVjrzmqoINXb482Vi9yc8xjZe4FvqNo
Message-ID: <CACRpkdafqbwy0zRbPrVdQ7=tKtfU4wz2_5+tfthcD=ETgHBnWA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: brgl@bgdev.pl, krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andriy.shevchenko@intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 1:50=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> This is prepare patch for switching s5m8767 regulator driver to
> use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
> "active low" polarity for the DVS and DS line. But per datasheet,
> they are actually active high. So add polarity quirk for it.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

