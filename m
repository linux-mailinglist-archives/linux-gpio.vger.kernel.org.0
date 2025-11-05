Return-Path: <linux-gpio+bounces-28101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E319FC35524
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 12:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 940D43B6886
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 11:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BA62BE7BE;
	Wed,  5 Nov 2025 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zu2hghgb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A730FC06
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341312; cv=none; b=DyuZG7DE1VrYMgZcrYo7yjxxB4qc+BUPoYdRJVr5szoezm3Mt6XuxFIdwrqef1I7JyweHTaga2MslH9UxDvArYWnJZGA1N7UM9SCiUObOy9bi2x8fTE8an2X+IpSEiMba1jmOw4SM3MmnGPQg3qm7soIaCAw2XR91ui23JQPk8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341312; c=relaxed/simple;
	bh=b8NLflI1+239K3aB4h6UiQXjhstJCs4ItnoyobU/xvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBT9nh0KJffSxZ8kU0sHNYzZO4PN2qDA2p6hAOTZrV5qRjaUTK2jSKmNSQxHGKeLv8eiuDX5zuhvWi8A7nxquXUgv4Do4ZvjI6jvCYchNSX7ZSxUCj5BidKCN4K1oUrcCjaGUTD8A6EPb5AM3C4c6wjHfjBkVNo+ABs2r+He3po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zu2hghgb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429c2f6a580so1428532f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 03:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762341309; x=1762946109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAPLoTchT6XoY30KdYFFxFqaI9SuNLjLbilldo++DMM=;
        b=Zu2hghgbcf/LWm8N6MF5IPy0lvMr+at30EqbpQqW/umTY+nnrVxJVmFpvvqilgwR4g
         IQCtgsO5tcWbQdlFLiGgdNHSjSpFeapWCpJtpibdUr7ICGY3oXHL8+9sgAcLLnf/V3dK
         II8Vm9CsbcZnYd9fNa+npqMP0SEcQbPpuPImAkdsIfRN941bG/gx2sqfQm1mHParE/r7
         QY7XhLrbhOuy7gFgTvfRW+QryhtNJj/kGhde3OMak0PCoYPd32bO23nTppBFHXrzoZUo
         8SO2yHwQOz3wJZKrU1HQhbHWPuKrjlOQJb8GWe67c/2hq7zLmCtWZbpqm1/uUae/y4n/
         qrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341309; x=1762946109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAPLoTchT6XoY30KdYFFxFqaI9SuNLjLbilldo++DMM=;
        b=CnGZv5EoT6KUhRbhqFGd6A7s5DfiDomHtXVpCMy9xMGDJjfRVmdS2vUEJAeZ7yZDnX
         1kqGUme43pySb3xeQWkhTFDyVtuQJTzPs+bT7k8yleH2tHZye5MtOM/kDI6/zg2WwG7/
         bwroy5KRM1ELRXC+dQcOp7c3rWggugkwc/uHZSK2CshOaJPbsTKTbMCJxB8JFKKBdSxZ
         yShhyqhQ9ss/9ieQHIZ4QVDmKul+b/i2RQua6pCYcEinMAXPolem4TWHAF62WwJuXVVS
         nKvRyrZalGXh27FldpJW+OLWRZmKQSHaOTDb8+gowEwgswXOkZxWbjJw3+iqkEe3E18W
         5X/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/XoQLhfUMHxEVLw7brLKUUH8zq4RCi/yNKP2yUuozYLS3HF5GyIPrZ3XvUtrjICFZHyCp4DGkVu87@vger.kernel.org
X-Gm-Message-State: AOJu0YyKxEqFzJ2XRD5ioi2Y0W6H4G+dwn0Qqj1iRVDeZi6fUyzd/P7b
	zrT5mcQmHbdKIxS/I61T3gCRk9EQFYZjEehuQUFx8/h/49505J/g1aJ53FCuH8eR0jg=
X-Gm-Gg: ASbGnctq1NFLzmc4Pn0V3SCGH9OpWuSrzK5mjriPOfmlddXaEXOb7oA2gXeAwzA5AAl
	b3LuZG9dy4c1KCm8zqcJZVaLSdxS7vKmOY7IEfqMPv7Dn7lwd94oX8sYuUslF2pdcNxLemSRRar
	M8AeYR2Z7BoCO+9S8d21R1J30aT2TUZns1E2o7SoLpnqMOO7aypIIY8fDnzFzmYmr3K65huS/cb
	CcDU9X2Gdzk7aroJF2sqqLturuWUWCCf4n+mv0DSNpvINH++59zBSONCm8UBj/Aa3WawXTaLJro
	j7HjZOHyOYcMPbOt+b4/m1EVoED/ujBobrhdxrQzs1AmXlKPq0XZbEB3K9YK8r8GCTXbf1tlbpj
	wHUQytpfLE3aoGFA+umT63cM+biVtmG1iiHZjWOxQ/wWaUfVI18Ftc4tCzM1s29KexFXujQ==
X-Google-Smtp-Source: AGHT+IH/0DnzWoziqd0EkmGpk63QntkLm2srNLkFToLi1ng2mHhma7kmyyi1K59sN5GGeDB20G8mTQ==
X-Received: by 2002:a05:6000:288a:b0:429:bcd7:ac9f with SMTP id ffacd0b85a97d-429e3312cb0mr2728372f8f.53.1762341309377;
        Wed, 05 Nov 2025 03:15:09 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:4e71:8371:5a52:77e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f5bb5sm9928777f8f.30.2025.11.05.03.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:15:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Marco Crivellari <marco.crivellari@suse.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH 0/1] replace uses of system_wq with system_percpu_wq
Date: Wed,  5 Nov 2025 12:15:06 +0100
Message-ID: <176234128319.20998.3148035011153421288.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031111628.143924-1-marco.crivellari@suse.com>
References: <20251031111628.143924-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 31 Oct 2025 12:16:27 +0100, Marco Crivellari wrote:
> === Current situation: problems ===
> 
> Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
> set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.
> 
> This leads to different scenarios if a work item is scheduled on an
> isolated CPU where "delay" value is 0 or greater then 0:
>         schedule_delayed_work(, 0);
> 
> [...]

Applied, thanks!

[1/1] gpio: cdev: replace use of system_wq with system_percpu_wq
      https://git.kernel.org/brgl/linux/c/b6d31cd41814a33c1a22b8c676131820440cc44e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

