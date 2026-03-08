Return-Path: <linux-gpio+bounces-32788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF85IUELrmlj/AEAu9opvQ
	(envelope-from <linux-gpio+bounces-32788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 00:50:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A3232CB9
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 00:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A4413010163
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 23:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CC83502A9;
	Sun,  8 Mar 2026 23:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eN3JCU5O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256241D5ABA
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 23:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013821; cv=none; b=fDls+bbraFpoEEB8fwnGI2wzpaTeH0GeGzum7yxN4Qy7UuneQm2znTmaRkgKQ/ZWSNUlH0gVaLnjjY3VEvDc/yThEfHjWtn5hDknpc/a10BE6XyL7yn3eAHZssFiNPefGdqIKcaE9Z6gGpaDxCtcVkJYVMrq4SUshEYVPuMPIpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013821; c=relaxed/simple;
	bh=qCHWW+J04WzDSskZohgYm0BWlc3pQpDHzTycUtRO0cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvc0IUeMq+Ia+3zDgqfHsNXjcZ8NTQgsdg8tEIX3lWVO9NnrLgC4Mjs5G7HACK1VkU9Ue9oSbdaNOwjY9V2rRotF/2ACZ5Lq3P2Ehj/x2mAzMvs9tFskUkjohrryP4bpt42MKoSjQWrta1xS36QVV6q3GV1P5Pem/z6wiY06yVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eN3JCU5O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D364CC2BC87
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 23:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773013820;
	bh=qCHWW+J04WzDSskZohgYm0BWlc3pQpDHzTycUtRO0cw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eN3JCU5OcDinOhE7mDR+oPLNEa0hEuXA1Pc9NqqqtNnKwuv8hBcdXJ0PoJ8dP0h5g
	 VSgdyM69yr2XREfkWYOTgcPkhiz9p72uIKu/ABPikZFgq2dWorA+K//urYFaA+PsBH
	 npPboAa7Bt8vZ422cmtsMvomFt0NxY6crWFjePgNhy7i4jI9y7zjtPjQhaPx5Eordf
	 AXM9T0iUAhq2NbqMc3VF+SuhsOINws8W5i/D+ab7XbBYXfxwTDx6CJ1raskso1+8FX
	 ug+qJBwmzdKu6w2ks8OrPdqN7e18gq0GW/smpUx++ex0JJ1dnRvX9Z9pmVXFR/GLQo
	 EuSyluAD6Lk8g==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ca9ec3ee7so10697178d50.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2026 16:50:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0mETmjpYQOzoqV/C9607KNUtEOQE2edgpgvGoFpqrBVT9vEfHMq4vBxVzAT1lVhlmJJuuX+gCKlNR@vger.kernel.org
X-Gm-Message-State: AOJu0YycSCSNZZhgppOphHb4eU2SRLSibvLAue2Kr5HD6QmshicZ4SIX
	mJPI1HvOgFatLrP7PDOm1SAWZalUI6BEEBTjzoc1bmr1iEgr7bjaZy16BM03EpNPEfgXfNC0f6X
	gMDaQS/06PLSKD9R9bG4utGkanolMBDk=
X-Received: by 2002:a05:690e:1401:b0:64a:d6a2:c6a with SMTP id
 956f58d0204a3-64d14390708mr8908299d50.88.1773013820274; Sun, 08 Mar 2026
 16:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305161106.15999-1-adilov@disroot.org> <20260305161106.15999-2-adilov@disroot.org>
In-Reply-To: <20260305161106.15999-2-adilov@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:50:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLmumdyqna_1mRiTXpJLsoa20wPYLY2sV-XPhK+Z+sZhEQ@mail.gmail.com>
X-Gm-Features: AaiRm523cSlK0v_xh7JD3MiOK__9v4myPC7sE1h1Fq3Zw57SdQrNWywaWkXbhGQ
Message-ID: <CAD++jLmumdyqna_1mRiTXpJLsoa20wPYLY2sV-XPhK+Z+sZhEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: realtek-otto: add rtl9607 compatible
To: Rustam Adilov <adilov@disroot.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0B6A3232CB9
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
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32788-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 5:11=E2=80=AFPM Rustam Adilov <adilov@disroot.org> w=
rote:

> Add the "realtek,rtl9607-gpio" compatible for GPIO nodes
> on the RTL9607C SoC series.
>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

