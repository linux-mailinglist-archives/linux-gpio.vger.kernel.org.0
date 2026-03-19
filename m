Return-Path: <linux-gpio+bounces-33806-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EkwC7XLu2leoQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33806-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 11:11:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7542C9471
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 11:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D8B3314F75C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 09:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCBC3B8BCA;
	Thu, 19 Mar 2026 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtHOi+Oy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9223B8939
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913270; cv=none; b=uxWsKKYfZr849xnQYLe8R9DyhK8Dapc6dJ70EOVa+15CnNp492wdGh/w6rJ+dBNxW0ZwY6ZA5p1iUKVDd/hUuYspOZ+GQYz236Hd2LFjFzAOPANr2pVffFuOfM4TA5vcV6NweHi4rPnnam9G5C1bZvqasF+OGxKB4cz/V0CKHso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913270; c=relaxed/simple;
	bh=L+2CLSUGEA2Ckm9TH7zcgHlvCCMmhogBXReJfJsa7q8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8lUx8r4v6fjE7jTO8JzOZHhPqHAjCp6gPxe44ZXxQM9D3lzSNtjpqmT+XglvWiGbC62xMR2YSJCdqFnniuQabVgZlDRqLxX5F4IBRle0JuOPFHkhk7c6yz0HHbanIDtLCdiKtn25kBtZqmYiQDY7d16r25NECPhcl6gcldkrYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtHOi+Oy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E868C2BCAF
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913270;
	bh=L+2CLSUGEA2Ckm9TH7zcgHlvCCMmhogBXReJfJsa7q8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=EtHOi+OyFKGuXPmfQJuPlSr1ASLC4UVc2hUUTfyJVY2McO+dkKJqI2Hi0Qt/qjEXE
	 jGCFx0H44Gv3hi+jPNTDRK/VCwIXPN6iAVAOz7FPPeXMabwlbExhDv/KOV+Jz+vBrD
	 rayG8OR9XbOdZIfUHpdmmSUHDXzDYGYsjNaH+imx8TX26PVe+Doxmcj6ddRwhyJ/QU
	 /oQz+4tSC0D9mU9b1cU51MuQTpfBesIsNIyH/cu5UQ8gsagITaYJTAZSsNgNn5+9g2
	 PhHq1vFmJyBNzogAziCRhP/cmbIQa1I4fngKZvoHk8yRedR0Sc3DULo4Et8sSRY4xc
	 HRQhuY+l3pjQA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a278b4c1a5so638172e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 02:41:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNo5VPses+WCMv+KNruE9HEhOS1VuLwqHGLvZLal0FYWjOUGpWKxOSBOd516OZ+3n94rqK46QGjBAV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1MQiC/iYwr0K64gR0pz3MfVdFArKQN2vXqQRo7KbxykADh1Fj
	SareW3tX9NR0b4XwWezUt52mDBEl373NvKvdrryvLrQcK1rkmLrD8kOffcYTvxfDkE6D3K9xlld
	wp3fcdOdJRnFJ8yZxG7FAe8b5Io6AzBN9jDfPTz8sUg==
X-Received: by 2002:a05:6512:14d:b0:5a1:74e3:203e with SMTP id
 2adb3069b0e04-5a2796b61d5mr2149784e87.41.1773913268798; Thu, 19 Mar 2026
 02:41:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Mar 2026 02:41:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Mar 2026 02:41:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ab009797-3b48-4568-8e80-b10a44b6fac1@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com> <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
 <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com> <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
 <d05d4468-84f7-4692-8381-e0742f1f2749@nvidia.com> <CAMRc=McY9dcDLXPM8-QErxzAJuoe1bxy8BX5H2y0uCHXJSsAwA@mail.gmail.com>
 <CAMRc=McMCMuyB7ETefXaWJ6K=-nPcDHo964WZKtPRU9XVVky_w@mail.gmail.com>
 <6ea1e467-b0d0-4ec7-90b5-740ca2415460@nvidia.com> <CAMRc=McGaF2XYedgy4n_RZzbHSBBZ2=EMvBEF4f8+ejLbu+CPQ@mail.gmail.com>
 <ab009797-3b48-4568-8e80-b10a44b6fac1@nvidia.com>
Date: Thu, 19 Mar 2026 02:41:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=MffhRN3bC0TpeNqe-8fMCeSc9wBMrDANS9mtFkipdsiUA@mail.gmail.com>
X-Gm-Features: AaiRm53ycnQ_hL1CML5-mXDPs4VyuWhAgTZ6marK4snCF3Mk0GRRCOdmKHyqHcI
Message-ID: <CAMRc=MffhRN3bC0TpeNqe-8fMCeSc9wBMrDANS9mtFkipdsiUA@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Jon Hunter <jonathanh@nvidia.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33806-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,nvidia.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B7542C9471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 20:09:08 +0100, Jon Hunter <jonathanh@nvidia.com> said:
>
>>>> Does this patch fix the real problem on the tegra board that you
>>>> reported initially? I doubt two separate GPIO keys, share the same pin
>>>> in real life.
>>>
>>> Yes it fixes the initial issue. However, now I am seeing a different
>>> error on the actual platform that is having the issue to begin with ...
>>>
>>
>> This is *with* the fix?
>
> Yes.
>
>>>    ------------[ cut here ]------------
>>>    WARNING: kernel/rcu/srcutree.c:757 at cleanup_srcu_struct+0xc0/0x1e0, CPU#2: kworker/u49:1/114
>>>    Modules linked in:
>>>    CPU: 2 UID: 0 PID: 114 Comm: kworker/u49:1 Not tainted 6.19.0-tegra #1 PREEMPT
>>>    Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS buildbrain-gcid-44496888 03/15/2026
>>>    Workqueue: events_unbound deferred_probe_work_func
>>>    pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>    pc : cleanup_srcu_struct+0xc0/0x1e0
>>>    lr : cleanup_srcu_struct+0xb4/0x1e0
>>>    sp : ffff800081cbb930
>>>    x29: ffff800081cbb930 x28: ffffd79ff96d0c40 x27: ffff000086059000
>>>    x26: 00000000fffffff0 x25: ffff000086571200 x24: ffffd79ff94adb10
>>>    x23: ffffd79ff86400c0 x22: ffff000086059390 x21: ffffd79ff94aa040
>>>    x20: 0000000000000000 x19: fffffdffbf669d40 x18: 00000000ffffffff
>>>    x17: 0000000000000000 x16: ffffd79ff62dc8a0 x15: 0081cf5fe0409838
>>>    x14: 0000000000000000 x13: 0000000000000272 x12: 0000000000000000
>>>    x11: 00000000000000c0 x10: f7c5d06d757a4b3a x9 : 15ccf89dfeffb5e1
>>>    x8 : ffff800081cbb8c8 x7 : 0000000000000000 x6 : 000000000151e960
>>>    x5 : 0800000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>>>    x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000004
>>>    Call trace:
>>>     cleanup_srcu_struct+0xc0/0x1e0 (P)
>>>     gpiochip_add_data_with_key+0x3dc/0xf68
>>>     devm_gpiochip_add_data_with_key+0x30/0x84
>>>     tegra186_gpio_probe+0x5e4/0x808
>>>     platform_probe+0x5c/0xb0
>>>     really_probe+0xbc/0x2b4
>>>     __driver_probe_device+0x78/0x134
>>>     driver_probe_device+0x3c/0x164
>>>     __device_attach_driver+0xc8/0x15c
>>>     bus_for_each_drv+0x88/0x100
>>>     __device_attach+0xa0/0x198
>>>     device_initial_probe+0x58/0x5c
>>>     bus_probe_device+0x38/0xbc
>>>     deferred_probe_work_func+0x88/0xc8
>>>     process_one_work+0x16c/0x3fc
>>>     worker_thread+0x2d8/0x3ec
>>>     kthread+0x144/0x22c
>>>     ret_from_fork+0x10/0x20
>>>    ---[ end trace 0000000000000000 ]---
>
> It seems that when the gpiochip_add_data_with_key(), then to avoid the
> above warning I needed to ...
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 27ea5bc9ed8a..3130acfeeb66 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1277,6 +1277,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>                  goto err_print_message;
>          }
>   err_cleanup_desc_srcu:
> +       synchronize_srcu(&gdev->desc_srcu);
>          cleanup_srcu_struct(&gdev->desc_srcu);
>   err_cleanup_gdev_srcu:
>          cleanup_srcu_struct(&gdev->srcu);
>

Hi Tzung-Bi, allow me to Cc you. It looks like someone takes the SRCU lock
during the call to gpiochip_add_data_with_key() and this is why the cleanup
path complains. Does it make sense to add this synchronize_srcu() call here?

>
>>>    gpiochip_add_data_with_key: GPIOs 512..675 (tegra234-gpio) failed to register, -16
>>>    tegra186-gpio 2200000.gpio: probe with driver tegra186-gpio failed with error -16
>
> Which leaves the above.
>
>> There's a change to how gpiochip_add_data_with_key() error path works in
>> linux-next at the moment but it's not in any stable branch yet.
>>
>
> This commit?
>
> 16fdabe143fc ("gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()")
>

Yes, I Cc'ed the author above.

>
>> -EBUSY can typically only happen if gpiod_request_commit() is called twice on
>> the same descriptor. Is that the case here?
>
> I have been looking at this today and now I can see that we have a
> 'gpio-hog' set for the same pins that are shared and hence it is
> getting request twice. If I drop the hog it goes away. This is a
> produce device-tree, not upstream, for some camera modules so I am
> wondering if we are doing something here we should not be. I am
> taking a closer look.
>

Ah, yes that definitely will not work. Hogs are taken first during the chip's
bringup and hogged lines will not be available to users. The error returned is
-EBUSY so it makes perfect sense and is expected.

Bart

