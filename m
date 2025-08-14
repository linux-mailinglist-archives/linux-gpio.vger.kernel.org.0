Return-Path: <linux-gpio+bounces-24379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC6B25F4F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 10:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1E59A20149
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 08:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53512E8DE9;
	Thu, 14 Aug 2025 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DuU6Euah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D372EB5A5
	for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2025 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755160935; cv=none; b=QdRXcx2qCzzU5yPLB4kXuweYUIsS8r/+rUmxT9LCwDZXIS6jjRBnzVk/k1sEXCgZmrNVLu47fQsMon53R4NGICRUQMA8gmPudwPS0f1pggK6FmOOOEUIGGP7cheboEMmHVkGo/epIgZM3kqls/lraPcFC4YPurI4xdlFQNNAvZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755160935; c=relaxed/simple;
	bh=ZLJ+OvTO9Egq2EDBDmrCftbeyKLRuoLdld/Xe68LeYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePNg4NyB5Z2nhYBKevinBze9miMejWKOxyHYE3PtWZEo8oPxy7PaHPtZyE0dskemeoRUSEI+9Iqr7soXxTn5iXlMjCo0ljMImSHQMyvwyLnyOirlfK/eqxgaHY7bXBS272X9HT9Rc3p8luvbYp4HGlVR87AVoXjV0NLVi4gv8Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DuU6Euah; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55ce4d3b746so965820e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2025 01:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755160931; x=1755765731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG6dQwLAbECIeGoi2Xeo1tsUHSb5SDFit/yFv4rq4XM=;
        b=DuU6EuahpUEIIkQja/tfYIOrM/AopXqcl63toq9TKuL5pk5ZF/AzsUAv+hqwYcykvd
         dPVPEJC9nrtWppsJ9J1HeZUGXQ3GXfvHVyMiE++R3TUfwtY+VQKHAWmgQj2a+tfTC+wG
         b7GyKEooiQYMKWFW/7Q/dB+nRcnzuQgoqG3UTtZ3E9wWhqYhkatldo8m0uQd+/t3BlRV
         AkrGN5l1zNXYhtET+qCA47OpPhAD/6Ry+VV8t4n4wxFXdv9xSPKE2pKR3g7TVLSS8zBU
         ME/tw9Z9N5CNdbkzxAN36qyAyg2uYDIZnrXJSGMhEHIeoAp1MQxnZJ5fyJLmNrYHLoDB
         FP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160931; x=1755765731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LG6dQwLAbECIeGoi2Xeo1tsUHSb5SDFit/yFv4rq4XM=;
        b=bWyKoR4Hxr8rPx8kB0okaJg7Rb/HUfuTmvS2LnEsQJD70lT4aTv/Ll2LaVloTs9vLk
         Qqo8bfo3TWWIhMQNzn+dDZmYMud9lvxeAzWB83h4+HBaQaW/7tg4dZZOq0FucFE1q7hQ
         qut0AJ2UwHJUs+F9yXMtqXAuJxe9uwP9k4LjqEXZw+2gqCSxUtBpt/HYLWobTOTLrhMp
         Q6wLk5bADiTVV7uNoQBMDt6tP4esmPfWpCfqyLQ6vwUy4d7l7aYFs1fX1AewRdlx7re7
         kR2mm2ZvyLvh7O56gTHOV3CqWadAJglHGdC8num/dMGzjCSv8VW2COn4YFb4sIAvAyYq
         0wTg==
X-Forwarded-Encrypted: i=1; AJvYcCV6ND3XnM2mXFka9QyeokZMyLFej4316jT6ceFD9JeIBqm/V4e+pp3qc8Qf2k5ITstIWmP89HFUK7dr@vger.kernel.org
X-Gm-Message-State: AOJu0YwyFBdWH/eNTMWn+55yZ3rpSxTiv51vPrM3WPI9qrYzv2rrHP6O
	NAiOkco1+ciZtF+El9mZdThcOBwCm/n8OxF6VBEyt+LX7ixXHAD5L+mQJjVElJb25VBalL+mxhZ
	PUIO7aXg77/3keX4ertV3lZ0dARdO7MiJ3udXeAoVPA==
X-Gm-Gg: ASbGncvWZAsd/eoQrGcrXedYdpjtl6WQD00H7FJMDiV/2AcLw070cf04zJqcBqoqGM/
	72Jg53GU3NLZQBhffnNs9CbpWtb1kHCCRJeGYGAY/ROnmAwHN0764614HyvlwVPQBGcurjVzlCd
	ztpjG75PCrmIGuOMCtjAPb1Oedtqv6043n9jlcaEmf32RPuc1C0/cchI+qBd9TVhViEseO/rTLp
	AcawS8=
X-Google-Smtp-Source: AGHT+IHprenDdT2lQfzU6Lhu57IKRhlpEZsnmmWVHV7r4cnpXiXk5gJnWOJBt44y2tnOfA/ZI4lRbK2Sb9a3BU4XGrM=
X-Received: by 2002:a05:6512:3190:b0:55a:4b21:a80a with SMTP id
 2adb3069b0e04-55ce62623camr605127e87.1.1755160931332; Thu, 14 Aug 2025
 01:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aJwk0yBSCccGCjX3@stanley.mountain> <175506979055.8476.10658684000717777329.b4-ty@linaro.org>
In-Reply-To: <175506979055.8476.10658684000717777329.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Aug 2025 10:42:00 +0200
X-Gm-Features: Ac12FXzC-XOfXo4WQ45R4xq6JzH2dBOftR1LqQ_rC3r3c1A0HvmOG4EuWVtRZ8M
Message-ID: <CACRpkda_-JBGTTh7pLd+MkoVyCCKDqTZm8t9vaxWMWDE+sGyLw@mail.gmail.com>
Subject: Re: [PATCH next] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 9:23=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> On Wed, 13 Aug 2025 08:38:27 +0300, Dan Carpenter wrote:
> > The "> chip->ngpio" comparison here needs to be ">=3D chip->ngpio",
> > otherwise it leads to an out of bounds access.  The fwd->valid_mask
> > bitmap only has chip->ngpio bits and the fwd->descs[] array has that
> > same number of elements.  These values are set in
> > devm_gpiochip_fwd_alloc().
> >
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
>       https://git.kernel.org/brgl/linux/c/148547000cfc1ba8cec02857268333d=
08724b9cc

Do I need this for the aggregator immutable branch I merged yesterday?

I have only merged that branch to my new development series, if
you need me to pull in a new version just send a new pull request
and I will use that instead.

Yours,
Linus Walleij

