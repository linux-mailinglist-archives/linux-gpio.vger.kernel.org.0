Return-Path: <linux-gpio+bounces-33926-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMNiHolOvWlr8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33926-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:41:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A5D2DB1CC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37E6630BE1C1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A53282F23;
	Fri, 20 Mar 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSbWswNC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDFB248873
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014010; cv=none; b=DPdNFTUNIV9qQSqltXztoqeOsp6f3mHqcM+NZHdZ/DPcQfNhvYLk1G5Ds+dhRDdDGBJhSOzKHrE+CHGucCUFqAzispLkQHA3vH0fOPEpbsLVD1TpN0wrxff8bwWzT64JgJoG5s2CVZd7xNNjrWui9TEjsYRT4AeyhGRKzS3h6WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014010; c=relaxed/simple;
	bh=a3oCvWwktJOka9q2aoujsHbZ4rvoudf3Wlq8RAfXnIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BaMZSo4TvscPDBN1v1XSP2EhifyRciH/rSBoUS1K7DGK9RD1qv1mR8zP+wCgzaApDrDacB/lUHXtQADilhgdAaSzmLzBaAAmrZMDxohHySbuEqT9TqLV1FIq56izKGD2vBzis4GEFqYoHK2ScYDqlnIeygi4+SPBvC9zS0nkLvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSbWswNC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC95C2BCB5
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774014010;
	bh=a3oCvWwktJOka9q2aoujsHbZ4rvoudf3Wlq8RAfXnIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pSbWswNCG1U+am53GXN61FyyVrA/NHtY2WmM4qZpgNbTT6uGcwitK1NnB7MwESUoz
	 W9CkAlCshbYKtU98OnBIEvmyp5Og2nNApzud/zbsoQPr+BIv+EoAfzeiSj4f7101yB
	 yi5IVR91Yw1b8BXPExgaxxl0QEYCKs+X+YZr+TL3jlrrjtXbyuj0Ae1daXsXO7YKCA
	 1wosZczUwO8m71FISeB4O6YdO710eNq5XjHIZoMh+ZOOm+2BthPag38s3FyQ9vndi8
	 UlfVeLWsGJxxtENegHwZY6Tylflz8jpybEIE4oOGD1CONDbsMgO3e0EM16y86HP3F1
	 PQcwJ4y6Ydntg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a5a37113aso21874647b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 06:40:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YzYxH5Ca6HmT6XfgaQ03yQOlLxiDGn+5GXagk14aJYrQGoU7k2+
	nNiXHHy7pq40REf9L3q61BL+5nintiKQIba3km9z3QdDKAyhNP+Vx9r97iG4HVL15/PM4GuKiLI
	FPGIcnBT0q31vMp2k6J7m3FKdzhskV4o=
X-Received: by 2002:a05:690c:f14:b0:79a:6f11:3ac8 with SMTP id
 00721157ae682-79a90ba015dmr30839247b3.29.1774014009652; Fri, 20 Mar 2026
 06:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320015323.36383-1-rosenp@gmail.com>
In-Reply-To: <20260320015323.36383-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:39:58 +0100
X-Gmail-Original-Message-ID: <CAD++jLmSs_zr+VjOFDcWeWd8k2fvW4D_=AB21sOzFDNeRfY77w@mail.gmail.com>
X-Gm-Features: AaiRm51td7xH5-vHG8a3FglHGrwjolWTDZvQoaQMPmI-u_KtaEKBB-jCCe9iV-Q
Message-ID: <CAD++jLmSs_zr+VjOFDcWeWd8k2fvW4D_=AB21sOzFDNeRfY77w@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,thingy.jp,gmail.com,kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-33926-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-0.625];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C5A5D2DB1CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 2:53=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Use a flexible array member to combine kzalloc and kcalloc.
>
> Add an extra counting member to support __counted_by.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

