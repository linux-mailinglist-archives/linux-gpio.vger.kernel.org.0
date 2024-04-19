Return-Path: <linux-gpio+bounces-5685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C178AAF36
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 15:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDE0C1F23263
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 13:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55949128387;
	Fri, 19 Apr 2024 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gyxpWJ7D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0AD86651
	for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713532822; cv=none; b=pxHDgxx5Wl6wmbF6huyc/USAyRAlVS+RlVApHoL/VZOKF9kipqEjY7nwRl0sLcTc3WVWbx/Xae4nTECxtSh5hI9Ons7Srm0AU7K8o7kE9cYJ4h7gqkErw3fQ8bv55wv4seb8nABJmecmPi49hhqf+RsFP1Pa5/s1P3EyH4HA6AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713532822; c=relaxed/simple;
	bh=ukqNim2wR4zF3yUVwL5ebSYvcGgLz6CYpTrNBxxNrNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMtQSPD/Qzz8hWYWBB8flhC/FGQrJh0Ng4pIvpG908CYQeFjAuY0xlMnZEgB0PqwhCiG3AkOFSwR/F9LJ1kndLIOLfKL3j2wrz8YitqBydibq9fkPjZ6NEp3J+3nblXBuJlnOTBeCNQG6LbRt2rU3rF0WTDeFhdXzCDx9diy62U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gyxpWJ7D; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61ac45807cbso22289077b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713532819; x=1714137619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukqNim2wR4zF3yUVwL5ebSYvcGgLz6CYpTrNBxxNrNU=;
        b=gyxpWJ7DQoONgUIXaVXhsNH+4a//S2TMpfKpHA8nOBSsAifOpd9YXMcffjOfiKsQzC
         mUtuuhBBe/tauEnU2uRBZkwY8uw5l28Fp/MwFBYQ7VSv4DVK5yGJcfFEKb5aKCEBeTyE
         P+TtlJCHE+zynCGlX6X5WyZlZyebnHSYyjRz3UChIjxSKz0pHf/G3pvo3CKGcdHzUYHZ
         zs8AO1E6klEYdRYLJe9TPgsv8OTzW7eCczq8mhdMx14eYv1xEaFNf2jyDhWousRhbHTO
         CnJHfcwm8eysEdPujMC/a2nDuRTMLric+lDJOllwkxuL4kEoc8pbj0TOd+oCIRnhbkjG
         ZAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713532819; x=1714137619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukqNim2wR4zF3yUVwL5ebSYvcGgLz6CYpTrNBxxNrNU=;
        b=O7zpxR63KpXWaZcd8tGVJ/gYJl7z+Zf0utsGo3no7QHkE1kCoOhxVG2wupEggoZWVU
         VXyi0JC6s7yPnwxXrKudjBM48pcyJJUVtKxHPmTpJDq+Vuk25HelWvetztmib30jGHkz
         GPMlPMLBs2muCA9I5bwQJBrDVxlvQ1LfMoEXj/fBDSossB4gWUgBxUEM+XgiXfzWISdq
         csU90oSEUGKh3hqoC7IMTMlYGGSIsfmkMPav6YhAUA8RdKMnUe1pH/ikFNHidw51dMTy
         jLYFpPgvufO801MtJjkRgQJ3aFmGGw/USrsqQZoZ/qZK05y5laoYR0J5poIGKukdPwDj
         xHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX67e+NvHXS2ml5zLJQ5EtQ5I5H1sN7KtQKACdc+JxFfi30/xZDU42zw6u/HTNj+hOivLUmQNAFY8Z2V3O2zTS+TwQcfkaLfoccow==
X-Gm-Message-State: AOJu0Ywk3KNFHGVuRrQLuvX+bnsVK/jTN2shf3NdOnXPb8RX/iq0o2r1
	RSCjsX+lx4IN9laZNlx0cTSAnxyurwKqlXnJLz9QYHSP5Inku4oPu+ugCtPxg6h5FIw7YziAVKC
	kLJNNew/swVEPqxN8lLxL5S+WckcbBmsLOL/QVw==
X-Google-Smtp-Source: AGHT+IEI8D+Rjptnk9iY+KnYSSwY8zcUnaRQkQica2+cfdRoT6xlKYqfZKkb6nl1YXf4Kgi4R3V+bGAEnQx8Wp+MmB0=
X-Received: by 2002:a25:acdc:0:b0:dc7:4460:878a with SMTP id
 x28-20020a25acdc000000b00dc74460878amr1977072ybd.3.1713532818807; Fri, 19 Apr
 2024 06:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418-pinctrl-scmi-v11-0-499dca9864a7@nxp.com>
In-Reply-To: <20240418-pinctrl-scmi-v11-0-499dca9864a7@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Apr 2024 15:20:08 +0200
Message-ID: <CACRpkdbswetf2Tr6H216nxb8XKX8evyiWiVcsK5E=inqBUUVng@mail.gmail.com>
Subject: Re: [PATCH v11 0/4] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Dhruva Gole <d-gole@ti.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 3:24=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> Per Sudeep's reply in v10,
> "This series looks good overall. Since it has pinctrl driver, I need Linu=
s
> to ack/agree to pick the whole series up or I can ack them so that Linus
> can take the whole series. Either way it is fine for me."
>
> v11 is just minor update per Andy to patch 4 and Andy's R-b applied.
>
> Hope v11 is good for you to pick up.
>
> Linus, would you ack or this patchset go through your tree?

Since most of it is in firmware rather than pinctrl I suppose
the best is to merge it in the firmware or SoC tree, so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

