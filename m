Return-Path: <linux-gpio+bounces-17854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE0CA6BAF6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 13:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908283BE6CD
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC8122B5B1;
	Fri, 21 Mar 2025 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="coaOL9u/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00037229B35
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560892; cv=none; b=uqHzZguXndYSBhDv+t263xMKU+SCQq4oxRguGeo3ZZMfEVZDAPgQA+UBwufO375EG4ErZib/mEYRGzxvUzlulBDFCnwhbRybTnopItmXiuPs2CYN30Q1dzOGQsHO4QDG0lXhTO5G6E3TSCWtDUP8GgcWHBHg0KFeIHuYJAZEe0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560892; c=relaxed/simple;
	bh=kYV2tU5W6W7PRa7BY6P3Gb2pA6tdcRdBC8mO2lgEAHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brTQRYqevH8G4H4xiUJm/E4l74VK6P/LherGi90LpfWilb3qwqmj+MH6oll8v3pE9CPFjwZD8JCYSTsHeV+c1pbGhgrfqr0nDURnVU6ITvgrSOyBlsY8sa2rJ9/U6Y3ICubwxfzlsYv3O/TEYk8qUvHg78gd+prB4atK4fmhF4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=coaOL9u/; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 385553F6CB
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742560888;
	bh=w5dmGg1Zenb5iMErOVl6vrTRYdAblyeideLHWERDpFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=coaOL9u/71t2eFlhch0JwJyJ1GmT0wRmBxLGLHLgWGmuMt03vGVtefgeq6NcpVAMZ
	 EIC6piqSb12Uta4JbrxJcPRqVHgkW6J95j4fBee1pyNCi6ktDGh5DKj602lD/VBC5d
	 i02Puap4kjruAjWQD97LTnYwe0YvmRHs/ryOiWEoFUR9II6TwdQMMhbrqZ+i6tS1oD
	 pEm2bSVhs/0OFjFhoZlrm9ubWVMCvT24T+1Ct5oRKJi/b7faJ366AI26P90o8Y++oL
	 +QdXHmdPZSf5wAzKHdVzCeoSXvC6A0vcmoHfY9RLq/obRByEFpHsQKZ+gXHcqrrjai
	 K2if0ChJaQTGg==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225ab228a37so27830775ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 05:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560887; x=1743165687;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5dmGg1Zenb5iMErOVl6vrTRYdAblyeideLHWERDpFM=;
        b=OQ3NPwZNg7+Mj1dAJJUPgHhm4vjlJ0ARexcCy05JvhpNpr3EihGxcNWfjAdg13UkGQ
         JRgRhKtxuz+bOARFNOpQXy3ygQ42vzvmhEEJUXk6cWDmYqKnsyqRohaLRuy4ncR2h6iW
         9x3K3O8nmeI5HfEHpdjZRFE7dvPQ2/KXtBbjhnav9bKe3e2VCihfy+wsD3IeFKmhG30x
         B1kwdn2hq5D8hni/2bBfy3kR590YnWWZ/zIhcAjLMnt84g6yNysolNu6ew5BsEJloQ2l
         6YBZ6IJ15RUasV5tQvgznudoYx/cr+eAdHkHNXv2s4iU9L93zXmaeYE/d3F2dBzJC8iH
         OQdw==
X-Gm-Message-State: AOJu0Yx4TrcoU3nuMzwy6gx/n6NuY0wGjmwu8ghwaFT0E8mfakAiOwoZ
	ExlBPU2MWcpLY5AS2Pxmg71YhV7ZzknF4r/8P3gVjPL5QbBdDZtc5wSMUZqUn6H4coom6+iNcOi
	bmtWLjxSgR7ujCt7ZUO1BxSla7kIjpubaKmdJ5KrDWjYcQFCNIlZeWmIAP1/f8WJG45lYClPaO/
	4=
X-Gm-Gg: ASbGncuaVMMILcWeScBIZqb85Aw7IcDHfWCerRcEnGVOvNKb2JLXo/A8m2Kzw4G6DPs
	D7qyB0zymYPUh9bHosVp/oB6xzZx3b1C2dMyAMn4y0fiGh/1uGvwnW8l9LpvCAPThYvIolAbmxZ
	uB0NGB28z++MH4TXUjjvthDXTSdhjdJPPyaE71YhUp/kvotYbeohcz4EtKbhY4JYwZHI6J5Iw92
	DAa23CPORrqoT+hGt+SMrd9XCkeQ7i7NBhe3RW2KpmM4GoqGnKP31v0dmDwwrBlhTNAvucj3Qhn
	ejrDVv/2wkpEWh/YJQ==
X-Received: by 2002:a17:902:ccc3:b0:223:3396:15e8 with SMTP id d9443c01a7336-22780d9b9d4mr56470735ad.22.1742560886566;
        Fri, 21 Mar 2025 05:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGptLOm8T0h+3/usNzsqJQv/3kloJ7tcIjHNHv1LCT314QI7cJQSD9ZqqoAAnmCXXt+Kbwy3w==
X-Received: by 2002:a17:902:ccc3:b0:223:3396:15e8 with SMTP id d9443c01a7336-22780d9b9d4mr56470305ad.22.1742560886100;
        Fri, 21 Mar 2025 05:41:26 -0700 (PDT)
Received: from localhost ([240f:74:7be:1:2dba:1af7:27b6:24fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3b520sm15391125ad.6.2025.03.21.05.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:41:25 -0700 (PDT)
Date: Fri, 21 Mar 2025 21:41:24 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/9] gpio: aggregator: add aggr_alloc()/aggr_free()
Message-ID: <t4lng24vhim7pid6c5gafdk3mawnvcit36hqsa64qoe2gozdz3@jcjsh5b7c3bx>
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
 <20250315164123.1855142-4-koichiro.den@canonical.com>
 <CAMRc=Md8nB1U--qcZxpcKVzxTcON2hi-pmsUKFn+aBEqHuBzcQ@mail.gmail.com>
 <llbybv6dpkfrtir75dveqnphrj6nuephvkoyywy6tx6vfbunl2@ft5io3thby6v>
 <CAMRc=Mcng+jW2WrAREOf-GC1mCbGEyAiMP_Ms9B3BzXnCoFGFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcng+jW2WrAREOf-GC1mCbGEyAiMP_Ms9B3BzXnCoFGFQ@mail.gmail.com>

On Fri, Mar 21, 2025 at 10:32:33AM GMT, Bartosz Golaszewski wrote:
> On Fri, Mar 21, 2025 at 3:37 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > On Thu, Mar 20, 2025 at 04:51:04PM GMT, Bartosz Golaszewski wrote:
> > > On Sat, Mar 15, 2025 at 5:41 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> > > >
> > > > Prepare for the upcoming configfs interface. These functions will be
> > > > used by both the existing sysfs interface and the new configfs
> > > > interface, reducing code duplication.
> > > >
> > > > No functional change.
> > > >
> > > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > > > ---
> > > >
> > > > +static int aggr_alloc(struct gpio_aggregator **aggr, size_t arg_size)
> > > > +{
> > > > +       struct gpio_aggregator *new __free(kfree) = NULL;
> > > > +       int ret;
> > > > +
> > > > +       new = kzalloc(sizeof(*new) + arg_size, GFP_KERNEL);
> > >
> > > Please prefer declaring the auto variable and initializing it at the
> > > same time. Should be:
> > >
> > > struct gpio_aggregator *new __free(kfree) = kzalloc(...);
> >
> > Thanks for the review. Should I send v7 for this change?
> >
> 
> You should send one anyway once v6.15-rc1 is tagged.

Alright. Please let me confirm:
- After gpio-updates-for-v6.15-rc1, will something like
  gpio-updates-for-v6.15-rc2 follow?
- If yes, after v6.15-rc1 is tagged, I'll _quickly_ send v7 rebased onto
  gpio-updates-for-v6.15-rc1, right?

Thanks,

Koichiro

> 
> Bartosz

