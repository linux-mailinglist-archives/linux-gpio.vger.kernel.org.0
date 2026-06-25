Return-Path: <linux-gpio+bounces-38873-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sQPRExPhPGrZtggAu9opvQ
	(envelope-from <linux-gpio+bounces-38873-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 10:04:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 992336C38EF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 10:04:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ijFmScwx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38873-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38873-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34971303583F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 08:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D280C2D97BA;
	Thu, 25 Jun 2026 08:04:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229E31ED7C
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 08:04:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374660; cv=none; b=bl4+NS6jI4OtfkDK1k8ZyIW+xOI9YcKSwX4939KQtBNgEd9s/o9xv40jheu1PZHou9fs3uuNDPeZXWYkzPjc/Aoi7NX4PgITWrgk8wIvdWhLKGsCugIqqEIT1s3iKxgjCcxLID2c3jhW21qO+PoRlM/32i9vcVA1IPZm2p5in98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374660; c=relaxed/simple;
	bh=rc4UgqM02wX3WS4+otXhhGGHCRsw59oov9SQ5Ze024I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InVXQqN5mvT0Jkcs8DfjlNZe4xFjnuo5qn2YXtK3nxkeK16gOI2zYoJ+AxPij1ZZnJIa5v+h4iHstCmO8+/TUt2EkuFIsZrEy7WtljyNy7CpArhb6HeZmU7CBESGzi9aKPFu73PM5xVe2utBRaKSRVeF1rsj3W53VOD29C8nP6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijFmScwx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D573D1F00ACA
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782374658;
	bh=rc4UgqM02wX3WS4+otXhhGGHCRsw59oov9SQ5Ze024I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ijFmScwxca4yR6X2sojGzTpvpEOxVMIDOZiP7X34up80RQthP1qXskm8aS8DDgDiE
	 KKreU0ZBugIqqLwHUybFLSHwZ8jjVe1WVo3bFXlZ0Rb+BpJAGgb84T8cPGoDsXrGZz
	 +QRwiwDnZPQMAQRPAy9gLPmU4SEFKb7Zya/OpZhmXy9iR8LxjOGUKFGgriwGv6uIWy
	 5uw0SSvyg3DR4l9ebbGN7VVfnj4MnQuu2wEPXNESMkisuIMPMkhOCLdkyco3teB066
	 PNaWCYq4IMxzg3+XZoqQlf+ncw7LTJKai3oLZgleWWmKG0DN8dkSaSCd4fq6FFwqFk
	 enieRGwLfB9zA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aea1e180e8so466297e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 01:04:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqyR8LeSJOEMkBk8f0CfjEmIwU+Of7Bj0sHlvNAHNRxq/98N2xS4Ta6kfsw/NaGuR26ey85lL6yuwPW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7EbujrMu6XD41AHb8LB7k9j/Ogl4W468n0znj2dhmyxtOBw0c
	6ZmoLRP09wzD7ghhlFGe1B8n+4kNnU8SOlA+Ue4S2dYFA0mqDRhbLfzrDxYYoGIQSxYocRu6kb/
	Wt4LPM9RBEcy8yQ+SdcnFgrBLuNbJKrM=
X-Received: by 2002:a05:6512:6383:b0:5ae:a18e:b06f with SMTP id
 2adb3069b0e04-5aea1f66658mr405055e87.35.1782374657529; Thu, 25 Jun 2026
 01:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
In-Reply-To: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 10:04:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjYBygmV-SAbGgdcCCsY_4Oj8DV3qt=SfyThPDL_ZZ3Q@mail.gmail.com>
X-Gm-Features: AVVi8CdrfAs76i3SCWe75sXDLmxrew_W8p1Qr6Cc1VDBJuXIucGhy5y20pIOo3g
Message-ID: <CAD++jLkjYBygmV-SAbGgdcCCsY_4Oj8DV3qt=SfyThPDL_ZZ3Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx1: fix device_node leak in dt_is_flat_functions()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38873-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:aisheng.dong@nxp.com,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:ping.bai@nxp.com,m:kernel@pengutronix.de,m:s32@nxp.com,m:s.hauer@pengutronix.de,m:linux-gpio@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 992336C38EF

On Sat, May 23, 2026 at 12:27=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote=
:

> for_each_child_of_node() holds a reference on the iterator node that
> must be released on early return. imx1_pinctrl_dt_is_flat_functions()
> has two early return paths inside the loop that skip this cleanup.
>
> Replace both loops with the scoped variant so that the reference is
> automatically dropped when the iterator goes out of scope.
>
> Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function no=
des")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied for v7.3!

Yours,
Linus Walleij

