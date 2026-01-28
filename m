Return-Path: <linux-gpio+bounces-31196-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG66JWzBeWl/ywEAu9opvQ
	(envelope-from <linux-gpio+bounces-31196-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:57:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C15679DE82
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35F96300B500
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 07:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B438A32B9A0;
	Wed, 28 Jan 2026 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoC2fhW0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F432B9B5
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587029; cv=none; b=A5fEUfe2gCHWDYnGCZ3I65s9VN26mfARhHiera3DEulRH7GXdmww8dxZbe2FpNDSEYXfSoNEM4TO8UwlN1KP/nvWt1qkbkr0zCt79VEQ1pveaaztGg3xJML7jeS4ISJ1IGUh1Wrypy+q5I6IwmOvmrus8iPzCGz90aHjh9XMDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587029; c=relaxed/simple;
	bh=l8w7TKdiChKqSGOc9gHLaLvziKzzvIC7zOEgWAbbYuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMGP5g8PMB5ZmVYTdvWRxcCgb6GDu5lKgDXW85f6DZMcj0XqHocnrBlIdb4tobh/l49P2vKVyGrQbIrV7zOQTCd051R+yb6nPEtbh8vYoHrhwLg7dG1DZtW4l2yXNf3d1xwf+hAUcCybzcGP+am6u43lF7rgQPp29qcCg0y/M9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoC2fhW0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C405C4AF0C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 07:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769587029;
	bh=l8w7TKdiChKqSGOc9gHLaLvziKzzvIC7zOEgWAbbYuQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aoC2fhW0W7ljSKoENlg/46ILgVllJWpgg6GWipqT0L+vdei+zyUXUGBqROAVCbCDm
	 Cz4ZmxxqE4FYVvTArxyRqQ7wZs6bzCKSWPH3nOKPTymUXozYDIXrPJnXTv6d7lfiIy
	 amtuFjHL55TlhAn+wm901xI0hROodXN20YUamQN4oN1m+D60lLUrajdkBHQhZIrd9I
	 1u2Z1aFxWzS85yLPtktVIe//R0dde5BS58l61bnkam9yuAkKYN94xatNqNwdLCmjkd
	 eFpU3BA+fP/kYbhgcv8cquKJNoyp7aB+WnesrlQi91vtdsrVCk03K2m/xGee9OG2Xs
	 +5OrakqiXy5dQ==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64959e30705so5156961d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 23:57:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzvJeQKHZtc8SIG0SnM9qtRZjoEPrBnf/SQNweXGMY/uy6sTxiQ3kPSpNSjp8XivND2Fs37eEkoS8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvawh/HP4FPhjYraaK+PkLcb5B/MoEOLG7VuQf1kcWB+BF7puv
	3/ocaPznuJ/pCiJRzDN/6fp8oW8sF5U5FiZXAnu8W122lR7Y6iN0yLvQPvdB1flnq0qLTKUbNJ1
	oE2GblErrJmvnYRzqkr1XMKfrjR6AYf8=
X-Received: by 2002:a05:690c:fd1:b0:794:78ad:470d with SMTP id
 00721157ae682-7947ab40c1fmr77291497b3.27.1769587028661; Tue, 27 Jan 2026
 23:57:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-pinctrl-equilibrium-v1-1-6ae094ac3bf8@gmail.com>
In-Reply-To: <20260127-pinctrl-equilibrium-v1-1-6ae094ac3bf8@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Jan 2026 08:56:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=oy-GXDCvoFheYimvsJOtqX_2qHdugt4ZhVw6oOOcyJg@mail.gmail.com>
X-Gm-Features: AZwV_QjV57NC7l0Tqkgaz74cnGCqArJDsFaTaFIKsbdWKHCaS0ICGVGsvNpFSFg
Message-ID: <CAD++jL=oy-GXDCvoFheYimvsJOtqX_2qHdugt4ZhVw6oOOcyJg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: equilibrium: Fix device node reference leak in pinbank_init()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rahul Tanwar <rahul.tanwar@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31196-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C15679DE82
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 6:30=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> When calling of_parse_phandle_with_fixed_args(), the caller is
> responsible to call of_node_put() to release the reference of device
> node.
>
> In pinbank_init(), the reference of the node obtained from the
> "gpio-ranges" property is never released, resulting in a reference
> count leak.
>
> Add the missing of_node_put() call to fix the leak.
>
> Fixes: 1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a =
new SoC")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied!

Yours,
Linus Walleij

