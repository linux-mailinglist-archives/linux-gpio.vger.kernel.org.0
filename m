Return-Path: <linux-gpio+bounces-39388-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7CRfJzdvR2rmYAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39388-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:13:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3131A6FFF22
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:13:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FAAnqDrg;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39388-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39388-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B15ED300AC9C
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 08:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19ED371065;
	Fri,  3 Jul 2026 08:12:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7120036C9C1
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:12:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066376; cv=none; b=bKbonZh2xi2jZI8Afuhq84MgPungPWVWszkJHxAFYTxWFCYjWLrRKcal1Zk6gmTPdY/w4y3/ixg8XWn2tYxQb3Spw0+COX8hf2f+73gZ8rcTx2LlFl8vEXVpBufVqxepBz28b1IPkaIMrkX2vSbwGiCknRNFuMSteQ6irOlMdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066376; c=relaxed/simple;
	bh=TnnyjYX5HvBdVYkia6z5YJNJ8yUsxQUM2yQDZk5t8iY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obKcMz4SM7CstqyTxqwFAuoeT34m9qILoggPoVati0m+srMHlBiG0LIOTiIYISyFkJ8eyjcrxDfleRNQBcm8Vq4vPGYcu8m/HNC8Zg2M5Aggrd23i91h/EKXcI+CHSxSEvmdCCK4KafhkQ/mU1edSww19DUaF6mw0F/JRBFvZR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAAnqDrg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3090B1F00A3E
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066375;
	bh=TnnyjYX5HvBdVYkia6z5YJNJ8yUsxQUM2yQDZk5t8iY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FAAnqDrgjamPmTgjE60IUptFCrEf1OUyE57VF+v5WERbMpHF+Y9LhXtixdep4N8Fg
	 2q+AnG9AJq5r4JFHdOP79Iy1FXLUSDG+PkPv6sJ/bMKSkTS2R1I7eLV9sbEOiKhoXM
	 ASu1AGGdP0L4+WP9Kc/hpiUQOlg5tWe1UaXswhlHHVozUSUdtQn7wdS0zEGS7hBloq
	 DSJ7N75hapEGbPUxvQMKqr372j2ZVH3526TAC4RzjxX+g+gL1/6OqSEWH72xpS+Kyy
	 CRCwT6bgLDUXHblXVtB0lOXUvyLk1ESakxezlhepRwFYsHzNqzE+Pq6GK6SG2EaAdX
	 sOQeI57eN8LBw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b030e889aso2577721fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 01:12:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrnmbfxLP41BqSObNcXH7J4kfRV2npvQL69ew/lxQhUVQ5foDK+43Z59vxXMpe1N1hRNeF4RllTmoyu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh6XeLibZDEyeJy6FBnXKPZIuKr+BDjtU8iM/4u+35LXrD9fmZ
	2e4UHpXLePWvfZfXMx/VCVilrh9ZPQ1zA3mjI9OgBvTqwpBSmY29QXitVuAmB4tfG4D7T7sImby
	P50vC1f1u+wtNA3GrpZuphE9i40ZjmfYzzO0Ymqvotw==
X-Received: by 2002:a05:651c:895:b0:39a:cfea:f16 with SMTP id
 38308e7fff4ca-39b340ec041mr20745751fa.31.1783066373977; Fri, 03 Jul 2026
 01:12:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:12:52 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:12:52 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703014201.69829-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703014201.69829-1-chou.cosmo@gmail.com>
Date: Fri, 3 Jul 2026 03:12:52 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mc_P+hTKS78f-z58NLxxQryTYBUB5iSz-8byZ-b-KpCdA@mail.gmail.com>
X-Gm-Features: AVVi8CcUHxfGyOx3nWd8Ky11RaD_tXOn6-VDMeVUXGZjoZu45WxHMCeQ4CWgMT0
Message-ID: <CAMRc=Mc_P+hTKS78f-z58NLxxQryTYBUB5iSz-8byZ-b-KpCdA@mail.gmail.com>
Subject: Re: [PATCH v2] leds: pca9532: Fix inverted GPIO output polarity
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, riku.voipio@iki.fi, linusw@kernel.org, 
	brgl@kernel.org, linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39388-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:chou.cosmo@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:riku.voipio@iki.fi,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-leds@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3131A6FFF22

On Fri, 3 Jul 2026 03:42:01 +0200, Cosmo Chou <chou.cosmo@gmail.com> said:
> The pca9532_gpio_set_value() function incorrectly mapped the requested
> value to PCA9532_ON and PCA9532_OFF, inverting the GPIO output polarity.
> A requested logical high (val=1) incorrectly enabled the LED output
> driver, which on this open-drain device pulls the pin low, while a
> requested logical low (val=0) released the pin.
>
> Correct the mapping so that val=1 yields PCA9532_OFF (pin released /
> high-impedance) and val=0 yields PCA9532_ON (pin driven low).
>
> pca9532_gpio_direction_input() is also updated to pass val=1 to
> pca9532_gpio_set_value() to align with the corrected polarity mapping,
> ensuring the pin remains not driven when configured as an input.
>
> Fixes: 3c1ab50d0a31 ("drivers/leds/leds-pca9532.c: add gpio capability")
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

