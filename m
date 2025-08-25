Return-Path: <linux-gpio+bounces-24888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7B7B33A63
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45D2A17D2BF
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06A72C21E8;
	Mon, 25 Aug 2025 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HNHr2Pag"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCFB2D0C7D
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113241; cv=none; b=AIJQwpc9JNP6qvodfEBmHFv4O0/kgqLEi+WHtFzTsXVs7zQxJJ/wub/gg5jcN5gAe5vKHYuqLYkGyAVHUFYggWWZDTi0f4KUNDA1rfIpFGsUEZyerGjfq8f/JseHHli6P3an9k0J5iohptQkw6wnNUMKZquCItyhTGtA08Sxwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113241; c=relaxed/simple;
	bh=XOAv6hQX72JTJoOiv3v9g2pt29fiKlNO0ZbSfNVbdcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sc5IF5t964fh78JNuu8j95ua3Pv3zQwNVXW7zHQFPTzWs3S/QSH9h3EajeJJulKdF/Hjd8SWjh7gm21aXfw2pqbu7nt+nFWFdN7BhKqQ4r2N7NXL6Qp9g0GGJ5yKoixWchMUzXlNLYutjdS0FaW+TNf8mDRovpDJZP45jDt3pCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HNHr2Pag; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336763f6fb8so6303171fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756113238; x=1756718038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP0weFM2+mVOhYEbkmdk331UXDeERciVJHGW33WlzMM=;
        b=HNHr2PagF+9eI2s+AkQZ+9SEM/lcRSwGz04ABnWz1/KmZFIyE0epujdc5uChztzoyf
         +g/vmnQBt0ykNmNQTCAj3LiDBvH8FJxaBQpvf57Sz5uK83+zdO4QFZeyqpNg/WKU/jJw
         vmOXvTDnSsOAvzsnr2f7sFyqKv41TJ+BJcA8BqwoGNmf2DNZt0zPM16kQp3vmvf1Sfbe
         z9PG5KqdPWW7ZOwaCAqwpaNtr28kctxT382yRtn677tW9bGdc6ukaAYtR6+kh5ME9s/1
         mrbOIdEdzd5XszZTpNQk5MqlZ/XtX3/H4Nj0lzXeezkfZHs9Mj0kNDBxaVMKawV+MiI1
         Hq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113238; x=1756718038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cP0weFM2+mVOhYEbkmdk331UXDeERciVJHGW33WlzMM=;
        b=WqO0Za/KpDb2QU4bruRKs1br3GTrzriUG66nYgF/rNxrKDM+yrAMXvtxJqSU1DW/68
         IJBMO76i5MN6TkCMj0gRvutZd04gOCy4PYLT0ASE9Ok/FVgljypVkI8GggqNLaDCJ0lB
         40yGh7xcOudzKIpSSlwERne1Bpjdbxw6zWVLhCQNasQxtZYhPNQh/AXG1vLrZtWOQlIs
         tE+MALS1nppJB5G1aGqm0bwG00YRMJa6H9XBp/QjalzUv2WiBNoEeG8CmX9UyIOu2Ksa
         FxmBdena9q4QCChvQTR+eKalhrnpWyNnNhMw1KDuBJewAikNBB88wJKIHyeLoYgai3/2
         gmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBi61EmKo5W/FCJ40byaibse7klkvJnP79CdR4G3z0LS/M2VvUDdvXF9EL84XW9q3wXub6gr3zu+I2@vger.kernel.org
X-Gm-Message-State: AOJu0YzkvdUtie5EKz2F6KWMerKKTlofHMIW1m/8l4FbCUzZ3n7arVCD
	gTqP+9yb4LhSvo0mBS/NORkzXeADVJFJNvT3YEf1vQYmB2Uq9R11I/NV5tzUHe5MNS2QnpEYne9
	WWchnFewiIasxCGSuJLrtarzKfqXTLwShqXa2JYUmXA==
X-Gm-Gg: ASbGnct35frOsh7JqYHPgVPSnhfuQH09U28LOaoQxV1y0WVtOy1Fxsgz1UZ3gS2Ql7k
	BWnqzm0Vsi5Q2B2I65Afl5UvBI7YWQ9nkmMpcExco5UQqjBum4dnXpfTq53JaP1dvZBb0WEWzhf
	OfWMtpJ5FJQXD41FQmOhWJEKpk/dE9rC5TT+6uWOjrW2rR2rP+0Yc8VfPIpV8s9mlZxPgKxMiUS
	ATxfouW3Axg2XZC3g==
X-Google-Smtp-Source: AGHT+IHKuGX2jcjK7CW2YUAF7pKBQi7lJi+f3JtU7wjskayoF+TL/YdXsZFZxfIG1onC6ArpMYTltcHn/C0yATQLfLE=
X-Received: by 2002:a05:651c:2141:b0:336:5d7d:f034 with SMTP id
 38308e7fff4ca-3365d7df730mr16346691fa.1.1756113237446; Mon, 25 Aug 2025
 02:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820164946.3782702-1-Frank.Li@nxp.com>
In-Reply-To: <20250820164946.3782702-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Aug 2025 11:13:46 +0200
X-Gm-Features: Ac12FXxQ7gXxoDsxZV2IH90hiejwNDEjwFXUKgIGdSa3W_TRCsJ2jdxesORaDrc
Message-ID: <CACRpkdYCWymgFYenTbw5TzH+De103pwf35Bq_WjCkCPJ999Xng@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
To: Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 6:50=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> below CHECK_DTB warning:
>
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinc=
trl):
>    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the re=
gexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(...)
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  80 ++++++++++-
>  .../bindings/pinctrl/fsl,mxs-pinctrl.txt      | 127 ------------------

GPIO bindings mostly affected, so I think Bartosz want to apply
this one. (Else tell me!)

Yours,
Linus Walleij

