Return-Path: <linux-gpio+bounces-18095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E62A74D58
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 16:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3461D3BC485
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 15:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A894D1C860C;
	Fri, 28 Mar 2025 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJm+6Kk6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB68279E1;
	Fri, 28 Mar 2025 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174379; cv=none; b=bVKoYRMC7aBSZ4o9YN1HrHlSGfOLOhBBEE3j/po9+52I94uJ/fQa1r90dpmP1snrTXcAjuO+1He6DaWa4RspODLjm6OjicBLGOnXZcnuvhDflrEZQJyMhedhwAU+1p/AAJWgA5KTGis01ZYB7R2oQVqchN41HYx+kKgtOXhdD0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174379; c=relaxed/simple;
	bh=Q/nUE8KaquA4rCdsIvPcLGB9LunmUhEexILTx727+1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1srKOorgIhHxtRQ9daBA+snbMBrBmxaRFvtBcjFRb3JtEJ1EpGgl6QZiWnHe13SzL05HP62EgHp7EbeorfZxXypDsrSYJfumR5fIutyE24CGUAREIdL7v1HyYoJ5/1Fw/Y3oSF+6coqkXGXUYFt+kHG43spmvomSc1hYvmvy8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJm+6Kk6; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c592764e54so292621385a.3;
        Fri, 28 Mar 2025 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743174377; x=1743779177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Orn2weosT5jJana/hCRXI9hGoRi//FUlVXh3Bn5kQew=;
        b=mJm+6Kk6qXjL/6BBthzlvx/tcvg2ryceqWF5ZTB+CzceYjW2hKQKoGE4BkcOKo9Wc8
         p+LtPzwj6zmcCgPA2OALgqFzg1YffQdJgCU1KfD6O86t2GAYSVQlMZAenv6jUYILbUR4
         /QaRgNWuMvpa6JQ3Mht59Zl09G+LXOFrXL9hl2L1axbr4mgOAIDNpZFAydBQcVGBD+OT
         aro7/1Ost4kEowi4hXy0vPMwyRXbi0Q12gNteTsVhqyORVCylpf49pF38pjPl9xlKCzD
         1FlKQNQbzCDi9iw1Ytp0WvIoqqK92om5uyxapjEnUqaIUFV50ScSF5aF0UoyfJ57buoR
         aCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174377; x=1743779177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Orn2weosT5jJana/hCRXI9hGoRi//FUlVXh3Bn5kQew=;
        b=d1fThi9RI5crIOCE9pvPSu05l8QlR5Gktckfy6UklFl9tRPu2n0kR9vmQ7KepQ1aLd
         gsXrdC77g1lDOp5gRb7JZfyx7SjBPJ26m9MlhLkV61gfy/NfV7k3qWLWbqduV3ZFB7uc
         HzQNhtfIOh7n2rv4s3/yh0wcSAKa/MZ5FZXaeBqnTfwfqQEBoCvf6SCuPMLx0iODXjZt
         nsuqPM6fMaO0v3GE35EqErQLkXf96sKvGK5az0QRv4CPh2B+cbI8A0DywnjV8WpEH7Yo
         hBylhdn1/bEqVMhs0GV3fKJMgGVY6m04tfNT8xbE6U4rjtZmeP4iL/KhIQvnsanLQpO1
         tORQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPyXoOQidgFBkjbQd2iYan1ofgwqRK9doi7WcAFWcLXrBUYOhr9LatqaSGJDug8RF3RuiCXYrUv7c5@vger.kernel.org, AJvYcCUTmE9VIbuOSS3BSCO8+ZQk8sEp86QkWNtW1KPLLr3ZimN2Z3JI5/RCT97d5BUDj7UPpJiaLGEqaOTb@vger.kernel.org, AJvYcCVNPiac0N6djLR5JcDUbJHweN3UCoUfbAnjIkVgCFRB6p+RkrUkJFlDiKyIw4/FbJ/cWARNiI8lrluXJoFc@vger.kernel.org, AJvYcCWJ7aC6s3ViwJ7RIuMC3xS8DDjr91PN0odDfGWKsNNLSXruYQd/Dg+iFBnSyj2ui6YzyYnzSWUUGRac@vger.kernel.org, AJvYcCWvfhbVKTzjynNKVxuEJXCM8r7h9GW/IZYTu+6zL8p2Kyje6PysQYhdj4/jTXpstrUty7qX/zoO1NpNNw==@vger.kernel.org, AJvYcCXBGsNmMcxsstZq5c2rg0gk2TGnZxGeEnssVN0eriqNp4dhyVN/reEYHa5zz6Acyja7RShmyCuOIFT2mHaFTVblyOM=@vger.kernel.org, AJvYcCXm8Gvn4/el/urheoAl9l8MVF1SkogLfUDP7YP7YedNvJOh3btF7azH6cgqzREHlmgEs6RNR0ktrxuDM/L4@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDusVBNKXj8dER4YB35wmuJpBfsvLSWzyzp4urFuKThI27XBC
	96qN7+/6bM8IE1X46OVwMHpSNudtqYbrl95c0b0fEaPypMOLvIxiSK9pcnO363vkvjNvHJtPjlS
	jpJUDfqFHzsFiN0N4vszLLaAIFUM=
X-Gm-Gg: ASbGncsnChhFPhNEV6AV9ZJYE1oo1yLm1ALamQmU1OBZiZLrH7jK3yjjebS2/HKO83K
	83FS/YZgpz6tFa/ywsGvnXKUhg34NjCkurVzkMeI/xAdPhzSSfDB05D1T3CMXbxThcrFMN+j7lw
	Q+iBBa4nxdzV8yN1Ke0yeXfL/qt4tiThhnWunPwm7C3z3BSNSOAuqXfCAt
X-Google-Smtp-Source: AGHT+IFW0VA4Zv/33X4FCYRGbXWAjJlO3mDUtzxWY6BkmxfmFBxzZdcJa6RDKtHjQ59yi8kozYRD8j9xZb2ykNzJwVU=
X-Received: by 2002:a05:620a:1a85:b0:7c5:42c8:ac82 with SMTP id
 af79cd13be357-7c5ed9fd9bdmr1032660085a.23.1743174376627; Fri, 28 Mar 2025
 08:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <3d88eee6-1401-4ffc-85bb-3ea91f28d186@kernel.org>
In-Reply-To: <3d88eee6-1401-4ffc-85bb-3ea91f28d186@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 15:05:50 +0000
X-Gm-Features: AQ5f1Jo64DhVhvivaBJ7_luXnb-ReN0FMIj63tAndBnF_2sTF5NPerz6hjb5DLs
Message-ID: <CA+V-a8uckO7thK15Oa=+eDwtECzUS9e6tqa32MFU_mHmk+_Kew@mail.gmail.com>
Subject: Re: [PATCH 11/15] dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi  Krzysztof,

Thank you for the review.

On Thu, Mar 27, 2025 at 7:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2025 15:39, Prabhakar wrote:
> > +#define RZV2N_P3     3
> > +#define RZV2N_P4     4
> > +#define RZV2N_P5     5
> > +#define RZV2N_P6     6
> > +#define RZV2N_P7     7
> > +#define RZV2N_P8     8
> > +#define RZV2N_P9     9
> > +#define RZV2N_PA     10
> > +#define RZV2N_PB     11
>
> Same comments as before - not useful to repeat the name.
>
> It is the third patch in this patchset, which receives exactly the same
> comments as given before.
>
> I expect that given feedback somehow stays within group of contributions
> or company in form of internal knowledge. Or just read other people's
> patchset to learn from them and do not make the same mistakes.
>
For the RZ/V2H and RZ/G3E SoC similar changes were accepted, to keep
consistency with these SoCs this header file was added.

[0] https://lore.kernel.org/all/20241218192202.GA2184154-robh@kernel.org/

> > +
> > +#define RZV2N_PORT_PINMUX(b, p, f)   RZG2L_PORT_PINMUX(RZV2N_P##b, p, =
f)
> > +#define RZV2N_GPIO(port, pin)                RZG2L_GPIO(RZV2N_P##port,=
 pin)
>
> Not a binding. If you claim otherwise, point me to the line of driver
> code using this binding.
>
Note, since OF data of V2H was mostly reused in the pinctrl driver due
to similarities there wasn't a need to include this header file in the
driver code. My intention here was to use this header file in DTS/I to
keep similarities. Maybe I'll create a
r9a09g056_variable_pin_cfg{} so that this header file gets included in
the driver.

Cheers,
Prabhakar

