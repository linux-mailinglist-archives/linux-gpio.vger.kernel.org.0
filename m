Return-Path: <linux-gpio+bounces-3129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CDB84EA80
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 22:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B44A1F20F2B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 21:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D58B4F1FF;
	Thu,  8 Feb 2024 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3PsG9zX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81544F5ED
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707427766; cv=none; b=War9Nf1UxYff4Y8ph5ISWLaf3JUDUa4HyChXXSTIXiEVap7B/nedZEiDHZMsm4RyAcU9vzlw5xJYpn+yuXlQcBdQhfRwZmt9ng/EZ1XMEod+cLwFStLkwnuH+Q6LdBn52E5pAp84nqn8WEwApUd7zIionCiVtoXNjZRdzSn9CEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707427766; c=relaxed/simple;
	bh=k4Qjd4VTrme/q3N5w4mBZNedSc5IAlaFUDmOanXt4fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qs6e5+rcO1I88IVOS5CmmUXOVoNWC5+afWOra91VuS/PMXsFlv9/Kt782ZKK9H7YCKGjd6Nxt6l9sXIQeKAP3EidHYQo7a7Un9d0prSKD/EWndIO2nmmOQOcbhgdKcBRG+Eoh6YmNe6s69yQni18+fHIBL5QnLu4BCEkHbmuoYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m3PsG9zX; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-604b768d5d3so1456847b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707427763; x=1708032563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4Qjd4VTrme/q3N5w4mBZNedSc5IAlaFUDmOanXt4fs=;
        b=m3PsG9zX90QhRA6wVavFjgQpHgf7iI3KQ6VuROiaopox+k5Pj6EcRSmU/Sv9c8hvgA
         FwoCrKe0hXpGuDbek2vGGDsxGfHZ44X++SrE20i5vHQqbmrmZI6HsNyAwt6Tsyj9FQUt
         sy4TBacBHZR678Ts8LGGvyk3zxYoPX10uc3371nZgOnT63T84CO6os8DffBjTEaMulid
         JAslF8WFdyVc98uxqx7m7G2uAeH//QO2ObB8yq01EhY2C54ey4xQ7hFIhQBwC2Lj1BiA
         AGswBe+oloAWOav1F5JlnB23YuGxFI+4Jt6D16Dq92fiM5cJhyG7umCVi5EVa+wUaS+P
         R79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707427763; x=1708032563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4Qjd4VTrme/q3N5w4mBZNedSc5IAlaFUDmOanXt4fs=;
        b=rMFfmnmgkBBzcd3Fx9DcfKMjQp6d9aG8QWR1slhfNQZS8S97tRl7h6iSuecVroRy25
         9LC8rorItzhh/5PYM4DxzeXKipTJ6IbkbFjzhQ8C2o0XxRLvqTp1mUWWwwn/3933QxFJ
         ZiPRS2lPorlr1rAanjvv6aIFe+kp7j+KOuZ+pTrlBX6WtxndlacNNdOzaTjvGktHXFAg
         FPXkI2gODqXJjYN1ZZkNSUkNFf0gCGiwUcbZzkyKw2p2bxGIWXdcG8BiAqo0cDXq4Zlp
         sZwOVuISuo7uo/oh+XP3bU+MzKfjh/gZ7ZfV09EpQS3xWN6YdftY9pBne3WLyh0yw1vv
         PV1w==
X-Forwarded-Encrypted: i=1; AJvYcCXCyZZSsFFrMh36nOKFPmUwsNAMF4X5as8rH8fWRwjr4RN9VO0uEun0jqDXYdQ34/0DmHixORIMZAsoWs9NzZHuTaYqIN/x/nMWFw==
X-Gm-Message-State: AOJu0YwIbgG7aOb0WwImATAXsacGa7fp28wQxkjy8csuTD8RIWkAzL4z
	mub40mC6cBAcfEy3krUw2r6ZzkU55dNLuFBs1i49uALedwGLXErTRpKMyDI9uc1KY8YN48KXB+r
	ZH+P8jCSPkd8zZXmUea/I2O5Ty94h3mSNBscrJg==
X-Google-Smtp-Source: AGHT+IFXP22UNl6HGodNdyxCVyIl57xwSa1qrcuFLa7AiuRdaK1CrwevQo6eVvRY3I8f1f+LXDY+AXrRH8sbZkURbwY=
X-Received: by 2002:a0d:cc47:0:b0:604:4586:4039 with SMTP id
 o68-20020a0dcc47000000b0060445864039mr2737694ywd.13.1707427763661; Thu, 08
 Feb 2024 13:29:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com> <20240116074333.GO5185@atomide.com>
 <31c42f08-7d5e-4b91-87e9-bfc7e2cfdefe@bootlin.com> <CACRpkdYUVbFoDq91uLbUy8twtG_AiD+CY2+nqzCyHV7ZyBC3sA@mail.gmail.com>
 <95032042-787e-494a-bad9-81b62653de52@bootlin.com>
In-Reply-To: <95032042-787e-494a-bad9-81b62653de52@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Feb 2024 22:29:11 +0100
Message-ID: <CACRpkdY2wiw1zH8FsEv7S1FW044PBSXpLPqanF5yyH1R4oteEA@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpio: pca953x: move suspend/resume to suspend_noirq/resume_noirq
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 5:19=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 1/28/24 01:12, Linus Walleij wrote:

> > I guess you could define both pca953x_suspend() and
> > pca953x_suspend_noirq() and selectively bail out on one
> > path on some systems?
>
> Yes.
>
> What do you think if I use a property like for example "ti,pm-noirq" to
> select the right path ?
> Is a property relevant for this use case ?

That's a Linux-specific property and that's useless for other operating
systems and not normally allowed. PM noirq is just some Linux thing.

*FIRST* we should check if putting the callbacks to noirq is fine with
other systems too, and I don't see why not. Perhaps we need to even
merge it if we don't get any test results.

If it doesn't work we can think of other options.

Yours,
Linus Walleij

