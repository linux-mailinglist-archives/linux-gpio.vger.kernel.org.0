Return-Path: <linux-gpio+bounces-26716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E87BEBB0306
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 13:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D34D2A41EB
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 11:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED172D879B;
	Wed,  1 Oct 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWjRZgh6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D4E2D877F
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759318480; cv=none; b=idn+6hKxwylB6yRFhCWOJPMjxOkxEtvpQ1sa6Ojbg0nkxOJfg7Rb06IdCqNcEKts3vNaQhZIXweCG65aSR+AguAojEY+Urt4iiMCdAUHgdjC2CHfUJr6mr/gMMERJI0XqrfTDgw0GsfTR28Ngr6ymNIftGCx8fWeDkoXO8b3e1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759318480; c=relaxed/simple;
	bh=WNpBXHh1zwWhrKWvrvy86jONBZtsYTYo1DpEBtOgp5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2YkL5V6cP+xMgWgT4/Y0veah6TTGIhgTXkd37SbUx3wJPm+tDUPIY8mV76XfqkNSxCGWLrqJE5ToP5GjzLJRFvzE3mwGrZCWrKGeU8RKk6nrk6wc8RkR60/Jp/CoXwZsiuwd5ykTwXn2y6wrA267FfbmbRu42KCpn5ZpT9msfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWjRZgh6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-36527ac0750so67016091fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 04:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759318476; x=1759923276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab9PlkF81fTilgeQLgjVXBGTX6LGhe7zzDg3KUeGvt4=;
        b=XWjRZgh6I9HTKrZiM9IqhApaoQNFUtG0x8Gx2nO8g/yIfsbbD0ZgSWKkN4i4Z21bSF
         nD06QB9Yn6fS39NIzu4T6e4wcDUOCQRBGYoUvCjr7Fbkht/Pac8ODn3pC7LI7BmJ6I3/
         VdMjrv0niMYQU9nu5OeSLwCgU6n2W3Q1Bu4TudtuQ06oBvBX/RbMsZ3iZ46QkGxOwVee
         xs8P+Ql3Uwy2jmSgX9gwKP3ATFxQsWcy7KKxs0+v8N2qUAi/dbu2jWmnoWwOrpl1qygb
         uNvgpvDsPDBfuRjLHUVNwbzOuNRz1U8p62SnoFfy1vLZZ+XsWLS6iigrGretJYMkfsUn
         XR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318476; x=1759923276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ab9PlkF81fTilgeQLgjVXBGTX6LGhe7zzDg3KUeGvt4=;
        b=fu8tnCi4T27BVYsyCCVMl8sP8sMVJPWWIuNMs6COebWQODKDdbcgEkqeJThYJ0MTuw
         Cnl8pO9WucI/aJfWUu07q7uto3cIjYscKuHeTj9g0De/anMJTyLqzIAt1Z00PFtJlWN2
         mDoM10m3eo9LLz45ff9sTv1tV53XsCbRzfTnak48q6IImoR2bBCPYsSyQGfg5q1Iz3kX
         lrryN1njJWd42MEukeOdqmOWA9xFlNJT50Ez+gYyWkQGt3G7NGwE8yLAu5WCth2rwmSd
         Tnsjfx/3oIE2voqqrKr1VZFUn31h7GGWIqIWBbxPEZX2/sTIbl57Q0dr55HvOkiEv/x/
         2sJA==
X-Forwarded-Encrypted: i=1; AJvYcCWnjvxflpqaUEk7ixlAz6eJyTl5WXz2GPeav8fYFSWQuMsVwxUX/8uxL7zXzTx16JG2ciZ0YCt+CfAR@vger.kernel.org
X-Gm-Message-State: AOJu0YwnrtffWy3FfjpRe3iwbQZH8aSwZK4nUKHKWiCb7fek7z/6mm2J
	tYcHU+5Ea+UWNrExQrPO3ViiXB0dPPOJibZOtL8WGxy0Xol7zUvsEQVDQeWb/YR9PiXPGNKMMLB
	SZv61dlmAC42eJ/ou7gAc4B1GDsD97MSk7900XeThnqV/w88/4m7t0bc=
X-Gm-Gg: ASbGncsF/MxMNaIIceJNSs7w8jxPX8nhw5Cao8cHiCHR3DwzTrNli5cT20Unt29we/n
	xOMhSxiDG7CeUa7G40LyaadTrIvrbzTp02Czqn33apR3a5tr5k4BAgc7Szxi7jF3xSdQfYo6naC
	ASIi2343DlCTZ7iSU/42LdrmPoofUSkHPOTbsXk7ZgL/6hMdPubszczuNn7h7cISLuJ+Fco616j
	8cTR6rbE6/SqQKR3rKoK6NdO3J4dF4=
X-Google-Smtp-Source: AGHT+IGP2vuqK84XEqUB3/YBZvgWQuvqnzUP46OyqzDbIXx5IsYLhF3Kjcv7T2SMXTcgPNWF4YygZqINvVbsODfn46g=
X-Received: by 2002:a05:651c:2121:b0:370:7fc5:7e06 with SMTP id
 38308e7fff4ca-373a7394b33mr8623441fa.13.1759318476088; Wed, 01 Oct 2025
 04:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-manpower-glacial-e9756c82b427@spud> <20250926-unshackle-jury-79f701f97e94@spud>
In-Reply-To: <20250926-unshackle-jury-79f701f97e94@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 13:34:24 +0200
X-Gm-Features: AS18NWAJqeVZkj4FKdackrTbpQrFfNV0Xk66hhPzy0DGiPwaNOMELkJ3p_nkSbA
Message-ID: <CACRpkdZ5RCcaNJB_3ufAgpDtdJBKfOVrMbJVAQWaVSOkY0-XNQ@mail.gmail.com>
Subject: Re: [RFC 3/5] pinctrl: add polarfire soc iomux0 pinmux driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 4:33=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> +static const struct pinctrl_pin_desc mpfs_iomux0_pinctrl_pins[] =3D {
> +       PINCTRL_PIN(0, "spi0"),
> +       PINCTRL_PIN(1, "spi1"),
> +       PINCTRL_PIN(2, "i2c0"),
> +       PINCTRL_PIN(3, "i2c1"),
> +       PINCTRL_PIN(4, "can0"),
> +       PINCTRL_PIN(5, "can1"),
> +       PINCTRL_PIN(6, "qspi"),
> +       PINCTRL_PIN(7, "uart0"),
> +       PINCTRL_PIN(8, "uart1"),
> +       PINCTRL_PIN(9, "uart2"),
> +       PINCTRL_PIN(10, "uart3"),
> +       PINCTRL_PIN(11, "uart4"),
> +       PINCTRL_PIN(12, "mdio0"),
> +       PINCTRL_PIN(13, "mdio1"),

This looks like it is abusing the API. These things do not look like
"pins" at all, rather these are all groups, right?

Yours,
Linus Walleij

