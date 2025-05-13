Return-Path: <linux-gpio+bounces-20020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33443AB4FB4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDF81165E85
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F732253E1;
	Tue, 13 May 2025 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQCXBuIA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183D21FF43
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128428; cv=none; b=W0hiKq5IfmwLqn91qBJ1sz7BqvLwgHPZVBDSyb03Py0z4wkY4/zXceU9R3i514yzpIZXFieDnLVAAoYmBxlMuGdKCk+0RLPQdi8I5lzo6tpW9SnzZOMzUuDgWbTDefV42m3He5mnQktqgFu+W1RDSlfpy21Q0kjtNSP8L7VgnFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128428; c=relaxed/simple;
	bh=dBHjeKALgKb8PK7SZY/p8ey0dlC17faEy13K5JvMwtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuFNmSsMJT8H2oaR6q6SGYULg6huL9wZCk6RIm3H/9raY8Qhdrr2PfLj/vMMLcP0KhqBLxLLq9dY39FeMZUiC+EEUPjorJPnqTJPNRl8wWnhm845bed04iKjd+e1q2ILT+Zx2/hvzjo1RefDRLsa9azj83fSKB9GUN5Br7r62N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQCXBuIA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54fc80df9b7so5345843e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128424; x=1747733224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRI51hopg7WgPcKQ0KhMvn+lW2eJu7995NqNQ16hkew=;
        b=EQCXBuIAzkrJ0YcaH2GFD2Kn7IIkRf3EfASYuN9gmZmKU011yTL9ljYuZqcyDQgEjX
         DatySf72ZK7SO/csXBc9SsEQOhbG95HVAcWAnDdAk4rFptHFzcKZG7tsYxDbmvu0SOdj
         fYlQBpROD2x9mrbHBbHMsJ0G+mh9VHbn9HJ9FSCkrJKm48dfLbsFW6r6kVlsT2OilRG1
         moLllsokiYKYf/vq5+zzSFrPLAI6rdDF/q35GLKOKFTmBPJouZFE62KQE1UXe+xmGifh
         PNSwzVEGFN63bOlK8RoAokLHfdzXfA75TN4LXq11A9uq3/oimB9vsZKHIdBuHYEufTKX
         t14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128424; x=1747733224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRI51hopg7WgPcKQ0KhMvn+lW2eJu7995NqNQ16hkew=;
        b=WikxT1tfr+6s2qO/QbJto2XMOQiaSZ6AvAaX3kbe/SgNKPwdTU1suHfSskpoAEdn8n
         5yBpjPJFPlA6L0N4UU9wzftqrqJX7QKbZIgb0QamazgF/dF55cPbF/diU+xT0G7/G+IC
         5AjisC0LNnASbofUzsg7j+geVKjT3Kccu+O4uOXVmmyf7DQvHaakgIujPMC+m9wEmrlr
         SpETFaX86j7SejCo7pMSR/Kn9zRviXCWY0cEOMFaadrhjBrqM7W9EflX0aZF4f6f4xpf
         /9P6tYnGvcgRdgEVPuqtk+75MXVuTgAT5qUTJmfNORirDiPDRiG9lKL8rDSuzoXZfZQJ
         jXEw==
X-Forwarded-Encrypted: i=1; AJvYcCXyFCZC/e4FSJMvfdbvLpTAsQfzetL9CeOxHLP/xPN9B4jaMF5p5OCl4lBRn4s5kkqBAoU8tSdeOKH/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7dW7f0BFdN4ljuiYzymeYVsJVP+z5GTarlSkKrBkYIu5QMs/O
	ZCcY9+aIDW7w4/m98vczIebGmQ8n9nTttiwUD1I71c8oxjSeTpf0ZCZftuSIAJh1wqCyy66S4Hr
	hc3jZ0lEZfWDfkQ5oxxa14Q5PoJDHH/J+7frJfA==
X-Gm-Gg: ASbGnctHqpVK3LUQVFnAF1YrcYbjoMzxLQqlhmcLh72NrqS+8tJIAFjJMWpuy+lja6Z
	49QRtzb53R+u/Vq2I4qRvhIZV2ljelFk+B8Mbfom2C4R7uWEbQP02Sl1gFFN8nEQl+CL7evLuDT
	PLViBBjpmOt8tTeCG19xiFNTEz9jNIKCKU
X-Google-Smtp-Source: AGHT+IG9aZSpEQxvWlu8ce2CXwCkeQw4aEsqx0A7UdazXuZrCCQu4J181mxHBoFbawXCJgTrKHYOmXCDjY2BLlsEQTo=
X-Received: by 2002:a05:6512:6408:b0:545:2950:5360 with SMTP id
 2adb3069b0e04-54fc67c2233mr4949153e87.22.1747128424591; Tue, 13 May 2025
 02:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com> <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com>
In-Reply-To: <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:26:52 +0200
X-Gm-Features: AX0GCFs-_g09qTgH6m_jk6ylbKM6K0LWLr1kjRESYHMTO1WN6HIA2pdGmO-YFt0
Message-ID: <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

thanks for your patch!

On Tue, May 6, 2025 at 7:28=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
> On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:

> > +       /*
> > +        * hog pins are requested before registering GPIO chip, don't c=
rash in
> > +        * gpiochip_line_is_valid().
> > +        */
> > +       if (!chip->gpiodev)
> > +               return 0;
> > +
>
> I really dislike you dereferencing gpiodev here which is (implicitly,
> I know...) very much a private structure for GPIOLIB. Can we move this
> into gpiochip_line_is_valid() itself?

I agree with Bartosz. Patch gpiochip_line_is_valid() so everyone
can benefit from the extended check.

Thanks!
Linus Walleij

