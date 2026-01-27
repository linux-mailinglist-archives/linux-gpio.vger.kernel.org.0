Return-Path: <linux-gpio+bounces-31133-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJJkG66HeGk/qwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31133-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:38:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0208991D5A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D248E300668F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622AD2E1F02;
	Tue, 27 Jan 2026 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFfr2b3W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248D72E173B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769506729; cv=none; b=j/z+D6lrOxTJ7OPm03wU16egUyin0JCX1J4qcwqfRZKF+yfAXqq2eTtbdkNV1Ne1sUrPkMQqS935ofaPGN8B35kEA/2pbxydQD3KBwD0mEBiOIjQTQs69IIVBj5wMzjeOFMRNrmPoY/TH6eg5QtRfqpjMqARjbvotKUqzl8+Lh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769506729; c=relaxed/simple;
	bh=AcR5zocr/5NXdXgf8kLx9UzhMZgfu0y6OzDuBzaSEBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PN2NwnZjsZzhMHKWTkgYUHJMMPHLe4cNLBfUDj2nnWhIGr3cZsruSQui6xIFd4oDdhpj8Qo4cS+j20KBr1alYZMhabrLSLRtRmHKGS6P9hBzJJvVgb/7nQX8PBOR5EgTisdSjkMycSzuUBYuQsEIH+fztKuU7ovpSifuBBQlJXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFfr2b3W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB16AC116C6
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506728;
	bh=AcR5zocr/5NXdXgf8kLx9UzhMZgfu0y6OzDuBzaSEBs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FFfr2b3WJj63ZLybMwJSVI8nLM7GkMoJ7DS128OPj3Ur/Ck6gvvD+T/0YyIrqN7jk
	 IfER4ehyxf6hJpkpnkCV8Zv+VPKiwakmdbdHFmOKQcNJhMM3LGHuTrNkBL7ymtOH5m
	 qcCORynpVi93O+bVbgEea35z06s5o4oQAsYwrbCam4tABwcHIvrUmdX1jCFE8Q+hee
	 +ZbkYAH4gQZkAI6j2Iiw7Odlfq9PKcSinNI14gqPDp4jzvVEm2sd3B7zLiHZZL/sJv
	 HjWsgTbM7YZuZiJNLcZY6pC8YxVrm+tkTpfO+X2FHAzvxxPJGJzodPuLpppUDo7k0u
	 9vcWqq8WieY+g==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-649655f14daso2959363d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:38:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDoQpDl+OOqJ8TcfLR0mp8mFPGdibQYqB8J7/Vh4pZj6o52k7AtSCahtQsIw3u4iJQI9/kHGgsMf3c@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCTAcIay3JXgJXnBlAfjfRLiZddlOPkOm3alD1bGoLxvRvcy2
	xmSY9szEfewQFI0H1uRKRe5WRYMzNln3T08B67s9U1aYmuhCmuIgSFWbKrvm41RgimYFQpcqF3e
	AOcfXdbLv0i4TEWi+puUzQ+tLCmG9a+c=
X-Received: by 2002:a05:690e:118b:b0:649:5e99:ce3a with SMTP id
 956f58d0204a3-6498fbf1c3dmr591413d50.32.1769506728263; Tue, 27 Jan 2026
 01:38:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:38:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLmjr-XSZJgJrD7cgga2US6EUwzPWZGTsdwff_ZngWbX3w@mail.gmail.com>
X-Gm-Features: AZwV_QjxNyEYQ3cox-qvZu6uGhFsKYJM8HbpE99pr-bqcEaSY_2yQ4dJQVfr56E
Message-ID: <CAD++jLmjr-XSZJgJrD7cgga2US6EUwzPWZGTsdwff_ZngWbX3w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
To: Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[arndb.de,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31133-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0208991D5A
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 3:20=E2=80=AFPM Shawn Guo <shawnguo@kernel.org> wro=
te:

> Shawn is no longer interested in maintaining i.MX platform, and would lik=
e
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
>
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
>
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>
Exciting to see what will come next, long time no see Shawn!

Yours,
Linus Walleij

