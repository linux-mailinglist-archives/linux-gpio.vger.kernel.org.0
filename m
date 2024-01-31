Return-Path: <linux-gpio+bounces-2794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4093843B4C
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 10:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AADEB222B8
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3606773D;
	Wed, 31 Jan 2024 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nsSB8tjd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586FA67E86
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706694133; cv=none; b=lDAgFHC8YjGMfLOfEAKN8KnWWLcjRXMTJhS5ezuqZrdsmHshh7+22iCQFB+85pcuXvUzhrSxxtzTRArWhMjO/yiVJKk7upwndjae4gRpzVb3H16tV/gOkINSqhk7T2ShEhRGmtrX5Tqk3LHvKzvozBS6lnMiDEBLvRemFkBJz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706694133; c=relaxed/simple;
	bh=I8IaDo2LXl3hMdoey8DJH0y0stzvFygGBC2QIAYoM/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+FRvovCWTSQB5tC6oWj8seGDsYYeO0LImsrkO4Fx9UjeGXxBpqv4H7Imclj+qPr8zQa+Jbvc1BoCaXkp+XFOkNKlpTH8i2oJgGev+Zqo9bGu+1w4QrxIncnHGxfIDzgRmXWLtrJvp4+2LvxWVG9cq39O4cySTTsOcVGwsLJovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nsSB8tjd; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-46b0ca27b74so1380838137.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 01:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706694130; x=1707298930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcYDDjKdeNIzAwHVtZYc2BaL1Bb2VQ1RKHVOMiHOhfs=;
        b=nsSB8tjdbwnOfnTvfCPcuVYPfteasC6ctpnk/peqTQnl7LZjWpJyQcgxhMDshzcOxd
         Kut5MFqOJrriSf9/9e9tmR7bjxvO7xV/CZ+AKHkcoXBgkI/K7NhnTAxrNDQao9pTYG2D
         BM2QTgUpZNy70x0z1aVJnDpPIUDTntP8GhczHVfMEMJ9gw8/ER1PxF+QqcjrW/EFzXB6
         Hp/MZ+F+0UxWlq5fIVXWZxue0Dn05hz150vyxvNWqkCcaHkGdeuXkR9ApH3uoynS4aOe
         0l2KlsLE9fGyqiRAKIrVhOK9N99q4OfvFukjJQsSVqzyk1Nv1wnRlHxv8GWqQqIad39S
         +Pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706694130; x=1707298930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcYDDjKdeNIzAwHVtZYc2BaL1Bb2VQ1RKHVOMiHOhfs=;
        b=ctOBwruhM2pDTD/sYRQsDFLpDgGILoTo5iw/pJU2VkYQfDMI4Yb//xOquFbbMYyyAo
         pqUii7ES6EDshb98mPfj9c8bkrrO35rRUwPZXPu5pCa8gYLSmktURIZFWOzaN6I1RUGy
         xQfYdANnCi+thwgvGuvs3a2LSP6AYkW5k41eD2Z0IN/XKA1eEHj6tJZVT3J2+TKmDD9N
         ORtaoWWPuEwZOQ8/A3dWfBu7bEO8gwF1XX7fHuvlgdCDP8/iCWiGKssisH56N8usJ8rb
         e4NQzU4zjuj4uinmvX0oLfObLIqn2zgxbZYUxqGybqDU1L4Iupha47FWhyFiMzLsmHlM
         V8xw==
X-Gm-Message-State: AOJu0YxzItLP1IH9qfz6G0qYe0CEW0OXulWrYRIPBjhrzboMV5nqMtPs
	c1jY3oJfxItAOhjggWtDJaYvC1tnsydMCgtkjUzUQXAi7PNxXslz3CchV9HcRkBOHEUh2IwfEcW
	DnMzftx7xCSE2xLtDTMTkL7or341UdaiPy2eFog==
X-Google-Smtp-Source: AGHT+IEDws9RVoC8SIOwXfcSXOboZscD/FAMr0ug5hT5QaJ46r/yJ7wnc1mJhwMr7wOx07es/BgsK4kOhjaRQkV0uwg=
X-Received: by 2002:a05:6102:2858:b0:46b:14e2:1ead with SMTP id
 az24-20020a056102285800b0046b14e21eadmr825057vsb.22.1706694130118; Wed, 31
 Jan 2024 01:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-21-brgl@bgdev.pl> <202401311050.YNdm98Hv-lkp@intel.com>
 <CAMRc=Me0y-P4zTu_nCPpdF8hX_7rqri1AG1zCU6sO9tbJXbneQ@mail.gmail.com>
 <fa273f23-320a-465d-a403-523424d98e3d@paulmck-laptop> <CAMRc=MdoG1Ku-hbBWt7Jc+d4=ANfshPWwW3C_G-e2GdyggqG1w@mail.gmail.com>
In-Reply-To: <CAMRc=MdoG1Ku-hbBWt7Jc+d4=ANfshPWwW3C_G-e2GdyggqG1w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 Jan 2024 10:41:59 +0100
Message-ID: <CAMRc=Mc3AzqobxJAPpHoO0Gi2peuvVs66qsSAxFkcD5UzNguYg@mail.gmail.com>
Subject: Re: [PATCH 20/22] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: paulmck@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 10:28=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Wed, Jan 31, 2024 at 10:24=E2=80=AFAM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> >
> > On Wed, Jan 31, 2024 at 10:02:40AM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Jan 31, 2024 at 3:21=E2=80=AFAM kernel test robot <lkp@intel.=
com> wrote:
> > > >
> > > > Hi Bartosz,
> > > >
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > [auto build test WARNING on brgl/gpio/for-next]
> > > > [also build test WARNING on linus/master v6.8-rc2 next-20240130]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a n=
ote.
> > > > And when submitting patch, we suggest to use '--base' as documented=
 in
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Gola=
szewski/gpio-protect-the-list-of-GPIO-devices-with-SRCU/20240130-205537
> > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.=
git gpio/for-next
> > > > patch link:    https://lore.kernel.org/r/20240130124828.14678-21-br=
gl%40bgdev.pl
> > > > patch subject: [PATCH 20/22] gpio: protect the pointer to gpio_chip=
 in gpio_device with SRCU
> > > > config: x86_64-randconfig-122-20240131 (https://download.01.org/0da=
y-ci/archive/20240131/202401311050.YNdm98Hv-lkp@intel.com/config)
> > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20240131/202401311050.YNdm98Hv-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202401311050.YNdm98=
Hv-lkp@intel.com/
> > > >
> > > > sparse warnings: (new ones prefixed by >>)
> > > > >> drivers/gpio/gpiolib.c:444:22: sparse: sparse: incompatible type=
s in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:444:22: sparse:    struct gpio_chip [node=
ref] __rcu *
> > > >    drivers/gpio/gpiolib.c:444:22: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:1103:9: sparse: sparse: incompatible type=
s in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:1103:9: sparse:    struct gpio_chip [node=
ref] __rcu *
> > > >    drivers/gpio/gpiolib.c:1103:9: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:1182:22: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:1182:22: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:1182:22: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:2970:14: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:2970:14: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:2970:14: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:3004:22: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:3004:22: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:3004:22: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:3585:14: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:3585:14: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:3585:14: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:4772:14: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:4772:14: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:4772:14: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c:4846:14: sparse: sparse: incompatible typ=
es in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.c:4846:14: sparse:    struct gpio_chip [nod=
eref] __rcu *
> > > >    drivers/gpio/gpiolib.c:4846:14: sparse:    struct gpio_chip *
> > > >    drivers/gpio/gpiolib.c: note: in included file:
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > > >> drivers/gpio/gpiolib.h:202:1: sparse: sparse: incompatible types=
 in comparison expression (different address spaces):
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip [noder=
ef] __rcu *
> > > >    drivers/gpio/gpiolib.h:202:1: sparse:    struct gpio_chip *
> > > >
> > > > vim +444 drivers/gpio/gpiolib.c
> > > >
> > > >    422
> > > >    423  /*
> > > >    424   * Convert a GPIO name to its descriptor
> > > >    425   * Note that there is no guarantee that GPIO names are glob=
ally unique!
> > > >    426   * Hence this function will return, if it exists, a referen=
ce to the first GPIO
> > > >    427   * line found that matches the given name.
> > > >    428   */
> > > >    429  static struct gpio_desc *gpio_name_to_desc(const char * con=
st name)
> > > >    430  {
> > > >    431          struct gpio_device *gdev;
> > > >    432          struct gpio_desc *desc;
> > > >    433          struct gpio_chip *gc;
> > > >    434
> > > >    435          if (!name)
> > > >    436                  return NULL;
> > > >    437
> > > >    438          guard(srcu)(&gpio_devices_srcu);
> > > >    439
> > > >    440          list_for_each_entry_srcu(gdev, &gpio_devices, list,
> > > >    441                                   srcu_read_lock_held(&gpio_=
devices_srcu)) {
> > > >    442                  guard(srcu)(&gdev->srcu);
> > > >    443
> > > >  > 444                  gc =3D rcu_dereference(gdev->chip);
> > > >    445                  if (!gc)
> > > >    446                          continue;
> > > >    447
> > > >    448                  for_each_gpio_desc(gc, desc) {
> > > >    449                          if (desc->name && !strcmp(desc->nam=
e, name))
> > > >    450                                  return desc;
> > > >    451                  }
> > > >    452          }
> > > >    453
> > > >    454          return NULL;
> > > >    455  }
> > > >    456
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://github.com/intel/lkp-tests/wiki
> > >
> > > Paul,
> > >
> > > Should I care about these warnings? They seem to be emitted for a lot
> > > of RCU code already upstream. I'm not even sure how I'd go about
> > > addressing them honestly.
> >
> > This is maintainer's choice.
> >
> > The fix would be to apply __rcu to the definition of ->chip.  The benef=
it
> > is that it finds bugs where rcu-protected pointers are used without RCU
> > primitives and vice versa.
> >
> >                                                         Thanx, Paul
>
> Ah, good point. I marked the other RCU-protected fields like
> descriptor label but forgot this one.
>
> It also seems like I need to use __rcu for all function arguments
> taking an RCU-protected pointer as argument?
>
> Bart

We have a deprecated, legacy function that returns the address of the
- now RCU-protected chip. This is of course dangerous but we have old
code using it. Can I somehow silence that warning as I don't want this
function to show that the returned pointer is marked with __rcu?

Bart

