Return-Path: <linux-gpio+bounces-25300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3CFB3DCD9
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73CA83AE9B4
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5249D2FB630;
	Mon,  1 Sep 2025 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B55bPrwd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADBF2F39C5
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716262; cv=none; b=W9Kw5kWILXhVnsg4oTDJ9smQnPu3A1oIe0PozPOsYIVoIujrv7zLs4chQQXvUlDSfvsSdTtJ4sn23/Mezyk2p+FsgvAyNTVvHZp4XIf1K2G4jIsevd4ptSsEVUUGUF9fgGTWC9fnQXnsqJJmM7DDiyCns0bI/roU3lXHSU4ALbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716262; c=relaxed/simple;
	bh=SaiJq4hJF5lom7z5ZsALf4JWoA+Plm0B5+LT0O2PI34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WN+GYnRWYXP4YttEBDkSgLSy6WCnOEbA8ImEaZ5CxyrYudYCI6IEGevRxUPkVnZcgMHaxyheDZN3Vh+QJY7gxFvuSMoGJ8M1dzsF+DKIVUrkMiwMZBlXQB8aneNI6nvVqZgss3FzP+93vtFM/i1anImld4lrlD1slTeNXKvOMio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B55bPrwd; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so1193467e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756716257; x=1757321057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaiJq4hJF5lom7z5ZsALf4JWoA+Plm0B5+LT0O2PI34=;
        b=B55bPrwdIHOMLoMm8eiiJev3/iH6tSafUiHaMIUk1HVoq++skt/k/RZVPabUKAFrAy
         FCnnGvFa8dosXIxKM2MqgbLpDkI88rhbnbbtUr4EZbidHyIRYyhZt0/G/DjA3MS3pmjh
         LkNh4bI5X7vNhLfFF2ndhOuiwXqpFXNtBNxatxAoQtQR32pOeYDVDb4j6lJM08y3IJLl
         13rF9Z5PLEngF5boiN7IJjhyqSWj87JAP371B1T3bWN1NMSvtOzv4a3pUB6ja8VMP3HC
         3P3CaF/0BIh1ATJM/MJEljvA6XaW9FphILUsD0x44TvxILgE7g14kfB+SOwLxnt9YtOm
         FHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716257; x=1757321057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaiJq4hJF5lom7z5ZsALf4JWoA+Plm0B5+LT0O2PI34=;
        b=un0lcADKOW02nTqlDJOZexUTTCHWuaqnzwOQSrI/+A4RP+SGGhiMD9bNAYkypBCLxq
         g6dMZWCXJGj0H4H7+9QbW6kb75ybd+sN32N9pbkJaDzCGl6diAwgabSoAddThTZ0rgVF
         yXppsHxo0oQazPWtMvy18F+BmewvNwGBEwW3tek0llA8yO0AxSFBg5a7k2pphaAiClL9
         haxL12Er9jI/74hSCGVHW+rgMBPKAl/FXyxSW1JyU6djSCB8H5one6O90qFjwW4JVHpB
         7ior0WU9x/9hxwPLtK4I5sv4cuzuESEXNHlhVP1gEujQZNnDwj0C2/98/mqz5RwP2OA+
         WcYw==
X-Forwarded-Encrypted: i=1; AJvYcCX0t+blIyIxpPWIvObN4H/hMWLTCY/loocvUbUzUZLTvyPbrS1sg+oxnk3e9bymyzbE+u+gfMc/PYoF@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGkVdm8Nr+FHNsKac150oEZ+WuVIBiEuYbEWWZC7VVsgl0ydJ
	ZYSEYO6kXlRRtO5rqaj4F9z6cTJZGRZjvlX9DLlKidHPvcrnid3lHlS7nmuVFN/nMGJq+kH8+VR
	f0t8WBuFcYJ678rUGekkHhsYHB3nPuFWkIkkJhNUYCQ==
X-Gm-Gg: ASbGncvozuxIsqRWHUAr5KvA/CkKq/w1ww4yeQgTK6X2NrdpACERAcl51qiFblsE5D8
	Tn+bCjzEpwMwCCJs8+MEswGirxEkFXvowvsgcM1AGX+DnsDxwCdnrqWiYbAAFlqF+0Xwhk6KP2o
	cpxVu1Y9uS31WdCyJcayj/DPhBhDLG8O4im2Kpo6C1ElB6QrfHa3hMqU6CQ5905Zct865kpGlvJ
	LtIl44=
X-Google-Smtp-Source: AGHT+IHYQJGcS72pgyUEaoA+hO1sKdExLWvqpK7R1Mhqds887ElGFErBA9UBYpgc8SVbOT1Ijil+SH1kwRpSDvkqpJw=
X-Received: by 2002:a05:6512:a90:b0:55f:3faa:7c02 with SMTP id
 2adb3069b0e04-55f7093eb00mr1641808e87.40.1756716257451; Mon, 01 Sep 2025
 01:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
 <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com> <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com>
In-Reply-To: <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 10:44:04 +0200
X-Gm-Features: Ac12FXz3KPbvuWEnpXmjpCyuSYHy_eQu2RsnQJOIHbwbqbNB252k8odhTX9e2FE
Message-ID: <CACRpkdb=8GFLaAtSyWx4jgV6BN4gPAFH3tDKmDQT8b0b1xeasA@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 10:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Mon, Sep 1, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >
> > > Note mainly for Linus and Bart:
> > > I agree with the patches 1..11, but starting from 12 needs more
> > > discussion. That said, I hope Linus can apply the first 11 ones to
> > > make it easier to continue with the rest.
> >
> > I applied patches 1 thru 11 so we get some traction.
> >
>
> Ah, I hoped to get a Tested-by from Mark on the IMX first as I'm not
> 100% sure the fix in this iteration actually works.

OK I backed it out for now, let's give it a week.

I'm just a bit jumpy... I really want this to get some cooking
in Linux-next by now.

Yours,
Linus Walleij

