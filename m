Return-Path: <linux-gpio+bounces-26652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76CDBA8408
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 09:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A80713AF6BF
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 07:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373212BEC26;
	Mon, 29 Sep 2025 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9pmKqGr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585D6625
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 07:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759131303; cv=none; b=Zb7G4r0P75kc1wLpKssO6+Nbfm+kBpv/OUMDqu4H4eNFwrMWovHY76OGsyVbIGssCoCT2Jkuq4OGMoG7UI6gQMsexBpp1Z1p05PH8XByziOSeFAX3UfrBXkL0BFUaFz2s9xOKLXPrlVCULiPFhLGlQIj4YxW1HLFeoK5Yo74s7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759131303; c=relaxed/simple;
	bh=XHQfHugmBrBT3DzNqiBJI9ufvNqHOLgZJ/jrx5/sGa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvG2KQMTb/YXGzSf6MjqDZWMB4E9gehmFiP4Zm0wmu/uSe+zXQ0tCVImf87fRrjJR9Q5/xgwDp1OUVaX6Vt28zttUktQPnM0jyDD17L0b8wXm+ubD/zIQr5HK83tTqtXtwoYV5zYx7aFR5wLSKP+wdpRjSA3uZUILDIsFm12WUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9pmKqGr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-28832ad6f64so9639595ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 00:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759131300; x=1759736100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dilnj3cv6tlZGCJJhoCqlrGY21K3mmkKa6BFM6EqE68=;
        b=p9pmKqGrKq92I73haNqtx7XvgKS/DdKutzdJIs/a3mZnfXouaCKaHF6NbGQ30M3TYP
         q/VNpuMOUuwlctMnXLPWZTKXgSanftx9wmJPTmnfXSKxgbL9ZBVtC7rKmNSNoaeC8TJf
         YiZZUfPim2gQzTv1ge+At3JmTkj66NRPXUASyEzSiUTDcO72jjVS0Ts0KAiQlX2fNH1r
         yip1OI47MohItb1waALUO8Oyg9U2hnot5q5gloijratKTowxKv86ZGV1IvCUKGYjqSJS
         XXtonsHOXcQk9oe2baOzWCm9ltDH77LnwM0YJTW+58QjCgYAcU5YLEqYDdIFZfGhZhvi
         j5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759131300; x=1759736100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dilnj3cv6tlZGCJJhoCqlrGY21K3mmkKa6BFM6EqE68=;
        b=pxi2NEKQLp8aHhuVVlBHml/+Nfi05Ud2Vl+8FWhmW+YryDKb1bHg7hmLPeA9DxlPOl
         zGZTSXBe0zFXGFj58aAvb5hB354T4Y7dEPAjV/1JxhmrxlUDt+LMZ/i9FvZkrS7ARjRD
         sAiQitcCzXqFtqItNdh4XWwO0ruBedRH8PbTw/9+RrqjaKY7HEXWH/R7WbxyB+JDopr3
         ghjvF6mXKJEFpSaPg2qtp3zbTDoJZhV6db/ee2EFyX4eAy+VWOW2DFc3UKqLK3h+xI5K
         JZJBJ8rr0pVvOmYzzYSPTm9weTyTCb9tYY73Y22ssnIEdI4yEq0xkqTFjHKsX9deLiez
         y2bw==
X-Forwarded-Encrypted: i=1; AJvYcCUbUcQ20Oun5Q/SlkitpgQuWkqpbplH+mEzS1PtCbt3BjL0kKY7saPRznTZiSVMrspzw6wIXIFrks9s@vger.kernel.org
X-Gm-Message-State: AOJu0YyovduKYcybukeziGHN/K1JTJm+DChmLlnWq9jV9pIwKTTpESyh
	pXkzpqCwWAi1/1CQwL/6BCzxCXiANgI+6fc07vuT2bh91TOPbtjxP5+5ft0oinade6I=
X-Gm-Gg: ASbGncu7hrlX7EoNlSozbNIgyXEgfL+5IJka6PLHY+TG7lwf2pmexaNSSv8J4cDEAI/
	8mn4p2RoRBzNMP9Xfsvd/jOYsNPftHl0lvScgOY54O8IvHOJ5vJg0cikCjAZKpxiPIZwfOrDQMj
	f8MlAGU4+Pg3jDeU6sMSPOgkQy7APQUV+7aA62TE1Iegl1kE89YPIuEoDmaELELWLmIIE1kk1a0
	ED74XC24APodyj7VWJ9v5n1XJ81hmfhPQE44GLUoS1YIz5NiUio6DHdje8Mvd9HughV65BzRRU+
	yBYAFQL/oAj1GkqIsNzdnBzwijsHiCf53abPRbd/fO0B20UkyFHbhhkMSTExvh+Nk43w8zRI2H3
	eppg3pUzTCqSrZrX2doCtb2Tl
X-Google-Smtp-Source: AGHT+IEFSZrWgex8ZbGM+3yhcR5Vy1enGrMb5FTEjCGMbNyV4dwZ+Qdmr40Q1s8X4SiZpEYgjXETDw==
X-Received: by 2002:a17:903:191:b0:27e:d9a0:ba08 with SMTP id d9443c01a7336-27ed9a0bb87mr158046935ad.43.1759131300406;
        Mon, 29 Sep 2025 00:35:00 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d37bdsm122286645ad.21.2025.09.29.00.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 00:34:59 -0700 (PDT)
Date: Mon, 29 Sep 2025 13:04:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Wierich <erik@riscstar.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod 0/3] bindings: rust: pre-release tweaks
Message-ID: <20250929073457.h2vhwb7gzjqyl3ys@vireshk-i7>
References: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>

On 26-09-25, 16:35, Bartosz Golaszewski wrote:
> Here are some final tweaks before I do the 1.0.0 release of libgpiod
> rust crates. The first patch completes what I though I already did last
> time when updating the examples but I must have borked. The second patch
> just runs `rustfmt --edition 2024` on all source files. Finally the last
> patch adds some examples to the readme so that the landing page on
> crates.io already shows how to use the code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (3):
>       bindings: rust: complete the unification of exports in examples
>       bindings: rust: update formatting to --edition 2024
>       bindings: rust: add examples to the README.md in the libgpiod crate

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

