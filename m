Return-Path: <linux-gpio+bounces-32125-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CWwF59xnWmAQAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32125-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:38:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC839184BDA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C872930CEAF7
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0408B36CE00;
	Tue, 24 Feb 2026 09:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADBNcvUY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A2336CDFE
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925857; cv=none; b=fnLZbgIy/C1J/3Pb/jmr7YFksjz7JIl9UEkOqSGwAUUYs6YcyE/PzmBvcHDBSZauSENiupyL66ly3zZ7eKjX2zVdh/n75VOGn4iuARLN5ZHolrungtoSAEEjTVGuKGFIX3lKw0Kk3XbBMzYYPjZntyEhSKm/29nBaTulBC7BzNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925857; c=relaxed/simple;
	bh=g8edeZSicPJhy++p3maHG8V56bDu+kyumjD/ZT9RxXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eu3FO7qW81SymSBf8F1emyVB2olU+j4XLn/yl5DeiYpQ8/HWJmR3oD8eHZASTBUxdEShOgjp8Hwf3LYuNUogh31rgPoqMvZvLc5OrehBu8EhoYUUNZ+LH6QRvdDRzDOTYHzIyjfAxjCyYXZbxDEi0621dMbIQE3IlV/iiY68pkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADBNcvUY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857DBC2BCB3
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925857;
	bh=g8edeZSicPJhy++p3maHG8V56bDu+kyumjD/ZT9RxXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ADBNcvUYlfljcYMUK1YXe6mWXiZyA0e20GKeaTNKWidPih5IS7X18yQ7xBzX4XR2k
	 YLo4ksg5UcaOfk9K/uUe1ZTeYPDFaVCb/xedtqh3u8m9AgfT4i2VqHgVS49GDCYOBi
	 7qx2tEPJyLOD/bkLqf+HNccjdkP5s8CmUbM+gsKtSChqWvpMCqYNku8h4pyHPh9329
	 zZ2jAXRogmpLvmoq48k3qr1njxCfKuTnCeijehPzXPelC2kZ1VeYWz6hTZIKNBnjwY
	 cNrlsiryUdVASp8/fn8bJ3eomuICcrx52MVBwgu4/dX/skjtXmHOIOcReWOZtYKzFK
	 hVdaitIlxrdkg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-797ab169454so50328697b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 01:37:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeKnxckfoOgOpezz1KuA1DywZ/QZhOvvH9MU+WZPxxlsJ8MZjMIy6+OrVceDVRL1utZ9WFUYAf9H9H@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2uPTWgCexaEcELQ4M7wLT1oex6WmIJGWhNe+zdk1VaNsc6JT2
	ztOGUx+kSDU/hWygEXMqJKHdRmVXS8F8+KcIUgG4haeLgfb8PYBZ1I16AS9ohHb10QoeNWWyq3/
	FOf7J9MTjbT+q+/mw1DN77t/uSGoNK2M=
X-Received: by 2002:a05:690c:e3e5:b0:798:1b2d:4b6c with SMTP id
 00721157ae682-79828cde4bamr107400237b3.11.1771925856834; Tue, 24 Feb 2026
 01:37:36 -0800 (PST)
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
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com> <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:37:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLkHwKxcDu7oX+_+N00SSfEMrj4CBEKUYZTEmTZv5Gjb2Q@mail.gmail.com>
X-Gm-Features: AaiRm53tdO9PraGZNM_tmFUQUZSiJUlpqFoMJNSwiXKqWWTvRU2E_PWdBXxyRms
Message-ID: <CAD++jLkHwKxcDu7oX+_+N00SSfEMrj4CBEKUYZTEmTZv5Gjb2Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[foss.st.com,lunn.ch,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	TAGGED_FROM(0.00)[bounces-32125-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CC839184BDA
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 9:33=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:

> Arnaud, if you agree with the points above, my proposal is the following:
>  - Remove the fields you mentioned in the protocol and update the driver =
accordingly so
> that we can establish a true baseline for a generic implementation we all=
 agree.
>  - Then prepare a separate patch to add support for existing NXP platform=
s by introducing
> the necessary fix=E2=80=91up functions.
>
> Please let me know if this approach works for you. My goal is to find a s=
olution that works for
> everyone =E2=80=94 even though I know that pleasing everyone is almost im=
possible.

This looks good to me, and Arnaud seems happy too so let's go ahead
with this.

Yours,
Linus Walleij

