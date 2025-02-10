Return-Path: <linux-gpio+bounces-15612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852FA2E349
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 05:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A17657A16C2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 04:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3CF1586C8;
	Mon, 10 Feb 2025 04:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2mG0/d6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A40D2F2E
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 04:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163418; cv=none; b=WPdx3tPPpcwExGrAdUCTMFgq8lA9gK9cIIr5/JKd/zX30HENj2AFZ28p1pWRzmInjN+RO8aJgWDIks6fKbXiKxhKW4RhihgB4Icmtj89dd/NP5Tva5FGNO3DiRXDuQcbT7roQF1EH8lxG8VAI4TxEsqU4CwuJzZk8qcT6Fg5K2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163418; c=relaxed/simple;
	bh=YAHkr0METhTi1KTLZaI/9EuUxKR5coa/VgzRRe2H2pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElcZoeXxJYtTbHshX/mxQVNeHSlW2g5qdLPg63QkdWysmmpmaIXJWRVp3B7kTbd7STQfzpXYKFxryRtMl210CSgJ7yIDZH9FY5n4NtfWzSiyprHY6TmLv2wntoWRRrmhlz5fgQRFXvqr/UEemfZZT9rw6JZf0dMOTttW5czjc38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2mG0/d6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f5660c2fdso43706045ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Feb 2025 20:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739163416; x=1739768216; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wBZBkXBErlJMDONsaNIRaxXflZoSWgdPOLJTp5zZ1Q0=;
        b=W2mG0/d6bfaVqBJV59fDso86cTHZuHr+lJY7WCBMZLLPVJx28AL0+pumhuSMj0gx3a
         WXrlnVoWDfwMJyJTEjzpA6tBldZpuQdlVnOe3unoi5g+6iRPmlAZ4LcxrxIWXVIXO7ux
         zymig1w6hPWQl/0K+DrRISML+F1caQabjHkpayLXAyX4y1CGnv3irinial5SeXGTuCbY
         4z2FSbMT7llnLAsx1Z+8F5Vm+sFWP78gfHbttohKwubj6GUQDw+DoGfl411KsYz8Vc54
         zUegq4jKvXVra7VoBTzL9G8nbqj7i7SP8nN+ujUOSepdiJ1wC3fCvmzbbSO9mxHF9pRD
         nGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739163416; x=1739768216;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBZBkXBErlJMDONsaNIRaxXflZoSWgdPOLJTp5zZ1Q0=;
        b=a4iPxGh9UG5TrSU8mxnL2d2ccFmyjjnSaGReoYCrquxRts9a/u9gtNYUW35pbzOTE0
         4/0d2TQ7oXVyT1lNYZ4YSn+GAmlLKLYyio8AbA3cVQgxa0eE7BPPtq+P4IhFesT4EG3I
         wk4YxiIHaZzZ9kH/k6Y7g/rYBWK0C+ViV7SIB0XU3vUWkFlnzR+Se3mg4brB78NjMgSc
         kftdF9OZQmEDAnbrjrTHb0LK3X5Thj29gzmc7fU6La2Bn2fx1LPTyWrswRCS1vky521p
         PQRhQOgw98mAzABnH1+/5xfzpUI1i0Jt/l930sXX/1g7H9cuZ1HRwvybgyWeIUGUtNv6
         U0qg==
X-Forwarded-Encrypted: i=1; AJvYcCVikQkdNKeW0m43cGuDlU1LEwqOmpKkTCpc55lHw/1tgnRWBjov2L1KAfLbdM8lZ9AYV4QwFCfYxDhW@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfFU9K6aisr/KoXsxwYSvHZ8Ixz7ZGBmIU01Lbilt5xWnW4cJ
	XYwVOxu+TMkLu8gRD/+3Col4ZKtsXOvzutAioPqElM3EIudh+ULcc08Jx6zQN1A=
X-Gm-Gg: ASbGncthWMuLN8KcId9Kk6Vmp6y5p3wcCGkIr/xq3R7oxjbD0lFLi9VFHCHDYJedRra
	uN++WQ4s1h5Z6Mo0oTfrn6b4FCf8yt9EALQO1F8mYs/0BPKSBQYvORYg3QICc7NiQU5zTjZ+d90
	YVcre4znGsio+EcORLV9STCEseWjb8qqEQI/Rdv6k+F9iFqmA6bJxwos3jPGsUO1DwW5mv+NXzL
	RmIAqIZ11NDawb8NV0W2r7AY9Pqsf3lrAdTvEXDnk5XOHGNNYcAeVe2c1l47Yx/D1fz4S7wPU5l
	2u1M+q2SWBo8NSyXcQ==
X-Google-Smtp-Source: AGHT+IHylgse8VRUp8uwAnVdFN1Fm4nsm42hMF25H4bQ839GlTcZj0Y1uxCc3mugNys8LftmyO8qsw==
X-Received: by 2002:a05:6a00:21cf:b0:71e:108e:9c16 with SMTP id d2e1a72fcca58-7305d4944admr19147693b3a.12.1739163416455;
        Sun, 09 Feb 2025 20:56:56 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73089afd0cdsm1556606b3a.134.2025.02.09.20.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:56:55 -0800 (PST)
Date: Mon, 10 Feb 2025 10:26:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Leng Cold <a909204013@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: info@metux.net, vireshk@kernel.org, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: Re: [PATCH] drivers:gpio: support multiple virtio-gpio controller
 instances
Message-ID: <20250210045653.p5d6svdl4d32sttf@vireshk-i7>
References: <20250103083520.1764441-1-a909204013@gmail.com>
 <20250106043508.x3pwt3jzh37t265f@vireshk-i7>
 <20250107060044.hteiw6dgycz5rr7x@vireshk-i7>
 <CAHqiF6Aoe4eUShxpPfKczPF-bVneiyM0gpZ7xWF3artzoC__7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHqiF6Aoe4eUShxpPfKczPF-bVneiyM0gpZ7xWF3artzoC__7Q@mail.gmail.com>

+GPIO maintainers.

On 08-02-25, 15:54, Leng Cold wrote:
> ping
> 
> Viresh Kumar <viresh.kumar@linaro.org> 于2025年1月7日周二 14:00写道：
> 
> > On 06-01-25, 10:05, Viresh Kumar wrote:
> > > On 03-01-25, 16:35, hlleng wrote:
> > > > Modify the virtio-gpio driver to support multiple virtual GPIO
> > controller
> > > > instances. The previous static global irq_chip structure caused
> > conflicts
> > > > between multiple virtio-gpio device instances as they shared the same
> > > > interrupt controller configuration.
> > >
> > > What is the conflict you are getting since all it has is callbacks only,
> > I
> > > wonder why do we need to duplicate it.
> >
> > Ahh, so irq chip should be shared actually..
> >
> > static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
> > {
> >         ...
> >
> >         /* Check if the irqchip already has this hook... */
> >         if (irqchip->irq_enable == gpiochip_irq_enable ||
> >                 irqchip->irq_mask == gpiochip_irq_mask) {
> >                 /*
> >                  * ...and if so, give a gentle warning that this is bad
> >                  * practice.
> >                  */
> >                 chip_info(gc,
> >                           "detected irqchip that is shared with multiple
> > gpiochips: please fix the driver.\n");
> >                 return;
> >         }
> >
> >         ...
> > }
> >
> > For your patch:
> >
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

