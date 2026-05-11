Return-Path: <linux-gpio+bounces-36623-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLhKCm49AmrmpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36623-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:34:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F8B515EAD
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A248B30182CB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88853A452E;
	Mon, 11 May 2026 20:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5IWnmns"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4C8390998
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531688; cv=none; b=t9gGc4NlTge5XqyJvzd364eFESZ/yc0FA7f5samD8A/pHJw17vGiN7F0UdZejnN4woxs4Q2NNdnbVJFnT8le6D9gfsvhrv8KEWWp2TTGjUg6J2PWLJRd89QrAVAozTJiXZX+d3psoDJgo9Zubdp244lT9PNtQtZ5rG50TZM1hdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531688; c=relaxed/simple;
	bh=pfDxlUWWZJepOCZjfdEmEkPzN7o0zQAK0IZPSz7H81M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rb862nij6u3CTJskXlrznM5oE1FClD+HxOa3BTAYhpZAX0KtFrg98bFM2dsaf02CXkgWLrojldZ+nu+aC/HrRTA40724qxVPJIKM7h/SWVT1dVMP5Sad3UgnF/SxBMDrJuGKKV437RaKLsFqV4jdhwneZkm7LkYZ+Cn2NLpp3LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5IWnmns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A78EC2BCF6
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778531688;
	bh=pfDxlUWWZJepOCZjfdEmEkPzN7o0zQAK0IZPSz7H81M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l5IWnmnszX4yIlsBRwcZauDRDjLsshju3WeQ8Mfnk7HKw8C4aOvGcekN56lNTA761
	 zHnwpsT5guPRrb372CdGuH1XRzjJsWAjX+CFc0yqjuRfFNnH0QsHrXN6FDD062YsLz
	 MDOlqoL+JtTt20cTc/YgGBnUqZQGJSEJjgkN919VgdSU90p2W9QEBoMBs5j9JMfzHO
	 tzPRoORvk2B2zcajxNqtRcoYPM6xGw2LT7MN1RNJWH93+D2S6o0LB1A1gU0L9Sd93A
	 hgnASXHjDNKPcCvIsZ7a/5+xHRa81a5udY/K9yiH+Z7IYLTraMnVDyfEtZFfQhJmcb
	 rbdVbcfSHZBCg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso1475538e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:34:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ET1AAcsJn9d+jsYl/Q9uXqSlTs9pWJ2ovkPN1q3cYdaFqO5T9wVbcazFmxaeXEGFBWznkDUXy6JwX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwi05v9otKocEMN+f8KzvUdulb2W35ZYI20Bv2YIb12OrZ5qWl
	CZWKGDwmFreuHNHU+Tp2vzxX0F1NbMSPAFz4VVficM3gq92W81j/Xqe8iMWPTDU1AcmRo8Urep3
	bxcxEOc94AkTqDhm+aM40v23LQt7/Oak=
X-Received: by 2002:a05:6512:3ca1:b0:5a8:7be1:24c8 with SMTP id
 2adb3069b0e04-5a887ceaa65mr9872399e87.37.1778531686850; Mon, 11 May 2026
 13:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
 <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com> <agIwOYrKXlnKbpII@lizhi-Precision-Tower-5810>
In-Reply-To: <agIwOYrKXlnKbpII@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:34:35 +0200
X-Gmail-Original-Message-ID: <CAD++jL=eqEaTcG7P=++Md7fqosmrGbRRPDb90+=Q4q8oQ=xqRA@mail.gmail.com>
X-Gm-Features: AVHnY4ISeOUwTMvzSWT7CmqN0mVa50nOH_KekHRgu0RCcEYz-W900TVY-Ai2s7k
Message-ID: <CAD++jL=eqEaTcG7P=++Md7fqosmrGbRRPDb90+=Q4q8oQ=xqRA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B9F8B515EAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36623-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,microchip.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 9:38=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> I fixed a build warning by missing doc 'np',
> https://lore.kernel.org/imx/20260507152117.240612-1-Frank.Li@nxp.com/
>
> Anything need me to do futher?

Sorry was busy!

Applied this fixup on top of the branch and merged it into my
devel branch for v7.2!

Yours,
Linus Walleij

