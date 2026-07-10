Return-Path: <linux-gpio+bounces-39858-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vs09KY9XUWpRCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-39858-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 22:35:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D5C73E659
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 22:35:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gUBrtBlk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39858-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39858-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2020530C752B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B9238B158;
	Fri, 10 Jul 2026 20:30:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBBA38C42F
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 20:30:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715409; cv=none; b=syJJfzJVMPnJnS9lTwiQK53biyzyhziGFnFoPQyyD5gKMvgCLIp6lVBVNagz3eFBx8NIHCm93PCrr8HzvO02oZ1Dtit5WqEAUtWd7CpPrUT7dxpshzexLg0K1rX8eRPb0wrxr9FO9Y9QzGt4R4P4goKp8eKrJRRVQicvxPYlbnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715409; c=relaxed/simple;
	bh=g1RZDUi7dmfHqz7HG7N5VHozu1EUFuTkNzT7Y8iTCjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mROajOxFe/EplyVOrFSV9yqACCyJ/pN3KFWOi6Ms14BhlLTpKNn2lGmWx1zCHFE3uohnCi0U2Z3fTL9imT7ugx6Bj7E8BOS+gabJiXNCwzx5q2AOK+m13Ad6gHHpXRA/nFU06guW++YHnGBYIgTCK+JhA1uGWx6FPNTsRegVdVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUBrtBlk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83201F00ACF
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783715407;
	bh=g1RZDUi7dmfHqz7HG7N5VHozu1EUFuTkNzT7Y8iTCjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gUBrtBlkVBehkmSrXfeUeRGqq84rmT48nO0J25GHh5VJZwzIxzZjNse13ScMGc+gJ
	 m8qa4RITtEa/6PUV38mhmyauB8nPYsfzeT/Llqg1eoqLlLPyD+MORlaTlPgFJtXeHD
	 3d0oG7nMw1mDRCBRJ+7L/mSU/5KgH9xob0BSugNBkj6B5DBx9aHRvL04FBukxvve93
	 9HQfTBtOMD1VGNdP/9+BwOHDY7526Q1dnO2ph2XEuKqjKwpbwQWw3szHTSo5WBNKlp
	 MlWPVMIY9R62tpeuPblEIlzGMQxZL6WZ1yZ7CuOGm9quRe+9HmduM/pYXPcsG6R7+W
	 vXLgPTG9o4BkA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeae771c49so1440048e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpe76jp9LDfPRBTq13Ko2VLmfVkcKTR5ufw+xtu4dSShUfWa4lq7vPOIrmogCprZ+kTbdDPA7nLnD/w@vger.kernel.org
X-Gm-Message-State: AOJu0YwgaZAp7+7/t1o+NNybFLrMOUSP4vlryZ+exLyE1+01cSAfUQtG
	oD87EKvhkQFfswYN2W8FSJmfKssIkrFJwEHXBqJ2O7snVR6MW22cmqILevxJfKf0IENYcfRV+y5
	qgudJfejV5//FSjewBtY4ZQ5zMW+wH0k=
X-Received: by 2002:a05:6512:2529:b0:5b0:1b78:4962 with SMTP id
 2adb3069b0e04-5b0236bb5c4mr137507e87.50.1783715406670; Fri, 10 Jul 2026
 13:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-1-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 22:29:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLn00-Qdy=uerGkBJUT5gsTjr685HYe9hcnc3ubxbcDgdQ@mail.gmail.com>
X-Gm-Features: AUfX_myXqmF5Z9qSM89g-I7i4RZgYi-3UQwo4ZzGGQsHH7hMMjQ_teIFD1NMZKM
Message-ID: <CAD++jLn00-Qdy=uerGkBJUT5gsTjr685HYe9hcnc3ubxbcDgdQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] pinctrl: mediatek: Enable module build support
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39858-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:justin.yeh@mediatek.com,m:sean.wang@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mediatek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06D5C73E659

Hi Justin,

thanks for your patches!

On Thu, Jul 9, 2026 at 8:35=E2=80=AFAM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:

> This series lets the MediaTek pinctrl drivers be built as loadable
> kernel modules. This is required for Android GKI + vendor_dlkm
> deployments, where vendor-specific drivers must be kept separate from
> the GKI vmlinux and loaded as modules from the vendor partition.

Nice series, I see Chen-Yu has some more comments and a
separare cleanup patch may be needed for mtk_eint IIUC,
but definitely getting there!

Yours,
Linus Walleij

