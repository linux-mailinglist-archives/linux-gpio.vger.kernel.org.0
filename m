Return-Path: <linux-gpio+bounces-26718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3875BB038A
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 13:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D83D819461A1
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 11:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC872DE713;
	Wed,  1 Oct 2025 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iGBIcqZ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3B2DE6F8
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759318892; cv=none; b=KAdWtgMyTyV03Vx70RHZ75C5dny9BHnxiQlodn6sF/mX3Wm5VQJ88aTjLnhCkzB6PF7IV1Y9Mqiib9LY4TpnqyMk9VoeCblfZRWkUNTnIbq8On2jY1gpnf+7WLdIjUEHfTTChnCwmU25szt9xfqkpK7cDFlfb7tt80Cy5vtr4H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759318892; c=relaxed/simple;
	bh=XNoirN2YmXOb9e+cUQx56jMaIQh+gAJtYRQuQbyuBGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIsC0sRUlsi4/CKmVodDpFntmQmzOPmh5L/yYDBViRoI+Z13Hg5Ed15s0eyXDECa33i25XIRswtyKCJj7D7x2siHXNq40KobhDciqvF7d3V20m/a2bA8G2cQx/7Twc8t/TFJzXeV1Gf6WQhJkbPCuobyEaNDqGtmOpV2Uk5fv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iGBIcqZ+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57992ba129eso8549968e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759318888; x=1759923688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qctZSXMhs2xeiqfjqCMk0nsDO98tXumKc7sHsixp5Vw=;
        b=iGBIcqZ+9TycTKvNSiWZkouV7Wmik5N8GdkyJAC5jTLxIaSIKYFTZi6hylI1+nEutf
         Le2gXxMVkShPUGDqrR62j3Wf4YYeLomcJHuBTiM+BOcj6v8iXlsWcIZNjXJ5iq1SdoSi
         Fx/lrm3zTbQh9wWIhEi/en0CvPk1lLCebQV/b12O8mF/7tuvRxt+undkh6RCOlOJvnMz
         jBxu2ImwUKRwNGIbGFNAPr+HFkesPrzEHSlMXmPil/JiySkXwh3vc4dgktqfuuwhnZga
         Nvt0WkU9UpLB7pyoLRHtvi1Ie1Rnzx/ofigjjRUsgSm02AZwHd9Wd3DlfGkS8au0LNek
         sEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318888; x=1759923688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qctZSXMhs2xeiqfjqCMk0nsDO98tXumKc7sHsixp5Vw=;
        b=u1XWEHajMLGsMepSzwyIgw/0eKhDKxk5awr5x/V89yrmEyGmpk4eh0uXrW2lMbRAOG
         fkULoDzcGt+eXen4um+QFNrDuM19Mb81TOw2RTU5xnO7erQOzJ2yqtmSUqKk7Of79i4Q
         7XKC4LE525/m5VNrTTyYEVbDNsUX9eM5cdz7lA2LrJSylox6uOCmexVkS1+wHlhjZnXf
         foE92Gz0IlEN7FNqowyNfuspWYWJrd4eytBvKXoG2qSI+eRpzTUKTxKHjPwHennnq8PT
         OhaTIegCaqfSmxHOTAw4CdwrQcPZS9Muan8ETujhBUBwwDjYZ2ZMCkY4BFH6el75c1KS
         Jh/g==
X-Forwarded-Encrypted: i=1; AJvYcCU1KrgbmaFl+vahkA+E7OntoDdBfjj/2HdqHYynLve5PhjpLQHA7NrCw6KJr0aKLn6uAm7r4iEjQusm@vger.kernel.org
X-Gm-Message-State: AOJu0YxC44Vbp/yqMsaZWunhtFOmrTtj3YyinGTSY96l+ash3f+xxelD
	B9rlpkqEgyfIBwTzTkJPcPzVIN2v4ekovpBt+G3HWjPMLDSepP2ezhDBmJxlLPtTobV+cjQJG2J
	9+1yz98TeASnHo5QbsOHLA9UvgSMAG4qq3oEFMrCXvQ==
X-Gm-Gg: ASbGncsmkNhjHvs4bFf45IrcrlKXNVxrmm+0Csg9d35AIPGpE7BNB0HNqS0XO4MtLEp
	HPSpyJ9lDbvNsP0xmgwO2XXDj7KwHe64LMzuQIDVnX2GJur05ksJYv9mSG43m9+wFBEGwjJM8d7
	ctW8PNQwhbw1W4e4vf+UYwMSKnN/tKoVrqtrWdEURm/yC6jPwnuzgj2edXW7TQvjXkyCt/yIqO8
	nRFJFRyk85iQ3rfgIWdp9iGrtInJak=
X-Google-Smtp-Source: AGHT+IGh0WRelayFPhpsyMTnu/QogCxki2FOJNlaiws2mA6RsyILjodYZSp8V+kDGxU8+sBc5yZrKN2O5uWz8LJyuPc=
X-Received: by 2002:a05:6512:b12:b0:581:75eb:cb0b with SMTP id
 2adb3069b0e04-58af9f4df8fmr956846e87.48.1759318888565; Wed, 01 Oct 2025
 04:41:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org> <20250927-rda8810pl-gpio-fix-v3-1-3641cdcf6c1e@mainlining.org>
In-Reply-To: <20250927-rda8810pl-gpio-fix-v3-1-3641cdcf6c1e@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 13:41:17 +0200
X-Gm-Features: AS18NWBXAbHjbTdnQXpt6IR8KxMLhgGpEzULsJ3KqRHyjfQNnQcsJ6eT4En0sws
Message-ID: <CACRpkdZD+QFsFSTL0c6HbPp_4op2axjpZRL=y-KEMw_rNpxgqA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: rda: Make interrupts optional
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dang,

thanks for your patch!

On Sat, Sep 27, 2025 at 7:02=E2=80=AFAM Dang Huynh <dang.huynh@mainlining.o=
rg> wrote:

> The GPIO controller from the modem does not have an interrupt.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>

If the GPIO controllers are so different, should they not have different
compatible strings?

Maybe add rda,8810pl-modem-gpio compatible for the modem
GPIO then?

 +++ b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
> @@ -41,9 +41,6 @@ required:
>    - gpio-controller
>    - "#gpio-cells"
>    - ngpios
> -  - interrupt-controller
> -  - "#interrupt-cells"
> -  - interrupts

Then this can be conditional using an if:-statement such that
it is only mandatory for rda,8810pl-gpio and not for
rda,8810pl-modem-gpio.

Yours,
Linus Walleij

