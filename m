Return-Path: <linux-gpio+bounces-9286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC54962F6F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 20:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BEEEB21460
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 18:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B609B1A7AD8;
	Wed, 28 Aug 2024 18:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EEjOBd2K";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tRdXhCms"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CD328DB;
	Wed, 28 Aug 2024 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724868756; cv=none; b=F4nQElQ+ghxfydEb5i+3wE3HqpdjAUGRtiRDZKP3Sc720e5cMzm2Sx19nTeTVo4c7RhhxDEY9RfkVV2knpv7sjms9rCxWNYFR8ARknCPzocBJWelMApLyZqdWz5E5bgySS3n+blzzvvOlInW88CmSt46E8aQOlXc+rK6o8kjt+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724868756; c=relaxed/simple;
	bh=sDQdiZePi2x3Mk+ylaywGV/Pa1lPe5IBlchyo6v6k+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k/8zYHYqFbf6FbEWz4f98fv2GG41iZR8v3YFgPON6IhCtxHnsvm0At4SkDf4/FWsCfjcnfBIdC2DjR0Y+qE7RF7nc/s1zIlokIVhTmnUtBIJz3dHHIR+gbeXBmabqp/vV3nvyvdTbNataBj80x35bXJB52G41BvAjz53UJIAj68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EEjOBd2K; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tRdXhCms; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724868753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvy9ZZ5HTEtszL/J45O6orgWXUO+1xICTXWCOpFWaYs=;
	b=EEjOBd2KuIW2llr9MkE+NYeB33J0UcYXJoxkVvPIn2UfvFUOBYOF76eRqtUWxF+3F901VG
	2pb3uIT6xZiyJeUFEBxWGvvUkkFub7R1tUB9/k7tkcU3UAHUuJZFqWouXnjTU38bsIVeP3
	lKtqvLHl2EFKmIR5OKxdEVxX0bzHVHK7ETPBjh9kjVh03YCWg/PZIYtlP5pezQf0jW07u4
	Suf3YaoyXz6etZbDpdpI9Z8xpEG3p3zWh6e60NGPpU6gloIMdEaR/STDQ/na3H4y5xt9AC
	wZxyrlJFUV5JK+X7QQAr0lbwpVDtH7xkSCQ5U6Fg4ZZ+Tg/zQgHFi6DyRVLJlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724868753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvy9ZZ5HTEtszL/J45O6orgWXUO+1xICTXWCOpFWaYs=;
	b=tRdXhCmsLeu1csG8D0yAmjuTvjvOwP+9bvJcytDIxgmP59n5zxglIuJ5vBHzbQ0OyJiGVs
	jRValG6Ucs3iDUAw==
To: Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Yan Zhen <yanzhen@vivo.com>
Cc: linus.walleij@linaro.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] cirrus: Simplify with dev_err_probe()
In-Reply-To: <9b5a3025-3e78-44b9-98f5-c945a6ac48d7@opensource.cirrus.com>
References: <20240828120118.1284420-1-yanzhen@vivo.com>
 <Zs8XlyXw421hHjM/@opensource.cirrus.com> <8734mod7qi.ffs@tglx>
 <9b5a3025-3e78-44b9-98f5-c945a6ac48d7@opensource.cirrus.com>
Date: Wed, 28 Aug 2024 20:12:32 +0200
Message-ID: <87ttf4bjov.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 28 2024 at 15:59, Richard Fitzgerald wrote:
> On 28/08/2024 15:47, Thomas Gleixner wrote:
>> On Wed, Aug 28 2024 at 13:27, Charles Keepax wrote:
>>> Since we are doing a respin anyway also the brackets on the if
>>> should be dropped on both of these as well.
>> 
>> No. https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules
>
> https://www.kernel.org/doc/html/latest/process/coding-style.html#codingstyle
>
> does not say that. It says:
>
> "Do not unnecessarily use braces where a single statement will do."
>
> Note: single statement, not single line.
>
> coding-style.rst is the coding style. If you disagree with the coding
> style, send a patch to change coding-style.rst.

There will never be an agreement about this, but for code which I
maintain and goes through the tip tree, the single line rule applies
simply because it's my time wasted when I can't parse code fluently.

Thanks,

        tglx

