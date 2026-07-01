Return-Path: <linux-gpio+bounces-39276-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +oKAAxzGRGoW0woAu9opvQ
	(envelope-from <linux-gpio+bounces-39276-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:47:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA66EAD3D
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:47:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h82x9az8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39276-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39276-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAA743016811
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F433BBFDA;
	Wed,  1 Jul 2026 07:47:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A143B6BFA
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:47:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892050; cv=none; b=A8pYgFMR5KvU2nlRJOEVzQWMG60U0bOKeTAT4hIttSBdLRni83oGxtW7FdTRjw43R/xWxru3PgJKMBZsH+fcSedCggD02MqbJehcLVo3fnZgeVaij1VaC5HtCoOBIVB4ykl6k/xF2CB0u5X0Ra96q8VXpdXRw7/Bwo6f1koYyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892050; c=relaxed/simple;
	bh=tHD2yVEHzdy8DLtJ2/nbdi1VySk42Z1vfw6pJpAFCkI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjgI+oqDqtbFxSoEQtxNea1vZy6p9c/f8R7wK7sBelQXtv9sh5cRJMooAPyXBpa/8ZFWJQX1s01cjDTj5GoEynCCt/T2K/BOvAXfjrNKDBOzjM+3zCHuwHJmXWLr4ZZm3gBEWVeM8y1bRIZDbgi63v1e0Clq1osqqwyzLHbMsbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h82x9az8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D911F0155E
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892049;
	bh=tHD2yVEHzdy8DLtJ2/nbdi1VySk42Z1vfw6pJpAFCkI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=h82x9az808hfj76bX1Jwefwe1HGwMiLTYRyd6c4VCcLZHxsTgSb+wcy89/cSftH9D
	 dciBvozWO+CyVd16PUmy6KIJaiEBSDtu6CBHhe0aYZ/OWUgsCujdYPf6NK9OVl/BzA
	 EpwIgaCpgceo7sPvfk8znHmJ+7h87SdcxACsx9GV9R7DtWljXBsfYObqkX/cpL+CEZ
	 qnNewlfLC/P6seXHIACHaIcArCSlVN7mHLnTWQbWYy36WQdLYV1W8ue8VG0CoP0xSw
	 ETFdSNLQQ5vqcnrJgndEE1aqB69xkWjAGIKHZdubQyNhiOCsPH0bncOCuYX9DH7/H/
	 FeaCxWjbDSYFw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39b26e2ad5eso3316811fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:47:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8Ngq4PniyL2wGey/qqRcCkv3vQ+v4j39E6H7/ojUGhE3F7GdAodllNE8Xvdo4k2dtmBMJONZ2zwQp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxugph4NZGJwt8pjj8HFvPlJZEXdMEWQnhQn16v/TYGWOYaHlJa
	JBqWc+KQSBNOrKpFd5jTOD74PRhTqZ4BLq2OAcE0xg1fBA5jKM44Bepp4OsRfCaAjoNHRR7YV18
	2353dsA4InSmyoedfTYLIUMkh5AlgYUCYTDhOBPEe9g==
X-Received: by 2002:a2e:9a91:0:b0:396:7026:ad8d with SMTP id
 38308e7fff4ca-39b33fc828bmr866001fa.13.1782892048227; Wed, 01 Jul 2026
 00:47:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:47:26 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:47:26 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260630125403.546375-5-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com> <20260630125403.546375-5-khristineandreea.barbulescu@oss.nxp.com>
Date: Wed, 1 Jul 2026 03:47:26 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdknO+isf8BJGZG+VBiJZPC3J99DHcvdevQS5B1f1WHuQ@mail.gmail.com>
X-Gm-Features: AVVi8Ceyeil22X60y3yZsNCxMt7k2roX0DVloL4hTxIC87YuEmy8U3T4_KiZNnI
Message-ID: <CAMRc=MdknO+isf8BJGZG+VBiJZPC3J99DHcvdevQS5B1f1WHuQ@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] dt-bindings: pinctrl: s32g2-siul2: describe GPIO
 and EIRQ resources
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39276-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:khristineandreea.barbulescu@oss.nxp.com,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,pengutronix.de,linaro.org,kernel.org,bgdev.pl,gmail.com,suse.com,linuxfoundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56CA66EAD3D

On Tue, 30 Jun 2026 14:54:01 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Extend the S32G2 SIUL2 pinctrl binding to describe the GPIO data and
> external interrupt resources present in the same SIUL2 hardware block.
>
> Besides the MSCR and IMCR registers used for pin multiplexing and pad
> configuration, SIUL2 also contains PGPDO and PGPDI registers
> for GPIO data and EIRQ registers for external interrupt control.
>
> Add GPIO controller properties because the SIUL2 block also provides
> GPIO functionality, and gpio-ranges are needed to describe the
> mapping between GPIO lines and pin controller pins.
>
> Document the interrupt controller properties. The SIUL2 block
> contains EIRQ hardware as part of the same register space. IRQ support
> itself will be added in a follow-up patch series.
>
> Update the example accordingly to show the complete SIUL2 register
> layout, including the GPIO data and EIRQ register windows.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

