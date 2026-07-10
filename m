Return-Path: <linux-gpio+bounces-39850-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XaumDQpDUWrMBQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39850-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:07:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573973D89E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:07:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QL8lidcy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39850-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39850-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46AB9302C6DF
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 19:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCDA380FDD;
	Fri, 10 Jul 2026 19:05:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B68F2BEC55
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 19:05:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710355; cv=none; b=d7bn0LC7Zd5U5CO3FbE/49muULObg73nBBEYaMSWUj08NTIBA3LwmXozY0EZS23LO/gSn7moL4G6gL9HNwMpLnmcij73bK4UG+AwRb1JE2+7jcUsDu6klneXdkvFbZAW5IgDVQCYMWFzZhWWg4D3xtvSkrl00miassTRtXm1Jyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710355; c=relaxed/simple;
	bh=OWz//aDmsOdKf87gyJz/K1yUNKWSM8ynRcUgh9u615g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uulrt6yr1Z9YlTYMz5l4k8Q2+b4XiR2Y9qqWqSkc2DPPAvJTtQ6VUOD8lmvyoL0jMFUovlrhGN7YMm1AO9Lbg/OfxLlyjci4/yhYah0pvY7vk5ZWVHp5U/D4U+1ZmxcgVDP77aCfXMguY36VQqgYMQ6xdQDsYFVV2C8LDCFuzCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QL8lidcy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4767B1F01558
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 19:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783710354;
	bh=OWz//aDmsOdKf87gyJz/K1yUNKWSM8ynRcUgh9u615g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QL8lidcyh5+abCZxDTVG4/Gehk8v5tLKDdLJh25SnKbV1AO21ehqjqRHYvUtktx9A
	 XX9UBPCjsJitbICGA5Ha30KEC514en7ilSzwibYr8B7ybo+FrOKAbjF8EsTRmynYus
	 H2d/0Wvqi9mindJDXb4g3MGtdEwVWZjQm2e2BD0ps+Gujvbs2m7XhPpcV0v2inmBQT
	 LgFbV/czwxcX8bps4URygCbBRKHeiP06tLWuycT5l8qJq4R9r32+fTRs02MZVzm1Fz
	 vQlVwsfuDxm1g+dk7V/xC2mKal40Z9H9jLvUND5gJrry32cberSHYTu4eO5ThkH+rz
	 h9bN8ZpIQ3g2A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so1687491e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 12:05:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrQcBXzA57jZlrIRuaNy8+fjlLqNiYWGWeZib0l7qO/OGwjCOk7UiWMTmHb10jQVKKW75w3YmvMihuS@vger.kernel.org
X-Gm-Message-State: AOJu0YyByRILPKK+iesrIAyAaZvz0Q3yaO9APtrRcEKCggSzDjop4Moo
	7kvD+kcLuPR/a5jelcfiJi1RV9HoLYWDWCdal9E3STVQ8sguQXEP7KHh+TfELLFJZLY260Biyvv
	MYUF6IP0GC0ueYpZ7qZJt7fQlfCG0+3w=
X-Received: by 2002:ac2:4431:0:b0:5ae:bb35:c956 with SMTP id
 2adb3069b0e04-5b0236b2a45mr62737e87.56.1783710353043; Fri, 10 Jul 2026
 12:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com> <akyJOW79W0xvI-P9@google.com>
In-Reply-To: <akyJOW79W0xvI-P9@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:05:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Wx=mHORGDU_=PgGrOCdTSVes63jgSL2xQX+rCE2uaMw@mail.gmail.com>
X-Gm-Features: AUfX_mxirnvBsYL4mzPImU7j47NPxAkPAgq7Mm-tNJlHHsQ0Fi4vPKqXX9cB5Es
Message-ID: <CAD++jL=Wx=mHORGDU_=PgGrOCdTSVes63jgSL2xQX+rCE2uaMw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rsk7203: switch to using static device property,
 drop legacy gpio API
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-39850-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:ysato@users.sourceforge.jp,m:geert+renesas@glider.be,m:brgl@kernel.org,m:andriy.shevchenko@linux.intel.com,m:arnd@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6573973D89E

On Tue, Jul 7, 2026 at 7:08=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Gentle ping on this series... It still applies cleanly and we need this
> to be able top drop legacy gpio interfaces from gpio-keys (and
> eventually from the kernel).

I lost my patience and queued it to the pinctrl tree on an immutable
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-rsk7204

Then I merged this for v7.3.

Yours,
Linus Walleij

