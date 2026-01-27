Return-Path: <linux-gpio+bounces-31108-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOGoDx+AeGkzqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31108-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:06:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E6B9179E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D95193037176
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDED3321CD;
	Tue, 27 Jan 2026 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPV4DL7m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E407C3321A3
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504594; cv=none; b=u1Rrvi0BTEGicSfJzXKH8NPhuq4mpvqpgYk6sc2BqPJaJ/yA3zdMFd7sRYz//EwGscDpK6ZZkE8oP12YUGQtBuqgFIJebzDpYS6sZ6YNot6w42b+6BEzduUXf+QmL9/MAOfqE/wHFnBBxzAFjJqtA2mQ0Xicer0aF2T91D+qEvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504594; c=relaxed/simple;
	bh=MeqVQloYBUgHFacGrCxsF/LQzrrfHdlNQ+KOGNUpnDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyXqWBGA9hc5/CrPuGjZkZ1pCzeoVyZE5Lq8pyFdSXqo01dmp2IQA8H8faErqdT725sEAX0Yb3ypXdubcUMmdyzH0E0z5qSI2N3uemzZKdaATx2hdzOL+nQNRFCZb3aSr+7sYU5lho0o+fvKCbqj4a7nKe4KmxlqSLsqq394efU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPV4DL7m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8A7C2BC86
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769504593;
	bh=MeqVQloYBUgHFacGrCxsF/LQzrrfHdlNQ+KOGNUpnDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pPV4DL7m/gJvEHlaiCbGnx+4lsWCYgMcLWzvj+ZC6g2LZ8/ujtsYjQZwM8+zNeHr+
	 lbl0L29BFzybBu0YzW/P8gDh1fhHNrahKL0lP0C8pUEl8A/ud0jLY8XTPG34BV/YCX
	 fHaC1vSf7nRAEdZB+Rg6Fzuu+NGqNjpv/e7le0Hk7ElHPjkArc7MnW04pKzkxEYSds
	 8XBwpoyMTZog+4Y9LHtO9ATOcA1rVBOh4xADhxtlP+mpKgR23jsWPnxO8ywxGK5TTX
	 aGQovehOrhQZm6Rv9M6L7IqWMWq02SoJ7UG1EAhciLIgsWYG9lnDxayANpZ1P2nzcT
	 WRhDrQFDoDtcw==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649389b1cc5so4860631d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:03:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwnm46lclgGr0Mk2Qxr2ZaDtBnf4fbjuZaFBW6zofE9ybVAjTifqjSRgUxUNL0m+u0MoBwqJwe5hrA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HKg13DeUOi0lqC8ge5/WE0BMSJdYUQ8T95sJckXWVEr2C6Oc
	Z2fguzmsGdmT/KWa6SpBl9FFwIuqSN9bCNcQIdSYMHTJmj5jus8rZq+PXIcPAe01gLJzX1mG6lV
	EDJhKJPPaK5issuW/1dgQw5gi190pNPs=
X-Received: by 2002:a05:690e:b4d:b0:649:6581:a68f with SMTP id
 956f58d0204a3-6498fc15729mr549082d50.19.1769504592911; Tue, 27 Jan 2026
 01:03:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OS7PR01MB13834D5838A90C138C62CD817BC8AA@OS7PR01MB13834.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB13834D5838A90C138C62CD817BC8AA@OS7PR01MB13834.jpnprd01.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:03:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLmx_kdVF9HuOt35EEtFVBYnaRrDYBkTfU4AyaaKeBPdVA@mail.gmail.com>
X-Gm-Features: AZwV_QhrL_MsPD_jNlzFPukjH1u2v412Vs0zwRaVna-VU9spr3ixByrU9UpuLWU
Message-ID: <CAD++jLmx_kdVF9HuOt35EEtFVBYnaRrDYBkTfU4AyaaKeBPdVA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: enable ies_present flag for MT798x
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Shih <sam.shih@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,kernel.org,gmail.com,collabora.com,mediatek.com,makrotopia.org];
	TAGGED_FROM(0.00)[bounces-31108-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,outlook.com:email]
X-Rspamd-Queue-Id: 91E6B9179E
X-Rspamd-Action: no action

On Sat, Jan 17, 2026 at 4:05=E2=80=AFAM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> The MT798x series SoCs have IES regiter definitions. I think we
> must enable the ies_present flag to correctly configure the pin
> input mode.
>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>

No one said anything so patch applied!

Yours,
Linus Walleij

