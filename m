Return-Path: <linux-gpio+bounces-12301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC819B5F9C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 11:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 077181C2188E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ED51E04BC;
	Wed, 30 Oct 2024 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rlgLMOBj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E311E283B
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282372; cv=none; b=JMlxGQpW14ObHirgaye9DYPwnZWrg+ooMc7sjh0A21V4mtvSrKUaiEiEiRZbYJxVKfhwbFSVfjMr0wdZmE2qa6Tkjcsa/hQwOr+JsJIM44IavcN6HOoZo+jbdyIevuuxpszI70MuEj3gVIcvXHFqiIUeFXNMtN/yU0Toh4f0p9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282372; c=relaxed/simple;
	bh=iGqrgvqdsygpPt5o2JbcWPHpoKlMxM1VXeT/riCMvAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSHVBJaoID0HeEhv1zdSrtpxOWG01yTlfVS5PWUuSp9203c/R0n0jWubsze/TXnn/YbgQcAk9psQFBRm/usXEnma3ULm5eENS0NiDAY1fCZY9N6Nh1yy3bTbQ2Nk7NoOGeARACtXS/JjSBTqC76AFA9OdIz1lO0HYxHIGpdID9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rlgLMOBj; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fc968b3545so63777681fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730282369; x=1730887169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGqrgvqdsygpPt5o2JbcWPHpoKlMxM1VXeT/riCMvAU=;
        b=rlgLMOBjvxtacDAk2teY0p5QvNlyTGoZ7u2sCq0SCrTwrepCXYifa+LVzTOjcmceu0
         PJMDESXrrijq3pmWfXHn/aRm/8aKxI25OvFkcCk7Ce8rUwNz6ydrjz2CEfq3FEDUX7eY
         dg5HPSf7X8u4brv7KgxeeRVGNnDmMQ9OUdxaaUbI75WNyqjqi94Af5G1UeNnYplaO47x
         hFKM8/P1OSq2K/JXEGgTcJIFG2GdzsVxURJ6EFeEtwuVk5Eiyp9ki23p0+DfEk31podn
         trMdc1+yr6lyft8ilepkcvJRWMgQVJpS9j7xGY7W4+Z5fyf2KeAIekm8Ez6oUvV3bgBh
         nCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730282369; x=1730887169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGqrgvqdsygpPt5o2JbcWPHpoKlMxM1VXeT/riCMvAU=;
        b=JOkC7fg/f9gBLFwqgwY3oeOO93yl254tbQveFNMex7I8fBPXMMC8iS8yMIeShuMvte
         bjSl0LI7E/9WngEgWGLlA8rX8JZrzi43LuAYurtWsrraMeVQ7wTeh8l/z1guEvUMmFlC
         yoyWySJJp7wvSAPf/frgD9Roda25GzKjkUilXXOqEcEhYJm8ZX3KbuVmcVdSAHIPMoOV
         XeKuOiU5hE9IB7BKVzEakXffJrRlEzmJnrovzTM0O7SykZCuTPK4TS50rl63t5rqOJZy
         3U/hemESPUeXLIYGusBSUiReSYVt4r3eXQ9X6rOpOt9J1ZPgZmhgTFqoOsE386gawGjQ
         Wmkg==
X-Forwarded-Encrypted: i=1; AJvYcCUKgHA8uHtJHS1zZp5vp+q0y2cT1hE0JoOswbzyYcLadoxappYzcZtPEY7ze2h/7fO135XZYniKyTdl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27QiCIIrLUAC4fA1Jivz2uqubpHWN8mc0C3RWSdodCWBHd7vp
	kDx76MqphtelIsO5trVfJfOY6dhQOXHdDkmBpFE5Gd5ntgIxbDg9RcajKwHVWN7yjtclXFptjVu
	Ynty0fqzVDFO1lUdfljqYnojyuQMXf/iiUpxMEQ==
X-Google-Smtp-Source: AGHT+IFXXru1w4O79YJkokUSqsK/b534bxUSW6ND+qFP6cPz7SAaoo8kaTOyVhT0eJkbzZjAu8dBjmQDQZeoweMx2/g=
X-Received: by 2002:a2e:b895:0:b0:2fa:d354:1435 with SMTP id
 38308e7fff4ca-2fcbddfa6admr66447451fa.0.1730282368618; Wed, 30 Oct 2024
 02:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org> <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
In-Reply-To: <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Oct 2024 10:59:17 +0100
Message-ID: <CACRpkdYshPusdA7bDW2y8H_wp-Fm3N-YCsY1_Qn=dZqRiFy12w@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 11:03=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Wed, Oct 23, 2024 at 1:21=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:
>
> > Introduce airoha-mfd driver in order to load pinctrl and pwm drivers fo=
r
> > EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> > needs to access the same memory block (gpio memory region) to configure
> > {gio,irq}_chip and pwm functionalities respectively, so model them as
> > childs of a parent mfd driver.
>
> OK someone has to merge this and I suggest that I merge patches 1-5
> (all bindings and the pinctrl driver) since the different bindings have
> dependencies between them.

OK I have now merged patches 1-5 to the pinctrl tree.

Please iterate patch 6 with the PWM people so Uwe can merge
it when finished.

Yours,
Linus Walleij

