Return-Path: <linux-gpio+bounces-30354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF38D0A9E4
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA4723031CC4
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204F1359FB0;
	Fri,  9 Jan 2026 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sElhulXA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E921A58D
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767968546; cv=none; b=QiB0TM8tJCWs8rfP1BANMqNeI2y4eoKeecue6tpB22ioxBH6NFyq82GjPAQdyZvXS6CUM9WOzslGAn4hJWjVlqfCefxIxPROtvyqhzowNIkk3eNifLI9qv0pz7fxYZuCDTD+wYvfXJe1XSCK6MfRyoGooroYxgOTzboDU9Zb1zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767968546; c=relaxed/simple;
	bh=HlhZVXMgcQvkUoG7E07KPDwKffpqxjTbHlDZKTkq458=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYdTVbOT7jMiWoukOaWIKEyECwudK4lSHxR+Vgs0+MA3CYIJVZIsOH19YpnRW/0VFsvmOtkJLyCsTH8GQ38HFhHK9gDG/+Y5iDsbYpymD2JQ+6vLEcUnkXtGVZzYVXHOgQOPUsuOmpOCacShRtYo0bdjFlI1BWD+GcnVYydA0i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sElhulXA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C3CC19421
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767968546;
	bh=HlhZVXMgcQvkUoG7E07KPDwKffpqxjTbHlDZKTkq458=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sElhulXAt+XXRjbA7A3Rkm3L3tTUf9d6omoKdjS/mdNvGSXZH4V8Nlc29SOoMRj3c
	 M5ar3iOgfFb0p3sZrNzU6nEKj2xoXXmCKj3CnmKo6KwkpSUD6CeHNm6d0AQn/ZVKVE
	 CwLLFDufLwIrASA0c/BVL4ByJJGL+6gSmzoGu3aGXFjjAZt74DgeGZadlajp9gZThN
	 95AYTo0eE2FXjzVjY5vj+vrEvRkIjJhyVrGdBK+vKpyt+ysKwkbygFGuqru0cnGZGa
	 3PWZGpvmhc7Kcrn3flpGzeWA64e3nU0d3PJwUrHeo6ZcGVY8DM3FSSYbYYw7zwfNce
	 skA7vIxkJ1YNw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b76c092acso1735146e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 06:22:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbXTZelNvxJFhmUkDuKlh26qF8U0OXoKFDDivwmgtABAKr8EM6ufnZ3bxmcGHCQnDtBAVxVjmQV7ov@vger.kernel.org
X-Gm-Message-State: AOJu0Yzctvr0/XG7tPdsF9izhRqiqcj0YnS1YG9+96msBsz0RRfHq0Ob
	cgIi0qXHYLbwe5DE01BU3ewSLuTr/eVVEPkAVvdmnoGqoq5A2RBaa8RLBElkxd+WQiI+LO94VYd
	k/r/HM3mQzeHSw2cWrppN/D/jSzm4n/9vTfXmCKGmvQ==
X-Google-Smtp-Source: AGHT+IFR4fsSBSrr+jT/vQJHYxB3ue2mzOFs72cX08lQKCb0rMmH/PdVSgbtotTyn+MmdwGgkM3cxOHmiIdrnNGbkAM=
X-Received: by 2002:a05:6512:1592:b0:59b:811f:cfae with SMTP id
 2adb3069b0e04-59b811fd01amr885931e87.34.1767968545181; Fri, 09 Jan 2026
 06:22:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com> <DFK4BWTWHHQF.2IBES82YDKAEC@kernel.org>
In-Reply-To: <DFK4BWTWHHQF.2IBES82YDKAEC@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 9 Jan 2026 15:22:13 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeV7djF27Jd6DWEJK60Fe-PcFSM_8dN2ydXXYSKPWVAMg@mail.gmail.com>
X-Gm-Features: AQt7F2rDQ9hpqW38Rg49aQkrDD7edFOIMhhfIk4g-Ah2K2MKeLFf2ItvZRW3nbA
Message-ID: <CAMRc=MeV7djF27Jd6DWEJK60Fe-PcFSM_8dN2ydXXYSKPWVAMg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: davinci: implement .get_direction()
To: Michael Walle <mwalle@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Keerthy <j-keerthy@ti.com>, 
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 3:12=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> Hi,
>
> On Fri Jan 9, 2026 at 2:08 PM CET, Bartosz Golaszewski wrote:
> > It's strongly recommended for GPIO drivers to always implement the
> > .get_direction() callback - even for fixed-direction controllers.
> >
> > GPIO core will even emit a warning if the callback is missing, when
> > users try to read the direction of a pin.
> >
> > Implement .get_direction() for gpio-davinci.
>
> I must be blind! I didn't see the direction register and I assumed
> that the direction is fixed and only known by the pinctrl (as on k3
> SoCs, you have to hardcode the directions of GPIOs in the device
> tree.
>
> Thanks for taking care.
>
> > Reported-by: Michael Walle <mwalle@kernel.org>
> > Closes: https://lore.kernel.org/all/DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.o=
rg/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> This will need a
>
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
>
> Otherwise the sa67 board will be broken with the defconfig (or any
> config enabled ARCH_QCOM).
>

Can you confirm, you're still seeing the issue with:

    https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1-1-5d=
bf8d1b2f7d@oss.qualcomm.com/

?

Bartosz

> Tested-by: Michael Walle <mwalle@kernel.org> # on sa67
>
> -michael

