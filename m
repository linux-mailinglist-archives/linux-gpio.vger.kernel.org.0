Return-Path: <linux-gpio+bounces-30098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49952CF0A13
	for <lists+linux-gpio@lfdr.de>; Sun, 04 Jan 2026 06:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33D0A300E4D0
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jan 2026 05:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CCA23EA97;
	Sun,  4 Jan 2026 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="rNC+G1ZG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6013FEE
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767505751; cv=none; b=BmMbhg3+lBdJd+6LYUbSE1nGnYTSMHQO8VRdQqVdqFzef9rsjG5nOnAya75pyx1gQ1cJkMXQtFExS3UxT3UobeSiSH8TESDtU0TPdUaBqLQRBU9enX19HH79iXcFWAsf2u9k4cM1Pq0wNkypvDiYMM+UEdYXodvVZoQnbhGvgOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767505751; c=relaxed/simple;
	bh=khGIApyVzbAeitP9rN8iax2OlWmz2mVdbcbTijcd/D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7tYgcCUgCUsupJmFawk1n7cIt2gPAabop9ZNsVjV3NhoPu0ccykO219wjEQuJLzrvsOt++o3HYSs0FUZX3QFsI6WAK9XjGgc86nM/SZHI3idaAvbzcuWLJrocg+Dkhe/MWWbFExHHGMR7FaugpkwWxdDXtYZlOcprPnq7xeUs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=rNC+G1ZG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a1388cdac3so120480015ad.0
        for <linux-gpio@vger.kernel.org>; Sat, 03 Jan 2026 21:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1767505750; x=1768110550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTdIqaIlITxuggoCgpE3y4jOzrlnblQQZtWdbhXmAAI=;
        b=rNC+G1ZGTglVP5F9SkyghHDU6qZwd4TVz5MHIkyUi72C+wabneEZTgOhwETIo74nns
         hIR2c0s+tn1fCKX2SpHQkBG7c7TkzzzbXkD55UKE5YAOjUPJTUyWIhi/qCcyTloJJkat
         yUoxEkNKgjC4en60OgeCtNBc7W4HnNvXkoUKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767505750; x=1768110550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XTdIqaIlITxuggoCgpE3y4jOzrlnblQQZtWdbhXmAAI=;
        b=GoCEJaCfai08ixKlT06JCpR1LGjZms6cys4meaMYXKjTyal48yp2ueDWnkveVJI3bW
         pSCBn1ipEUd+BTptEYBpwTstNFzO9m1AkA2+f5b61IyoBIDnTqq35JFz6teDNskp7gLv
         h/NP8K8NJH3n8WgbRVi1cN/zadXDcqV65CQMFF5p0j6vH5eEGN3YfLygZs+TXUUlmWYW
         8LxfLWalfnqcvbzzVzMfJpqZroZgdzCQl5VZUQy68NoLNnBbeNBCydhAaCDZbV6DhEww
         2HH8pHNuqzmRiZrO1J4sAwgPSmI8jqORjUHnMaKek84BU0iwuDKmwWF+idil8lLhTxLK
         T1/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCGz83hxrxhsNv3dPMfaEb4p24TZujFuummz7l5E9l3ZKzLsYA1IbCmSCNt4XxLib8TlTJFkwnSzgD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Cqgl11TzSVLY/RRMU9q5D1mtPvS7HbGLzgf0qhfMasIBvR2P
	fJJlkPliK3hBrfo2tgXI1fJXufiwTG+lHorxaDjw5t6laN7yt7eOEhewd7tYcKZQzAhug4og5tU
	vUKFlLL1wRFUJjEgvZXA+BdqeZZXVtiJ3XCQKOGiQBNfkvA/rClFUa/M=
X-Gm-Gg: AY/fxX6uJ4sOJ1363LyvdiqPv05Lif0A//R0lsv0Be9twCSINas9ynNjZ6pvPMW7IQn
	0pOvVtFoLCVEp1GKe2W0Pa5kkosNRIN6PSoxGig2QhOWb9sZ2a2UVtmkR8SqIavaniZmVhYf18B
	t6y3w6GcTEKsBSUtKQrqVxhQ/GFS0AANsYiI/yTeKlbdQE8hAv5QNlfnv7BJVbFWv0URIPk/Y7U
	NwqNxotXsecrzxqIspJY3GpJ7vtwJB9+fVlnUZ25r5QXCpQT1MBVmQvKWK466amnPE65ITAMS6z
	Y1QCvuAOcJSib/rRkQ68JxEBu1QVIa63bQQj8MVVPhlMMEh/RRehRumgiDNNnGy803GCHB0EiQS
	fC2+5zvGzYVKX8cCSicOOdpz7oHfujb+bslEm7Uf6zXHHAKzytaWWMyhOCiY354vERyvdqytb1V
	TK4topHxlFmM7IaJU0QN3Cl/8nA0JtHN1burUS
X-Google-Smtp-Source: AGHT+IFN5TQVv4yL6WkxE94R0RDasET9ULp2oBPoTWhahijGToxbfpW8qqZ0rqM1oRYBZb3ngYVuSDERLKuqdqxoKXQ=
X-Received: by 2002:a17:902:e950:b0:29e:a615:f509 with SMTP id
 d9443c01a7336-2a2f2426e77mr386817645ad.17.1767505749628; Sat, 03 Jan 2026
 21:49:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMVG2svCF06KF0e8MDCVGGjxP-FM16UE1Fip-toHUcVs-kqBQA@mail.gmail.com>
 <CAMRc=MfKMrP1-AUwi2HW7UHVrepG1_vqeK5o_Zysd1eTkO_bQw@mail.gmail.com>
In-Reply-To: <CAMRc=MfKMrP1-AUwi2HW7UHVrepG1_vqeK5o_Zysd1eTkO_bQw@mail.gmail.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 4 Jan 2026 13:48:57 +0800
X-Gm-Features: AQt7F2r2G2wbt_l9e8tqPirUixaRTEPew8j3nsn7m2rqUYasmSgJFEfM6JzKzoI
Message-ID: <CAMVG2suxTXHL+d3Cd_u1w5taWKfG=1C6BVhpXgPNs58VzS88Uw@mail.gmail.com>
Subject: Re: [6.19-rc2 arm64] sleeping while atomic in gpiod_configure_flags
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Jan 2026 at 16:49, Bartosz Golaszewski <brgl@kernel.org> wrote:
>
> On Sun, Dec 28, 2025 at 8:18=E2=80=AFAM Daniel J Blueman <daniel@quora.or=
g> wrote:
> >
> > Hi Linus, Bartosz et al,
> >
> > When booting 6.19-rc2 [1, 2] with lockdep enabled on a Qualcomm X1
> > Lenovo Slim7x ARM64 laptop, I am seeing mutex usage while atomic
> > during gpiod driver registration:
> >
> > BUG: sleeping function called from invalid context at kernel/locking/mu=
tex.c:591
> > in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 170, name: kwork=
er/u50:6
> > preempt_count: 1, expected: 0
> > 6 locks held by kworker/u50:6/170:
> > #0: ffff000800206d48 ((wq_completion)events_unbound){+.+.}-{0:0}, at:
> > process_one_work (kernel/workqueue.c:3232)
> > #1: ffff8000824f3d90 (deferred_probe_work){+.+.}-{0:0}, at:
> > process_one_work (kernel/workqueue.c:3233)
> > #2: ffff0008059920e8 (&dev->mutex){....}-{4:4}, at: __device_attach
> > (drivers/base/dd.c:1007)
> > #3: ffff0008196a3ee8 (&gdev->srcu){.+.+}-{0:0}, at:
> > gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2927)
> > #4: ffff0008197434b8 (&shared_desc->spinlock){....}-{3:3}, at:
> > gpio_shared_proxy_direction_output (drivers/gpio/gpiolib-shared.h:52
> > (discriminator 7) drivers/gpio/gpio-shared-proxy.c:181 (discriminator
> > 7)) gpio_shared_proxy
> > #5: ffff000813758ee8 (&gdev->srcu){.+.+}-{0:0}, at:
> > gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2927)
> > irq event stamp: 117306
> > hardirqs last enabled at (117305): _raw_spin_unlock_irqrestore
> > (./arch/arm64/include/asm/alternative-macros.h:254
> > ./arch/arm64/include/asm/cpufeature.h:809
> > ./arch/arm64/include/asm/irqflags.h:192
> > ./include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
> > hardirqs last disabled at (117306): _raw_spin_lock_irqsave
> > (./include/linux/spinlock_api_smp.h:108 (discriminator 7)
> > kernel/locking/spinlock.c:162 (discriminator 7))
> > softirqs last enabled at (117044): handle_softirqs
> > (./arch/arm64/include/asm/current.h:19
> > ./arch/arm64/include/asm/preempt.h:12 kernel/softirq.c:469
> > kernel/softirq.c:650)
> > softirqs last disabled at (117033): __do_softirq (kernel/softirq.c:657)
> > CPU: 5 UID: 0 PID: 170 Comm: kworker/u50:6 Tainted: G  E 6.19.0-rc2 #4
> > PREEMPTLAZY
> > Tainted: [E]=3DUNSIGNED_MODULE
> > Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN60WW 09/11/2025
> > Workqueue: events_unbound deferred_probe_work_func
> > Call trace:
> > show_stack (arch/arm64/kernel/stacktrace.c:501) (C)
> > dump_stack_lvl (lib/dump_stack.c:122)
> > dump_stack (lib/dump_stack.c:130)
> > __might_resched (kernel/sched/core.c:8828)
> > __might_sleep (kernel/sched/core.c:8757)
> > __mutex_lock (kernel/locking/mutex.c:593 kernel/locking/mutex.c:776)
> > mutex_lock_nested (kernel/locking/mutex.c:829)
> >  lpi_config_set (drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:296) pinctrl_=
lpass_lpi
> >  lpi_gpio_direction_output
>
> Hi! The fix for that has been on the list for a while and I see Linus
> just picked it up. Please see if this fixes the issue for you:
>
> https://lore.kernel.org/all/20251126122219.25729-1-brgl@bgdev.pl/

Good catch; I find this addresses the lockdep warning and should be
introduced into 6.19-rc.

Tested-by: Daniel J Blueman <daniel@quora.org>
--=20
Daniel J Blueman

