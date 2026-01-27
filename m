Return-Path: <linux-gpio+bounces-31121-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBhbIBWCeGkzqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31121-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:15:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15416918FF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EDB2301CC44
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB564333440;
	Tue, 27 Jan 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NerVTX5c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2B0332902
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505298; cv=none; b=XevHbjPnw0OkLWEtm58wp1XYdOhSNayNUS3MxB6ov6Fu83qMeC/euG2E6BjuSte5jp4R7w0lu+Lj2eVWGNm4PgY6RiZw/2b1duUWM8OmffQyhE0Lr8BjKR7lEdOZmoWOfXNGtGd2z8iR5OVgUv4KbYOO7X0swESaCiO0M7OIjGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505298; c=relaxed/simple;
	bh=PetnM39e0LL4mZ/BY+88U8MSS+1uyIPhCOjYoVl/9eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rpq7/gsObylRnb24S4EZvetAZg5JcVLbCEK47sTjrPSw4NBlh16ew29b2ZyhGYzaNnIyO0aWSzwZ+rmEVLr+NWTS1Oiec2pX56m+lFmw2qWRLeups/xsQI3AOLteEiNbCyAJayTZkhk2HnIZGHmUYVelmST+EmfjsV9qChxQS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NerVTX5c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53688C4AF12
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505298;
	bh=PetnM39e0LL4mZ/BY+88U8MSS+1uyIPhCOjYoVl/9eg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NerVTX5cLC7ok0CGMkPxR2psYo5CcDWkmRe0kjDrqH7jF0+VXXxi3ktv5eqrSwRN3
	 WmhsFxynKOi5iM9ngE5MtCHdY7jFmWCaQxD1PK3+tjv2Vg9jfChOh5+Xy9JMEvpS1M
	 bE+0jrVSM+ya6qEZVMHN7nFwcZoT5DpEqG3o0yDEEM+eNY/blCGKDNmgrJC7Aki283
	 BwzINsEcFUplqEQP07KKGmlQeEwD+s8b4jnSQ9BgNpXB537XlSinfG3mHXbCdVxgqE
	 YIGSS8oR9FdZUDXV77A/ZzGcHCBIQrAGZHiwGYAOdMuIgjKauCjU5bxUWirjcDXgKP
	 +JnPLSPBPmw1w==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78f89501423so58089327b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:14:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVo2wkrcZqoPXQ4rrV9xFhn6VqNVggZcM9AU/O8UHVkEj3a3LqiPuV+wO6Y7jGS8a/1xIPoNcwSiChP@vger.kernel.org
X-Gm-Message-State: AOJu0YwTtLdO4UKzykv6Uh/o4CStjGvuhhvvxOHiSmAz1AMdejdw89bY
	a/fnoTFqRSgj/hvGVT4Rrx1Q6cDFCMd5bajjRtVZwrVrVfE+HHELt36Mfun29R+565QSo/Y62yC
	SeoyX4KBToJbQWPhq6IZCje71UQLPhNg=
X-Received: by 2002:a05:690e:169b:b0:63e:34ed:a137 with SMTP id
 956f58d0204a3-6498fb11309mr617884d50.27.1769505297687; Tue, 27 Jan 2026
 01:14:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-8-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-8-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:14:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLmC8YJFz9wzPUqEGq2FW_B3U7LvdSpHMEV5ovAqc4WcWA@mail.gmail.com>
X-Gm-Features: AZwV_QhQbgY6YvrIiO44oapfn9_eWa0H_41WHPqnhCEB-EYr7dzC31pzMR8W__M
Message-ID: <CAD++jLmC8YJFz9wzPUqEGq2FW_B3U7LvdSpHMEV5ovAqc4WcWA@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] pinctrl: s32cc: skip syscon child nodes when
 parsing funcs and groups
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[nxp.com:server fail,tor.lore.kernel.org:server fail,mail.gmail.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-31121-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 15416918FF
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 1:01=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The SIUL2 node contains child nodes for syscon
> instances (SIUL2_0 and SIUL2_1) to expose register
> ranges for SoC information. These nodes are not
> part of the pinctrl configuration and should not
> be treated as pinctrl functions or groups.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

