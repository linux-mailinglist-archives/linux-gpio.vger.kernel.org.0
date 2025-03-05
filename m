Return-Path: <linux-gpio+bounces-17112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF70FA4FF00
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 13:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2E853ACD74
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 12:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACEC2441A3;
	Wed,  5 Mar 2025 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="sJETZT0d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFED013633F
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741179029; cv=none; b=PMl9TnB6WF7x6mrJCRMykhPpIZNKB4pPHVC1o76oRcmJZao4OXt5DIQqqU7xwGnTf/KxQnIvm1vDzFssRl/h10IMMl/Nb5ghfTnHtWBvPYcvQJEy1HorsJqh15ndx0F9M/fHiKgzT8ykEHKkM3aQCBsMxG+Ha2suNX6CNW6d0r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741179029; c=relaxed/simple;
	bh=yO9RSssbgEUbbG6Eui7gZpTUFd8pnSYgqrFrmf0GkAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5NFQ9/+/ZBCXbISqJmm25xd+FPRg86JQo0uS67eSS0Wpq2OtqBkuUSXQIefRxvTFFTUAX2MYbN1Fh8Y8xrlRiVU6Li43iSKjlbTkfW8ReyuwgFZiHBMGYkGqnwWa5fczgI2xpc0zGymITSbT4LzUlObgS0e32yDrotsPP7CHCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=sJETZT0d; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3C3F83F85A
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 12:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1741178691;
	bh=urCwtfpYBHrLbpDpp7U+vepeooaJV4Q4tWy+4UvDFzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=sJETZT0dmmtDqVpxunBVGXvxh3A3ncpsrIflMBlHW/QCpj8RYYF/i2DdQN3u9Ylho
	 uEcVqykXxnzZiECvpW/jT6Pjulc+/2CGsMVevZiTmX86Pdhoamj0aQubPIr2+PURH/
	 qOM0t/8K+gWJPHJeKMDS95c+5OLB4AgsPqE7LEgRn0Kzhd8RoCozf+tTne4evbHMUF
	 6E/oZCWPYh6xqetTaWMp0pXIHoQUD0rPlszhwEDldW2JgLEN8mLsV3Lj26kC85EbcN
	 2Qtj9P9R21CuHz/TT6fcAM9Ia4CPeOlswtsM8LriT7FgsqeQx69nNNuTNxsjZ0m+BU
	 TTUD8lDPqNURA==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22328fb6cbfso122442405ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 04:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741178689; x=1741783489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urCwtfpYBHrLbpDpp7U+vepeooaJV4Q4tWy+4UvDFzE=;
        b=oEX4XqdC1XzGvuL/hw+XEY3Y2r/nJXpkRb2mEkGCaI9biHWx8Xk6h8fcBrZeoIctGb
         h71jvcSfm0Z6QeaBPGbzUVwfJiHTcKKBBf8QVPo6QCT/8A/o2HX+ZzrDbLRGkh5hCiyV
         B0CLjW43lnZ8OugkPIz++DUJFVhHISgPds0ZvkSahsiQLhCxcx2E7gwxHxWdyea+qVbv
         mg58pE0RCoRqRLqeGaCiLaO9UrSggd1lgIYPu3f3+1TLeJG02lE9hR1ahr73z7Uspooj
         PTv9PvOmToU8xNP5UT6v7gFCylx2j50xPli9BrtbeNaGgHOcYNiNCQRd4OABIDJXWArT
         ZUDg==
X-Gm-Message-State: AOJu0YwDvgMIYtOqjgJ9F04M1FJCfrlOaVoIl3Bxmm0HYJ9LosmhEfFf
	cYs7EVMGHgNOl6Aqodezv1dNGxhep3S9M7vlJ/aTJoGBEBVqJPcMbmcz+wM97JL3ul2Erl1N+bx
	K5T7IRFBsZ/7mcFtQp9rj2JFu9ojWdliX/XbJn/xKwljr7bwZwRilQ/cbg2wSGQCVB4/XeMH5Lc
	w=
X-Gm-Gg: ASbGncvx8gkp9D0z1V+5IzGJEuGCG6D5FygSlBpmvmpi/UQSC84aTdIgZwUhoMDawKw
	Y3v2/XirMgOMPnbneTOdGvoZQu+stI81nicy8GUcFH70cO8ZjCRLubTnqa98fLQfPpAsoMvZThz
	7TKrWi1aujPvVrZ7Liaj5ErVgbDw2aIK0xjIKcDInMdh10q6GNIzywWl5Eye5zLuDpjvJhfkVJj
	UlAgmm2ffn0pP/qvY3tl9+bWqsU6t9Hs+IFqzemkyZTKJSZrXW3sIkiyalCjoPrdE5+E4X2w4n1
	sqUIZNQPqUuelwr+
X-Received: by 2002:a17:903:1aa8:b0:223:5645:8e1a with SMTP id d9443c01a7336-223f1d24c43mr39977645ad.51.1741178689713;
        Wed, 05 Mar 2025 04:44:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDAT8zt0xy6LiC4EWYqcnGzlPoc6M+Lwdom0HGZWoZiXyYU2ER+E9bGNsMCb2zeHuOhGe9Mw==
X-Received: by 2002:a17:903:1aa8:b0:223:5645:8e1a with SMTP id d9443c01a7336-223f1d24c43mr39977395ad.51.1741178689425;
        Wed, 05 Mar 2025 04:44:49 -0800 (PST)
Received: from localhost ([240f:74:7be:1:b58:f691:f9bf:7104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050f11fsm112505365ad.196.2025.03.05.04.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 04:44:49 -0800 (PST)
Date: Wed, 5 Mar 2025 21:44:47 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] gpio: aggregator: add 'name' attribute for custom
 GPIO line names
Message-ID: <m3a6hcsh2a3j3rcw7x2f3tn3gif6mtor7bfxdmwkgp435vmxpg@upgh5b2t3ukh>
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
 <20250224143134.3024598-6-koichiro.den@canonical.com>
 <CAMRc=MdoMKdqyzGMFDa3aMz3h=vfZ0OtwARxY7FdsPKcBu9HQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdoMKdqyzGMFDa3aMz3h=vfZ0OtwARxY7FdsPKcBu9HQA@mail.gmail.com>

On Thu, Feb 27, 2025 at 10:50:34AM GMT, Bartosz Golaszewski wrote:
> On Mon, Feb 24, 2025 at 3:32 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Previously, there was no way to assign names to GPIO lines exported
> > through the aggregator when the device was created via sysfs.
> >
> > Allow users to set custom line names via a 'name' attribute and
> > expose them using swnode.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> 
> IMO this should be part of the previous commit, there's no reason to
> split the configfs implementation. But only change that if there'll be
> a v6, otherwise I'll take it as is.

Honestly, I held off replying here, hoping to get some input on:
https://lore.kernel.org/all/CAMRc=MegKxwX-RjQQcWMGe_JQyRCv82WRRbD0naYkeXshTGXGQ@mail.gmail.com/
since I thought the decision on sending v6 might depend on the feedback.
Anyhow, thank you for reviewing.

Koichiro

> 
> Bart

