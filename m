Return-Path: <linux-gpio+bounces-11384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9621199FA71
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 23:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 524B5282CCA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 21:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D9C20F5DF;
	Tue, 15 Oct 2024 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bVztYQXJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFCA20F5D6
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729028376; cv=none; b=f/vgYbMF5FrsODfrZOvu6E7jcxVIoOExPcYKi01sHZ0th+ffuRjU64aUb6lPgibYIiXDDp0s9lAMkPZSE/w2Rr/HsPfY4VXKZknNNGCbwc7b58mYd3QENptUkAq8QbqyTYDasvQx4o3fszUuofNNq2y7y+yofEthi/Z5eJHcVAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729028376; c=relaxed/simple;
	bh=NY5tsDG+TepaBzQoeKpnr+oeJW9vQFfX1a5J87FfW34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnRaBqOuqF3bIxKsUva0VntQrDHOLa+s7bPQvRU+o1awcZl/WaTggMrBucSSD0d60kQsytnvyzj7/b8VBwzqePH4DXmYxjWkQwr9c+9XLQm6TNIIR/hNRgf9DzOEsWBHEvAY7AGbpwTbMeXDJJFVdVzlTMvtBHbaT/qAThNDwC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bVztYQXJ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so25822911fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 14:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729028372; x=1729633172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt1uVRncBKO3P0OnuzsWJGZJCb1Wq0MWXLMHVEHZjFk=;
        b=bVztYQXJ30hYLQ+Qy7++h3B3ZwpKaf0H1eyIPEWW3ZAFwDJm5owoR6jO4IGclK0LDB
         Awx9gc7A+/n/D7hKW/duBwHIbX6qCFomfBhnUV12jFkinf0HOJ/TPl0vV4hq40jdz0vZ
         oxQmfUffmixFc6CbSkNkiMhR1Lz0Yz7Jcco7UNZalHvjiQi3VcHFGHExhnEkubgHAGYp
         pnsOn0P/MMLFwQ3bjFg0sSWsj0CGpoee79yewNpvH416/jf+c96uYPT1VuJ9aBgeKWEy
         gujDPHln2njgnWt+w4exBRru6Q5RNDsrwYpQ9bVfGG0zzv+QEVAvb73MvtzQeTicZvtj
         mUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729028372; x=1729633172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt1uVRncBKO3P0OnuzsWJGZJCb1Wq0MWXLMHVEHZjFk=;
        b=p9ybScm7RkpzMsr1O0buSWXSp3V3VIaKOHaBr39UnK5w7l5CUDxZh0KbqWKIji9QQY
         5gnl4EDtQ1qlLWuw+GZa/z31LAI4AQsi9oJtoZA2BLuDoIU+6bKy/l1GgArdwOWXK/pg
         mEk9MrB0yF4FyObE7xBJ9ciPVGIU6XW64WQuZzjgdes9/TThQNOZ9mFS6AyPAkmKr5cs
         7lYV133FUXdkcRwtX30FPC4lYMI6OW1Y2VbU14vXURhuxy6jacbVBiIrtIUxQUO9jgCU
         L8GdfOhys0E1i3U7syMBixKXLUFhoB+ubGnWNcvU4f9pESZKhszN2GTp/mLloR0A8ebz
         dfLg==
X-Forwarded-Encrypted: i=1; AJvYcCXH77WnLnXaSkg6Gc4iq2cQQUmIwiymZhTWCNVCZ/8ZtHKncUCveSktLWFVaVTBwAjfLMohYaPxUnGG@vger.kernel.org
X-Gm-Message-State: AOJu0YyeODzrknRyDfxjXOHj+Kx6za6b3oQ4bclflKnCL7OMdNLa04S4
	MqCoUnNvFy0rV/ZOtZ3ryOSyJla1T7OCnw1wOK3C65KZ9YFD52xyJXAvi+yZO9S42WoEHqc7jDS
	cnu/7ZoIhKVJHmQk9wn9CLX4HmFvWDRYHRtYlXA==
X-Google-Smtp-Source: AGHT+IHa2frolcu/goJFwMBAu6bA/ZWorjW/fjQ26j0X/sDgzZ923uAKQjIodHfeTUJpoVqJmFqouNcmF7KCP+Bru7g=
X-Received: by 2002:a2e:b8c6:0:b0:2fb:565a:d918 with SMTP id
 38308e7fff4ca-2fb565adc3bmr43605611fa.12.1729028372533; Tue, 15 Oct 2024
 14:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015151126.2401855-1-arnd@kernel.org>
In-Reply-To: <20241015151126.2401855-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 23:39:21 +0200
Message-ID: <CACRpkdZwG0Qgxjy-tmh34Pjd5YzMmNXM=PktKMgd+rwbfPRSPg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: th1520: add a CONFIG_OF dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 5:11=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> When compile-testing without CONfIG_OF:
>
> drivers/pinctrl/pinctrl-th1520.c: In function 'th1520_pinctrl_dt_node_to_=
map':
> drivers/pinctrl/pinctrl-th1520.c:455:23: error: implicit declaration of f=
unction 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_du=
mp_config'? [-Wimplicit-function-declaration]
>   455 |                 ret =3D pinconf_generic_parse_dt_config(child, pc=
tldev, &configs, &nconfigs);
>       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                       pinconf_generic_dump_config
>
> Enforce this using Kconig dependencies.
>
> Fixes: bed5cd6f8a98 ("pinctrl: Add driver for the T-Head TH1520 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij

