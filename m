Return-Path: <linux-gpio+bounces-27531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD20C01245
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 14:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8A4318C372B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 12:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E362C30F7F3;
	Thu, 23 Oct 2025 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O3PeBVv/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B795522068B
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222700; cv=none; b=p8ln7gFokI7lbRlYVXKK0GuBdy6X0tnO77HT81Q3Ljf9RaQO336h9Hh7AF6wD14TEcNPYn6r5QJ3E2QBZ7WGQeqtWkiX1q1UWySKqccas8KLC7CSN39/Rj3bqrYJ0gC9qASBqKjs0TyszMfdZmFqnoRKBLHhQg3oeBbkdjN3PRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222700; c=relaxed/simple;
	bh=6eO+tiqu5gxWLPASRGodixCE3YW3+pELSH6ilut+fa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7cXKbinpoyHZ5AP7hZT4RrVK1ol81fXPcptCXWUorDQ6NwCpCJuHpgBFoVXNnEH+xmtu9quZP35sqqW5g5X3cYnaK1PIroUmaRh80Px9fYLQOdOt5oF64O+AgPyfpbUGuu5iba77n1TuMOggky0tLxuy1BJtI9i0SF0UqXlRfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O3PeBVv/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-592f5fe03dcso767437e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761222697; x=1761827497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcxV7jlDfnvszGpLFODRk5JOPkRKywoQCJY/El6WesU=;
        b=O3PeBVv/Hh68RG1OKhS3Cv4/PXOFah+Euclgxv+QfJKzGtLL0YBpnCRaih5mr1uOzO
         F+2sCH0YP/G7oa8FxLxIWaY7svYQEGC5Yy62Cz5Twjb/52Jua1mw0aE/mYE99v6YS/hH
         iYeIWcLwsny7LsH7W/c6/d7Ohp7K94oEgRwWWuAC3DUSwMKIGHV0ffEaoE7sT5ZsGUhd
         /PS7eRAeF0JK1bO/xF+hy95sVlLVU5AgxK0akAoMs0uN+B4Ej84D8VHoa+Aw3J4lYFhs
         ZwXSGWyPE6n8dO5Vc8CpPeee+TopREHb4dT8Nuzcs6+Yx8BVeGJy5tpoIfId3gpsfzBc
         wwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761222697; x=1761827497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcxV7jlDfnvszGpLFODRk5JOPkRKywoQCJY/El6WesU=;
        b=RWflriJVMFxfe9r05Ff3xlu6mrpC8k5bq/mQGZSoeaMQUbIIN5gQ7bnOcQ+w5LXMpR
         /Gkh+6uUZaTynFmEippXnhxhf7wQ0XUEX45knoAfaES8VQ51eyqzcNTX8pxIwEYkKRrx
         NMjddIH4IKTD6Gx4yArcDk1EglU8Yo8Jf+3I2wYW4OpAt9vAvfNJho+pKDpv/6qyuh4K
         DYvW+lqbqWB8OY1Ns1kcbteGmUJHbFsVlBB4YgHUWS/Dr/eew784SJYUDL/6qXWvQMAf
         x3ACe4PacSYRyt3FJN5TM7W66SGQOtEyO08WdVVqy/tmf/dQyEyjyZ5AIXHveQjy6SNK
         fb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUAD9HsTtkOsZhsbYSfB06kIoNfA9q9nyYMX85y0DbLC4jjnSDvNiAC0h4uGzh/pneElkcVB0TWFgf@vger.kernel.org
X-Gm-Message-State: AOJu0YylsxODqOrMwpZONbsiXP+qeszzUUlf/hpM5yebu814GAGlYWrd
	icnsJvsmFrFFbyY2HIjIPUu2aod4kb7jiWWecoHooBglUHxkvJTH0ufRigeHU1hNXlXC+/UuxGR
	4lZ+4B22Wzl2wYEKJml4BUSY3cvu/+pz7Re6Fi6t58yvQ+EP6GHb7Hx8=
X-Gm-Gg: ASbGncuEv8hg+Pwz2j3Nr1D6IoiqUcINCedbdbScI5JdDH+MC3EQEYFq1LPVxD2fjKv
	v6eqMk1Ogu98qmkRPr2ndZT3A1GYK3wJpxMx0Xfxe1s/7Ul0YUVjPD4JLwvaA5VekmkpaYNICZV
	1f/8YkUEV44nKcLB7Gs/93KhKGAOww5lryPcrT/zDcC3KOHYgD+vIb/EEi6sogYPhYCRiNyXZ6L
	qk20nzfLbGTtDBZE3C7vw0nwlJXQt7MBQ+GCI4CVZuW+27HfmuG4lJuSsnJGOUaV8viybSt99+Z
	kNVKMKtDpYbgpE8=
X-Google-Smtp-Source: AGHT+IHlWEw7YoXjgjgAjGD2T5nBasowO6S4qW+ucC1G5ZeTx1do26wR7Fl8YJLp91+jQww6oqOpu2KmSMLEueA8ups=
X-Received: by 2002:a05:6512:33d5:b0:58b:151:bc12 with SMTP id
 2adb3069b0e04-591d85a4b54mr9384401e87.51.1761222696489; Thu, 23 Oct 2025
 05:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510232205.La2t2fR7-lkp@intel.com>
In-Reply-To: <202510232205.La2t2fR7-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 14:31:22 +0200
X-Gm-Features: AS18NWC2DkPx8ZMhOw19k_GaWcX_KfEcv0khQYZBwNR09LWlWaCHjnBqkpnywIY
Message-ID: <CAMRc=MfhjG1RPS=Khv9us_n09Dzk1NAAHOt5jjWmR3dpB61gcg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-current 6/6] drivers/gpio/gpio-ljca.c:289:9:
 warning: unused variable 'irq'
To: kernel test robot <lkp@intel.com>
Cc: Haotian Zhang <vulab@iscas.ac.cn>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 2:29=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-current
> head:   7d168362aedeca451ac22724f90040296dccca14
> commit: 7d168362aedeca451ac22724f90040296dccca14 [6/6] gpio: ljca: Fix du=
plicated IRQ mapping
> config: x86_64-buildonly-randconfig-005-20251023 (https://download.01.org=
/0day-ci/archive/20251023/202510232205.La2t2fR7-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251023/202510232205.La2t2fR7-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510232205.La2t2fR7-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpio/gpio-ljca.c:289:9: warning: unused variable 'irq' [-Wunus=
ed-variable]
>      289 |         int i, irq;
>          |                ^~~
>    1 warning generated.
>
>
> vim +/irq +289 drivers/gpio/gpio-ljca.c
>
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  283
> 1034cc423f1b4a Wentong Wu    2023-10-09  284  static void ljca_gpio_event=
_cb(void *context, u8 cmd, const void *evt_data,
> 1034cc423f1b4a Wentong Wu    2023-10-09  285                           in=
t len)
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  286  {
> 1034cc423f1b4a Wentong Wu    2023-10-09  287    const struct ljca_gpio_pa=
cket *packet =3D evt_data;
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  288    struct ljca_gpio_dev *ljc=
a_gpio =3D context;
> 1034cc423f1b4a Wentong Wu    2023-10-09 @289    int i, irq;
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  290
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  291    if (cmd !=3D LJCA_GPIO_IN=
T_EVENT)
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  292            return;
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  293
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  294    for (i =3D 0; i < packet-=
>num; i++) {
> 7d168362aedeca Haotian Zhang 2025-10-23  295            generic_handle_do=
main_irq(ljca_gpio->gc.irq.domain,
> 1034cc423f1b4a Wentong Wu    2023-10-09  296                             =
       packet->item[i].index);
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  297            set_bit(packet->i=
tem[i].index, ljca_gpio->reenable_irqs);
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  298    }
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  299
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  300    schedule_work(&ljca_gpio-=
>work);
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  301  }
> c5a4b6fd31e8cb Ye Xiang      2023-02-25  302
>
> :::::: The code at line 289 was first introduced by commit
> :::::: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d gpio: update Intel LJCA U=
SB GPIO driver
>
> :::::: TO: Wentong Wu <wentong.wu@intel.com>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

I fixed this in tree.

Bartosz

