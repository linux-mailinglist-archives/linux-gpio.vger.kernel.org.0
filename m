Return-Path: <linux-gpio+bounces-24773-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C109B308F6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 00:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0922A1892545
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 22:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C939921765B;
	Thu, 21 Aug 2025 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDfeqgEm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA167262F
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 22:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755814613; cv=none; b=XaZXCkFY4uHwQptfmhgB79iSFabkwFcbaGseUnUj7aIVCWBKTitzW2tYbZm7LUmk5zdECyGyPz9/jOf+J/2RuCIZ91P1WxrR29XKGUqel5S1oIUcuKUx2I25AmoK2ar7G32guGjXZYpG/1k6e0SHUMYvrH2fAsdGrcbk0UPwe8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755814613; c=relaxed/simple;
	bh=0Pg73h0x1AGN65OnAOvowr4gei+dYAhDyUntUXvRNKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKlnv2S3SWi9FZbKzypwwoZ/DVCVuxiL/NLrJMQTfKeiCbyO2WsF4NPG9D8ALBu13tQJ7v02ukCKRaqjLk2I+RvwcYdCllniEuwenFEk793Ak2ZvwMhhU8R2hX7gefWxJ0pPfsD6Jjgj/WXOn2aITjXFSGXMXAMUqmoZ0pv0La8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDfeqgEm; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-335360f9b6aso21474791fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 15:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755814610; x=1756419410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pg73h0x1AGN65OnAOvowr4gei+dYAhDyUntUXvRNKA=;
        b=oDfeqgEm3pwoPP5hsIbkzLLiC+3qhmI4mEJmsfHD8CtuO0aCKuVf7uAGrWqrumyW0t
         wBteR/qVlJD5GV4w/pStCS7fwdDIUW+BAlLO1yVb+ijI5/KHGoXmjmgAp/oBkb353DZ1
         gpANgaNEipneHjdV1nUH2yu5m/gLg2jr4sJqLRrzuEgwhbFJ/ks68E4w1OfwdUxUJ4ZN
         uZ+eGA9Ba64HeNs7NGeWRbD5I7i/lcAyDnEwyC63oH3JQWwP2zuTGqOncmvfRqTk8b6k
         Jnbfhv0PlWV1bB9iHtulQ5A6OABZxHdZcsDBM7jnfL5NdiokvZCkbP6puwLhpiL9YZjj
         0RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755814610; x=1756419410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Pg73h0x1AGN65OnAOvowr4gei+dYAhDyUntUXvRNKA=;
        b=GxUV/6A6l+n61wu3bw3Fj4vptANoU2Xp7MYlC5NZELfNcusd93ioPEwCALogYwI5AJ
         ZYjqxsRZw9+VJbICuJ5OEH1Le/gx5qvNYXKvzYvlf0DS7EpRqni80Ax31qSEGv08LeIz
         OQCGg6DjCDlF2Vx3GBYOGfWwS/CoVLILMh4s9f5mjd+edECaGJuG6P13X0mIinDcudaW
         t/5sIh8AafzhnJJ553gGsq8IAxADpzh+3ekDGL4ki+pn6TMBb4dj6a1ziUetUiVffh7v
         GnQlJBfOL6/+RAIu6Pf1TpYc7e/p2zifeKf7gl9onSii+neU14iXGZZJ+PsDWR0hD3y8
         8MWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJfLOPtKVCduqdcoYnPfSCt4aOkYavNCMtJf5vSqwZGyBygDy9WheqvUrufwwp9QS30+wJRLfggTal@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2FoPfy4WeWIMMT3kOF1ncTOuKUSe+dbnC7FNRQZkoHXLhpCl
	Y3hMs99jhoHFb60XpbVOGms0Nt0D2cUMYOyvotRKmoA24jJ83U0jXJZ4EVALQd00+pde800g5/R
	7WbucgWo3I8yQXKsxzGTfKY32EK1uTXPUqn9x52orAg==
X-Gm-Gg: ASbGncusjcPHJVkErDJH4vKcZbjP/tVacDeqsEM8EEaYxUQIiH7rAQTZ/z87lNgtZv1
	t+1mNGdVNeWxjzF/EW6e2BWhNdvfkm0myEQe0VkJrotWKLFr543WVletzl5CZYfxXepD6fgS9wW
	zU25MTaELoAr2k4Tzmz/xAR97W0FhYH4UFWa0HFcYMzwUqVbh8D/rCnxZ2W4jYo0r4nuuBRfaj/
	QfmG8c=
X-Google-Smtp-Source: AGHT+IFG6+PfHwHXuWSshzdDPP8aEi91CBlybWtEndelrWebplmclqcJPz8QL0fI3uhbeQ8HOiLv3M5ADp5CJgyPsQ0=
X-Received: by 2002:a2e:a54b:0:b0:32b:9792:1029 with SMTP id
 38308e7fff4ca-33650dda6bfmr2160941fa.14.1755814609772; Thu, 21 Aug 2025
 15:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821144942.2463014-1-superm1@kernel.org>
In-Reply-To: <20250821144942.2463014-1-superm1@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 00:16:38 +0200
X-Gm-Features: Ac12FXzbbx5tONWqzpZX6nVWYUcvPgIYyTSNvG4hYX9g6GO6zBj_kt2cY8fOz6M
Message-ID: <CACRpkdbzsgbTMiZfBHgQBsdkfH=Qhr798XLReGB7WhXLsuFrDw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Don't access irq_data's hwirq member directly
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Basavaraj.Natikar@amd.com, 
	Shyam-sundar.S-k@amd.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 4:49=E2=80=AFPM Mario Limonciello (AMD)
<superm1@kernel.org> wrote:

> There is an irqd_to_hwirq() intended to get the hwirq number. Switch
> all use to it.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

Hm where is this supposed to be applied...
My tree?

It doesn't currently apply to devel.

Yours,
Linus Walleij

