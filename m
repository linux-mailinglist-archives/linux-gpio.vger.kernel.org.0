Return-Path: <linux-gpio+bounces-37538-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAYxAMKYFWqvWgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37538-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:57:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF25D5E51
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FC47303E13A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA85522D4E9;
	Tue, 26 May 2026 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/1EExE1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A013218592
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799965; cv=none; b=WBrttIYWjkOFz4mNNUx8q+f7p2wSIGjEY+eQi597EfhfiEPl6JSwhkMwphyghlh6ViaLQrm/ZsOJk8ZaJ4vLkA931Gewt3yOsk3hZckH1zR0biiqw50LeH+pzgZBAgccLAB3lbCyljY93Clghqy+SSX4XtDoSAYk2XQ4TtvTldM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799965; c=relaxed/simple;
	bh=ZBXzqv/om0l+TyYWbq+zzUuQed/AxeNEWTs8z4A3i7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ctcLY7z1ZNoyNxtAcO0Hi/wDbs3/LSWX6zUVvgkraymfaxiOkf8gkBvRhk7SFNuGfwblhkaBjjnUNCU3wBc9dS4bASTc5nI3nOn+q04b23d+e7861VhdA4YvZ37uf3R7deGf9vqKkMlWbWgP/aY8KynJGihKGq3SdLGDs6G8Nec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/1EExE1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412131F00A3A
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779799964;
	bh=ZBXzqv/om0l+TyYWbq+zzUuQed/AxeNEWTs8z4A3i7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F/1EExE1Ik6T+4iQV6Ae/Wo6jTNMjl53q0EPL61rJRStbgn+h1SiyNdG3UFZG27vt
	 OkBgILLIh+XSnjyBhfys0mv5zsZiAnRMnlj23Yup++3+CycTyOZ9eKkkBRXfvYvZ/2
	 A1z9JFJLVrY1U0n3CLfQ3zITRVTs/brbAmIpRJmGuN5NY/kUMIZSvB178ZzKSreiVy
	 H3ROtr9c+DWV2VWqcIKUwUzwj+b5zJ6KHcoLSLDiDdIRNNsn+lic60XbgZEWDFQ6JX
	 os43uSGYpNBJj4p64rQ+dQAbpSWCCFEPsogmeUV3vLxNQ3xqS9Q+2LvHJoO+kKSxqz
	 XJkfxheFQLQFw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso11855800e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 05:52:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+mzIo/yIMVJqFS6HUDFgs3E6C7j90CWT1r44SBlgqOXo0AcUxwwH+G1U2Khve3/scJQtjSi8KTp5NZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5BBXiibiC61uEpNiu4D1j+Eem4eIMhyq1sYiCvMZ3WepX53az
	Om7jE6XPDQaeYbeynWk8uKEB9BPxEXmFNNC55SRKLTyg4QO8BPEYs+eRwRVmiN/9QAxhsFl7mtS
	u817w+q8tYs7XxXc1aRl1sNz2Y0BJvgM=
X-Received: by 2002:ac2:511b:0:b0:5a8:9bb6:230a with SMTP id
 2adb3069b0e04-5aa3234cbb9mr4007664e87.18.1779799962931; Tue, 26 May 2026
 05:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-germinate-ageless-631033d22797@spud>
In-Reply-To: <20260519-germinate-ageless-631033d22797@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 14:52:30 +0200
X-Gmail-Original-Message-ID: <CAD++jL=p2RS4BHawQ2msprbmCu=4n92QWeFXgo9fRmTFcxraCg@mail.gmail.com>
X-Gm-Features: AVHnY4JgF2dwXSt4EuMCwBggSUmrP5Z_ATVf9jxCtANBQRza98t4Opi_-QI2VLg
Message-ID: <CAD++jL=p2RS4BHawQ2msprbmCu=4n92QWeFXgo9fRmTFcxraCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] generic pinmux dt_node_to_map implementation/spacemit
 driver converted to use it
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37538-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 80EF25D5E51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:37=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:

> Here's a real version of my generic pinmux dt_node_to_map
> implementation. I tested this on my bpif3 but the dts in mainline is
> very limited in terms of pinctrl use so I would really appreciate any
> testing that could be done with a more complete setup.
>
> If you try to apply this, it's on top of Frank's mux series. It's also
> here if any of the spacemit-ters want to look at what I did to their
> driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3D=
spacemit-pinctrl

I just applied it and it seems to work, at least it compiles!

No point in waiting for more review comments, let's ship it and see
what happens.

Yours,
Linus Walleij

