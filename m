Return-Path: <linux-gpio+bounces-27382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C9BF6BD5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 15:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29084423BB6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950E932E739;
	Tue, 21 Oct 2025 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gvtcVUcf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C585A242D7C
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053009; cv=none; b=daWHquP/wmIkKJauNLuC+iuuYYgaFjS5aN++M8DSAPwRllf3p7HmHxbfm8uuvtlEmgNofd+wUoF3nsd94AGAHY34CmpGgDCFagVEZ9EEV0Lf4BGBRt5hRfl/ajPfgQxROuFdf90a4uY5TFRJppl27MILCe7T73uF9/NlS9Uwdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053009; c=relaxed/simple;
	bh=toIUqLwZmZCeEPECiVK0Wft2nR4FGOf4cwcze/4k3QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=We9InYvQsQZs6yb36lJqS8Toq7Mo8uFrdYw5dXqBjhc9mWsfxAvVkPQlrhaTIAeS1CzCDD0wivWrsKe8AbvZ0pPhlZ82SMQ3nE7OWINH81Xf8vwrhy+va4SBD6ca69mlJtcKd1IVtk/p5mGx+x6aQF7nndDWNGXnDOyL/g46t14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gvtcVUcf; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57992ba129eso6511315e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761053006; x=1761657806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=910slYD1qTlLwbdq4G7OKDCvXpMS39lt//h4Hrqd+P8=;
        b=gvtcVUcfdWKkCuC0Ads1TtDQYGawVkIpkoK82GbvFPCnYAZcpomy+DRFK7620y8dqS
         ZBC7MRs37UthNPg/lX53VnUi+BTUoCZO1Ryg8PztYa9WQ24B1K4T5vPedk01h31XgAWv
         lX8DOnlNdvZTSwkUZP5MuRXqyd0WyRmPvAhaq1Uc4e+Tdx5pWubNbtsp46jElgIFpAvl
         S3f1Dqa8C9Q5BgQXjtihnJq/GFKr7QfqcvTE7HkLE3ymXfVjSYS+XwAVb4ySD0WD8dCn
         YLVgtaA42Df2KscQpmw3OAWpHZcJBD/P/8/n62tR57mUH9ZEXkXHQa17Kuzs7Xyd3HeF
         4vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053006; x=1761657806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=910slYD1qTlLwbdq4G7OKDCvXpMS39lt//h4Hrqd+P8=;
        b=GeATOVVdYQU7j0zVZw5lqc/XsTXdBa9K6hYPTGNKEm81sZTAcg85G73md3/QaVkWfl
         TTRzGNzDmXsBPX1PINTE9PH75jvPk8yeYxxMWU8oR3yI7R4sxtyvMZgBJcBrv4n/5uMa
         B0jr2eq8EC4jndiBOxa4TTB4+hUxSg0E5qcdkyIhplV4C4C9QN+IQFKVuEa+masNd2wF
         w+Xp8CnuZf+2lXgJHdMc2bmEjaaFOSpIoRd7MhtJ5cxgQtc+g8kJcixj3Uc49XJNmTEj
         PKZujO/Ztt0ulPTlPg4YnpnQmV9w9Bwwh2enJlib3Erxjk+wa9be9ON81NDsUpE4qjvv
         6Y0w==
X-Forwarded-Encrypted: i=1; AJvYcCVL8WeCHvV7eWPsinhoxnJPi8ER8ZI+CqZLDaxBy5acWZkx5s+x8KCzBO4z0m1mJD+9SLmui7NURCQh@vger.kernel.org
X-Gm-Message-State: AOJu0YxBS+U/rUGY3TBDoYhqmrOtDgVIE4GqO3fRUtMYeXwtP1KYSyWE
	K/YsjGWxBo40rh5pBSqgpqp5s6w9IQ1bEXlSNfM2max86sLSldpKO4A7N5deknUvTCGGNmRilyR
	M5owvUQfBUqoPxsg5+ZZosDvV/hxK7tThNuIbOaNgcEG6nDycHxC2ANQ=
X-Gm-Gg: ASbGnctPd7YW4FMIiaOEZlurdt6YMHhHNVw0LUgpiLuvokZ2AYjBoZayHxCYkkkRNcb
	PF9wmf1eqZd9CN7/pmfpJsVE8CxNPWTOLP4/ut2uq4dZ/aeVmiklh+XHzsWZuKOL/uZuWuVrdl5
	PDVmx9yJLd71g7VdKyHROJlOXQW62vm1MESz0YY2KhhJC9vFaD50NP1JEE8JcK1V3j35a9iPA3c
	edHdmEg4qOyykqDSoWeDBIqdiRsanHG900W0qplGHWCOiPsV2jiUKY2cQBTKOcMum1VmcX3oV7J
	l8bnThLYdmz8+a6iC3gfcjkdLt4=
X-Google-Smtp-Source: AGHT+IGYI3DqQ4zbbJwUL/CeEWraJs+dfp7z45elyhO+pIXAXZSVk+3PCJXiABvpRNO60LJmHCSehwXQMvZ1P8MMqAs=
X-Received: by 2002:a05:6512:3e27:b0:591:c2f8:9a5d with SMTP id
 2adb3069b0e04-591d8550757mr4491922e87.20.1761053005758; Tue, 21 Oct 2025
 06:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510212126.mVDMC2iC-lkp@intel.com>
In-Reply-To: <202510212126.mVDMC2iC-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 15:23:12 +0200
X-Gm-Features: AS18NWDgfASnhaZdFuEsT7SP1bRkacfbmrjWAZrTy9QrbqvoKCtL0cgU_vFcp7s
Message-ID: <CAMRc=MdTffE6Oh_n0AYBEdyccN6-5FffxDZp6u037Yz9Khj-bg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-current 3/3] drivers/gpio/gpio-idio-16.c:170:20:
 error: 'struct gpio_regmap_config' has no member named 'fixed_direction_output'
To: kernel test robot <lkp@intel.com>
Cc: William Breathitt Gray <wbg@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 3:17=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-current
> head:   0d3f95740ced3acb6171cdec8c5bef336b0cabdb
> commit: 0d3f95740ced3acb6171cdec8c5bef336b0cabdb [3/3] gpio: idio-16: Def=
ine fixed direction of the GPIO lines
> config: x86_64-buildonly-randconfig-005-20251021 (https://download.01.org=
/0day-ci/archive/20251021/202510212126.mVDMC2iC-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251021/202510212126.mVDMC2iC-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510212126.mVDMC2iC-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpio/gpio-idio-16.c: In function 'devm_idio_16_regmap_register=
':
> >> drivers/gpio/gpio-idio-16.c:170:20: error: 'struct gpio_regmap_config'=
 has no member named 'fixed_direction_output'
>      170 |         gpio_config.fixed_direction_output =3D fixed_direction=
_output;
>          |                    ^
>
>
> vim +170 drivers/gpio/gpio-idio-16.c
>

I removed the offending commit from my queue.

Bartosz

