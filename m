Return-Path: <linux-gpio+bounces-36521-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF3FOmKvAWrXiAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36521-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:28:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E450BE54
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C0DB300617D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6EC3D75B0;
	Mon, 11 May 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUPAd5Bq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7683D523E
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495326; cv=none; b=bdNXajnU/jEpfxqKCkY577C8IyD5V/ZclnrLMvxCI8IFDSpYqbhFI6YJc+Mou07MB0bBPRhC0iU80JMfe/Rhxgi7hZaGyD3J0g4oRc4ovQSYwY32wsGS+kmflwzh8o6VoeNMwce6V0x1yo1S16t/onAEjzVqi057pVryQE4mDJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495326; c=relaxed/simple;
	bh=YxYicyujQ1JwUglzX9tz9nxidX11FGuQpt1H8k8UcQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZm/N4BTm3YuXcxL/cbw/kkW6LGNYWSjwJ+pB4ON5kitC/LpnCExISQmsHd8ABfoM7KIELpfzKzRnRswkAW9rrELtSFfUc+b6IU0NBPI55IlouBKQCjMhYbu1CR6DRHzDOzzkdfrQ6I+cMLGaGGzDmtsgSvTxIryXxOAfytT0+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUPAd5Bq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B8AC2BCFB
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778495326;
	bh=YxYicyujQ1JwUglzX9tz9nxidX11FGuQpt1H8k8UcQk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HUPAd5BqMPHcVfpyXTGyj4lg2pMGtedmzqZiajPobvYj6MjcAlsIUMR/RSwRv/+WE
	 ezRyanB87xEUjjXyiCfJdcZZag49HiOwzG7FdVQrwBp1v7G8964oWmmkvsXXUJOCBy
	 XkIGMlOlz3tMSTpOry7mCcvi3X3DcNuxtYbv9OmtITirMnOll57iCoXdn7bS2/IWvY
	 1WzffaWxwXA9JDlJH9cKrePNenv+9XcEz7zpOqo82TSOYhwBPWfjTPzR//jpflsWl9
	 9xyxD3tEC788097tUpEXLRbPlDmPnD0lcHdTeUSsn6DVNxpfjYuY1iFzM+qnlg7nTh
	 wVKsJPSrAj2kQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3937014be0cso37071411fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 03:28:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+D2touZ03kZb8rs6oFyi8tiCbTFxTRpsrBiP5KOwUU73sOFn3NwGyN1qmxm/pza+rLrlKSnhzEH3Uk@vger.kernel.org
X-Gm-Message-State: AOJu0YwY2C1B35Ammqg57ffotJYnKrxQJrFjs0Mq9frXxd+zGCgNT3mp
	zuTBHys67CJSV0WU2HuF+MVe5C5nOHKvvTA+YU9OTQDfqwr45onIvyhSPTJqWyUkPM7SMbM4rli
	AZ+QIwC+yGx0KBnWSt+cxMNUfCS6vVzL6xMYxN/lStQ==
X-Received: by 2002:a05:651c:2107:b0:38f:e28a:617e with SMTP id
 38308e7fff4ca-393f4ef7c91mr46708691fa.16.1778495324694; Mon, 11 May 2026
 03:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <afiNrr4Llm0LWw-5@ninjato> <20260509091208.18346-1-jie.i.li@nokia.com>
 <20260509091208.18346-3-jie.i.li@nokia.com> <af8IB46ST70lXVsk@shikoro>
 <CAO3NRJg3wPVLgnyd=eD=TkkS5J24ww9WP3nNuiCnCL8=aLEmwQ@mail.gmail.com> <CAD++jLmcFEcHoCWq_4=7so5gV5Usj45n6qOYj8xrfsgAYufkEw@mail.gmail.com>
In-Reply-To: <CAD++jLmcFEcHoCWq_4=7so5gV5Usj45n6qOYj8xrfsgAYufkEw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 12:28:32 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdGd-6vUabTd5aJpjMbxRT3Mo8YH_jVyZzGLPyFsvce5w@mail.gmail.com>
X-Gm-Features: AVHnY4I8LqBfDvZs9wgXx4oyqy8FlsJurcqggpDGRGpYW5Nz8PNWwaCnZOPf26o
Message-ID: <CAMRc=MdGd-6vUabTd5aJpjMbxRT3Mo8YH_jVyZzGLPyFsvce5w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: core: support recovery for single-ended GPIOs
To: Linus Walleij <linusw@kernel.org>
Cc: =?UTF-8?B?5p2O5p2w?= <lj29312931@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, wsa@kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jie Li <jie.i.li@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 545E450BE54
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
	FREEMAIL_CC(0.00)[gmail.com,sang-engineering.com,kernel.org,vger.kernel.org,nokia.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-36521-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 10:19=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Mon, May 11, 2026 at 9:25=E2=80=AFAM =E6=9D=8E=E6=9D=B0 <lj29312931@gm=
ail.com> wrote:
>
> > Thanks for the heads-up, Wolfram.
> >
> > No problem from my side. I can send a v5 rebased on top of
> > b47bc7c022dd if Linus prefers, or leave it to be resolved when
> > applying since the conflict should be trivial.
>
> Send a v3 based on v7.1-rc1 I'd say.
>
> Bartosz can merge patch 1/2 and offer as an immutable
> branch to Wolfram to merge and then Wolfram can queue
> 2/2 on top of that. This is usually the most bullet proof
> merging strategy.
>
> Make sure to put Bartosz on To: with clear intent per
> above and he'll probably deal with it.
>

Am I missing something? Why does this need to go through the GPIO tree
if it doesn't seem to touch any GPIO file?

Bartosz

