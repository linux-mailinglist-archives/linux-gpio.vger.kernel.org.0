Return-Path: <linux-gpio+bounces-33222-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFGVK1FwsmmuMgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33222-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:50:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1376D26E762
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E090230DBEC5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 07:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28893B2FF1;
	Thu, 12 Mar 2026 07:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8L1Z5yy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA583B2FDE
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 07:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773301797; cv=none; b=ff9A+tYIG3NqIBGxClG/KtYWrHnpFUMow8HNvH91ykeNBiLFzljsRU5eK7FXq7JVI7H+XibVIfUfVNdPO7Z6VtgP4EQMZrDcXCcbZOpLT/n1a9Igc/qEXMTRmehJ4kAymwkhWvYf32cDB7mC0LLVXNuW2fsGW8zmc8dnvPEfGbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773301797; c=relaxed/simple;
	bh=6IYFfwHT7GC11o3ixg81r2Tdimt3C3w5aJTuLQpk1u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfSlq0wTxZUt+Wnv4V8GW3ZAnO8/R0Pvmh/fz3M8IQl3XFhrTJxtO/VtxCKIUUTIXkeCMLOjoPbWrfRijPo+W9NJzuIfLX5K+BK68yV/a+taWtBl1r7/d34H1cjd+wLuRXpei7ChPzAU7rPbvRiRHd3GhxXozopxasDZJWOZ8qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8L1Z5yy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE52C2BCB2
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773301797;
	bh=6IYFfwHT7GC11o3ixg81r2Tdimt3C3w5aJTuLQpk1u0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=C8L1Z5yyU7/3y6XMu4xoChtq8wlWQ+GGJKdFVfCKAmgzyOSNShiGjTjTpAzy8Dt0j
	 V/hZ9b8ZZFYIqtGDk7TpRgHXoo3u7+OFbXxjwACz3KUmb1Wiz3/CbQV3ow/dB/3JKR
	 4G2YIWU3BfWch60GFrR6WH7lIckK6FB7Nx33gEYMjHeQqfHa7vKYTFAUL8gaQEowlV
	 24lHqTfQXZYnpgs2kmVBoIIh2d/Pnmbl7vCJ0IZUhLvFxAeHToFpxn2wv0tS4YnO7Q
	 KMrlxXaCiqbPA90E3sct3jb2+q8ZHffzeQZJtg0CN0aJkZHL+S8Oe0deeIeeVbwbhm
	 ixeSjd43RwkZA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a153f2dff1so1730106e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 00:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU854yh4jy3Za9n466+U6XYPCRiwC7epsPhGKJxBI10dSDoE8HKIHi7ZVOkxyUaJGLm5PC03SbpLaET@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc6FKRamDvvBcf/mQRtogT7Sy6ixpcpSlUXhJCReCjNXGTQLgF
	yLWlJW3WWgAFGyHSCdcm8oxspxAjkZBShccuAMGqxxcKwI52xobQWqDfRMhiL58YyqOY0HpAM3m
	veJhrWQq4jg1TSSQI8ZNDDWFWFNIQ5bQ=
X-Received: by 2002:ac2:5687:0:b0:5a1:355d:674e with SMTP id
 2adb3069b0e04-5a15a2a0165mr773684e87.9.1773301795178; Thu, 12 Mar 2026
 00:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
 <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com> <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com>
In-Reply-To: <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Mar 2026 15:49:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
X-Gm-Features: AaiRm522PQSxl3c04smbSK8wNkblw48lRTJo1ov5ZP7oM8loD83ShDCNMBGhZgc
Message-ID: <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Jon Hunter <jonathanh@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33222-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com,bgdev.pl];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux-foundation.org,linaro.org,google.com,linuxfoundation.org,arm.com,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 1376D26E762
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 3:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 11/03/2026 20:14, Andy Shevchenko wrote:
> > On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> >> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> >
> > ...
> >
> >> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
> >> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
> >> are assigned a index by the kernel from 0-163, but these GPIOs are
> >> not contiguous with respect to the device-tree specifier.
> >
> > If I may ask...
> >
> > Why? Is it sparse because there are pads that can't be used as GPIOs?
>
> It is purely how the different port for the GPIO controller are
> configured in h/w ...
>
> static const struct tegra_gpio_port tegra234_main_ports[] =3D {
>          TEGRA234_MAIN_GPIO_PORT( A, 0, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( B, 0, 3, 1),
>          TEGRA234_MAIN_GPIO_PORT( C, 5, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT( D, 5, 2, 4),
>          TEGRA234_MAIN_GPIO_PORT( E, 5, 3, 8),
>          TEGRA234_MAIN_GPIO_PORT( F, 5, 4, 6),
>          TEGRA234_MAIN_GPIO_PORT( G, 4, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( H, 4, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT( I, 4, 2, 7),
>          TEGRA234_MAIN_GPIO_PORT( J, 5, 0, 6),
>          TEGRA234_MAIN_GPIO_PORT( K, 3, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( L, 3, 1, 4),
>          TEGRA234_MAIN_GPIO_PORT( M, 2, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( N, 2, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT( P, 2, 2, 8),
>          TEGRA234_MAIN_GPIO_PORT( Q, 2, 3, 8),
>          TEGRA234_MAIN_GPIO_PORT( R, 2, 4, 6),
>          TEGRA234_MAIN_GPIO_PORT( X, 1, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( Y, 1, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT( Z, 1, 2, 8),
>          TEGRA234_MAIN_GPIO_PORT(AC, 0, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT(AD, 0, 2, 4),
>          TEGRA234_MAIN_GPIO_PORT(AE, 3, 3, 2),
>          TEGRA234_MAIN_GPIO_PORT(AF, 3, 4, 4),
>          TEGRA234_MAIN_GPIO_PORT(AG, 3, 2, 8),
> };
>
> Each port can have upto 8 pins, but some don't. Note the last number in
> the column indicates the number of pins for a port.
>
> >> For example, in device-tree, if I have a shared-gpio with the
> >> following specifier ...
> >>
> >>    gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
> >>
> >> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 =3D 185.
> >
> > To me it sounds like a bad design of the driver for this SoC/platform.
>
> I am not sure why you think that. Assuming a 1:1 mapping of the kernel's
> GPIO index to the GPIO controller + h/w port + 1 GPIO number seems fragil=
e.

If the hardware has uneven number of actual pins for each bank, either
you end up using the deprecated static GPIO number allocation and
have holes in the GPIO range (sunxi currently does this), or you use
dynamic allocation, which gives you no holes in the GPIO range, but
not directly calculable mapping between DT and GPIO numbers.

The driver handles the mapping by providing an .xlate callback. A
consumer shouldn't assume anything. The shared GPIO library probably
shouldn't be try parsing the property itself and use the result to
grab the GPIO descriptor, but just rely on the gpiochip's .xlate
callback in some way.


ChenYu

