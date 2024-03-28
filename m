Return-Path: <linux-gpio+bounces-4745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB488FA73
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 09:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 722DD1C2B83C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 08:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CFC2E645;
	Thu, 28 Mar 2024 08:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNoneo1F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8EC42A95
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711616066; cv=none; b=i1nhFvA097BBtjtpBI7fZfgdnJQIW89q14GqgwN7bqlpHPUBJFHua0q2pKaUnyEQIhIUjf+mrvbBnX0/cRFR1jZXE8mQv5xylgk2FTH5Ir3NjQ2GpBB+Eszq1JlfEXUQPv9bCCqsuevW0AgE+S2fNAcJeTEqA8U5qcPiAzBzAis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711616066; c=relaxed/simple;
	bh=Dlwj5ZaYYOcJu8Ok+9hC2v+Yow7saE1lH0jHScZMQDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otYPgbkwgFs0FhCgp4uSckEaQbIifIjXzwJXghDNLCIf92cQAHjIHa9MxgXqyr+HM6DOKzdx7sBa6Ko5q2Fsr1qATVYrfo4eZs2QWa0Yfixshf584RexTng1lZEH61HxxvfX2EWuaRtC1LKYusex8+H4wDBfH6oA1qcQVBFOppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNoneo1F; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso586183276.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711616064; x=1712220864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlwj5ZaYYOcJu8Ok+9hC2v+Yow7saE1lH0jHScZMQDI=;
        b=DNoneo1Fj7zxFNbuc1qOPhyZp9+J7zHtQekpPFAJ3CeYrDzuNHbQgwA23vg0Kk9ooe
         yOAoTW8c4t2NXfP0nEgvJi+SZ18ir4Dgr9fe+DHXCAP3n7/AaGKV3AsBWMMquF8Zgghd
         o0AzPSDsf3NJWdl66zGG7IrJ+B08oWzdKVK9J2pld50CtKW89T3VhxfuU8ES6CPcPTZf
         z2JgCdioQM2GPJDc1xi7ttW1u99efaGaGR1D0DA4A3FkXJdlGhsDR37/hMXrV9vMfWj0
         YlzWlB80g3HATl7Bj1Op7N99uFka7E+uhpPKA9xJv3HCzJEAiOGPay7t4sULypRI1nMl
         st8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711616064; x=1712220864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlwj5ZaYYOcJu8Ok+9hC2v+Yow7saE1lH0jHScZMQDI=;
        b=UYmGLYSWjULRCYxoCEH9Q+3ft5od4A5SUTx/dk3v/UhVDePpj1syM7mlXjC9kstzxz
         XfNpMc8GkHCdguXUYQJ7df1U81IoZejfWhGMAYyS316sCKg6VP+v8GzBiwHVaWn5nJ90
         djHrZvjgu5UwTYkB4MeA/EWLBSitrRNCx6kJpy78ANFH8j8g0dufmCDELM2gCTY84Ipw
         9j/Ud/3XjiMyC14sRRY3ETyrD+F6EHMz83Cv366v7cjF22CSh4mWu5e9LiOrKQbnXRJH
         dqApc59PsXOsGSfWm9HicCalmlLD26f29Id8++Krp2+MVmlbdCjBuENYfuBInIz6i5Q5
         +cbw==
X-Forwarded-Encrypted: i=1; AJvYcCVVUNypX3mUvfcsNg7K7EO5tf16Ubvka6rNYhwkIPhfuyTwXwvkEXAGRoxHXPIKrm8Gid4EiO4woCBbN3sIutEPzoG0JPSYiAbqaw==
X-Gm-Message-State: AOJu0YwmOgsb3SLWKtEIIXax9drahx+9tN7/5A7N+rSzuwglIywmIza7
	mHoyTh/Ju2o1eXefNuEMB7x1V7zwm6fCEtYdaO979h/0gw2yxtrmQagUF2gyc6bbGc/cIDxvacu
	JbHXZMwv0eqTtu3jAIXfPH8JA81aqf2BfeQKSSiR+C0yaIo3p
X-Google-Smtp-Source: AGHT+IFnSUR451w83koEnu6t0GdD86PwzKI9rPf82IN5plnY7aRqaMs5krZhIPZHIsEN9OJjmvCgwSqZqXhh5e+ePjs=
X-Received: by 2002:a5b:748:0:b0:dcc:32cb:cb3b with SMTP id
 s8-20020a5b0748000000b00dcc32cbcb3bmr2632651ybq.44.1711616064245; Thu, 28 Mar
 2024 01:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325090242.14281-1-brgl@bgdev.pl>
In-Reply-To: <20240325090242.14281-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:54:13 +0100
Message-ID: <CACRpkdZf5-QR0aU+jhqpsCbNbD+57TN6Yq_Naq8JoLSWSsM8kw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: cdev: sanitize the label before requesting the interrupt
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, stable@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 10:02=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> When an interrupt is requested, a procfs directory is created under
> "/proc/irq/<irqnum>/<label>" where <label> is the string passed to one of
> the request_irq() variants.
>
> What follows is that the string must not contain the "/" character or
> the procfs mkdir operation will fail. We don't have such constraints for
> GPIO consumer labels which are used verbatim as interrupt labels for
> GPIO irqs. We must therefore sanitize the consumer string before
> requesting the interrupt.
>
> Let's replace all "/" with ":".
>
> Cc: stable@vger.kernel.org
> Reported-by: Stefan Wahren <wahrenst@gmx.net>
> Closes: https://lore.kernel.org/linux-gpio/39fe95cb-aa83-4b8b-8cab-63947a=
726754@gmx.net/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Good work on this one!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

