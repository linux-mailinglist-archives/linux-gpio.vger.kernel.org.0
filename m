Return-Path: <linux-gpio+bounces-20013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF937AB4F05
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835F61B402B2
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EEE21420B;
	Tue, 13 May 2025 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpZhtYvG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC92520468C
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127875; cv=none; b=cG6vL53BCmSKXDIJYwi/dI1GZnszrI4hSLDmQm65zLF+nfb/gGjzyhzr+nrR7T5ojEEP/rdTOSIZPQhSBGTOVaVVceTG5kXmlFO0COgFvfQsIEw5XwrsLDsh3HliYPkqJCopTK8mPY34zC7hmEYOhjpOthW4loW56aTDHxoyqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127875; c=relaxed/simple;
	bh=fYj5KQcmLHEMEZBytxHFM2PZV8baZG30rM4LCErfAUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdXYS5fX1pwJuguJtuMfuLLXzyVxdZTnQZtD3BR5XXTSu5q+RXusMuuIdJlTfm7YmPtm+nwe4gukgKLZcz3UZ/e2/0kdbVUsAJxfkBYFZ1zcyNRSbVqjQHVgBcrc4NxqcSAeAFJdIsAQHEldxMwquzzMctbbzGxCB9oI8BRnRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rpZhtYvG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-326ca53a7e8so37235951fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747127871; x=1747732671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYj5KQcmLHEMEZBytxHFM2PZV8baZG30rM4LCErfAUA=;
        b=rpZhtYvGCX1OdO9DcHoF55s92TPmzmY6DdTVtCEqd334WBobDLW3RPPl2JdKKR8kDy
         m7u1SrMSaPk0qSf5R9gSpL3lvIuDZm3Tfw+X08M9S8i2gvwSYoXljbSPk1JyJS2+B3RE
         Gvg1jLkF/tqcIheNbEVn4ZzH3AHNOVU+UwIccJ3kdz4Mpr2DtlQmd80M2uHfiXgmjDQo
         wt0HKMmFtQThRVfh0dGFUAZ9Rq5nzPTI/vZqL58ucAx5bVqB8GC2bprcdvFn8ApkMUQS
         TAOY+tXSfA/Byvx+CqitUk0tG7PzcMLIU05ogojXI3FLXaYYkqV8IZwDJDbElRJRnMp1
         3i5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127871; x=1747732671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYj5KQcmLHEMEZBytxHFM2PZV8baZG30rM4LCErfAUA=;
        b=Z1urwPch6gZtUQDzRjSZuEuy3hfdMQjv/JqU1G21E3rvB1KPek8s2XMelXXkw17rLe
         B5F7IBRIIC42egoBZuLE1gywy7+SSSDnqe+nRb4Dod6HkP49RzpXcIyFNLWxb0/2Y+CC
         xHe3Xf1Ai5xAx7QmbbaBoq5U9r6/pKakad/+lQSaUZlYzEVDt4JX+A16vcrFg1H5iyJ3
         R34viAjKWfZ5NKvG2DawModEGXwC+n/IVi/ZwcskZ6/gQqzo40yrig4f85vVrFBRKJYa
         I4LD2mqYOcrYwvQOxYimYApNTUfH+a8Sru5f0+2S/nzOItwvZ2HJULNVoJZbI5uD8vSN
         zqMg==
X-Forwarded-Encrypted: i=1; AJvYcCXAuL7pErKBJ/Lp+xFq3XDmWM6Av4zmZysNq03ic4OewUubwLDYivArPDhhuGi+pUUwfzbqzhbgq3yz@vger.kernel.org
X-Gm-Message-State: AOJu0YyobveKXkPXhCTUr73wLhk8tL3MzEo9auiybuUNXyaPEFVrt6UW
	jPX3wX1qXoC862JdEUGpmCNxI5in4PI2MaN7Nm7SP2gRYhRIzvO7mZR63942WMHa0J6oKgrGuaj
	ExWoHoAWRP/heJzoE80oyWIxDUdkmm/a53fdwuQ==
X-Gm-Gg: ASbGnculGR3H6sMv/n0VAH48TDUqV26KkLavANNs+jfxt1js2Xfq6HHt3KyDEIQ5yVU
	U1EE7xIcq9slzuN+Q3MUf3DWYk9tGyf5PI8nOtuTikf4jpC2ouSQKkiR4dXmahZNS9oqF5CT14c
	Cmmwr7h/eOcZRoDN+SaEcL5iuWDt+SNlGfCEXn8LE2OIA=
X-Google-Smtp-Source: AGHT+IGF5AAEtxjDLnWwB2KhlBfA9BpWe7QwP/k4X0BBbK9pCsdG9d1Hz5QqjrJe/oAyVtJZCXkbt+hJdfoDbRz+p5M=
X-Received: by 2002:a2e:a542:0:b0:308:e54d:61b1 with SMTP id
 38308e7fff4ca-326c4686abamr73346771fa.34.1747127871028; Tue, 13 May 2025
 02:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org> <20250429-max77759-mfd-v8-5-72d72dc79a1f@linaro.org>
In-Reply-To: <20250429-max77759-mfd-v8-5-72d72dc79a1f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:17:40 +0200
X-Gm-Features: AX0GCFvKQMhZ-KOCmIthKIc7OzU6GLwrFz4eRraag3cmXbQnfR3YMu1flp3ZUNg
Message-ID: <CACRpkdZUTJX4ht3CTN6AuEVRgbM38Bs_kLj2yx_NwrRCryE-uw@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 10:22=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:

> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

