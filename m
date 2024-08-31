Return-Path: <linux-gpio+bounces-9490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61198967020
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 09:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FD58B22FE0
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 07:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E20D16E895;
	Sat, 31 Aug 2024 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKQqmesX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEABB763F8;
	Sat, 31 Aug 2024 07:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725089583; cv=none; b=cm/G6bDyUCdRM9xHB4MkWmbSQEq82ZmkOH+NrQRM+vQhbmLdaL7h9IllZ+vng8kax9pDEa35w3aYUCN6yruJvAoOUlwE2nhRwbG7HjnUZ2oQDKdXmM7xwQoRFkDdct/SBopjSmR3jWeG5fIxjlwuZaks/e/lrDl5bJzCpmNQ4R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725089583; c=relaxed/simple;
	bh=zxm9CauPCBMx1BvkUkqUMF4bfO9I0kXjUm67ifmnivw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2kqi3VKPeS95o9F4YXNLuQUuU9MpqZRY4/3XrFATNlhq97/lmnPpttv9ODqfEf+XwSVF6sm33DdRmVlJZDMwl86Us0pYDhESZ5SxT5T8aRrrQRvzpKdMIzBHpa0gmvB2UmIfVqm13XjAPPXyXgFqHmXAJaTVpnbzkloBjk1kOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKQqmesX; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7141d7b270dso2130120b3a.2;
        Sat, 31 Aug 2024 00:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725089581; x=1725694381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxm9CauPCBMx1BvkUkqUMF4bfO9I0kXjUm67ifmnivw=;
        b=aKQqmesXHmoN0URiWdhklFl+kkoF2A9Ef2vcM3MCgjuwQ62aqR6NCiPjXk1uwZldLQ
         DbszwIExyhcgxAg8d4lyZSY0cj5A8LvpPUTk7GpkfK4hacqJ7lNSCqegWc9PDK76EFWU
         smjH1zp14IMozhTC7eQl+GfPOIUyaacUdfTm8Sj/oVTY3dgtLL1jzRLlEMuDrnYwZ1VH
         EKc5u9JOer+b6k/gS+QR0OgUAHuiKajAVRKDxY/l7fFRi/g1tXArY+j92taWvex7G1Li
         ISNxub4BimZWwPEvkvLojNSH796SbI1LegjGHq6jM4Wl+qiUjQ5Bt/tRjETxV8rjihTr
         tq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725089581; x=1725694381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxm9CauPCBMx1BvkUkqUMF4bfO9I0kXjUm67ifmnivw=;
        b=sIb7BcK8rBtTr48eqXJriT/lkL9po5TD5XcmJsel49i5YszF4eqHPpfCNOVejNO7fh
         WI6xCj6iT2IeK6O0qVecj2t/t6XA70q5iZOa7cRbp75J+h/Yq6hiVtitAB6j3QY3WTe+
         7hxDBGB7xTG6YHvsSsDaZM3dpPs1pyedQA1eMo5Vs1wHoLGpr6605jHr3zHybxtM944s
         Ds0KiuUCBQHBHr5AZB8k+g+AHajCDuP7DVqU5XdKrt9wVQkPuoQ+kjZp4SDnRKi53/sS
         zpGGbZrDXFWuIsvkOXHlt3JWWqVMWsUTeJRC7fnesCF1AT/3AunCHEYWzy6EdPZ1Ca/b
         0WfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAXTR9LAaX7mhcRvy0k6jk+VQPk0g+AZOBisr8kG8LTezDJdYckBOV7wcwWTSHZXC4IZ10q0PMOLwIBw==@vger.kernel.org, AJvYcCWsmoLCatzj9dClPJRQQq4C1qZtNmmuInnKMBtCSAEgkKiqRFfayFp2Qe1x9/1deWeFWY/aOOO+uqHS+EEq@vger.kernel.org, AJvYcCXKa/Z0Q5lbTp4Z5TCwuWg206d/vxNktDtcPeNZ4vynpzAMvrF8K2HwEKfOnVrQBkVdPj7uZy82HFSh@vger.kernel.org
X-Gm-Message-State: AOJu0YxKC0UMYW3vzdP/6OpYERvsaW+zp5kaMOUIFs9G/tk9dKeHDbQW
	h8T30PXu9H+kWWtbIkW+zpxbJZrGR3FMp/27PHlhYBvi9BIRYxRkPx5Oyb9g55ElSKa8k0SLG57
	3KVZxOtMbL2XUJYgliCpGvcx6c+Q=
X-Google-Smtp-Source: AGHT+IHFqlQEeNCdxKPFKCkHaDUg3aHyBHy9X5udJa2tIDn+T9v6ccydrIIAFB83PR1xkP/CR85OuxWn8aPlx52ZPxE=
X-Received: by 2002:a05:6a21:9206:b0:1ce:d412:fb96 with SMTP id
 adf61e73a8af0-1ced5e3ea28mr289851637.0.1725089580834; Sat, 31 Aug 2024
 00:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230113205922.2312951-1-andreas@kemnade.info>
 <CAMRc=Mf4-8AfTHLrvaF14tc2TJatxZJWnMOF-1G8HmDhPKSFAw@mail.gmail.com>
 <CAFLxGvyX1Q8qGXkWW+JiyQSfP=1dFzeZ7C4OCJHk2pFGX7zygw@mail.gmail.com> <CACRpkdZY5CROs9EeRSYnOzFvr_Xgnw66ziKqYH2LE=MQe4OWLg@mail.gmail.com>
In-Reply-To: <CACRpkdZY5CROs9EeRSYnOzFvr_Xgnw66ziKqYH2LE=MQe4OWLg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 31 Aug 2024 09:32:48 +0200
Message-ID: <CAFLxGvzBBon3uJ_WyD95UgbT6sORB4mRci6v4PN=5cz34T6xmA@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: use dynamic allocation of base
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, grygorii.strashko@ti.com, 
	ssantosh@kernel.org, khilman@kernel.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus,

On Sat, Aug 31, 2024 at 12:47=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Thu, Aug 29, 2024 at 10:52=E2=80=AFAM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
>
> > > This could potentially break some legacy user-space programs using
> > > sysfs but whatever, let's apply it and see if anyone complains.
> >
> > FWIW, this broke users pace on my side.
> > Not a super big deal, I'll just revert this patch for now.
> > Maybe the application in question can get rewritten to find the gpio by=
 label.
>
> Ugh we might need to back this out if the userspace is critical
> and you need it.
>
> Ideally userspace should use libgpiod for GPIO access, but I understand
> if it's a higher bar.

In the meanwhile I've explained to everyone involved on the project
that gpiod is the way
to go and the application will get changed. So, no worries. :-)

But I'm not sure about other applications in the wild, writing a
number to /sys/class/gpio/export is just too easy
and people assume the numbers are stable.

--=20
Thanks,
//richard

