Return-Path: <linux-gpio+bounces-6415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 813F38C7AC9
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 19:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D9B41F22622
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 17:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CA9145340;
	Thu, 16 May 2024 17:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="bVWGEHUt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3E04A3D
	for <linux-gpio@vger.kernel.org>; Thu, 16 May 2024 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715879049; cv=none; b=pn6R5Yi1t7OVTIT0E4+wGbqRxj+kdGMHAlGVxxqC1xDOcHt4slmQW5s47nwqvD0zllCXoAQr4d9HAbBEZE5kzWuYknCwmT95GHB78bguLkdGc3kFXKtftoa8XmH9IXkA0j8Wh1B4jCk8OzWSdYPVtfY+Pw2wpWEEDBM97PIAVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715879049; c=relaxed/simple;
	bh=rsMQ/5885mYwARF3wRsSl+Yp5H4QymZh6RwQfRBmPtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulI2HLj6twpTsI7XALqGlIK0ScyXzJ4x8ecohFwQQDY02ZcQfBTRoBmqJTbpJ4JrU2NC/3fFUsp6nyjDlr0Pi6Cnn0emYKf6RSY2BVcnlCM2BklyKJqOZXXkHoLGWTglujjpDoBXWds7JXYFkLA2pyOt6BCIjb/X5vEWpTLAkGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=bVWGEHUt; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7e1e06c9a10so63125839f.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2024 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1715879047; x=1716483847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5BcOlqeHdHkpg9rPGe9OSUX6goj8JCvPGkrhm+DPRCU=;
        b=bVWGEHUtWNqlQF+Q5/whad4eLxuxE0ZnETiVOIyDrHdZxBVJsUPmnuAGS1uXlAod6A
         0fA7i4O0jLaxLfz0CM72RXxu/2byT0Mv15ov9VS18wcGTYclUto7gozs98oTepv8cRdj
         9kRd0WhNzO9UL6QdzDS9ZkxDLArj91/iknwWMXXtc5r56P+Bn5HtDkNlIlv/QPpbubv0
         lGL7exD03Bdn7gshTQMktlZ+qFm1yqvny4c8YJsWw7h44JZMqhraJPcXmJQ4QKjpoo7f
         hepGVZZXfX0feGCWqBYw6OCynNfxDud3/b3/NNtUV7f0rAnM8C6DUjrdi5mJ6WEwRQpl
         GgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715879047; x=1716483847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BcOlqeHdHkpg9rPGe9OSUX6goj8JCvPGkrhm+DPRCU=;
        b=voAfpWSMEU+C8/1n72ESv+b2juStA9Tyc4XSTZXeS5qiprxglBFTlF355l4GKt1R9K
         KaHHsajwN2tEZxLskEn+bI6tFds/yq4HCtY1mKtotfT3E3pWdORc31m3bM+MUTlW2o6+
         o43593XpjWuGO4zQNj1b7GWxbSh7a5P89nXP6NLIT+PjI8sg/V5EchxgX+txIjWrac6S
         O9R1Mv1iBkMXHI4PxYV49reebZM1j5uN2kE7YhTyU8uviuQ1JGKaXYiOOyiZLp+AMyyi
         UXnhKQYhVo5Fq1GlbHv3VT6FqiBCG7a18kr3mBtD6xf3AV1zJlYmvs/1oJvajS+kUEgx
         on2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwvOWGpHhSchcIB36pYGAGdlWfczNfi9NcbFaQxWoRkjPvpsrteURJxgyVCw6mdUQ2/RcqHaxW0woYq/VZrfNUTGSehma+H45CXw==
X-Gm-Message-State: AOJu0YwKymdfP4+s3AKUTjaupI71wGsRW/6raxtgWsaK8bkmgXTtHJAj
	ZMhIDHwKNrrSBsaUEHZnyKb8SyKQyistmGOsrodDSg6wkukkBR0D/suVEU4DHT8VWSP4de1kjJH
	KLCM6vdPg0dwoO+v9uqO31NNSwyW2zvcvW9kT5w==
X-Google-Smtp-Source: AGHT+IE+z0zK6uASgcjSs7VlTlOFQlYBognlriBxa+PoojSvXe6oM8x+zp3anb917Is6/YXAALwPJdB81pS9MYSJMP0=
X-Received: by 2002:a5d:948e:0:b0:7d9:6351:4ef3 with SMTP id
 ca18e2360f4ac-7e1b51bb73amr1910166539f.5.1715879046543; Thu, 16 May 2024
 10:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
 <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain> <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
 <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com>
 <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com> <85577035-06b0-4059-8092-1b751c2a6b53@sirena.org.uk>
In-Reply-To: <85577035-06b0-4059-8092-1b751c2a6b53@sirena.org.uk>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Thu, 16 May 2024 19:03:54 +0200
Message-ID: <CALNFmy1ZRqHz6_DD_2qamm-iLQ51AOFQH=ahCWRN7SAk3pfZ_A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	naresh.solanki@9elements.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,
I tried to convert the cy8c95x0 driver to use the regmap ranges, but
had a few problems:
- I removed the regmap lock since the driver has it's own mutex to
protect all regmap accesses.
  That disabled the regmap debugfs, which wasn't obvious to me and
took some time to figure out.
- I verified that the regmap range works as expected, but the debugfs
showed that the regcache has invalid defaults.
  The defaults are read from HW using by setting "num_reg_defaults_raw".
  From what I understand regmap_raw_read() called by
regcache_hw_init() ignores the ranges
  and doesn't use the page selector at all. Since it's not using
paging the contents will be invalid.
  I had to apply the workaround in the config ".use_single_read =
true" to fix the cache init, but
  that might reduce performance when initializing the cache.

Is this a bug or a known limitation of the regcache?
It looks like none of the other drivers use num_reg_defaults_raw +
ranges at the same time.

Regards,
Patrick

