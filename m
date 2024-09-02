Return-Path: <linux-gpio+bounces-9571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29911968720
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCA25282FF1
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6005B20011B;
	Mon,  2 Sep 2024 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Fa16FzzV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865ED1DAC64
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725278925; cv=none; b=MH2qyOiKD/Dvgsx24JdXIvIAz1b7eV/001/xHoXzKENlSp041/xEuaauR/u0aUZUifCi4QXMTRCI1Ac7t4jDYiJiLvHgpCBQzF6lZAKHDwtjmc0I1l7duSJfkAJ8siJ7Vbd4qDE15DSDTUH7h/cw3V1gtz6naZIe3v6c2B6mhho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725278925; c=relaxed/simple;
	bh=/fmn1tpBsaiU5ZR2h6nBaQpwU2eBecY+EFs72kIYxMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ds3TFavebYIln5IBoT5o9bo9hRQfetJzELkCQPfw1N8JesAwRp/R9UG6TZ5fbs9tKgpVGZecRdj8EjQekHDPhesftVoWKVTTADcDGNFw769l3LRloaY7UHjXtCo+uvV4MX8FjsxBBtvMLb5qwLOEReONHiWFnefEoWkqR056288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Fa16FzzV; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f40a1a2c1aso38825021fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725278922; x=1725883722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fmn1tpBsaiU5ZR2h6nBaQpwU2eBecY+EFs72kIYxMo=;
        b=Fa16FzzVJNupffeXoBkKk52s7BX0Bjb2ksNkOznIJXyiCnh485CUrNOYaK5yRXVTct
         3GG8wOhmRKSHXug43ndmKdhdhUh9bcV4rOca51mRa36o5vOmmvkGg61aEydcNsnPvtnE
         UbMy8jcpa8+Vyzw8B+/0Rf+ykfLiRGspenNoBlYcepMnsd/ymyN40UIY9P3821/1WyQK
         KD/QcVGtr1NOX54SxzgNZp6tCs8XrHYjxdcbgyhA1Ap1QXKrs83XE2fJ9i+1/TffCKlz
         ZPVT1Nx718H3nQL0kvR9jKi79Mc/ICLurw808QGGDTZrDxGA2VHJNUC5WG+jEJfIpxAV
         0v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725278922; x=1725883722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fmn1tpBsaiU5ZR2h6nBaQpwU2eBecY+EFs72kIYxMo=;
        b=VmDAGGx1QDytgIgyErH2WnSJEnzQdrU59fEidLrZJ5PKbbuzEXirc4Q9BjvcdSjPqu
         NGDw+pUoaz9fNe9n9ymPiO9mVqcfI7wGlr6BJ+SOmSyQwL/wZWZkVioKcr+sdGZ0XMvS
         9gpSPLqHckJICceR67Tm2ejOAqX1F5B2riOuIjj3ol+awaIVoXjNtFkgDmeM8dsfZBT6
         k70iYGXpnSF+hkrVEmgxpHlikwPbCqt0fZ29PIC6anEWMN93nWcq7z2yitnKjVVW/Rt9
         eQH3P9w6fSwlwlTB90uLKylrbdlKnXw74m/K6BcBsYv3+yh+7QF3IDv7fPt4GILUgs+P
         zXdg==
X-Forwarded-Encrypted: i=1; AJvYcCXgWdHnxqAmkZS78SGPcxC4f/RHGJRd0J7KBSnjSBnExlvA2aTC+X45wpS7YxgJHHSHYSPPXLcjDbrx@vger.kernel.org
X-Gm-Message-State: AOJu0YxvFQjUffqISnBbqo22bR4QvhL6clqD6IVo7xWcxvogtxj26aGm
	FZLfpOswCRh6rZXajJ7+GQQC7SuDKpSw38R+01kAsmD3ReMpQWA8oZEs4+FiOof+dBSN9vYCdk+
	uRGJkx9qLukr1ANZW63uM6OKRu+a1NmKZWaztETaZk0A+07rE
X-Google-Smtp-Source: AGHT+IEwniVjpUcHNV2PgckQjJz6SBHI6ttgJLYd0oBUrlEr8cM8Ja57SNENZ/8PhY5yQ9vuQ+p9+Vh5WTkPLL6qeN4=
X-Received: by 2002:a2e:5149:0:b0:2ef:23ec:9353 with SMTP id
 38308e7fff4ca-2f6104f27a6mr75282841fa.38.1725278920963; Mon, 02 Sep 2024
 05:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828133207.493961-1-parth105105@gmail.com>
In-Reply-To: <20240828133207.493961-1-parth105105@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 14:08:30 +0200
Message-ID: <CAMRc=MdyNFzNy_GndBDOUL23Rv0WxGG8mRd5DRD28pE=XuhfmQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: fix lazy disable
To: Parth Pancholi <parth105105@gmail.com>
Cc: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Parth Pancholi <parth.pancholi@toradex.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 3:32=E2=80=AFPM Parth Pancholi <parth105105@gmail.c=
om> wrote:
>
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>
> On a few platforms such as TI's AM69 device, disable_irq()
> fails to keep track of the interrupts that happen between
> disable_irq() and enable_irq() and those interrupts are missed.
> Use the ->irq_unmask() and ->irq_mask() methods instead
> of ->irq_enable() and ->irq_disable() to correctly keep track of
> edges when disable_irq is called.
> This solves the issue of disable_irq() not working as expected
> on such platforms.
>
> Fixes: 23265442b02b ("ARM: davinci: irq_data conversion.")
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
> Cc: stable@vger.kernel.org
> ---

It looks good to me but I'd like to have an Ack from Keerthy on this.

Bart

