Return-Path: <linux-gpio+bounces-33714-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKhBKoRgumnFUgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33714-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:21:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020B2B7CD8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 380B431A1F42
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C4837700A;
	Wed, 18 Mar 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOVQfejp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777036B07D
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821343; cv=none; b=rIdmMovDbvteQFjkyB3malTBdqnyl13ErQQLNFSA4LDECr3QaB3JtVKX3x9+LpnWJRsKEAuJuf89rJnjuvBInXUOqcqQhJvN7TPAOLoq6E9NVsTpjfIthDtWJJkS2F4u/Mvlf7gmg2RP967rMvNxtNBzbhhtdn7LWqhjVGUs3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821343; c=relaxed/simple;
	bh=LFA4eHbI62m3WvSv3qGl8TBwTFNzb4SAUlsJbVxVySI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7SGPw4NgVTF3yUodEa3Gu2K350UaAbnyRy+Pd/6Vihsn0Z+pABt5LLCBMVbOU3LOGzrP4RE/JOFhAJR5VnwGFFZL22MaFwz5GIC0e7m4XaaD7pUhBR7jgGYm/rDBGQTXMQQRJ4whei4q6Cnro9iHJtlQyvLacV6WuQOujwPsqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOVQfejp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E356DC4AF09
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773821342;
	bh=LFA4eHbI62m3WvSv3qGl8TBwTFNzb4SAUlsJbVxVySI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=bOVQfejph27ZEe/QMAFEnZztyXotpDa62kB5frpJDqA5kgseC9MO5GW2pPQEjvIAJ
	 rhWf48nCiplcGY0P9IzRy5am6BBMEihQj8uOqj/H+hBjjWATDFpBXcobwRwzQ9kxvc
	 GzTsGU8xUkL0WyOpB1Wb2UElMF5Qqi2rAZlbonjWDD7BkpFCnZHissObstTxEoimQy
	 CCLef7lMVVyuV2tN7VujE6Y+o8BAq9Q5ce1+0JLfIODnccGJDYX7NmTjSQmDn9KRa5
	 +qNgvqXWHA6lXwENwwGVYAUlQ4m60ejGNmYQ28l9d5HqX/I0nZmbA9r8MeMXLhAqy3
	 8hzNGvLi/Y3yw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so54338531fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 01:09:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqPrCjNTlFTEnl5YKPLZU7YbNMQh5sSs6HFgLhMA+2Ao9+knFFx36+sbPnYcNM6TL3czRYOVHn8jbm@vger.kernel.org
X-Gm-Message-State: AOJu0YwEuJqsZiWYUk17VM/lpSml++0QT4GhN0droKyAi/G2i5izMIyu
	fBvUE/XwSSOxbvmYfq7xlKr68KtldntnSGk5oXijfRUxv4YWCrdhrE5oR75NXuO/+kpQk4lta1G
	EE8MGlKPo6OaOQ/uo98VgSS7u7MtSdLStwL7ePZan4g==
X-Received: by 2002:a2e:98cd:0:b0:389:ff39:d36f with SMTP id
 38308e7fff4ca-38bd5780dd8mr7061231fa.8.1773821341490; Wed, 18 Mar 2026
 01:09:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Mar 2026 04:09:00 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Mar 2026 04:09:00 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <6ea1e467-b0d0-4ec7-90b5-740ca2415460@nvidia.com>
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
 <CAMRc=McMCMuyB7ETefXaWJ6K=-nPcDHo964WZKtPRU9XVVky_w@mail.gmail.com> <6ea1e467-b0d0-4ec7-90b5-740ca2415460@nvidia.com>
Date: Wed, 18 Mar 2026 04:09:00 -0400
X-Gmail-Original-Message-ID: <CAMRc=McGaF2XYedgy4n_RZzbHSBBZ2=EMvBEF4f8+ejLbu+CPQ@mail.gmail.com>
X-Gm-Features: AaiRm52wjSg-PM0UkMd3FiuGWl78mnFGnJu8WTrJKTnF4ZSFLRriE3c_f4QVH-w
Message-ID: <CAMRc=McGaF2XYedgy4n_RZzbHSBBZ2=EMvBEF4f8+ejLbu+CPQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33714-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4020B2B7CD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 23:46:55 +0100, Jon Hunter <jonathanh@nvidia.com> said:
>
> On 17/03/2026 15:19, Bartosz Golaszewski wrote:
>> On Tue, Mar 17, 2026 at 3:05=E2=80=AFPM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
>>>
>>> On Tue, Mar 17, 2026 at 2:47=E2=80=AFPM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
>>>>
>>>>
>>>>>> I am not sure if this is because these are child nodes of gpio-keys?
>>>>>> Obviously this is not a proper example, but something quick and dirt=
y
>>>>>> for local testing :-)
>>>>>>
>>>>>
>>>>> Let me create a setup with GPIO keys then.
>>>>
>>>> Thanks!
>>>> Jon
>>>>
>>>
>>> I can reproduce this with a gpio-keys setup. I think you hit an
>>> interesting corner-case where the consumer device is the same for two
>>> shared pins assigned to its child fwnodes. The setup doesn't make
>>> sense really but I guess this shouldn't just fail like that.
>>>
>>
>> So the problem goes like this: we're using lookup tables for shared
>> GPIOs but they are not capable of dealing with two fwnodes that are
>> children of the same device that share the same pin but are themselves
>> not attached to a device bound to a driver. While we could extend
>> lookup tables to take that into account, I think that the setup here
>> is so hypothetical, it doesn't really make sense to spend time on it.
>
> Makes sense.
>

Just to be clear, this:

	gpio-keys {
		compatible =3D "gpio-keys";

		key-one {
			label =3D "foo";
			gpios =3D <&gpio_sim0 10 0>;
			linux,input-type =3D <EV_KEY>;
			linux,code =3D <KEY_POWER>;
		};

		key-two {
			label =3D "bar";
			gpios =3D <&gpio_sim0 10 0>;
			linux,input-type =3D <EV_KEY>;
			linux,code =3D <KEY_POWER>;
		};
	};

doesn't work, but this:

	gpio-keys-1 {
		compatible =3D "gpio-keys";

		key-one {
			label =3D "foo";
			gpios =3D <&gpio_sim0 10 0>;
			linux,input-type =3D <EV_KEY>;
			linux,code =3D <KEY_POWER>;
		};
	};

	gpio-keys-2 {
		compatible =3D "gpio-keys";

		key-two {
			label =3D "bar";
			gpios =3D <&gpio_sim0 10 0>;
			linux,input-type =3D <EV_KEY>;
			linux,code =3D <KEY_POWER>;
		};
	};

does. I don't think making the former work is worth the effort.

>> Does this patch fix the real problem on the tegra board that you
>> reported initially? I doubt two separate GPIO keys, share the same pin
>> in real life.
>
> Yes it fixes the initial issue. However, now I am seeing a different
> error on the actual platform that is having the issue to begin with ...
>

This is *with* the fix?

>   ------------[ cut here ]------------
>   WARNING: kernel/rcu/srcutree.c:757 at cleanup_srcu_struct+0xc0/0x1e0, C=
PU#2: kworker/u49:1/114
>   Modules linked in:
>   CPU: 2 UID: 0 PID: 114 Comm: kworker/u49:1 Not tainted 6.19.0-tegra #1 =
PREEMPT
>   Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS=
 buildbrain-gcid-44496888 03/15/2026
>   Workqueue: events_unbound deferred_probe_work_func
>   pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>   pc : cleanup_srcu_struct+0xc0/0x1e0
>   lr : cleanup_srcu_struct+0xb4/0x1e0
>   sp : ffff800081cbb930
>   x29: ffff800081cbb930 x28: ffffd79ff96d0c40 x27: ffff000086059000
>   x26: 00000000fffffff0 x25: ffff000086571200 x24: ffffd79ff94adb10
>   x23: ffffd79ff86400c0 x22: ffff000086059390 x21: ffffd79ff94aa040
>   x20: 0000000000000000 x19: fffffdffbf669d40 x18: 00000000ffffffff
>   x17: 0000000000000000 x16: ffffd79ff62dc8a0 x15: 0081cf5fe0409838
>   x14: 0000000000000000 x13: 0000000000000272 x12: 0000000000000000
>   x11: 00000000000000c0 x10: f7c5d06d757a4b3a x9 : 15ccf89dfeffb5e1
>   x8 : ffff800081cbb8c8 x7 : 0000000000000000 x6 : 000000000151e960
>   x5 : 0800000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>   x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000004
>   Call trace:
>    cleanup_srcu_struct+0xc0/0x1e0 (P)
>    gpiochip_add_data_with_key+0x3dc/0xf68
>    devm_gpiochip_add_data_with_key+0x30/0x84
>    tegra186_gpio_probe+0x5e4/0x808
>    platform_probe+0x5c/0xb0
>    really_probe+0xbc/0x2b4
>    __driver_probe_device+0x78/0x134
>    driver_probe_device+0x3c/0x164
>    __device_attach_driver+0xc8/0x15c
>    bus_for_each_drv+0x88/0x100
>    __device_attach+0xa0/0x198
>    device_initial_probe+0x58/0x5c
>    bus_probe_device+0x38/0xbc
>    deferred_probe_work_func+0x88/0xc8
>    process_one_work+0x16c/0x3fc
>    worker_thread+0x2d8/0x3ec
>    kthread+0x144/0x22c
>    ret_from_fork+0x10/0x20
>   ---[ end trace 0000000000000000 ]---
>   gpiochip_add_data_with_key: GPIOs 512..675 (tegra234-gpio) failed to re=
gister, -16
>   tegra186-gpio 2200000.gpio: probe with driver tegra186-gpio failed with=
 error -16
>
> Note this is on top of a Linux v6.19 kernel I was using to track down the
> original problem.
>

There's a change to how gpiochip_add_data_with_key() error path works in
linux-next at the moment but it's not in any stable branch yet.

> Looking at the above there appears to be two other issues; one the warnin=
g from
> SRCU and the other an -EBUSY failure when registering the GPIO controller=
. I am
> guessing the warning is triggered when gpiochip_add_data_with_key fails. =
I need
> to look at this closer.
>

-EBUSY can typically only happen if gpiod_request_commit() is called twice =
on
the same descriptor. Is that the case here?

Bart

