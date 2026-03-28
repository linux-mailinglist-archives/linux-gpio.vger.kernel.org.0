Return-Path: <linux-gpio+bounces-34353-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDy1LEr/x2kqgAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34353-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 17:18:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5103C34F250
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 17:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E3B8300B468
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 16:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C202634F47E;
	Sat, 28 Mar 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsuRmaJu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8616B34A788
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774714687; cv=none; b=sHB6QdU2ak/2iAFoo1uimvp2YnCnx8nhk+FFgFv0g8R4b6k4ENAzujL9NMqocVjNJ06Wriy+kzMt8y+hnsAfcIpmLAvijOa9Rm+LwS4p+bJTPiFovmQc1LNnhHXhVct7IL4DCHyJYniQ1ZXCNANz5G3NUObe94nPvXT24FntTgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774714687; c=relaxed/simple;
	bh=BCwhnZkHq7orJJATJ99lfTzegCRxTho8kUF2KkI0UXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSNyZRxsto1ItGzBQ43u4lmzu1Oy2al7eAp6AC17+apYPNYwU9/vg3i8K71aLk2O/q/+9dRiuxa7EbBCcyqTbVnwaN1D83iTUnF+Ph2bg5mgHjFopFy3TX2hBShSUeBALzmUBhPuOMSEWsN+cnjKkujGGsT9qZM9uQgdpfvNUCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsuRmaJu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0E9C4CEF7
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 16:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774714687;
	bh=BCwhnZkHq7orJJATJ99lfTzegCRxTho8kUF2KkI0UXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VsuRmaJuV9kx+HvZ4ZaA5GbdxCovoauGRPk1XOdp2VGHuOrluu9r0xF15qfEPzvs4
	 4db2G4LQMOID7230pqyOsNafqDIz1q27MrKFfxkKropt/FozkFRZHT6IsPNA0B5MzB
	 RI+W0LXDx7PC459UCwOMovezRGQeUUdRovQr7i67QzO/I54AZa31ZiaKuBUFSLM8j3
	 FJihHtN6HJge4ckg8GrEKCFKpr/2xyaWdGwIilf+n37lohE3RjjJdMub07nFZzsSlg
	 nYfRxWfKkSYLtJzPAIxYmT4Kx0MHpnZzQCVwX+8LbZ8lUo4+1rX1wBNKYxsBfeT6t7
	 w5ETY6JHS4MHQ==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64937edbc9eso3125769d50.2
        for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 09:18:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YwP+e3DT2uTQGNJAjYdO3g7Z1b2BoIhrJtLB/eQllTVcX6Ay0zB
	I9hQqVAcUNxBtz5qYr3oyVNdH9RTdpLjmD58rDp8Km3To84c05frAH/Xjsb3KEMzvwRKeZmsQpV
	JzYm29V5gED7OYFFLOiC4AvEz+jTyYyY=
X-Received: by 2002:a05:690c:9304:b0:79a:6a75:554a with SMTP id
 00721157ae682-79bde01413dmr56222657b3.30.1774714686223; Sat, 28 Mar 2026
 09:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774606726.git.geert+renesas@glider.be>
In-Reply-To: <cover.1774606726.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Mar 2026 17:17:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=O+Vu+8HGL6wi9YtDAOi_a1yzEAAa8dyCZVGSuvcC-KA@mail.gmail.com>
X-Gm-Features: AQROBzBQUfWkPkePszA79CkS_TXT32uL3CScuVQmzL-4Rb0wR8nfDTbIJuUvnQs
Message-ID: <CAD++jL=O+Vu+8HGL6wi9YtDAOi_a1yzEAAa8dyCZVGSuvcC-KA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v7.1
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-34353-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 5103C34F250
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 1:11=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit fb22bb9701d48c4b0e81fe204c2f96a37a5205=
68:
>
>   pinctrl: renesas: rza1: Normalize return value of gpio_get() (2026-03-1=
0 10:33:47 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v7.1-tag1
>
> for you to fetch changes up to 3f92867ce3ee2a274ebb7e7d5de7f6ee85da21f6:
>
>   pinctrl: renesas: rzg2l: Drop superfluous blank line (2026-03-26 20:05:=
36 +0100)

Pulled in, thanks Geert!

Yours,
Linus Walleij

