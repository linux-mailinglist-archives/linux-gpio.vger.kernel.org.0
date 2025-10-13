Return-Path: <linux-gpio+bounces-27044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB59BD52DB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 18:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BBFC542973
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 15:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B8631B83A;
	Mon, 13 Oct 2025 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GDaYUERq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C0131077A
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369794; cv=none; b=q/Lv/9Nyifk4ucsS0wlwXtj731D9EFt+pfYE/wvFN16aHvf8wZAcNfYBZ43FWmtkjauzF14OGUufbb2Sya9GwQAQLxzKOsNp0Zs+bceeNOgHNqcsTYYrFkvubMbP18Gm+ubM4qjqeBe26uUCy+3fX/0LfWKCwhZnfp1YollaFp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369794; c=relaxed/simple;
	bh=/34SsKoG/6bV6uURhJVsCgg19owKXxRxZ52oO599XOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVciDuRgmhH6n7st/b73MFUtlJfM9NEDVX8zBxdwLkuQP1mBjU+3hU02ko8Lla9MSq2HNd7/TllKNrCcfoGasWLKG7zK75gc1Qf61PKcuD57X2yNv2oTsARJpxFx8yhjVtOEs1S4NBD9oHizs8b+OSKAPSin8mxBrStw7+GGgTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GDaYUERq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57ea78e0618so5057178e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760369790; x=1760974590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/34SsKoG/6bV6uURhJVsCgg19owKXxRxZ52oO599XOg=;
        b=GDaYUERqhTJsoo4Ny3AxmRP/2U7G4PGBTR080evERQAJtbaKxyHCL0HeGJrfddJlcg
         40oE+z9M8yDOqdFjQyw9AqjxNof8G7aJuxHO8lykd9u0wXrHy0jHV1kG4tQAbgvLQJna
         uf5coW++OkHCEMcQ1WlR8fBQwdRnedDItWgN9UFnWrVp97AFlXLnsN82JNq1e1lumH6A
         FUHipgFkA2BfC4mbUzPRTg6X+8wfeESrAXnNycNpWJWtP3RVZA/dscP0y+hLhsbqUoJn
         /C1X5ivr7pAKHSg7GD8gKxZs9DwufIhe2WxHmp7thzOa+b5oiH9yWRP2FfvLmWNV3/bw
         uXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369790; x=1760974590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/34SsKoG/6bV6uURhJVsCgg19owKXxRxZ52oO599XOg=;
        b=uJzbaGFojX99Nld01ef2X6GGoWxpCcG8Jtb/OiclSmItxDYAv4lU+OvEP0yPzg8X8W
         PwfFCZwoGVxBWKcC6hNElTT8Y3Ea0g1TCfRL+qjwSSpbEKTAcizm7RVRmDxWo0cde3sd
         girsO4RDb8JoPL4oir1g8f75TToxodyYVbXnVDXjbe7SS/PZrRaBVF2ZDI6DfnQWJAou
         q6nnA9Tl2KMcCxGtmm1YFgzi+5wGWzlv/lScw0rA9N6w6mr65qT9xgL1Pprdt1xN13Ow
         pva26VZZbtrWSzXTOyByFtDr4zr4avVlqw5C/m7bUlFA9SqzIZyq8YnnKrTlBquk+OCj
         luzw==
X-Forwarded-Encrypted: i=1; AJvYcCUvZlWlaflzpBJ1kxxCxLDzQ6jlMR0P+vOMH8EQntPpCnN0DXVo5z0YMZW+csaqxKxLh5Q3VrDXrYlm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx57T0IXdSjtAbMFPmNbZZhFj5pyARWhiVcS1vTPkOjSqhZr/nD
	eVWoEM7gWBifqRCqqtyc+UW9X1ZZwFvR9jmega8YFsMjynQdH51WJgZi9ASAuzyrnH8dJq9lXaS
	9NaRtrPpw9xWMsSatWZ4/MZH2D5LRGjS83ATfZf2WyA==
X-Gm-Gg: ASbGncunKmBpQ9MublHJp/kAzcni98EposbXfBy8rGtj/yShQ9YwhxkOApfZDTIAfzZ
	3CYewUKi42PBAiV5ORKt2k/fB2dd5A+5k2aBo1gQeDvTSfvvQctAVZlG4VRyE8YAaBjC2wRbOye
	0p94YcvA1Jg8jCHxoLgQosf8/k9JtICfheiTt76HRNOD2miOE9ORonBgBD8sfxF+CvBATxVLrLS
	TGnZeqc/YlZmDviIY8g5GwQ8m4SnSIgj6FSDdk1lD6O4kNOQMnGSfArg15mh4Q4QdSu
X-Google-Smtp-Source: AGHT+IEuahRdxwUYdEe3j3t314tqJbvK3NPohmOLxq78et6HAw5OamSBWRf0ocCVmzW08vRS2Q98sONX0xM4QZnYHpA=
X-Received: by 2002:a05:6512:b89:b0:581:9295:1b02 with SMTP id
 2adb3069b0e04-5906dd532a0mr5076544e87.27.1760369790343; Mon, 13 Oct 2025
 08:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com> <20251011122612.4fa7c97a@barney>
 <aOpAO7j0Uyo6FPcu@gmail.com> <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>
 <aOzcasDutRtw6JP9@gmail.com>
In-Reply-To: <aOzcasDutRtw6JP9@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 13 Oct 2025 17:36:17 +0200
X-Gm-Features: AS18NWCS775f_XPZ9bfFwHEq9JFeheP3CufCDeskY7F9RXxobjY-1lCptyshHG0
Message-ID: <CAMRc=MeGbFi10f94GmmAMyLqBWWw7VmPcjaXQWDEtFgS=hvWdQ@mail.gmail.com>
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Bjorn Helgaas <helgaas@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 1:03=E2=80=AFPM Vaibhav Gupta <vaibhavgupta40@gmail=
.com> wrote:
>
> On Mon, Oct 13, 2025 at 11:41:43AM +0200, Bartosz Golaszewski wrote:
> > On Sat, Oct 11, 2025 at 1:32=E2=80=AFPM Vaibhav Gupta <vaibhavgupta40@g=
mail.com> wrote:
> > >
> > >
> > > Hello Michael,
> > >
> > > Ah yes, this macro somehow got overlooked by me. I will send a v2.
> > > Thanks for the review!
> > >
> > > Regards,
> > > Vaibhav
> >
> > While at it: the subject should be: "gpio: bt8xx: ..."
> >
> > Bart
>
> Done in v4.
>
> Vaibhav

No, it was not.

Bartosz

