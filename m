Return-Path: <linux-gpio+bounces-34746-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFTKL0ep1GmkwAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34746-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 08:50:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF4F3AA7AA
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 08:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87866300B9DA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 06:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DEA38BF94;
	Tue,  7 Apr 2026 06:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGNC2/lq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F6A38B7CB
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 06:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544546; cv=none; b=HjPIan2SOunJ0F7OohPwuUy6h5/7QrZmQbkk4w+fXRryhc1QN74uZNGYV+RtsyaiJ471PZakeRkkq8lN9afxOasB5oV8RglNZL9/pmgxLoyFND8zn6nKDS19/RO98uq67tZ4IdXGot+ENi1I63pJCJY4+NIhqhbfPokN+KVGYUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544546; c=relaxed/simple;
	bh=HjjlIen8rUrvGYqNR05Jq/L1IRmPKRpg+nH7yZl2hRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXxbBP/ITmGFy8GMGRxvoDGdh/mM0fI4Q/AdJDCXCePthEC34sjSfRvB+Yuwztq/YAKG5nXf/+W4M7s6u2XmSmWRQUStaXoWdgD+0/cF4HbYhdZivNP00sLD8JBooSxlhMf4g60BuTKCzdR/24eoyM8GvoS+wzutQPavFB+hKXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGNC2/lq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F252CC2BCB5
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544546;
	bh=HjjlIen8rUrvGYqNR05Jq/L1IRmPKRpg+nH7yZl2hRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kGNC2/lqyiujlvSY6SSWV8fe8eVTjPMe5dVTVNEl1a/g9RTwdfCcLBylgtyOdnWyO
	 j5JN82QNLKuFCexfdfAmwq9aoCsnnWePrIknivfP98412hCf00i5/EH614vO037t12
	 18wfYDVEC8WS823YkuRKRufiqess1ghcV91OvDZFFDO2XRw4UXJjZL442ZShZFxWOq
	 nIAOrcpc0ENNVeLec61Ua2bnpxVE90J4bNNqIm2BLSPpHIWyM4eCnJyZsH5ZEt+UrH
	 pI/C8sG+WOjxUwU9qwXOfxv3uRqJEoKUhSc+eYDQNhghb3n++zAKyy5JWYXcJhRdoI
	 CUNnylxTI4Bpw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79ea87af213so82251727b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 23:49:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2p+87Yqq7RDrd0Y2JIYRElcqxz6mmy22RTFl4quYXE+TvajAMl3bjvRv3icwLJ6L/Tqk13n2m4gj0@vger.kernel.org
X-Gm-Message-State: AOJu0YzS9aACTqUPUsZTLtH1vEONdKW6JeD959gQ4kb7QQs1CyJu1/jJ
	4qm3/q61IOXcTuu8G0bgioW1N5aXNabj/FrMFP43EybEPpeLCOKOHcqeIgYz9zuvLBHh3gaXlNV
	leG6grmexOrw3VzeNC5ZQsPz8dO12t7M=
X-Received: by 2002:a05:690c:4903:b0:7a2:46b8:3858 with SMTP id
 00721157ae682-7a3be360aaamr143427997b3.24.1775544545311; Mon, 06 Apr 2026
 23:49:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com> <CAD++jLmoHiJWV3J8f3TtpmQWLpUFD24icQEv2cbO3+x7775zxw@mail.gmail.com>
In-Reply-To: <CAD++jLmoHiJWV3J8f3TtpmQWLpUFD24icQEv2cbO3+x7775zxw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 08:48:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmyf9mD4FgmLqNdrP1WdFgQptGZ7KbVOhwYCRrxZQXuHA@mail.gmail.com>
X-Gm-Features: AQROBzCgkwudsrLfavBP6ja7953ovvgx3yZllIUGcsr7ztcvvCdDDTr3vn9C_-w
Message-ID: <CAD++jLmyf9mD4FgmLqNdrP1WdFgQptGZ7KbVOhwYCRrxZQXuHA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34746-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,microchip.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BF4F3AA7AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 8:42=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:

> >       mux: add devm_mux_control_get_from_np() to get mux from child nod=
e
>
> Didn't get an ACK from the mux maintainer for this but this has been goin=
g
> on for long now so I applied it.
>
> Peter: protest if you don't like this and I will back it out.

I created an immutable branch for Peter to pull in if he want it:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-mux-pinctrl

(You can also pull in just the bottom commit which is just the mux change)

Yours,
Linus Walleij

