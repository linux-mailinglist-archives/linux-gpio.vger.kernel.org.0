Return-Path: <linux-gpio+bounces-12639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 007579BEFA1
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 14:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB8C81F23320
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 13:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CE920101E;
	Wed,  6 Nov 2024 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1QYN92U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E5C200CBB
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730901464; cv=none; b=EQl/l4vSK5XrO4sMys3tby1z/1kgASviiXnkTparuXJZ8smZgWxzc6Yzdm5XU80bTifdbO+x3aBDz9f9ZYciYDigtUSY9x+l4z2gCI+5VCs4nxGWeUFLSPRyQsmyXCmu2t0Sf2wLAhVf6i3qbzI2hV8giCOGQOMrJpi+pmIjEcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730901464; c=relaxed/simple;
	bh=1XqD9muBYOl3asnlDkaURNfyEXgafPHqqxmlBzzPzu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsEn+m517O4CSqNUJ/tW0EnF1vGoSYXsTM6Rvfqqs+uHQFheLj1Ke95bjrGtdoHsDn/BGqGS2ECt7sO5ng44pLmHtiE2P2SHhPYXqx8wcpLV/qIg5CcP/wb0mhKxxvbhnu08qiubZ9uB7zXCK1W9pjfCWXFanBjB570y1TNH8lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1QYN92U; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e3f35268so8246178e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 05:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730901461; x=1731506261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XqD9muBYOl3asnlDkaURNfyEXgafPHqqxmlBzzPzu4=;
        b=N1QYN92UZk79Y/Yn+ae0fE8zR+ex30WeZcsFpOIddAglSWjNk+ANAPqFNyu9y7Agma
         CVion1E5A5vtg/SVCR98z4IhEGvOlCekCO/g8jzrOLis69R73U+KegkGTHstx3yUL4id
         vomZZS21eL2VXH3DJQ8uikG6zNdv/byG3hSTmU5iDzH0fxc+rT6Lv+gNY0gUR0BCS/WS
         VdcgVmEDIhQRU+0geII/gda68BWJV9L+yq7+lfOaUP3iVnL5XAjbWVnH0JI2zchNFoxQ
         iufWo+o6+SecGYsCHCnDMtflqKEeYm+Ke1iKVz150FAJRlgfZc2L2YPlIuSOTHd9ZuMU
         1ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901461; x=1731506261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XqD9muBYOl3asnlDkaURNfyEXgafPHqqxmlBzzPzu4=;
        b=Ovn7K1/VLkpP9DZeK4G1wVLpT4a/dcZUYVDw9wqLynbiQC8SSDg65pjAJJsZkwjCzI
         j0WHSnTxpFMgf9o7r42i6tCJ8Hvzx1cE38UcvX5XOWK3+5+bPjbVYfaJ5ytGTPvCP2cq
         wtuwou/4wd3hUrZUoPWEUaIqAG1g1Whc05CXXgrLXEAprCQHzlth2OXmcXdTMPQZheBI
         rKDD5OOCpkux+VJDo9CotO7oYPIuxP0ImN5RKVE09UWKrcBbOPiq/QvhwCoeqtodSTtd
         cFiGnrgXcrhWBbPNYTQ8pkw1EJuNlCGV11Thyb6rdY9HOSRhwU9RWZqMNI4TGlBeoXLs
         O4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVRa0UriMoMZK/zCN3eqH+tfUZTWWFWlV/heW1ICrfafk1DRwoxaEIiFV6v95u4gMxq0cM8jhFc6D9F@vger.kernel.org
X-Gm-Message-State: AOJu0YxGVi9TSkBAtA+4dtMvHeEl4qsBRfTrUAdJdKaauGVoAQGavPAQ
	ZOuYU80sx+1xTW+1uaCU0AbAEo5WPiavAt05mDOX60VkwoylbuCr28uG76xT9mT96zYdCj4/37p
	3C15/XlZyjQRF+0xLWCgrHJ8r7gBmFQ+4zNdWx4DUYmSseXHRTyE=
X-Google-Smtp-Source: AGHT+IEtXyM+Dk9NWonE+GGfJ6PrRMO32rrOXuHG8xSyaVy4dvoxCN2UxP4sYoHQi4cl+TiPLY5xfGOf2lJ42ii/A0I=
X-Received: by 2002:a05:6512:3c81:b0:539:e3cc:721a with SMTP id
 2adb3069b0e04-53d65e1a5f6mr9942553e87.47.1730901460655; Wed, 06 Nov 2024
 05:57:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <isb6f4jduu7utcs7a7hc6gw3ttk5ovxxz2domwjjx5zvhyrima@snw6jc2ghdlx>
 <CACRpkdaRpYDS9qj0K4hEM9VFfG1rxM+OSZZNiVjgdbHrxiFDRg@mail.gmail.com> <skat2d5p7jcugkvjsq2aqoj34qjb7mkcafaipaibs7n7zgxwow@gqokhpkzv6i5>
In-Reply-To: <skat2d5p7jcugkvjsq2aqoj34qjb7mkcafaipaibs7n7zgxwow@gqokhpkzv6i5>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Nov 2024 14:57:29 +0100
Message-ID: <CACRpkdYVj+Fw4+qHNe2RQKEibrdxVhRmZyX8rGtwdf5AUAFCRA@mail.gmail.com>
Subject: Re: GPIO forwarding question
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 1:43=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:

> I guess I chose the example badly as it does, indeed, resemble UART...

Heh sorry if I misunderstood it.

> However, even though those pins are MFPs (multi-function pins), it's the
> GPIO functionality I'm referring to. An input GPIO value can be (or not)
> tunneled on the other side of the GMSL link. So, a GPIO pin on either of
> the chips can be controlled by the host in the way Linux means it or it
> can be forwarded. If we choose to use gpiochip API in the drivers, we'll
> be able to control those pins in the Linux GPIO way. Which is fine. But,
> I'm totally lost when it comes to the forwarding functionality.

We have a GPIO "forwarding thing" called the gpio aggregator:
drivers/gpio/gpio-aggregator.c

I suggest you look closely at this driver and how it works. Since
it is software-only it does not have device tree bindings, so your
driver will be the first instance of something similar that actually
uses device tree to bind resources, but the implementation
will be similar +/- the actual hardware quirks to control your
forwarder/amplifier/aggregator or whatever we shall call it.

The interrupt counterpart is called a "hierarchical irqchip" so
perhaps this should be called a "hierarchical gpiochip"?

Yours,
Linus Walleij

