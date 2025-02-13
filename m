Return-Path: <linux-gpio+bounces-15896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E27A339B8
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 09:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E63B3160C0E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 08:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806EE20B7EB;
	Thu, 13 Feb 2025 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nBCPXnm+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B362920B20B
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434327; cv=none; b=aVNvYgjs0lQ0jntEeS2rrMCVyBDjklmdmi7Ei1wZDkxsCNnXlPY/ZzpQ5HE6vAQkt7CvclxpqGiZo6g7qPNCj/cCI73YVjlDf9HtLOi2t5WSEFrscOamCn2G9jD/tdYBvG1EtmM7zaVUMIDjk9zzdvtqe0CoqubiyyJRK2qFY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434327; c=relaxed/simple;
	bh=+dFfwgX0CbcC8ID7JA7WN/WcTf8Op76swd4beDyWCTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtDFV/IrDIL2+yecFJqaGA5r0MviYFhW0/EXRZjTtyhM5A59j8Z2t/a7zuCf5lYc6wifBWIZc6p0ZnVY0oQxku84kbVdTruzV5My+RJKupFKRA3NXn+QQXhbSH41ceHi/MMZbEzmLxYH40RLOlfB+rqvTilGBDub9g0odSp+99M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nBCPXnm+; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54509f46614so570402e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 00:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739434324; x=1740039124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dFfwgX0CbcC8ID7JA7WN/WcTf8Op76swd4beDyWCTM=;
        b=nBCPXnm+aVWW4XKLBxHOvFNzjuOi8ievurtGudwsFEqg+kqElVsHxMnS5iRv9O6uzh
         TvnuvnOUT3ZsWkiM0A11FzmDLHTC1wHN3oOfx57TtrVZJ3Jk7uGhzjS0d67oqtRrWgaI
         M46jE0rOM/3f8o2/WfNs5XsZ838rLPK3vKmnknhdLCAjPyoKnTmc/TFwJwl9/KSdXyif
         q6Dc2Ov4Qm33ng8eLoALbCNxi4jsiXbib5gLdQu5fsm1F3HNwoAjl/Ruo29N3XFLBI7/
         UJxB3bBClYQlh8JxVtnfAMB6bOXiheT1YG3JPyFIAO9/bdZezgO+7RsUujAEacJCmRdM
         z+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434324; x=1740039124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dFfwgX0CbcC8ID7JA7WN/WcTf8Op76swd4beDyWCTM=;
        b=QxmB1dr036H3qXIrhPX+x6BvHlX5/mcTB0mHNY0hbKErvNI3e+zI1xPqA3cl5PT2vE
         qJbZzODgkCGFFfkMSwqeGK4c3XN5S0cl6UwyomSTn0UpwuLSxWXYs++pHQk00HWN3lLt
         iGPWX+lDLNF+PGwLcn0uFqcPLmmpHsCPR0iNlExbtQi2hY+XyudnKilvF+zdbyHr2F7l
         MuxeGbOqc+qre7qJIFbQJN2NJiEkBH+EzmxZPNwZfgxerVyq7RLopF8GXwvASy5B8off
         23GSuXw5BAVvhRYacHHhN/20dHIfvTtQeaXVKOCbsVripkjvB33oU/VQZYeq9Wg6jETr
         t1kg==
X-Forwarded-Encrypted: i=1; AJvYcCUGchSvWyRDs/X/omJvb5GqPAS0kT0cBg+qTgibivJPddT5k1eAolVB/IagTfEwfk67IFpS/PAVcfEJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzSdivWEFQznXeVBh7Rc0Dl7AnoLyEVriLhLIQh0oeYox9xmG7H
	2LnCx1Af0o5QWUOCsv9R0foSJhOckrKhOxY8MEsXNzdfVH39lUlLzJ/eHwrv14dLN72EwZrB/Pf
	IQGBZYicVNL1vlprScFLj+5nEXXAgqS1hKuvlNw==
X-Gm-Gg: ASbGnct7F/t25wmFOk5aQDhyWsQ/4Xh8vg9LNXN9gICC+f112liZv9QUe9V48WP5d7w
	lMDZGXbHflfU46pRU4he2UuaZEFGu/Aq00R4c5rPFiAuHMGI5IcSHM4JFjo16QlQQODy1fndL6W
	MCV0jYKH/ACavvOVSYXaJemCo4rnDM
X-Google-Smtp-Source: AGHT+IEIAFhRMajhJpOtMGjvIxm2QdCbWm4QaFxeLh+n1Rj6FPuiVieLB9SVYIYG1UUPR2y+YCRUUAl/3rRdA4PZnvQ=
X-Received: by 2002:a05:6512:159d:b0:545:ee3:f3c7 with SMTP id
 2adb3069b0e04-54518116604mr2088771e87.30.1739434323801; Thu, 13 Feb 2025
 00:12:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113225530.124213-1-s-ramamoorthy@ti.com> <CAMRc=Meqjy+cqfueM_dQE8uP32zS0ib41qE+OPPWFkhoVTGc2w@mail.gmail.com>
 <065cdaca-cc37-4b1e-9c1e-e2dedbb2ffd5@ti.com>
In-Reply-To: <065cdaca-cc37-4b1e-9c1e-e2dedbb2ffd5@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Feb 2025 09:11:52 +0100
X-Gm-Features: AWEUYZkbTb8bENEVnsn2E-MYQzjbnZkeB4d8wppWNtFqHw8XqmJeTxrvnmw4bYw
Message-ID: <CAMRc=MfR2q8TTcEHtbX9HxyFikHP_nS+Mva3dTwmgu4tvkxJ1w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add TI TPS65215 PMIC GPIO Support
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com, 
	christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 10:12=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@t=
i.com> wrote:
>
> Hi,
>
>
> On 2/7/25 2:53 AM, Bartosz Golaszewski wrote:
> > On Mon, Jan 13, 2025 at 11:55=E2=80=AFPM Shree Ramamoorthy <s-ramamoort=
hy@ti.com> wrote:
> >> TPS65215 is a Power Management Integrated Circuit (PMIC) that has
> >> significant register map overlap with TPS65219. The series introduces
> >> TPS65215 and restructures the existing driver to support multiple devi=
ces.
> >>
> >> This follow-up series is dependent on:
> >> Commit f84464ec8190 ("regulator: dt-bindings: Add TI TPS65215 PMIC bin=
dings")
> >> Commit 8206c20f4c82 ("mfd: tps65215: Add support for TI TPS65215 PMIC"=
)
> >> Commit 0e0b7f00c111 ("mfd: tps65215: Remove regmap_read check")
> >>
> > Did these go into v6.14?
> >
> > Bart
>
> The dependencies listed in the cover letter were just applied by Lee Jone=
s:
> https://lore.kernel.org/all/173928615760.2233464.12306998726512431222.b4-=
ty@kernel.org/
>
> The rest of this series still applies without a need for code modificatio=
ns.
>

I'm not sure I'm following: should this series wait until v6.15-rc1 is
tagged? Or did you ask Lee to create an immutable branch? Or doesn't
this series depend on the MFD changes at all after all?

Bart

