Return-Path: <linux-gpio+bounces-30162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DA0CF4D6F
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 17:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35A0E303B468
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 16:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB732334C26;
	Mon,  5 Jan 2026 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8fI33zK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773BD33064C
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632036; cv=none; b=YgoN9HlkaySx0fAfsam8euK7U5ScF29SAGH/ymt4oVM6/HNCUeNNhw3+7TCU6/zReedJD+a4uym/ziEFi9FiigP6PA6x7xMWTQHdIob4slRHUKjAOY3qT4g0jmuqTNiSRDmgI/iAzFzKwHSYwsVCD+GKq9NVoxUW7cwYVUoMLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632036; c=relaxed/simple;
	bh=aRYFVduhpJkihL19WJQtRZygT2HrmJtpLyPlTDBDojc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NMEqEuB/ebkoabnywh1Fc2yvrrZilbSC056kSmNDQPg/QwN2OLHGzl6fgLC9c33NwGbSXXNQb7ew9yBIEzwwoPJHENjTWFUSCEOMr44rnZuGmn9vlO46Ev0H7ABH4Rjn0+Xe6A7HBZq5LWxvdaB5a4U1tR9RR+n/47+9W0Yh3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8fI33zK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33172C2BC86
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767632036;
	bh=aRYFVduhpJkihL19WJQtRZygT2HrmJtpLyPlTDBDojc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=O8fI33zKEMyexZuQvcoX2+puyzmducgs0H3U4Jh6AkoU7OG2d86rXx9mBh2v7jyyG
	 7ltj/bXDywsMra15AViC9hl1LCb6KB4CB9AHucpEG3GfJ96peCEiAKQV9TYnlFbRF7
	 LEm+jDKtmZoe3f6+0D877sVVtXTZdYAoNlg8lnInCI2cx//aA59L1oDbSUHH1rV/JF
	 To2H7euSvOG6k73MSfR9DiBbiqeMmUkCcAof4vYWkT8nnjO9BofAAtiOIL2X/+Yqcy
	 13akKR7Aerxe65sgS9qTX8GsDx9JVLaQUOGWyOspvw2bbq/Txopplzhl0NrkfnZa4C
	 yL70k1Tu0XXGA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-598efcf3a89so64543e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 08:53:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXf45L8ehcNb0l8vHzXS7XC/92pbXRz3JRwv0xTPan6AJ1gI1BPkSBI2SE/in16K5m9IhiL1sosSkwG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkk3x0HpnMfYmkCtAvWqoYQXvi6yZHdQhZqkuVeSWEWn8vQMk5
	wb9m0qqD8QMbvBXf3XrkFQpRRYrva3p+lp6Ob5EGgJQBka0a3JPyyMxjTPpzIPld5lMIx2hEsW6
	M2ruI8CwALeGuO/cUL9/MJMaEYjtqrwgNWbyMCjpuJQ==
X-Google-Smtp-Source: AGHT+IHqeINoFyW6+a9Gj0I4jB2+Rd2BP+ga3+DwWQTkds3pIMQs2BHf9qtGJAGSU4qVI79Fp3AHIqK0aWjQSyFPJfE=
X-Received: by 2002:a05:6512:1591:b0:598:ef97:36df with SMTP id
 2adb3069b0e04-59b652cfaa7mr104714e87.44.1767632034772; Mon, 05 Jan 2026
 08:53:54 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 08:53:53 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 08:53:53 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <9ce71b14-b058-4192-9562-99856a89af1d@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260105155232eucas1p1a0d0d603716267eacef8f57f7aa5e34f@eucas1p1.samsung.com>
 <20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com> <9ce71b14-b058-4192-9562-99856a89af1d@samsung.com>
Date: Mon, 5 Jan 2026 08:53:53 -0800
X-Gmail-Original-Message-ID: <CAMRc=McGaZBDQp2+4Q5G_qkKu_fPDxWwsoo3MujkZs70eBDqxQ@mail.gmail.com>
X-Gm-Features: AQt7F2oIcuLAIRdrYys1Md4vVZzaLmxF2DV2HaFKf1GOzT7xom653T1APSCm4yY
Message-ID: <CAMRc=McGaZBDQp2+4Q5G_qkKu_fPDxWwsoo3MujkZs70eBDqxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: shared: another set of small fixes
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Jan 2026 17:48:05 +0100, Marek Szyprowski
<m.szyprowski@samsung.com> said:
> On 05.01.2026 16:52, Bartosz Golaszewski wrote:
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>> ---
>> Bartosz Golaszewski (2):
>>        gpio: shared: assign the correct firmware node for reset-gpio use=
-case
>>        gpio: shared: fix a race condition
>>
>>   drivers/gpio/gpiolib-shared.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 19fb766a1e5ed5943a62fc671c09d45352a81b1d
>> change-id: 20260105-gpio-shared-fixes-40a8ec3b6b25
>
> Those patches indeed fixes some timing issues with the commit
> 49416483a953 ("gpio: shared: allow sharing a reset-gpios pin between
> reset-gpio and gpiolib"), but they also reveals another one. I've
> initially thought that this is a false positive and needs only a proper
> lockdep annotation, but some boards=C2=A0hang just after similar lockdep =
splat:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> WARNING: possible recursive locking detected
> 6.19.0-rc4-next-20260105+ #11974 Not tainted
> --------------------------------------------
> (udev-worker)/192 is trying to acquire lock:
> ffff000004c15098 (&ref->lock){+.+.}-{4:4}, at:
> gpio_shared_dev_is_reset_gpio+0xcc/0x234
>
> but task is already holding lock:
> ffff000004c15898 (&ref->lock){+.+.}-{4:4}, at:
> gpio_shared_add_proxy_lookup+0x98/0x228
>
> other info that might help us debug this:
>  =C2=A0Possible unsafe locking scenario:
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
>  =C2=A0 lock(&ref->lock);
>  =C2=A0 lock(&ref->lock);
>
>  =C2=A0*** DEADLOCK ***
>
>  =C2=A0May be due to missing lock nesting notation
>
> 3 locks held by (udev-worker)/192:
>  =C2=A0#0: ffff00000b3ad8e8 (&dev->mutex){....}-{4:4}, at:
> __driver_attach+0x90/0x1ac
>  =C2=A0#1: ffff8000830f2600 (gpio_devices_srcu){.+.+}-{0:0}, at:
> gpiod_find_and_request+0x0/0x574
>  =C2=A0#2: ffff000004c15898 (&ref->lock){+.+.}-{4:4}, at:
> gpio_shared_add_proxy_lookup+0x98/0x228
>

Ah this must be due to also trying to compare the ref to the base ref...

Could you try to add the following on top:

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 198951c4c80b..5f3b8bc4a4fc 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -378,6 +378,9 @@ static bool gpio_shared_dev_is_reset_gpio(struct
device *consumer,
 	 * arguments match the ones from this consumer's node.
 	 */
 	list_for_each_entry(real_ref, &entry->refs, list) {
+		if (real_ref =3D=3D ref)
+			continue;
+
 		guard(mutex)(&real_ref->lock);

 		if (!real_ref->fwnode)


If that works, I'll send a v2.

Bart

