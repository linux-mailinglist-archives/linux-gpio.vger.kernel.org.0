Return-Path: <linux-gpio+bounces-33491-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIK9FJbQt2n0VgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33491-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:42:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB22973DD
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66AA93035D45
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C54238A71D;
	Mon, 16 Mar 2026 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M89CEiZO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC58389109
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653965; cv=none; b=TsaaGT+/30JFqhI8g3mV+HBBEABjQ/rWbQy8Z7vOKc58K0vehWEKuMwlTmxS9jbL1oPBX5AYbOPO1/nzJfSLBR+8ZEtRWJbgpUocAeF8ougR76DiPlvPrI9F8M+R3JY1/CO8+jInjM48knR7uiKt/EEPMLQJzX2S9TvIlXOGybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653965; c=relaxed/simple;
	bh=RbqZslNxIIkzTluBmL/ed2uqFPa1E/cM4+gpAQj+klU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCPy/y8y9+Y8pV33hop6dab0/+cV2QKvWJldfMdL2GgTIRu5S8FECsc1JdX2TK12l42s5zrb/zN52Rat/GWw0XRj9EslywjcdUgxJVneV7iIbrGO4lEPMHDMO5r4HevCsExwUmXWmn82JXeWBE2FXEv3K2Acp1xA3VlZcbnkHzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M89CEiZO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC33BC19424
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653964;
	bh=RbqZslNxIIkzTluBmL/ed2uqFPa1E/cM4+gpAQj+klU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M89CEiZOnHW6l0rVxIAVYujeaAXXC4wcFEgK6RvQrRatF+GJGYQPCQzJqxY8+1VIA
	 E7ZCdMygmp4NiT/9U0vyf51n5I+cO6swsADrHEdCOP1BbB+Kl6PKS3hjlfS8XRAbDI
	 FqbHS3YpHzueVeZy1lUiGD6oOZPmUBwFBnVZR0YJK7ri5JSsOvqdQ8JXeBV1zvQ9Aj
	 iZuHlJW52n1Dcc+QGXJDlCK+tgfX07jqK9IIBqCmihvHKJESa7f89hJqPcLevHPKze
	 xRFRnqqAGAXyPwMBME8EPg2+xjOSKUqRn9bRAGb6Bph92medmVxRyhjXkG7MELJtr7
	 uH4XTBPdAIpOg==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79495b1aaa7so38962857b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:39:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPkeU++EA2NJDQX98lGXGHf4A4sK8LF4m2jYWbrlI2mH6tgaaRCOEokU1Wz28564IwL0G4QQsq5Ikh@vger.kernel.org
X-Gm-Message-State: AOJu0YxdaxJ8+dczObSYYPVcrrBDY38EHbEp7FaIsmjjmyOdeD6MnJgU
	miGMmNWPbh8NYLgnhDzFzYsdRwNY7g/iUb+kGzAF4jSdkjyj+lheobgOvydeC58k8Dc4AcjOdQG
	olMd97L9my+BF4zoz0AE3ZMA9knf4KZg=
X-Received: by 2002:a05:690c:6e87:b0:79a:3b28:a710 with SMTP id
 00721157ae682-79a3b2912f5mr61530517b3.27.1773653964110; Mon, 16 Mar 2026
 02:39:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com> <20260311-pinctrl-mux-v3-4-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-4-236b1c17bf9b@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:39:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=8tqT=jEy+_W-WnPq=Az7GbsW7pdXHZNmu8m+tKoDMDQ@mail.gmail.com>
X-Gm-Features: AaiRm53Q_0hsf1jplyh4XsHDGxCWDXM_lyumSvDs8oSWpLJERT4ci6Zqc30deP8
Message-ID: <CAD++jL=8tqT=jEy+_W-WnPq=Az7GbsW7pdXHZNmu8m+tKoDMDQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] pinctrl: add optional .release_mux() callback
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33491-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6DB22973DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:08=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Add an optional .release_mux() callback to struct pinmux_ops.
>
> Some drivers acquire additional resources in .set_mux(), such as software
> locks. These resources may need to be released when the mux function is n=
o
> longer active. Introducing a dedicated .release_mux() callback allows
> drivers to clean up such resources.
>
> The callback is optional and does not affect existing drivers.
>
> Commit 2243a87d90b42 ("pinctrl: avoid duplicated calling
> enable_pinmux_setting for a pin") removed the .disable() callback
> to resolve two issues:
>
>   1. desc->mux_usecount increasing monotonically
>   2. Hardware glitches caused by repeated .disable()/.enable() calls
>
> Adding .release_mux() does not reintroduce those problems. The callback i=
s
> intended only for releasing driver-side resources (e.g. locks) and must n=
ot
> modify hardware registers.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

OK fair enough, I think I'm convinced about this now, also it has
a nice pairing with set_mux(). Let's see if someone else has comments,
I might apply v4 after fixing the generic function issue in patch 2.

Yours,
Linus Walleij

