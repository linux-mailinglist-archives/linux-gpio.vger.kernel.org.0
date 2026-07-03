Return-Path: <linux-gpio+bounces-39429-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hoJTM/IjSGoQmwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39429-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:04:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC64705AE8
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:04:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="j3/VQwin";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39429-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39429-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C417302813B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 21:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E3E3264E4;
	Fri,  3 Jul 2026 21:04:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B342DFA4A
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:04:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783112685; cv=none; b=MsMobGuzWLF6qN9H4khVBw6rlo77latX52KsYnnIIth1kpGDsoYeSJm9DsvffKgyHFCh6lpq1pIeWdvsxJjW6hPj+yu2gaAGtXh8tIJ/tktMFnFkGvnTxFmZO9bnmtYyZ2uBKyj2cGdZ+J3jsVDwQgkEdHpMoL+AJ1CJJe0RvY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783112685; c=relaxed/simple;
	bh=TEismEukrc5he8i/ANzlclwqKUU39GroifuaymWI34s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZu29LUGShZnHh9SsjuqCD51ERSCuQ/7FS1ovUjIKTnpyzWWgjAiAiYS6b413acJ4Qba45yOPTMmrMiSEep7oMGpHz3VPss4vQdwcHUtxiVcv/joC1IVMcADyuBgokGlCYxJBtTdsSGN6DSZL8X3gaMha/YBCbbVFOw3uDBjoaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3/VQwin; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320D21F00A3A
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112684;
	bh=xWcBqU+ZcCLNHJJGa428QRtsa/t/TQLn1rK/qQI176E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j3/VQwinBjdgOnq3NrA/wXbUM61997sNxKkEvoUhq1FDD7AMG8iwqaaqy460q8MRH
	 OhIIzgq38VY2kvrHO9ZMVWS57zDo7OOp5eMfZIee5z3Fkomr4Agdeu4SDeQ0HZ1Pud
	 tJcOU7KwkG7z/zqV2pjLPRPX5rlSwCMfgaMa9Vy4pR48xRQS3EpwC4hMYGGa/sxgv5
	 +iHoqQjC3HDwjm2CItfEzcSXzyxcn8Qsbp+/XunEdMlTBXy1BwOBKt/5A6F8karTRJ
	 VShqR+7bvxu2niMXkF2r51ERzX3UIxpfxs+f5q1N2SElidFfjOBrBYaRXcsqagUJVx
	 WV7b0DVqyqb2Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebc8cb5bcso652914e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 14:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpp6Z2PkE9ZMrCqBCopXtZq1JdS23oo6JU/XOPNq/JSPjpJBciAZOUjsam0Oa2MQHOX8gN9ftauWc31@vger.kernel.org
X-Gm-Message-State: AOJu0YzFCvO85aP/72v9NVYByXhKW0keD0kxtmv29Itpytp6pK/bhpKE
	twYJQqjA2toSj8ABx9JPcYLLcRYCtt6Jk2OErnX2KIMk0J/VFraWYVMOTI3OSIvZJxwH/DIzbDe
	UqXGK4kU+6M+iMHTN/wdvedJa9EMC7HU=
X-Received: by 2002:a05:6512:6411:b0:5ae:b981:3390 with SMTP id
 2adb3069b0e04-5aed508f6b3mr72582e87.13.1783112682973; Fri, 03 Jul 2026
 14:04:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-palmas-getdirection-v1-1-046c155961c4@kemnade.info>
In-Reply-To: <20260703-palmas-getdirection-v1-1-046c155961c4@kemnade.info>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:04:30 +0200
X-Gmail-Original-Message-ID: <CAD++jL=XhJc0TDJjG=rOT-TOH-ED4OBbVfcQdBb+R-b7i_HMUw@mail.gmail.com>
X-Gm-Features: AVVi8CcLAvXCg2XYAadz5UQ5l_9Y6OCJgP89EyBNFQjHzoJL9eg7rMuBdH1b-hU
Message-ID: <CAD++jL=XhJc0TDJjG=rOT-TOH-ED4OBbVfcQdBb+R-b7i_HMUw@mail.gmail.com>
Subject: Re: [PATCH] gpios: palmas: add get_direction op
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39429-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andreas@kemnade.info,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kemnade.info:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DC64705AE8

On Fri, Jul 3, 2026 at 7:21=E2=80=AFAM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:

> Accessing debug/gpio is quite noisy without a get_direction()
> implementation.  To calm that down add an implementation.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

