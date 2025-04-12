Return-Path: <linux-gpio+bounces-18740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1FA86DDC
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 16:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3342F19E690A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 14:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B158F1EF0A5;
	Sat, 12 Apr 2025 14:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="a0Dxi+v/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC51E9B28
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744469124; cv=none; b=k828QItAWDkQsRRGa84HnQzljYYN5MR0ll8QbadHFNWIDfzGnnfIgUxyNCmQ0VYr4Bet4BnHcmIylKFdbQApLMNUtkmf6ttODlH2m6kh1sfKu/mFsRKhndXmuphAcaGcZ4o2uPUG1JxbE48ybLtGm3pCnD+L++AD5nxTFgyObGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744469124; c=relaxed/simple;
	bh=RN/j9DFZ+CO45Wo3mYYbAVag+7CjqaLHD8x49oYQI/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOaicXCKbzug8+J1OznPknLaOqE63jDBDLPldJLN2trtlrxOPyqgymqQlzaD4lHZJ1m2tgPJ7C/QAUludMqfpjTx/5VsGtQfAZbicTFQa64DFkJgdu1zDzDhs79os6qvYTggb5IKvtnxQYKyfKp9niipHUh+tbanObq58dV1WS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=a0Dxi+v/; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9732F3FE26
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 14:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744469112;
	bh=dMnte3bUYKtheIFCBih/uasbJjspqVJC5iPHCAuYEFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=a0Dxi+v/BRY/00PnTuYJ4C3sM9PVuXhglWZI9bzaXAYn4+OpFVp5FrE+ZuNf0clQj
	 gG8aLrUdv6BwRvck2dY6UgaItXEmm2e2h7uyEzega+R894UknckzoA3PV7ybp7GuV5
	 vTrFJYfnxRMBHE555YOFxlmcGttdQazBDIDI0M8IG0+Emjvh/8anzKEMA9IjY5E/l8
	 RJtCHurOxyaGRKqIagPZAHimye1xHQP27t4za4p3dUbU5yHV7bVbYsIEqbFFZVhCto
	 Lp1RABpumzvEV1fP4jcp3B5PnFntHURd5hWrZl3vrU/HtZ5GD+eW0YU8S0NH3x82Yn
	 D/6qQFP9pdNZg==
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736b431ee0dso2163134b3a.0
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 07:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744469111; x=1745073911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMnte3bUYKtheIFCBih/uasbJjspqVJC5iPHCAuYEFo=;
        b=qqVaE1FVBgE7fcKi87YGXNKyGGhO1m6w32GMv0azqNLZuwFqnxvXLINTS3bujs0Ysb
         bnk39fEuqbFtgSt//i2KKc8dYeDmORGqr9rKkjA0k8jbgr0muVH4ZtOIZ3MIP20hbywR
         JvxANeoLQMjoVIRcU5zvVuRjBgXoqOk0k/yqgAmqUXRHcGvUZ54N/jPSFagAFbEES6WC
         AxDfEiJ8NCctcN1vvBCjjJOYcJPtfGZh2LuK69CHeNSWeVdjWWtSLh/AQ7EBm9avtX0r
         Y5g3Gkl6G5vymv0VPdJijVe/BRVO2hPNea9Jqi4J0Lu8bESqzVXW8OJV7q1cs0NxL2oz
         44UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEbPy4+QZWRpHqGjueqf1Y8LIaO14ik3GyX1BzyyBE0v51sUiSb6TjcR8iVE19kUs8Gk/Feu2/VmUZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi2kJzbkS/T24VRWkzhd9Yd2Tx3aLdaYWLRm9ZqFRbThPYqoC1
	t8fy87Ko+fEsji5DYrzur7UT+zIh17YBdx4HSJ+aC/vF2RnQNCHj0rxrm3r/qHMpjW8IsvPDPMg
	1MsNiqUq6wfxFB4sKA91jjtMwGh0nDSHy7cqfjDJeW5t1i4wSIQb8lmhdCERDl5hSh5dswFt4na
	s=
X-Gm-Gg: ASbGncssL89DHtvm3/TJ2zYyImij4lFuJ70hKbjppOWZG9cRMXcPHpYtCeJPzP0zV7O
	cCSPOrV6oHeYZ03JSxCvbkmA5yupMhWRAYTDWq4J8+o+bBfXrHBADaBcBrsyyJ8rOGi45BHn21c
	lvhVAsbDlaTjxpNLUmocHIf9YvHhpAKQw+h6Kt9UCZ1SDDfBuZUpKyoZhon2dkqrVIG56oHIAVo
	hYTymUhWEaIanM39i54p7S8LAwXdc9x+o1IFae5u+yHI1pk6fdw2Eb9UyaHzeNvD5CXzt8NKZEH
	qsWxgapL5b7Z
X-Received: by 2002:a05:6a00:240d:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73bd0ea5de9mr8269683b3a.0.1744469110623;
        Sat, 12 Apr 2025 07:45:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgs/5961Tp4ODI1uCtwmazIOwGScEXQjNWVM6D4BLHjUvb+kl0xxTjoourf6aP5pGbA4cGOA==
X-Received: by 2002:a05:6a00:240d:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73bd0ea5de9mr8269656b3a.0.1744469110103;
        Sat, 12 Apr 2025 07:45:10 -0700 (PDT)
Received: from localhost ([240f:74:7be:1:3a1:1528:8601:c20c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3870sm3432688b3a.48.2025.04.12.07.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:45:09 -0700 (PDT)
Date: Sat, 12 Apr 2025 23:45:08 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] gpio: aggregator: Fix Smatch warnings
Message-ID: <52ap2hc6ii7hlk2zixxf455nens3rxtwvrrwhlv4ii5avpgmcq@lbrdov3ygay3>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

On Sat, Apr 12, 2025 at 01:14:53PM GMT, Dan Carpenter wrote:
> Fix some static checker warnings from Smatch:
> https://github.com/error27/smatch
> 
> Dan Carpenter (5):
>   gpio: aggregator: fix "_sysfs" prefix check in
>     gpio_aggregator_make_group()
>   gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
>   gpio: aggregator: Return an error if there are no GPIOs in
>     gpio_aggregator_parse()
>   gpio: aggregator: Fix error code in gpio_aggregator_activate()
>   gpio: aggregator: Fix leak in gpio_aggregator_parse()
> 
>  drivers/gpio/gpio-aggregator.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)

Thank you very much for spotting these issues. I doubt myself for having
overlooked these.. And I had actually forgotten to run Smatch (it's really
amazing tool). I also tested the patched module by running kselftest
(gpio-aggregator.sh), with the addition of a new test case for the issue
that your first patch uncovered. I'll submit a patch to add it to selftest
later.

Acked-by: Koichiro Den <koichiro.den@canonical.com>

Thanks,
Koichiro Den

> 
> -- 
> 2.47.2
> 

