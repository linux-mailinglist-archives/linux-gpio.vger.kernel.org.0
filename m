Return-Path: <linux-gpio+bounces-35689-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBjECEqP8GnKUwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35689-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:43:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E15482DDB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F1B3303454C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B283F1643;
	Tue, 28 Apr 2026 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTEqi09A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502EB3F0AA3
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372656; cv=none; b=qUlqHFt8LBnTy+W8wuKNYw+aYNFx7d7EpGADT4CtGr7Bqocq93Qr499+kg8bNOv9akz+tFecmChAmBWAqDhQQbRvFstp7jDfMjkuhH4b537zpPXZgRJR67ZAahN2iIOD99W/EbpQWbZcPJNTTNOZFRX1h+RAikLpGP1r3AVH8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372656; c=relaxed/simple;
	bh=LpM2vqZA9b3nSgjYon/IdyAh8nPT3kKGQiusPMpoP9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hn1Jp7WdffONAMFN26WooZmw+J4toN8B/sa3f/M+21XdI3SIikOQN00B+lPKM2kE74EEUt1s/iPvQZL2Z7xXUf43ZHrTlTBT08oTv9rACGZPkvowo4Kl0wfjbBcEKK+onPpY8uY3g1BaIrfufFULtEoaGkcTBBfr4mFFZvuQsRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTEqi09A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC46EC2BCB5
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372655;
	bh=LpM2vqZA9b3nSgjYon/IdyAh8nPT3kKGQiusPMpoP9g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hTEqi09Ap8Q+rFq9FOOKsKvdircCO4iXj3WR0s6o0JdrewnXRtnyx3w4PU+La+PAB
	 wotqTEmT5ZCv9T3L6Wum88eMsaeArkZbFJM7VGB0UGYp0Jwbo3Y7YMmEBDxB1c4V1D
	 SRrOjRiAMCKgmWngrfUyct1JZwSJNQ8BhnNpgWB1q8Kef8ssuc0YfB4F+Can8qDH1i
	 uhXdtHGi0oiDRnNCH28Qawo9KsU257dS/qQh2icdAc8AwOop4NcpTeIwiyUxAH/Dfv
	 wOa+A7nWD7JFBlqEu5g7M4ZPeUq9Vc9t7+N0D5q7I/NjGahKJ6IYZMI+u3ARqdxs+j
	 ej4GPS5l513ew==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a01c80c34so109960091fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 03:37:35 -0700 (PDT)
X-Gm-Message-State: AOJu0YzErKT6H1atY9wymBkX5RHxoLFe2kRDE/szrrCjCUeZ9QMLSWem
	afza3CeAbnX/jT2NZEOkanG5NHdEf2t/qRT+V4lRW0GehfoAsCIeKGQ3rYWjvLIRDODT+9eEr4h
	PFdFV+qszivf1+MGRANYyQ539FYuHyg4=
X-Received: by 2002:a2e:b8cf:0:b0:38e:ac7f:832d with SMTP id
 38308e7fff4ca-39240fbeea2mr8355481fa.23.1777372654482; Tue, 28 Apr 2026
 03:37:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425014029.438186-1-rosenp@gmail.com>
In-Reply-To: <20260425014029.438186-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:37:22 +0200
X-Gmail-Original-Message-ID: <CAD++jL=b=4FLdzvcp8-LZBWrTDARm9kmAh8gfnSv+TA15u6yaw@mail.gmail.com>
X-Gm-Features: AVHnY4Ly8Q11AM1m5AC7J4SC1tnv23hifkNRTXopdiNYKi_ASo_HzY3DCzxoUek
Message-ID: <CAD++jL=b=4FLdzvcp8-LZBWrTDARm9kmAh8gfnSv+TA15u6yaw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: jh7110: use struct_size
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 78E15482DDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35689-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Sat, Apr 25, 2026 at 3:40=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Instead of an extra kcalloc, Use a flexible array member to combine
> allocations. Saves a pointer in the struct.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Patch applied!

Yours,
Linus Walleij

