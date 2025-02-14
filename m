Return-Path: <linux-gpio+bounces-16003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9747BA35BE7
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 870A83A9329
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B3E262D11;
	Fri, 14 Feb 2025 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HxWn3r/m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7736B261579
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739530269; cv=none; b=edTQDK43AO5Kd3UE0ZUkVCNfuqwkxt/vyluVAUPG2P543SsblRGppC2wx996Hacho90UwrZ61tURjvgVqihLyB+glcVCC/o73rpMze2CFv2QnRj+Uh95XwhlcYg9wEfO6HkuJTf1xogB4HXGXQWaGclGlRsKMG0V2+3DQOVmJTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739530269; c=relaxed/simple;
	bh=alJg2WcD9iQM6fGzOSqq88snKNzolPtLioHOdfwRkxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8Q0YEHFzu5nLIHycJpEFK8e8WaFKksCn+PKFsk6oWwsEBBQw8cVqBy5XuRqtSO2ABdt5TvoNg6UKBRU19BgkpwCMcMclXAnEwP+KEI7lB1G7bol2S1FgH5pd+/TMGL6VIQ4DO+wZ3lt/JhQKd3DBiXgqYTpbR1MudOHgz5XySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HxWn3r/m; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3983426f80so1540186276.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739530266; x=1740135066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBduhfyrGl1orMroy4bKyOiFO3o97dU6DIccqVmntUw=;
        b=HxWn3r/m9to9U7l0DB1D+HQ38tPwiXr10r9KQjrYqXuTD7EkwMaZ/6FjVUjV7ZR1Uo
         Do942nQJs8P1GwokrV9Vmc1LhwflIDBdyOkllr0kmKqM8Mn+AWaUb4EvYEMI0UVquGrm
         3Tcz6VcndL9jmiAJnnktCwsrtjJ2XiqoguoZN7INDFvkvTZ8RPQ8f9AAijLZaLDmkcOH
         8ThFfP3iE8ZYeRWFE7zrIaz5gM1o12pfIxegQ7PNFaPrjG69YZPit/iQ0VlCxN3b82x0
         69cPE0UX++0i6p0+4mNFnyN0dxqe4ISFLHtrTY/1biKTJInegBuG9GmBGXGda626LHyu
         ktig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530266; x=1740135066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBduhfyrGl1orMroy4bKyOiFO3o97dU6DIccqVmntUw=;
        b=tu2jAliuWt/n4ykQTjDGNdcQezxoofuFqleCcU/EY2zWbpplORSQM1M4e172eXwjhU
         WJ232NFIPqoo9tXSDXxSQejFBotGw9job2y3OSB9prpeyU/PZsvPBjXW6jCGCFy7vRKT
         c/MGeoku69zPfWvXusUzNWy/IzL4b4EsYt1Oear9tt9mGxvFr/VL0aoiGavlQJPR9Yft
         70oUVCGJFO23rA9qPVo/zwKHuX0FQQ5lRL8j5+aoosSZMv8JXjvhbOMR24SYwtwvucw2
         2cSE1V+vtEXAeHhqpQYZBmb8CIGIAVv2BQF3Ffcub++MQmnLPQSHPxvxntuLIG7ycj2c
         fVMA==
X-Forwarded-Encrypted: i=1; AJvYcCXLKVmtxJEn2DI+prd1aQLp1W2xplY54Jf+7bZN2Vp4dRe3Kq3VPv8xZHmJUP3xPw/sJ5w+Bep7S+y2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7S6GWHtKTWIypCgUZXcrxLxa9zIc8UCwQUeqa+lFn6GadCscE
	SsqcV6goHR3Ts5NxPbeSy+YhaFnRJviacZ5gxB6tnrlU1wVmnZP0E5aiE9Ku3C4dW+JJN1tBQsu
	+tIbK1c7kTuYu8sIkeWjzltwt36IhHMbar/LWnA==
X-Gm-Gg: ASbGncsFQ559cLxTTrV0XLS5v3bcnkOMFVKNCaxZEmO09XIIdxgfOqfjwh9z007pl4w
	4uDZA5E+rKAhG1UtxZ4Tr9Xdaf2E9aKdyiFIBZZ3E3I1jFnms0QrwancVg6QlsJxK6pOxXOQg
X-Google-Smtp-Source: AGHT+IHidm/OUIrPoTNLFfoXmDjCrIHe165QqBxdPohnxcxXbfU4pkw1WYa0Wj7VC34edtxzM/mKMMh7Fkc5qKhmOG4=
X-Received: by 2002:a05:6902:248f:b0:e5b:1805:36b9 with SMTP id
 3f1490d57ef6-e5d9f0cf5f5mr11331525276.5.1739530266311; Fri, 14 Feb 2025
 02:51:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:50:53 +0100
X-Gm-Features: AWEUYZm_fywgHZuf6Chn0j2bDWPXTXWiYJbQTiIjd_fKw2ukXp9mOnuyypUOJCk
Message-ID: <CACRpkdao27pu+9qFH2LBYNwYkBbWq1B-hE9nZGfTTCnQxhTiAQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Walle <mwalle@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 8:56=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It appears that regmap GPIO doesn't take into account 'ngpios' property
> and requires hard coded values or duplication of the parsing the same
> outside of GPIO library. This miniseries addresses that.
>
> For the record, I have checked all bgpio_init() users and haven't seen
> the suspicious code that this series might break, e.g., an equivalent of
> something like this:
>
> static int foo_probe(struct device *dev)
> {
>         struct gpio_chip *gc =3D devm_kzalloc(...);
>         struct fwnode_handle *fwnode =3D ...; // NOT dev_fwnode(dev)!
>
>         ...
>         gc->parent =3D dev;
>         gc->fwnode =3D fwnode;
>
>         ret =3D bgpio_init(gc, dev, ...);
>         ...
> }
>
> Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Thanks for fixing this Andy!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

