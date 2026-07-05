Return-Path: <linux-gpio+bounces-39483-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h2htAkigSmrYFAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39483-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 20:19:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3370ACB3
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 20:19:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=SVNsJqd5;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39483-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39483-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C867F30097E3
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 18:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D52539EF05;
	Sun,  5 Jul 2026 18:19:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF179286891;
	Sun,  5 Jul 2026 18:19:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783275588; cv=none; b=nYd8HUTSfvT38ZAJJEp+YZV2TZh8r+d1QJqnS3tM0uMw0FSAj+irVC/kXw1kbmj5RBl67SgTTUbj8lia+hK2cd6ugD6JVq+8j4hOx2aAZfheEDokgAGE7eDcsHrHHKYZQJiGemB7ZnlBSaRY0ZCFkq/w0lxLcDu53ZkgZkeo6DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783275588; c=relaxed/simple;
	bh=fskadU09R3rO4mYXohrgHTCPoVbaHxLlcULLLJq9bms=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oDSft4xMNDxoOQp7TbL+Z6gYqxbhODmcjHQ+bOWucwZmMW8YvBlH8ayUO2dJv6FbLKNtbzIAdho479eLF/bPGTc9ZSrTa9hXIrXEx2m1ne37pS0FRGPtUXAzAPh6QNH4BRmHQtLGNLZ+AC5YFNzHzbztjqmO/tuegwhn4jvuuk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SVNsJqd5; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Kul4N4nXXzqbUZuLjtPlpkKmoHD+8H8dGczk9kaE3pI=; b=SVNsJqd5q/tEIgqPTKzqLa0qt3
	j414PcZWx/TF4euzQ94kB5KnVwcyYA/4zUA6wyhQIOHz85pYQhQJuYM34dA6AvSNBfYgOvZ5ohWwj
	NFxsVtHXiuc3wpNQd1tSCEjv+MPKuXpKyXQ8mmZ6HhOQ+wdwK6yd7FP4NnOPyw6kuCCaVWqFUvonX
	fRYPb+RKmEgADGtaFZwglG8GcYOCy9VopzrSNTRoWO7NuJt4d1YTG1hD5Nris5MQjdFF5k2j+dNKl
	V3jZKCFV9dq60po1CR98hfO0GY41USzo0xFgOF5jhxGeFqsJVb2RWt7RJQV/5ChykaENUBDoG/yiZ
	tfFURMWw==;
Received: from [129.95.232.135] (helo=ehlo.thunderbird.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgRRN-0000000EU9w-0xcl;
	Sun, 05 Jul 2026 18:19:41 +0000
Date: Sun, 05 Jul 2026 11:19:38 -0700
From: Randy Dunlap <rdunlap@infradead.org>
To: Yuhong Cheng <ceohunk@gmail.com>, linusw@kernel.org, corbet@lwn.net
CC: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: driver-api: pin-control: fix spelling of below
User-Agent: K-9 Mail for Android
In-Reply-To: <20260705070422.764-1-ceohunk@gmail.com>
References: <20260705070422.764-1-ceohunk@gmail.com>
Message-ID: <6F8B0A43-EB7F-4442-B9AA-126F4D8D21AB@infradead.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ceohunk@gmail.com,m:linusw@kernel.org,m:corbet@lwn.net,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39483-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,infradead.org:email,infradead.org:mid,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94C3370ACB3

On July 5, 2026 12:04:22 AM PDT, Yuhong Cheng <ceohunk@gmail=2Ecom> wrote:
>Fix the spelling of 'bellow' to 'below' in the PM API section=2E
>
>Signed-off-by: Yuhong Cheng <ceohunk@gmail=2Ecom>

Acked-by: Randy Dunlap <rdunlap@infradead=2Eorg>
Thanks=2E

>---
> Documentation/driver-api/pin-control=2Erst | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Documentation/driver-api/pin-control=2Erst b/Documentation/d=
river-api/pin-control=2Erst
>index 1f585ecca=2E=2E80106e44a 100644
>--- a/Documentation/driver-api/pin-control=2Erst
>+++ b/Documentation/driver-api/pin-control=2Erst
>@@ -1175,7 +1175,7 @@ Possible standard state names are: "default", "init=
", "sleep" and "idle"=2E
>   selected after the driver probe=2E
>=20
> - the ``sleep`` and ``idle`` states are for power management and can onl=
y
>-  be selected with the PM API bellow=2E
>+  be selected with the PM API below=2E
>=20
> PM interfaces
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


~Randy

