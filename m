Return-Path: <linux-gpio+bounces-27383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD3BF6F5A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 226264E8D14
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52E533C513;
	Tue, 21 Oct 2025 14:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xI3DCGrt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FCD339717
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055373; cv=none; b=XZNWjv91DvKJfbaUmPF8Jd87DY/e2R46UeinRVqwjO+x/Rkr0JHEgTgL93YBSk+eNxwxM/8vdm0iIM8zuNzvc4n/4HGJXJJs9iJgWOqKp+ihHyN3RydtUxnQhBrbBNDLAHipY0cNMX59sBC3Xzx8BmVup97OnZiLnCuWvJyG8+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055373; c=relaxed/simple;
	bh=olee1rr9nLhphfZIFxDNoMLGLJzNwbgY6TM9tcztPYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzI0T6G+TEYI6A/zhjroQxFXkltrpwXCjmQx8ZS+xT05TjuCqdZy/llKWfDU++CNquYPiZ6anE7MbERP0EqkjXaKnoJlC8BXHjAWfOPVoPr2Hlcib+UTDN1/mV2ZTnxR4hXqgG59Mf5Rl5LaTi4lurX8IoLvJ4gisq7Wf0plxyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xI3DCGrt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57dfd0b6cd7so6258343e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 07:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761055370; x=1761660170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olee1rr9nLhphfZIFxDNoMLGLJzNwbgY6TM9tcztPYA=;
        b=xI3DCGrtnMLS0hZ22IIXKfLlhs2spA/G++wbxOC8I2jim3Vox6hFsKwPIRQ7cwxYY6
         wa4FyyIvEHHf+jwYpfc8p71FaSZj1uusUjZiCAV8U9RTfWQMJf/Nb7daEUVNeqPzvn8Z
         wxXgGm6YW2PO4ScFX2p2CZyRrg/Xy34Pd2sMd5yKLtTvQjf2JbxiYBzny3geq22MTw55
         PBFqCa7bh/KTBDKPiEmFfsldx3KFNKKe4F0MKwKFYDVmyfnItE3vfoWcyBmbHNiikwsR
         b9Ebut0jMSK8iMupW3sDRnxmkhJQviOUBHLWlguUv11cBJKqPi3kpw9MVTMbVZImW5C8
         7YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055370; x=1761660170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olee1rr9nLhphfZIFxDNoMLGLJzNwbgY6TM9tcztPYA=;
        b=bzJzhWnoa7Rm8a9Yc78KDcemy6FfGOdHoCX+LnnkMA4P+KgoZnEYMHX+Ph0CsSOHQx
         9afKH9maRR/zRzTYi3nyYOQPPL/KO2DCINOWUXoEIuRcZP63nhC1r9ZFuqkdo8Dz2+MH
         R9LZBU0/P2cN9afpJTI4czVC95Jix4ImbpSzzI5BUldXqLO5bsUkIC+w/kPLZYCSBa7b
         cetvNs+wfC5wtnBYQ1nipF5dZNH3pztvmQGbYVZIbtAJEMqClX6jmfy6PdnHOT64fYoe
         GSoAdEnTBLVpcXLTTf/5+FNcuLdKBffZWUnyxFVZq/lI+ctTGyfzOxJwVPd2zcHw3rVS
         ZAhg==
X-Forwarded-Encrypted: i=1; AJvYcCWWC+XMwkaToFMtFUCHWNsjYJPx63eKNfLRKeuH/13KFfR1H/KrrDm1YHsMEBxKVa7Q32r5nfIGlJLp@vger.kernel.org
X-Gm-Message-State: AOJu0YwiABg8z1NYh9s21U02wtXWJ2sF4z7Ys/dc1STb5EAT2mnNKLeT
	aUV9rgRjd2ZoPpodF5jMdJ1wkOW1dbtA5e6gKiClr+qx9IaHF40pLqJGmsckyNhilY+zOG3lVxN
	dB1pRvX9gqsztwXmyJQ9fx9n7PIoaNWSCCwGybqurjA==
X-Gm-Gg: ASbGnctXkjirKL9qq+kiank0nxQbtcpLkUF4Fm827cgRc9eJ7MQvRcGTouGflYUESFz
	i+Bytvh24GwVQNRDZBtRoygxmHIcswyPZ4fXKm2vbce+mo/VLooJ73yc32dc/C41IqBpduoLfZC
	7nFiLLB5blnUSYYCprT3aU4Quu15xa1t4OvYY/NumZB8AmuWPZ70uZ76pLHAmd6OAjnbCV1SjBi
	COTL2CmLfy/pPl650fSndFo6/vGbZNdo4WLOZpoD0Ps/cfj8TcNjKCBoKAAplDnqZOWyf9GXQtm
	zn2WGRkHSFe+usoNMxsRp/KpUk135d/1ovQjCA==
X-Google-Smtp-Source: AGHT+IFewnoDUUuQMPn380MpZIQ5EUIM65WgPCeHb7zg5fIb+1IVMdwP1nt9v2GuI358+5/Q2YgeRh0HlDcM36QCm+4=
X-Received: by 2002:a05:6512:3e26:b0:58a:fb2f:4183 with SMTP id
 2adb3069b0e04-591d853547amr4735531e87.27.1761055369735; Tue, 21 Oct 2025
 07:02:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
 <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
 <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com> <ibdmghl5dg3oda2j5ejp35ydky4xkazewhdvskm7p32vstdegr@36pj32b6dt44>
In-Reply-To: <ibdmghl5dg3oda2j5ejp35ydky4xkazewhdvskm7p32vstdegr@36pj32b6dt44>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 16:02:37 +0200
X-Gm-Features: AS18NWDZ-39d1AWC8agc3FHYO9nz9oO2X5fy-6ifkN2xtLGPNmY9-qcvZ1gXQ8w
Message-ID: <CAMRc=MdmPOHJ2SiO_A4zya3uZH+0VjC=EQKxc7wY3vk56kgMbQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 2:53=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Tue, Oct 21, 2025 at 02:22:46PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 21, 2025 at 2:20=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > >
> > > > And with the implementation this series proposes it would mean that
> > > > the perst signal will go high after the first endpoint pwrctl drive=
r
> > > > sets it to high and only go down once the last driver sets it to lo=
w.
> > > > The only thing I'm not sure about is the synchronization between th=
e
> > > > endpoints - how do we wait for all of them to be powered-up before
> > > > calling the last gpiod_set_value()?
> > > >
> > >
> > > That will be handled by the pwrctrl core. Not today, but in the comin=
g days.
> > >
> >
> > But is this the right approach or are you doing it this way *because*
> > there's no support for enable-counted GPIOs as of yet?
> >
>
> This is the right approach since as of today, pwrctrl core scans the bus,=
 tries
> to probe the pwrctrl driver (if one exists for the device to be scanned),=
 powers
> it ON, and deasserts the PERST#. If the device is a PCI bridge/switch, th=
en the
> devices underneath the downstream bus will only be powered ON after the f=
urther
> rescan of the downstream bus. But the pwrctrl drivers for those devices m=
ight
> get loaded at any time (even after the bus rescan).
>
> This causes several issues with the PCI core as this behavior sort of emu=
lates
> the PCI hot-plug (devices showing up at random times after bus scan). If =
the
> upstream PCI bridge/switch is not hot-plug capable, then the devices that=
 were
> showing up later will fail to enumerate due to lack of resources. The fai=
lure
> is due to PCI core limiting the resources for non hot-plug PCI bridges as=
 it
> doesn't expect the devices to show up later in the downstream port.
>
> One way to fix this issue is by making sure all the pwrctrl capable devic=
es
> underneath a PCI bridge getting probed, powered ON, and finally deasserti=
ng the
> PERST# for each one of them. If the PERST# happens to be shared, it will =
be
> deasserted once at the last. And this order has to be ensured by the pwrc=
trl
> core irrespective of the shared PERST#.
>

Ok, makes sense. In that case this series probably doesn't affect your
work or PCI in general.

Bartosz

