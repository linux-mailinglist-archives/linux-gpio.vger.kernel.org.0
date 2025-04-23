Return-Path: <linux-gpio+bounces-19164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41375A97E44
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAEB43B8232
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 05:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC571F180E;
	Wed, 23 Apr 2025 05:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYn7yzSi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162FEAFA
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 05:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745387309; cv=none; b=BDZE29CfqzaLsmZ/bSqpP1/JKcYr7SeomjtrBUswAqo7VtmMyaEkzIjcON4pISKgA1guzwmoUHwKWTnDzkjr45pS/Fiqx9amYhHyzl9Wyei5XjO+jIBklVTjwC6bGHgJ/efxcmkW4gZRGxaFo4Ndlilutn2Taz0P8r4hrMzgWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745387309; c=relaxed/simple;
	bh=svRqaXMdHgJNcxfyOHvsV0SYrw6yQiCU3KXVNselAO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGDWUkaLb3AAL81HZeoXowUDgQ5FqZPJm2kaKQ7pKCmvg3a10Y5wleM9ZhRecmoUibr+5q3XFnoTZ7z5uhxjwoFT3SNuckzD57tZfN2HMYC4RYC2NHFR/cVU3q9PCnE4didmA5q165ooovSY0OXhY+roDVvCuiBq4VWpyUhRlks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYn7yzSi; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acbb48bad09so412847866b.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 22:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745387305; x=1745992105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdysCyN2gfzBG5U5ot8xWeaujVBjzIg5RINC7O12MAM=;
        b=fYn7yzSiY0cJpJMFRiG7354b+MLTtpS+OjEWIs9fu1rxzX13c2PsOV5GiU7rCNk9MR
         Rbw3J7o/D9LZdsNP6cnzNna3dyUOTPd+rLddIqna20VU3Xf/iGfTKGhzaH9ZZAqxJMx+
         M+byTxCZoET3ECSEbFFEWe3EusVx/8d5ECjKAj7r9+KEXGfYaAuFK9elPUWEawmYkI7k
         a5L8i0liOwxGgqFQnQJtE68M2KSEXdSLIYMZuGVJXBX/IwCg75860bU+yifeRDllcpK3
         911z7WT53PESWpuJhjNddps4JAD4HxEAspp5Z2cLmwDtSFt/O4gwp0iwOBpfQbKMhk+2
         T9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745387305; x=1745992105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdysCyN2gfzBG5U5ot8xWeaujVBjzIg5RINC7O12MAM=;
        b=uyneJ8iJAFzC5BE+/IV3BKaXYnP/gvT5dIs+AhvVacUFJcb9iBnd8UL+pyDthPCaJ7
         yEajL+bCmxcomUcvU9R7Cg7AzaTujyR9TADpeDrafrbbNWQGBUNdZfsPOCi+V4/kswMm
         5QxPFi1SjSWfWEMaI9eFNeNvm52Qn5zPQ5WEBN2YXsZG4BXYbEe4muzu1nbz38CvJ4uz
         FZ8pL06pHe96vyPBsCbKC2aBUzY8SfHo1j7oEKPvDGJ0vu6fxgqc64mVSup1DEt6R8Iw
         iXqWHQah5DU2BsV5ZFo6f0M9ZPdNdNBPFORI3/17BMW6TZ2clccxUPZ0Lhyh8m5dvGEl
         05RA==
X-Gm-Message-State: AOJu0YxpRfmdJGLo6O0vmmUcBFg5Jgz0RwUosaElREPGH2O0qVFEujmF
	VCGCK7ZGAb8OWhiI8uPtCDMIKhrPneiF+24nJJVwp1ZWHzofITy/Jj/+y3FJNdM67V/HMIqmOm+
	xlqDKDyWNbP2sIDRo9YalX495uNRbE7Gb
X-Gm-Gg: ASbGncvvbe8eRW7W3H8xqY4jaCedqZEq2X9sowQy8p1hWHgJER6SSh17dC818XlNYHp
	T+NZnPYdPaZc+pB1fexvlnhbnRO9uXBSK5fmI06a/kRnumzDFF45wgxBD14U9wkiqrIiRs3iL2n
	1Q5HfqVGAJ9j6jQST/6gSlFQ==
X-Google-Smtp-Source: AGHT+IG2OwPZK9W66k6Ksampsgx7SHSlUtLIsxBq84Vf6iT4J3U1Xu5C41+bu1krH5SQqKFPApJ65rbZtuBDOdX0Zms=
X-Received: by 2002:a17:907:9622:b0:ac6:fe8c:e7bb with SMTP id
 a640c23a62f3a-acb74dd6016mr1520904566b.55.1745387304624; Tue, 22 Apr 2025
 22:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHp75Vcgk4QBrt3AskmbFviQmNQ8w2HQRZG0jz2U5DKui6v4VA@mail.gmail.com>
 <DM4PR84MB18295F44324CD9AD83F5810787BB2@DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM>
 <CAHp75VeVQruB7m1WiXTfTEt4ggG9KNLRH3oJ_O9y5A+h=hh+8A@mail.gmail.com>
In-Reply-To: <CAHp75VeVQruB7m1WiXTfTEt4ggG9KNLRH3oJ_O9y5A+h=hh+8A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 08:47:47 +0300
X-Gm-Features: ATxdqUFDrIJdp0nqUBGyvde1Z_vBS23z5Vz3Dxwf0HER6KID1nLrZrRmBKTfB60
Message-ID: <CAHp75VfUf0LsrMfrcty+hp0RXmPJkS16E_V1o7OS-mXXa5fq9w@mail.gmail.com>
Subject: Re: UV platforms to test
To: "Ernst, Justin" <justin.ernst@hpe.com>, 
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 7:29=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Apr 23, 2025 at 2:29=E2=80=AFAM Ernst, Justin <justin.ernst@hpe.c=
om> wrote:
>
> > > I found your email in MAINTAINERS for one of the UV platform related
> > > files. I'm wondering if you happened to have a Skylake (?) based
> > > platform that uses the
> > > https://elixir.bootlin.com/linux/v6.14.3/source/arch/x86/platform/uv/=
uv_n
> > > mi.c .
> > >
> > > I would like to clean that file up, but I want to have somebody with =
a
> > > real HW to be able to test.
> >
> > I would be more than happy to test your changes on some UV hardware her=
e in the lab.
> > We do have a few Skylake/Cascadelake (UV4) systems available for testin=
g.
> >
> > > For curiosity, this file pokes pin control registers without the
> > > driver. I have several questions as well to make the better approach
> > > on how to clean that up.
> >
> > I will do my best to answer your questions. If I can't, I will pull in =
the real experts from my team so we can both learn something new.
>
> Cool! This is what I need for the starter, output of:
> 1) `lspci -nk -vv`
> 2)  `dmesg` (just after the boot to the point of the shell appearing)
> when kernel has this in the command line 'ignore_loglevel
> initcall_debug'
> 3) `grep -H 15 /sys/bus/acpi/devices/*/status`
> 4) `lsmod`
>
> P.S. Note, this message also appeared in the mailing list, so can you
> share it either with a private email to my working address or via any
> file sharing site?

Just to be sure of the right platform, I need the one that is called
'hubless' whatever it means.

--=20
With Best Regards,
Andy Shevchenko

