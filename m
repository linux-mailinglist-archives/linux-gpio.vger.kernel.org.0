Return-Path: <linux-gpio+bounces-24501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0982B2AC8A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 17:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9E1320154C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 15:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C4F254AE1;
	Mon, 18 Aug 2025 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtUF3//N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D8024E4BD
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530284; cv=none; b=Ws4euq303+dBqNvYZITPmOzo/lMKUzpjhCIcsG3NGoxj4nzFg3gwvF9X07N97m6rfZWQnd/Yd9OC8b4VVLYkXraNbxCiVmNNjgws/SLWH6VOQy5OsRF9xZ4FH7oV4gLtjCszA9HUv0ljjEgKlVkJEFva8PTKPgtA9FvOL8VqjmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530284; c=relaxed/simple;
	bh=ZMr9xoaIvvzsvVDKBkZPG6cWCCooP8ZucmJRQKxCeD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVL71MOSuB+9UU4mDZ9BKUy+DYKN3F7zTaY7WL8fPfn9QD6CjNfOriA5lV4nH9P1iJCfBgnjALE6xU9bbAuVuEZrrltDpnYtxDBvo+n5yg2p5/U2sh02C1Cp8Y2giigUU7SSQF3RWqddnMoX9f0F5/eT3tITATeUvQoTo2VekWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WtUF3//N; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-333f8f02afaso34975821fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530279; x=1756135079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMr9xoaIvvzsvVDKBkZPG6cWCCooP8ZucmJRQKxCeD0=;
        b=WtUF3//NLZ7/6hLzLU3o++OolJELwmdrByUWCDGxI2WRn5OV/sXuEIqm79PpAd7/Zq
         CpJybuE4DU+X0K8r+iOaLiNmhnzULnDMdWiRovRmiZIKjJOv0nDKhMS+V1iO9qa1NK9N
         yhgyCSVBbZwYmpZH28VS+XwSqPiouUpkftA6XtF23HbWZBYdrb3KA2DnK3yVmD8STS4v
         +EK3lQHJhpjW+0jPv925s2tu1LOR5vKWxpMNcwgUxG6rsgbReLg77KlIzc5ni/aJ9ExS
         YNSOXpiqy+OHQPVyDHTeIGjufPfPTBLg9SXDPuNutPWCUkoFpB1dPPUFZryZWy3tkq1T
         jEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530279; x=1756135079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMr9xoaIvvzsvVDKBkZPG6cWCCooP8ZucmJRQKxCeD0=;
        b=unLF46eRauvLW1Dpnz+pUccryDeHZZfmDyQDHvEc4S3PBM1tNaAgrtWKpQiLNbNomW
         VH6lAUlYLlWwjED53nCOOayrMlSGM0yl4HsR4qfaEYpzaCI8XaH4P2tcXnVP7k/T5bZT
         S7ZxpeF30PvQjsrWU5YsJWIgjCjrOf+y6Bu9L7U8ya6ih3E/X3Lt7CFr0+ThLLGiPAIX
         r9ttiq6VyPGaftGi+gQDGU1J061drx1b0MVhsUDrP6jdawvmOn9OBKB9EiPf4xozTT5u
         vo3Q0ZffSgRYqSf2RFXbH2PYSD6oim3gahEY/1xeDXSQdwWmZ5+nNgjRJO5esvzr4mi3
         Xjow==
X-Forwarded-Encrypted: i=1; AJvYcCVy6IMvWRvGYIM7k5s/OPtHzgx79E3jd0fiAesVstlMKxOFHHmyH+1k8DowHdJXeuwoOU7sYFOpIaZo@vger.kernel.org
X-Gm-Message-State: AOJu0YzRk3Ers5Kbp64c9HcdsTlFztz4VJfqdM9w0xzdi6aun4ochuqc
	4q198Xx/gYCLUp6mUi6N6CKTgZc3zK8AZ1BlYN07KRW/8ckMpefXpp9IML8BHZHn+sbAFC+GtaM
	F6GCayk0ds5fQubuvdGNQrlTgZ+bVR4Z02+goa//Wdg==
X-Gm-Gg: ASbGncu8bNBN03W0ZgHDPe1UZjKtTd9NkdLLBOjetxuy+QlXCFJ5zBLqm5aOSIlsRIf
	cwk6LACR3TtqyBT+6P7l91imo2Kxd9kfQQm79BbI8WBpilLdFJSV0t9wjuMiEYgb6jY2jS+AJ7A
	ClrffRrZ2fYBt9yH1KPPjG5J2tJjlllyDMQ1AZlKKU9kqBmA8pSWG9qviRQ7sTwZ/30BgIQjvMb
	RzwKAQ=
X-Google-Smtp-Source: AGHT+IHpEkQH4zE8nZNumut6IyOKwzxXwXZPLXikec1wNlOm0bT1vQJ2AuF2DGHtOC/up+K5+uVQHVhxHrEqbksxztM=
X-Received: by 2002:a2e:be83:0:b0:333:7e57:67f0 with SMTP id
 38308e7fff4ca-3340996a3d6mr37277621fa.28.1755530279380; Mon, 18 Aug 2025
 08:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:17:47 +0200
X-Gm-Features: Ac12FXwu4f8Ac5IEmqGAiQiNmOLkl0amKoCINQhS7HVe6tsTOs7Qh5vl8eGuhWc
Message-ID: <CACRpkdYK5-Ga+TpwKSroZN_Tku7R7gwA6LrV52W8ydYOqmLk+w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: remove extra line in debug output
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: dlan@gentoo.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 5:08=E2=80=AFPM Hendrik Hamerlinck
<hendrik.hamerlinck@hammernet.be> wrote:

> The debug output for spacemit_pinconf_dbg_show() prints an extra newline
> at the end. This is redundant as pinconf_pins_show() in pinconf.c already
> adds a newline in its for loop.
>
> Remove the newline to avoid the extra line in the output.
>
> Example current output:
> $ cat /sys/kernel/debug/pinctrl/d401e000.pinctrl/pinconf-pins
> Pin config settings per pin
> Format: pin (name): configs
> pin 0 (GPIO_00): , bias pull disabled, io type (Fixed/1V8), drive strengt=
h (32 mA), register (0x1041)
>
> pin 1 (GPIO_01): slew rate (0x0), bias pull disabled, io type (Fixed/1V8)=
, drive strength (32 mA), register (0x1041)
>
> pin 2 (GPIO_02): slew rate (0x0), bias pull disabled, io type (Fixed/1V8)=
, drive strength (32 mA), register (0x1041)
>
> ...
>
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Patch applied!

Yours,
Linus Walleij

