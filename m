Return-Path: <linux-gpio+bounces-3730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19958625E2
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Feb 2024 16:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BAFF283347
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Feb 2024 15:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4773E47774;
	Sat, 24 Feb 2024 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UftY6FpU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD234655D
	for <linux-gpio@vger.kernel.org>; Sat, 24 Feb 2024 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708790314; cv=none; b=Bo5CAh31aQATLJ5xTDPWazd9r3oLAMaxHSeKIt8+2BhF9WVAEYS+Gc3VB0jzUWGyLFV5hsOtOBO0IsMKnjb0ckIL4bwDjLVlgglXrK01iZ6bXZ+M0N4tlkr8XvwTlJUA6Y0oEEN75GKfCrfvQDJf6LMmdU6SOp1Y5Kg8HgPK738=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708790314; c=relaxed/simple;
	bh=tn+wyxk5uwK/kJdVwaOVs+ptdO3qG5gdxMcayA3xpDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gajO8yBdhHTBZKFFHsKVWt16qHASdw7VQkclum9f47+bUM+Pd4D0AfMH9LNBW+RfPx4N1zwKwFZ85nYIMgGvGRxm58m21THTk95o0wsiCMKYnqy/SUX3juPsy4zjmOxrbOg6lIqveXbLmyTU6LcKwKI758NYq70Z9qcnQtEo4ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UftY6FpU; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso2016678276.2
        for <linux-gpio@vger.kernel.org>; Sat, 24 Feb 2024 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708790310; x=1709395110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q3LLVi7UXjfRcoBjabv86oQvRhY41hxKfXIsF7KHc4=;
        b=UftY6FpUINTHMRuPZK11QlMAP4x+s2XqabwFM3p7Atj5wFtfItXX77NfoD07JlnZe+
         syEl4MqVRq3ZYKDNGZxzqyoWqffv51Uz4CK6VJZZl3GIlT1xit5vo0VteRt537aj/QsG
         N2UZMlTHSTrFe/O4n4OA6zAFC/Y3UKVUmQe/sD/fDBzTHM1c1o1oGUUBpP7eoS2+R7LI
         KsNzq6aiX+yw4jTiqjx4BGlfPHt3nTbgLqsaq39ecgz/OqxEqmGUmvDthmf6xbOe41iu
         R3gOg3Fi8dbZQ5gaCIe6cw3Lxt3n8uwbUQStNqDSSa47anzADWNsz4soSvRiX/ylWdZD
         sCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708790310; x=1709395110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Q3LLVi7UXjfRcoBjabv86oQvRhY41hxKfXIsF7KHc4=;
        b=NUK3G/EK/DuNc3vStjpCBlxk88268X/Kc6D+Cm4uL4kLHxHzaSZMJSoLERV3hmDQmv
         kBpFqFJt5y5RPW+NcIZSyKvwYEfNfkIN1of31lxVRQRfCr6bsYLhS7IA4LuFx701vzun
         wsKdGxV26/P0qo7f40oEwokM+PUbIq2qgVhg763A5aqd/WChIKj0HSreE1ooX3owmckB
         G79Zo4oFXH0b2/p0o03k3U44MojL87L6eghY3qFQs+PTxksQNy+RdqdBZoWbX9c+8XmP
         tl1OpIxKOkxY06R7Ck1hYuoouKNpU4NJHP4pmh1VSLsR/vyx1Fl6cBXgTqMTqXa8TVMM
         mirw==
X-Forwarded-Encrypted: i=1; AJvYcCW+qgSc3atzOK6ZrTYxUEDTqPVq6Hy7Xqz3CYOpg1G43oJV1huXR5MkrPkMKKpYJgKUF3Drdz9Mn2zF6Op9yVAMm+xVGS2XPVioew==
X-Gm-Message-State: AOJu0YyKFIAa6Ao+f5nVd1LejJEZ2SOPu4tP2MXEsDTKDUNoXGDaBG+x
	Y8QLrZomEAyYyOxrdP9eSbDdJ7ETUjFWj4Enjhl3nmmOFNWcxQkwkDMLkJogq7q7eWgj7xAHLVh
	tdhZYUeRujpOHAjcRyE+tR+4VrWypkkxSG08Btg==
X-Google-Smtp-Source: AGHT+IFRW5fr+zTGpjnXwH+OyFOdktrbTb8M/GNEkdNtTl0r8IvGddJJSAXDmCIqx3AtLqd/ELkwAoJcF5n8CUl6gQ0=
X-Received: by 2002:a25:844b:0:b0:dc7:347e:c6f4 with SMTP id
 r11-20020a25844b000000b00dc7347ec6f4mr2136513ybm.32.1708790310121; Sat, 24
 Feb 2024 07:58:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com>
In-Reply-To: <202402232058.4eDf4GRs-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Feb 2024 16:58:18 +0100
Message-ID: <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: kernel test robot <lkp@intel.com>
Cc: "andy.shevchenko" <andy.shevchenko@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 1:44=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> head:   7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0
> commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/47] gpio: mmio: Supp=
ort 64-bit BE access
> config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240223=
/202402232058.4eDf4GRs-lkp@intel.com/config)

UM Linux now again.

gpio-mmio depends on HAS_IOMEM
and UM Linux has set HAS_IOMEM, but
also claims to support 64bit without providing the necessary 64bit
io-accessors.

Maybe UM Linux need to be fixed?

Yours,
Linus Walleij

