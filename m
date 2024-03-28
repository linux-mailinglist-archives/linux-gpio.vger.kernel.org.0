Return-Path: <linux-gpio+bounces-4797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735C8907C0
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 18:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11FC31F28148
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 17:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDA31311B9;
	Thu, 28 Mar 2024 17:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/NdIruk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796B2130E3E;
	Thu, 28 Mar 2024 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711648473; cv=none; b=ewox/BEScQQhx3qTH4A0OivEj7GkYzM5VtYqshEyFKIOQnMl9s0AaQAH1gBUB9JPJj2v9SwOMUet8AX6awAio6652pI1BJfk6+GLM8+X/prAnBKfWpvN7eWQ3yWtwBumth5tQ7MrBVziASY4e5Bs0o9netnB9iXj6gEWc5uPz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711648473; c=relaxed/simple;
	bh=4zbsj4CqH50R7JixcMpO1ri4GLOvlF2Hf8sdLEh/LXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwWY91D/JrjisFDB3/QHUl21BiBT05nVOkADdFvjWMNTz8qAHWh7vY7X16MiW/sCglDMaIIW/igBgxc6xJRbAY2b6lHm3YAu7plGutcvl/EBc38HgIsMQPII5RXEbZJyzlr1UxC1dmP18ALiCSfFXNtMs9bhf5zWvY2DV5J6PB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/NdIruk; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4d882358ecaso1185966e0c.1;
        Thu, 28 Mar 2024 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648470; x=1712253270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1Cskl/8ULKW24VEzrpd9iTu5S6FVlRzlPxLB+/D2D4=;
        b=P/NdIrukZv+DtK7KYxosEW+ZakLNhsVfRx2BxvKzxKLOa0+ikV8X3HIYJdF+i1/oaC
         jaXwtfpJR3JO/sSgBIc1slm4VZakNjotl5Ftb0bkCJaETNLqAQWrWKOBY2xb2+XU4m77
         bxKvBxkrAcZznepC6jKamAzoA7gJrJ37nIkfnn03o3ueRUjcpypFPJ1cWR91GrBET2cO
         /9r9ipwWuJ1bKLEntDmVjz6s1Nlz8xAV4WVeWmIpeaR5PKfswvGghzKq9niZcQxYxm+e
         rCeZqRMcrchSLrOBJpRAPWfABL6pBiDDyW6ocvRPKl+F0CoOJImNIlMQxtRKQfK9yDPi
         v7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648470; x=1712253270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1Cskl/8ULKW24VEzrpd9iTu5S6FVlRzlPxLB+/D2D4=;
        b=wWEuTJUh3WLCPqHXeJeZ8bvvVnI2ZB2C7JKedZbv/J/2kcCP8NTvKpVnO1vPFSaNNv
         TpgyzEI6dizbIXL2bToS4taM5pTEyGLVvqZnTgWlZ+0ww4bL/KHdo7kAaG87yZsTmMR7
         98NJgdo21Idf7yJpjGFsIC4Ut7ZGAATMqB3P/FXILpbXBAXjF/wGR+jSsO7Hsy1hovFc
         sP25dU0A1X079afURRxl1J6QonPbxQtGjgh4ibvK0VsGMvPMnn2YY64OXrc6hInvqZvC
         R2X/bVXwi4RivIsx1w90/H2e3PJDElaQjz7l4B1In18v66pDBZC24BK1l5KoZG9r3gY3
         YKCA==
X-Forwarded-Encrypted: i=1; AJvYcCVG84DN8WM8jM7PlhJXQY30dCPAo0nA7m0Jyo7qwzRiPWX+FMfHI05tmv21e+DUDXetFqUXS/6v4/A02x0INB0j+wL8uWoVh6wY5ayZjxRM2fQyiJiEw06aBvZGwwRsa+sngwM4D0idu4ke76J29U7D+ABR29VWn2qs5NX62OG96nyfg94mAl/Lbw==
X-Gm-Message-State: AOJu0Yz6VmyjKjMGyioOgxEMCViMWd8JEFF4fsUOPFa0eaSBM2jTmACL
	ziYdh3U/eoAVH/rrdjVBKNh2//Ri8Cn5zxqn76apu7EAvJvf53PxLbWBh+N96kQLze5a8nvtb6R
	pZN8xYvtC+DmZ0UfP4ZKTjXABKi0=
X-Google-Smtp-Source: AGHT+IH+9L+dh1E4M2f6/leVeirNgsQgENRWTsO7oIEw+BU1Lwaa6NwSk8NbVMIJG25/Alr5WUAuhztHGelMXqMehDI=
X-Received: by 2002:a05:6122:3686:b0:4d8:77d1:fc50 with SMTP id
 ec6-20020a056122368600b004d877d1fc50mr2737325vkb.7.1711648470219; Thu, 28 Mar
 2024 10:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+V-a8uEoyjjNCydK_Lr2CVOPN4j2oL2moVU8RgTravv3ygO9w@mail.gmail.com>
 <CACRpkdbWE7yQxxX1bv5JvSirJq1Dkq8_NDzVr9MaB7o+LZONPw@mail.gmail.com>
In-Reply-To: <CACRpkdbWE7yQxxX1bv5JvSirJq1Dkq8_NDzVr9MaB7o+LZONPw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 28 Mar 2024 17:54:03 +0000
Message-ID: <CA+V-a8tZBHoFDZ8QZBiStA+yzEhuvVTs50GiD1t_+APnsbTpGg@mail.gmail.com>
Subject: Re: [QUERY] RZ/V2H pinctrl implementation
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC, DT maintainers.

Hi Linus,

Thank you for the response.

On Thu, Mar 28, 2024 at 3:30=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Hi Prabhakar,
>
> mostly these are questions to Geert because he will have the main
> interest in keeping the drivers coherent, but I'll pitch in!
>
thank you.

> On Mon, Mar 18, 2024 at 1:00=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>
> > Option#1
> > - Passing the power rail information from the PMIC to PFC (pinctrl
> > driver) so that pinctrl driver can read the voltage level and set the
> > values accordingly. Here we will be using the
> > PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS to get/set values
> > Pros:
> >   =E2=80=A2 Debugfs can show the value in ohms
> > Cons:
> >   =E2=80=A2 Race condition at boot between pfc, i2c, and pmic
>
> This is something drivers simply have to deal with using e.g. deferred
> probe. Also, there has been extensive rework to make DT systems
> resolve dependencies before probing so that providers are always
> probed before consumers, have you looked into this?
> There is also the component binding used by some drivers.
>
Basically it's a cyclic dependency instead of hard dependency. For
example consider this case, the power rails are coming from a PMIC
device which is connected via I2C  to the SoC. For I2C to probe we
need the pinmux so this will be deferred until the PFC driver is
ready, the PFC driver won't probe until it has power rail information
from the PMIC.

> >   =E2=80=A2 Late time of probing
>
> How is this a problem? Everything has to probe eventually.
>
Agreed not a problem.

> >   =E2=80=A2 Impossible to validate dt-bindings correctly
>
> Probably not impossible in theory if it parses and cross-examine stuff
> but in practice maybe yes :) Ask the DT maintainers, they are
> after all all about describing HW and if there is some HW they can't
> describe they would be interested.
>
> NB: describing the HW in the bindings have *nothing* to do with
> the Linux implementation of the bindings so it is a separate
> issue altogether.
>
Agreed.

> >   =E2=80=A2 Manual doesn't say that pfc has access to the power rails, =
this
> > could be a challenge
>
> Hm I don't get it.
>
Basically what I meant was, as per DT we describe the HW blocks since
the power rails are connected to the SoC and not going specifically to
the PFC block passing the regulators to PFC isn't technically correct
(I may be wrong here).

> > Option#2
> > - Specify the voltage in the pinmux/pins child node alongside the
> > output impedance (using power-source property)
> > Pros:
> >   =E2=80=A2 both driver and bindings can validate the settings
>
> You should fix the bindings question first and then think about
> the driver.
>
OK.

> > Option#3
> > - Have an IP specific compatible ("renesas,v2h-output-impedance") with
> > value 1, 2, 4 or 6 (which indicates x1, x2, x4, x6 strength)
>
> If you can get it by the DT bindings maintainers I guess it is an option.
>
While I was waiting for feedback on this I already posted a RFC series [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2024032622=
2844.1422948-3-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

