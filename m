Return-Path: <linux-gpio+bounces-30043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDA3CEE059
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 09:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDD4830062C2
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 08:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0965D2D5C7A;
	Fri,  2 Jan 2026 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbFDgp0i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52E13AD1C
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767343748; cv=none; b=lkQMDXsulJbIcSuPphTkLTbWoY+tugzijN7b82EStz1BYUcnEfEMaNuxWoKPDTjIVHCLDK5O5QIPHjOCH/pumcsgkZ4sN1jNM+KXqUiXXUJJmt6M07OX1rJrQ2xndT0g+puBYFQ1CzHAxZ+uSDJlrnygrMEi10yAlw0gu5c+BZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767343748; c=relaxed/simple;
	bh=8D7sRzFHxJYr9jf5bVRyhnYjmSJMi0sJzrIqioHHZNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNeNva8PYoqXf8rFV5aj2DUbwKbCJ3jQUt88R/cOzEpSge/39850IgIQhfZ9ggVJjChlzOtnpYUhikaXJKavP5fXgcifeOdsXzJyCc6e5DK6mBWz6Z/V6LlaMv2tH5U8Zq7Jq2T1R/e+UJFMSS3Y069JTb1gA+38sWfyGdoYqwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbFDgp0i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40518C116B1
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767343748;
	bh=8D7sRzFHxJYr9jf5bVRyhnYjmSJMi0sJzrIqioHHZNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AbFDgp0iT9wTrHKZyryIsWPGJ4VAKDWdMkEtz52XmlAroG7bxee8wMVbdUlpGqefZ
	 XnFgXEOex9azgKxGAnnOBm2pII3iFQSw33Unns0vTWWIZMvQOR5KQe7h6sb7jDFMaZ
	 N3l+PfPNq1Ia+CXtFcSx8IuzSyO/0qoWdCvDaLT8sZau82iBvHXMYLJInmJyeEuQ/g
	 2dPbKVSCdDfSRLTa9p1t9jMtODP+NJ/NHGXgs2N7zbTP+8MhP03mCCxrEmYnTzqW7e
	 1PBqdXLoVTHyCgQ//4lQ/Y9mdt9wBsG43TKoIqsCqvr/cMJWgtvovi6CcpWR0VjO88
	 JuU+5F5huSyxQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59581e32163so13864779e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 00:49:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbhySFVhA1iribTm2lqh/ydmVT4528AYC+x5E3s1GMTaHZxMnumsYqcSUBVpooLWLxsFrisVAafc28@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5oYQNNhD+7hPJX+jG6Ep/KaU/b+myCoMBT/MqrWof7Lg1CAzG
	sDZnBTM0MycJoa3aGSlW9xNUGUoCXSnJO4T6944fbKF/hvEa4fIAUbqyamwk5yP/xbdR5HxXt1r
	81kqyhIz7bQiJSeVj7T74tkr4TilNETxrxuJljdVSbg==
X-Google-Smtp-Source: AGHT+IHyD2RJMBMJQrb/t9v5WaL3Km/kJXlzIOViMTzIwY7CDHjZxxqd5+gDYb6qX5CJB+Bie1Ri4GIFnyfFk9ZYxYU=
X-Received: by 2002:a05:6512:b20:b0:595:9152:b932 with SMTP id
 2adb3069b0e04-59a17d66a53mr13917354e87.47.1767343746706; Fri, 02 Jan 2026
 00:49:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMVG2svCF06KF0e8MDCVGGjxP-FM16UE1Fip-toHUcVs-kqBQA@mail.gmail.com>
In-Reply-To: <CAMVG2svCF06KF0e8MDCVGGjxP-FM16UE1Fip-toHUcVs-kqBQA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 09:48:54 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfKMrP1-AUwi2HW7UHVrepG1_vqeK5o_Zysd1eTkO_bQw@mail.gmail.com>
X-Gm-Features: AQt7F2o2j286N10UcWch5qEYfPH_AnJdDalYkryhFNNQEgv1Syl4qhoRn0o-l2U
Message-ID: <CAMRc=MfKMrP1-AUwi2HW7UHVrepG1_vqeK5o_Zysd1eTkO_bQw@mail.gmail.com>
Subject: Re: [6.19-rc2 arm64] sleeping while atomic in gpiod_configure_flags
To: Daniel J Blueman <daniel@quora.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 8:18=E2=80=AFAM Daniel J Blueman <daniel@quora.org>=
 wrote:
>
> Hi Linus, Bartosz et al,
>
> When booting 6.19-rc2 [1, 2] with lockdep enabled on a Qualcomm X1
> Lenovo Slim7x ARM64 laptop, I am seeing mutex usage while atomic
> during gpiod driver registration:
>
> BUG: sleeping function called from invalid context at kernel/locking/mute=
x.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 170, name: kworker=
/u50:6
> preempt_count: 1, expected: 0
> 6 locks held by kworker/u50:6/170:
> #0: ffff000800206d48 ((wq_completion)events_unbound){+.+.}-{0:0}, at:
> process_one_work (kernel/workqueue.c:3232)
> #1: ffff8000824f3d90 (deferred_probe_work){+.+.}-{0:0}, at:
> process_one_work (kernel/workqueue.c:3233)
> #2: ffff0008059920e8 (&dev->mutex){....}-{4:4}, at: __device_attach
> (drivers/base/dd.c:1007)
> #3: ffff0008196a3ee8 (&gdev->srcu){.+.+}-{0:0}, at:
> gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2927)
> #4: ffff0008197434b8 (&shared_desc->spinlock){....}-{3:3}, at:
> gpio_shared_proxy_direction_output (drivers/gpio/gpiolib-shared.h:52
> (discriminator 7) drivers/gpio/gpio-shared-proxy.c:181 (discriminator
> 7)) gpio_shared_proxy
> #5: ffff000813758ee8 (&gdev->srcu){.+.+}-{0:0}, at:
> gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2927)
> irq event stamp: 117306
> hardirqs last enabled at (117305): _raw_spin_unlock_irqrestore
> (./arch/arm64/include/asm/alternative-macros.h:254
> ./arch/arm64/include/asm/cpufeature.h:809
> ./arch/arm64/include/asm/irqflags.h:192
> ./include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
> hardirqs last disabled at (117306): _raw_spin_lock_irqsave
> (./include/linux/spinlock_api_smp.h:108 (discriminator 7)
> kernel/locking/spinlock.c:162 (discriminator 7))
> softirqs last enabled at (117044): handle_softirqs
> (./arch/arm64/include/asm/current.h:19
> ./arch/arm64/include/asm/preempt.h:12 kernel/softirq.c:469
> kernel/softirq.c:650)
> softirqs last disabled at (117033): __do_softirq (kernel/softirq.c:657)
> CPU: 5 UID: 0 PID: 170 Comm: kworker/u50:6 Tainted: G  E 6.19.0-rc2 #4
> PREEMPTLAZY
> Tainted: [E]=3DUNSIGNED_MODULE
> Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN60WW 09/11/2025
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
> show_stack (arch/arm64/kernel/stacktrace.c:501) (C)
> dump_stack_lvl (lib/dump_stack.c:122)
> dump_stack (lib/dump_stack.c:130)
> __might_resched (kernel/sched/core.c:8828)
> __might_sleep (kernel/sched/core.c:8757)
> __mutex_lock (kernel/locking/mutex.c:593 kernel/locking/mutex.c:776)
> mutex_lock_nested (kernel/locking/mutex.c:829)
>  lpi_config_set (drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:296) pinctrl_lp=
ass_lpi
>  lpi_gpio_direction_output

Hi! The fix for that has been on the list for a while and I see Linus
just picked it up. Please see if this fixes the issue for you:

https://lore.kernel.org/all/20251126122219.25729-1-brgl@bgdev.pl/

Bart

