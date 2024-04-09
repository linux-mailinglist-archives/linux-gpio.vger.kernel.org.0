Return-Path: <linux-gpio+bounces-5215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D9189D2D8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 09:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 528DD1C21679
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 07:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357E977F1B;
	Tue,  9 Apr 2024 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iCAyqF97"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BBF6A012
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712646736; cv=none; b=gh99vd00TZBGAfabqOgKniysNHJwtkEVm2g7ZeUEXYmQnv28Fr5P3R2pBgJtLPvWaTJ/Gg87eEZVmtJoD20rlC4PHCpm389BIK6g0eYp1hQA2jFriFjApz7oCAAnMYyGeb09iDwwKu4HevAx9pWFdzNcD8lNBsbRV23hNm7D3fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712646736; c=relaxed/simple;
	bh=7k2kwrD+6dkxa0Jp5JiZOG2oLIzIdChr8NsQEX492TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6Bmj4oJv0tfquu0mketArSFuogO2S4PhDv6WpkcBBlogihX4NtcMf1ktQAjmnLZ4SkIzFxuw00s4Fg8l0XohQ72p+YotOtzfvHOZuN2rOOHmLJXTcRR1P9ZANCkfSc/cYHa3V0diumkUSIqoSQOmMsDinj9YQtf72/Q49uyxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iCAyqF97; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61587aa956eso48691607b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 00:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712646733; x=1713251533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tiescK9NNjrWaswI2dTbql6lo1cCUF+evpx7dXZ6iw=;
        b=iCAyqF97upmQiLt+WKUZOJ431mWwCRSzXMrmDboKn1+fkoTMi72sRP7jv2VoKNqHtR
         Szf/2fXU0sVZidhKdlh7QXNZyFx+VS6aEu5F6Et9J3FWva03J4F1w0pkgwzUAKiu9fpn
         GuUdL2EumX8Ut+494gfxel21fdZu8Vcp9Dxk+afHnPQZyOJ19ino5cnxu80QZrw5O1TM
         WF2CsSpz1fkvDvuFCprn1Lhpmpo9jec659g7HSvDIaXAtXQz+EaqC4Nm/vn5UOINjScl
         Q7vShyyPEOLiTJk8YF0QiNAW0tELOMYvpwa7Hft2pMOWIypZzQQd86r3iIUKZXv0MTo/
         l15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712646733; x=1713251533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tiescK9NNjrWaswI2dTbql6lo1cCUF+evpx7dXZ6iw=;
        b=LYKUGDor13MFiZ4r+z0aegnwOr38od/jT+3Wjz7A1nkwBcP8uMgAeDTF3cTt1fO81E
         Y203MZt8V2MtPO98uuPuSFW+4PHjVTvLr5vpy7GbfBNuDybCq+Zd+fQ16X/6FKcfdSZn
         FA9/E/w7ie55QJ/4CoyDolVKPp68EXMCga/+GO7LW8U9Qz/lew3lXusPmF/+lEzL8RcF
         uo5pNpv5ekNW6zWHzcg1ZZw+2gcVzB+957o8z9cu7x8n8QyZohpIZlDxolPC4wwwnjcq
         Nvvwnev8C7FzDFXrvGYHaSoCygeK732eipkWrBwE86G0ZUNY//qz2w2sma476naIBDRX
         A1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCX974zbUIN5UVtQFrndch3QRAAzwzzmOzWzPZGCfaArtDf6UOHA45gCqicknJ30VWj7XGRx/AKVBE0S9CVkfWkRKCNsgvJANGwzGA==
X-Gm-Message-State: AOJu0Yym/IW/ZcZwO2qj0itUQy6Gx6sR+PJpE2XFNNbSS9nMmcAqZ3Yd
	TWb6HnOK07y9a5THjJepNWNGyAMd6iZhbOFmtpJxwonFgygtVVCc65RXSWofp1ioIT0sK/ZfVxu
	ugeAIf998TIDqEHklYAw2tkJGg4tXTZQ2k8/5+Q==
X-Google-Smtp-Source: AGHT+IGEK2Xj+dHjqiAUu27AtZmeqL/hwR/FjaVb1jfrwvY1S0MafUhiePMSOX3+YMW2y8o36YzLWHrXgKm7qo8ElqI=
X-Received: by 2002:a25:df97:0:b0:de0:e3aa:e61 with SMTP id
 w145-20020a25df97000000b00de0e3aa0e61mr6801877ybg.37.1712646733510; Tue, 09
 Apr 2024 00:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326141108.1079993-1-ckeepax@opensource.cirrus.com>
 <20240326141108.1079993-2-ckeepax@opensource.cirrus.com> <CACRpkdZP_9y-Z=eZcbQe=ZF2ejutP6gD2ofTxXNvGTh7CUfwFg@mail.gmail.com>
 <ZhPvW46kGeOnG++E@ediswmail9.ad.cirrus.com>
In-Reply-To: <ZhPvW46kGeOnG++E@ediswmail9.ad.cirrus.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Apr 2024 09:12:01 +0200
Message-ID: <CACRpkdZQNrDt35d30xJSRz=03rhs6vOODWorpqMsJ=Lo4huJmQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: swnode: Add ability to specify native chip
 selects for SPI
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 3:21=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Thu, Apr 04, 2024 at 10:16:35AM +0200, Linus Walleij wrote:
> > On Tue, Mar 26, 2024 at 3:11=E2=80=AFPM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > > +const struct software_node swnode_gpio_undefined =3D {
> > > +       .name =3D "gpio-internal-undefined",
> > > +};
> > > +EXPORT_SYMBOL_GPL(swnode_gpio_undefined);
> >
> > This needs a comment in the code telling exactly why this is here.
> > It is also taking up space and code here on systems that have no use
> > for it, so I wonder if it is possible to make this optional.
> >
>
> Happy to add the comment, less sure about how to make it
> optional. I could ifdef it based the SPI config, but whilst that
> is the current user the mechanism feels like it is more generic
> than that and could be used in other bindings as well.

That's a fair point.
Maybe a new bool Kconfig symbol that the SPI drivers or
other potential users can select?

Yours,
Linus Walleij

