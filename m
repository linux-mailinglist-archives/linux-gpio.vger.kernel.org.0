Return-Path: <linux-gpio+bounces-26854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D649CBC0848
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 09:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C4104E49A6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 07:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CE7255F31;
	Tue,  7 Oct 2025 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U4ZEzLNx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8692288EE
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759823413; cv=none; b=ZJGZZYhl6FgBgwD+rYo/AiGMwiNPNZ44vw0LlOsTdNe0E8KRsMEu+z0+lIIFs6Bx+ouzgrV3c4vQ54DCqzv5tuw537NB7ZnnCU1E6v1LyKVzJILFOKe9wmFxjGeT35VXaqu6xnNDDjgF/yfBgeiOT5pSBTPApWG797DwhhXZxIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759823413; c=relaxed/simple;
	bh=a2Ge5Lhi4YcoqF14Ybp8SwpB/Wf87PchuFaUeETOnqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ynjm1o3nGL5x8OrmCy6Vrh5KVqyD4OqCiRolUKyYQSoYBX6HK2SD1uWBAZARQJa+CLkAK3XJP7N2/985/c5KevimsUy4HByTEPEeVlv+zER9+bLx2dlM7xQH8BhqjfZqcl9MTtNdndG2R4F9cUvEi6x80lgZFDpBBxL122JctJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U4ZEzLNx; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so7032965e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759823410; x=1760428210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09w9lHrEEbOO/PmdN1FWlSfVU4b3SlEK2hQlHNLV0MA=;
        b=U4ZEzLNxMioFmDOe9MNYCYAQG6zLptbxlKKFLt0nBzG4Rjcr7JRQ4dATONEGEstHFU
         oglte4ZKjDxg1gg52kCUhgSxCserMddc+P5rae/SJkjMzJN4k4m/+F9Yr2ScepfX+kAY
         cCH7WqRtVZQ4/yq+FOWnUS21/3nOWX+zwU8VbdR9oL6gLVgFjtS+BbQtwmdBkCIk3qSD
         /ceYKTs/p2u61bPfBPV66p/TqHvFCboZ6VXZoHSEbSq0jgZaX8/ecauekSnDtYSTdKwS
         kHr4+3wyj9Yoq2DuiC8QtQd5logmrfyLOarAkZYfyajQh23Ga6fp53e5ME0qrF0XXAVW
         1Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759823410; x=1760428210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09w9lHrEEbOO/PmdN1FWlSfVU4b3SlEK2hQlHNLV0MA=;
        b=PGR79nyPo5aJ71be42KEZKAHnntSEKZDnYgM6O5WRQAKHehqgpNCgVIjz6u59Ay1ug
         Il9RrHLRrXSNyAUyUROQ+svgDluu0rv9HL5jHauif7uZUUPCRxS+YQs/o7JNUp9r3SzX
         RXbtjz3eKbJaGWrHgy4t/sMOU0rQrQEjDEqRme38lGhAFLA5vCxPzLRje8pdavQSF9wV
         XY6LvFNNKq9C5bI20GDWM1jnofRnuVSOcT1XZgUCmsIV2Ax5HM0yBPoZxVwDPMaA5AAR
         pdl9sv6HeIXxZELaP6XsL1+VKrGZzTGUM92QS/N8CbPQkUBNc/r5ClcZsxe0UtKIf/Sk
         U81Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUAMr8PA/own7jx1iJ6udxC9wuOWOgOFuIU2lE7bLHc61D0GieajK5xqTqymuf1oKz3T34PGy2NOmK@vger.kernel.org
X-Gm-Message-State: AOJu0YyLnlJwYCtT/pv77slxkfCwq9Y4Y2S35sO0y2QhA9TqZjhmSgE5
	SGkjjSFA5N2UCQ3qNpyjx+A2rHUtNn5R1Aaj3TL6/GIt5FExqENMQCSR+04c9F2FT7P9J7Kp3i+
	b8Nuq6iqQvZVmaUxoHJ7/Nvsrp55q8iT3KWf6r5ZmOQ==
X-Gm-Gg: ASbGncvb2ChuKNMBtNzsd+uyi0KBUL+XVQp7R4DPVX/HqDgJZzFuIsmEjOc3VIX3hsO
	0K25rCmDeeJnXgXfcUIhSD+LMb4GUo1nEz3/qdYbHCCE3UwlvWVdVsEgdRX8r+14KD662YXsOkS
	mXI8Fqnc27U4/yxjFJMzT774CGwGRlQF/cGiV0FIEdvSgzpdl06rGWyF3of8zuHPYmXqcBkkmzh
	WZnRTRQ87qVJrt1gG5sFTs8VXrbeJzE23xIRZcSmkBEx/iOD6/6+dr7ihm2cXY=
X-Google-Smtp-Source: AGHT+IG1iwnLS+Xz6hSGduCNv+VOXrS0Gbd6FPZubNKIBwDOzy3rzHZKHe4qtSL3OM33jVl3ZvQhoSCG64+6cignEoQ=
X-Received: by 2002:a2e:b888:0:b0:36c:7a86:1a96 with SMTP id
 38308e7fff4ca-374c37956d3mr39282561fa.24.1759823408293; Tue, 07 Oct 2025
 00:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002215759.1836706-1-markus.probst@posteo.de>
 <CAMRc=Me3VLbmRksbrHmOdw8NxN7sxXjeuNFb9=6DzE=uLn0oAA@mail.gmail.com>
 <7f4057f25594ac3b50993a739af76b7b1430ee6a.camel@posteo.de>
 <CAMRc=McioBjF3WCBu0ezzuL+JJTiEpF2fz1YpbToRpijpHfAEg@mail.gmail.com> <64dd0bab-6036-4e06-aff5-b0f86a167ada@kernel.org>
In-Reply-To: <64dd0bab-6036-4e06-aff5-b0f86a167ada@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 09:49:56 +0200
X-Gm-Features: AS18NWD5EqN4rrNs8G973j5WQFuPIUrgbs26tgW5OlAv2yasQW7dQIDGVk6UKTA
Message-ID: <CAMRc=Medke+Dr7ti6OpMW6j=RDU0AO19pJUmPa_cvSXyW16OPw@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: make it possible to reference gpios probed in
 acpi in device tree
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Markus Probst <markus.probst@posteo.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 3:14=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/10/2025 17:51, Bartosz Golaszewski wrote:
> > On Fri, Oct 3, 2025 at 10:40=E2=80=AFAM Markus Probst <markus.probst@po=
steo.de> wrote:
> >>
> >> On Fri, 2025-10-03 at 10:03 +0200, Bartosz Golaszewski wrote:
> >>> On Thu, Oct 2, 2025 at 11:58=E2=80=AFPM Markus Probst
> >>> <markus.probst@posteo.de> wrote:
> >>>>
> >>>> sometimes it is necessary to use both acpi and device tree to
> >>>> declare
> >>>
> >>> This is a rather controversial change so "sometimes" is not
> >>> convincing
> >>> me. I would like to see a user of this added in upstream to consider
> >>> it.
> >>>
> >>>> devices. Not every gpio device driver which has an acpi_match_table
> >>>> has
> >>>> an of_match table (e.g. amd-pinctrl). Furthermore gpio is an device
> >>>> which
> >>>
> >>> What is the use-case here because I'm unable to wrap my head around
> >>> it? Referencing devices described in ACPI from DT? How would the
> >>> associated DT source look like?
> >> In my specific usecase for the Synology DS923+, there are gpios for
> >> powering the usb vbus on (powered down by default), also for powering
> >> on sata disks. An example for a regulator defined in DT using a gpio i=
n
> >> ACPI (in this case controlling the power of on of the usb ports):
> >>
> >>         gpio: gpio-controller@fed81500 {
> >>                 acpi-path =3D "\\_SB_.GPIO";
> >>                 #gpio-cells =3D <2>;
> >>         };
> >>
> >>         vbus1_regulator: fixedregulator@0 {
> >>                 compatible =3D "regulator-fixed";
> >>                 regulator-name =3D "vbus1_regulator";
> >>                 regulator-min-microvolt =3D <5000000>;
> >>                 regulator-max-microvolt =3D <5000000>;
> >>                 gpio =3D <&gpio 0x2a 0x01>;
> >>         };
> >>
> >> - Markus Probst
> >>>
> >
> > Krzysztof: Could you please look at this and chime in? Does this make a=
ny sense?
>
>
> There is no such property as acpi-path and I don't see here any ABI
> being documented. Nothing in dtschema, either. Nothing in DT spec. I
> also did not receive this patch. Actually - nothing from
> markus.probst@posteo.de in mail mailbox.
>
> So no clue what is this about, but if you want to use undocumented
> property then obviously no.
>

I interpret this as a vague proposal of adding a way of referencing
ACPI nodes from DT source and this is my question: does this make any
sense? It doesn't to me at first glance but we do sometimes describe
firmware details in DT so I figured I'd ask you.

It seems like Markus found a different solution in the end so it may
not even be important anymore.

Bartosz

