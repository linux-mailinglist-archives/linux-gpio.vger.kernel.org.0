Return-Path: <linux-gpio+bounces-31367-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJSUNi5CgWl6FAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31367-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:32:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E14D3045
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 547A03019FE4
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 00:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4791E25F9;
	Tue,  3 Feb 2026 00:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8OVDdrH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F3A8834
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078764; cv=none; b=USu4ThuwbO/LJiLLXo416ecor0rSr2qkDKoX+v79Amt36j3rOWsrzsZb43EOMJIroh7IMk0OQjA4HMtcOQA9txAOT7f0yyeB0AeHWOghvc3p+m5qwGzQ/atb2eRRPDJLwJi0OpAquqOmf2pP0+UIT23HPmhh3Ja/HXpLzrRSli0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078764; c=relaxed/simple;
	bh=5b1YNgB+WSCy3gJc7w5bfdM+RGfw7hfgWgwTAQaFtvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IW/VG/PIRRNGguDQeLfCMsRCKaxwxR3g+Uqo/LUlYAl2SeuMOYDW1pYgDkeCLbexor0eSPKbEk0iZzrMRCDs6d4aS4e56/sDQk8aOL1EguaGZdl5j7zgIBdbS8qt1JMIlOtuVc3nUcJPqhDxyaqWKdOGvIpR7A0MxKySJjDBcaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8OVDdrH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C189C2BC9E
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078764;
	bh=5b1YNgB+WSCy3gJc7w5bfdM+RGfw7hfgWgwTAQaFtvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a8OVDdrHbwy9MxbepcgQSm3ydVa5B6saKW0MQzpcK7Oy3Tx8P/SKX9BoWJKZ+ts9y
	 pohTWk5IMih/KWNfOMLZwFHCCFnlMekCWPXALEgizwJmZrN+raE6iufYt1dXC9Yksd
	 WKI+Z3v7FenP9A4YkBHYTKR01hxfAZDz9M+Fzxg8BSGYck3/EFReEC7MxPoUZVJjVP
	 2npA9FRWukWz82sXOZV4oxPT9NCYtAt5Kox2BrQ2XH9pdQWetwbTX7BOKlhgk/TMkp
	 9TUnn/EGH+e6TENfMKFv9qY8OKZbYOiKD9s24iXu9VW6EITyp6UfzGEKpfC9sYtqtT
	 kmFhveWnCJX1A==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64965ee303dso4839941d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 16:32:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpb+opsQfzU761ke9fM9bf+RRT6eQgoUjaVNizzB4jyjL+u8Y5qvZhvMc7wzbAQQvkM0OrxEvxse32@vger.kernel.org
X-Gm-Message-State: AOJu0YxpW4JD8+GxvTkioIXikx4NTMhYAvMLsP/nsStGcQpjb40rITcc
	4PB0IynA828zhpoFpfud918GeIailN9E88V8qAdUxsQ1KrW6scm1yTCmB4E+78+20WWfQFy6LTq
	Tz+1bMgJDCZgHvND26Ed3mmoEfyXm7C0=
X-Received: by 2002:a05:690e:4183:b0:649:4640:f8ea with SMTP id
 956f58d0204a3-649a8393901mr9595658d50.4.1770078763406; Mon, 02 Feb 2026
 16:32:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:32:32 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Up=y_pX4Xy50in08cT978ANaoiD_98nn99frb8=5vOA@mail.gmail.com>
X-Gm-Features: AZwV_QhzATDF1xPyRh23xfkH5H_s0IyRTbaRsiEHxW24bbhKveJdGG3YYXSQugM
Message-ID: <CAD++jL=Up=y_pX4Xy50in08cT978ANaoiD_98nn99frb8=5vOA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: canaan: k230: Fix NULL pointer dereference
 when parsing devicetree
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, gaohan@iscas.ac.cn, me@ziyao.cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31367-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 54E14D3045
X-Rspamd-Action: no action

On Sun, Dec 28, 2025 at 4:53=E2=80=AFPM Jiayu Du <jiayu.riscv@isrc.iscas.ac=
.cn> wrote:

> When probing the k230 pinctrl driver, the kernel triggers a NULL pointer
> dereference. The crash trace showed:
> [    0.732084] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000068
> [    0.740737] ...
> [    0.776296] epc : k230_pinctrl_probe+0x1be/0x4fc
>
> In k230_pinctrl_parse_functions(), we attempt to retrieve the device
> pointer via info->pctl_dev->dev, but info->pctl_dev is only initialized
> after k230_pinctrl_parse_dt() completes.
>
> At the time of DT parsing, info->pctl_dev is still NULL, leading to
> the invalid dereference of info->pctl_dev->dev.
>
> Use the already available device pointer from platform_device
> instead of accessing through uninitialized pctl_dev.
>
> Fixes: d94a32ac688f ("pinctrl: canaan: k230: Fix order of DT parse and pi=
nctrl register")
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>

Patch applied!

Sorry for missing this, I was waiting for maintainer feedback
but it never arrived.

Yours,
Linus Walleij

