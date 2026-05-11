Return-Path: <linux-gpio+bounces-36516-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pvO9GRCYAWomfgEAu9opvQ
	(envelope-from <linux-gpio+bounces-36516-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:49:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A23A50A515
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00B003002E5B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 08:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094383BAD80;
	Mon, 11 May 2026 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkFL70sk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEB03B3886
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489313; cv=none; b=aqdCUVKzlg7r4yTFR9Dp4tygBy3OyxPeItPEa05YibmQ0DOUG1dxtHZJsZ4kB/C8vQ5Spf+DGpPbaxAuPw+xx/JzW+K2mznEjBSnpCF25u2KgwsB0GY6pQUSKE0vf/3e7BBzh6mihLGfWUI2Li9P5y4aAbE4UueMI7EowLyHB/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489313; c=relaxed/simple;
	bh=FS9Vcj76U9RM5XIubOjoexo/Q66e6Qb8ezAJTR8qo6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/9bg+4mTCOcjQxQDkiW54Bjge9JMl+9uv9vr9zDM+a0UbU6i7oKgVuJhFia0wo+cDRJibDM2lEOokGV/MoDGS4L+Y7jrRnM230WvLmssls7V0Ugi65L8hfFagHBT+g7P+EPrLpDvld1yG8WDMuJ832Xlm4iGF4hCa4HARNYSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkFL70sk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AC8C2BD00
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778489313;
	bh=FS9Vcj76U9RM5XIubOjoexo/Q66e6Qb8ezAJTR8qo6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BkFL70skeyMsxsAPovmmjWva/uA7ul3y+pIyc0IbC5Z6jp+X3h/7vsK1rfwOWZwPg
	 yyof2+cc+0ChQ2ZmGzBckVM4Lho265t0+jpyzOhL0Z85yUbVdXmfJmgY+XWgfVuLx2
	 XSMQHZ1SPx0FS7PtT6I/Kxdzu1DH/0TiUQvlV1AXSKc5p5bPkLemRqecW64jPWpgUX
	 zorFbUkVKMMpZZClvBqYJNyNSAFy401fOr/YeNklUYQUHH0RP2e73Asc+fHm7CsYUZ
	 lMVq0GCD6y86ofaHEztAM0IGwcsCFYuAtc+pTYuzFC128zk8vnCp1QfpB695rL+9Jg
	 uZ3GOxabECP7A==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a86bfa2a4eso4663865e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 01:48:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ae85M33dVf6B01ey4prGA+P7Q/Y0r8kwVynL0nDFgg8JkDq9isrynLmSPdIWjCdK3n2hkhxtv1qsv@vger.kernel.org
X-Gm-Message-State: AOJu0YxcRfLCM9XsR/muuRmKu5Xlxp/j9LjUR2XS2k/sPIJRG2F+ejj/
	3zUhxZ5vq1hAQjJ/+Ef9N8yuxbk7zu6umEhbXfpLRhadobIdqpaCmA4JDqk05wj0Zqemio4KwyM
	hKpQxGwXtZG5AsT0oupyT3+LHlaq4dTw=
X-Received: by 2002:a05:6512:304b:b0:5a8:6e64:a932 with SMTP id
 2adb3069b0e04-5a887cea7efmr9393309e87.32.1778489312120; Mon, 11 May 2026
 01:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com> <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com>
In-Reply-To: <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 10:48:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jgw80MuyK4ZGcKlHCdHrHAFZ3YKz8oTwazlDM_Kdt2Svy6qUsv6clMxog
Message-ID: <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1A23A50A515
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36516-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 11:07=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

>I don't think the current driver is a good fit for
> a full gpio-regmap conversion. Direction and GPIO mux are
> handled through MSCR/pinctrl state (IBE/OBE/SSS), and the GPIO
> logic spans multiple register regions across two SIUL2 instances.

I don't see the problem with that?

> A conversion would require stronger separation between
> GPIO and pinctrl, leaving mux restoration entirely
> to the pinctrl subsystem.

Why is that so? Sorry I don't get the problem here.

The pinmux operations have these callbacks:

static const struct pinmux_ops s32_pmx_ops =3D {
(...)
        .gpio_request_enable =3D s32_pmx_gpio_request_enable,
        .gpio_disable_free =3D s32_pmx_gpio_disable_free,
        .gpio_set_direction =3D s32_pmx_gpio_set_direction,
};

So to me it looks like the pinctrl subsystem is *already*
handling all the muxing of GPIO lines in these
callbacks?

> Would it be reasonable to keep the current approach for now
> and revisit gpio-regmap later if needed?

I'd prefer that you look into it now while you already
have all the information at hand and fresh in your mind.

You can forward my comments to your project lead
/ JIRA instance and say it's Linus' fault you have to spend
more time on this right now.

Yours,
Linus Walleij

