Return-Path: <linux-gpio+bounces-10946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D146992B17
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 14:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7F11F23722
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 12:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30BB1D2215;
	Mon,  7 Oct 2024 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4lxLnTA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B271D1E65;
	Mon,  7 Oct 2024 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728302859; cv=none; b=RMh/ISO0V/3aSp9Ji4x6cpEla2TfPboBhGR0Ta1zWG6VaVSdoysRL+Ew0Yc22F9n54KwWnx193sBva7HM16z5hdnxA7/f4X6PePSvrSov9Z8AZPwHbawqn78Hc3ou/G2R46XA44pdg4utwUygNVDH4frhSfOdy0mkSwlM+XsZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728302859; c=relaxed/simple;
	bh=jJtK3/1jT6FQ4smG4wOvY5N7/OUFqcmBnVKtNz/UvoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKessvWltBZeO1todrs5YFhXUB2hwOY3KaF47pDU4+WMoX0tVxq17sPz52JizllAee3sVBv88CqBV/j3BQ0YmtW5HuftYFMIia9GvaVgJ/S3GSysQqD53sQotgr2JpD8klkXIc8tVXD8uOsrtm/8WRq/dUGanttfF8dRw9qgK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4lxLnTA; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53993564cb1so4724394e87.2;
        Mon, 07 Oct 2024 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728302856; x=1728907656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJtK3/1jT6FQ4smG4wOvY5N7/OUFqcmBnVKtNz/UvoY=;
        b=E4lxLnTA1YIqudarQ2yAmxUnpC107mXJ5GjXjE534MEpEVHCXG18iCV6/7CeYXxU3D
         J5TU2tDlI8d1s7a14B4XL79+qmvapPs+nywtemvx6PGm3UnoVcbZXjOVnf2sV/JFz6Ok
         xiVp5ml9QZoaTYYneRzG2RODQzxMmER4mkcSzrwwwMdI2kvricik9V9gZKi5VCpPTAxu
         YSgqzSPE7AOfHUEPzH4MWqs8qRkLCIC4mLZIqxrHqlPMlQ8o6wDvZDxCQCJKfCxg1KSy
         /HPzN42pM5o1M1CleKUE6+lDmFAxq215j85CUHpKkNJTJPnDrHrGpd4vlWvUgsBsgCBw
         BHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302856; x=1728907656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJtK3/1jT6FQ4smG4wOvY5N7/OUFqcmBnVKtNz/UvoY=;
        b=R0BBl3wc6iFq6k1bfwilq00FoJriWp+LyKt7n1ZQbkLgD5HLV/Jr/rq0B1tbY4zlzp
         9rF1jFuuHIiBvSO6Ig+GtuNossy8rwXyydq12h6q7jZA6UhuIB4hiASH7t75Eq3LTilh
         VyBOt3m46ljI9PPnmf8NXYSwpLxHWdsUwdyb9gPfUNnv6GIbzAwcRMTIoMnunITuxvzc
         Tr/SPYkpubyknoHQNkGc8izwsYu0ICRrD54LbhD/VWUSgyFdoKnvVin/vtNO+ThrPqgN
         kcYmRnC+XjvAwHQXWgaiZMyCrxOh9xr31oRV7jVkAgJrVVG+Sms5RJPUk5TvJT9MNzUa
         u57g==
X-Forwarded-Encrypted: i=1; AJvYcCUHqha4YYvoLx1zaCerkoL+r98YfAyymeRv4eWUIIJHpGV6AvZNVTzquxtgE0CQmOJdOaVEuB+tUwhE@vger.kernel.org, AJvYcCVc+htPwOrXd+1jVWR+G4A5usGitYwJU0Le2eMBoXWEzh5jnSa9jYezia2NJeDrnxhwnxX8Q+prrzQUMbzf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5aEuuO23ki6tk9GuL8WCH33myoKN7apA8jW8ObMZCUGS3O1/I
	tR7dxru/UXVLAryLWNvHLZIRxNPr4HzuUxrjyHFLoKgTsFSThtkX0rW002W4pF9vo1x4fKIvnJx
	3femUDrBrPO35Rjs6WAVjz+Aui7w=
X-Google-Smtp-Source: AGHT+IHv2V9vub5HIh9lhXIcbry1CPZSpVF/bne5Y3kiIxmSAE1tBTwFr3QA6iadU2EJq70+P647NMtgXwX8zocTlKY=
X-Received: by 2002:a05:6512:159a:b0:52c:d626:77aa with SMTP id
 2adb3069b0e04-539ab8c4e45mr5287290e87.58.1728302856091; Mon, 07 Oct 2024
 05:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZwOc4o2i-Wzp5QIV@mail.google.com>
In-Reply-To: <ZwOc4o2i-Wzp5QIV@mail.google.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Oct 2024 09:07:24 -0300
Message-ID: <CAOMZO5CXm+d_2uXE+37SU8x0i-oU2ynj2PSfKF5WRAJxcGhqYw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx27: Fix redefinition of 'PC' in imx27 driver
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, ping.bai@nxp.com, 
	kernel@pengutronix.de, linus.walleij@linaro.org, Sascha@mail.google.com, 
	Hauer@mail.google.com, s.hauer@pengutronix.de, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paulo,

Thanks for your patch.

On Mon, Oct 7, 2024 at 5:33=E2=80=AFAM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> The `PC` macro in `drivers/pinctrl/freescale/pinctrl-imx27.c` is
> clashing with an existing `PC` macro defined in
> `arch/mips/include/uapi/asm/ptrace.h`. This leads to a compilation
> error when building for MIPS architecture.
>
> Rename those to use a more specific prefix (`MX27_`) to avoid
> conflicts with other platform definitions.
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.c=
om>

Linus Walleij has already submitted a fix for this problem:
https://lore.kernel.org/linux-gpio/CAOMZO5DqwcM1U8FtybUHbHYZjLi-5BO6nGfifHX=
guKtcEY4DrA@mail.gmail.com/T/#t

