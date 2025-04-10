Return-Path: <linux-gpio+bounces-18621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9BA83B77
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88B5C172587
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 07:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094D21F7092;
	Thu, 10 Apr 2025 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H+GJ2HXT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C51F1932
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270864; cv=none; b=lSxUhelhkT7CrYB7JAXCmMkea+CV7TBwJflaD86U625tkRMHzR81Lb4ExVpNR7SoD4tlJPbZ7hKdV5ZFBpYdFpV3tVdTlQ8uLrE7IQZXcG5xZ08mgxPGMR1/jGmAcnXKTc3TietEMzfWEjkoBSarA1cRKmp/2bvxhdXhAAEM3lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270864; c=relaxed/simple;
	bh=ni0oIAGGnEHzUbLGkPF1Eh2YJyK+eXQpqb0to3WEHlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDBgO3bxDpw3j0j3v3jIqU564m4eyHSqF137GZOenPJDK2b3qOKOr5d8llCGPTeDPRiqtm6VfV8xknXKOJTEVRjz9H3M7CGUuBwWnEXdO2pgroipoKkSyBud02LkIlkmbjua2/rno2LI8oUaAS3Vk05jAUMjV8o1r7DBrHhMdaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H+GJ2HXT; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3061513d353so5469901fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 00:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744270861; x=1744875661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abln28vSs00yPYpNqKbQexZ2vOfOVw8mIqaX3hbLzPg=;
        b=H+GJ2HXTCpSKgD7pabT8H2VX3j2jdGfP44bF+NpnDO+KkGEupe0uu5jDosXpHu8M33
         p1B2dYWc5M++eSN1PvG+AoYXiCWESHJujbD8jvBeJN7jdk0mPwbTKK0MfGQAx7zjcja5
         X/vcH2YVwUeXZJLXNqIkeAiIjxfjypAJgyKq7rVL1h/UFusC/kZTN/dITg0+tooMnf7w
         IK5LchRgtS74sBH/uZwdV2u+4bhl7RXEiOT5rZyV/VmAL0V3W9+Hoc5WUzzB/zVg5qt1
         0bNrh/22DLPUOpb+y2Y+QZ90Vm+3pxrR2UM3fFqL8koxacODkFnttKo4hz78ZeMiC6es
         qN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270861; x=1744875661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abln28vSs00yPYpNqKbQexZ2vOfOVw8mIqaX3hbLzPg=;
        b=boLbnCve3Ro5yukeCi//jBbycCUVOGj46FchHtrlH0LTl+j4hfEbjoBYRthHoON7FO
         AmF8jSXCYm3zHw0lrtTfsjI5n6A2TCKDH8+IH+r1RrgmFU++K2KifYA3LBNDu3vR5ZQB
         LLKoSgbelxE5ap6Vt3Kd6MOGWqA69HkBdhEZ/OvgMDeuQREE5P6XrJLUoANKjKRJ/FcN
         i1Tb0jKEvT+dyzXQuA36Knc0R+gxu9r2ijYCpOY1s/Tgv8OkpMqtcCavT4LTUI0cs9zm
         mR2pZpBh+PA6hHKredulnRFtu01Kw0ySOOz+ypbm7ngCYaZUALVEthfoe6DJemJqRw92
         CoiA==
X-Forwarded-Encrypted: i=1; AJvYcCWRvbsTHujxubfVevbcaxCBHjb/s8QGbbK3Exj038Hd28Jiy1aU79okOpmnphXuBMBvmXSSffTp9UwO@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSlyL0bxaUBla/nbdckszkyqn0cegJLz81rgNlE27/wLlspEf
	0flSsVYiMZNb7/2W0Wk8xFnGR9/Yxf/zM4PWMO/A7hBe9IiyPFKvsgr60vJYZQnUZIirz2w5oGy
	Q57+T4uZxcoe0nPX4LKtDe58miR1ffntpDXkPvQ==
X-Gm-Gg: ASbGnctnG1aMsTEuiVuX0NKY4dvS2F0E0sioiGsHHa5gRhOiRQo/s/0e9qbYMdipCfQ
	aTsjY1pornUeDJJCeEszMaIeDYlpaH7aoWle0AKIn7G5zKNE6CfCvfpl7m04YmMIX7tLm4dVnaN
	CXryjP7bTl0O+mCZ31WN59XrDQlxcyJ6/z/vVW26TMPYW+NuLJ25ZtPmLR2e229ehC
X-Google-Smtp-Source: AGHT+IH5PI8f41X0hvTGTHZxcCz8ZXmi2rZvmUlakPAmNIx0w+gDOySuYq2drttiG7+Ajp3CrQ4F8hOHk0BBGH+SMNY=
X-Received: by 2002:a05:651c:12ca:b0:30c:2da3:1493 with SMTP id
 38308e7fff4ca-30facc1fb07mr6678671fa.19.1744270860523; Thu, 10 Apr 2025
 00:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504100718.3Ftgs2zL-lkp@intel.com>
In-Reply-To: <202504100718.3Ftgs2zL-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 09:40:49 +0200
X-Gm-Features: ATxdqUGumQROsZI_kX3-lMz2QpKRez23K5HAhR7PptUCEYb8cq0EtZgnCw4lEHc
Message-ID: <CAMRc=McmkAXSb3HDYFRHOakF_b8dN0ym1kacLz2Kj8B0FezBcw@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 13/18] ld.lld: error: relocation
 R_PPC_ADDR16_HA cannot be used against symbol 'vdso32_start'; recompile with -fPIC
To: kernel test robot <lkp@intel.com>
Cc: Koichiro Den <koichiro.den@canonical.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 2:02=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> head:   6d7f0c1103ef3935eb3f302d09af4ef9e85212a3
> commit: 86f162e73d2d81ef6d819c06a3b6c2fda77a79b8 [13/18] gpio: aggregator=
: introduce basic configfs interface
> config: powerpc-randconfig-003-20250410 (https://download.01.org/0day-ci/=
archive/20250410/202504100718.3Ftgs2zL-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 9=
2c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250410/202504100718.3Ftgs2zL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504100718.3Ftgs2zL-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbo=
l 'vdso32_start'; recompile with -fPIC
>    >>> defined in vmlinux.a(arch/powerpc/kernel/vdso32_wrapper.o)
>    >>> referenced by vdso.c
>    >>>               arch/powerpc/kernel/vdso.o:(arch_setup_additional_pa=
ges) in archive vmlinux.a
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for HOTPLUG_CPU
>    Depends on [n]: SMP [=3Dy] && (PPC_PSERIES [=3Dn] || PPC_PMAC [=3Dn] |=
| PPC_POWERNV [=3Dn] || FSL_SOC_BOOKE [=3Dn])
>    Selected by [y]:
>    - PM_SLEEP_SMP [=3Dy] && SMP [=3Dy] && (ARCH_SUSPEND_POSSIBLE [=3Dy] |=
| ARCH_HIBERNATION_POSSIBLE [=3Dy]) && PM_SLEEP [=3Dy]
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

This looks like a false-positive, it doesn't make sense for it to be
caused by the aggregator change.

Bart

