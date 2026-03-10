Return-Path: <linux-gpio+bounces-32921-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBQ7IWwGsGlregIAu9opvQ
	(envelope-from <linux-gpio+bounces-32921-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:54:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F0B24BBED
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C94530B220A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 11:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654F338BF85;
	Tue, 10 Mar 2026 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBKvcVRa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275B2314D13
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143561; cv=none; b=iVB+2khYK7xeE27CXnvpKG1Te+Cssi4yfGV++fCkLzWezngmFqqJcd1MqLBt012lOLHH0a1OBVXjFKRS6VH3IxjNkbpMqyvTCR80iLRRs4Tm3zJZxHS2sMsgEM1x9UT0AA8keRUF/UlKaswj19ATxkNlAuaXx31d1uvZVxdD6UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143561; c=relaxed/simple;
	bh=6LFCZqvL3posu43TLCQlBHu1tQWOrRwNMdOPAUK1Hsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbA/p5aMIgu9zh8ISQt93qTWnjRforI4LEakGz+S+ye1W8YUmNfe2WLpUwYnEneunTorOcQL5e9LvYxwX0iMruBoy97QwCIZryLomgFjEOpaUCo+/dB+bUMenFSgDyVRS6pve5qZ4hYKArg3gIcKUfoBddZyxqtZ/TFu5AsOygA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBKvcVRa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50C7C2BC9E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773143560;
	bh=6LFCZqvL3posu43TLCQlBHu1tQWOrRwNMdOPAUK1Hsw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cBKvcVRaBVvVqwYxjm82tMvt+e/sck5zuD98LGFTHA4TVh60TbbpIuXQq/eaRtxuK
	 H7EIfRF6MbiQSmFewaxaIolZIRG9ajLgQCX7cQb7VKJ77wDP6LKZyKpwVW4MUKrvvV
	 DNcYD/5YCT7/FbcAE0oXeT1ZK1/161sqiEWjebst1RD12Ttq5S0AIod0IGeoskjmM4
	 zC5Cn6BYsdG4LVvPUR2H2pmwLmAGNaeV6/fkX1q9N5+bX/75iqf/kfrL1drC9G1m7q
	 UYTIFYNl1pojubFcY06EvyAcnWz2BTRNiio622ESheoQOB/YdkIjgcWM/vLdE8qJNW
	 SRTBDDcrdA34A==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7982c3b7dfcso129768837b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 04:52:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiVtbAKOWhA9Jxd2B7JRQCJqckrxIosIEuNeZrRapTebgxZJRNM5NLLjNUbvDHvyvT1D12U4yFUWwD@vger.kernel.org
X-Gm-Message-State: AOJu0YwZGMMQs6SUfQYuEmLrwTKv/C3M1y0/MfyrFDwp2DsMMRlK+xF0
	jFzdc27oxecYPnONNC1hEXsMz6i9zF77t+BycxnOhi3UENNRxz0wP5ekDWk9qY3Takli7m8Chxo
	Q6FIPMhs/FG4Rx5K2+o10bCkMM6jGevc=
X-Received: by 2002:a05:690c:4c02:b0:798:99ae:765 with SMTP id
 00721157ae682-798dd788971mr134205317b3.46.1773143560187; Tue, 10 Mar 2026
 04:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021201.47820-1-rosenp@gmail.com> <CAMRc=MfGkVpk9rBLvwxndjveXemY6t7nWOBX9wqZxc+Qe7aOCg@mail.gmail.com>
 <CAKxU2N8Zm6Hg-pr14RS9SCsOWGu2kF3gy4RVuQThMvM1CfLEtQ@mail.gmail.com>
In-Reply-To: <CAKxU2N8Zm6Hg-pr14RS9SCsOWGu2kF3gy4RVuQThMvM1CfLEtQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:52:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLnD2Rgre+JD6VmtihW+JQ89hB-K4bd1dANWFmnCX8C2qg@mail.gmail.com>
X-Gm-Features: AaiRm51FtdF84mkYV7pgCl2oDehSOxKmBTbBBGjzPZ_i8P-wOpN6m_HDfDiO0ic
Message-ID: <CAD++jLnD2Rgre+JD6VmtihW+JQ89hB-K4bd1dANWFmnCX8C2qg@mail.gmail.com>
Subject: Re: [PATCH] gpio: ljca: reduce struct allocation
To: Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Lixu Zhang <lixu.zhang@intel.com>, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 06F0B24BBED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32921-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 10:48=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:

> > > +       u8 connect_mode[];
> >
> > Please use __counted_by().
> Counted by what?
>
> __counted_by(gpio_info->num); does not work.

As with the other patch (IIRC) just add a new member to the struct
to hold the count.

Yours,
Linus Walleij

