Return-Path: <linux-gpio+bounces-23200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D2B0363D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 07:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3F0C162127
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 05:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F4F1EFF9B;
	Mon, 14 Jul 2025 05:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c++Zmpjn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E3D19A;
	Mon, 14 Jul 2025 05:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471954; cv=none; b=TQR/wiw0GSFXxgPLk91QSRWEZDB10EL1R0EjcsP6MVOpHXQq8OIo5lzJ46askLl/q0ALuwZPCGPZenrJ0DHej3aaLWPlsxhBrFnxX8I6Pe70nrPlY8koM1sm3cQY8vlvTG6y4Wf2Xl0vXwlnkUjzosjdthXV5POP4NjGzDdRXuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471954; c=relaxed/simple;
	bh=6z8Sp3Tr8iV1COqe+xw273i57IQTfJG7JA5LvjkRnQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkM1VeVaHZIh1uex/wp2q2Fo/z7W4chwSXGU7g7BKMgH87nx7e0E2qj+KAFWXhbx1qeYnd5BBLEouy/D0syzSpUVQ7+nWunxEagBq3c/yD/yCEiXzuzUWyLidd47AzPGduPINpuoePbxfq8VFhBacCzoKM3b7KryLDWMsn+AlPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c++Zmpjn; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b6a349ccso4804041e87.0;
        Sun, 13 Jul 2025 22:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471951; x=1753076751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVTYNalbBM5olFEChg+MjuhuKNcUdjwiKE1Nx8DyHVc=;
        b=c++Zmpjnhwy7wO5lCXM5aMRM8ON0u6EZEu6G/JV36xwDYlsOxComlpPwmn8qtvSh7X
         sN5ZRWfDO1iW4m6Ue9T/800CMD9WvVsmJ/cU2VdAPrYMBluNHNfiHgZD0mRVdUfg0yhh
         oPLwvCh7MERVcevIs9ALUQnq/lKjpXcDOBvrC46V/ORbzK4vuivbhXOyX/6sf8uWDXTk
         dIoUk3aK/CO+VPkYRzeoMgdJxLfZbNOMW2Cx9voHzBbF5gyaFK9D0bqc4H5+3R0fG10l
         FlJfh216e8VCkB3w7WJHZAoQEQ6Nz3qbtsenHoc/SFjVTBY7gnNHGUnEwvlKtni5gTCe
         7D1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471951; x=1753076751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVTYNalbBM5olFEChg+MjuhuKNcUdjwiKE1Nx8DyHVc=;
        b=IyA+7uojjNX+mlcazBXKaguB0IkqBX1Z4/dCMuFHgC2vryJr4t7gbc9OwlKlp/J29C
         ZutzSxovwcROF2bNpxtyXaW4eR4qY63kG/HcwZQ7wrbQEc29PShueJ3aSH9KNoA6NchY
         4jxWelE+nEyA5j9PoCk3VsOvi0wwxhWivNjH0DF8ckMDw7mYjk4ON5VZVB7flgE5O7tM
         x+LkResBbtLAyG1NQ5Dn+3r8CZwQzExdgbrl409ZkEHRsWj+ytIK1jZtQSX3xQ3+MNOS
         FhrXgUqngODiwwM+dLhelyCKoEieYZTYixw7kDzeKk7jfJrBhjPkVGKC9TWcB6oZnZDO
         R34g==
X-Forwarded-Encrypted: i=1; AJvYcCVArAsY7pKo4JQt7rjkUY43p5+8hL0g8FY4RjsWhO911Li9K0eCogY7lgbXHqnytAHI3wcakM0LK0jcUow=@vger.kernel.org, AJvYcCVo64v7fb0vpKLUQrH4n86T8Z3JvP8nCN6mkzZblODxSPz1BnJZt60ytwPM6U88CGEy3QrdzDR/VnYd@vger.kernel.org, AJvYcCWm4iTnpPKaGBYegCNa2nArwG8GIxwI6Ix1InBID34FBu99Z4GqP6pmTaZZlmQECR72rGgbP2bpIhOrwg==@vger.kernel.org, AJvYcCXBhMOq3jomlM0brQ6+R84hGbArXY+BJrsuDNxiLLOrI4xc4PUitn1Q56JSVh8gBFFpKqmIgMDQDccT/qKC@vger.kernel.org
X-Gm-Message-State: AOJu0YxpLP9FIbm3RhAe9RmTJ6ixRKpQauOxt3UA+sjAHCwxs95YZtZl
	IfTCbxzcjegP/Mk3zoqi7iNt4bYab4otdgSYZE6SPArXtLO9RrTtGnps7wntAbow7cNP11llODl
	AUNBQoQ+TD3fYeIvCpVvjPiflScLOaRo=
X-Gm-Gg: ASbGncsgeBY3sQ4a3f1t/1hSvSZZDHpshQK8OldOXtoZYBwM22nV8QM9Mya1b3Rne3V
	XOFTOtrOEzwRyDEKdPjsL8KtDBAU3+3cpEKIHeGztveqivm9PO3KTlGJYi4Tur3VJdPDsniST5d
	/kUWAbwnJFu1zHLg/ZbVqFuBh43vDg9t0qTnFpuW97Kv9wQNT/CW5GDVCxk1teetAqqh7vxRwgy
	j2S9Fk=
X-Google-Smtp-Source: AGHT+IEeFJTEdcgxGRq7MSRIyL+pUGzAE+SuHtAzHjgTjInquw6BxQB4oD1jE6z8Ny+HIzeJdEcgoGSVQf6JVav6crA=
X-Received: by 2002:a05:6512:3a86:b0:553:291f:92d with SMTP id
 2adb3069b0e04-55a04642322mr3412376e87.57.1752471951120; Sun, 13 Jul 2025
 22:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com> <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
 <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>
 <yslfabklduaybg255d3ulaxmzpghyj54zdfeqkx3oxgisxf6fo@2wecuqpvvefc>
 <CALHNRZ8jq++KVKxKP2-GwMA6CauP=cM2_wt==MRAV4mOzK2kxw@mail.gmail.com> <xc72g7j7png443pjxu2wpsuqofgrpxvn43emkt3rv5qrjzf7vt@qzvsiy3eakub>
In-Reply-To: <xc72g7j7png443pjxu2wpsuqofgrpxvn43emkt3rv5qrjzf7vt@qzvsiy3eakub>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 14 Jul 2025 00:45:39 -0500
X-Gm-Features: Ac12FXybSVq_CahVKZ6mV4emprpB0sz1OeXMOs2OzYzElXfBnQGbjICI8iX-vqs
Message-ID: <CALHNRZ928+=85FbvfKt1c4VX7RudU7ehuOa6wwLj8JJNz+=W-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 2:08=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Mon, Jun 30, 2025 at 02:23:42PM -0500, Aaron Kling wrote:
> > On Wed, Jun 11, 2025 at 10:23=E2=80=AFAM Thierry Reding
> > <thierry.reding@gmail.com> wrote:
> > >
> > > On Wed, Jun 11, 2025 at 08:58:49AM +0200, Linus Walleij wrote:
> > > > On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Thierry Reding
> > > > <thierry.reding@gmail.com> wrote:
> > > >
> > > > > One thing that's not clear from this patch set is whether we actu=
ally
> > > > > need the Tegra186 pinmux driver, or you're only adding it because=
 it
> > > > > happens to be present in a 5.10 downstream driver. Do you actuall=
y have
> > > > > a requirement for setting pins dynamically at runtime? Do you nee=
d to be
> > > > > able to set a static configuration at boot that can't be set usin=
g some
> > > > > earlier bootloader/firmware mechanism?
> > > >
> > > > Actually, speaking as the maintainer of pin control I hear the foll=
owing
> > > > a lot:
> > > >
> > > > - We don't need pin control, the BIOS/firmware deals with it
> > > > - We don't need runtime pin control, the BIOS/firmware deals
> > > >   with it
> > > > - We don't need runtime pin control, static set-up should be
> > > >   enough
> > > >
> > > > These are all enthusiastic estimates, but in practice, for any
> > > > successful SoC we always need pin control. Either the BIOS
> > > > firmware authors got things wrong or made errors (bugs) and
> > > > there is no path to upgrade the firmware safely, or runtime
> > > > usecases appear that no-one ever thought about.
> > > >
> > > > Aarons case looks like that latter.
> > >
> > > This was a long time ago now, but I have a vague recollection about
> > > hardware engineers telling software engineers that muxing pins
> > > dynamically at runtime wasn't safe for all pins and hence we had to
> > > do static configuration during early boot.
> > >
> > > But then along came devkits with expansion headers and then people
> > > started using scripts to mux pins to the right functions and such.
> > >
> > > > I think it'd be wise to send the message to any SoC system
> > > > architects (or Linux base port overseer or whatever title
> > > > this person may have) that a pin control driver is usually
> > > > needed.
> > > >
> > > > The SCMI people heard the message and have added pin
> > > > control into the specification for that firmware interface.
> > >
> > > I'd agree with you that there's plenty of evidence that we need these
> > > drivers, so maybe I need to go back and look at what exactly the risk=
s
> > > are that come with this and maybe there's something we need to do to
> > > avoid that (I'm thinking along the lines of certain pins being genera=
lly
> > > safe to mux at runtime, but not all).
> > >
> > > Thierry
> >
> > So what's the path forward on this? Will this series be used, or is
> > Nvidia going to bring back the pinmux scripts and regenerate
> > everything in a new series?
>
> Let's bring back the pinmux scripts. I don't have much time to look into
> this right now. If you have some spare cycles to take a stab, that'd be
> great.
>
> For most of these newer chips it should be far less work to get this
> going because we really only need the SoC bits, for which all of the
> information is available. For earlier chips where all of the default
> configuration had to be done by Linux there was a lot more generation
> needed, but newer chips do all of the default settings in early
> firmware, so we don't need a whole lot of pinmuxing in DT, only where
> it deviates from the defaults.

I started looking at the pinmux scripts a few days ago, but updating
the pinmux driver import/export for the t194 style spiderwebbed out of
control quickly. I expected it to be hairy, but that was an
underestimation. Doesn't help that I'm not the most proficient at
python either. I'll continue the effort later, but if someone with
more familiarity wants to try, it might be quicker.

Aaron

