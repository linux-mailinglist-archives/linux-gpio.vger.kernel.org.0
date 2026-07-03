Return-Path: <linux-gpio+bounces-39387-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 98XGG7h0R2r7YQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39387-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:37:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A761700255
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:37:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ePD7Oqi8;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39387-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39387-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B01FD310DE3E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 08:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B338371065;
	Fri,  3 Jul 2026 08:11:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B536E460
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:11:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066301; cv=none; b=RyDYqAnzmrr54niZTq5H1K1dlVT8p3c1fI5eQz9iJR11uYDzQaInN5HDAHxvDqjMeJ0iuhwQQ2w5CaQ2M9wGw3QrT7LZyZmtQKmYK661coMdmSxHDje+YA4PqQVKKuqYc5zSdDPTOyA33WHYyWqbDESAQX3wIK/RLzs0jWRTZSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066301; c=relaxed/simple;
	bh=BkwWV5hJpNCm3E4SPznpvd89v31vfbPa5MKL+m+sbx8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVL9zZ5zb7w+JhsSZy3kLP82+Gl09G8FHtWJ5ppqyXyZjBVR356tRrM1oShp4gL4sJB9O3HSd+lQRsRZnK0lybqq/9FjGn8hmfkLQqYp4SlRHnxaM4KWAz/6XmoGhD7rJokw5jPgU4sud4mj0KRd9XapTvkv/x0Vig+Jihies2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePD7Oqi8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D843A1F00AC4
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066299;
	bh=efYg+iV1L6ef429hOtMTh+aB9u+dJLoTtfuENqul9xQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ePD7Oqi8suA3TLdsXWaUwKSsDz10Uz6HM4Q5IP5VpGtvawuqXokZp68/lzXmOgXiW
	 RqmLoiI/R9adJZcM/b4urH5Rna8hLLXhOk77jn5CHY+j9q0bnU7MbkTboB/gHOrKJc
	 j2qDo5XZ7e/xZlAP+LxAbB9HzrjMCYt1YPNPlEX7zRq4I6dQlDoQf9rhiPNJno4Ugx
	 gSExIqMkQO58liq2fR925ggZcxJFJAnrxbeIhaQQ+WMifdEdEd+2HlnlK+ar/CP/G0
	 cVUPNMjnV2CvY8D6Nju3LwxhFu/gJqJc2Pfw0gEgymnxDtgVNlGlreNiC7rDm9ISn8
	 YiAPXce/yxmsA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so342407e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 01:11:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YwrocEzMP0gOX5oWbBNU6dZQsTsAtqNdJtUTk9+grFLmkHKoBsJ
	/kWPwAtHv6Sc+sJyuQ1VRKQfL8W/iqaxYLC5HZO/kCH2mIpVYh52rKGmjuPAHdJeX9xvXPUJVw5
	qHk0Cd6JI1k8kznI2fza+LA+XprpIX1+C0yAz1wFUBw==
X-Received: by 2002:a05:6512:10c8:b0:5ae:bf5c:bdc5 with SMTP id
 2adb3069b0e04-5aec714fe67mr2874313e87.52.1783066298465; Fri, 03 Jul 2026
 01:11:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:11:36 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:11:36 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703-palmas-getdirection-v1-1-046c155961c4@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-palmas-getdirection-v1-1-046c155961c4@kemnade.info>
Date: Fri, 3 Jul 2026 03:11:36 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mcm0OV60hCw5HWWcXYCb_5KyRvFe0bOuV=9kyu1n0sgGg@mail.gmail.com>
X-Gm-Features: AVVi8Cd8IM03mNd100TR-6OpMqQe8TYl-eW8KETzscMBAkr0NMahTwo6Vnccs6M
Message-ID: <CAMRc=Mcm0OV60hCw5HWWcXYCb_5KyRvFe0bOuV=9kyu1n0sgGg@mail.gmail.com>
Subject: Re: [PATCH] gpios: palmas: add get_direction op
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39387-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andreas@kemnade.info,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,kemnade.info:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A761700255

On Fri, 3 Jul 2026 07:21:05 +0200, Andreas Kemnade <andreas@kemnade.info> said:
> Accessing debug/gpio is quite noisy without a get_direction()
> implementation.  To calm that down add an implementation.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

I treat these as fixes and send them with upstream for current release, please
add the Fixes tag and Cc stable.

Bart

