Return-Path: <linux-gpio+bounces-33506-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAJdDKjZt2mcWAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33506-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 11:21:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C385297D21
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 11:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F5683001070
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4155D34F46F;
	Mon, 16 Mar 2026 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFk6DyEl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CD9382362
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656065; cv=none; b=TZSvdQKE6ZgFfssSYdkqyhVPnwzpN0sFkribNVJahLudmbRXDvfTDURbE+VL/mmcqUPPUP/iMLV2ObgRId4liXBEsX1rIRs1eqSpta/Sy4izrI/hsrJ6bXJjbbho/Q+cI8JCo8+iaD521pSfibZHmKpw0tipTY2L1Kquph6YHNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656065; c=relaxed/simple;
	bh=h1LiluTE35YqGxIDMhkPjhGl7IwqanehezLOS/w0gfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPfY7ITNEk+a8TIQkc/ajnnQX18ULxlNzMlIgT+nVKanz2tntt8ktjKzu18zrUv+GztKQMfpWZhQlgLsk6eRPEfg5dp+J9Kr9yVqq/NA57oc+17zX5t48nRxwLRP2a9gCjNhRpdD8L/gZUu9SMlqXYMiZqNlo07i1x2jpPRcAgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFk6DyEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9B5C2BCAF
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773656064;
	bh=h1LiluTE35YqGxIDMhkPjhGl7IwqanehezLOS/w0gfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uFk6DyElo1/tRXWTQVW/re4bH+5PAVtubuyjzK1HAqx0bi6xT9bxulyzDiI/zehQx
	 RclGh0TzwPOrF4+NUCCkw3E7DsMHPl2AXy8Ia0voLJw8k6u+riOUUwdGYodUpTtYTG
	 J70BohJ16dX+NPdwsipryqrx14AdWzveGSSHcuaf435SasaHt2ghGXrDZXurBMOqvz
	 3+MFVfdRgWL1LSfjfQrxXfBjJ5rd71o9MnPLLaYMII1XNknjoWU1M6HPLI/qFA/NeU
	 bw88HRRN7KYEEeQjeMU5ZuPBulqoO2+ynExOIkZaVB6EOIEHF9bnRbqS/WdiljBl1K
	 2uqqahjtXlCpA==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64c9a6d6b70so3570118d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 03:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/1HZ7jXrCo5APGxSvi0zJuH/M8Jqu6yuPpYvdEqwy1Dd3ZoId4yWPN7pI6MfV32sr7ozz1U4zoQT9@vger.kernel.org
X-Gm-Message-State: AOJu0YzCy48e0k/C9muMbYN8iCyngKh2iV3j2lEsmBF/aihTHNzlRWhx
	NBo0p3sCbO9nHIOs+PVl1O9k3AzKklo9v1NjP40xpAkuzpvSyRZfh2FuE1XT9QCJoOGCYIf4yrN
	IbyD2JTq7yk1VHVRHxfqZpBlfY4DXh/U=
X-Received: by 2002:a05:690c:6d83:b0:799:1f23:6e46 with SMTP id
 00721157ae682-79a1c1888efmr126635857b3.33.1773656063903; Mon, 16 Mar 2026
 03:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312031820.3007962-1-nichen@iscas.ac.cn>
In-Reply-To: <20260312031820.3007962-1-nichen@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 11:14:13 +0100
X-Gmail-Original-Message-ID: <CAD++jL=2ZVbZB1oVSQ623YoU=o8hyibjm_rV6KNOgy+SLj54zg@mail.gmail.com>
X-Gm-Features: AaiRm50FujuUhRUGrDo77dR6-NYp7ro_9lIoFx03OHhUkSsgalB-gNemesvbDtc
Message-ID: <CAD++jL=2ZVbZB1oVSQ623YoU=o8hyibjm_rV6KNOgy+SLj54zg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: realtek: Fix error check for devm_platform_ioremap_resource()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: eleanor.lin@realtek.com, bartosz.golaszewski@oss.qualcomm.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33506-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2C385297D21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 4:20=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:

> Replace NULL check with IS_ERR() for devm_platform_ioremap_resource()
> return value. Use dev_err_probe() for error handling to maintain
> consistency with the rest of the probe function.
>
> Fixes: b7f698b22b8b ("pinctrl: realtek: Switch to use devm functions")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

