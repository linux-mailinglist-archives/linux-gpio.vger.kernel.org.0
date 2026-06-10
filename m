Return-Path: <linux-gpio+bounces-38291-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rV8oFevQKWopdwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38291-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:02:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0E266CF11
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:02:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jZi+8B78;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38291-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38291-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51E40311E145
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C6138AC7A;
	Wed, 10 Jun 2026 21:02:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF37332EBD
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:02:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781125352; cv=none; b=fDJXYp65KouB71xLRDM9EQ6iFQwva8RRinvlZpwICnuxP8LKOBLNDGX6nQyvH1uYG8vHxvFkLYVHwpkOsdpio+1mHVhIc8lMpnM7i9yekRJf72yWCX4oNVhlL91SgshRvlDNjRqlmMnWQ1sTmsB944O+EfqIf7Lv1CQOBTL2DEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781125352; c=relaxed/simple;
	bh=LmE+1vqBLAtCTIMVH3BIpgsNMOJinyPqODhoBVlXgGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbGMKckFVVO3ijlUXTg6kCppGOLQMOda7lVvrMTLzSVjGH7M60SUmC3Y2Yb/d84LrqNAgTQ7k3vKBbplDO5pqKha465RiAU9f6PQ56TEEBb9YRfYOksXyxKaZXbKS536wbSRkCtbSVJq/OXTtrp3F1sLUptpgU4kRzMJl4yR1xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZi+8B78; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278391F00898
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781125351;
	bh=LmE+1vqBLAtCTIMVH3BIpgsNMOJinyPqODhoBVlXgGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jZi+8B78fuuo7SyfIA6GWsnw0nBvwGqu1tNWVzQhL9tFlj+RkwfZZVmNIIHNj1C1G
	 XNSFWynHycFQGm53N9zHyug9Gvs552vdoyeOt6A/hS5p24pu00GO21c9fGFSSV37mh
	 SyaW6yV4FYC8w/wpu2HNWQ/1Y0JEAwa6d5JlQmq38K3I87V5vfd5zRSAKOX6JW/kBn
	 L0cqygXB5QEbQ/Y5roisY8/uv/Fi+riGgr8airEqy3TP4rRhZeSeXvMl8BGdhsNowN
	 AvrcL5mxp274R6ET97yoxQHXqWoNCftZC8arIOYvdD47DTl3S4vqUaFqL3lydL9fiN
	 mD1ivsLsq0pVg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa6792e7b8so7167300e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 14:02:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YyyDLXcUSqG3NwvdX51vnwkk5m/+P4AIG6IKMEa9x8d1l4JnmVc
	Cw1hawjmtsBszBfxyS82dxwlwNCiBydN3ilZFvViNi8qYIpwAkixrbnZHrMElaURSemFmLj8bLp
	ocMguGay6eAoPt3LXr5B0J/dhZ0MfDD4=
X-Received: by 2002:a05:6512:6887:b0:5aa:6f43:5bb9 with SMTP id
 2adb3069b0e04-5aa87b8f852mr4108275e87.33.1781125349950; Wed, 10 Jun 2026
 14:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610205007.44881-1-enelsonmoore@gmail.com>
In-Reply-To: <20260610205007.44881-1-enelsonmoore@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 23:02:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLnnXt_rmAQ8_zgEjcpR2ck_hufS7nSRLdwGJzJ0SGZ3Kg@mail.gmail.com>
X-Gm-Features: AVVi8CcnAiad3JNHItWYca9slrk0aJdv8JmrcocTk7GzFeHmFy6K4yvo6Nn1VT8
Message-ID: <CAD++jLnnXt_rmAQ8_zgEjcpR2ck_hufS7nSRLdwGJzJ0SGZ3Kg@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: remove dead DB8540 code from <gpio/gpio-nomadik.h>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38291-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C0E266CF11

On Wed, Jun 10, 2026 at 10:50=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:

> DB8540 support was removed in commit b6d09f780761 ("pinctrl: nomadik:
> Drop U8540/9540 support"), but a couple small pieces of related code
> remained in <gpio/gpio-nomadik.h>. Remove them.
>
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Good catch!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

