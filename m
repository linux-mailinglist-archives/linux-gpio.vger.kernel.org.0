Return-Path: <linux-gpio+bounces-36255-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGvPOm63+mlsSAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36255-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 05:37:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778E4D5F06
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 05:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E70A301CA69
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 03:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B78A2DCF57;
	Wed,  6 May 2026 03:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6duAIPW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FB22D8DC3
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 03:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778038628; cv=none; b=lpnHwX0RnFR5T5CeSuiMlteZJf3JtICsNIQmJsh+l725Px5j5qwIUcX2HylVIouIEx8s/guPjxcBpeG+osKNZAfTsPOkPwrjD2fWhAIVFnSPZ9gXbV9mGu3YGhbMN4HqYy1zI96Qu13rwcB/nSpDpc27TTRnw0PVVS0VM2rGpDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778038628; c=relaxed/simple;
	bh=Dnalo/bvssUGcoLarmW0Mu3puh5kNsorR2ARqUyrXJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEFHvoEgau8+W07tCNBZ/XnPOSjKvjHBt/hKw1zBlU0BgypbRvXbA99Rp9p/AvSJvvpKHzex7GZ12O9rK2s0U88v7G9DB/iTV/1eFgeYbNL/61LZL7qY3ApBj9rTKfn4QkywlenyT5oPafOkd8x33cSQB1yO6IpsJ5a37XaBsyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6duAIPW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so57360475e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 20:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778038626; x=1778643426; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCDCxjBslsLzg12I6kYRv855qs8zfp4TUfhArChtOWM=;
        b=I6duAIPWtwJ45oiONA/GIOmbF1luEnLqMt6+hVgRis+irUglqrMh6dn8iusRBHXAd/
         yPJ5tuOIXK0UKEjH4Nsah0WMzSaE/pgQgPvpkGZ3hdAZ+yH1b7/0ndkWuA5+QWQOTonJ
         QIdYDc3iM9Z58+ut4GVmbsCXb+0/2UHS1tA2AZiYKixdL1eXSgMR89FMvpSpiegBLdDQ
         eR0CY7omJyHE58lxHfPor4fLZSeFbcyDiDv+MJBI8Nu6Q20E4wTVqzccQYYTq1EAyw1Q
         5fzvXtWLnG6pR2ymvajj5Skvuh3SIIJNAxuapEficyuQDnK+45076nm2g+6XrYN9FWRk
         mbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778038626; x=1778643426;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCDCxjBslsLzg12I6kYRv855qs8zfp4TUfhArChtOWM=;
        b=jX7ghjLby4og1NCgxhNEIfIeFz/7j8MCzxtfkrDeSt4S6ODJmB6SRWYP5YIpOIBFVd
         MyB9Rc/yHwHO6TeqNvEHGyOsf+PbLUrebwIaR4ScuTIGKil08JZ94YJLhxuBmzYVdeRj
         MZ8i8dlIUnKg0r1Snm+E01XvdbHXfJvfZ684CTBMU2hK+C6/jNrR2CI7uykT9FHo58my
         EWqPWmhwxPQIFAU7p3pXIGXV/320X32sxiqhQRKBcJZlPyM3x86tJSQMuHcSbAfnTJ+K
         7WVidAu5ipahWxdWl/MAPwjBGwrclhW27++UUJTPL0frUf9OezhW59IN3V95qAtO8DS4
         OnzA==
X-Forwarded-Encrypted: i=1; AFNElJ/Vtl8zNo9ukrGq8ceDiVPKU3rJWBqw58RskCAGqRHMgSKQOcGjPWHuCx98qHroYwquiGR0EeAD8do5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3MgetqMTi7aPBbDUmm5NaWiYiL4+JbHuLuTDXhcSGviptjZRX
	YpJITpytNGYR10Z4yk0uNkl/4vlGL/RcE7qOpXD2K/8Bx6Gz3lFDvzsy
X-Gm-Gg: AeBDieue0cPPkrdoFX3RL6u/H785LJEa3aLZv67kIkYddxCrXFeAowW0KLB1J65Vhiy
	n5mPSugEMZQXbE8Zuhw9BydAULzkrPUdNSjdw4OYLNiIDKleBOgdwqJx3DUc1rokt6fEKxAaYR6
	E+4zVDZ9F370m84A/Q6cho4jVIyEimKy2N/CabpRubidkWRwxGxq7oMsuUrZlobasBpK4V02s2Y
	a5Nwr6gl/l5E7+nCjlzBDefxDY2hp1icyM91/Kz6+vUsUTA0QsCJLnsrfD1xz2RJtUnuuz5wOII
	9tYDgigD4RWkuE7xpQD3a3F3lCxNiJzNXyRykhWJBff+Vvb7hv/3ta2m+c+ZsqDCZvHf0XVXFN7
	/wZiZ69nVUshMRrC0xZlIiM1rIFBvf7GNynxVqvbPr7smcBnevgZIw7nGQMzGgEgZkCPAsw2Laq
	gMHrEYScNlzwge16VkyE+j56T1hrFqr3lU
X-Received: by 2002:a05:600c:3e05:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48e51f2a997mr29947945e9.10.1778038625870;
        Tue, 05 May 2026 20:37:05 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b19besm7463115e9.7.2026.05.05.20.37.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2026 20:37:05 -0700 (PDT)
Date: Wed, 6 May 2026 03:37:04 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: rppt@kernel.org, richard.weiyang@gmail.com, linux-gpio@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
	Lucas Poupeau <lucasp.linux@gmail.com>
Subject: Re: [RFC] Precarious macro in tools/include/linux/string.h
Message-ID: <20260506033704.bpqcp2ydhoc45yda@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <CAKqfh0HqJoFRPrgvQG84iFt-0-vQd0fz3x6EPhzTgikss+XiWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKqfh0HqJoFRPrgvQG84iFt-0-vQd0fz3x6EPhzTgikss+XiWg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Rspamd-Queue-Id: 5778E4D5F06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36255-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[gmail.com:+];
	HAS_REPLYTO(0.00)[richard.weiyang@gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[richardweiyang@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,kvack.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]

On Mon, May 04, 2026 at 11:21:35PM -0500, Maxwell Doose wrote:
>Hello Wei and Mike,
>
>I was recently helping a new contributor with their patch replacing
>strcpy() with strscpy() in tools/gpio. After some research I put a
>hold on that and realized that strscpy was defined as strcpy, which is
>extremely precarious and goes against the ideas the kernel has been
>fighting for for years, and I traced that change back to commit
>9e3d665 authored by Wei and merged by Mike. I'm currently working with
>said contributor to get this alias removed and the proper function
>definition added, just wanted to give you a heads up.

Thanks for the effort.

>
>Are there any tools or dependencies that rely on strscpy() being
>aliased to strcpy() before we replace it with the real definition?
>

The alias is introduced to fix the test case in tools/testing/memblock, since
reserved_mem_add() use strscpy() but there is no definition in tools/.

So replace the alias with proper function definition looks good to me.

>best regards,
>max

-- 
Wei Yang
Help you, Help me

