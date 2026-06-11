Return-Path: <linux-gpio+bounces-38333-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VHMRCY+jKmqvuAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38333-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:01:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8776719A9
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:01:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=doeezvb2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38333-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38333-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37E6533908EC
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20753DB334;
	Thu, 11 Jun 2026 11:58:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86D3CB2D4
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:58:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179117; cv=none; b=sMQAdgod+jsUWV1n/IVI9MlFdq9C/npg5rHGBBFMVLlO4WyjKQPtt842tawfkGWZ4F+8hLNUUfn20edhLfGPv1AfWLdETy5NwBWwxNWlFaALz+bDgaDAEiIE+yV737LY+vL8wZcS0nWbjCwVac26xWTNnnVuwb7ruxNkhqAmzVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179117; c=relaxed/simple;
	bh=R6nvajDJulrF8z5WC1vREpNwXQE4BL47pSwNxW5HPYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdkxrWBjHpu9RcEsQDxltfTrwlXEMagIJ7zD4tWVri+FJuev8QDjVHGXBbXr5ExVzP3exOAUR31mCOl/iiNsWPZbHCDVo/RL5e8Ck2njd+PCWyZK7KpibtnvNhQARBRDSIpAW8MqGSGaU3qEymL8PVcI5YILZ5ZzPRqQpzALmmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doeezvb2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573981F00898
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179115;
	bh=C5eCQ2m+9ZnT9BEwMkn6XIzbcen83Vtx+Hp/s3prw9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=doeezvb2/5zokwyIlK+Tpp+JQbgxLLB8ubmaGu2t4ula10p9XR+AXSK7qrfa8YFrt
	 Ar+eN6O0mlGTAciR3AAV72pjHLeRr3hzWTd3pF6fkzADeepwFMitmBeLk5D9iLC/C0
	 qiTX8r4VbvrvIrZ4LgYKwd7Of6gUD038Y+3+y12uDxguF4tPO258SqJzjqKt+ZoisR
	 Eo1O3rHYLz1sRuWg7Twbsd/+KCFbCcEIh1JqyvoS+8JqwkmYJPucbURlrRq6rUGi3l
	 AEifYXahqRCENJxgHuwbqmHl1DAIKi5R0krcLHWL4jvESg+VA5Qi4NIlu1VU8Yg2ey
	 u+XHNQzAP+ebA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa61e3d3f3so7931028e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 04:58:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ85JiyUIh6QK/KIuy+MWOgwrVMZeMZ5Ts//bx+R+FHQ1nzPi+0KpDmq8ynDOpICF+PceGrYpJXM7M4e@vger.kernel.org
X-Gm-Message-State: AOJu0YxVyM4mXpFEdZ45JZLPCOY7RS6UjtIY96EihJz9i/LIS4Z8GJ1n
	EHaykxzuGoL7TqoFwsel//M3k+r4Fw3EWGr8jzCg6fGNzgDL+S63M8nQhvesWkVToi1gzYDdU0l
	mA51yT7HLiGiq74nd5XhK9efSW8OrmpA=
X-Received: by 2002:a05:6512:110d:b0:5aa:6c89:72d8 with SMTP id
 2adb3069b0e04-5ad27ac49c5mr780915e87.19.1781179114160; Thu, 11 Jun 2026
 04:58:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:58:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLmzfnOaz1h-e2CP7++AYi0CW6cDF9dTO0aU2m3tRfWfBA@mail.gmail.com>
X-Gm-Features: AVVi8CfHelBjMWn0SWXQfsRaUfTwlnx7-cxwN6bRp62FY340cXBs5nRmH5Xbr2Q
Message-ID: <CAD++jLmzfnOaz1h-e2CP7++AYi0CW6cDF9dTO0aU2m3tRfWfBA@mail.gmail.com>
Subject: Re: [PATCH 00/18] pinctrl: airoha: split driver on shared code and
 SoC specific drivers, add supporf of en7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Sean Wang <sean.wang@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
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
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38333-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:sean.wang@kernel.org,m:lorenzo@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:brgl@kernel.org,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:srherobrine20@gmail.com,m:markus.gothe@genexis.eu,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C8776719A9

On Sun, Jun 7, 2026 at 2:17=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes a series of issues
>  * split combined driver on common code and several SoC specific drivers
>  * adds support of en7523 SoC

This seems to be a collection of previously posted, reviewed and now
also applied patches. I don't know what to apply and what not to apply
now.

Please rebase the remaining patches on to of my pinctrl "devel" branch
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel
and repost as v2.

Yours,
Linus Walleij

