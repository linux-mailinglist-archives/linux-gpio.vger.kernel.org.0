Return-Path: <linux-gpio+bounces-6951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F98D4C0A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 14:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E09431F232E1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBE01CB311;
	Thu, 30 May 2024 12:51:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942D117F4FF;
	Thu, 30 May 2024 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073500; cv=none; b=s7Ly0pe5yEwnllDo6aI5mnL243MDYcI/mQVJ8K7w80hRx2kbc9rIpMymuLh2BYE5UXPipDvfuMVC3vAm6Wph1jlEq9f179TtcP7JgdbKECcEcBV7mNlQJLqIgEaPEOPo8wr//mC/UzahUXY2vVIYki4cgXCrmdO64oJiGe+mabo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073500; c=relaxed/simple;
	bh=1x8OOg2/OeTGKyRzwklJFuBbZGFBhWid9Gvdn+4AK5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvonA3Ss9UcViAo3dAUOxcQChX9Ijog16wJWCtoYxRTKQE4sNMyDlmNcl+n38iognoZzhpL9yM21dUmUd7p7RdL4pX4y54cQPBBKrq7CkriRc4+v0ECU4HnejWOS/nuTvPqVYl8J3r1huXf/HlGNaRItzWzCOx0P9PRV3mQrPaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfa67a3e702so373320276.1;
        Thu, 30 May 2024 05:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717073497; x=1717678297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23ivYbltp3q9wnAhZ1dPoeYx/y3W3kM023z9t4bSaTM=;
        b=H/INmTncqPVE7FIhwcMbrIHkTtZezmfhdYjqflC2A5wsty3jT9yu4QtEaX+4KcXomx
         6P8teijfHxbAUlguiT4t7NqeqGFawWbu+5U1Eavr5XIxqvkw1sGf8YmE+PvVKrJtz4hy
         Pvj1vp1lY+NlYoA59iuBBCr3qaLBt5wp+3FzT4FT0u4t507uax/CDR85CR/+RzXMx0Bq
         6Fvw600mcaU9RWPj7PKopmSAV0qI5FDtGcxU5Krk3+0wyDGFMGxHUFFEW4tVbIO54/jl
         k142CTVEd2ZEFv3GktTNZE3Xl7iFBw6yHJJzQghfBobnwsVfIA5E/pa1JhXU9x6WESHr
         tFfg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2StKItlYMrfLk7Kd2z8Y8qWAIHRc/gpCSWPQ0FUxJ1CR8k2BHzAfFw3jizNow4ac6gcPad2CRs0WtJREpqTUotnEnlcgOL/EjcWnIgTXwDco7pyDLtUS0IXPlNGJQ4pLLEta7jgoSoIWvvDjbAcjxLjK986HhA7tiN75M797peum0ayTz6nrGmOYn4IsvKeIgyaC6F3REPev7Vj+lQE2OXBJ8Kyg1w==
X-Gm-Message-State: AOJu0YzIL0SWG//NM2Z689oVdF68z5afbwwCvZodW25Uucjh01fx2TXq
	rHrQ6jMYYxH8BtsjguKgzlnm6DCtb55hS3NNtJEzcZraprGJ/G0DvMPEGS8b
X-Google-Smtp-Source: AGHT+IH2uTsJBLRME2UDYsGfxCyXaTmvS8DXXIyxtoskx129jYb4XTYmXmIq8t/t4bvbZQZEchgfkw==
X-Received: by 2002:a25:8485:0:b0:dea:cc08:13f8 with SMTP id 3f1490d57ef6-dfa5a7e1312mr2121359276.43.1717073496981;
        Thu, 30 May 2024 05:51:36 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa48f480b0sm595940276.9.2024.05.30.05.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 05:51:36 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dfa67a3e702so373284276.1;
        Thu, 30 May 2024 05:51:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVszh8/MLGl0Kfo8H1K/Qgj1+IJrvV64I1AaVLt68ceRqYknX0PqxwIyTUVtt466rFe+Xe9hpss0jy6t2YRBm08ZaPElSHepZn21EKTPZg1EH69fOT8sQI+ZEplleGguA2VAKZVrHrxOwo2rfupfOM7DG3q13zRqF+IFc/7AG6iyXYapmwJWnsvpY6XYMTDFtB/SSNvn/s+JzG/B6IH78KhviY9B28P8A==
X-Received: by 2002:a25:dcd0:0:b0:dfa:4ad7:19d0 with SMTP id
 3f1490d57ef6-dfa5a5b7a11mr2270407276.2.1717073495538; Thu, 30 May 2024
 05:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com> <20240524094603.988-3-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240524094603.988-3-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 14:51:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJsNBw7oYyEYLfyN4JohPGD0ONMv2zrhy3U4MUV4MzQA@mail.gmail.com>
Message-ID: <CAMuHMdUJsNBw7oYyEYLfyN4JohPGD0ONMv2zrhy3U4MUV4MzQA@mail.gmail.com>
Subject: Re: [PATCH 2/9] pinctrl: renesas: rzg2l: Refactor pin to OEN bit translation
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, May 24, 2024 at 11:46=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> We currently support setting OEN (Output ENable) bits only for the
> RZ/G3S SoC and so the functions rzg2l_oen_is_supported() and
> rzg2l_pin_to_oen_bit() are hardcoded for the RZ/G3S. To prepare for
> supporting OEN on SoCs in the RZ/G2L family, we need to make this code
> more flexible.
>
> So, the rzg2l_oen_is_supported() and rzg2l_pin_to_oen_bit() functions
> are replaced with a single translation function which is called via a
> pin_to_oen_bit function pointer and returns an error code if OEN is not
> supported for the given pin.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -256,6 +256,8 @@ struct rzg2l_pinctrl_data {
>         const struct rzg2l_hwcfg *hwcfg;
>         const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
>         unsigned int n_variable_pin_cfg;
> +       int (*pin_to_oen_bit)(const struct rzg2l_hwcfg *hwcfg,
> +                             u32 caps, u32 offset, u8 pin);
>  };

This definitely needs synchronization with Prabhakar, as he introduces
a different set of function pointers to distinguish RZ/G2L (G3S) and
RZ/V2H.  We really like to end up with something that is consistent,
and works for all.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

