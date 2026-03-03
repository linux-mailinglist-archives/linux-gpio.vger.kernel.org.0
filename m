Return-Path: <linux-gpio+bounces-32409-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL/lBviOpmnxRAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32409-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 08:34:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 744491EA363
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 08:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3BB6303FF2E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 07:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB2234F254;
	Tue,  3 Mar 2026 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FF4l44bg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6028469B
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772523171; cv=none; b=j14sZIksHwoh/j92LnCxsIbuYX4nd4l1mSHnogjTIeqzc/5qIIQylEkOsRKhuHedMvjNu6GfMjrVzRwPsLxlG9N7QlDyojrEE+RNiWOrSmF6GWLzlZ4RgH+O4v5oljY2xRjEt3wARokiE6KQAFEYHEhwTrbi6//Mwu6lA0oLyIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772523171; c=relaxed/simple;
	bh=0EcFHlf54MHIpuCSvFNvzezteT2+OqKpVe+MiGSo05M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhPlffFBhq2TQT/UK26TrU8E7B/PlmgLCvAc2F7ABWwvfd4SkKZM2zo95w4Atj+Fm0WYXcHEY61kcqXk1W+DC85YB/iIDs4qJlnN6iBt6Z2D2b5k2k8VJzVqxJKwJr0cNzeyhDeFVD3R5lJWZr7hw6VOEqOgiydYhkhJzz4yBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FF4l44bg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAD3C19425
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772523171;
	bh=0EcFHlf54MHIpuCSvFNvzezteT2+OqKpVe+MiGSo05M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FF4l44bgANo1ignttaYm7y6tUd6Hr7UDhhzLPtLmLcmSoAe642w/44pRXOoRbS2zU
	 jbt38bcVapjkbVKYBFO0dLK5s0onzpxx8Ba5pbpAzW7IUjE2WncMEqS/cGpTDCtUjg
	 Da0A/EoF+JuR8fGiP3aMdyFsD9do6SahlhRx7RF6//+e9KVG/+TTR+ylruTax2y8S0
	 nBLLVcEO8ABSAbexBYfvovKe8JdGMT5VL9wgNTVEPsBjithmMwGGw507ULTJL5ey1W
	 KrwjGydhOh+h7e/h1mtHurPtrfDfM3A8IRT4wnQvWFvQDNRjXPs0sB7PsZEnKaKRH2
	 N/g3NXSBV8n/Q==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso6490904d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 23:32:51 -0800 (PST)
X-Gm-Message-State: AOJu0YyqX9oaepTZJCaGC2lnOqEYknAqTU9r/l71gJ5DAhDXwnyEB4SI
	OWZL4birbRvp9k2KqosQ4FJos6bHDM2Epn0ATJqwQEW3Joj8MyvEsdSyimpFcnUqTFSmAeOSM+K
	NhyNkLhqPmuRQhWm4HN583/ajduNsfNY=
X-Received: by 2002:a53:b118:0:b0:64c:9afb:fc57 with SMTP id
 956f58d0204a3-64cedb51570mr685575d50.10.1772523170807; Mon, 02 Mar 2026
 23:32:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301-pinctrl-dev-err-probe-v1-1-94a0a2cecc6c@mmpsystems.pl>
In-Reply-To: <20260301-pinctrl-dev-err-probe-v1-1-94a0a2cecc6c@mmpsystems.pl>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Mar 2026 08:32:39 +0100
X-Gmail-Original-Message-ID: <CAD++jL=iAX-bWxi9XH5emwddZ-fcKu=dsSUQSEH-9-EBaJw58Q@mail.gmail.com>
X-Gm-Features: AaiRm51QcCoaE7iy__RT-0k0A5-aUlck-DSTiXizNRNfEapuDLdErMkHwtQNdh4
Message-ID: <CAD++jL=iAX-bWxi9XH5emwddZ-fcKu=dsSUQSEH-9-EBaJw58Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: use dev_err_probe() when applying state
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 744491EA363
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-32409-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,mmpsystems.pl:email]
X-Rspamd-Action: no action

On Sun, Mar 1, 2026 at 5:46=E2=80=AFPM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:

> When applying a pinctrl state, -EPROBE_DEFER may be returned if
> dependencies are not ready and the consumer will retry probing.
>
> This is normal probe ordering behaviour and not a real error.
> However, pinctrl core currently logs:
>
>   "Error applying setting, reverse things back"
>
> even when the return value is -EPROBE_DEFER, resulting in noisy
> boot-time error messages.
>
> Replace dev_err() with dev_err_probe() to handle -EPROBE_DEFER
> consistently and suppress error logging for deferred probes.
>
> No functional change intended.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> This series contains a single patch to suppress spurious
> boot-time error messages when applying pinctrl states during
> normal probe deferral.
>
> Currently, pinctrl core logs an error even when
> -EPROBE_DEFER is returned, which is expected probe-ordering
> behaviour.
>
> Switch to dev_err_probe() so deferred probes do not emit
> misleading error logs.

Patch applied.

Mysterious overly-verbose commit log have traces of AI
spice.

It is mandatory to mention in the commit message if an AI
tool was used to generate the patch, was it? In that
case tell me so I can augment the commit log.

Yours,
Linus Walleij

