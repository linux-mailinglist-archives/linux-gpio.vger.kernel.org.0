Return-Path: <linux-gpio+bounces-17137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316AA50D82
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 22:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BF86171AE9
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 21:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF2B1FCF68;
	Wed,  5 Mar 2025 21:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5QYiflx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E77F39FD9;
	Wed,  5 Mar 2025 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210337; cv=none; b=VGJOe5BmbuJz+Z3MSMyB+UBCBZMFwsyAB8Zl27kvjKlI6kjKBcySoD7U1mhHAk9hs9E5XH4aUgVLI3SxdzfU3pLZg+OEMDZyayIJXY03kf7QOBb5cI2TxvnbK0w+fHSVNHVhnA8WQb2ko1S4ir55dCcTbRICSZpqW2DoqfyETRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210337; c=relaxed/simple;
	bh=b8FX+FPPsJQMo7T/d7XreMLHtYXuhMPCyfC7XYOpL1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UD1TsPgI5P6oeaBHIUiReGkwyJ5VexzhRoifBHvfRViELeYbI4+s9mZqplywg0kroE5PjcD2rIqJE00rT5kE6fuYCVo74MOAwpqEtHARASbtw3ovBOyhwXP+FPPFI2uVtiSd4zT4O47vPN8XOpfBV7qkfLsRmFmu75mm6bsKn84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5QYiflx; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d30787263so141778241.1;
        Wed, 05 Mar 2025 13:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741210334; x=1741815134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwBf/PdHAgKtVeZNOty6xOL4lAMDPyUr9iSlqs90DIQ=;
        b=B5QYiflx6ArgIx10D9nHQ5jHmcwa5Cno3u+/7KIMUsdeUs+MSjXOwsfJwoQEJVujvm
         UaU8IOIQnG1/TfpEZNj8FORmyLl2eRhWziyZvZtJ6YA7uB2ewl+ZU2Ns76d+voO0KJI2
         GwONxNo77k9SwHRRmCX2tgeC6JPLapt7gE7IAhXxKrA0Fbm/lsbmasnit8ICF9Or1Kpa
         iRXAxqFVeIIuKkLJxhMGH+hng27xpFeqYql9LgJLLHMDrkr+Cp+jf8kXiDOU9wQSeXG+
         mcDMzRw8c1vcQhSg0y7AZR6EGfy38rCiuMcPNvijkeBXwq6ZaTJw9K0M7ZDPMm0xWm9s
         ktLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210334; x=1741815134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwBf/PdHAgKtVeZNOty6xOL4lAMDPyUr9iSlqs90DIQ=;
        b=I2WbnYsXM130I2YDKFyDFduSgvXwr/pLt//RnMpLy4GpskokIJeQWStGthhQRYueIb
         dPPJUcapI4K5fjKljU8VjKmUPDoCcDgxXnqnnhNV9iHyuKFnIG6TqcIIMt/ErT4+XSJA
         72WT6ZfG8w7GUclRKN1nVGwwQqqPyWBonC1HIsXD5r1yo/q6goBWYASg86IAnxkeKPHT
         9MuZr5jVIaLIJQYk6LikOy/II4o05O8dX5LGxFtPs10fLdcFifMISJ5sFkruB3A03CEd
         zKwx/A0qQn/PMSgvHGxo3UzKHCjJlw8nS7L2DoQb3hZyKdNmzdPHv0xSgJxjaULmGvGD
         s0qQ==
X-Forwarded-Encrypted: i=1; AJvYcCURfZ1Ev3LDP6HSRD9FIEM2ikAOWfPgbmln84IELvpZoXPf+6gPC4z6YHRS357O/d+I90O4sZRtP36z@vger.kernel.org, AJvYcCWX5YJusn291eB5EmzabOFnFOnlWL+u9ed2TKcDETYPxjTGXRTpmMvz5TNDT8LJ3gH19j1uTrc2yiBZG/f419TMJcw=@vger.kernel.org, AJvYcCWupw1qDdAwElvwEp7T/9DSUCis7EsTiC0UlGhGp4gyNGPSrb+r3jOWKd0ke5YgNTd8NzJ6HR/cr4jAXanV@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSKgz+SstojGGmCShIzLvUw/MHgu/UzUlpD649nPJNwYdcfzd
	0f8NtyGD5tcQ7L2/8TobJYDkeGU9d6HmVZKMxobOHmQip3ohwFFB+Lr4dTrQiVwuDksJzSY2Tyi
	NO0CtePmUs4jPmau6VM6jhNr5ISo=
X-Gm-Gg: ASbGncsuPLiVZLjr4TxlbOYyOYpahiiqJ4cNtIzbBFbIgBBuijx8zmY4rGOhRvWCzbE
	5S7r2YBFPltx3xlMFLaqpQ+wbsSKBbnZNpQyFliHwRXHk+jMm452/nBARJ2eJlLVCj4Q+/J+idN
	+8CCyY5UfszBaD8bWAX/0F+X6xLK+U0GYQp/LDBsnC/q1q5O0S1ZVglnl6
X-Google-Smtp-Source: AGHT+IFgrr6VIUIcOXCCpcJab+W21ioPkRDY7ncbt+0STjAwzmqZQcLWD37jV9/5SKcoE4ke4CD2iShnyRN66/iR69M=
X-Received: by 2002:a05:6122:3543:b0:523:a88b:a100 with SMTP id
 71dfb90a1353d-523c625956dmr3404606e0c.6.1741210333929; Wed, 05 Mar 2025
 13:32:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com> <20250305163753.34913-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305163753.34913-4-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Mar 2025 21:31:47 +0000
X-Gm-Features: AQ5f1JpJ5ckUu43kvh5thGvkuItWxbxGTTpQtkSBQkQSbz_1vafsIZstwslHSZc
Message-ID: <CA+V-a8tsmpJQg=ierSj8R0QAEDxBLoSZ81M3XW7q3pFMZaHSnA@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: renesas: rzv2m: Fix missing of_node_put() call
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 4:42=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> of_parse_phandle_with_fixed_args() requires its caller to
> call into of_node_put() on the node pointer from the output
> structure, but such a call is currently missing.
>
> Call into of_node_put() to rectify that.
>
> Fixes: 92a9b8252576 ("pinctrl: renesas: Add RZ/V2M pin and gpio controlle=
r driver")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzv2m.c | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/re=
nesas/pinctrl-rzv2m.c
> index 4062c56619f5..8c7169db4fcc 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> @@ -940,6 +940,8 @@ static int rzv2m_gpio_register(struct rzv2m_pinctrl *=
pctrl)
>                 return ret;
>         }
>
> +       of_node_put(of_args.np);
> +
>         if (of_args.args[0] !=3D 0 || of_args.args[1] !=3D 0 ||
>             of_args.args[2] !=3D pctrl->data->n_port_pins) {
>                 dev_err(pctrl->dev, "gpio-ranges does not match selected =
SOC\n");
> --
> 2.34.1
>
>

