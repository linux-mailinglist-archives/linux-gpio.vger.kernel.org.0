Return-Path: <linux-gpio+bounces-31624-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI1PGZL5jGmVwQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31624-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:50:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F89127E2A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EBEE30BE33A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3673559CF;
	Wed, 11 Feb 2026 21:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lc7MkECq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96B2E06EA;
	Wed, 11 Feb 2026 21:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770846430; cv=none; b=BYs7JTZeNakSjQx/M3PUSNGeIK0TjSMTY1G9ox/vYN+/t9KbiXYjmdffUUt6HQ6Dp9JFWvSxteVN0ndFAuO3whm9SAvSWVxuPMJjBXCvlKZvDEYAss6481vgJ6C9naIYk46UCo0sjykgKMPyjTQMjOr1wIyF9a3+Cg0vmtpT35Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770846430; c=relaxed/simple;
	bh=xbVVGen3f8sxgqjF7Uctcx5HwhBFILPxEeskAGE/V1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nB94CA6dDZnnPg3LbACtTTWGXJfzkC1/Is55QLy7l92/1sh6GrmqfLa3GlPgu0xm1pwKAUBuMvGukqpf/rWGTcurUZovZIwk+6IffuJDMO22KUNJnXAMDBQxJLHL8JmtR9Embt8WipFNZ7KlSdUXhWBiGQS2eSpL2hWCnSf6K4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lc7MkECq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D73C4CEF7;
	Wed, 11 Feb 2026 21:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770846429;
	bh=xbVVGen3f8sxgqjF7Uctcx5HwhBFILPxEeskAGE/V1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lc7MkECqangOalYIT+KClMPNuy9MtvOz1JQupTb40Obdd8Cii7b0bEUjn8EOd2slQ
	 Ze3CKFPFmWPd8PbbMcJxq4HqbbGdcYyAVuVkdzZjHuX05Gg7r66+gbzSapBH6xgqLr
	 Heax9NPVI7IF3PIXLjvbNEThi+wQckX660tgY+HZ9jEsSJidbHPoZfuLfmZmmjOHLz
	 i1HnsyvUsL7Sz7xiBnmuG+aCxZYsU6PMR0VD3J85pAHNhNWLmiSDUOFrOCzdbEx/of
	 AJm6CJML0um9jaLL5S1dkVbjodyTuyeopVAt+1ELPmy3VZB6E0gJp4qFKwot1oF6xI
	 5rkDDk8U9tgcw==
Date: Wed, 11 Feb 2026 15:47:08 -0600
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT
 compatible
Message-ID: <20260211214708.GA3947691-robh@kernel.org>
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com>
 <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
 <34a9b531-4f53-47ee-861e-1b18ff1a5752@kernel.org>
 <CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31624-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,glider.be,ew.tq-group.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6F89127E2A
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:36:28AM +0100, Bartosz Golaszewski wrote:
> On Wed, Feb 11, 2026 at 11:13 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > >>
> > >>  static const struct of_device_id gpio_aggregator_dt_ids[] = {
> > >> +       {
> > >> +               .compatible = "gpio-aggregator",
> > >> +       },
> > >>         {
> > >>                 .compatible = "gpio-delay",
> > >>                 .data = (void *)FWD_FEATURE_DELAY,
> > >> --
> > >> 2.43.0
> > >>
> > >
> > > Regardless of the DT bindings - this change is perfectly fine. We do
> >
> > You cannot have compatible without DT bindings, so this alone is not
> > "perfectly fine". Maybe you wanted platform_device_id entry for
> > ACPI/legacy/MFD devices?
> >
> 
> Sure you can, you just can't put it into upstream devicetree sources.
> We have had a compatible for gpio-sim for testing purposes for years.
> Why would it be illegal to enable matching of platform drivers over DT
> for testing purposes?

The primary issue is undocumented ones show up in 'make 
dt_compatible_check'. I would like that to be warning free.

Rob

