Return-Path: <linux-gpio+bounces-2398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCCE835E4C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 10:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 300731F21FCA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 09:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFF339FD1;
	Mon, 22 Jan 2024 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mCg0coWk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250A539ADB
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705916022; cv=none; b=exhCes/qLZHRoQSH1DFkL35AWFjiO4fPVT4o+hIPd/Wpt9zE2PJ57B+miPl/EFlHVKWzcMp+dS3hLBM3XxRFIsVxt5le0k4ckB+tUW34LWlROWI1LhtbpXqcmNaH6qDzxn0VmGb56Jatk7B/xymGfIZXJor/DZ+uZujp3ZWYpOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705916022; c=relaxed/simple;
	bh=A4OLVR1U5sP3BcJwe2KfRh8bKYvqXPPv7B/ABm1pOgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GrncQbOkx4A8lTzT9foRPZWmCnLOJ2RdWH4gPCAYT/sI1KAhyX7YJqyZTp5MEVgGMjncfvggtqMr/lNwHlIRHwAH2CtrYcb94sMJXEvhVZfto9Yhs/LThdjMvxgqdRMwQQzfZ3wV9v3dI91qS0eLwZcUH9pAH+PBDNUsa4vJkOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mCg0coWk; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4b857733f9aso385717e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 01:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705916019; x=1706520819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OB0KQZsTaykP5uaI0wj0BAvpVtT3DPRwwyH1LKYHhoo=;
        b=mCg0coWkBjwnf7wK7DC161CYnF2ZyxFAiWVYPCy5b4H6fJmnYQxdLN4gZkgS5j9suw
         ATi5hX845GjlCfppl1K2Fqoicx6edSahUeAXYpDaOecctovkPtpfCzmUbcolLYEsl75h
         Szgiy6/j0pn65B0+ikJUPqjLDoIFgkR2q2l2flUuqww6Cab96Cz8+AeoTbnp1XS+HQ1E
         13LM86MkbcV+oB/Cn/HOdZemKOX/1bXNzwiImWlLsLgpQU76IkGyXSzXUZ5FVJjIGco6
         8vkltjpEaX23na4NAsJ5wUNSNx8fu5FFVzVFqVQZPC6CqpPYaxKhmXZAZop8oLeocycP
         P0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705916019; x=1706520819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OB0KQZsTaykP5uaI0wj0BAvpVtT3DPRwwyH1LKYHhoo=;
        b=vLBSrRV/e7xIiMFj1bYmYaPNVm9TjJPxtBVsz8bttWk+1mV4J+IOUcAPmNyEtrOBHZ
         57y2kWw9X2nX18jFE9HNc2zCn3poCCnXVQn50CYMSzrl20/KbIzIHx+uDe6TCptOTbX/
         jZ5YGk8Plz3d+NWwJLu6c0vdpX51jyRB/sxYk527mWRigA83EzL0NVkBRUHWvVHjhnJP
         jUlW3GCbEfJwFgeWKZfARud6LxHylXt6EPlAzcnSEqPWcNFsPcICOFKurE1ymGNDg9od
         pmbNZiEFv3a1Gz5hB20MlOZNaaNE6Z79RGPbrKSXit66EbsqDo32Qs5pcoltMXxq4uKH
         /VXw==
X-Gm-Message-State: AOJu0Yw3/B8cW9Nf7mUdxV1m+z+QlchbBx4xF5nIoSvsjjy34wHxkk7E
	nU4QK0m0jVlVXEQmCMVGJIS5t1N2A8uCqTH7kCFNDdQnALQejIfVd+89Y1D8tq+lDmMQyBxa0OW
	fWR+/rWzOmrs24EfLVnIpvndIMtjdYBiP1XPF8Q==
X-Google-Smtp-Source: AGHT+IFpe/zMWRW1pGpT6CeZ0tmnmNb2Td5Ajn3RviQSYC9NVUJEaRRmoCGLuplnb/dOV9OwpbBaqVjkAInLQpJCjfc=
X-Received: by 2002:a1f:4a87:0:b0:4b7:6c2f:fdb0 with SMTP id
 x129-20020a1f4a87000000b004b76c2ffdb0mr733556vka.0.1705916019043; Mon, 22 Jan
 2024 01:33:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109073849.10791-1-Wenhua.Lin@unisoc.com>
In-Reply-To: <20240109073849.10791-1-Wenhua.Lin@unisoc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Jan 2024 10:33:28 +0100
Message-ID: <CAMRc=Mei0w8tCXFd-vO_SZLxYkNUWCqbEBV59Go-2LdXKs11nA@mail.gmail.com>
Subject: Re: [PATCH V4 0/2] gpio: sprd: Modification of UNISOC Platform EIC Driver
To: Wenhua Lin <Wenhua.Lin@unisoc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wenhua lin <wenhua.lin1994@gmail.com>, 
	Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 8:39=E2=80=AFAM Wenhua Lin <Wenhua.Lin@unisoc.com> w=
rote:
>
> Recently, some bugs have been discovered during use, and patch1
> are bug fixes. Also, this patchset add optimization:
> patch2 optimization the calculation method of eic number.
>
> Change in V4:
>
> -Add Fixes tag in PATCH 1/2.
> -Change commit message in PATCH 1/2.
> -Add clearing interrupt to debounce and latch mode in PATCH 1/2.
>
> -Change commit message in PATCH 2/2.
> -Delete SPRD_EIC_VAR_DATA macro in PATCH 2/2.
>
> Wenhua Lin (2):
>   gpio: eic-sprd: Clear interrupt after set the interrupt type
>   gpio: eic-sprd: Optimize the calculation method of eic number
>
>  drivers/gpio/gpio-eic-sprd.c | 42 +++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 10 deletions(-)
>
> --
> 2.17.1
>
>

Hey,

Can we get an Ack and (preferably) a Tested-by from the SPRD
maintainers, please?

Bart

