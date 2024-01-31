Return-Path: <linux-gpio+bounces-2841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF02B8448A8
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64373B2160B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8014D3FB28;
	Wed, 31 Jan 2024 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y92jwdjN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDE93F8F9
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706732384; cv=none; b=nkVK5dulSKhrHsJf2rGsLGcyjaO8Mrr1vtoLfi24t2sQlOG6SMvL6UJ9r8kAqndEMZXSdiOhxJdROFW36ksBnztf/v3WhvlWXJV1p4yls5maBGQbxGZS5DLdCUuY315YOAY18VrD/88sRGc+mOxdRp3acpiFSKLqote2C4nVQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706732384; c=relaxed/simple;
	bh=mRETN4tNpgYw0SYp2SiE61n9j1mg46JW7qEzbatwht0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EN7cXyJyOSiXrO9U82R4r/+rNXWhM1Mcxd1mhhUNx1lUw7Sxf1Iu+IH4dlG1dvAwr+bITOUrSuJKRZCNfpOAvdFMDJAMzN/nUeFAOyfzNdv4vN+FNMV+4pc/CRqgY3mKI7241X0OFs7lpv5yNQxqX7pr5Y5cNZdnt9pkFDrscxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y92jwdjN; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6040e7ebf33so1328397b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706732381; x=1707337181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRETN4tNpgYw0SYp2SiE61n9j1mg46JW7qEzbatwht0=;
        b=y92jwdjNxWnlo6X7PIexmFXmE2QH7A9r1rhjWGATunwqnFuYrV0YFon2X4/cB48uhD
         4fJc/BqObsGln/w95o1Vgx67p9qQnad0PapgpNOMG3CX+0oaVqhg3SNXKNRWUjIk5YnJ
         zilovoOI0wUy6LRP1Qr3g3VxrR/g/bzTWMfCCiapfh1c90Y3s1NPv93Tmzp6VQf723eS
         O6M7C6nsB+1V7dJ704zSYeLI/i1fX687R+mOXf8ECwIbZdTGB83jGtS1hY/IVOBtPVIP
         vS7lNrFBxZmC9lL3yxhsrMDOI0mZEk8vH3v8YI4kTuGwsGdxCi0d1HPYpQcxUAbLM9LB
         uF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706732381; x=1707337181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRETN4tNpgYw0SYp2SiE61n9j1mg46JW7qEzbatwht0=;
        b=oG50TI4V0a4UXchdtDkJYglwAwotxcfst4/biDBOhEsxn1//5O/51Z6E1DiIsshkgU
         7tcZnahXdha1x+DjHIxxJJP4x0iYylgS1f/ox4SFtohJ5BC+E6G7kMeX83oGCgr5BTyW
         iRg/TNzGsONPEoFg1KFm5l2qOniB64ots3m7DtIIoa62UeWC+pNb2tKMb1fVdYiHBGLH
         Uwnv173vs0APxZcmpySF3m6SREFmGd4s+m+hySKMpOeI8ao+y25vvEAFKcTGyzQYZxCh
         JXF8cOVy1ZIJ62b7mTjw0vCSIIfFEt4R+tAeDXeY64MFEnXIuiXB59oGXZV7OqSf+65/
         /kPg==
X-Gm-Message-State: AOJu0Yz/m5SfvrgbgBQ3HM8HkPiLigXOtJJxJ1XJANpcvh03hknb//5f
	BK82Lh3yOH08RFMwGcnyDXMkAjD2BhPM80qXKVtblx0dO9Oog8Qn2LrARXvl6bTGmV6nH3EZb54
	hm1Pm5w9NPSYo8GlTMsO8x5TC/I63KXItQ6zh+yaxBZU9WETSF68=
X-Google-Smtp-Source: AGHT+IGpegJBfIDZT9mA1jSmv3BI7GDep8ArM6hXT7dTDnUAmqNT30PJsr1R6/YpQQXqgZ9fJg61h50uoxhQBUUpSbU=
X-Received: by 2002:a81:af4d:0:b0:604:151d:20d3 with SMTP id
 x13-20020a81af4d000000b00604151d20d3mr1028904ywj.23.1706732381527; Wed, 31
 Jan 2024 12:19:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-17-brgl@bgdev.pl>
 <CACRpkdbCBe+HH5uuh94tx9ezV0xtBO-=DZp22bUBbbYuEtJ3Vw@mail.gmail.com>
In-Reply-To: <CACRpkdbCBe+HH5uuh94tx9ezV0xtBO-=DZp22bUBbbYuEtJ3Vw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:19:30 +0100
Message-ID: <CACRpkdaVtzXnX5Ef71UGS8xKyZHF6Pm+DWk9DEGvx9oVOBbUOg@mail.gmail.com>
Subject: Re: [PATCH 16/22] gpio: reduce the functionality of validate_desc()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 9:16=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Checking desc->gdev->chip for NULL without holding it in place with som=
e
> > serializing mechanism is pointless. Remove this check. Also don't check
> > desc->gdev for NULL as it can never happen.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I don't know if I agree that it is pointless. It will work on any single-=
CPU
> system and 99.9% of other cases.
>
> On the other hand: what it is supposed to protect against is userspace
> doing calls to a gpio_device through the character device, while the
> backing struct gpio_chip is gone (e.g. a GPIO expander on USB,
> and someone pulled the cable), i.e. it became NULL, and this is why the
> error message says "backing device is gone".
>
> But I want to see where the series is going, maybe you fix this
> problem in the end, so I can come back and ACK this.

Aha, it is fixed in patches 19+20. Maybe mention that we add a new
protection later in the series in the commit message?

Anyway, I get it now!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

