Return-Path: <linux-gpio+bounces-33639-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INROEitbuWnYAgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33639-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:46:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE42AB2BE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D7F83082BD6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86532D9EC4;
	Tue, 17 Mar 2026 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgZ368jM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8992D94AD
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755017; cv=none; b=kSyQtsTHFRlhUbREnvFXi0OvFSFkkoZIao4oNCAl82PSFzxpA/eBPyaaact2Umb+pMYTQFQRqZy1lgUA6AUbjFZdkfxALXgoVSU+bxXj+pYTiMVOQpg2J8/kUHhKVg08AOW/AEL1b48Mazp/f2zkIS9BGFcR/yalUj7OwxC22VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755017; c=relaxed/simple;
	bh=LIQ1nQKBD0fh4rJqCVTwGHt6/dnYlskLOFdEVDCh7WE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXQmfazxIJCVSutK8bNc3ssrV88mXDZkD2q0kFvROHq/JzsBKamMPGJHORDZeiVmeSlPesbH5Wh18b+/O992/1TN11tFAdrib/+qkqxzxRwwCnEgjfrWhSPpgrj8I/LR12AAZCRsQQ2sLqzba5O2cyq4bXOx6GPiql3NK8QtG9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgZ368jM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54143C4CEF7
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773755017;
	bh=LIQ1nQKBD0fh4rJqCVTwGHt6/dnYlskLOFdEVDCh7WE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tgZ368jMwOjayHh4215u0WOLnJDRbmeF+VKZZ8a92tWZVj8Aqp02r0UuAQ+xrji9o
	 qrjvI7CDq45thzFaABhFsXfWWhE/i2RKSTRsLJ9wc6bextwLfzt9F7ogD4wl87/HpR
	 UwTwlx9SB1BxHYhFJRkhyEe1x2k6SYVl/Yj2U4U+7zJAggTC78gmpu+ZSiS7Kog1X3
	 ZXCvtn1eWmsQ3RTpkNzYq3bO43XQUw23rn1uSj/dilqWZ4v4BevIo5+XIPVZXvgTmh
	 7T3I6Y/OXhN57NVwUIJSP6LNH54/uw86fKxQjQIgrsBorKKPUQPMqTSsRRudZOQzUQ
	 ck7d5Oa9ugv+g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a1362c9a3cso6157646e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 06:43:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUe304YVFUe+Dx5zHz3EDZavVwBNX4GFpjEap7KkZk4I0+yyiM5GIKovxraHKVFTgrTI+0QG7oggXW@vger.kernel.org
X-Gm-Message-State: AOJu0YwzAriG22rzdZTOw9hJ5rpxVMKq3ZtwBxantvCS2JxgzPnfgstZ
	CJEBP2bblVwYQAy1rHWv2f5IMqgaCob81cUan4TciqG52tOjAE1WiAzp3WtVTLLfZY7AaPCGhUq
	pKBQHHMs3bIp5z/nvTYpLi24aS1epELH2emTSK7mFwA==
X-Received: by 2002:a05:6512:2c8d:b0:5a1:3134:9bac with SMTP id
 2adb3069b0e04-5a162afc2a0mr6415684e87.28.1773755014929; Tue, 17 Mar 2026
 06:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com> <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
 <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com>
In-Reply-To: <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Mar 2026 14:43:21 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
X-Gm-Features: AaiRm520xzLuhJXPZpBhEdlwGDbYELLfeop0bzZLOUz5tYoBr5veXC5xFQNuXyQ
Message-ID: <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33639-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BEFE42AB2BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 1:53=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> >
> > I suppose this is not a reset-gpio-like use-case? Could you point me
> > to the DTS you're using? I've reproduced the bug with a dummy dts and
> > xlate function in gpio-sim and this patch fixes it but maybe I'm
> > missing something.
>
> So the board I originally observed this on is a farm board with camera
> hardware I don't have. So like you I started off reproducing locally
> with a dummy dts by making the following change ...
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi b/=
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
> index f6cad29355e6..5e62ffb425f4 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
> @@ -389,14 +389,14 @@ gpio-keys {
>
>                  key-force-recovery {
>                          label =3D "Force Recovery";
> -                       gpios =3D <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_AC=
TIVE_LOW>;
> +                       gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 2) GPIO_A=
CTIVE_LOW>;

The difference between my test and this is that I used foo-gpios vs
gpios here. I was thinking this would be the culprit but when I
changed my setup to replicate it, it works fine...

>                          linux,input-type =3D <EV_KEY>;
>                          linux,code =3D <BTN_1>;
>                  };
>
>                  key-power {
>                          label =3D "Power";
> -                       gpios =3D <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPI=
O_ACTIVE_LOW>;
> +                       gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 2) GPIO_A=
CTIVE_LOW>;
>                          linux,input-type =3D <EV_KEY>;
>                          linux,code =3D <KEY_POWER>;
>                          wakeup-event-action =3D <EV_ACT_ASSERTED>;
>
>
> With this I see ...
>
>   gpiolib_shared: GPIO 154 owned by tegra234-gpio is shared by multiple c=
onsumers
>   gpiolib_shared: Setting up a shared GPIO entry for key-force-recovery (=
con_id: '(none)')
>   gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shared.proxy.3 =
for GPIO device tegra234-gpio
>   gpiolib_shared: Setting up a shared GPIO entry for key-power (con_id: '=
(none)')
>   gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shared.proxy.4 =
for GPIO device tegra234-gpio

This looks correct.

>   ...
>   gpio-keys gpio-keys: error -ENXIO: Unable to determine IRQ# for button =
#0
>

Is the above error linked to the issue?

> I am not sure if this is because these are child nodes of gpio-keys?
> Obviously this is not a proper example, but something quick and dirty
> for local testing :-)
>

Let me create a setup with GPIO keys then.

Bart

