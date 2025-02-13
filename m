Return-Path: <linux-gpio+bounces-15913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C72A341A1
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 15:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE494189124B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 14:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBAF221541;
	Thu, 13 Feb 2025 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="j+SsLrO5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F53E1487FA
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455775; cv=none; b=MePwjJGBZom9fgsvtmuaOc4RavwtdcKcQUAfTrQRLLzM/sigVmirZoyVS4IeSYKASPPH8lX5w6+2/ZZgePlJV4kp9dhm/ovrMy31REkqBVsPS47I8Q3AI5gdIEv3Skb9k+zTxPNnL+eubyCpjYQF90G/xPNTO0pLFotQWp+XNF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455775; c=relaxed/simple;
	bh=bITAd8mMpklIAUS4JC6xN0NXMsNUvXCDm5eahLi6O7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aI/PozGTw2ru7RtcQI6j0ytGGlmlEahywcS+lXNAdlNYPCVjhqqm172eauF5AHOS7j2Teza1UvsKM8L0rSQ6CfFIOBNqAr/WpMwh9iazMQ+qkfl/nCi2DamyChTBQy0KyUbqJWyL2vom6N2j1SzVwbZyDbkAsvisWjOQaOWWg+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=j+SsLrO5; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 09EA13F682
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739455765;
	bh=uT1aaGr8G8g8+cxLYkpklpbAkzbJ8av1g9g9BSJeMyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=j+SsLrO5prjZQAikljdkXfD0SRYTa3VmPG2pNML2dUz+MUD/DQdkbXRcW3FCk82xT
	 hJqsEi4LNi7FZgaa0Tk5bSFCxD06gfxC37Q9CsCYkgGf/7Kb/dr3y67bHjy5gVyRib
	 hn66GjJgiKKEjfONrm4yHRS6fx2MrYgG1Xbesu5CVn1tS/Cfno8Od80NzC5B2Gqegs
	 2DeZ6kLWQ4THBc66kVHgOwD6CALyRHtcamVX3AQ8nW7iLGdZriTf2Pii+/RtlIjcS7
	 3ydWCh7AXECFKBf/tdnAZVEjd9KNi/wY/+L7goQxc4VK3JiQD2pw/53q51z8rtuFpd
	 MZJFs8LC/rTcA==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc1a4c150bso1136063a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 06:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455763; x=1740060563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uT1aaGr8G8g8+cxLYkpklpbAkzbJ8av1g9g9BSJeMyk=;
        b=CnE2pAVnZN5F+4CtPlmskcBtFDy12LGv6lYc++fCtGfhYCBCCVqwUtY0LGo34tpEBE
         yawnNgOqPDAUYGym9+tWOkObYoPCHpQ/iAaoMMyeurjooQnXx3cRLnnfagoi2fIdmOeC
         pvC5qFEUKDB7nrHzGaXLk6L1JTzkGctwbNp6P++JDx2m3Sd3LQYwPtjzJu9nVWJZncVq
         UyGF8sLzCLywkWQ/WwrC6z1XGXqbFXaJW+17+WBGamYN2k0s1IKhQhBHL+YR9WnSUZz7
         5K8NF9Rm21Q3j7SSahhprvlHz17xr6A2x/bMTsl7YJydhaDvAH4hamhMnhQqHMqsleux
         kObQ==
X-Gm-Message-State: AOJu0Yzm1psWN9aB7ShUhQVzYxe/tIqalrAQlJQL2+7w1aWbOjKhGQBN
	Ruw1ErzGp36AHQPxnBxoJFm75r+U1GxKCqMxTVZA9o4j8+5fR+4ecQDgIqPQw7otBNPahE036Du
	NRuUx/3mql5fGI/IOhyP1j7tcnWV4eTGvXkGKvp6YxKZJyjBRQJ8Tj4KnWV25nMRX9McY251r0D
	M=
X-Gm-Gg: ASbGncvKpLEKIuG8eL8HfHZ1m2RDRZwQz3fS3rt8e6XWSWdxdKjlCARFUKJEO2xfGHT
	N5jW8IMYuqwlktsm5WMb7QXZ5VUYA5eiBpcvQtmvghzHe96GhbEWxw3L4bqEXZcDjhSfgsrAnZ9
	zwFq4MGsGjT/F2KSFu2m8ebjU3ODPdiNMe3/2kqjmslUA1iKSv4RDjTfbjCCRdTSckheX3jxzwk
	OE1KL45sMeaDQbv8l0OzMZTamUANxpb0ek9hBuaP+0ju/YqTH7CcLOZI5Oqkrx9gZdBWQgb6A+n
	NarB+so=
X-Received: by 2002:aa7:88c5:0:b0:725:e4b9:a600 with SMTP id d2e1a72fcca58-7322c5febe0mr8531714b3a.16.1739455763648;
        Thu, 13 Feb 2025 06:09:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2OC7Bly/7WjTJr49UdcU8b8bQ1YL9E84be+nLYkBfeQGCe4GDRRo2znH/scSBpDczXDVcaQ==
X-Received: by 2002:aa7:88c5:0:b0:725:e4b9:a600 with SMTP id d2e1a72fcca58-7322c5febe0mr8531682b3a.16.1739455763273;
        Thu, 13 Feb 2025 06:09:23 -0800 (PST)
Received: from localhost ([240f:74:7be:1:5439:d90c:a342:e2bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324256f0dbsm1355536b3a.68.2025.02.13.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:09:22 -0800 (PST)
Date: Thu, 13 Feb 2025 23:09:20 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <ziupltbphzkj6hngeqpjktwchqtj5ni2oum6cq5oa7agds5u2l@pwo7kdc3qiph>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <CAMuHMdVoCf2VmgZOtNOPxhpTdYBWEWgCozLM+opaL7wOtF10_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVoCf2VmgZOtNOPxhpTdYBWEWgCozLM+opaL7wOtF10_A@mail.gmail.com>

On Wed, Feb 12, 2025 at 02:14:23PM GMT, Geert Uytterhoeven wrote:
> Hi Den-san,
> 
> On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> > This patch series introduces a configfs-based interface to gpio-aggregator
> > to address limitations in the existing 'new_device' interface.
> >
> > The existing 'new_device' interface has several limitations:
> >
> >   #1. No way to determine when GPIO aggregator creation is complete.
> >   #2. No way to retrieve errors when creating a GPIO aggregator.
> >   #3. No way to trace a GPIO line of an aggregator back to its
> >       corresponding physical device.
> >   #4. The 'new_device' echo does not indicate which virtual gpiochip<N>
> >       was created.
> >   #5. No way to assign names to GPIO lines exported through an aggregator.
> >
> > Although Issue#1 to #3 could technically be resolved easily without
> > configfs, using configfs offers a streamlined, modern, and extensible
> > approach, especially since gpio-sim and gpio-virtuser already utilize
> > configfs.
> 
> Thanks for your series!
> 
> I gave it a try using all three ways of configuration (sysfs, configs,
> DT), and it works fine!
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,

Thank you very much for the through review! I'll reply to each of your comment.

Koichiro

> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

