Return-Path: <linux-gpio+bounces-4032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 822B686E1EA
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 14:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C96E1F2305A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 13:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BAE6D1A4;
	Fri,  1 Mar 2024 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSPzOwDQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161A26D1B9
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709299261; cv=none; b=pmYeRPMJETAZ7KXo7xIS0dJbcbu3pLAgsMWL0hs0yrWx0GYtt0wb2CGCv8ccJ5mvUxa0zR2U0YCzyughW7+6eL36fRBSBS/kw7S39v/F1I34lr4sUa4Y4qrNt68dREsbGjJK+jXcoCjETfrgtPSh3VYXwjo9NcPMKc7MheOC5Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709299261; c=relaxed/simple;
	bh=Puk839lDWC+HGy6U2UGMSUEFx9zP4Tp0fYOqsKrb7Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqAnG4BDvSqmSix8IXjYFnZoRAwqgiwQSc117gK358W9nIGwft9Oxl1VIy6cRuscpAoc2fBRp8lwSa3HZUFwHXJYTzp53XKYDeEYwRK1O+b0zQ0EFm8sJ7cY4UAvXBNu5KHW15l7jCY+Nv0Hpko0CdHj7dYYRwp5+ygZue+47Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSPzOwDQ; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso2114335276.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Mar 2024 05:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709299259; x=1709904059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3ll9w+B53ecYfGQVivzWjoB9HX8Fyc8itZ0WcoXvQI=;
        b=sSPzOwDQr+bV/U2U2tYDT93cqUp9dOxr+TU+L9AdVrhiKHGMu0J/aMgRXHVKOaPbfa
         DZoG5/m1/hWD9AZOy7pyQBoTNc5HKS7FpECk9zPuNmzUr+LlBwmrzvqpbWnUn2NWFTb1
         G/VmRnous67q4auOlXeW22dMwBBU/tWq0z9YpWNwrOp18BS2tmwcqE9mRpuzqWoOi+cz
         2RjNbA4mOG5v80946gC4F91NnRadcPjAhWHZgPDpxuZ6Z1hTKMxmVEcWoI/9XGEAVwy2
         FG43ixvuqeY85TiJzMCcjQRwC+/4IR+UaVPdvjR6apaGA6I7Y8wSJ4XwM0zg0fkvq110
         n3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709299259; x=1709904059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3ll9w+B53ecYfGQVivzWjoB9HX8Fyc8itZ0WcoXvQI=;
        b=Qha2EmvdraKFQA/vlyfz8Qacgvyf8gPdQis/tqcdJKfJw/kQ7p/1pfltqzdROlrS53
         x55C0rCS/yMns0VyU1ua31LksDJwr3UVj1NM8y9i6JgaDvKDhcek1sh0xnwLS+GYxNjL
         GqlwJtd1CD8EGxH4QkAiMqvQe31S/EoQtHH0diTgXhMMIiCUeeFRMLsLpXGxUZsMJYkP
         cDjdBL4JhroAhv9c3CLfvKivPqQTzx5qQsZwfD83pEV1UrPOLBqsJqA6f3Oqmx3IJtpX
         JFDMmtm95rWCSf0p16MawFi0FendV+ptEfbY8Vz3XZALqU5nqVYwATAD7QWWc4fkAhHP
         lyrw==
X-Forwarded-Encrypted: i=1; AJvYcCW0IJmREA4K3v6RZCHxHabnqshZQQimPtU9U0n3lW8Yo8YO2RXfv84Du6gy0z5yl8SDfhKG+h9q8AUzAerqxxKa5SEM9oZJqiVOMA==
X-Gm-Message-State: AOJu0YzB7s1l0LKdmvDvCpnMeXzyHPQIqXQIrRDLeIoU3972p6laZCFE
	Fu0mc0aMkAZkeJfqUpK2cp3fJTPKCpl3pTRggqnSZ9Zjm9qHjeZIL4GPJM6KaJ811EGIKhNmezN
	849AudEsBOYsqKTatkJ9u9aL4PdpMewGdbGOoJw==
X-Google-Smtp-Source: AGHT+IGvVCsgJGWBa73aQeMrHf2ksCRin1Uk1ffoptwm80Cqr6qGak/dOmEQvxFlpuF54PTdSKPZZJEEShsfPdUgMpY=
X-Received: by 2002:a25:b31c:0:b0:dcf:fc74:358a with SMTP id
 l28-20020a25b31c000000b00dcffc74358amr836187ybj.10.1709299258922; Fri, 01 Mar
 2024 05:20:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229-awinic-aw9523-v7-1-b62d0d2963d2@linaro.org> <0194039f-e1bb-4b97-b8f5-b8034fe13f63@kernel.org>
In-Reply-To: <0194039f-e1bb-4b97-b8f5-b8034fe13f63@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Mar 2024 14:20:47 +0100
Message-ID: <CACRpkdb1U3HbjPATJo+DNoMCxkj0dk7Rk7jG974qQ0kkqLruSg@mail.gmail.com>
Subject: Re: [PATCH v7] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Bauer <mail@david-bauer.net>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, linux-gpio@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 10:34=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:


> > +static const struct of_device_id of_aw9523_i2c_match[] =3D {
> > +     { .compatible =3D "awinic,aw9523-pinctrl", },
>
> That's an undocumented compatible, which we cannot take. You need binding=
s.

There is a binding, I just merged it yesterday but that's not easy for you
to know, I should have pointed it out:
https://lore.kernel.org/all/20210624214458.68716-1-mail@david-bauer.net/

> > +MODULE_DESCRIPTION("Awinic AW9523 I2C GPIO Expander driver");
> > +MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@s=
omainline.org>");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:aw9523");
>
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.

Right, I'll drop it!

Thanks Krzysztof!

Yours,
Linus Walleij

