Return-Path: <linux-gpio+bounces-3771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E707F867A57
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 16:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 973162945F5
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 15:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA188592F;
	Mon, 26 Feb 2024 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2uAm4+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814B1129A60
	for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708961625; cv=none; b=Sx/EAz/7r5g0h5xG2SdFnrAdIoQzoSLbBYZdfMgJ0KztLRr9CsVamfV7dtWrtVe6X5lwKZidt1GxOxShlVr9Pe2pIWczXHQWhr2/fMo2/Uaic2WcYDvHElwYacPeqp3rM4bN7zHCMyvoFdCbiBBc3BajtvMPrhlRIiFXsQnb1l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708961625; c=relaxed/simple;
	bh=zXq/oKtDFQ0k9CwqLBfkJgxugkC4ZPpjIEwL+WAqDz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlZc0SfKj58Y4HmqlgZLKD94JQLvsPsxznoEiFsgVMwrybw5i/uYHovRKU6b1KbPgcYr0RaF6ZtK+iODdY4pTpsF7OV8jIGTKR11pV8InQ5uL8iuSfLTVZ2FCbxz9ZYDy54w4Ntk9snaNvwBptnL0sG62EuA8W/TQXX9/b1LE4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2uAm4+h; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5643eccad0bso4994574a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 07:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708961622; x=1709566422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXq/oKtDFQ0k9CwqLBfkJgxugkC4ZPpjIEwL+WAqDz0=;
        b=Q2uAm4+hZ+ijC6eClOlJKFtHWaSQfeF0q8fqP1BSFYEt4Rz8l5P0XgLzkK8ajzq1rT
         sipGQBGjLpon+ebcc+pgo+MRi184fTWNImFqNR4hjQ+l4bUjbfIkFjwu1B2lpHwlPQEw
         ItIABu/mK9fPnQoGn46LU3eF8pW1+6a5/ZW0h/SoDlgpu2MvUkkDZ+J8w1nxDA8gMJCV
         cq00PIUol7qhMnPyqjxzZPnNE+Uqdevs704KQSZJO4yQte5RnR8Q1/RQAcklL8lK94r9
         jUR889vuVG7FDZpcN6Fd38os5Ak5RtZkovCytm/Hbq0/TrR3JrPg/rb9DQPHPTc6/Dal
         zJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708961622; x=1709566422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXq/oKtDFQ0k9CwqLBfkJgxugkC4ZPpjIEwL+WAqDz0=;
        b=LZiODv5YLsaauBsnd84MlYvM9t5ppn0DMRhQg+bxipuF+my/ECCZ8FfaUBflAmG4Us
         RvKBzI7pJnM8rA562iSsDqLLDONHLcjPAPh1FKCOezlkFwAwVg4Z5++PtpItR94TS28Q
         vxnoMkha8a/2g3PeC5RnFA+3s2fX0NyjO6cq0rqqLty+f+Nz3yrs2N4ytKy4n2WzhBIM
         P84iNyltuvhKiUgQjgFvSaYBuu8+Gg7NkBSR6zIsWeNV1+pwJtsyPx39lufwLWx7KXly
         1+XS7xzbut993eWQDpjFOKYwguCl5497lF3BZUPK61gQbX5DgcqTF4nrjECYQZt6zPuo
         7Kqg==
X-Forwarded-Encrypted: i=1; AJvYcCWxaTvt9Ip3vdq6cIJdDApf5ATD2oN+ZVnkNJJ85FKfkRwIUXWSTNN1VN+LJjDE1S1Sgpfa5tGwgDMg9/NG0/b9bSNXVoo4XFfvdg==
X-Gm-Message-State: AOJu0YyER58ziFxh7vg1JuFuEp8sUjfT8PYSoHJuD29ecSrHcFyI2Cpz
	VwZF+jf6L+LmS+VnoqoBMRel6O4aDXJr7VkKcjYKPFdX3+/Hhd65cEDZZOO04FmWJ44fJuKVXs+
	EatOiFUTV2f/H0ZWZ7oNoPMU7x6w=
X-Google-Smtp-Source: AGHT+IEUueOGBV4LM8rI0AeP/xW87MpTTlFUQKbfJsvee8XWP05bk4bxfsfZIj/A/YPygp73zSkyzPjyazV8CQQ4Dw0=
X-Received: by 2002:a17:906:3ac9:b0:a3e:c3ee:33a5 with SMTP id
 z9-20020a1709063ac900b00a3ec3ee33a5mr4690856ejd.45.1708961621541; Mon, 26 Feb
 2024 07:33:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com> <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
 <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
 <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com>
 <522ab6e6-97b4-472d-8a1e-a495a263dda3@app.fastmail.com> <CAHp75VeSJ62oYBTpt4a80eH3tuyjJ_mRZe=P2w3yKKattmh1vg@mail.gmail.com>
 <CACMJSesNN5A0ungLKWdV69nb8j4s=7334xZSRNt_sB64aQq4vA@mail.gmail.com>
In-Reply-To: <CACMJSesNN5A0ungLKWdV69nb8j4s=7334xZSRNt_sB64aQq4vA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Feb 2024 17:33:04 +0200
Message-ID: <CAHp75VfAHLGozhZw02-5N=ALt4gXuQpKaYCx0OXcnZJYxbW91w@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 3:56=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
> On Mon, 26 Feb 2024 at 03:18, Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
> > On Sun, Feb 25, 2024 at 11:09=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:

...

> > The driver in question by name assumes that it won't perform IO port
> > access. Perhaps use of ioread*()/iowrite*() is not what we should even
> > consider there, Linus, Bart, do you know if gpio-mmio was ever used
> > for devices that want IO port rather than MMIO accesses?
>
> I don't know the answer. I'd also like to stabilize the for-next
> branch as we're pretty late in the cycle so I'm really considering
> backing this patch out unless you think you'll be able to fix it soon?
> I'm quite busy ATM and will be travelling this week so can't really
> spend time on it.

Then, revert it. Not a big deal to me right now, thanks!

--=20
With Best Regards,
Andy Shevchenko

