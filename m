Return-Path: <linux-gpio+bounces-20106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6FEAB5EF7
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 00:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 112921B47879
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 22:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C93B2066CF;
	Tue, 13 May 2025 22:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vo3x8pcQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3974E1E3772
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173662; cv=none; b=lGXHIPahTUW5oSqRUlJQPS9u4RRsv4CKjvf42oB+/oWjp6LtPlciR3B3FEmYKHAJNWQALa7HNNxfnzitKW/LLvfoFNyMj1Tld2v5eeKPpDvUykSPwgueEpxCQSNc7nTabWZsE53Xc54rbyKHiJQ9QSZ+ngMwHp0/ODtYnfLmUcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173662; c=relaxed/simple;
	bh=M8KwhjSS1RRu3vcmpn2SJ50X7pXkQM18VTy/pRaCHMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQbc0+Dgh01ogiEB+UV66k+jwqycg9Kq/c6/mOZTwzmSeX8HraHG3TdUgiaOHH/9swxxO46rjlQlgmQcKWyZ70PUnjBJ5udqRuLsZHpyg8d1O+Fr7f2wKfkF/PcOFeERsNQrpHOtMcUpSWdtUhYFTc3oot5GQ2k2vkmaIRqvA9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vo3x8pcQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so6538228e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173658; x=1747778458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBfy0IwztkKYuj0G9rqTe8PA4ZbPefuZXYlpy/l1Wu8=;
        b=Vo3x8pcQZ2HFIPHzMA4ouSxGDci88uoAiujFtVopnbPUUOwvAckr+rIqapjT0Zdo/0
         Wigf07pjgHY7g2PW7WKYcwG+xJv1hTw01zFO++o6MfyUNT68ZB4o0aJQNob+cWFm5fga
         JJiQgxAQPeVBHpa+I9Hd4wLn7VXCgVmm25lqsNa2ZRcndZSQyCX7Mv2/DykEziiFuKAd
         Q8VkNWUXIMgyYO+3e0zr+D1YjL9wtM98yAQGIQ6p3S2IufpwLDwFY42VzXTuuO0IE3KR
         xmT+dGMAbtnLdpTJTa39t3EYGX1Qh6sqgCop3FFvQADTbKDMiY+Ho7HJoBNoyltCtOxr
         OWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173658; x=1747778458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBfy0IwztkKYuj0G9rqTe8PA4ZbPefuZXYlpy/l1Wu8=;
        b=uEZKXLvhKWUqp02ADeXQ0YOTlFMjTIKmnHcMmD7FphMxaFY68k1fkHQlduHaub6Wwz
         rjnkcwi195OaAc99n+FO87au4WMjB301Fe1c8+EyBU0oVHWwW+2XDljUn1LP/QrwFGvA
         0KhvBv9DXshvzQMP6oKTmmKDhDKRyV0VNCEhYxSuzkbJRTVyxy/8vT6ugSwsCAEl0ucP
         fP4lwwn12uEVgMrQAB8HIiFe7sxudxzWuBp38xWmEKhNBnr07E2Zd+4MvtUdzA+z+UwI
         yJPFxByWZ35cJz9i8nhXbr7zQoInIwCOoMiovgxSE6cmOFOdH85X12jiUkpPHVf1DsH+
         79zg==
X-Forwarded-Encrypted: i=1; AJvYcCUYh9eWFlrmuxSVKDZ7hZydN/mfn5NcqYKVy9CnqgwQ+I2UQqDRze1XECp9h9dAD3bkcny40fnsszTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMx7eRWKQnQyjQJT3BCuh21ARwCHCU31lfTPQ8Xhpsavbd9mE
	hzG7OWQ6x8H03jOyEFcjGFAmmLayCeMg+DukxJPs34g3vldKUXeMFqiNESS+XH3BWjDWoxl+lKE
	XRgo81tH0Tr8gcE0xVvdOw9DFz5tqV9TKru+bQw==
X-Gm-Gg: ASbGncve/qjpiseFSV713nWx1c5awGC0quPL7dZ3k1Lzev9UMy1sCHG477jpgWZ6Bqr
	QJnF114jGxwqEv6orCniDz+qFoOfKUjsavQHJunBIs6CCrYG3elTDjKtnExm6lWIWvFpCDHoY9M
	DMSVCRFJZT/Xqxx+8Qt9lcZIpQajFjpdqu
X-Google-Smtp-Source: AGHT+IF6oQ8WY4oAI0j38NTw42hro7gIMITGeTqxvpzWEjohz93RMVVPR05oQB98ewc/+Rrp9dNkz0FCv7tTOl0hN8Y=
X-Received: by 2002:a05:6512:3b86:b0:54e:a2f8:73e2 with SMTP id
 2adb3069b0e04-550d5f97caemr383042e87.18.1747173658262; Tue, 13 May 2025
 15:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
 <20250430-max77759-mfd-v9-5-639763e23598@linaro.org> <CACRpkdY15L5PpV9ah_0R3ZPZVMh18OR+Dg2qXiBG=8Kq79-rjA@mail.gmail.com>
 <20250513093414.GE2936510@google.com>
In-Reply-To: <20250513093414.GE2936510@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:00:47 +0200
X-Gm-Features: AX0GCFuY7ZYIvbVu20D__GD0c9z8y0Fmgn47-CA055_0KC3QdyO02dOBRgGKdxc
Message-ID: <CACRpkdZTB2NSZPYU=iMEFuH=rb3HWVu2A=8OY-sq6X00ZPq9wA@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 11:34=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
> On Tue, 13 May 2025, Linus Walleij wrote:
> > On Wed, Apr 30, 2025 at 11:03=E2=80=AFAM Andr=C3=A9 Draszik <andre.dras=
zik@linaro.org> wrote:
> >
> > > The Maxim MAX77759 is a companion PMIC for USB Type-C applications an=
d
> > > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > > Port Controller (TCPC), NVMEM, and a GPIO expander.
> > >
> > > This driver supports the GPIO functions using the platform device
> > > registered by the core MFD driver.
> > >
> > > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> You're only 2 versions behind mate!  =3D;-)

Yeah I realized ... I'm walking up the backlog and there is occasionally
these double acks...

Linus Walleij

