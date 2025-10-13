Return-Path: <linux-gpio+bounces-27022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EFFBD2B54
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A43E4F0A6D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 11:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A2F2040AB;
	Mon, 13 Oct 2025 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2YLj55d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD536264A83
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353391; cv=none; b=cTmmejH/7B915Ee/lPCWxIfMku5upFGr5GMdd0uyY/tfvN3Kmy7vTJk5IBd15PN4oOsFwolOZVfB8Pe2URyY5vmycKg9SwJXyjo5lv0cD9Y5KRpKDVSZ2et908/pDLmFSX7uPs07aNPswfABzGaMLKeZr0O6cCMcWAhKoXvrLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353391; c=relaxed/simple;
	bh=MEZMPp0/6x2Hj8xdnea+WEkAGujy3+yoVNtutOdRFkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THdqvMy1q4mr0FvpAsHTg3A3AySUwNwJ3XNyF5icMcbZyvCtIubGwStpsjoInJHrNnMKR/pmDWj1c/kjAEoKhMtF/gr6hRPGbExGLCWLQY2rXqMTHcHw7735JXmGHK4xj0A8W6ZY/NBJUcEB5uDn+9jsNwBhRn3z8FY55pDj+Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2YLj55d; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso30530925e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760353388; x=1760958188; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R36zhEWTXjAMC9qqqcZ2hDhZQoe9rT+tHqvTTsomPIU=;
        b=A2YLj55deF4TCBKe9p+vmHUs9alL8vckEeQFVT97fPO0Li4GRwjp7Z/oVIzHk2pEIQ
         8WwL8ORHPmsvK2Rk1ahTuZvBhByztboY8eRIQbRmVTz/YZVTY0fnvbmOZA9s8+mYTida
         U4HAAzZulll9iE7wsno1mcdXMwccKSPMAs87pcFuwH2hNVronw1szVc01GvoCgmF0WEh
         BKV6S8SA75eRKJgRkHg8vkWALxn4RNHAMx0quTRRQcvoE8u2VwN1hXCBppvqG9mzsyZK
         qUGYWcac9jInSCy7N4EsUTrP+mXXGom41yb76EctGXm5T5wxkX/+Md3se9BHrZP+AELI
         vcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353388; x=1760958188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R36zhEWTXjAMC9qqqcZ2hDhZQoe9rT+tHqvTTsomPIU=;
        b=GhEIMItf53QG2JattI8MimLQ9hNNlvYphHNnySkKpftPfQHqBj/KXpO7RcEQUQMpZr
         PKvgulZYGC+S3GvrspPlBCm2OTgZU4O9Vw+5n8OLPq1riDj+REWMimSCWad0kzjh2fy4
         ASCGRJhUfXeHbb/pRg410cVDMdjxAaJduDxbMZP1IYYwUXwi57tevXJ5Ba48Hy5cDNx7
         UScB2Ny3BCMenU6vPUIGpMFqRc01V1ctkdoPi/AXHmCh8YUF7rCdJc/pCEn6BxMrkEm2
         Lzv4F7Fr8gr7tZoTrDB6gcJJd4iFouJNoNWntpoduVKZ3WfxKnjrq2OWqE150W+8VSdO
         2v3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmCFHeC8XZSW0vm0UAgbacm5RPTlfC0MnwGzUcSltdo7zhkSDrrN9WYIsp2IiTrVrpR42FTWsv6sLj@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxrBn0NQ9XDREuHv7InBSF8egEn/43RAMirz+4rSsx62AFHVA
	cHnvcf8MRQkh5VymoL4YBOU4hz8ApWPyKX/f3i1YQ+XKzqyGn33bcTAi
X-Gm-Gg: ASbGncsWgJY/OFUG5e53DsYrqo3eTXHRG2lOB13l6fipkKs7fXlyv8J0f+k6LD0RbMz
	suZWLhFu5SSyOIYI2tbQXpq02svNVItl1H6hJ0HgHJ6bVvaYqlUcTSwsTf5wWasvZLu78pDLD8X
	yOkI3JE6h3KyFUvrcBxSGHmRM2tVKjpeujUyyQuBlPCPtYjf5/LBR0h8UsHd5Z+TO+ZueiGOadn
	uCYyM2Tv9ou4nz79QazQzCno8WLQAKcZcIKJ02fsqyHw8qrZGRmntY+yHTXmYMzS6cN+TGFNLFN
	s5KLmEouB5ygxckebHMYys9RNGE1fffgVoEJHF6KKXUT1GEv2zFQZl2g4eNy28y89Q0FfWXBKJu
	Llth1aNShzvh4mfEVt1NKOJHotDgD1mGsuHNt4wGsUiLEyfAorTW28q2n24NKkygT
X-Google-Smtp-Source: AGHT+IHJe9CvuwCz6Q5PoEQTTbl6WyMaH7Au5Vw7APlwtIacyj2OmqpNIAkZPtVvi18U13DZly66uA==
X-Received: by 2002:a05:600c:3e1a:b0:46e:1d8d:cfa2 with SMTP id 5b1f17b1804b1-46fa9af9842mr127699785e9.20.1760353387911;
        Mon, 13 Oct 2025 04:03:07 -0700 (PDT)
Received: from gmail.com ([51.154.249.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab4f3b07sm127656955e9.2.2025.10.13.04.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:03:07 -0700 (PDT)
Date: Mon, 13 Oct 2025 11:03:06 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <aOzcasDutRtw6JP9@gmail.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
 <20251011122612.4fa7c97a@barney>
 <aOpAO7j0Uyo6FPcu@gmail.com>
 <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>

On Mon, Oct 13, 2025 at 11:41:43AM +0200, Bartosz Golaszewski wrote:
> On Sat, Oct 11, 2025 at 1:32 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> >
> > Hello Michael,
> >
> > Ah yes, this macro somehow got overlooked by me. I will send a v2.
> > Thanks for the review!
> >
> > Regards,
> > Vaibhav
> 
> While at it: the subject should be: "gpio: bt8xx: ..."
> 
> Bart

Done in v4.

Vaibhav

