Return-Path: <linux-gpio+bounces-3916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A386C4D5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4FF289033
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4297E5A103;
	Thu, 29 Feb 2024 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BgfHQuZf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E4A5A0FA
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198416; cv=none; b=d0Qk+IV+C0Dd7dCsrShMT+tc4bT97z6/jI+z51dGOMXNd2uWkA1vZjLfC1IwWUlxGDtja63QDi8c9FhNfavVkjuikf/vvVbDbb+iziKrRvNNMrDMxqYsj7wf466dAeC2RfdTKxVc+GZJJ9pY/q0XqEX6HW1L7SP5oHw8+h16O70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198416; c=relaxed/simple;
	bh=5xzfnn3F2GF2BfKe/mVyPJKPZNzVltzgAEBEx7mAnhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkdIECoLk965Q2VCb3rXSJt3EZj5SgE3iSNUIQ0hpwCqC8lIQ47aIlJRG6N1TAXk90u+4UCEGFoWrDwCEADQwAkBsg0Jf4n4riOey/PqYYWJbyPwx53H1clMwfPptIazC9taEwOFnRhmLtUEsJSaveeh6bTHzraQVkIdLUZTK+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BgfHQuZf; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so710764276.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198413; x=1709803213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xzfnn3F2GF2BfKe/mVyPJKPZNzVltzgAEBEx7mAnhk=;
        b=BgfHQuZft3r4L/CZCnL4Qe8QX3b99EIcOrvScbe4ckSkfABseWzaJal8aDD4D8pqnx
         7hWlPF/XP71qOLqZAzN20mbge7gl6RYw5RGU67dwW09hnZVrB08GJ10ExletdYFGPeW/
         NGGdmd9dyIzUUg8T7dgiRPIAiegGoGfokjes+PjOHz2XUwvQjAT7P7HqcjBbBNKJS5aS
         dEU0JDghOEccNS7dsI3TSjUCVqEfetHzSjYGW3gwhROEgfkEHzD0Bv1cnD0ZLnjMh7dA
         B+V5m0mkXascWaz4pQdTJAis65wHPEUsSOxbJN9bjEqJis9nqIAtc1qt8SqFvKbbbTgO
         a2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198413; x=1709803213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xzfnn3F2GF2BfKe/mVyPJKPZNzVltzgAEBEx7mAnhk=;
        b=aTLmAJWoQfQx7buUgnyr4BEAXnMlA0qPlMf0L9F3ANPSdEJAdKIPiiwIFD2jqj69F+
         PZfBoKLOQ4oYYxBXGmeXkEVDfXh0B60R48bjCuPC9oTyOhpFw+qWUHJDpPhCfXCjRsxo
         Jmc4ETxw7bxOcqbSa4tGrZ+nJiyPaKPqi3TEIiH2sK4Gy74FQathFgTj4506IwVK1YPU
         f3seWerH5ynkjTaNRhjR5zWY4xA4RfhAT7USg2qGuc0woSbtg4vvVBATuCCkCGwnONtM
         60GqK1kC8Erfb/PLefcrJz0Ja32XLNs3/rc2WspvriMCZeCEXsbBUNFzq7QZzQC4WwG8
         Vw4g==
X-Forwarded-Encrypted: i=1; AJvYcCXiPwxOsPfjGFI/5Gm2AwdZhVxnFrAMT6WMmNqfPqzxM62uAtk2VPMkG2a72NzTAVk9SF2kqZLLTKeRWSKpE9JVw/k6+FYVeQ36FA==
X-Gm-Message-State: AOJu0YwCpczGBwEp07v0fEdaV2MvRNucL6ayWQeMUwcu0t7lszqJJuGv
	/u3GXtNOy8cu0MiDBSPp/Jnq/V3Nb23ns4Ypoql3oraFiJnK2eLNeIDMAAnMqioUvu8o6ulPhMg
	r9V/zOsEBgcT1m5HNc6g58wZ6y6+19SVOFr5UVQ==
X-Google-Smtp-Source: AGHT+IGt1MHfcsA4yW7IZbUF8nqXwJyHryvR5atqc+sje8VW2MJ+tKCW4a3qqqWQL8pBx8LXl1is3Fk6Gy4y4Etyzw0=
X-Received: by 2002:a25:ce14:0:b0:dcb:b072:82d5 with SMTP id
 x20-20020a25ce14000000b00dcbb07282d5mr1507386ybe.64.1709198413600; Thu, 29
 Feb 2024 01:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-4-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-4-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:20:02 +0100
Message-ID: <CACRpkdZ301u-iAGBVQS0VPW+2XX=onGViuaK7fZ8eeTOXJCFPw@mail.gmail.com>
Subject: Re: [PATCH v2 04/30] dt-bindings: gpio: nomadik: add optional reset property
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Add optional reset device-tree property to the Nomadik GPIO controller.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

