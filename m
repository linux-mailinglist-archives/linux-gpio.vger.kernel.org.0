Return-Path: <linux-gpio+bounces-33385-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMu5CN0dtGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33385-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:23:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234E284DD5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 075B3304C697
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2B339FCCD;
	Fri, 13 Mar 2026 14:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iddmFkQS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B299539EF2D
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411528; cv=none; b=EhrwgRJxXWR2oJpZh0Gz+T3QXuveiUpsZH5pjUcrXlk0U4+ng2QBUTDKXOaL0YZM6EaxCu0K0BzAGkFjLiA5xCRjHnOdtZFpmJWno6BrzMSMLnZdtKUGBO/LQLJS7YdAjZDyHIHaQ/OI0dpmmLeaqmWcrmNtAmQdZznDh76x31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411528; c=relaxed/simple;
	bh=fvTckkhnbMq7uwwzCGXCJrHYXs6JuZFgC85Jq5N7fRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LopN77ECaBxxODgwQz1AZQb7/aYXPhBZauNOMiBjV+6lnKf6+BXYvRjfIGGcGrlgDWRU7blVOQTPm134AAwQ6NY/BgEM53nlPEXxUYJwVs91Od/vWyBUKYN+D7A1ociU4sQq7I24hj3ycs55nWWu6qRU0mURvf/FpsOx+UIvccc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iddmFkQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371B4C2BCB4
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773411528;
	bh=fvTckkhnbMq7uwwzCGXCJrHYXs6JuZFgC85Jq5N7fRc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iddmFkQSvfDZ5tAUcQPT7ytL++/j+bt2pfQq6lR0Dr5BypBlOdttcfzqiR7LGccYs
	 ky+pNiZdDRvggvpMDrGrTPwK2lcMznUD/C99Ev2PwFxoU3oTIfCWTpo3XVRUbXPDcn
	 2pz6+dngu+lLbi0lptawYJrBGgKii+fMwwPoCK6DOw4aIvtJBrs6MZDQujb7o7e1M0
	 7fghieu/t+TkvLUPk6Te4rONoodESQT9v+zTG5ZC3E/wD1Y3jEXD+MuMpwQh1y1izl
	 NYW2a/MR3RY4Tyrlu6Hz5XUT/EQ6itr3vOoJ2E4/SaFBosL9Ry/ca653O67cirHcVB
	 sZJY6H4HaYHXA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a4118c4f7so24706191fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXfFceH4hcYAMNP1f4obMnYQzNNshBP7F+UG1O2VNj6EyfCmD/b6TZm0ExGHcnltOIyMnC9ppAUqd5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7YsKk+wxJFmUo5yWc2Y2koEM3jWX/aM0joeO1bD9CsaC3H2Gx
	001u8KBPdxzNVqpFIi2W2hsnKzOk6Ry9Wr5WHD9CE/6UlORAM50G+hMVv1GWIumoD3Fgg0Pbitf
	aoYXZduEXGeuuAPyWS41JNTVZIKQYQdbGOxpLcfDd6g==
X-Received: by 2002:a05:6512:6190:b0:5a1:444b:bcd1 with SMTP id
 2adb3069b0e04-5a162b0c218mr1375016e87.31.1773411526639; Fri, 13 Mar 2026
 07:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
 <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
 <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com> <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
In-Reply-To: <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 15:18:33 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfVUYm2KJPE0qr1++RU4tATSxEJu-Wz45AKf==OW0feoQ@mail.gmail.com>
X-Gm-Features: AaiRm5020hW7M7HXyH4EUOwtitIyz-fbkO8QSv1lOH4QtHUGeqFlIE81Bq7dwyM
Message-ID: <CAMRc=MfVUYm2KJPE0qr1++RU4tATSxEJu-Wz45AKf==OW0feoQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: wens@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,linux-foundation.org,linaro.org,google.com,linuxfoundation.org,arm.com,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-33385-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0234E284DD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 8:49=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Thu, Mar 12, 2026 at 3:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
> >
> >
> > On 11/03/2026 20:14, Andy Shevchenko wrote:
> > > On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Jon Hunter <jonathanh@nvidia.=
com> wrote:
> > >> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> > >
> > > ...
> > >
> > >> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
> > >> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
> > >> are assigned a index by the kernel from 0-163, but these GPIOs are
> > >> not contiguous with respect to the device-tree specifier.
> > >
> > > If I may ask...
> > >
> > > Why? Is it sparse because there are pads that can't be used as GPIOs?
> >
> > It is purely how the different port for the GPIO controller are
> > configured in h/w ...
> >
> > static const struct tegra_gpio_port tegra234_main_ports[] =3D {
> >          TEGRA234_MAIN_GPIO_PORT( A, 0, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( B, 0, 3, 1),
> >          TEGRA234_MAIN_GPIO_PORT( C, 5, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT( D, 5, 2, 4),
> >          TEGRA234_MAIN_GPIO_PORT( E, 5, 3, 8),
> >          TEGRA234_MAIN_GPIO_PORT( F, 5, 4, 6),
> >          TEGRA234_MAIN_GPIO_PORT( G, 4, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( H, 4, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT( I, 4, 2, 7),
> >          TEGRA234_MAIN_GPIO_PORT( J, 5, 0, 6),
> >          TEGRA234_MAIN_GPIO_PORT( K, 3, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( L, 3, 1, 4),
> >          TEGRA234_MAIN_GPIO_PORT( M, 2, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( N, 2, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT( P, 2, 2, 8),
> >          TEGRA234_MAIN_GPIO_PORT( Q, 2, 3, 8),
> >          TEGRA234_MAIN_GPIO_PORT( R, 2, 4, 6),
> >          TEGRA234_MAIN_GPIO_PORT( X, 1, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( Y, 1, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT( Z, 1, 2, 8),
> >          TEGRA234_MAIN_GPIO_PORT(AC, 0, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT(AD, 0, 2, 4),
> >          TEGRA234_MAIN_GPIO_PORT(AE, 3, 3, 2),
> >          TEGRA234_MAIN_GPIO_PORT(AF, 3, 4, 4),
> >          TEGRA234_MAIN_GPIO_PORT(AG, 3, 2, 8),
> > };
> >
> > Each port can have upto 8 pins, but some don't. Note the last number in
> > the column indicates the number of pins for a port.
> >
> > >> For example, in device-tree, if I have a shared-gpio with the
> > >> following specifier ...
> > >>
> > >>    gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
> > >>
> > >> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 =3D 18=
5.
> > >
> > > To me it sounds like a bad design of the driver for this SoC/platform=
.
> >
> > I am not sure why you think that. Assuming a 1:1 mapping of the kernel'=
s
> > GPIO index to the GPIO controller + h/w port + 1 GPIO number seems frag=
ile.
>
> If the hardware has uneven number of actual pins for each bank, either
> you end up using the deprecated static GPIO number allocation and
> have holes in the GPIO range (sunxi currently does this), or you use
> dynamic allocation, which gives you no holes in the GPIO range, but
> not directly calculable mapping between DT and GPIO numbers.
>
> The driver handles the mapping by providing an .xlate callback. A
> consumer shouldn't assume anything. The shared GPIO library probably
> shouldn't be try parsing the property itself and use the result to
> grab the GPIO descriptor, but just rely on the gpiochip's .xlate
> callback in some way.
>

Yes, it's a bug. I will fix it. Thanks for the report Jon.

Bart

