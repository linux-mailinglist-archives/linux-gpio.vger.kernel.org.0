Return-Path: <linux-gpio+bounces-14852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EED6A12930
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 17:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCE4E1888D4B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 16:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8850119067A;
	Wed, 15 Jan 2025 16:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XDQ3VaVz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798BB70816
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736959950; cv=none; b=DqRZkf6b5aqkkFGm/jZ3wtvfTWeMX8axUepz3yB/PAqifJBgk2/4HnNuEKWH0HtYyi5Wkhe9yoVxrKqjFC0CVJlaNPGnmshoZgeaYJhVamK16A4YcxO3unrcAMEEwVLIB8+EIeQK/ZSoBJzzmwxLtuZ4c7Xy8opFZ6D95lWONe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736959950; c=relaxed/simple;
	bh=ScUqTDWnzQduLboZQZn5qJxxt7JOhe69U+tproLSWEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kM7T90b1Q1xWNUgs3PzBZKOa/+w/9ebW7mr5TZt/UCPvhoEB4JftCldnzUeVmcsXDa0UjxwmKAhtbHb5T0vAa1VgS5IHP2qsrRw8rctmD5Iyc1lRuF1ckS0OJGuupcQn9awY8LoKiPQfJAiKFiTMA5YjqoIF9brGDQiT50O/HjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XDQ3VaVz; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30229d5b21cso55794021fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 08:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736959945; x=1737564745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScUqTDWnzQduLboZQZn5qJxxt7JOhe69U+tproLSWEk=;
        b=XDQ3VaVzzYjFblncRLXjmmjSoD07aozbGJd4uZ63kgOe+2h+jrvR5vzTgC2mHpZpUb
         yltqZmUZm5VLRMI/1w6miwaplhFlapmsjZZbH06HBSLUM0PHwROkgEtAiGCFrynk260i
         rVH9hCEYw4VoH+0QLbuVq5ED+z53npL0QMrJIDhFEjog+LmsvAlLmF1dq20HDaTFbuf6
         QkdQhb4anmAvSlKFEeZDVQ0bDtYoZfjw5LNyPWxUrQ1M0qoH8bZOMzopiaCM6YoVA4OS
         Yq8dXzkU/Fr+XOZlHeDfLbXhEdW9sjNPJeyJ5hg5nxLoO29SHGKtucvljUcevFuj5Mzh
         IlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736959945; x=1737564745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScUqTDWnzQduLboZQZn5qJxxt7JOhe69U+tproLSWEk=;
        b=kgzTQeg081ivrSkhmNugddotKU0Mlo1uTQVAgVKOTpHIfiKU3D/mX1BU0WMX8SFCzq
         W/BB40IdhGpoqivE6eAAAL4YVH1r2EC84Nt+6rG+csZ0h76D5+jBzBrn8o40JMB6lHWo
         BhMQCfuWswf9EaU6Rt4OxHiH9kzh6drgd+6eFC0qW4efeQYfCPE02zyvy/Ww/uRlp8Cx
         O/J52xrzB5uxuzitEVspRbvUATV/tU8DifQ9ub3kaSRLf2VN6RzwglR+JetwxKbfH9w6
         bwDxIN4QcoZdH0biKdAgnkksmrWMmi0HhwQQ+bRQOYsDZCnYX+oV/SXBLaTeyzFjbUXf
         RBjw==
X-Forwarded-Encrypted: i=1; AJvYcCWD6l7TaQ8IqiiOOR/+J6oCvn0J8vx3/2hPsSYn1k9W/fNlBYaAP2sqeCArCTgfPujOVwXk5u7nZjM6@vger.kernel.org
X-Gm-Message-State: AOJu0YyTqvL0IItj4oLphwD5UV2i83YeCuvdTed9gpMIq14TqreF9GfR
	Tai/biIsZ/ZHjxklvrbl7HiKj9dI3YRGZNITGjJ/iPw/ig+tjTLFk3PE3Q48vOhOpDO+GxB/pj7
	SuEVYFNSS32P4GGsLF6qDQkHMcEVI0Yo7v24NzQ==
X-Gm-Gg: ASbGncsuBEDPhyVmkODj8x/vw4lccqy2oi1lMz6ZcNXNlqAq98JJkYVgmV/5+fhci6D
	RBVadmL6139+4Qr+Q/iATk1oUOiZkAj7znq71VHdTK9EUVSxjg60Nk3jW568ta2piPNqGuA==
X-Google-Smtp-Source: AGHT+IFbudLF97M9SY4kT51eRu7G8hIOTmWNuILKuPS/5RISLBhUaMA8RaVyreeevht06KYG4u13lDLUp7DnHNKW1lE=
X-Received: by 2002:a05:651c:501:b0:305:d86a:4f01 with SMTP id
 38308e7fff4ca-305f45db5d9mr86648231fa.31.1736959945548; Wed, 15 Jan 2025
 08:52:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com> <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
In-Reply-To: <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Jan 2025 17:52:14 +0100
X-Gm-Features: AbW1kvab1-KFmYpbsyzdNL2AKyeg7H-EBh1b21mZES0GH7vaSk2m90tKHAwUVsA
Message-ID: <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 10:55=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> Hi Andy,
>
> On 14.01.25 10:46, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >>
> >> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> >> for more than 12 years.
> >>
> >> Reverting this to dynamically numbered will break existing setups in t=
he
> >> worst manner possible: The build will succeed, the kernel will not pri=
nt
> >> warnings, but users will find their devices essentially toggling GPIOs
> >> at random with the potential of permanent damage. We thus want to keep
> >> the numbering as-is until the SysFS API is removed and script fail
> >> instead of toggling GPIOs dependent on probe order.
> >
> > While I understand the issue this tends to get never fixed until the
> > entire support of iMX boards will be dropped.
>
> i.MX is an actively developed and widely used platform. Why should suppor=
t
> be dropped?
>
> > Personally I do not like
> > this series at all. Rather let's try to go the hard way and understand
> > what's going on to fix the current issues.
>
> /sys/class/gpio is deprecated and when it is finally removed, this series=
 can
> be reverted again. The alternatives are either do nothing and live with 6=
 kernel
> warnings cluttering every boot or show users the finger as described in
> the cover letter.
>
> Do you see a different path forward?
>

I recently wrote a user-space compatibility layer for sysfs[1]. While
right now it doesn't support static base numbers, I'm very open to
adding it except that I wasn't sure how to approach it.

Is this of any use to you and could it help you switch to libgpiod
without changing your user-space set-up (given the support for static
GPIO numbering)? If so, how would you like to see this implemented? A
config file at /etc that would list chip labels and their desired GPIO
base?

Bartosz

[1] https://github.com/brgl/gpiod-sysfs-proxy

