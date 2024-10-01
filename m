Return-Path: <linux-gpio+bounces-10607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5198B81A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 11:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6732F28124C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 09:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F3A19ADBB;
	Tue,  1 Oct 2024 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3BO+v9Gt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9319B5A9
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727774244; cv=none; b=Hhu/jk990v+b7D7toVh3p5/p9Re86g1eZZ9c2BIRvZf2Idxf1BEhrwh4fHhAleXboHDaMtoepCqetFse2ILpfhnnJhvLJMbxPH2BhyvOQfRzOBeGKhbWVSa0Ke9ajki5TpbyCgTi1JA5q0OK6Zx3aiUTKLt2G0L9gonFaaacs3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727774244; c=relaxed/simple;
	bh=aC2RZcT9lHrXUU9dIlBlGptabT2MAuKp0sLJYRKM2to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IG9Vwer8BirLx1qjvjRWaSX5Rt8TMQglwUWoJIQQLIt2NyOck2X5/I6asw4ZGsECOw8b5Y6PaVTQymHkOhRf3gryfldR7cAERSxrUXaJlpTw0WzJK9iJ2s7MQHIjufaD5kaGsT6ulalnncYpailIaEu66CznfIQq0Eunsp4d014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3BO+v9Gt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e137183587so1429455a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727774242; x=1728379042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us9teco+BOfBOtKeZA4Z07H/40ek9mhAq6A6YSt9qwY=;
        b=3BO+v9Gt3/cdTQj5iJjqYVfYXVDpJUImMzzd4Uw4QH5x9R7SRQ2FihsKow/i8BknAD
         bp1RsHcQSvfO8H85UTwKUxTCreBiElqxqwkX77SoSt9EL7e4RcLqQcJa8MfUkiE3vMse
         UoH5+nUXkNhMOi00uZP82U14EUeX+Eg6M3gXR08a/WqPtJv2CBXIqglHb/7z4dGMeGf1
         Outx4WHz+v4HWqpwpA7uPkQewf29zRqMNOaQRSJNg9eW90c8GjngSagxOTJslUDqcHxf
         UWv1DZOg1G0/8tj4EtQSW3CXYyIap58w1ubRrs5QcJsYikbiNKIDQSV/pRuzADCiz207
         th5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727774242; x=1728379042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=us9teco+BOfBOtKeZA4Z07H/40ek9mhAq6A6YSt9qwY=;
        b=ap2JidsG3WOeaMVh3zdooY1fWWcwJAsRAiF2SlcidubycxeLxyKIKXkwDPSw5Bf/Wb
         rJ5qa39eMUhZnzZWpT5MBzyedKQj5Eo6mlRYWwN8+72b13LVvHN36JKhHsWN9Q5jyhLr
         WOK0wOeAs0d9MsNC5xjNZgq4tOTlE2sIn+oga7o7lQXOGDsf2J2+zdCl119/03716bhv
         C3wg4jVd8Ds0w10sRwDlKxZ5f6cCZpDNJMsBTB42d0UI+E/T8TjHG/HpMXnPWZnlK9Qx
         eaRROGkQppnBjx/vShOS3De8ECLeC8j6xNRUYA8YNO/z6T257IXcHTAXZy/X9iXphub2
         KCQg==
X-Forwarded-Encrypted: i=1; AJvYcCWSbXNO5DlnczfkA8LmDTYMIQaiIR+lwcV99llDeYvrveVcnWtQo17C3DCCjmbC7I6Xn7/PdtL1App6@vger.kernel.org
X-Gm-Message-State: AOJu0YwS0EnYFXFv2oqe7jp6Ky7NBwtXMpnEMXtcvtBqE3fNOuFnXKdl
	gJUEYDI8SkIF+tGWYEoaiethXudlpjVEjsfCGZ/Yu2ieYbb4yEBFFogjuyKRPo3E0Ye2kCmjrgP
	wBhbfGIrYFgLTgYQR39156qa9H/o6IcGZRcCZjw==
X-Google-Smtp-Source: AGHT+IHYkAg4UVKRyo4StwzqLZV2DXAq21p9Gnn5Bj77LYfFpKaPnaCsICz4KGajnf7wmJq3yUvb2lm9cbLTWxBNDgQ=
X-Received: by 2002:a17:90a:b396:b0:2d3:bfc3:3ef3 with SMTP id
 98e67ed59e1d1-2e0b89de3a8mr16356647a91.12.1727774242256; Tue, 01 Oct 2024
 02:17:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930115116.54626-1-brgl@bgdev.pl> <202410011000.hRJ0JPdV-lkp@intel.com>
In-Reply-To: <202410011000.hRJ0JPdV-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Oct 2024 11:17:09 +0200
Message-ID: <CAMRc=MeY_+ZvEgiNegxD012i1NaFN04=8LTzwyUWod_9TRXb-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: davinci: allow building the module with COMPILE_TEST=y
To: kernel test robot <lkp@intel.com>
Cc: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 4:35=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on brgl/gpio/for-next]
> [also build test WARNING on linus/master v6.12-rc1 next-20240930]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewsk=
i/gpio-davinci-use-generic-device-properties/20240930-195251
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> patch link:    https://lore.kernel.org/r/20240930115116.54626-1-brgl%40bg=
dev.pl
> patch subject: [PATCH 1/2] gpio: davinci: allow building the module with =
COMPILE_TEST=3Dy
> config: sh-randconfig-002-20241001 (https://download.01.org/0day-ci/archi=
ve/20241001/202410011000.hRJ0JPdV-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241001/202410011000.hRJ0JPdV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410011000.hRJ0JPdV-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpio/gpio-davinci.c:652:34: warning: 'davinci_gpio_ids' define=
d but not used [-Wunused-const-variable=3D]
>      652 | static const struct of_device_id davinci_gpio_ids[] =3D {
>          |                                  ^~~~~~~~~~~~~~~~
>

Weird, this doesn't happen on x86 defconfig with OF disabled and W=3D1...

Bart

>
> vim +/davinci_gpio_ids +652 drivers/gpio/gpio-davinci.c
>
> 0651a730924b17 Devarsh Thakkar   2022-06-13  648
> 8507f35447e6e5 Min-Hua Chen      2023-06-09  649  static DEFINE_SIMPLE_DE=
V_PM_OPS(davinci_gpio_dev_pm_ops, davinci_gpio_suspend,
> 0651a730924b17 Devarsh Thakkar   2022-06-13  650                         =
davinci_gpio_resume);
> 0651a730924b17 Devarsh Thakkar   2022-06-13  651
> c770844c3e30be KV Sujith         2013-11-21 @652  static const struct of_=
device_id davinci_gpio_ids[] =3D {
> 0c6feb0796ea64 Grygorii Strashko 2014-02-13  653        { .compatible =3D=
 "ti,keystone-gpio", keystone_gpio_get_irq_chip},
> 6a4d8b6bd27932 Keerthy           2019-06-05  654        { .compatible =3D=
 "ti,am654-gpio", keystone_gpio_get_irq_chip},
> 0c6feb0796ea64 Grygorii Strashko 2014-02-13  655        { .compatible =3D=
 "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
> c770844c3e30be KV Sujith         2013-11-21  656        { /* sentinel */ =
},
> c770844c3e30be KV Sujith         2013-11-21  657  };
> c770844c3e30be KV Sujith         2013-11-21  658  MODULE_DEVICE_TABLE(of,=
 davinci_gpio_ids);
> c770844c3e30be KV Sujith         2013-11-21  659
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

