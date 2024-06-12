Return-Path: <linux-gpio+bounces-7384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1898904E23
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 10:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51AC8287F04
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 08:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E3C16C871;
	Wed, 12 Jun 2024 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfOho6/J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ACE16C6AF
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718180899; cv=none; b=SSIzfcCqCZZgxEO51c+w8k2daaFyQDoPAm4plNzUFgs38IMnzXGxBpZC1YVTcJpgaRYyzn4J3N5Fnk6FlKkAlM6AXryeQUEbKFQkwMo3812eCIugaTSIrSkmvq47sKa3y7fOQ2uCHGxXjkBQducgq1ZkpOXEeRY2SncE1uSrckw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718180899; c=relaxed/simple;
	bh=iHIU8qQAgMpCHnZdsBr96lYDwhYrXr8Ml/o4WS6UJE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKCdENEqal1dv9pTH7sbi7dyxiGMfdx/0lb53bhHlC9UPCU0w8+ZA2+yfbvE/uF1znTHGzQjv5+694LWlKk3Ysb2mfjKqqxcM+eNiUx118LrKjdQ3LlHcK/YnkSorfosRgClHt6S7+NR/ZREZjciDWzlGcoDPO/QLlL9oirUaRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mfOho6/J; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52bd48cf36bso5382985e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 01:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718180896; x=1718785696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHIU8qQAgMpCHnZdsBr96lYDwhYrXr8Ml/o4WS6UJE4=;
        b=mfOho6/JyUq5kz4e+JTU2FVSplRAaYyzdnOQpWqaMth1l2C9TNaRm6zhBBDNINt5a1
         G/Ie12pgY1khHo4vjOzEanFpPe4bgM7VBow7uXbj2z92rJpLVVJfReyZNg7PQfaLCeh4
         sH8Ikhz54waiCD6+z8dxHxnIqTZD15ZeCqwHjL0brU5QGxwhVqjHbLXYFsYyIQMUGLPz
         iqilXGieWJJmoa/D8OxLouFSYjqzKQyDBAnGXDcvwAWDn3+8cJuaDxvR+0fVARIBK0OG
         Co3xfQsiiuq0NcTTazH15SvjTJPgyTqSnAXSztvKjGKwGoQnSchUF1m2PWhvLlDnJw83
         QnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718180896; x=1718785696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHIU8qQAgMpCHnZdsBr96lYDwhYrXr8Ml/o4WS6UJE4=;
        b=Q4VvZkaMyoLMh93wKNL21QFCVJHZJTMp2CwZmqS9kjox630vV4KkqTkbemaH8Vpt6T
         PNcHCBKdBcfDDRL8Eup/E7LJWByy1NI4oaKNg4n1tHOdDkwcPI/POO4nAS0NudoOkTGw
         ZGp4uYBhaFuw9VDkWjYo1KpmJjFiNJ3oaFWaLgU7QFzhEUrPwuyZ079ysyLscMz06olV
         2mbyiiztf7HwCIRVAzXrgeC9zw097W+onVxP6m64ag97SpxQKDLGpI/YCeTwwR0ZVpch
         BHrAlaxNm55Xe8ODKD8xDqzcrjVXxnjSs/I0Jw+3io31RioLII5hsZGnezQ6KxMENXC1
         9Y2A==
X-Forwarded-Encrypted: i=1; AJvYcCWszdbfmEDAcagOvySyiNDfkfJpTSg0auu9DrZRT2tzbxqATL79CLZ+kVk8H03SXklvidoqo6prlowZ3G0SBoYlMKAid8ZCU5CR+Q==
X-Gm-Message-State: AOJu0Yza3Rb0GtN6UCH/OOt+h+n1Su65askMq9VPLP73qUg3RIMBkDST
	eTx0C+TJayxE3cD3c7gVXjr3qk+DXHFx25BPvvFcFyRK8Nh6WrTzMY9GI6rFG9M7UmtIngTUt4/
	k2VYFj5pP9SvH1ZA2/+CJf8VgYpUgKybDBvfnjA==
X-Google-Smtp-Source: AGHT+IFw9+prbVxSs3HNSyj9e7plPqdTnKWGPywEjUoQF8PisEID5JZvnH7qSSFAGjEtlGH3v3qxcEBH4a828fHufeo=
X-Received: by 2002:a05:6512:33d2:b0:52c:8215:574 with SMTP id
 2adb3069b0e04-52c9a3df263mr827234e87.38.1718180896277; Wed, 12 Jun 2024
 01:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531121801.2161154-1-festevam@gmail.com> <20240531121801.2161154-2-festevam@gmail.com>
In-Reply-To: <20240531121801.2161154-2-festevam@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Jun 2024 10:28:04 +0200
Message-ID: <CACRpkdbe0u0cCt3Y4tNX_pC77vxhgR_a17SEkzsUiUaR700yZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: pca95xx: Document the TI TCA9535 variant
To: Fabio Estevam <festevam@gmail.com>
Cc: brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 2:18=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> The TI TCA9535 variant has the same programming model as the NXP PCA9535.
>
> Document the "ti,tca9535" compatible string.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

