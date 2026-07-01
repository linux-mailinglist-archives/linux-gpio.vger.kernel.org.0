Return-Path: <linux-gpio+bounces-39304-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /IguBPvrRGrv3AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39304-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:29:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F56EC26C
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:29:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bZdoysyy;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39304-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39304-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B9403002F8A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 10:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3CE41B36D;
	Wed,  1 Jul 2026 10:28:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2FE4218A3
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 10:28:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901717; cv=none; b=SvAS8oHSEsAbGmZLgjzOdUolWmw33HEEtCL2AjLlG7/XlFaTRN1vxhK3WRq0xEtF4rC8suolpuhChSpgt5lzEUVIzr1BxlnuLs4fZwyDmQg0vJHoEyf3WFUYnue3Au3Y3UnDf2eyAhRmfqQZwKvzEgItHwz6BAkdtNApwEnFoxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901717; c=relaxed/simple;
	bh=0AV4NrJc9Gh5gAcTi7iqFcNb2grT5WAw6b2kKXlKejI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSmCPjXV0Vmn+MKqEaPF74TW9EAMvEMpzjjNqa6peB99yCGBuWXZYcxPEaichDo9aApIzoH0ajS70gg9MNn1yIEWkh+dcdu8vzp83kihBahCz5gtTbVk3KPw7JDlAUkiFZVPP+Hx2g0pSmsKzwMM+iW6aDYSMQ1Do57aDX7VLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZdoysyy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776021F00ACA
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782901714;
	bh=dFB4Bp0YBQbqUpXC3NxsL0hV18fZ3rk9FR0tAgGa+/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bZdoysyy2AwRuTceUJvoZOL/a54sXju0V3+M5KCqODyfHx4KHWmATSxu7JqEhANNY
	 ds+DQ+QWVwMaPYit9Rhmzfn6G2KLkXwYr+s4wdfp0kUEQ855d0yIvs8zOyBlUjduHI
	 3b5rtwzj+JvIJ58Kj5V9LWPRuQn/ORN6voCKSUS04uslmBPf5Ui6DZJrii4/k7BpFX
	 7ZvnDWg8r4Ik/roEq+O8JaLkUxklpFWLVPaUijKuOMIOHmz/aDQ2d3wM1mswr3ZKmM
	 VvgBrzc7uF4b3s3tj46EZW6aqz0oJXf2ccrqW0qK785u0/a4hJIa9DiB3k0bPKrmvh
	 8Ecrf13lGbp2Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb6d00883so400782e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 03:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RryhYIFPfQH/Wp3TyfoEmd+jKKuc52EB56Sih0nI9NTzUvcKhOsuujsnnIG+EvPWt77/WuCexRIrx2l@vger.kernel.org
X-Gm-Message-State: AOJu0YyQtI2aqk4VoB8GvRclis81dMmBGsY25zTLeaMf55MiDujlqW0s
	EWznfSWkJSKbX9F40LbMWXgsB93+OYi/kjhkEnCw6gv9S9oPxxOKZK0Orgo74pcU9g2fXpgTbYU
	9+Lony8JwcT7GFtHO4zas8zO4ACbM7rE=
X-Received: by 2002:ac2:488b:0:b0:5ae:b7d4:b68 with SMTP id
 2adb3069b0e04-5aec801077dmr7489e87.2.1782901713165; Wed, 01 Jul 2026 03:28:33
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 12:28:19 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5YBkLz5YQ45cT3uVmBfVbCZ_cy8zAg1J-sqwzhVNN3w@mail.gmail.com>
X-Gm-Features: AVVi8Ce9zRwSC7YWDdpFS7YxJ1muCcN5kO1IIt7fv-PQnrz6ioPZPYbslWakb_g
Message-ID: <CAD++jL=5YBkLz5YQ45cT3uVmBfVbCZ_cy8zAg1J-sqwzhVNN3w@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] gpio: siul2-s32g2: add initial GPIO driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39304-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:khristineandreea.barbulescu@oss.nxp.com,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 936F56EC26C

Hi Khristine,

thanks for the updated patches!

On Tue, Jun 30, 2026 at 2:54=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> Andrei Stefanescu (2):
>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>   pinctrl: s32cc: implement GPIO functionality
>
> Khristine Andreea Barbulescu (4):
>   pinctrl: s32cc: add/fix some comments
>   pinctrl: s32cc: remove inline specifiers
>   dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources

I applied these 5 patches to the pin control tree.

>   arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
>     node

Please funnel this one through the SoC tree.

Yours,
Linus Walleij

