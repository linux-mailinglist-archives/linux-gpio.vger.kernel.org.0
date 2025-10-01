Return-Path: <linux-gpio+bounces-26736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B20BB182D
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 20:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9171B1924755
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 18:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85A42D593A;
	Wed,  1 Oct 2025 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="D/cUU05Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D14C9D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 18:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759343784; cv=none; b=D+BFRJ86geG2B8FB+yGzRkbXsEUms1in4+XhAvzn/B5c5MVaPrUG1nQotLjEqNFX/nLbhCq9p/DssA8sfCmXwTruFMtkeGWet4XDwv+Xs9NFiej+4cmEnkJFlMuHFOgsXH/MbgQuyTczC89XEKZkIDYJ2e04+XPmLjwCnK/lCbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759343784; c=relaxed/simple;
	bh=UIxAQDQJMbN9Nt33/FwttLDE3FgEeI/xim5z6CvYRRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTVIXVP2yd2jCV8ZLHwfoIvxyHdNGJH92l+6szKhUyHKom3mMINYIJRmglIemqG17rguto4QieCXy42LmJquZgE6nb5560BzPQDH9Wm05cTRQy+nBoe+wWLgfbl5/stea53GQdr/LUkjXZPu6GC8pr5snpgyceU2rkjBMfS9sG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=D/cUU05Z; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso281658a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 11:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759343780; x=1759948580; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4i25jEK4dntxz2BKGOtfgS0CLdgFA+0hjJfJ87nVXJE=;
        b=D/cUU05ZVup433G2gMP5xn5NKci7k8nl8HafZzvcFEIfj3Aecd+pmCP80mW6wW5mj8
         DoxeHWKHuz+h+bIep7Lg3OwcfQ/ua/oA/3vn/KYCSmHPvgeBtQi2QyIZYwTaeZ+SZF+D
         IZ7CjkZG94Wit2e1T/+tnHv39ApDn8WK0Rdi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759343780; x=1759948580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4i25jEK4dntxz2BKGOtfgS0CLdgFA+0hjJfJ87nVXJE=;
        b=iiJiHAfjkLx8rpBWrZRazZ11uqtwQaCR5yCk9PtQYEA0RTxI2JGsN/vfRIJSkoj6G8
         8IjjltdyJ52lKWH2NHv/L2nWZxzniMA8HGzEimVzlAwrfOc82IVbpQcyVlp3o8VjNthA
         fyxapjnGNMLK08jds+XXH7BpvPm5FE7kUOEvUOnjInYkIKEohu6B7uYNWnT+GGC5mfdT
         PZ44sBKuTJWBX9tWfmOIu8R/AxuCR+0Tpq0urXyHVHxIZVruY4V/7VzAygYfrX76MBnS
         MHo3D58IWcaNUKBGkd6GCHZPWXAAJaz/aR9jOrYpmuSO+PsIjJyfPdY3Y/OiOIJloNV6
         aTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+I0UD4Zy1G0Tdf6SHpXdYcb3Rpm7RWDIh2r3yrca3ZYIgiY5d1W45mClGsZn4q80NsRQmPS9Koayd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nMjYf37v+bG6y1OooUs+bcjgCTisI9l+wRqxfR8WMIpjtyQg
	fcgjgXz35cb7j9nFa067nsNYCUDTKAMARzbYhF92tfCN/9X6eUSqPxq6AXr0YWVCONbPRyoFgWj
	BWaqPgIc=
X-Gm-Gg: ASbGnctmMgscN3V+Z9HUug+/D/aNwjOAANr2Mmd3wKAEOIiaGaFcoOBM1JFNfV/tNI7
	Bv8t3yVVqgnueg30elg0pJGUEZKa4aaFGqhRn963e7v7OPF1q8StEiFVoYQx+24txVQ9/F/OHXJ
	rCyCd5j7pdyJzdXntykevB6AHCbPrqm1DOV/TpXyA5UGtpxe/iQoN3BvxUzTCviT8XCy6oITQKo
	Krhf6kDwLWcPlttJ3TbRwa7Rd0y/hXW+nl9NAMiEnoGh9WykzCKtAUXBKknPHnpirfPvWqxT6vQ
	tZE8ZGUSWFKJKqec8r+e9cfSgWRV6DJbsCBhZvOYkMndY21LIAnk8IVkLhCnGs5O04msQvQt8MF
	dT/iWMt2TWvrtt2YXmnWJIU831LdiFFvCV5OFffevsoj/SFRcxDaxKiNYO7/tFJjPe/m5mrBJlh
	YHkFDYDuAuJTAMRV9WK32s
X-Google-Smtp-Source: AGHT+IEe3bFHO2bfg8wmB/jPp+YpY7vNHJBXhdd657fdpwffdrJXZcIyoyBgH9ur0F8PEUgfReWMyQ==
X-Received: by 2002:a05:6402:1e95:b0:62e:ebb4:e6e0 with SMTP id 4fb4d7f45d1cf-6376aae08b7mr667093a12.1.1759343780250;
        Wed, 01 Oct 2025 11:36:20 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378811f14bsm259498a12.45.2025.10.01.11.36.19
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 11:36:19 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso2565368a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 11:36:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUD6Y9TNhcjqfa35kDpgUIZY1tHwlin3CezW5OczqdTCFUEUhtLdhoaFko1jWhkaeg21nAehRl62jVN@vger.kernel.org
X-Received: by 2002:a17:906:c10a:b0:afe:159:14b1 with SMTP id
 a640c23a62f3a-b4859e7d413mr78539466b.9.1759343779157; Wed, 01 Oct 2025
 11:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929094107.34633-1-brgl@bgdev.pl>
In-Reply-To: <20250929094107.34633-1-brgl@bgdev.pl>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Oct 2025 11:36:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnmvjsan9Y=LcV0encJungD451VkdqYAKrRpk6YyA6-w@mail.gmail.com>
X-Gm-Features: AS18NWCnkZF8pjj6PmEycUScBzOCrNuVV1Up2k2QPgdQ6BQ6UKmqAtm2ll7h4oI
Message-ID: <CAHk-=whnmvjsan9Y=LcV0encJungD451VkdqYAKrRpk6YyA6-w@mail.gmail.com>
Subject: Re: [GIT PULL] gpio updates for v6.18-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Sept 2025 at 02:41, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Here's the PR containing the GPIO updates for this merge window. There are
> two new drivers and support for more models in existing ones.

This appears to not have been build-tested AT ALL.

> - allow building gpio-stmpe as a module

This causes build errors:

  ERROR: modpost: missing MODULE_LICENSE() in drivers/mfd/stmpe-i2c.o
  ERROR: modpost: missing MODULE_LICENSE() in drivers/mfd/stmpe-spi.o

because while the main core stmpe.c driver got an added

  MODULE_LICENSE("GPL");

when it was turned into a modular build, the SPI and i2c modules did not.

It's trivial to fix, but I should not be in the situation where I have
to fix it, and I should not be getting pull requests that don't even
build under trivial configurations.

How the hell did this happen? Where was the basic build testing?

                            Linus

