Return-Path: <linux-gpio+bounces-32387-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJoqLuJkpWmx+wUAu9opvQ
	(envelope-from <linux-gpio+bounces-32387-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:22:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3191D660A
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E8D4300A4CE
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 10:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8D2396D2E;
	Mon,  2 Mar 2026 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBPoZkX4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01191395D8C
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446607; cv=none; b=bvZp99aqNsSu6jelCyziHEhfAn9juNloAEZ2SMSpNgd/U4B3924XDc9x6EL7ntcTjHZaUloEFXL7iff+vO671t7p9YQjMV/zB82+YM28/c/Lhu7G0rNyhqpwKjQ8dGDguoHPII/PuCoqETEeAi4AqnA8mt+gGy9gN4R6VXJX3UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446607; c=relaxed/simple;
	bh=zoqb2DtcQzLG9XG/z2X8OoAzX0f2otKRomNT0ZPBqsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GID+CQwFOqZShTBT4cd95e/kzPJjYDYHojBIoHh7BgMb+nCzdkVS27IjxJSPPg8WsFGctFmmCsJL7uIcGw31HgpQdgnjcnPgUPB90VsYeD1zw/8t9X9XD5trWuKs6HF0GjcSDiPC1pPD7vf5PjIHnW9jIk+5c1JnHgnw0tPMTFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBPoZkX4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24D1C2BC87
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772446606;
	bh=zoqb2DtcQzLG9XG/z2X8OoAzX0f2otKRomNT0ZPBqsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IBPoZkX43u7izAKNoUK9MfxNMfml3d+0A8VH0IoHckcFKUD+PVYkyLOAQirzWgzYu
	 8bQ9WK+ELiU9U83twpFpVhXsflLSqVp1WXJUC5RMc2m4CCQVKLGj1vYHKj5vSgckge
	 a+nnN+euFquF79HumPHCY4jKgb41vfV8ioq4Foxt+6r7CDSPcww2XJR14KMTsL5JP1
	 T8V/RIsWMtZdGGWP3MjTTJRcgOmuaGYayU1x8s6epP/B3GGnxl7qgjLAGdEmZ/jLSn
	 XeH/YY3VmgOt2ONwhxWAEPDu282nfKW0xeQx/yO2sUjve/65S4ZTqDvKM1kw4PZ5EY
	 kYpsbuCNJGZow==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7986e0553bdso37482447b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 02:16:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrTGnzu2Rt1+Wzeh7NIjJtaNjGXfZnrSJoeQurqby0tbfpHXqBunDFXxvyW4uM24YeGJIXzyVE57VX@vger.kernel.org
X-Gm-Message-State: AOJu0YzdsiiyShE5wB0YXL07JOqLe8r4tjPqEgOuOQqZPYgnpqwMp2BU
	Jt4LkKffc+rZNVeg4feOvC+eq73Al6EF+DRi49Z9U05OlQcpEYZKiC6f2f9EJmIpAr4nwhXAUIH
	2idtOAPtg8/agRQ4BjhPjB06rUAj6+OI=
X-Received: by 2002:a05:690c:6d03:b0:794:ecaf:c4b1 with SMTP id
 00721157ae682-7988550a903mr109102147b3.25.1772446606054; Mon, 02 Mar 2026
 02:16:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227215624.1094832-1-ethantidmore06@gmail.com>
In-Reply-To: <20260227215624.1094832-1-ethantidmore06@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 11:16:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLk0ReSHFO_KonnJbUW5KU7yu3kTpgvL81zBdNZVxXnKDA@mail.gmail.com>
X-Gm-Features: AaiRm53tT_jRU0FF8Mg-sp6gmFtHJvhf2v-qKHl0mut4nLmf0Qr1RK2NgCIjYUU
Message-ID: <CAD++jLk0ReSHFO_KonnJbUW5KU7yu3kTpgvL81zBdNZVxXnKDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: pinctrl-pic32: Fix resource leak and
 convert last manual allocation to devres
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Joshua Henderson <joshua.henderson@microchip.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32387-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B3191D660A
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:56=E2=80=AFPM Ethan Tidmore <ethantidmore06@gmai=
l.com> wrote:

> I made this a series so it's easier to backport the bugfix.
>
> Ethan Tidmore (2):
>   pinctrl: pinctrl-pic32: Fix resource leak
>   pinctrl: pinctrl-pic32: Use devres version of gpiochip_add_data()

Patches applied as nonurgent fixes, thanks Ethan!

Yours,
Linus Walleij

