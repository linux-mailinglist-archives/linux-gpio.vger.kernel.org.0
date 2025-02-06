Return-Path: <linux-gpio+bounces-15417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A836A2A32C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E29267A06D3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 08:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E7922576E;
	Thu,  6 Feb 2025 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpq17J/i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CA2248BE
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830690; cv=none; b=LskG/sB4rGhXHFMY4grAGn1dZiOE0Gw0eQdkzKOitUjfgmLedDP4VVQ8Nn+Q7MMlRbzns9iVA6lGk4QJLK5Wo15GBdwTPqUlceIoJRmqLPrTV3QtFg6+hf1knKAk3lMs+8YrxUb7lNRAlmHgmGLTnjaeXtiho47F3cASdyD6beQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830690; c=relaxed/simple;
	bh=7qnU6rY9JGAiQw9ngdfQCIXhxFfBeDNlVH7mfZkuXn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g291sHKGU75Yen4ymssyxUquY1xriXXp7UwS99ePhQCDkki2P73neZcgUFb4ZM9nIHIh0xz+XD5M21miRSSi+A+Ly4MWur8U+ZKczqvfMcqc3SupVmLTXpASonN84InsvmTxdyOGDanK73SHczA1WQho1e/VKs353WKmDvKP6Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpq17J/i; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54298ec925bso781591e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 00:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738830686; x=1739435486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0j9kQxiJvv//qp2UxGHjz99hk0uXs/FtVP89U+kWJw=;
        b=gpq17J/iUi+gO2oMFgdGX9zelIHs06bkJzFG/OV7R0jSBYBQ+9sG1OH2gVf9xp3dnV
         d1hNt2F5bhuZgurBvoRKeUG1JgsWx4c2oAN/rNyEYaZl/MLpSGBYFt4ZGrbQYIlrToj5
         A1Jl9BP1R75mNW+oCXiIkBe09jSBneCCARYvTsG8VOV7bFtFQqBVUsi4wGToxHL+LrHS
         Ao9CKOHwdySiAJoORbPHs90ZPVnkkzG1SEi1PlyIM8QqRYsGan6JI6aTlCR8M8o16hp1
         MIF3EKZFWsb0JETveFgx1n+S9nCgcCDV2zMx0zJRGFe0W3AmGZrgOY9v7e72t2i3TsgB
         lFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830686; x=1739435486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0j9kQxiJvv//qp2UxGHjz99hk0uXs/FtVP89U+kWJw=;
        b=u5by5S85ufc6/Bz+Vc7nMHVCyGMHTBImpRzEifOBEHzpmUS/tvepalb3CAWRGveZ+t
         h9IpYbgdwj3OWUmaZk+g0Lb/TOEZskEr0NkcKMB+1w601pC5CzBgIiHg9hwaSIWCtQoI
         zYUR+s06SdhwJoLZ7zA4WAdbTtuYjrAKoEw4MqMcmTKs1sIeArpl+bVaUXt7jBFrJLbt
         o3rpQeslLBFr6CWrgydrAJV0tyjU6o5oU2vGt2E1OAYXfJxktg7nhmbafgVP3sh+p4T+
         UWTKDRCkLh6b6KzPtqeJvNHvJAWpd4/mLmxARc8n49fYEDSgNwv3b3kmmSDZxhViqeI0
         JwAw==
X-Gm-Message-State: AOJu0YxyIJN5aD1sYJeZY/sk7QjTlCk8W0pfW0dwG1u5AuQmPHex0c0h
	HDLJqw3virsfYsThsinw+CkLougze6KWxGw1c6jFvWFBEQJ1avfJBqRkAA5cvjgRt/+8ysmrYpk
	zpvaASTdH8TMeGB+j4IYt0IFD5O1mPW2aTkU62g==
X-Gm-Gg: ASbGncuW0hhcUvNHMr0TPEjVq4LPWlldebyYtQJWssSBNm/8imgFGNLXWevDNYnYsn1
	2i674FwBhQJFUU3EMQC9BqORd9DWcaLHHvINkco4tzDmeDCp+KGTdBm2WCR5lKvjiE8K1Sjs=
X-Google-Smtp-Source: AGHT+IGljZ9LAstQqpqagTlSof+IuUKRf1dlpjSfx8lVyzkdJRmDio6WGX+nacEMBSYtIcJMw8stP3S1Sw/zXWjx+Ms=
X-Received: by 2002:a05:6512:3b08:b0:542:2990:6e99 with SMTP id
 2adb3069b0e04-544059fc5f3mr1615392e87.2.1738830686028; Thu, 06 Feb 2025
 00:31:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116170009.2075544-1-valentin.caron@foss.st.com>
In-Reply-To: <20250116170009.2075544-1-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 09:31:15 +0100
X-Gm-Features: AWEUYZnu8WCLX7J7mwrJJb0MWJ0q0ejsOcvgpGEfaxC0eT_vG_3fVD_amGso3r8
Message-ID: <CACRpkda7MbBmas+jcPJ4k=L6ab+EHkKRA3LrTGQfWPKsHeMdWA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 6:02=E2=80=AFPM Valentin Caron
<valentin.caron@foss.st.com> wrote:

> Cross case in pinctrl framework make impossible to an hogged pin and
> another, not hogged, used within the same device-tree node. For example
> with this simplified device-tree :
>
>   &pinctrl {
>     pinctrl_pin_1: pinctrl-pin-1 {
>       pins =3D "dummy-pinctrl-pin";
>     };
>   };
>
>   &rtc {
>     pinctrl-names =3D "default"
>     pinctrl-0 =3D <&pinctrl_pin_1 &rtc_pin_1>
>
>     rtc_pin_1: rtc-pin-1 {
>       pins =3D "dummy-rtc-pin";
>     };
>   };
>
> "pinctrl_pin_1" configuration is never set. This produces this path in
> the code:
>
>   really_probe()
>     pinctrl_bind_pins()
>     | devm_pinctrl_get()
>     |   pinctrl_get()
>     |     create_pinctrl()
>     |       pinctrl_dt_to_map()
>     |         // Hog pin create an abort for all pins of the node
>     |         ret =3D dt_to_map_one_config()
>     |         | /* Do not defer probing of hogs (circular loop) */
>     |         | if (np_pctldev =3D=3D p->dev->of_node)
>     |         |   return -ENODEV;
>     |         if (ret)
>     |           goto err
>     |
>     call_driver_probe()
>       stm32_rtc_probe()
>         pinctrl_enable()
>           pinctrl_claim_hogs()
>             create_pinctrl()
>               for_each_maps(maps_node, i, map)
>                 // Not hog pin is skipped
>                 if (pctldev && strcmp(dev_name(pctldev->dev),
>                                       map->ctrl_dev_name))
>                   continue;
>
> At the first call of create_pinctrl() the hogged pin produces an abort to
> avoid a defer of hogged pins. All other pin configurations are trashed.
>
> At the second call, create_pinctrl is now called with pctldev parameter t=
o
> get hogs, but in this context only hogs are set. And other pins are
> skipped.
>
> To handle this, do not produce an abort in the first call of
> create_pinctrl(). Classic pin configuration will be set in
> pinctrl_bind_pins() context. And the hogged pin configuration will be set
> in pinctrl_claim_hogs() context.
>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

It looks correct to me, so patch is applied for v6.15!

Yours,
Linus Walleij

