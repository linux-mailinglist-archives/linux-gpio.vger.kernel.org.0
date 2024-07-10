Return-Path: <linux-gpio+bounces-8171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D37892D2EE
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 15:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1890B28168C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 13:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0985A1922F2;
	Wed, 10 Jul 2024 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN3d6/oK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A233190472
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720618499; cv=none; b=QcI5nRIsIW9E2W0w3fNjrkmVqkZ6wqFYMXAGJiwRnk9RGXDsuvPxAgrCwtGeZhvB1WDXF/VBh9Eljli4zpAp+gxN92hQ/zH2kGfwiZTz9ICA/1OjEWCR5RaoscfpR80QjbxeEAiateUyJ6OJ7RNqdCZzI8TSlq03//IWUcwbjBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720618499; c=relaxed/simple;
	bh=rRvfOqJ0Oqeygqvq/p+FtwRLEdmb3GsY3/cayeVkIkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLVj95wCK50Rjfabi0NVCe6YTMmje1QI/Od8+6F2RvbRfVj0UBjNSA8I9KehoRBQeC3lUJT0ERp5p7AyysS5HQjDi3JHvaMu2dmO9ifbk4fjSlAbKrhzTO/lP3rUUPbxkTtcwa1sQJdYb1KNr/gVmVLAC3tPZqHlNiy/WygMqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN3d6/oK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fb3cf78fcaso39915585ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 06:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720618498; x=1721223298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WQC+beY8HZi6OE9e7SHHtr/di1UIBTjaYEtizPO/YBk=;
        b=dN3d6/oKbxPFTR9KpOs6oJN1Iowo9/FxnHPppT/j1fNdNf4Ign71G6tvStacQ7j6x+
         YoABbj5FQ5wLtWc7yK4c6d941BqP06zgxIHSzmDlf2nQt8vjLJk+87o+3wgmCGMbIPbe
         Ft8k42fi4MB8xFPSNFjLlF6hNAz+KmFaDLMF671Z9Fxu5i/y+5hQhAaZ8DYkaWDXorSB
         nRDCpEkQx8fWHBp8odCG1gXhJQkg59+fcoBrwC24g9dznt4AjGa/KfgOKKv1POcgBFvW
         brN0Hf0HiA2F+OuV/+jWnkYB3CXKB/DliAXCIGM/xP2k7C/V+kZv6LGJvIRq8Lde8od7
         wsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720618498; x=1721223298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQC+beY8HZi6OE9e7SHHtr/di1UIBTjaYEtizPO/YBk=;
        b=RMbr/Tp2XTWgK9IploWieLKjjxZFE21gvIfzy2zC/vNyCArE4dCvD4wSJYDLvbL6bT
         8SmYTSG5BDqtg+rxH9zdVZj+cYWWzb9XdxVT8a/z8p8341WuO9abT042uMUOIMVJISRM
         SrBEaspJalfTcG1CR4qeIcYJW1hUhpt6HLns/bO6cy8CPUfxxlCdDhIgM9QD9D4mqMR2
         NGoDnRiq5+FNAghaLmbBRM1wOCYMqMxV/iSx3XcvQsqmMMzKLVQvpuPVKJZWvPfPCjji
         FrV2dGiiApdpVrqNvhYdfsskq+aBFZEN6CzsQkU6m4lI6h5jL6V2OAM22Xr2mUQIsVJr
         Icug==
X-Forwarded-Encrypted: i=1; AJvYcCUnoDOrNeQv6JeJEGxNPbAbkUAP1C1Ex7OrKiPbDmp3WSsu7zarefTIhnQBlNXQ5ikMZWGPNwpaTeJo0V3x2vLwhyTWBQHdBSjQmA==
X-Gm-Message-State: AOJu0YzwkGJ5BaqP76gwmZdTv0/XImaZ6Hw1NZSiES2+At9CUWv35NoK
	QW0thT1FQix4lJnyTYKPTtBl9HPCfUdOHIA7xpJdtWhxjGNqYEc8
X-Google-Smtp-Source: AGHT+IF23j44X9tj8sOfRXN8dpWx5uwb0KF9lONuxNsu09IGqcyUdbeqxORSsWMTcgPDhPtLqRGYnA==
X-Received: by 2002:a17:902:e5d2:b0:1f9:fb48:7cf9 with SMTP id d9443c01a7336-1fbb6efaad1mr48815115ad.63.1720618497745;
        Wed, 10 Jul 2024 06:34:57 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab75besm33477265ad.148.2024.07.10.06.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:34:57 -0700 (PDT)
Date: Wed, 10 Jul 2024 21:34:53 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v3 0/2] bindings: python: fix line request by
 name with multiple entries
Message-ID: <20240710133453.GA108376@rigel>
References: <20240710125719.33655-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710125719.33655-1-brgl@bgdev.pl>

On Wed, Jul 10, 2024 at 02:57:17PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We haven't heard from Chuang in two weeks but I want to finalize this
> series so I applied the hints from Kent.
>
> Changes in v3:
> - tweak the commit messages
> - change the test class name
> - improve the test case by testing one more line name
>
> Chuang Zhu (2):
>   bindings: python: fix line request by name with multiple entries
>   bindings: python: tests: add a new test case
>

I prefer adding the test case first, to demonstrate the problem before
fixing it, but it isn't a deal breaker.
Other than that, looks good to me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

for the series.

