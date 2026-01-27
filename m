Return-Path: <linux-gpio+bounces-31143-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBigM6GLeGmqqwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31143-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:55:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48850922BE
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD105302C336
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D520D3382EF;
	Tue, 27 Jan 2026 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alXGeBCq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FDE3382D2
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507662; cv=none; b=Avs+8iWH7PVXguTm9VbQmPc6xpjTqsbEiKUIyNhWQi7gDshkmn8q1OHMiDeA4DFPFNZk2qs0ewPYSZKZAQsUZLD07JvWffOIIxF7/32MLqnp64Nv0B9DbEZbyeQJiPqrjsFB29cuzWhlsHXaatwSPNDJwvufVfPTKh3M88eROX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507662; c=relaxed/simple;
	bh=La6ovWe4JDYFXsmg6YsoV2xlDST6N2pFeKiwrg+V0t4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPF4teDt6LB0vw1mh+OOHB9Ssp7a8Uyj6TVExMBeYYn81vMQ0fIA8fwkAXOWELqDwD465/zMYI15YrSfIq5mXLmb+AKNnNDHU3ZEMqHDQ3kHrt1l//HdOIHVksYh/NASpfPgf+9uxN4ozO6yCB6DTHRQAj/8e0fiem9a5xP5F4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alXGeBCq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E93AC19425
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507662;
	bh=La6ovWe4JDYFXsmg6YsoV2xlDST6N2pFeKiwrg+V0t4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=alXGeBCq/7KlK7rEMrv2gOKSM9TkhHkYpwHTU7BEqOsLU2Oe7McaupHt4jN5KVYW0
	 G3xfZph6CfxDrPnJ3ybYum9Q49U0l8UON8fSyhrqbTvmGk2mikD5bzWgenVscf3WVC
	 Twu78GthRX7dC711zt0ZZkwXvAR4V831SYc1HvAa/CVsGcbA+kHFIJ4vhjMqLusbQk
	 G4AU7yVB+dwfUP3pLdvi+u6SWmngxRIOMyAbQDbEgsNJ5sRHzP4t286r/4LGmdJTH8
	 bFKuDQdbrKRF/SDn7wfhC0xY6dd5wL4raR+kvbYIeAH/0pusyWoweZD48Ovv/2A830
	 3+DJc2YOt/3dg==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-648ff033fb2so5034222d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:54:22 -0800 (PST)
X-Gm-Message-State: AOJu0YznLfHTeZ1saZj8/a1Vqtw1CzR2exd2Mt41+gYQ+orMZyrxDp/S
	OQZaTOPbi5FEBopxaIF6KdasSQ3JQHhIlFUx93L9mxKF3waklBJugWLKLPgxTEvFeRhNY4nqW5L
	VCuo/arl5f0mDrxlGJSKPr8jgFMmbtRg=
X-Received: by 2002:a05:690e:12ce:b0:63f:b4ee:7915 with SMTP id
 956f58d0204a3-6498fc1554fmr611652d50.11.1769507661665; Tue, 27 Jan 2026
 01:54:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXeCgo5w1YOHUKiK@black.igk.intel.com>
In-Reply-To: <aXeCgo5w1YOHUKiK@black.igk.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:54:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLn5AQP-+OcYqw+05eprJDMv8u21UOdEos4=P4GRdOBaLw@mail.gmail.com>
X-Gm-Features: AZwV_QjCylZiz_82ZrhJf5rKX20VtWgzTMl_frogIkgHRTJlTmkZGVLH8J3N_Wg
Message-ID: <CAD++jLn5AQP-+OcYqw+05eprJDMv8u21UOdEos4=P4GRdOBaLw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.20-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-31143-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 48850922BE
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 4:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A small but important update to Intel pin control drivers. The main thing=
 is
> documentation fix by Raag to make users less confused about list of suppo=
rted
> HW. Everything was floating in Linux Next for at least a few days.

Pulled in!

Yours,
Linus Walleij

