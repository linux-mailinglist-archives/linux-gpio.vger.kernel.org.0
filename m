Return-Path: <linux-gpio+bounces-27021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A25BD2B4E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27D50189C97E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 11:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DE4305E04;
	Mon, 13 Oct 2025 11:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cV0QrZYQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C468305979
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353371; cv=none; b=SC2CAYAeoq9TFVJ4sVwgma9tPDS8bKoZNmIRkRsZiYLaDJIoGjMh/acCPzfB8eZlWv/ns9NSHkwhcE3RUdgcB1p2yuqAguuWg2rOBrXd9d1PP9R2pGLATXBGSGJjBymr9S37G4yRLZbssNb1NhP/HcscNosZmIYGAfd0lX2+9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353371; c=relaxed/simple;
	bh=CKoGj0EfJSSSZnNc93o/3z1IhI5G7ANKF/pI/LrBGI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6kTd7CZminaY3Oq/xOx0vSXTiucIYYljwSfL/4XAW3cTDf6PWgncHvKQKbje7Pu+f3ASapun1f8qH2ouBfHsauc87AStI1MRXLAyQRrPKb9W3ysMnLhbWh5Z2HjimqJIwz2IF0SRRthovx2KZMGf8QWeTmz4hbGvIP0dQr5Mv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cV0QrZYQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59070c9111eso4994844e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760353367; x=1760958167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7wVvrelX1rBOcw+ZepaH7C5yTmrA+Ts5kdb52LOjIc=;
        b=cV0QrZYQfXByovhpSOsKHMNgMIlZRkruRBwT17Abq50b+ytRxcKgw+PjH2qQslyzro
         kl4b8u7WPBtZb04369kXWwIvgE6K0bpkeB8fne1vX9b2jhOcSJPX4yBX+aDdVzxao+Pp
         oiehWr87POc7cVHFWuhNmGU+zDJBl3qR26p9NHx6VPmkE6Q4LozamAlp6mJ6V6pNF9sP
         te0m3HSGI9YB9iuFdi+VCik6/VySemSlCt3swj3DBkDhJCvBjDNmHarUtqXh2w7YX4/x
         us14+U2GwqwejjWyHcHSfuN7AELeiJ8Wes5Twk2jEqbq2S58dTIOwBEi9WBlIJplZli3
         5vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353367; x=1760958167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7wVvrelX1rBOcw+ZepaH7C5yTmrA+Ts5kdb52LOjIc=;
        b=C3dj/dVvGK0BcOIo6BWEk61IIDLzlhUpbh45NM19jxVSLuSxtldYyk4vSUkR+9gOea
         9pXUuWp4jPED3499L8im6lY788muximGtOip8mKeHbCYmrsG9wc6oyQX73ixo3SVy5K0
         9NTP6kx3ED8o6voGc46x65Jmek3ZA4sijFnDwFeuJak598pRCE+vbv7hMaxBNWgNBlG1
         0EZfdVkGKpI0KeZFn6lxVGxmEVnTLsdd6muD2j5ZQGoIyiabX9YTasVZDzYgjvLSsGb+
         KpI5B8OR3VTbshBRCo7b+usuxJjpjNaQaOcfh4HalqEod/DzdJeo13yjXkcICzIh+3eg
         Q7ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVQR/WaXg6nwQ3CXSrirjq4Fz8BxItWz21Lx9eVbR3NUOQgyWuVr9MXOEe9OsgIQ2cCCC0xG301WxVq@vger.kernel.org
X-Gm-Message-State: AOJu0YxKblcE/kWpQACvwiLxItceLPAhdSZ3Sb7rzT1VuX3t4IX1gXq0
	qtXOtG1wZ2cETgSlnXmxXoQq4hZLwXhowe3Tde64cMXw3Ehw51L0Lld2MmdvD6bL+098fZjPiek
	NDjsAo+TaRizvJaOHLTCR4v5snt+mdznupAppPXfFMA==
X-Gm-Gg: ASbGncs+60MVIIHLPJswdhqiaYxs0MfzfshUgsqd8mStIH0JiJzxOc7f3LJpp5gd0vC
	3LMNQnJTdBW0AfOSSDnsPIVyoGpPLyVaCeZ4oecnR7Ex/1zWW8Y5ZNn50q69DwaJjnlcCwv8kzI
	Y7DSmPh048X633W5FdqM8b5U+gfSVqfDHeJZ5u6E6KYJZVDux95vqF2mSDMF/8NbE7wsmRpmIKZ
	3ZXElBAbYrAVj4dgPVpqO+gxm+jgw==
X-Google-Smtp-Source: AGHT+IE5w8+CFwr8uCG9h+7RoIC2CQYU/iHXde/XXvD4ftzJpLa+56fpca+R4z2uCP2WV6KK8wJ5ehq1lJGOlBMOm2k=
X-Received: by 2002:a05:6512:3b8e:b0:576:f133:9288 with SMTP id
 2adb3069b0e04-5906daea903mr5757309e87.54.1760353366541; Mon, 13 Oct 2025
 04:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-manpower-glacial-e9756c82b427@spud> <20250926-unshackle-jury-79f701f97e94@spud>
 <CACRpkdZ5RCcaNJB_3ufAgpDtdJBKfOVrMbJVAQWaVSOkY0-XNQ@mail.gmail.com>
 <CACRpkdZo=c0BnSLm=FKRMNYKEaPAHBgtfhD9txhPofts4ApDkw@mail.gmail.com> <20251001-backless-cattle-a98db634d7f0@spud>
In-Reply-To: <20251001-backless-cattle-a98db634d7f0@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 13:02:35 +0200
X-Gm-Features: AS18NWDldBKDLZmy6X2cYSIZCD5j-DgRpx4ZkxSimEcAB1Z5J3nwMyhaKn7ksvQ
Message-ID: <CACRpkdaEsa5gSpGxWG8xudMePt12nZaZRCRrW5Bf5JQ0f1K9Zw@mail.gmail.com>
Subject: Re: [RFC 3/5] pinctrl: add polarfire soc iomux0 pinmux driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 5:45=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> They're not actually package pins at all that are being configured here,
> it's internal routing inside the FPGA. It does operate on a function
> level, but I don't think there's a neat mapping to the pinctrl subsystem
> which (AFAIU) considers functions to contain groups, which in turn
> contain pins. I suppose it could be thought of that, for example, spi0
> is actually a function containing 4 (or 5, don't ask - or do if you want
> to read a rant about pointlessly confusing design) "pins" in 1 group.
>
> If I could just work in terms of functions only, and avoid groups or
> pins at all, feels (to me ofc) like it'd maybe match the purpose of this
> aspect of the hardware better.

What I would ask myself is whether the abstraction fits the bill,
like if there is a natural set of functions in the silicon, then the code
should reflect that.

When it comes to those:

+static const struct pinctrl_pin_desc mpfs_iomux0_pinctrl_pins[] =3D {
+       PINCTRL_PIN(0, "spi0"),
+       PINCTRL_PIN(1, "spi1"),

At least be careful with the nouns used: are they really "pins"?
Should they be described as "pins"?

Maybe it is best to come up with some custom struct if not?

Yours,
Linus Walleij

