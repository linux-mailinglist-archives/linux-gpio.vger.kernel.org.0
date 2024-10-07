Return-Path: <linux-gpio+bounces-10976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1501993354
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4151283AE2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A321DACB0;
	Mon,  7 Oct 2024 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="dj+8jTQO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7706212E75
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318841; cv=none; b=ay5o2cpmiyFnrAL5o/MzsArH0qlZSau7lAfdR7ovM0aqTq/peb9onz2D9O9noMkaExix3JSIXSQXR/tvbcTLcbE6nf8Fdc2xy7Sxw3EimbG8BdvLRtG+yL6Lxowc0o7jh9zQ6p7qWYw6fwOmLpKFiW5reDdmPf/qlGt1XxMrU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318841; c=relaxed/simple;
	bh=DdutLgm7LnJZUydsu87UTwymGUlWI6mMAxVG/ZJc31s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qs/2Lg4kQKJBXPnTzuQXGaNnKMVyGd3mFw8EiTJi/zeKd0JrG0tGugGQkkVZg3m/b+qfMGGXE5g0bxajfLBphBBvPUIqmXFRe6lJKw2NnJiAGbyzk2q7YZu/yPs8B6kViaNvqkxrdeZwQMPTULJgSMtllxOYzfCZ36TpcKttVBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=dj+8jTQO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e0c3e85c5so570410b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728318838; x=1728923638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZWM6QTmBe9B09ML2vqXCSoB0/AzhE/+M2NioGDzKy8=;
        b=dj+8jTQOYb5U/boZEpygD2rjOq762FeMoC5lNAYzq2H1PjmRkGDAtNJlEYsguS2uuO
         +kqUahIk57P1e2C7T8zJis73pxFkA5CnbtB12EV4/QCa+AgLixnORGQrsIEDkZRDtnTo
         r+PxO+HHm1mvvhgAOiteTosQ6aHXKK6EbrzJg+t0ASK0M1Yjy8WG48qyOWlfWIudvd2D
         rypHrkgZffx3ZGCZyOjjFhBdBFwA4Jqvz/IZF0uvMJzNQmbeYHm5He4xTd/aVsn54Nrk
         F4qNZuXWYGWdoS/d7bBTxLIv/IZbVStYGqo+4anCI3zMLpgjri1K/a7MnmWPdJM/pW4f
         +EMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728318838; x=1728923638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZWM6QTmBe9B09ML2vqXCSoB0/AzhE/+M2NioGDzKy8=;
        b=eW/ArZ+bf7oxTh0+Jz8ngpzuJ0MCJwbtk5AmVVsvJksnegpmFhGNZcbEkiDZJX/aCt
         p0mN3iF2konoFGUQ3OeC3mMlN+16J67TiDGIDbcdRFfKJ646pD1Q20iNogGz6GdAMDtI
         5eYiDDyMmrbV/eDeuvTG8Rlc/YmmbdPScesRRPCZCKltdNqrAN//njusxYIBLJOqLNYh
         fOv1iofTKOeu4+dSPOGdzMiXUmvvqcYbsbkBgUaijNOgE/yRs+cpautEsbZdQYQyGT8Q
         2XbFd8VniWEOQdPbxDuCIq5KCKjwzvYLy0gak5ODHnM8KzK4269Et17X1FN07C0vZ01M
         2U6g==
X-Forwarded-Encrypted: i=1; AJvYcCVXV6MPunkjBNM9nyiIeBXEkkDHkZoqMjJLM7v+CapXrgtIHhLMjB5mGI77oEK4LUjEJ0AXkjSZF+JM@vger.kernel.org
X-Gm-Message-State: AOJu0YyOgszBxd0P/phlqMdzTxUq/8689O9cULfqEPTnFOrqsqmCwBvS
	i9OHcsTCfHhcBEwlpbT+p6corD2Z3EUTC1MTLu3gLlioQz9xdfYNcJTqA3Dnw2eqTEFUQAM9vzx
	u
X-Google-Smtp-Source: AGHT+IEOn2aNJRc6PNcmA1E8hHomUDAvzvN8DoqLjg4IGSM4t5x9BXT+gVd7xFtvp6ibMbgO/sW9JA==
X-Received: by 2002:a05:6a00:1ad0:b0:717:8044:3169 with SMTP id d2e1a72fcca58-71de23b5f19mr17937448b3a.9.1728318837846;
        Mon, 07 Oct 2024 09:33:57 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d4a1f4sm4590147b3a.113.2024.10.07.09.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 09:33:57 -0700 (PDT)
Date: Mon, 7 Oct 2024 09:33:55 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Message-ID: <ZwQNc9/sO9lhUvmw@x1>
References: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
 <6b3d9f7a-c87b-4ef5-8571-77276f3896a1@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b3d9f7a-c87b-4ef5-8571-77276f3896a1@stanley.mountain>

On Mon, Oct 07, 2024 at 06:41:36PM +0300, Dan Carpenter wrote:
> Hi Drew,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Convert-to-thp-mutex-to-guarded-mutex/20241006-033647
> base:   2694868880705e8f6bb61b24b1b25adc42a4a217
> patch link:    https://lore.kernel.org/r/20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00%40tenstorrent.com
> patch subject: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded mutex
> config: parisc-randconfig-r072-20241007 (https://download.01.org/0day-ci/archive/20241007/202410072108.uG2sVTN4-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410072108.uG2sVTN4-lkp@intel.com/
> 
> New smatch warnings:
> drivers/pinctrl/pinctrl-th1520.c:538 th1520_pinctrl_dt_node_to_map() error: uninitialized symbol 'child'.

It seems this is because the scoped iterator declares *child in the
macro and thus no separate declaration is needed:

#define for_each_available_child_of_node_scoped(parent, child) \
	for (struct device_node *child __free(device_node) =		\
	     of_get_next_available_child(parent, NULL);			\
	     child != NULL;						\
	     child = of_get_next_available_child(parent, child))

I'll fix in future revision.

> 
> Old smatch warnings:
> drivers/pinctrl/pinctrl-th1520.c:502 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'

This has been fixed in the v2 series [1]

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com/

