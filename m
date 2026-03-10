Return-Path: <linux-gpio+bounces-32903-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKHVDKnjr2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32903-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:26:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BBA24858E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92FCA302C6D9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D1143D504;
	Tue, 10 Mar 2026 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsYBKMyq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB43A4F2E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134619; cv=none; b=VpPXJIPRPhZ3vnYV9uFvcEiJvrXdcjPfjCqWJrz9MhzfXuakzv2O8knUOXmfEZFtgHFj/cT8goyjlU77EVwj2aJFb4C1VQh9Vmhp9VMtca5ScS2CGYB07ZI16gmPFvDhqKW2WuprtdFIHh3jEaCICwPIjEvATvKbUTA9vIHZTUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134619; c=relaxed/simple;
	bh=1VhdsvctOPPInwjU04C8i7FrYJ3pYmp/oUZ4sm6hWN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thEzm37MplPjd7puILJDvBUtY5ebsIq3iRJrtbnrr1s8uPpKvF1nimBD1IdcuDnFHUsUwbDn2gB1ZsFynsf614l5RS1wPw2/dctCOkJCkjvl37FS8tew7wMNdMx7VxDfL9/5UXkyt/svqNguLZcQJv2WaoG0t/pDXFTlewpE+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsYBKMyq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C10C2BCB2
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773134618;
	bh=1VhdsvctOPPInwjU04C8i7FrYJ3pYmp/oUZ4sm6hWN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tsYBKMyqewnDvu3QnwOXJpTozeaW1Cq2NAPg8EhFJmB4tCuJIdapTdEhLjO4cLWPZ
	 knpJacCfmAm1wQ1p7hgmcxncaQfbWZjiCov+9sEV/sOyTDhPvdOvkVSYyejK76nG8s
	 OncqWBk6Jcq42QU12EjGreRzzY73Jub3byNj20PPwwDtCufPpqvU6oiBaVvJjFy8Et
	 5897+Bbu2YUVip7IrFOUs78qvSjOY/Mqxn0tZd9V+XQ5UVYXrJh7K5YSbVl4A+mqNu
	 IUv2IPIGdphCq3emrbViDdggTWU74Nsjt26tc6WzsxQd2MbOeiW4Djc/fRpYBOP838
	 yb4qFKuYYNGYw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7986d231b3cso157592077b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:23:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVACC9Fpp27Oj8RMEUBSQA7p+4nbbRet26tHraddNMcOMJz9gtybh9+pzk/J5U4bztlm+0i9p6wojjz@vger.kernel.org
X-Gm-Message-State: AOJu0YyemZQemewDfT+0RYDyAc4xd0KByArJVudp1xCoYyz999fqtfz9
	LAnWOTNUloekkOoZFC6SQg0zwwqYyjP3B9tW1SrlimIXw7a44Br1Pz2XxIzMBSSfbST5ZQ1Kcjg
	NfFHV024YdT3fEpFD6TCby33yoF/EC+s=
X-Received: by 2002:a05:690c:338d:b0:798:55f2:de33 with SMTP id
 00721157ae682-7990a67eabamr26807187b3.7.1773134618046; Tue, 10 Mar 2026
 02:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306063411.2041232-1-rdunlap@infradead.org>
In-Reply-To: <20260306063411.2041232-1-rdunlap@infradead.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:23:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLmDfPRvD4EfHpLjbF5rvcZrBWM4A-+BmRwXEYEcWJ4QpA@mail.gmail.com>
X-Gm-Features: AaiRm51Mv6PjvWvJQZCUmGPcNRXEtPZ2mMosgtjimcuxjz3z5nZjwgEkkU8MbrE
Message-ID: <CAD++jLmDfPRvD4EfHpLjbF5rvcZrBWM4A-+BmRwXEYEcWJ4QpA@mail.gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: s32: correct kernel-doc bad line warning
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 47BBA24858E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,gmail.com,kernel.org,pengutronix.de,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32903-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,infradead.org:email]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 7:34=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:

> Insert a "*" in the kernel-doc line to resolve a warning:
>
> Warning: drivers/pinctrl/nxp/pinctrl-s32.h:18 bad line: this group.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Patch applied.

Yours,
Linus Walleij

