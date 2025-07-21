Return-Path: <linux-gpio+bounces-23580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D517B0C3FA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 14:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46879188539A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 12:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59C12D29BA;
	Mon, 21 Jul 2025 12:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fA/BRoPv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA1B2C15B8
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753100388; cv=none; b=ezzbNe2TZtJ5eTcdoXT27uFGVBcqXaOEmc/KLrsB0tIM3K8UdRPkcv19zYhHBe1HgX0kkE1Xz5z1mcymUDaxe8B6ybhANRrG8KE2LZh7g4vRVlrqygttBwPiQPJkTAYSDM8IeBb4h3KWcMT3o8sOKYyoARVU5SElEPnjNdBt3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753100388; c=relaxed/simple;
	bh=4Tg6S1gbNn4iU5ffLnBGtp/itNnaULtAVifmRTO/A4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cITHORpv2tRu8QCxq0rNmRkeoZlJMe0/FotUTiMWHTkKZL/W75V/6adGvKB7tGJhW2Bgb627cRNygOxhF8bm6iOjy+BO+X3aRD3IIIH40wKhXFgL8IoMBvt1y+ww5Y2nXSdte1Z9xWaoujAfVmVRnDM3oQlE9Jh7+ABN0BUN99E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fA/BRoPv; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55a25635385so4938099e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753100385; x=1753705185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPXvt9hrsYdYbsiffa8p7r+hAwlHZBgXCs1SgWjmAZE=;
        b=fA/BRoPvo8uE5c6upD/AMJSNww54zP947sPfXcL0X0XlY+G4Egw/YAh7/UemcOFFOP
         lLwWKx0uG5C8SyjziQKhyRncRVBoF74dn3og4FKfe57WljQnblQpAijYS96I0IKpD2hs
         AGYnjPjF2rJXKKIQGEV+vgEDnYTuaJgmIB8pQS3Kwtd0VjbqgtrPiGGatDP+WqllCVmg
         CZ+LXO8F1qA37ETOCxy3R3xOJMSMt1I2YQqxfih3anC9bVxTyU4rua1MjsJTpwW0C17Z
         3BzOLYp/kbRTb7/b7wbot1YKBJ9LdJoiTodHpl9RVWbUhW5++bu8pqRmLQtv2e3WrW1Y
         Xu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753100385; x=1753705185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPXvt9hrsYdYbsiffa8p7r+hAwlHZBgXCs1SgWjmAZE=;
        b=CgOy/zimKOR23y1nfwLO3oc3+7sKcAflkG0qQbXDjEsGSwoNZcT0g8yQGg/hiELe7w
         b/LQBTNp6pZWGvQm2mDOm+gUipmCFMEF07w1AkBRCxLw/rUHvWNWMBl+RJmaTZySV5/X
         GupNUSmbKNKBAWldIGXp+wR9Hx8o6Qpw378vNepGg6Ids7XcW+w+WdYn2wjGQ0/DuC1G
         Bscy5Ifo8Lu6Rd3TSG2rFbgin8aGuSF8p3p5Inl+1wVTpdKJP2UFHtJwiOiMFcHrusMh
         QpqmiRPiRFY7FC0ASb1imocQxnxDgagklcW1YAuo/x8MChhpgsKpM9iwtctl3c/NQnwD
         n9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWe4npgMF4nglpJklHGxGHVGed98TmB/1uHAOb5eLzqQIEl1vALovjJNzAPpjyotTlv4NM0/ArrsgLB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/piUZQg39XUTDle7p2RPG4ka06k1MpdNeM3LYMb/WRYLFaLTG
	23+CwPTvwLyagDmBv+Wu4f/bM7F4VCGltp35MKFdr19CgKlI6NnzLnTtRScY2uN1wkDwe7//MNL
	SSfc1vIbCbNS4C53PVZRft5e4eHQIf3YoaD4vlM9z9Q==
X-Gm-Gg: ASbGncsAEMWE8CdFC4IBlHJh/lP+ZL+VTYT+I+ewtQMj4Ues25JhNWa1nFkcnTUS3Ku
	KHAYAWkH50/LhCwzZ+ukTQsznKqPXxz8wi4H1U304ru694SDTn3HEzpqDI+kt3JTBqupnibVNRO
	KV4mcbF7/oJXRu9OoMlO4KoEcz/wlTt3hCCC2hB72qoKE47ZaN/2FrG0fv7fDAKl3YZ4/0uEsun
	GKcxk3q8ptOViFiivOGphCOR6xXF3hyLpwykw8=
X-Google-Smtp-Source: AGHT+IEE/YZ2zMZ0vr6S2C2OhYyeLkVzmSPU6ogeh25Hewpf3NQhf4AQpUbeYiLf9h9C3sU9JoVuozrhWDIjQWQEcUg=
X-Received: by 2002:a05:6512:3d02:b0:553:510d:f470 with SMTP id
 2adb3069b0e04-55a23300e4amr6462467e87.4.1753100384455; Mon, 21 Jul 2025
 05:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202507211919.5Oks2bl4-lkp@intel.com>
In-Reply-To: <202507211919.5Oks2bl4-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 21 Jul 2025 14:19:32 +0200
X-Gm-Features: Ac12FXxKsu7G5xjjOmgs_ZYx1_cBAbVtrOccUBqrgxwtIS9FNzB6NoS1MGqEf7Y
Message-ID: <CAMRc=MePztExq__G4DiCzkUZknSrrA9x3795VRvZ5hAPNDkxTA@mail.gmail.com>
Subject: Re: [brgl:gpio/devel /3] drivers/soc/fsl/qe/gpio.c:322:19: error:
 'struct gpio_chip' has no member named 'set_rv'
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 2:02=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Bartosz,
>
> FYI, the error/warning was bisected to this commit, please ignore it if i=
t's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/devel
> head:   ab43c98c938b0a53d7a5220d9e42e7db30961a47
> commit: a905b526122df26d14f16b245cc0d5bd6a073e5f [/3] treewide: rename GP=
IO callbacks
> config: powerpc-randconfig-001-20250721 (https://download.01.org/0day-ci/=
archive/20250721/202507211919.5Oks2bl4-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250721/202507211919.5Oks2bl4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507211919.5Oks2bl4-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/soc/fsl/qe/gpio.c: In function 'qe_add_gpiochips':
> >> drivers/soc/fsl/qe/gpio.c:322:19: error: 'struct gpio_chip' has no mem=
ber named 'set_rv'
>      322 |                 gc->set_rv =3D qe_gpio_set;
>          |                   ^~
> >> drivers/soc/fsl/qe/gpio.c:323:34: error: assignment to 'int (*)(struct=
 gpio_chip *, long unsigned int *, long unsigned int *)' from incompatible =
pointer type 'void (*)(struct gpio_chip *, long unsigned int *, long unsign=
ed int *)' [-Werror=3Dincompatible-pointer-types]
>      323 |                 gc->set_multiple =3D qe_gpio_set_multiple;
>          |                                  ^
>    cc1: some warnings being treated as errors
>

Ah, dang it... I missed the set_multiple() here. I will send a patch,
hopefully Arnd can pick it up on top of the recent PR directly into
his tree.

Bartosz

