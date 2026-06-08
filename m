Return-Path: <linux-gpio+bounces-38127-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6N+EJR0+J2qftwIAu9opvQ
	(envelope-from <linux-gpio+bounces-38127-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:11:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BB765AE82
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:11:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZUwJ9KFg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38127-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38127-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2CF8301BC3C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 22:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA453B14AF;
	Mon,  8 Jun 2026 22:10:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E1E1D5ADE
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:10:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956657; cv=none; b=UwCXS8mrg5szgSCxOIXQypyZl5M367PUeZ4Il9454ny3sU9hgOmPT8Uasr+CzxOaXPJ6PfNGVdphovs0znzrNRYehwyz6tsqtRPwTmyiLo2OMASFNAshN3nV58ioMjVuAMAVHu3P8bOI27ijCcUnyqx1/lEPWFnRNqi0ANIm/KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956657; c=relaxed/simple;
	bh=+ZS2cl578o6qR7L4P7C2sAvZq5PeZuP3zqVeCiJWRZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLnLdnWHIxC+Ks2WnUGF19tTUDDc3EpLUUo/jZn1jNx0qej9+USsZdvWoxoNfc380URKGBpDKwNzdrXgjQtFw3w3XReRGd7lEodBg0BWOL1D7xdTuFR43XJirl2dUywHV3xBbXUfru7qexy+u99D2rOW56p8Bbb/s3A7y7KThS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUwJ9KFg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBAE1F0089B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956656;
	bh=yl96KyAOKI/KCR7Eg2tTmR7DWCsK7ag3KqvU5NrC8HQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZUwJ9KFgnAK6m9dBqc2JIJifbdPi14k0yZE5bTJiaFnBv8v85Zr+JrQTYdBhB22Td
	 2ikj2E2mGW7ohOFa5D+fUwffgD9IW4rp1VV9QU3BYMKvLUEMLcngBZoQefkFVt0s7O
	 d567ghr+NC8YFDaRbp+1ENESpZiVhZYkW6r+lubzI8zI/F+nJgbaVvB02yV+eu2P27
	 seqUx+nClvRk4mlTaWXn0Vj872Smh+5dr8Lc6RyYPUgH3Dqg0z+mHPsFk0NMUyBJ4M
	 FAW0jMkRl/z9RYIiLyZsoDKCHfhffBk5ywUUiL00pRsWP74Oe7c8Iz6Tn8t4wyWVs3
	 VaKoo1NNwdRhw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa7a7ad475so4860533e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 15:10:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YzdRTiv1FjpWjcdInkOoUpR0yZlnLkAl6B7g2nkpofz5OMMyJrD
	CznIV2Eo5ckg88C27EJoYjzcdjXUVFW1y6C6kNKGTYqm9aaj5hnZNXXPNBirbB//XXfY/4bu3UC
	gDG0852pNam6bz3dd+oETXk1ix6Z7y2k=
X-Received: by 2002:a05:6512:1108:b0:5a8:fc25:3843 with SMTP id
 2adb3069b0e04-5aa87bd6d14mr5212366e87.39.1780956655364; Mon, 08 Jun 2026
 15:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602050131.856789-1-rosenp@gmail.com>
In-Reply-To: <20260602050131.856789-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:10:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLmk3jMFS0DD0GGTV9AWu-oHJAoxymcyOKQycVFqKCRnzA@mail.gmail.com>
X-Gm-Features: AVVi8CcbvxAfF0YZQkWVIynJTrTr8MpcRrvWZwvgNzmeRyxUg8684sKBAKbCtpY
Message-ID: <CAD++jLmk3jMFS0DD0GGTV9AWu-oHJAoxymcyOKQycVFqKCRnzA@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: move ppc4xx driver to drivers/gpio and modernize
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, chleroy@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38127-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-gpio@vger.kernel.org,m:maddy@linux.ibm.com,m:chleroy@kernel.org,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:brgl@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32BB765AE82

Hi Rosen,

On Tue, Jun 2, 2026 at 7:01=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:

> This series moves the ppc4xx GPIO driver from arch/powerpc to
> drivers/gpio, converts it to be a proper platform driver using
> generic MMIO helpers, drops architecture-specific accessors, and
> prepares it for module build and COMPILE_TEST.
>
> Patches 1-4 move the driver and convert it to standard platform
> driver infrastructure. Patch 5 switches to generic MMIO helpers.
> Patch 6 drops PPC-specific IO accessors and enables COMPILE_TEST.
> Patch 7 adds the missing MODULE metadata so the driver can actually
> be built as a module.
>
> Rosen Penev (7):
>   gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
>   gpio: ppc44x: Use module platform driver helper for GPIO
>   gpio: ppc44x: Set GPIO chip firmware node
>   gpio: ppc44x: Use platform resource helper for GPIO MMIO
>   gpio: ppc44x: Convert GPIO to generic MMIO
>   gpio: ppc44x: drop PPC-specific IO helpers and rename to ppc44x
>   gpio: ppc44x: add MODULE info

Overall a very nice patch series and happy to see that AI can
assist with this kind of refactoring!

I guess we should provide some slack so someone from the PPC
camp can test it, and if they don't test it, then it is abandoned and
we should then just apply it anyway.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

