Return-Path: <linux-gpio+bounces-34287-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDzPESe/xmnoNwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34287-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:32:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9909134861A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BF1C30D731A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 17:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266B73ECBE5;
	Fri, 27 Mar 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvwMc4Ek"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8D31F9B5
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632295; cv=none; b=M5i5KiYle5dKyp3V04eqLov9sUFq3tVdc5Z3aZm9ulJegLyY9IQNNiVx9IrsxYkXfLzlZdkBknU21MwHhV0teZTtgdC9s74uUEEBB97EVjdMlDzXBck/VxQ3QgnrqMESatda454dAvyyZZAAz497NQE8G0iutNH0PkLlJGlqUHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632295; c=relaxed/simple;
	bh=G08dyUHZcvfvJNUi5CIiGJEaOYcmB2+BAQyU2lQ8MuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EIwrS7pyeoL/5jldSTjiC/rm1P+eft+8NCOmnnbmMHG0wXfKqjb8D8UyVGv1lr8+LaiMzsZwcvKf6BGc8+KSXSKndcaFkzA5cVhcXFk15tiA2IuEghTp1tD3yEkPhXgqUpjQUx5oUKCFnrwap4DUnxOiwq/nDI2hl3fRaW41eto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvwMc4Ek; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774632294; x=1806168294;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G08dyUHZcvfvJNUi5CIiGJEaOYcmB2+BAQyU2lQ8MuU=;
  b=YvwMc4Ek6ELDES+CA6xyN9g60frp7y5teiR+YGPOKaCxG84f3L8Tqz65
   +Gn9c6a5IyQSqrogLKAuJU3UoYnNWbb+j910oHXWLhCVxIp29BkvDo/bJ
   asLfV3wPHRfOqm/5TCuGNrVTBufsRmE3Q8KmOvXlAtXjPpW1rkpEYw4qG
   agDKbvPjEoWleGYBtW0i0FHs7xrW68/FVYePp24yJtiX2sa3SmIV+P920
   qxs8E0nzIBPeKXZBKK+llfljXc0wTtUaQdAXT73v8NdhcY3PNh/RJij2W
   D8uj9+1Ob1mMexO1wwIY9Vy847GQEqQbPXHZLCq3E41EQotmDTgGOf6Bb
   g==;
X-CSE-ConnectionGUID: dHXdiAEWSg+U+ijglPNSIg==
X-CSE-MsgGUID: OQ2w56dPTue2uBpF9s8RvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="98326953"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="98326953"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 10:24:53 -0700
X-CSE-ConnectionGUID: +XDkDL/vTxquN65/fTmutQ==
X-CSE-MsgGUID: TGso96/dREqoJbOXJycHLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="222046767"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2026 10:24:51 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6AvR-00000000AWj-0Fbl;
	Fri, 27 Mar 2026 17:24:49 +0000
Date: Sat, 28 Mar 2026 01:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next 57/59]
 drivers/gpio/gpio-mt7621.c:254:14: error: no member named 'of_gpio_n_cells'
 in 'struct gpio_chip'
Message-ID: <202603280113.OtboXgzp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34287-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 9909134861A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio=
/for-next
head:   af475c16bc02a08ed6af6ca0c920f98a45611fe6
commit: 7803501e5754dc4b295ab22b20562e2b965358ba [57/59] gpio: drop unneede=
d Kconfig dependencies on OF_GPIO
config: um-randconfig-r112-20260326 (https://download.01.org/0day-ci/archiv=
e/20260328/202603280113.OtboXgzp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054=
e11d1a17e5ba88bb1a8ef32fad3346e80b186)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260328/202603280113.OtboXgzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280113.OtboXgzp-lkp@i=
ntel.com/

Note: the brgl/gpio/for-next HEAD af475c16bc02a08ed6af6ca0c920f98a45611fe6 =
builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/gpio/gpio-mt7621.c:8:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpio/gpio-mt7621.c:254:14: error: no member named 'of_gpio_n_cel=
ls' in 'struct gpio_chip'
     254 |         rg->chip.gc.of_gpio_n_cells =3D 2;
         |         ~~~~~~~~~~~ ^
>> drivers/gpio/gpio-mt7621.c:255:14: error: no member named 'of_xlate' in =
'struct gpio_chip'
     255 |         rg->chip.gc.of_xlate =3D mediatek_gpio_xlate;
         |         ~~~~~~~~~~~ ^
   1 warning and 2 errors generated.
--
   In file included from drivers/gpio/gpio-tegra186.c:9:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpio/gpio-tegra186.c:502:20: error: no member named 'of_gpio_n_c=
ells' in 'struct gpio_chip'
     502 |         if (WARN_ON(chip->of_gpio_n_cells < 2))
         |                     ~~~~  ^
   drivers/gpio/gpio-tegra186.c:505:39: error: no member named 'of_gpio_n_c=
ells' in 'struct gpio_chip'
     505 |         if (WARN_ON(spec->args_count < chip->of_gpio_n_cells))
         |                                        ~~~~  ^
   drivers/gpio/gpio-tegra186.c:709:25: error: no member named 'of_gpio_n_c=
ells' in 'struct gpio_chip'
     709 |         if (WARN_ON(gpio->gpio.of_gpio_n_cells < 2))
         |                     ~~~~~~~~~~ ^
   include/asm-generic/bug.h:155:25: note: expanded from macro 'WARN_ON'
     155 |         int __ret_warn_on =3D !!(condition);                    =
          \
         |                                ^~~~~~~~~
   drivers/gpio/gpio-tegra186.c:712:47: error: no member named 'of_gpio_n_c=
ells' in 'struct gpio_chip'
     712 |         if (WARN_ON(fwspec->param_count < gpio->gpio.of_gpio_n_c=
ells))
         |                                           ~~~~~~~~~~ ^
   include/asm-generic/bug.h:155:25: note: expanded from macro 'WARN_ON'
     155 |         int __ret_warn_on =3D !!(condition);                    =
          \
         |                                ^~~~~~~~~
   1 warning and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MFD_SYSCON [=3Dy] =
&& OF [=3Dn]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=3Dy] && GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MFD=
_SYSCON [=3Dy] && (ARCH_AT91 || COMPILE_TEST [=3Dy])


vim +254 drivers/gpio/gpio-mt7621.c

09eed5a1ed3c75 Sergio Paracuellos  2022-09-13  218 =20
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  219  static int
9804456e60670c Andy Shevchenko     2021-12-20  220  mediatek_gpio_bank_prob=
e(struct device *dev, int bank)
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  221  {
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  222  	struct gpio_generic_ch=
ip_config config;
8512486ba2d441 Linus Walleij       2018-07-09  223  	struct mtk *mtk =3D de=
v_get_drvdata(dev);
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  224  	struct mtk_gc *rg;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  225  	void __iomem *dat, *se=
t, *ctrl, *diro;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  226  	int ret;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  227 =20
8512486ba2d441 Linus Walleij       2018-07-09  228  	rg =3D &mtk->gc_map[ba=
nk];
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  229  	memset(rg, 0, sizeof(*=
rg));
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  230 =20
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  231  	rg->bank =3D bank;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  232 =20
8512486ba2d441 Linus Walleij       2018-07-09  233  	dat =3D mtk->base + GP=
IO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE);
8512486ba2d441 Linus Walleij       2018-07-09  234  	set =3D mtk->base + GP=
IO_REG_DSET + (rg->bank * GPIO_BANK_STRIDE);
8512486ba2d441 Linus Walleij       2018-07-09  235  	ctrl =3D mtk->base + G=
PIO_REG_DCLR + (rg->bank * GPIO_BANK_STRIDE);
8512486ba2d441 Linus Walleij       2018-07-09  236  	diro =3D mtk->base + G=
PIO_REG_CTRL + (rg->bank * GPIO_BANK_STRIDE);
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  237 =20
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  238  	config =3D (struct gpi=
o_generic_chip_config) {
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  239  		.dev =3D dev,
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  240  		.sz =3D 4,
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  241  		.dat =3D dat,
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  242  		.set =3D set,
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  243  		.clr =3D ctrl,
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  244  		.dirout =3D diro,
64f89f6e1f2b7f Bartosz Golaszewski 2025-09-17  245  		.flags =3D GPIO_GENER=
IC_NO_SET_ON_INPUT,
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  246  	};
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  247 =20
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  248  	ret =3D gpio_generic_c=
hip_init(&rg->chip, &config);
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  249  	if (ret) {
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  250  		dev_err(dev, "failed =
to initialize generic GPIO chip\n");
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  251  		return ret;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  252  	}
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  253 =20
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10 @254  	rg->chip.gc.of_gpio_n_=
cells =3D 2;
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10 @255  	rg->chip.gc.of_xlate =
=3D mediatek_gpio_xlate;
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  256  	rg->chip.gc.label =3D =
devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
8512486ba2d441 Linus Walleij       2018-07-09  257  					dev_name(dev), ban=
k);
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  258  	if (!rg->chip.gc.label)
59d646c775d6ae Nicholas Mc Guire   2018-11-21  259  		return -ENOMEM;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  260 =20
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  261  	rg->chip.gc.offset =3D =
bank * MTK_BANK_WIDTH;
fa84667b98fd1a Ren=C3=A9 van Dorst      2019-01-30  262 =20
8512486ba2d441 Linus Walleij       2018-07-09  263  	if (mtk->gpio_irq) {
f4e9bcc05f4e8d Linus Walleij       2019-08-09  264  		struct gpio_irq_chip =
*girq;
f4e9bcc05f4e8d Linus Walleij       2019-08-09  265 =20
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  266  		/*
f4e9bcc05f4e8d Linus Walleij       2019-08-09  267  		 * Directly request t=
he irq here instead of passing
72780ce5f1a418 Linus Walleij       2020-01-13  268  		 * a flow-handler bec=
ause the irq is shared.
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  269  		 */
8512486ba2d441 Linus Walleij       2018-07-09  270  		ret =3D devm_request_=
irq(dev, mtk->gpio_irq,
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  271  				       mediatek_gpi=
o_irq_handler, IRQF_SHARED,
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  272  				       rg->chip.gc.=
label, &rg->chip.gc);
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  273 =20
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  274  		if (ret) {
8512486ba2d441 Linus Walleij       2018-07-09  275  			dev_err(dev, "Error =
requesting IRQ %d: %d\n",
8512486ba2d441 Linus Walleij       2018-07-09  276  				mtk->gpio_irq, ret);
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  277  			return ret;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  278  		}
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  279 =20
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  280  		girq =3D &rg->chip.gc=
.irq;
09eed5a1ed3c75 Sergio Paracuellos  2022-09-13  281  		gpio_irq_chip_set_chi=
p(girq, &mt7621_irq_chip);
f4e9bcc05f4e8d Linus Walleij       2019-08-09  282  		/* This will let us h=
andle the parent IRQ in the driver */
f4e9bcc05f4e8d Linus Walleij       2019-08-09  283  		girq->parent_handler =
=3D NULL;
f4e9bcc05f4e8d Linus Walleij       2019-08-09  284  		girq->num_parents =3D =
0;
f4e9bcc05f4e8d Linus Walleij       2019-08-09  285  		girq->parents =3D NUL=
L;
f4e9bcc05f4e8d Linus Walleij       2019-08-09  286  		girq->default_type =
=3D IRQ_TYPE_NONE;
f4e9bcc05f4e8d Linus Walleij       2019-08-09  287  		girq->handler =3D han=
dle_simple_irq;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  288  	}
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  289 =20
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  290  	ret =3D devm_gpiochip_=
add_data(dev, &rg->chip.gc, mtk);
f4e9bcc05f4e8d Linus Walleij       2019-08-09  291  	if (ret < 0) {
f4e9bcc05f4e8d Linus Walleij       2019-08-09  292  		dev_err(dev, "Could n=
ot register gpio %d, ret=3D%d\n",
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  293  			rg->chip.gc.ngpio, r=
et);
f4e9bcc05f4e8d Linus Walleij       2019-08-09  294  		return ret;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  295  	}
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  296 =20
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  297  	/* set polarity to low=
 for all gpios */
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  298  	mtk_gpio_w32(rg, GPIO_=
REG_POL, 0);
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  299 =20
80fd7e96d669d7 Bartosz Golaszewski 2025-09-10  300  	dev_info(dev, "registe=
ring %d gpios\n", rg->chip.gc.ngpio);
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  301 =20
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  302  	return 0;
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  303  }
4ba9c3afda4121 Sergio Paracuellos  2018-07-05  304 =20

:::::: The code at line 254 was first introduced by commit
:::::: 80fd7e96d669d729d9e01bfa3e2b60ea6b500e20 gpio: mt7621: use new gener=
ic GPIO chip API

:::::: TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
:::::: CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

