Return-Path: <linux-gpio+bounces-11411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3109A04A3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 10:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC628284179
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 08:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECDC203706;
	Wed, 16 Oct 2024 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tiVXyeAP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF860202F63
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729068612; cv=none; b=BaGz1qSWhlENhj1lA6OxH7mjs8fd6YFTaNLn1Pbg02/G7RQ3qlBkIWrcpFeSGmn4b4ApoycvdQRQCogJZJmXdQ08exsUo8UUWIcyArIWZIjfakhJHeUEHC6Gm2c3DNUSSxlOVK4jdmpjTJXhLNel3NlNq8ekCogIZtb1OI7D58c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729068612; c=relaxed/simple;
	bh=SSNtqI19Ix5dJnzq/kmUvVtWl6nPxr3rdj5kO+a8p4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6jyFg8n3hNHaKw63dEcN6E399xJACmSfCm3jnSdO3CjTdb/ZjBmBHDVakZcow2NQAQlLz8mcZ8EHg/tefPhPh3sPA+T1P4cIjxXKBc46gDzdJvYQYnrtxP+fEndfogTr5aiZdUgtgnR70lSkDufMI5yKpqLV6Gsxuo13BAgILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tiVXyeAP; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb501492ccso27320351fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729068609; x=1729673409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTHy7ZDbsCwc3Rwh/gc0hNNHYgQLYxLOtwNyWn8pTls=;
        b=tiVXyeAP3LhdAB67yyJP+OFozmi/iR/4IUjfAXepyHhUutYlOiaxvZCFwjGHkFy36D
         LDw96zK7xrGMLsOuhTkfex0t7kL+78R8LAIDHeGet5GMUZ01aTjIrrkl0CVkaRP9CB3R
         W7SrE8AXQiOXtOGjGrhTVkq6mBz41V8pdUS5VUdGH/nONnYRO1yb+EW5fGVdL79sb9D2
         bnfVNXHszsKL9rF5fCVoHbehP7KiZ6FcVIlxGt/MKImniMaOa9k8JfgMO2sYu6k/hAHA
         W6pJGLNCPb4kl0kxvWYzhGt7AzPCZR4OSEC2QS3jo0ColRsalmtoK3ZdjaIsteZRCQHr
         bn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729068609; x=1729673409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTHy7ZDbsCwc3Rwh/gc0hNNHYgQLYxLOtwNyWn8pTls=;
        b=gzO/cvHyu5gvmQeyf395mv+KiPdTB4mkJB8CtacKp75Qcv4Q61YKnblnQ8NKqKUwuZ
         GCiiI/Luy1oxmentVrw85tgNvfr5xNFPKyj+MbTskj7oW5FPslepJq81KhR4rCRQRVW8
         MVLVfqviYFgmUCXFUPVi3HUlRBsOhKNzk41biSE2vMEWe87VrCzz8bnfd4DBOu6pj8/8
         06HMFxaYc9XMhd7CeSHJpNAi2Tdz6ZbQX8jTq7Hc80PGy7wINCnUDOqehDmDIgrOHvLI
         zwzVrvwGpD8MV53iYNkOfJmEgToddj29kLFol+oYW5Te+waqj7v5rbVftYiA8YUsM3Yl
         jcCw==
X-Forwarded-Encrypted: i=1; AJvYcCV04BIKtkFlgF03hpqvaoDTt6iUNOu6qeHHvUCMsn08h1Fl2yh7orggBZPIP03JtD4Nkq97xLDn+L/u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy028pwMlkDng7Exv1+ZaEdlsSt5yENCUn2NoPA+JKfkd3BmqZV
	c56EpF4ocRjUSxVPSAnCzm7qZJDufWyuQ861kn5cZjpauzqiMyXRotDrcgdeuPV7bjRg1GiokFH
	GoOunGRmXHdfOhBnvadZ6cHeXmtIgLwnJM6rr9w==
X-Google-Smtp-Source: AGHT+IEbQzQ/yTsGQ4GHNLA1EO2nUXCZKHQRa+D6Wk5tkRCZ+MwMWjEgmleMixzWXTew9zglqing0oCgSmp2JviyqLo=
X-Received: by 2002:a05:651c:b25:b0:2fb:5740:9f9a with SMTP id
 38308e7fff4ca-2fb5740a18dmr47476101fa.29.1729068608805; Wed, 16 Oct 2024
 01:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
 <2024101531-lazy-recollect-6cbe@gregkh> <CAMRc=Mea=W-1UoHMew3Si=baW3ayERrHjxjG0NPdmkCfp9dUHw@mail.gmail.com>
 <2024101535-wrangle-reoccupy-5ece@gregkh> <CAMRc=MdsXggB9TUK-Rxt1GLZ9OA+3FskD1q3BM8TGbOhqmhXjg@mail.gmail.com>
 <2024101611-extruding-overstock-4626@gregkh>
In-Reply-To: <2024101611-extruding-overstock-4626@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Oct 2024 10:49:57 +0200
Message-ID: <CAMRc=MeLkwRhgdtmmjxiJFvHZNCS55FR=hY3Qc0Gsb_nA725SQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: create the /sys/class/gpio mount point with
 GPIO_SYSFS disabled
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 9:02=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> >
> > The existence of the sysfs API in the kernel makes us stick to some
> > sub-optimal design decisions (like the global GPIO numberspace) that
> > we'll be able to entirely remove once sysfs is gone. We want people to
> > use the GPIO character device and if it takes a layer emulating the
> > old API on top of it to make them switch then it's still better than
> > keeping the API in the kernel.
>
> How are you going to emulate the "global numberspace" in usersapce if
> the kernel isn't exposing that?  Why can't you just do it in the same
> way that you would in userspace here?
>

In the new kernel API, users don't care about the GPIO numbers. Even
the GPIO drivers only care about hardware offsets within the chip they
control. But we still use the numbers for the sake of the sysfs
interface, users of the legacy in-kernel API and some really old
drivers that used to set a hard-coded base GPIO number. For most part
the dynamic base assignment algorithm can be simply moved to
user-space. For those few instances where the base needs to be a
specific value, the FUSE program will take an argument allowing to
specify it.

> Again, the issue is "do not remove apis that userspace relies on".
> That's all.  I'm going to add another one called "do not mount any
> filesystem at /sys/devices/class/ as that is insane" as well :)
>

I know you're not being 100% serious but I think it's worth mentioning
that the mounting is not done from the kernel. You can't really impose
the second one on user-space.

If user-space decides to go "mount -t configfs none
/sys/bus/platform/devices/" or "mount -t devtmpfs none /proc", then
AFAIK there's nothing you can do to stop it.

Bart

