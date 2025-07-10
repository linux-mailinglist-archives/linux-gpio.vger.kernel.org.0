Return-Path: <linux-gpio+bounces-23086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BFB003DA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 15:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1508172265
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 13:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF356259CA3;
	Thu, 10 Jul 2025 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vm0E40b3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF75D85C5E
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154752; cv=none; b=HxSiDkq0tMRjFLioTgbz0nWH5WEMq9CBPjfgKe2E1nLx1t7ybSE/2y0YcjXzzbd7PNPpOOJT4OAYJkXO8bC7K6h6zSztBcrrMqxbX63mSqg85yFb8nqEGUFRz9DXIfNot4csK1t3BOmjcPtNjm3OLvTQVmnN9JDtcc2yDOvBO9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154752; c=relaxed/simple;
	bh=AKXQs7l/JnXnGET0gMtJ1sU9EPmcS39N6hUdQpcxAYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qzn89deGr+7VWwsqpqeEYoIQqbMXsaRzjNuxME+tgP0bP8jtKpp/6TmWDB0q5yQBqCGAICuiVHadTCOctG5YOwXKjHFdeXejoDqZbZtR/yQpV7JNrbtB0mV4UvWKaZjk6pTcJV8MqfE5nKgb0mD/HUHjCgCSNSbfjvnoWhZ4sx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vm0E40b3; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so2407795e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752154749; x=1752759549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=vm0E40b3KJdBYURwDB2SGyiajheBsl+ABER84/3zfU8FaDh4lF6D+Y/bDXTVWCd9Ls
         wQfPH4WyJavgbd8gLpfhWeorCRWjjAyQcxsQtlmdoTuhFAaXygoHlpbIkAatNIyqGeYf
         hMUuBVb+N5evrFuB/8yu1RKA8mSwBKBtq0yHfBL45cazgVdQZ8RQfLEguPTL+dFVFh1E
         64e8JIl8v4CJLQ1lapFPopee8/ozT93rpi/nuBbxFyskVLYXtfpmtq53J99V+8182n/d
         V42bW7RcFbcLGnUAPuYz/umho+C3YZ4eCMWc4dndAKcTvXekjhXd+80++2qIoBdAAnbh
         Wq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154749; x=1752759549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=o1TqG5hdkC5ZqC5nABPJXN/pDwhBOgHyonpQTwdTVrDcnipMzqlgaB1L9iFAa/H+B3
         i/YR0K3jMnnQ++EneCAaWp0ODKoJb7v6JLtwn6aBvPTBO7DkqzIvGrfzIYoz/eFUMq9D
         C9wsfnvsYeXCJtytyIH9xdFaw1lS2UBGFjgwe0PfCIaUR9t4vQtoGXpQ39cDl5PgX4Bc
         hbjJpEeBJIWibj1v5rMNwJgo/lRkpq4V0daTjbl5PfaxwzV9LMHQYZwWYo4pM1SG9B5g
         8r15x7NLF5Pp/yYfRIATMC3yD844cBDAoOTml1/VUhQrqlyX7uDgzWj+Qna2UEbp1JEU
         4pHA==
X-Forwarded-Encrypted: i=1; AJvYcCXpObWom64Gxwj6xwEA/b3hqk+xZTD3qajTYiRq0qZ5/C4R8BijeMLm3ksLortS6Im6Qm00mkxxaR35@vger.kernel.org
X-Gm-Message-State: AOJu0YxxFNvzeHGyjDHcuVjHLuEQLZ8hfKykfc0h/NNpf9E1HtdJf3E9
	O/c0g4X5XL2KYOH5u3xOCfE1s0l14MHcqorEpUOY0yz7fi8BUOvoy1ErSGGUXDpRDmwem7lp0Ds
	JaxpIWFPuo0iOZAgWilc1mLiFQqN9ZmMY9lx6EF5chw==
X-Gm-Gg: ASbGncvA+nzilNVrBkB9E6mv18g+rcj2RpspgU3sGs7MH3PX5FilBSaM+zonLBh5CGl
	UWwnpz5vmgX3rL5e9GovJff+BdL0S+f3bKrkQCrIeWRXq8ppNxZu1QrBodjCQbcN34nfhgi4jXr
	5oB9tZUCWS1lCzHt2cFJAljM8H4QXzoixRL9RikVwbGrQ/NFYiKyqbkvLLyvpi8DZO9VdhDf0Uc
	Rk=
X-Google-Smtp-Source: AGHT+IGB6UUmFZhzqKjRvGV4lr9BeyGDE6WH9O1sGiazwi8CZoRnZBbYDI50VNLpbqgC1sRg+VYVXXWLsDZF+CuXQF4=
X-Received: by 2002:a05:6512:1587:b0:54a:c4af:15 with SMTP id
 2adb3069b0e04-5590071b7c3mr1264610e87.19.1752154748737; Thu, 10 Jul 2025
 06:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org> <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
In-Reply-To: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Jul 2025 15:38:57 +0200
X-Gm-Features: Ac12FXwUS6h2JE4LNA_vmGF3f9mhet3j6NKR8eSjHb_k-YJ2CoyhrM-67s3nQ-g
Message-ID: <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 2:25=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the existing infrastructure for storing and looking up pin function=
s
> > in pinctrl core. Remove hand-crafted callbacks.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> >  int msm_pinctrl_probe(struct platform_device *pdev,
> >                     const struct msm_pinctrl_soc_data *soc_data)
> >  {
> > +     const struct pinfunction *func;
> >       struct msm_pinctrl *pctrl;
> >       struct resource *res;
> >       int ret;
> > @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pd=
ev,
> >               return PTR_ERR(pctrl->pctrl);
> >       }
> >
> > +     for (i =3D 0; i < soc_data->nfunctions; i++) {
> > +             func =3D &soc_data->functions[i];
> > +
> > +             ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func=
, NULL);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
>
> It's good in principle, but we're now going to house two copies of
> the function data in memory... Can we trust __initconst nowadays?
>

Well, if I annotate the functions struct with __initconst, then it
does indeed end up in the .init.rodata section if that's your
question. Then the kernel seems to be freeing this in
./kernel/module/main.c so I sure hope we can trust it.

Do I understand correctly that you're implicitly asking to also
annotate all affected _functions structures across all tlmm drivers?

Alternatively: we can provide another interface:
pinmux_generic_add_const_pinfunction() which - instead of a deep-copy
- would simply store addresses of existing pinfunction structures in
the underlying radix tree.

Bartosz

