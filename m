Return-Path: <linux-gpio+bounces-38332-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T4NvE+ehKmoluAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38332-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:54:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4036718DD
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:54:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Z0Xh0cj+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38332-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38332-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7796932B0F50
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF48E3BF69C;
	Thu, 11 Jun 2026 11:53:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD4A3A3822
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:53:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178815; cv=none; b=cSn6nnShxy8hQe4rQAzQB+g8djsjMjLlw3NRQKXLOszNjYmXsFd2ZVxFKmrvfchDDay04KFWgzjur2a+S/9phfwR12+UkS6r/WuPEwzIxOkWiugjgTzfZNlp6nqHlkw9AJSu6wcWoSLplF9nSA/S8FLjfJrEjv6jVXUzhRTGSaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178815; c=relaxed/simple;
	bh=GqY2spfTOdxT6/z9DTv0mn5JpX+liaPtEnBVwLgBTnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9mMhfpJGIo5VyxFWV8zafImPF4rrDCeyaiCFWhgNi218wCu0gMyVVZfjG6S6ptR9Pyu+NhMTA1LxtRyMZdRca2mQrPIxRn4AlO3Kf3Pc6smuqSQGVNOdD87Pf6ppDj9M2CZa5glFqZYK+bfUY3k6mUt/u11m2M68p84Yq3YgaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0Xh0cj+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31C31F0089A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781178814;
	bh=GqY2spfTOdxT6/z9DTv0mn5JpX+liaPtEnBVwLgBTnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z0Xh0cj+FPMHImvLlydsk6WEiI3l+mk2IO9zpn4hl6MI6hXrNabJxKzDCt91NKCh7
	 mVSVoz6zbnrsdic3eO9kkEGqqAEqLpi1aswrQBhn7pnn84rs92Vp9vM23ZK/ujeU2I
	 GP6tBSgo/UQ341vOfKTjchmsIfKBxjYecNyw/Aqku+TNFFufwwg244WCefmRgztQNK
	 qnsVKun7pPXyQ3qkRurGkivj1fGqvBVdkkCzenrDdHornVvFbFtFaSSCoqUVz+xocr
	 zBviDrAAKjTVWu9dC6lV2Wul6Grpnv4BQSu2z3ydoGIUS41F+2BAjIKyCx+vRunvi7
	 pQLclsg5mWI+g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so8341092e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 04:53:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/fxBPZqJFreco1RsLnKB45Tx+NGxXm5xLOJPhOt85w8o43l8+udWRg3XQMMKTZ06LSVByHa0AROFXp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0GtycMFWo6HK21esj1HAPoZgFZM7SJWFQnOsiJ8lFcMNmIYL
	lKBjbYK6tivfJ+4SualF9HJG+31/2xx0lTgf34mI01cv15nV+YnxVqdoxdlMcQl/UyKDpCezxiq
	fyVn5CM7UsPPHEYWlD1h/pXVxYvlhNAw=
X-Received: by 2002:ac2:51d4:0:b0:5aa:62fe:ec9a with SMTP id
 2adb3069b0e04-5ad281b7a20mr780290e87.44.1781178813544; Thu, 11 Jun 2026
 04:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:53:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLnznOYt7giVz-xqLEm49oMdnr4HnaW8T5sAyz7Zqgi1og@mail.gmail.com>
X-Gm-Features: AVVi8CeW7u952qA2e8nha9s-_tLXnmRSu2SJMgx1bi89y4LGhDaKdjaaWzyi6I8
Message-ID: <CAD++jLnznOYt7giVz-xqLEm49oMdnr4HnaW8T5sAyz7Zqgi1og@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: airoha: small fixes
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Christian Marangi <ansuelsmth@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38332-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:lorenzo@kernel.org,m:sean.wang@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:ansuelsmth@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,iopsys.eu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C4036718DD

On Sat, Jun 6, 2026 at 4:04=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This is a set of small fixes for Airoha pinctrl driver.

Patches applied!

Yours,
Linus Walleij

