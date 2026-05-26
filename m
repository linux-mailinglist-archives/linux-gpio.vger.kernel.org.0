Return-Path: <linux-gpio+bounces-37511-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAe9G/1tFWojVAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37511-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:55:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 553CC5D3C40
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B7663042E67
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA093D88EB;
	Tue, 26 May 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZC4nw5Rl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892F3D75DC
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788780; cv=none; b=b03CE0Ei7EkY1bkpOXUtP+DWOxM2L8PprrvDe2I9MXnPFbraqn7DztgRhJwwhVRRu++PuSLsLHE6B3DSVbDzl1n9jU3LFmhDaygnmR2tAgp25t2lINd5f0BjAV2vcIeVoObmEusNEXmcbHxjglkBS7wUL1OtLnMP885m5j95Ulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788780; c=relaxed/simple;
	bh=khYHto0da/rGsGN1yk7Vbe05HTgfzl5xI2TS8KPj3Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OS+gL7sxOF84YTh95GLra+KYYD0Q0WsbuYHIVdzebNCbgppI56Ci37rK/zKf64YfbwIaMm0EVeTJlmAppHMa757tv2vE2tk1LvKxgDvgt6AOKNuWyLH2olq9RmNLJaz5hzKS4F3/Iz4zGtZ/VumAYTk6ZP2Xe6JbTIdsu5bayXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZC4nw5Rl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E88E1F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788779;
	bh=khYHto0da/rGsGN1yk7Vbe05HTgfzl5xI2TS8KPj3Tc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZC4nw5RlVagCmmwh4piDdw1J2TtzBgSQ+gE2+/aAu4gq5Ues8ljzCh5XrVTRPMPAl
	 wQrjB+ZBvM+3odSH4XpiLeAErDAIbRLShUgJ2xSBGmAnFejCqUJJMHEbwIhMIkeAnN
	 V6IDBUtlQZ/q+YN45k7LpxS+1jBMMrq+tPTMwqP5ZZZhOHV7sfaTIrjZ37daUqn29N
	 FbWR2IY0/ZwxyOVioJM/6adNGD9JE5ucr8yJ4kNcWemjyQPWiBevgsATkU/FV0ZwO+
	 YA7Q3VnJbvVFECOdTok7R3VkgeL5Hb6um2GYL5R4ozYD09TUBXC9pysNClMrx8bXqj
	 vwL745W8zPYwA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e97e73234so88622641fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 02:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ufkau+yeCprUIKil+zFTbfCfi0xByAwuD+1aMPUYg1FyEFxsxnhDC7AWuiC3mjhFpy8qR8sxUAUne@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/95O53a1w+HKzG5TfGwokrLJBQXEtGLs/SCHWR8JXK/PjLrbI
	Mf1/zw0e5Q0liK5sQtptmxTe3TUlUij5KBdbog1Gzr9nvJnElMW+FQ/kP3Kye+DzIL2xGYyGaQF
	UxIbXTnMLyBkU0J0vnqe1nf7TSyd2zuM=
X-Received: by 2002:a05:6512:a91:b0:5a9:163a:9ebc with SMTP id
 2adb3069b0e04-5aa32328f6emr5890808e87.19.1779788778299; Tue, 26 May 2026
 02:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
In-Reply-To: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:46:04 +0200
X-Gmail-Original-Message-ID: <CAD++jL=YqfDXE9OgKX4fbk0FgK8=W0gWMVHJ1icmHkRd4pN5JQ@mail.gmail.com>
X-Gm-Features: AVHnY4K6rfRItQ-L5UFwu1FlZNpnb2Hkdgdyqdf1qhLTp0XnK7hfhnYE8AoesZ4
Message-ID: <CAD++jL=YqfDXE9OgKX4fbk0FgK8=W0gWMVHJ1icmHkRd4pN5JQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx1: fix device_node leak in dt_is_flat_functions()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37511-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 553CC5D3C40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

So what we got here is a non-critical patch on top of something that was
critical and was merged as fixes. (A minor memory leak is not critical
and not -rc material.)

Linus (the big penguin) has been annoyed of too many noncritical
patches going in as fixes recently so can you please resend this after
the next merge window? (I will try to remember the patch as well.)

Yours,
Linus Walleij

