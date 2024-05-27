Return-Path: <linux-gpio+bounces-6683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 285208D067A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 17:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A893D1F239AA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A0561FDA;
	Mon, 27 May 2024 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w3/wSNXL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8E61FD7
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716824773; cv=none; b=H5WG1PwftiN8Y5oi3VIHApzz53hIy0A1aCKp7ldVcqrg2K1CR2h42Pc+gSx3SK3jhN822H3bhnrQWtGN7tlGA0hMK0yzxuap53+Arc4jQGEoCVu4qaWxiwfQ2H+4C5GE/Y3hgjhh70xPsQqEP7Q4OqPmGZwXTzPdW+x9YDmMnZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716824773; c=relaxed/simple;
	bh=SGFmyrdBpkcUDBKLlJbB8SidCvGsrcV/bdnpnGA3shY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SwyUD23C+acv6AGzmTX0DoyFG2RcL0v3ZUaRHSCv+ijRpnkD/l8SePw/v7ZTbvEGoMZ3EU2lDKxvyPSos/2ILm3EbNbEolUk8IHGXHsyBrUeFklq6vR9CnHDGQQRtOdbp9MqPE1Xuxqx6QTL2zWgEUgxoPG7RCPf3njnmW69qCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w3/wSNXL; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e95a60dfcdso41126301fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716824769; x=1717429569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp6J+k2BS7MrlAaW9IdYoKQ2d/8GzynpT8yYjQ+kbY4=;
        b=w3/wSNXLTP/HD5zfKAb3xYPteRdq3uaVgOQ2ZHjZxsO6laorMqY0PTDDMGWAVorNB3
         KibVYk1XqulxaceoIdo6UmDrR01ex6Bxdp55BXPJq+ZFf8hE/4fkiolvxLryXz/Vt340
         RExgDfio/qx9+A7xxJMV12EPy7q6LbyyZPKshBccjy9cWbiM6JvyFno8K50EkGyEWnO+
         CiVnLH3uhu21+Wz5sXOvLsB2jOM/dRiSW63W1EZSr0auJaEUGhH06/sMhJM4i/dUL73b
         XVpb1gfkpGNklO9ahpw1azoJAplXCkM7J/xMSfGg6naNytTEUQri+nkT1y9LC+pkuy0+
         mu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716824769; x=1717429569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yp6J+k2BS7MrlAaW9IdYoKQ2d/8GzynpT8yYjQ+kbY4=;
        b=JRmasbBTzFEwv0zjq4ldhe/3m+0j+mMLjN1U5xVrL8JdEDMshzDVxjGmoscEe1WCsy
         cWQvlo0z8xdKf5qs3+s8vCW9z5eYwd3sd3pqgFNMy4t5wzvjuYC3SfsZ+u7NHcB6LcVw
         iIpqAoBN7DogTzmPcoP2gABstJASS2kZvsHd7xaAJ2gbMllSKOYeJ1dMtzFvQbnYHRQ6
         r5svmj/72T6A2QvUze4oF83p16NY6u1TaeEM2qWUNyY5QF02gUF9JBH91DFlkOGz4WAq
         6o5cj3VHouyP2x+3sgtNFeOnYVvRgGDd8M2PAHOkJc3QVl/97qubTy8AZKM8R+voO4Lb
         g/hw==
X-Forwarded-Encrypted: i=1; AJvYcCWmDNnpyEohY0IvH0jJsxmdgboUJGIzbKieNjPCHKF1yEqLA93TBXdhcnp7qUXLuBl5OsyiNEpLmo1+TAJCrq7jF/XmHDZrhaTZcA==
X-Gm-Message-State: AOJu0YysG5m4+FA041n10nDu7tRiwI2x9e3ZOtio9wp2W+pgBbvkm1vx
	fJvJSR2gdC0lAX358BALSSfJ311Wxf4xadOvQFjNVP3VX2Zs2AFeSOAL38IIFhcT97smqZmcS9m
	58cWoJbdY/4ct6wx1028GgcSH2ycYCemiaP2vQ/2+i0QAwcsq
X-Google-Smtp-Source: AGHT+IFyIhhVfYqvJUz/29+pKK/OkK1ERKnS7QgghOt+wn5Gqm9SW3abHYuC62rZHikjymQKJkX2TVBbU9ijrdU3P0U=
X-Received: by 2002:a2e:9b0e:0:b0:2e0:c81c:25da with SMTP id
 38308e7fff4ca-2e95b229936mr58475651fa.30.1716824769393; Mon, 27 May 2024
 08:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org> <20240527124420.GA108041@rigel>
 <CAMRc=Md5OF7+BM8gqTbu581cqbWZsWUNCS7T--Hu0Dwq-r5mfw@mail.gmail.com>
 <20240527125732.GA121700@rigel> <20240527132050.GA133150@rigel>
In-Reply-To: <20240527132050.GA133150@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 17:45:57 +0200
Message-ID: <CAMRc=Meai4q0BEvh2GTLVNEBeQqUjjimDuBVF6z1p0mrGKgP+A@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 3:20=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, May 27, 2024 at 08:57:32PM +0800, Kent Gibson wrote:
> > On Mon, May 27, 2024 at 02:51:52PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, May 27, 2024 at 2:44=E2=80=AFPM Kent Gibson <warthog618@gmail=
.com> wrote:
> > > >
> > > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote=
:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > $@ does not break up quoted arguments which is what we want in al=
l cases
> > > > > in the bash test-suite. Use it instead of $*. While at it: preven=
t
> > > > > globbing with double quotes but allow variable expansion.
> > > > >
> > > > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.or=
g>
> > > > > ---
> > > > >  tools/gpio-tools-test.bash | 12 ++++++------
> > > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.b=
ash
> > > > > index abb2f5d..dde26b4 100755
> > > > > --- a/tools/gpio-tools-test.bash
> > > > > +++ b/tools/gpio-tools-test.bash
> > > > > @@ -27,10 +27,10 @@ GPIOSIM_APP_NAME=3D"gpio-tools-test"
> > > > >  MIN_KERNEL_VERSION=3D"5.17.4"
> > > > >  MIN_SHUNIT_VERSION=3D"2.1.8"
> > > > >
> > > > > -# Run the command in $* and fail the test if the command succeed=
s.
> > > > > +# Run the command in $@ and fail the test if the command succeed=
s.
> > > > >  assert_fail() {
> > > > > -     $* || return 0
> > > > > -     fail " '$*': command did not fail as expected"
> > > > > +     "$@" || return 0
> > > > > +     fail " '$@': command did not fail as expected"
> > > > >  }
> > > > >
> > > >
> > > > Ironically, shellcheck doesn't like the '$@' in the fail string[1],=
 so you
> > > > should use $* there.
> > > >
> > > > It also doesn't like looping on find results in patch 4[2], though =
that
> > > > is not related to your change, so leave it and I'll fix it later?
> > > >
> > >
> > > What does it want here? This looks correct to me? Should we do "$(fin=
d...)"?
> > >
> >
> > Refer to the referenced link - it is worried about filenames containing
> > whitespace.
> > Not sure what the best option is here - I am only just looking into it.=
..
> >
>
> How about using this for the cleanup:
>
>                 echo 0 > "$DEVPATH/live"
>                 find "$DEVPATH" -type d -name hog -exec rmdir '{}' '+'
>                 find "$DEVPATH" -type d -name "line*" -exec rmdir '{}' '+=
'
>                 find "$DEVPATH" -type d -name "bank*" -exec rmdir '{}' '+=
'
>                 rmdir "$DEVPATH"
>
> It is a bit less subtle, but that works for me.
>

Looks good and works fine. I'll use it, thanks a lot!

Bart

