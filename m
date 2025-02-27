Return-Path: <linux-gpio+bounces-16671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677DA47737
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64BC816E642
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 08:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05781222577;
	Thu, 27 Feb 2025 07:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DW6MFINS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D86B221F08
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 07:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740643190; cv=none; b=ny4O54WSGTXW5028ErjSX9ZHGDeBIqDyMBOocGc0N1upttjHY1aS+Vm0k/bgcW8loeHwfWgr1K/8rgnZ+PEzqJukWHIiDY7GFXH9tVaEklhaKtg6c/aNIzLsqFqgEQCluNGu6PiSeM/KdF1gGtlgjFD1fZOzBH0s0m2HF4a7OIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740643190; c=relaxed/simple;
	bh=G4MyWz4/GvO33n5ea7JaoL6O5TM9l6SOTuJBHtEexoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1crGXjdLWKUmHx09s47i+pJGGNyZAT1EwXvp8+PYdQh8nqaur/7qI7z0lao+Id1hX+1kVEDqfZIO7fmyGBjF03mFxO6MNryLKRNvSQ+S+V1G2m8kPnAunQlSzwBUZGn0SONAiv5i93lEMKgaJ6oMuPW71thdxcQESpJYlNT4gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DW6MFINS; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6fb8de54da9so4412847b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 23:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740643188; x=1741247988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSc+079+8A2UaaEbdk2s1TkABylJ9XU2/wDzELRwQHM=;
        b=DW6MFINSB8Er5/9SfuUEVUupsozGcpkQTfmlhRlZXVpDk7p3UeEC6I+N3HsTKD7cyw
         FtSjMoYm2K2+lwIBfnWmmiX5aOIlOFTZxi6SYT66MMzTNSvUHV28jLPV/u0esd1c4bwZ
         FnZwSozm3jPDNT+8Hp1eSKT+ghkYqazgKvfmkKPKxgjc/dSYVJKMkCQikduWp2XB8BCK
         LS8Oakvpg+XwFcm8GsDixmsVj0H4zXUI8XjgDcbXWlnfvACqe7K/t8JiKfZEoCC9PL83
         hA4+0STZjH4bsPP4UgtEEPxXVby8N5JT+5fGqJOEgN50k8MYAvIvZFcuOEg3Qi+5G2gH
         hXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643188; x=1741247988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSc+079+8A2UaaEbdk2s1TkABylJ9XU2/wDzELRwQHM=;
        b=BqnlTjLEhnTULwOc6jJWM+IP2tGw4eQE9pgNhvE9lzQzvm4ZRSKjAPVApmLWnUwKmH
         eBiRfrIF4eyAFvWldzx/6pKCjLvz+ZijujGQb7UdKJUKrF5Gqc7jUVJQ1YY3SnVq3V4l
         ItaVYUSd5gKkfrBN7xFHxkEtgDGsbdYsrPmkhni7seai1Mku3pU10KsMAHis83SpEi+v
         EbnNGJUS6DyCPikvnTp8cNtC/av5xXGc1LUiMMWZ/MVn6vOcAUIHKxC0KZva4Hqmx9B4
         kRlTDUuiGJ1kuYENOaohDmGNIIxT5O6QWAOJ+9q9BzFS1KRWty5ZAgi10EzV0Z+g6Q1U
         WdeA==
X-Forwarded-Encrypted: i=1; AJvYcCWg3hu5aHV/faXgAtyBum10XSzV3TljV9RcIWfRSJgy5DW6Z8bvLe5QCiet5ElFdAdLD6ldR6ntVTTh@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ91sc4z4WidX2S7YLS0RfMbS+MQYeSyF33+oamGKfZZNvzytS
	5Ls2SBDrpULDvmehf5fzIYTsznglFeKyFUQVbDQ/Fou2rXm3aKAwfcP4mLmHD2EQUtN00jl78KO
	nJ99AgA9/b6SrfnGqeMSUtvAriRwO+6Nb1Pd+Vg==
X-Gm-Gg: ASbGncvxErU6UQw0yylkOtRdfB+kB+WFOC7F1BMUMfx57PLA0wJzMcir/j3SbCXnLsj
	P4kAojOKN44RSUyQNePQRiv1o9Kbty3W6xzSDe0eZXny7F8yL/Ovhh9M44j8LVaEAPY5pCfPotr
	vo7A65lntV6uIJfi+rRBd3+I7kjyFOLA3EAyayf3c=
X-Google-Smtp-Source: AGHT+IHVFYt2iVWqDyXx8Mvq/HZWoT02pDpPYRP6V8QTTL/psbz+obrHE062zj/fbkSbC2Zd+7nMGXcjVAVnYQYX01o=
X-Received: by 2002:a05:690c:62ca:b0:6f9:9e80:46bf with SMTP id
 00721157ae682-6fd10ac8628mr101291087b3.29.1740643187897; Wed, 26 Feb 2025
 23:59:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SJ1PR11MB612979B35DD84F5AFFB789D5B9C22@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB612979B35DD84F5AFFB789D5B9C22@SJ1PR11MB6129.namprd11.prod.outlook.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 27 Feb 2025 08:59:37 +0100
X-Gm-Features: AQ5f1Joh6_ZfrOfMFX8XG1ZiJZIZZWuoVmnN5jaDFgcX94OQDJBurWds9xxECBo
Message-ID: <CACMJSeseiRfAHQX0+vjL0DO+Xd-+RwW5rs4RkYHCfP6NKz2DLA@mail.gmail.com>
Subject: Re: Regression on linux-next (next-20250225)
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
	"Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Feb 2025 at 21:29, Borah, Chaitanya Kumar
<chaitanya.kumar.borah@intel.com> wrote:
>
> Hello Bartosz,
>
> Hope you are doing well. I am Chaitanya from the linux graphics team in I=
ntel.
>
> This mail is regarding a regression we are seeing in our CI runs[1] on li=
nux-next repository.
>
> Since the version next-20250225 [2], we are seeing the following regressi=
on
>
> `````````````````````````````````````````````````````````````````````````=
````````
> <4>[    8.483421] gpio gpiochip1: gpiochip_add_data_with_key: get_directi=
on failed: -22
> <4>[    8.483427] ------------[ cut here ]------------
> <4>[    8.483428] WARNING: CPU: 20 PID: 444 at drivers/gpio/gpiolib.c:349=
 gpiochip_get_direction+0x63/0x90
> <4>[    8.483430] Modules linked in: intel_ish_ipc(+) e1000e(+) spi_intel=
(+) i2c_smbus idma64(+) mei intel_ishtp realtek(+) processor_thermal_device=
_pci(+) processor_thermal_device processor_thermal_wt_hint video processor_=
thermal_rfim int3403_thermal intel_pmc_core(+) processor_thermal_rapl intel=
_rapl_common intel_vpu processor_thermal_wt_req ucsi_acpi(+) processor_ther=
mal_power_floor drm_shmem_helper pmt_telemetry processor_thermal_mbox pmt_c=
lass typec_ucsi int3400_thermal drm_kms_helper acpi_tad intel_hid int340x_t=
hermal_zone thunderbolt(+) acpi_thermal_rel intel_vsec typec pinctrl_meteor=
point(+) sparse_keymap wmi pinctrl_meteorlake acpi_pad dm_multipath msr nvm=
e_fabrics fuse efi_pstore nfnetlink ip_tables x_tables autofs4
> <4>[    8.483465] CPU: 20 UID: 0 PID: 444 Comm: (udev-worker) Tainted: G =
       W          6.14.0-rc4-next-20250225-next-20250225-g0226d0ce98a4+ #1
> <4>[    8.483467] Tainted: [W]=3DWARN
> <4>[    8.483467] Hardware name: Intel Corporation Arrow Lake Client Plat=
form/MTL-S UDIMM 2DPC EVCRB, BIOS MTLSFWI1.R00.4400.D85.2410100007 10/10/20=
24
> <4>[    8.483468] RIP: 0010:gpiochip_get_direction+0x63/0x90
> <4>[    8.483470] Code: f8 02 5d 0f 4d c2 31 d2 31 f6 31 ff c3 cc cc cc c=
c 48 8b 47 08 be ff ff ff ff 48 8d b8 c0 06 00 00 e8 31 2d 95 00 85 c0 75 b=
9 <0f> 0b 48 8b 43 38 48 85 c0 75 b7 0f 0b b8 a1 ff ff ff 5b 41 5c 5d
> <4>[    8.483472] RSP: 0018:ffffc9000206f590 EFLAGS: 00010246
> <4>[    8.483473] RAX: 0000000000000000 RBX: ffff8881087964d0 RCX: 000000=
0000000000
> <4>[    8.483474] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000=
0000000000
> <4>[    8.483476] RBP: ffffc9000206f5a0 R08: 0000000000000000 R09: 000000=
0000000000
> <4>[    8.483477] R10: 0000000000000000 R11: 0000000000000000 R12: 000000=
00000001a4
> <4>[    8.483478] R13: ffffffff87f39780 R14: ffff8881087964d0 R15: 000000=
00000001a4
> <4>[    8.483479] FS:  00007f4df7e6f8c0(0000) GS:ffff8888dbf09000(0000) k=
nlGS:0000000000000000
> <4>[    8.483480] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[    8.483481] CR2: 00007f4df8003966 CR3: 0000000118522005 CR4: 000000=
0000f70ef0
> <4>[    8.483482] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000=
0000000000
> <4>[    8.483483] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 000000=
0000000400
> <4>[    8.483484] PKRU: 55555554
> <4>[    8.483485] Call Trace:
> <4>[    8.483486]  <TASK>
> <4>[    8.483487]  ? show_regs+0x6c/0x80
> <4>[    8.483490]  ? __warn+0x93/0x1c0
> <4>[    8.483492]  ? gpiochip_get_direction+0x63/0x90
> `````````````````````````````````````````````````````````````````````````=
````````
> Detailed log can be found in [3].
>
> After bisecting the tree, the following patch [4] seems to be the first "=
bad"
> commit
>
> `````````````````````````````````````````````````````````````````````````=
````````````````````````````````
> commit e623c4303ed112a1fc20aec8427ba8407e2842e6
> Author: Bartosz Golaszewski mailto:bartosz.golaszewski@linaro.org
> Date:   Mon Feb 10 11:52:02 2025 +0100
>
>     gpiolib: sanitize the return value of gpio_chip::get_direction()
> `````````````````````````````````````````````````````````````````````````=
````````````````````````````````
>
> We also verified that if we revert the patch the issue is not seen.
>
> Could you please check why the patch causes this regression and provide a=
 fix if necessary?
>

Hi!

This is fixed in my tree and should be in next tomorrow, sorry for the trou=
ble.

Bartosz

