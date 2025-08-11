Return-Path: <linux-gpio+bounces-24165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022DB2095B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC8383B5016
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 12:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6619B2D3A7E;
	Mon, 11 Aug 2025 12:53:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46412550DD;
	Mon, 11 Aug 2025 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916794; cv=none; b=m9Vybr+3ruxsG7osIUbOX4aRqVtmhKpraJ+tMwMfTYg0uQybRwr2ceVRlIEhrv+AyVvtRIjhA7SS73RY6w7v1ZyDEl6QvQkIE7oSRSYI0YF0k2haABPCBmcY3jFEf7eUqk/2oRHeYiOLMrCsVfnHaHZYQYUbiXRxrtQ8A9ZdYbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916794; c=relaxed/simple;
	bh=PzKHJEj4lTvovauShH+WrgDrP9hez+2GiVL8x288uJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5PuVBuekWJWEHdSV+iYB2I7KExjGg1Fc/edEcbp/lpo56BLwewof2GMiaWX/xs7IBmV0o8cfXxPPB4f2bQfwePZDAZdDsGwfDyK+CfYGj4oh/byxQsSfA/yJXHDJy4UVUR0duIUHd2Cj1BsP3EnHQiKeRZrulInp8/QzQy7Bzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-539525ec047so4132865e0c.1;
        Mon, 11 Aug 2025 05:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916790; x=1755521590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEOkH5lctefargARyQFEBWMpus+tQbb86OVMRJmJknw=;
        b=DCMGbca5Re3J2WF9GKaqRbgBXHQ6AWnOw01UzIrX0fPZu4iz9GEOkFKnmUL4i9Drei
         BPArvV2iEozsb5KzguNu5vH/Z8M3xnZe+1XyaW+KNg/Xpk693rMwd9i7oWS3vWA1JhjW
         3bikQb0tfLzs7hVUSPzyVOeqaSvuE+e5TUruvx/Q1kZ96T2S26HVESY5Dmh/oFY/w/4I
         KAscgMe1drLQI86KjA0EpMQqo+ewY4zOiMn88jOygHx3BcwN4fpTMMC4r1zxhqz6aB8d
         rAOXfMLtQuVta2Zln/PKpMd6lGAYmPszoO2nG4lOeU/vjEOXm1qqUMPcMcLay1MVcE5Y
         9yTA==
X-Forwarded-Encrypted: i=1; AJvYcCU1i6vJiQucofBOZPsaX5MHH4olP3CIB9LS5QHKKgAkNUf99QeTJGLgVWTxGH3aDY0/hvu+gIO6SOV4@vger.kernel.org, AJvYcCU1jWR0zQQREAOcFwRnqw2+CEKjTdsTZ6KH/8sgUz6dSmr8QcHDskYX64VMCokTI7YKya64n7mxNR8XEw==@vger.kernel.org, AJvYcCUTyH3m8K/YR4RQnFZQxmE4vVl0oPat69TMBzFQwuvFTnPDVnoKmCMSXM4Q/XLzVTG1ESGoiKx2BEK9ESBr3PgvcO4=@vger.kernel.org, AJvYcCW8VvAWPk4mngx2EE1HP2HdmS4655Ug9lvNxpg6OzSLqWKc/wyBssbS97j5QmfMToY64/qKL5fEBAjvQExb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+JuCSwQD2ejBYC8cur+H5s+3J1AytLBf5ua/bQR/wD+dSHBA
	AyikFrI1K3iyb6GSTtoIQwr8dMaPRCSWb3thZ5tzaEVu2oWaARrbyQa/54fbuaRI
X-Gm-Gg: ASbGnctyL5Army/Tb34wd2RJlNZ0qROmsA2OUw66TP95pIEIJMSTM0EWm11jQEMhUPw
	Iy4d3pkMlEEB2wjMQPtQoa7cjj/YQcXYGJxtbEWF8bj2nBlHyipA2jUEVROFv7eld8c6wwPfZB2
	5Z8k1OXifHJZZLhXD0RpyMqQ8VqbOFrSJKFx4O5OGJq/6dxwH7baLY9eMYnTSRyHuH8w2inwg+1
	CfBe+vSPPcIOpafN9QhT8qDh9S3wUSbVEOJZHHxOWwx9vySplpY3gWuGhBFpFUKT05OyFdwZHrH
	Z/rbWLupdWfcZq1hwFXBwJ7Un5j5azV+XyBqwjFUofkhJwyb4Bf7K+59E7uHGQTnOsLLBeBhT3M
	JuX4eIWfAwSJYn4szKedCMtwOvW4n3dp1+AGg8MBSqNJs2IBLBoAG3kguSOupVMNN/9tE7H4=
X-Google-Smtp-Source: AGHT+IED7BkQgvuiO4g3OvgVWTOwNgDTl88gDoo5OnB/VyD988H9SqGrvaIjFf9AUrY/6yItuDEC5A==
X-Received: by 2002:a05:6122:1da2:b0:539:299c:8696 with SMTP id 71dfb90a1353d-53a92a6161emr4088673e0c.7.1754916789350;
        Mon, 11 Aug 2025 05:53:09 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b0289e25sm2622129e0c.20.2025.08.11.05.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 05:53:08 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4febcc4c93dso3426999137.0;
        Mon, 11 Aug 2025 05:53:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtFlIYBURHV5xQIi7f9VDReFVrHgWSiuXMY8vsusLKcbxScD/LdcwDIzQnZ1bLq8eauhK4LL4vAfggZCjx@vger.kernel.org, AJvYcCVeOf1ivJwmpsCKTayNeg+6DjtDduakhxFpg3QOhF5CimpCNN3XKVx64dUzAKl7SjOpPzHEuBYSJbuN@vger.kernel.org, AJvYcCX9KU+pugGeRhZZBn1L9gU1UUt6u/CE4UzGxpVW4ruazyxR/f1sNw4Esrpmb8AiPI/Rj8/IKs9pYetJRRiXVG+TDWA=@vger.kernel.org, AJvYcCXEmpLL9k+ZZGPhl9j0cVtUopMOclsCC4BnnUskd38bHY86qBnST1sFxz5m4jXNVNu+9Ply/tXUah5hnQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3583:b0:4fa:3547:2d38 with SMTP id
 ada2fe7eead31-50496539382mr7313405137.10.1754916788592; Mon, 11 Aug 2025
 05:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808133017.2053637-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250808133017.2053637-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250808133017.2053637-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 14:52:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTs114PLGm-fSrCw2MwK1zv8CMooWVwUvkrSAzY1ZpVw@mail.gmail.com>
X-Gm-Features: Ac12FXxHjLSHCCpUsLIHPEk37T-Ex7L40K5s4gv5YA6uff2Ze065CV8XrOqXqmQ
Message-ID: <CAMuHMdXTs114PLGm-fSrCw2MwK1zv8CMooWVwUvkrSAzY1ZpVw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] pinctrl: renesas: Add support for RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Aug 2025 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Add the pinctrl and gpio driver for RZ/T2H
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Co-developed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - Updated Kconfig description to include RZ/N2H SoC
> - Grouped PM_* macros
> - Made use of BIT() macro for PM_INPUT/OUTPUT
> - Added necessary new lines for readability
> - Dropped port_pins from struct rzt2h_pinctrl_data and
>   made use of rzt2h_gpio_names directly
> - Added comment for mutex and lock in struct rzt2h_pinctrl
>   to clarify its use
> - Replaced u16 to unsigned in rzt2h_pinctrl_write*/rzt2h_pinctrl_read*
> - Updated rzt2h_validate_pin() to make used of BIT() macro instead of
>   open coding (1 << pin)
> - Added consistent spacing around colons
> - Inverted the logic to reduce indentation
> - Updated if checks to use `reg & PM_OUTPUT/INPUT` instead of
>   `reg == PM_OUTPUT/INPUT`
> - Dropped assigning drv_data for individual pins
> - Opencoded devm_platform_ioremap_resource_byname() for "srs" resource
>   to avoid error message print as the resource is optional
> - Replaced set_rv with set
> - Added RZT2H_GET_BASE() macro and simplified
>   rzt2h_pinctrl_write*/rzt2h_pinctrl_read* macros
> - Moved rzt2h_gpio_direction_output() below rzt2h_gpio_direction_input()
> - Used consistent name ie reg64/reg16 in rzt2h_pinctrl_set_pfc_mode()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

