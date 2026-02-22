Return-Path: <linux-gpio+bounces-31995-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHPIOVYXm2kvsQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31995-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 15:48:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 083F316F734
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 15:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD18B300B8DF
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 14:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481C2350A08;
	Sun, 22 Feb 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNNISCeu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08453946A
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 14:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771771725; cv=none; b=K9iQaodg6aqmWlBY5szpsI+cXOJvXzBvd1yvRXOIji/Xjp+55sGjJgoPHM3xgBndmauXXYMSN+dYyWSq2q7gmrjOHXHI29n3X7YjaqigqipV74dT842onXzRbqXpKdYdpr+xhN9peFb51lwODEbgW2FqPNgW1qEd0he0WXmzDJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771771725; c=relaxed/simple;
	bh=sdzwZuG1QrazH/8Adb2q/4hXsnStMTv8CJdWUB84/8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myu6hlCzLkYfhmG4MXA5UDRK9PHVivizWgtWRDX+hA6Z21UboxTXZ4AmaummlKD3q1PspjqEXH09KTnDnv5OlnXzHeY+INHrz+PuBkNIW+x+AOjeIrFscUi2IUKUWArCXDzr7R/t5LcfMioyQMJ16ZgaaKup5uZSMyhakTcj1b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNNISCeu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3652C2BCB6
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771771724;
	bh=sdzwZuG1QrazH/8Adb2q/4hXsnStMTv8CJdWUB84/8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cNNISCeuROU90CuCrmTiFGRaTDlLMJFNSq0MBg/edSw1kNJ5oBs0pXBZbG/9SLuq6
	 ThLIKAxdOeNMElpDGoKztMrFTY+lgJ/wNny8a1dtHRSlUvr+izV+mn34gbC971Hm5/
	 Df1D/bF4Dk1A9iSC3psm3f/FvmhUQ0o+lXveIbgVdcA8MXSmJodpXxOdWgNCOIgyF9
	 i53aXLPLNDeMUJPENRZjAqK0EEPjvGmFWx2NNdzFZGsD+xPez+iaV/5HE6H2hDSEKD
	 7+86yXza7aU85rgwcsG9orDXYBGR1HWBPQ7wdch6uDrjuq7CVqzAbq1GqouCDzv4WX
	 erVdwZKazLJvg==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ae1729637so2982096d50.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 06:48:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+bYpEDZ5nnq3ynHTLpJU5rhznQk33wWzIWIkGYGTF40wphmUlpLAw1A2iDI2yhY9AeJ8VwvKgLRmP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlzg3WB5V4VGhfQWDGm4Fu+Yk/HFwmyJYYFhMKaWRmNLcKRZ0n
	/HWzu35pZQ3zn5xddv/tm5JHg93tBKpqrssKhJ8wHGJeMrAp73+I0jh8SikxMfq8Wt4Y31M3rq/
	da9yktRhSQdwy9H9z6HVJs+0LIoBpAZ0=
X-Received: by 2002:a05:690e:d59:b0:64a:d479:bfbe with SMTP id
 956f58d0204a3-64c789c6a7bmr4841631d50.11.1771771724015; Sun, 22 Feb 2026
 06:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212213656.662437-1-shenwei.wang@nxp.com> <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com> <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com> <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Feb 2026 15:48:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
X-Gm-Features: AaiRm514C7pGWVEcrMl_Px6Oy5MFEMWE4sZ-03YXonAepWinISuPyzCRs8cRpUg
Message-ID: <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	TAGGED_FROM(0.00)[bounces-31995-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 083F316F734
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 7:57=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:

> Given that, I=E2=80=99d like to hear from the GPIO subsystem maintainers =
=E2=80=94 @Linus Walleij and
> @Bartosz Golaszewski =E2=80=94 on whether a driver that works with the cu=
rrent hardware/firmware
> design could still be acceptable for upstream inclusion. My understanding=
 is that upstream
> generally supports existing, real-world hardware as long as the driver me=
ets subsystem standards.

What a swell party this has become.

In this kind of situations I usually refer to
Documentation/process/management-style.rst

What is the message I as a maintainer is getting from NXP regarding
"gpio: rpmsg: add generic rpmsg GPIO driver"?

Arnaud, who is the only person in this discussion who actually wrote
a standard RPMSG driver (drivers/tty/rpmsg_tty.c), must ACK this
patch if it wants to call itself a "generic" RPMSG GPIO driver, if he
does not, then it isn't.

Is it generic? If it is not, let's call it "NXP rpmsg GPIO driver" and rena=
me
files etc accordingly. Maybe it can share code with the actual generic
RPMSG driver once that arrives, that is more of a library question.

Yours,
Linus Walleij

