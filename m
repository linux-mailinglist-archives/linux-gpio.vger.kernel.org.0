Return-Path: <linux-gpio+bounces-39846-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mc1bOzs+UWrEBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39846-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:47:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9075173D69D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:47:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mU0n2XBs;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39846-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39846-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 706E33024514
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 18:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83AA352C2C;
	Fri, 10 Jul 2026 18:46:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521D27727
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 18:46:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709169; cv=none; b=WegDVCZJlyRmAwZeiY6tofW0/edD4ngUjypmhwLriXjAO9fx2rwcPqfukOIIRJRDzb3B3WWd8OrTJ0rauxWoSfBy+NtbpINc5O6Z+ho0VArzPxpK3evc/ZBQMIYQlFHjn8O8Y7JJDRcwxEKmbyFtlrlVVUD0yXeRQaBna6vyj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709169; c=relaxed/simple;
	bh=n7Be+biVh0O8F8FvhkYQou6CywM8ch+inae9MbJjFs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYAaVL3vc/llnR7axRWtCTJpnhoLtaJTX12WBV59rm3FeB/ljlGTX7vObVd92EmmMt4yU/OQVyeAGw4pzNdZ7AiNBMYcVKj+zFVS+cStEUgS3brrxh81ygKMjVtj6LtwUU6ck5mMGa6Tei7VBxuPVpuM+51BimzBPKRKqMDdGho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mU0n2XBs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3859C1F00A3A
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783709168;
	bh=n7Be+biVh0O8F8FvhkYQou6CywM8ch+inae9MbJjFs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mU0n2XBstRApFoWzAMKmK3OFVzi6juII8fVi4F4Gog1p1PJLb6zV0JnLFPR+toF/f
	 gPxFdZpBNyvfNdNQ//+bDN827JRtFxGpHxmNI7ZztATvKSR5/FU7wqPiMDhRhHgl+w
	 ZMz5SuvIF5WkH+HkBHnqGtOsFdsKb8NChG7Xwqq2aVVe809iQMDcqQKiFxhzGA0sH0
	 B09edrBUk6RrX2Y12BvSf/zJDRvd1A1dxySrXFVccb81zq/aS1M0WwaIuZ2HDp2tQ+
	 RNcdOm1m/FidcqUYU5LKa2VueCmFasjxab5st6V5WUJaBYeuuyVQwy1X6z2Karsec9
	 r1Vj8zlNT549A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b01910b499so1101527e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 11:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq6kuAzfdrnbsPI6bVYk8BahD81OE+3oqVgCgBDdOkAautPeKuB15ejdfPwUOaomyQPcnbBWO+AbJYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqrPK8ydn+VrWjYGFaJEYa2uyWsBypC+ESjwONl8WqPBToir3h
	S+DGugoTsr6smu3gKMcD0fSHGzt3ye2fdTous7bQw5n9peWlbTIp6290CK+HTEWAe6UvA27ILX9
	HDKnN2l6O4A72kNbk1Loo68B/46u/+Sk=
X-Received: by 2002:a05:6512:22d0:b0:5ae:ba93:abe with SMTP id
 2adb3069b0e04-5b01c55a3bdmr797550e87.30.1783709166994; Fri, 10 Jul 2026
 11:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705070212.1123-1-ceohunk@gmail.com>
In-Reply-To: <20260705070212.1123-1-ceohunk@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 20:45:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJ-r0LVA_hXQLH_o_XR5z0qaobgzJeK6wcrcQhyUG5JA@mail.gmail.com>
X-Gm-Features: AUfX_mxAooFVvuvsJQQHCc4fDGZN3viCrD3Ww90IbYgS98QigayAzHFLtLqIpzo
Message-ID: <CAD++jLkJ-r0LVA_hXQLH_o_XR5z0qaobgzJeK6wcrcQhyUG5JA@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: pin-control: fix spelling of below
To: Yuhong Cheng <ceohunk@gmail.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ceohunk@gmail.com,m:linus.walleij@linaro.org,m:corbet@lwn.net,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39846-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9075173D69D

On Sun, Jul 5, 2026 at 9:02=E2=80=AFAM Yuhong Cheng <ceohunk@gmail.com> wro=
te:

> Fix the spelling of 'bellow' to 'below' in the PM API section.
>
> Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>

Patch applied.

Yours,
Linus Walleij

