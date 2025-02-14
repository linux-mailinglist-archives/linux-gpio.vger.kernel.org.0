Return-Path: <linux-gpio+bounces-15992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 062CEA35A32
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E451188CE81
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 09:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA8621CA1A;
	Fri, 14 Feb 2025 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LSx30mXp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377A5229B2C
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739525064; cv=none; b=Cdu948s36MniUjBTyz52wMByHtSvTFCjMup5iudEFjFSZcKiH1Tk1yG4R6+OO//1bd08hQXLyFqEiBqB3Trnn+mx8dZMQnjjkd9/KTpO69iCbPX7O+N0KGp3CYd5Ecn0htKVLwTUXcfCyFGO7hcZSztXM9veMERVxG6uncTnCAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739525064; c=relaxed/simple;
	bh=Um93XztfaI6rR8E74QvPDKkoVEt+jJqd9tygLchRrMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lY+RfpAI8ipXAO5H1b/uKanukKYfTagAXoYUJfUgmZ0SYcs/fc/KRuMcEUym5DnTdShIsf6s4W4ZSSLk5NmI8j7PvarZv94jeBGvGLnonfKgj8KgPgCvAOpKnwl/FCkw+6DzG9ox7TQbWSGGYFl9k1umiaXyi/ZMY1Zm+Bcc/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LSx30mXp; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-545074b88aaso1946108e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 01:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739525060; x=1740129860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGkb7GkJNMEwB0Lc39gVzJe4c0GiPWxr9xdqsANunoc=;
        b=LSx30mXpJ0nCn1iUafmAW2QkqF8XZA35WN+T4EDHo7vFEDNSFOBWJ8KbGwvMp9oTyr
         ysJfLrUnhlWiKK8Zc9+UnMkbd1Qs6n4kQYefA0yQyeNfr20icyGjyF4Aj0iDKA89h0q1
         uIBOlec6sjd9xvT6y66hsjO0zA5ZhR1PLlTGzKIq6JvcQLhdylu20Q5bC9rJ06BXvaeE
         jjR90aB8uMMQLs5d5qLLSdAspSy5UhRvqqEMpLvgUWmJx9Ilwcl0+yi9cFdyGOmHzRQZ
         v1P1BtPBmE2AG9xKqU56QeNo2lE7HF20HnDpP4kcH/EckIJwP4KLKiZzLhv/4pqCYmcw
         1ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525060; x=1740129860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGkb7GkJNMEwB0Lc39gVzJe4c0GiPWxr9xdqsANunoc=;
        b=iZPewjhqLjQlha4Jg6QCBSgRCr0a7/9UiXRBJLQS+zgQNvzQXZte/M7v5+CniuHh46
         2VPT2POvnzUdAaQgm7Pfb70J20wRcKqD//hLtHCA6r/9BhcfIlUWo5EMCyjLFBvmWjBX
         rMF5ddds/a40GSeJmWNB0RBNTK9nkZExFd3nwmEZZMAN2E7QC3nQLY4heCup3V5VMPKP
         NeSrtuD5sr5C6Is1pN90yuFFNu7Smdc26+IHg541fwxmP00Wtk3BOraUS54eewEkx3Ck
         S3GpDGcczUH2g4iaMehK7bFBmBak0j0k5ei6zoTm6woG0vzaialokEthwhWtLp8G21l7
         wfjw==
X-Forwarded-Encrypted: i=1; AJvYcCXsoqV32EXDa3nCb5Uta6VS0Tbv8dvxeSf1QC8ECuxiv7g5mRvgvWhYq1Ey+Pkf0EkGfdEE+GmJhkKM@vger.kernel.org
X-Gm-Message-State: AOJu0YyfftqdahpHBgw13yKzGSMgrVLCxtJK7VQbydDgTGAN1m+64Hr4
	bNAHvenUu+17GWjciclrnZ199KO6mBPN6gcR117Qk6Bjidue+MqMUVyvcDowq/3yndI/zBy41nn
	CM2qHCMKBVoa4TAIdqByY95nySyHCinTksgWVbg==
X-Gm-Gg: ASbGncvIYMLH/3We8Ge8JKj2V7Y3mZ5Zoqvju/klDC/qG/Bo8CSpaikTMnkRrcY2Kzx
	YiMQIRcV6VZz7mJABCT95URsf0EUYWossUpX5wUPp+Ovw8LJIZTHre1Q1jARjdYyfkbmmo+wxjh
	ZuJsZaHQFaRJY/ZX+UzEugidL1iYY=
X-Google-Smtp-Source: AGHT+IGUDt91AX/gfqA+esgbGZHA/UWH5PuCIt9Li3OAP+swstK0dr06ncsL7+shSHuIIQvDB3Ev8Az3rrKZfbsR34E=
X-Received: by 2002:a05:6512:234f:b0:545:2335:6597 with SMTP id
 2adb3069b0e04-54523356662mr1123966e87.50.1739525059992; Fri, 14 Feb 2025
 01:24:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-gpio-set-retval-v1-1-52d3d613d7d3@linaro.org> <202502122100.xnayNYRg-lkp@intel.com>
In-Reply-To: <202502122100.xnayNYRg-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Feb 2025 10:24:04 +0100
X-Gm-Features: AWEUYZnytm-QCDvAabJim0UZlwAP-rQOF8SM5edVp_VVYpTnUbDflnVYBXLdH74
Message-ID: <CAMRc=Md8ZYB7o_2bEctdaNsHfaVX0YANGWoQ_-6eZi7AfD6KDw@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpiolib: make value setters have return values
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 2:58=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on df5d6180169ae06a2eac57e33b077ad6f6252440]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewsk=
i/gpiolib-make-value-setters-have-return-values/20250211-201426
> base:   df5d6180169ae06a2eac57e33b077ad6f6252440
> patch link:    https://lore.kernel.org/r/20250211-gpio-set-retval-v1-1-52=
d3d613d7d3%40linaro.org
> patch subject: [PATCH 01/14] gpiolib: make value setters have return valu=
es
> config: sparc-randconfig-002-20250212 (https://download.01.org/0day-ci/ar=
chive/20250212/202502122100.xnayNYRg-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250212/202502122100.xnayNYRg-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502122100.xnayNYRg-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/leds/leds-aw200xx.c: In function 'aw200xx_disable':
> >> drivers/leds/leds-aw200xx.c:382:16: error: 'return' with a value, in f=
unction returning void [-Wreturn-mismatch]
>      382 |         return gpiod_set_value_cansleep(chip->hwen, 0);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/leds/leds-aw200xx.c:380:13: note: declared here
>      380 | static void aw200xx_disable(const struct aw200xx *const chip)
>          |             ^~~~~~~~~~~~~~~
>
>
> vim +/return +382 drivers/leds/leds-aw200xx.c
>
> d882762f7950c3d Dmitry Rokosov 2023-11-25  379
> d882762f7950c3d Dmitry Rokosov 2023-11-25  380  static void aw200xx_disab=
le(const struct aw200xx *const chip)
> d882762f7950c3d Dmitry Rokosov 2023-11-25  381  {
> d882762f7950c3d Dmitry Rokosov 2023-11-25 @382          return gpiod_set_=
value_cansleep(chip->hwen, 0);
> d882762f7950c3d Dmitry Rokosov 2023-11-25  383  }
> d882762f7950c3d Dmitry Rokosov 2023-11-25  384
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

These issues will be fixed once
https://lore.kernel.org/lkml/20250212085918.6902-1-brgl@bgdev.pl/ is
in tree.

Bart

