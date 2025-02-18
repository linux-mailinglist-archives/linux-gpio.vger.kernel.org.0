Return-Path: <linux-gpio+bounces-16178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF8A3962A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 09:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C4953B6DBD
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 08:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B8722B8D7;
	Tue, 18 Feb 2025 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cKOP8y2d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD231917FB
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739868443; cv=none; b=fXu86vH2N+OmoL9G691mXm/D6QUgsf9yv/sz1D2PWQYZ0AQ/hEtI9s9Am+Zrqhg2fXgH65RukeyzvvMN6EW7cUAu1oZB9+sgZ+XG7h6KJneCLg9LWgI5/NH7m9pm867W/M0Jlv3ONm7+QDRIdeompsHrMWp7He+ArpSKKtAXstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739868443; c=relaxed/simple;
	bh=Ol6Iq9UCjeAQQT7E2W7DOZWLnUvYdgICD+RFi7UcYug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sBT5nGN9HbHCIM0Uy33cyspqBH4b0IPYUhqutlF9TS+03lYic8XUdGqVYe3IQc28+KkCh5A4ma7nwyAPMxVwQEE7mvFKpMKgqH0NKUQI4v67rA8EBtM1wAVUTQTsyd/3S6bRdfCRulhyHCTZOEW3QDi5KADyLFcrAWK4mHn0Um8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cKOP8y2d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739868439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f0PPk91R2OjqODZtBQUNypPkAhjqPhzDO0Zl4X5trlM=;
	b=cKOP8y2dzy65mLAj8XHZ5XaWy8EkFpfu3oeKcUQzYeLzJCOF/kM23Lno81rJ4yJ5FHvAY2
	JXtMGa4y57a1cWz10CRdPfg13Jy1DHH2dOMDB9w2deeRTc9q4+UuvIWZdooYoKv3RJmQ3/
	Syee5ZyI8paFQQ8n68Vw8nIDEVgkzf8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-k1WWu1mrPESTVWdweKNO0A-1; Tue, 18 Feb 2025 03:47:18 -0500
X-MC-Unique: k1WWu1mrPESTVWdweKNO0A-1
X-Mimecast-MFC-AGG-ID: k1WWu1mrPESTVWdweKNO0A_1739868437
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f36f03312so1252459f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 00:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868437; x=1740473237;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0PPk91R2OjqODZtBQUNypPkAhjqPhzDO0Zl4X5trlM=;
        b=oCDM60dOe27yn5w+7+bzRRLHElABE/uiTiMO1CVOLVWNDm8eZOLHnckjXwW7PVl1Et
         ORcJNsQZOVaabEbp9Q8WKqn5yLCyfjVz7tHe1EvcuVIKWw/craFYmzAycoUNjspTk/np
         kTmnPEgqgVT28HMcMz9SEo1BH3Im49MS7uzem9AcldY8Po5RUT4j72x4+tq7pAkjVbig
         lGQGgyq8jYCvYR6tKD8JXvSyfmfnIRjEoHjUqOwogJETS7GEvKU0NmEVfVnx6RqPyRtC
         tDox1qMrIBD8WeElKKpKjWrNMA16/B0uoVJr3/P77hlv1CgdDuJxw4i3TGPMvOVQXAI6
         YleQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJxEAyHwoy+kk8n6328KrBODmblDgnRzg4+Jwenz2104o0HNRVO0zPL+K9N+FB9kLLuoCOS7I84W+f@vger.kernel.org
X-Gm-Message-State: AOJu0YzuNfl1k8WR2JOGTTANeQ5MHlTolO/YANPuo7/WgWLxsaD5hULH
	NkKRJv131pmrRJBJKgk7lBnSDZakjqIu1wdRi6YP2Hg+Vmu+ytYNQu1vNUsSquXXtNS/5PhqD14
	s3mAHMwfz4yI35NUqCTe6ktRj4oInMO5LzoKI9/Kyvi+hC/XP/kXkRVHLe8c=
X-Gm-Gg: ASbGnct6nuNR4xawa2JL97jsadmg5jxf7YXfOdSxRiJOwjGH22e9HpzTUnWJiPIgRuV
	e9FPJvL7ZUm3kpyEOYhyTVABFqPZ3fUPi4bFRo0MtzEWbUpG1xWiAVNnq1CZfOnf3nr7MjOfslU
	EELLZIxT7BfD+RgntQAXdVcywZ0MgC2nC1ymPc6C/+cdTTg6uZf9eWsmRZpny/wmpNjRohDnZ2W
	+Dm4QGH/jPl2Cj0ObdssZ6Me8y9lcY1IwKO+nRxrtJmAWkGFTI0biUGhnJQSgUhxGeLS06lSy+s
	Jx91GYZfmSEjFnXLSuLldH0DWEZFPd6V+3F/0q7BqW0LhM+wjVKEzGjR/5eYAqc=
X-Received: by 2002:a5d:6ac1:0:b0:38f:229a:b48 with SMTP id ffacd0b85a97d-38f33f34e0fmr10212224f8f.32.1739868437043;
        Tue, 18 Feb 2025 00:47:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSbylPudXx7pB2i6xYLZO/0No55k7fxSLecS40C+YqWkkI3E7XGgL5gcPSu1DOJPV7vKQsoQ==
X-Received: by 2002:a5d:6ac1:0:b0:38f:229a:b48 with SMTP id ffacd0b85a97d-38f33f34e0fmr10212191f8f.32.1739868436746;
        Tue, 18 Feb 2025 00:47:16 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398a8007easm36991295e9.21.2025.02.18.00.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:47:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, Alex
 Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
In-Reply-To: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
Date: Tue, 18 Feb 2025 09:47:14 +0100
Message-ID: <874j0rr65p.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yixun Lan <dlan@gentoo.org> writes:

> Pinctrl is an essential driver for SpacemiT's SoC,
> The uart driver requires it, same as sd card driver,
> so let's enable it by default for this SoC.
>
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


