Return-Path: <linux-gpio+bounces-6630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEED18CFB40
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 10:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90FF4281892
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 08:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916AA626DF;
	Mon, 27 May 2024 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpK3IUAV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923047F59
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798167; cv=none; b=ummOtVEkIRnvcDKLFWLUWqyzv5JnGrwkKa3TnqA73qI2iyN/NckfMyns+bRdXeJ14Dw2HpGImtWGqy4Us7UoD9JeoZMCWw+ofF8URKPp2X/IavoWQmsluSLCyJRhw/3nP3SgzHUrQHuvPKo3iS2QC89hL+66lAfidrYWBil+CAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798167; c=relaxed/simple;
	bh=RhzbyoYzei8nki7Y26C+6sE1qATDlhF0eguNRuXHJPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVRAIDXVqYsHP/DjjLFD3aWiG8EOpKHBNMAyHH/xQIuGMhlmjrKjjz1kyV+y+93TEoAF/cgx/5RravVNiMjbPZ8wjIgTYPAx+LUWDOWlOFUUrnExPQWtQoao4CT3xpnk5cwPLphBhShHmqLsjBc+lQPZCc21D4og7mQK82Hrkow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpK3IUAV; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df7607785e9so3267512276.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716798165; x=1717402965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhzbyoYzei8nki7Y26C+6sE1qATDlhF0eguNRuXHJPw=;
        b=IpK3IUAVHkuLq5cFBMWkOM9Wqr9LRKjQEzRonjO7sAl/0fTBdQOTmdKcWwPTvrVU7L
         qADdDgQomKOrpr7KjmMaciELdRUMRQmM5DVAe+g1z3RWFAhqEJFrhVeC/ZT4AUM4OqHp
         9zLmczQo+A/ZCcxPnF8paLOtMw7Jpg7kJZE7doZIoOwTyuWIlgLwpuOchV+8hwAdORmr
         Jl43pmXr5iA7UExMmWd8XOH0xcIDl2RS3mecKtI11SEKKaTYU/dddZn4/oAe4hb2KnXz
         zTuEUJfMiH0KZesUsYDL32CA3DPAN23z/fyQe8JjwVVyfrbzgRLxMd1mluG2I+Ov9k/D
         7x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716798165; x=1717402965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhzbyoYzei8nki7Y26C+6sE1qATDlhF0eguNRuXHJPw=;
        b=KlCtGdtHEj93uMwhEjS4IY8LKrkb2zleYW6Nr9fLl2mPsk7y++6YXXbQcTSI2daT7R
         b3n5sjiaUqJ93CmegWynC3gABV5LLIJYz3pjJOp4K6mvw58KaZ90GK2/Y/BiEoCKty4b
         H+Q7MreRmL7/E6IvBRYac8pWezEG6ECMfCKE/xjq/uvRxvdGrNnhmJm0+MyowhKdTffF
         cqwKtuMIA8hLsnLPDiuQ5u7Wru5ym8T4yihBZAJdD7eIS/U91qe0pv3/3xRZiXvsRLg7
         y3gUHcRzaBWKxDPApFHJgBRr/4fo8s/NRueyfx9RKPMpl36RKunMQMyNgoGAWKLCAEqt
         XI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyTmEww2ejZgTtXVBgi5+g9SF5oR9EtYsnmuDo4GXJ84z4h9k1BwmKImL6ExSg6WcJNyO3/3Y2CnOqg8ck+WuR7jghvqWqljfSig==
X-Gm-Message-State: AOJu0YxQLtoofuJ0M4puD5cb84nwZTPuvneDwrWfN0H72KbVBsD1b1zc
	o9SdGSWCr8F42uq/LznpAMdZNwWcsjYXNbuWByk6Oc8AxO1YGuOhJnbIp+aZnoEHvx83D6j2udh
	XL/mmmR7qFoulsW561/mP2XAhr+P8biNfftX1YQ==
X-Google-Smtp-Source: AGHT+IFmRtGsO9RnOjJLtqMhlOev9FBEcciYuxHiQcnDIeAfRLJmqIRkGsC2dgKZmDVlb84ZKNyPilf8+td5vWvPK3U=
X-Received: by 2002:a25:ad99:0:b0:de5:5084:715d with SMTP id
 3f1490d57ef6-df77223805amr7696603276.53.1716798165010; Mon, 27 May 2024
 01:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204220851.4783-1-wahrenst@gmx.net>
In-Reply-To: <20240204220851.4783-1-wahrenst@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 10:22:34 +0200
Message-ID: <CACRpkdYmOECdug1g2gYxjHZ-+Y040SR70UtDAgKD8yCb58Ob6Q@mail.gmail.com>
Subject: Re: [PATCH V4 0/2] pwm: Add GPIO PWM driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	andy.shevchenko@gmail.com, Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
	Philip Howard <phil@gadgetoid.com>, Sean Young <sean@mess.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 11:09=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:

> Add a software PWM which toggles a GPIO from a high-resolution timer.

Is work still ongoing on this patch series?

I would use the patches and I like them a lot so I'm happy to help if need =
be.

Yours,
Linus Walleij

