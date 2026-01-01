Return-Path: <linux-gpio+bounces-30026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 278B6CED130
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 15:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B9C53006A9A
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427F7283C9D;
	Thu,  1 Jan 2026 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi3veagk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EA4256C6C
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767278505; cv=none; b=Wdd8BR14CeiOfpkmkNFn9m3Iazw0AcTVFE47MIWdILx/c6uCW/Vv8DXV5jFxYJl9+pQ/5PJwXDZopLChv9iIXOpcQft5mtlX4p/CzkL37Z+NFJyaASmQ6CEkDIhaMpRdCL2NpA/yeO+Ia+9IWwvI6xVmfYndLijpQINH0Xy5pIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767278505; c=relaxed/simple;
	bh=dJEQV2YGvv7o/ctQTZAUhmFExWO2Fr9+sv8KayEHBaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqjDGCnUkTtc80Bs1l/tw9JUFNO3nAcmri0uioK5NjyhPusHL0F9/zkw5lENezWA6nS6gm6W45MRDsD5h7xBZJ1Zulm36u0M8qLApyaXOQ1odKvz3rBtIWacOsRcmaoASn0+elPbluq+i9uawmBG1I0myMpMx1fHhmfxeWFJlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bi3veagk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEBFC4CEF7
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767278504;
	bh=dJEQV2YGvv7o/ctQTZAUhmFExWO2Fr9+sv8KayEHBaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bi3veagkba+vEwkFYt8jC4pPx5Coog9PqRmTsdT5VS+IHdWMJdDcyMogY7mXuWW2U
	 RhcnHcVU0hTQFK3wlMmoRYoZhy24IVa3FomfBdCWWG0ay0vqG5YCUqSi246VNqswN6
	 atKsxWJY3BdcJGdnQC4BVSbfPmzsf9MyKF46S4cRIKWDtDjoDytZmsTp8eW7/u+tc3
	 DrC5HsJHqAUNnvOMxdlhLtDactKmqfwMbHRHU0fmcUqboZIqWTrXq98k/Utbq6kQb+
	 qwcLhIvdjnZcm1xVM3xIRWChyN5cwU6isHFBf1vEzakrACHko0aTvGMxme1/9brDGH
	 tTTJ6rjUMmvaw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-646d9eb45afso99408d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 06:41:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUO66SkRiYZVYMJMrgbUCCYD86PMLVjbVMeXJEgX5mtmpog7aymKaJIuBwjUN1C0Jxwjjw8cDIkDohA@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPyBDlSeJMtLXvrO92XQirgF8gOlrQ9M3I+LGu4slq7suPuyt
	4d/Ls/256zoR/kVd253LHCODY8qelNS2djVmBGeUQ/87PTPMBSh9o21KVVEG/D8pCppiRl4kXvA
	w6tNqrydlGd3D6j6T+8EC8tntkinv20o=
X-Google-Smtp-Source: AGHT+IHmrwEoOP6u+/a0w8PIwhMHQNADeKorFQgWLDEJntlKU7Pe3tGtvIAQIMxX5+0aSLYhi+EzKxwMOpkkjBdnd5Y=
X-Received: by 2002:a05:690e:1a08:b0:644:5bba:e497 with SMTP id
 956f58d0204a3-6466a871e61mr24599564d50.38.1767278503985; Thu, 01 Jan 2026
 06:41:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126122219.25729-1-brgl@bgdev.pl>
In-Reply-To: <20251126122219.25729-1-brgl@bgdev.pl>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 15:41:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLmr6jozEfBnui58jU=-vofTjCf5G6o+atF3G7mwe1HsXw@mail.gmail.com>
X-Gm-Features: AQt7F2ptEuUwF414E-nCJp2fFYY_udn9zodnxa6ml7MlAAMHSl34dMZA5xCA0DQ
Message-ID: <CAD++jLmr6jozEfBnui58jU=-vofTjCf5G6o+atF3G7mwe1HsXw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 1:22=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The gpio_chip settings in this driver say the controller can't sleep
> but it actually uses a mutex for synchronization. This triggers the
> following BUG():
>
> [    9.233659] BUG: sleeping function called from invalid context at kern=
el/locking/mutex.c:281
> [    9.233665] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 554=
, name: (udev-worker)
> [    9.233669] preempt_count: 1, expected: 0
> [    9.233673] RCU nest depth: 0, expected: 0
> [    9.233688] Tainted: [W]=3DWARN
> [    9.233690] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 2.10.1=
 05/20/2025
> [    9.233694] Call trace:
> [    9.233696]  show_stack+0x24/0x38 (C)
> [    9.233709]  dump_stack_lvl+0x40/0x88
> [    9.233716]  dump_stack+0x18/0x24
> [    9.233722]  __might_resched+0x148/0x160
> [    9.233731]  __might_sleep+0x38/0x98
> [    9.233736]  mutex_lock+0x30/0xd8
> [    9.233749]  lpi_config_set+0x2e8/0x3c8 [pinctrl_lpass_lpi]
> [    9.233757]  lpi_gpio_direction_output+0x58/0x90 [pinctrl_lpass_lpi]
> [    9.233761]  gpiod_direction_output_raw_commit+0x110/0x428
> [    9.233772]  gpiod_direction_output_nonotify+0x234/0x358
> [    9.233779]  gpiod_direction_output+0x38/0xd0
> [    9.233786]  gpio_shared_proxy_direction_output+0xb8/0x2a8 [gpio_share=
d_proxy]
> [    9.233792]  gpiod_direction_output_raw_commit+0x110/0x428
> [    9.233799]  gpiod_direction_output_nonotify+0x234/0x358
> [    9.233806]  gpiod_configure_flags+0x2c0/0x580
> [    9.233812]  gpiod_find_and_request+0x358/0x4f8
> [    9.233819]  gpiod_get_index+0x7c/0x98
> [    9.233826]  devm_gpiod_get+0x34/0xb0
> [    9.233829]  reset_gpio_probe+0x58/0x128 [reset_gpio]
> [    9.233836]  auxiliary_bus_probe+0xb0/0xf0
> [    9.233845]  really_probe+0x14c/0x450
> [    9.233853]  __driver_probe_device+0xb0/0x188
> [    9.233858]  driver_probe_device+0x4c/0x250
> [    9.233863]  __driver_attach+0xf8/0x2a0
> [    9.233868]  bus_for_each_dev+0xf8/0x158
> [    9.233872]  driver_attach+0x30/0x48
> [    9.233876]  bus_add_driver+0x158/0x2b8
> [    9.233880]  driver_register+0x74/0x118
> [    9.233886]  __auxiliary_driver_register+0x94/0xe8
> [    9.233893]  init_module+0x34/0xfd0 [reset_gpio]
> [    9.233898]  do_one_initcall+0xec/0x300
> [    9.233903]  do_init_module+0x64/0x260
> [    9.233910]  load_module+0x16c4/0x1900
> [    9.233915]  __arm64_sys_finit_module+0x24c/0x378
> [    9.233919]  invoke_syscall+0x4c/0xe8
> [    9.233925]  el0_svc_common+0x8c/0xf0
> [    9.233929]  do_el0_svc+0x28/0x40
> [    9.233934]  el0_svc+0x38/0x100
> [    9.233938]  el0t_64_sync_handler+0x84/0x130
> [    9.233943]  el0t_64_sync+0x17c/0x180
>
> Mark the controller as sleeping.
>
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver"=
)
> Cc: stable@vger.kernel.org
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/all/98c0f185-b0e0-49ea-896c-f3972dd011ca@=
packett.cool/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied for fixes, sorry for missing this. Probably due to mail
address switchover.

Yours,
Linus Walleij

