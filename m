Return-Path: <linux-gpio+bounces-39495-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RfYdEoWPS2osVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39495-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:20:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A60070FC51
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:20:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XA67nX8a;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39495-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39495-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C12BD30C153C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 09:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5744CA29B;
	Mon,  6 Jul 2026 08:59:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D923F1656
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 08:59:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328383; cv=none; b=ixLDnqWg7hyDguFOR38r8sM6U5jFoR59eUERPSh8rYFRzsrRTLhRisCyUfsRX7gJu/8U6omIKIYdkPsA7MtCAYJO/PFLxH+dXpmBJvkfdkukduW08ux9/zAAM86XutK/FpUUPcJSJztCRAL9sIWfxzmyRUWhvPnoXAyDegeoqVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328383; c=relaxed/simple;
	bh=6nhkmyFsd0nCkVjaOp+ZomIaDW/Gc9vE9rZHaCXaeVU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBJZ1CdK5BW8YT26NgK/nI64a3X8ZISIPVQE6vOUlFUZsTH9ctdXQNkF/WcvrnJEQR/fBqic3G0ptlkQhWTjvSg8LyHxYAxcGzLnM3gafEaIKbCZqsgciSFyEO+HWqTlTQsFgYti1McwCOYcN0gU7RFeqhhxcFIY37/odcYg4iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XA67nX8a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF60A1F00A3F
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783328374;
	bh=6nhkmyFsd0nCkVjaOp+ZomIaDW/Gc9vE9rZHaCXaeVU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XA67nX8a0dZY4Uf11irTtlI6WRKs2xyphCyL/IIR1UqthOXderPKMzPzH4wguiAD2
	 aQECvPJEygDvynrB9vvnJdFCcpxCslGM2xVkQeujWkaDprczaeOe1B9ZY3VRGzCp+l
	 q7hTtBDGQZhcnU6yuNbI6+KzLVvfeMXtQ8BdWGhMeIsRC4fiqxdHhJLoIrnKLqxOQ3
	 wpO4MNiNGU7how6jogfpdGlw7WvPRzZlbL9t5Vo/4pw2S0BhyhW6wICRyth13JYJD5
	 ERi3BdxQCi/CjvlqYQQKgKzbubrZOlSW0Wx3Ctwnt46MDXHHnwHPOJ0hN5+VkQAum4
	 TQe+01LUq+aeg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3997a448ecbso27750191fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 01:59:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpRzC6eXeuQ8fM4A041H4Zs/jPx0PJzCPpM/EJuMSvTO1XOpgbuDN5yVRj7/HfRrkLK1dtPPmCptCUK@vger.kernel.org
X-Gm-Message-State: AOJu0YzM0IVoYGc4cadotmqTLPrZ+YLYt4k8KpOsa+8rZuxzrlbD+ib4
	BCMin8FNLXPbyfgq/JRD8kOkqFNWoa423sAw5c84IsQ8q8o+DnV8kgUdMHdenf8AxW2omYoaynm
	S2wHLCXkixGUXWnQcz6n8X1M249nFClfRAEtW57aC8g==
X-Received: by 2002:a05:651c:154a:b0:399:87c9:4573 with SMTP id
 38308e7fff4ca-39b53caeb87mr16309881fa.22.1783328373426; Mon, 06 Jul 2026
 01:59:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 04:59:31 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 04:59:31 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260702231838.1175485-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702231838.1175485-1-rosenp@gmail.com>
Date: Mon, 6 Jul 2026 04:59:31 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mdc3stk_xSFZ5_Aj1c2hGujDDn4bD2PuLe0tZjgd9kw9Q@mail.gmail.com>
X-Gm-Features: AVVi8CfvaIqr-ignz_S7tFUxxqqBdfcqaystq3OPTWkKEwKx92AYXElIktsSeKk
Message-ID: <CAMRc=Mdc3stk_xSFZ5_Aj1c2hGujDDn4bD2PuLe0tZjgd9kw9Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: fix devres LIFO ordering between GPIO chip
 and IRQ domain
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39495-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A60070FC51

On Fri, 3 Jul 2026 01:18:38 +0200, Rosen Penev <rosenp@gmail.com> said:
> During driver removal, devres cleans up in LIFO order. The IRQ domain
> was created and its devm cleanup action registered after
> devm_gpiochip_add_data(), so the domain was destroyed before the GPIO
> chip was deregistered. If gpiod_to_irq() is called on a pin during
> this window, mvebu_gpio_to_irq() passes the freed mvchip->domain to
> irq_create_mapping().
>
> Fix by moving the IRQ domain creation, devm cleanup action registration,
> generic chip allocation, and chip type setup before
> devm_gpiochip_add_data(). This ensures the GPIO chip is torn down
> first (preventing new IRQ mappings), then the IRQ domain is removed,
> and finally mvchip is freed.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Can you resend with the Fixes tag?

Bart

