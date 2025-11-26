Return-Path: <linux-gpio+bounces-29086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2B9C8A5C8
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBD9F3A4576
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C656302CB4;
	Wed, 26 Nov 2025 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgLDZ5Mk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA2C2FDC43;
	Wed, 26 Nov 2025 14:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167704; cv=none; b=bNpeCsIt7mWPMyIMoo7esS8IAvrzkt49zbXpqmWZNF2iUVIYXP83s05IJs5N4KsLo9bsRau4lC1dJ62hIB2LmhltpYDveCbZeVwxj/9SJ97eqnMZKQVGwMfgWIoNV4aS6a2QdUuxcx6qGnR23HYjT4zZHk1UBMl283UYJ6w7K2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167704; c=relaxed/simple;
	bh=RJcquqx5TPhtK36n5JrIEPjAh0q7mdDtf12rAVAa08s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBDpDKJXiRUhPzLMLCS8r24h4pRm9g8OTukZrChSEju7CPsvBhYofBuxdgkEzZ+CC8jr4ZayeonkjGFzQNQ7Px1NW0m9jtsh7OSDveeK8Nk+VP4HIzhZO1W8qkPa5CwcbdUaV//0cc/5GmOsQB+P9pM19L5sJypQgs4BDt8r8DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgLDZ5Mk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70599C4CEF7;
	Wed, 26 Nov 2025 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764167704;
	bh=RJcquqx5TPhtK36n5JrIEPjAh0q7mdDtf12rAVAa08s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgLDZ5MkDXLJOUofojAvxH6u1vKqfS60KgDL3p9sdko1BT1jxi+Ydoph3mdXtH8q1
	 mSYRijK/A+4KZKugzD5aDygmEsGNubWUSkYZePsEHTlLrtm/GJuAmDYsBRd+wv0VS1
	 k1XMiSSnRwShwjuVkA2I8y3h8SS4Hp70o40ON5M12xfU4DzmVw4D+9au+0Pqi1vSMg
	 LxPEW5xpSR5tXO3NrIxm/MUagHSl2jpUtC+sYYVVJxat+RqRGoqeX9P82XEWA6Oni9
	 SjI7yrTnyAVS8V5O/rVpZo3+Rv3pSY25gapDQ02Va7pix89G1QlRUMPqycIXJzU1Mv
	 435PGlC7tuy6Q==
Date: Wed, 26 Nov 2025 08:40:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	stable@vger.kernel.org, Val Packett <val@packett.cool>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: mark the GPIO controller as
 sleeping
Message-ID: <gy6ycgcld2moccjjl7x7h72riwfm4ymhnkhlgau53fl4eu3e6q@qp5lrwx57jin>
References: <20251126122219.25729-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126122219.25729-1-brgl@bgdev.pl>

On Wed, Nov 26, 2025 at 01:22:19PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The gpio_chip settings in this driver say the controller can't sleep
> but it actually uses a mutex for synchronization. This triggers the
> following BUG():
> 
> [    9.233659] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:281
> [    9.233665] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 554, name: (udev-worker)
> [    9.233669] preempt_count: 1, expected: 0
> [    9.233673] RCU nest depth: 0, expected: 0
> [    9.233688] Tainted: [W]=WARN
> [    9.233690] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 2.10.1 05/20/2025
> [    9.233694] Call trace:
> [    9.233696]  show_stack+0x24/0x38 (C)
> [    9.233709]  dump_stack_lvl+0x40/0x88
> [    9.233716]  dump_stack+0x18/0x24
> [    9.233722]  __might_resched+0x148/0x160
> [    9.233731]  __might_sleep+0x38/0x98
> [    9.233736]  mutex_lock+0x30/0xd8

As far as I can see, this mutex only protects mmio accesses.

Is it preferable to mark the gpio chip can_sleep over replacing the
mutex with a non-sleep lock?

> [    9.233749]  lpi_config_set+0x2e8/0x3c8 [pinctrl_lpass_lpi]
> [    9.233757]  lpi_gpio_direction_output+0x58/0x90 [pinctrl_lpass_lpi]
> [    9.233761]  gpiod_direction_output_raw_commit+0x110/0x428
> [    9.233772]  gpiod_direction_output_nonotify+0x234/0x358
> [    9.233779]  gpiod_direction_output+0x38/0xd0
> [    9.233786]  gpio_shared_proxy_direction_output+0xb8/0x2a8 [gpio_shared_proxy]
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
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Cc: stable@vger.kernel.org
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/all/98c0f185-b0e0-49ea-896c-f3972dd011ca@packett.cool/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If we stick to the mutex, the patch LGTM 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 1c97ec44aa5ff..78212f9928430 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -498,7 +498,7 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>  	pctrl->chip.base = -1;
>  	pctrl->chip.ngpio = data->npins;
>  	pctrl->chip.label = dev_name(dev);
> -	pctrl->chip.can_sleep = false;
> +	pctrl->chip.can_sleep = true;
>  
>  	mutex_init(&pctrl->lock);
>  
> -- 
> 2.51.0
> 

