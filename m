Return-Path: <linux-gpio+bounces-39194-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U4zqBoKvQ2pafAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39194-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:58:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 284096E3E83
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:58:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=f2xJmmWK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39194-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39194-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D2DF30573F2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 11:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199D440627B;
	Tue, 30 Jun 2026 11:50:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EC140628A
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:50:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820243; cv=none; b=q6QGWUpbWxGtdBpXj7p8nWpM+FLbeaxLhkxquGqeYTsjrrHMCYP9I2BAEo5WXuIdLKjEBcuEFdHyZT1hJqW2d9ar/xWPulF3mqha85Yucn4A58uIyjY0T+tuFfwqJa3sXBOrfMSA5CtOocIwQd+lp7V9TJ97QowOOSjCLfY93iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820243; c=relaxed/simple;
	bh=dx0DW8TwqIygstJ9zMPWt3nkbLDwbpec4hVzREE2itU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GR+fHcSL6LsS8eSHrLscP/9OffQEjkOqOUn81jzcXFFl3tD0uBaTYeZ9pa+9s95/+6HeoYy3iLar5aUUd1ylkrIkAPFqOAlqRNyCtJxsT1g4YkCfsdY+LWTIJVwKYDg7wo/5qHgyG5MbfsK3Nlt2bCZFSixMc/1zNNt8tD9H6d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2xJmmWK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36D51F01561
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782820242;
	bh=dx0DW8TwqIygstJ9zMPWt3nkbLDwbpec4hVzREE2itU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f2xJmmWKuIP2NiDSfKQeZ2RRPUBZjoWc3ZpvEiuS6ykxSN7C7gbYGbAWWzpEgXp/W
	 vC2XOMQ4fs+yfzRTsFE2lkXBNQVw7xHPJc5VqE/dDXYubkWZ7JT+oMPkvA4UjycYS0
	 AI6x4Fj6bJmlUp0CUeWSfRbXf175fH9npSuQUNPeUzcA+mKONjzOm3MBlvoegOSP2U
	 IqwhjsTMPpNv1tapf3kfy89KvHDAR33tRtCYt8EkCzdRjomSR6KRdk3085sfLF4dnf
	 BPIktB6C5LHeuW50Zfyd0bRFui5Y3Zc6p0jr2ct1Pvcaz6tOqf1qhcjXdks5ojug/N
	 buEqpeIMJ/ujg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeae771c49so2484932e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 04:50:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoEp5hJDZLpl+Xz1tnC5e3zI99QlrR94po2Kxe9qpwBjfYG1TAafoax3orzHqkQ0zjuTyEFQwjnzrw2@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWOXfLEgUP2M9eEINEWZ7+4GZLwtLuYexQILWNPTmbMivgtE+
	fx879FAhBBIEPuCl1lxRMmY2WQsORvZxcK9CeloVrlUALpjKdT0VzLuCdVjrZaczCvUfXohejbA
	ybGk5nYzaN03mb+FF/bTKDXAQNOUjfvg=
X-Received: by 2002:a05:6512:3b96:b0:5ae:a9eb:c5bc with SMTP id
 2adb3069b0e04-5aec10cd2demr140406e87.54.1782820241366; Tue, 30 Jun 2026
 04:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:50:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL=S6vEgSW=V4gu4z=RtuvASNFUiofJb0X+fGYMqNQT7vQ@mail.gmail.com>
X-Gm-Features: AVVi8Cer80S6zjP7PzgocOgzwyDqIkAXmZBTd6RrIFp-jFbe4jJs8f0f-g9bRXQ
Message-ID: <CAD++jL=S6vEgSW=V4gu4z=RtuvASNFUiofJb0X+fGYMqNQT7vQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] gpio: siul2-s32g2: add initial GPIO driver
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39194-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 284096E3E83

On Wed, Jun 10, 2026 at 2:21=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> This patch series adds support for basic GPIO
> operations using gpio-regmap.

Sorry for my confused comment on jun 10, these patches all go to the
pinctrl subsystem so I should merge them.

Can you make a v12 based on v7.2-rc1 and I will apply them.
Pick up ACKs!

I will not apply the device tree patch, this will need to be queued
in the SoC tree.

Yours,
Linus Walleij

