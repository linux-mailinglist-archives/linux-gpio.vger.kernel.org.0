Return-Path: <linux-gpio+bounces-18470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA723A7F8A5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 10:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04B3C1692A7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 08:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFC026738D;
	Tue,  8 Apr 2025 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SS7FYlO8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1AD267394
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102234; cv=none; b=Z/tdafsQMuR2bs6RHYfqPZfA9gOrN0418zx5JwwTx0fEK8beu+p2ytePrGF6sXMJFu3AjHgUFSkSOCeFjQcCDHX8g22hAoRGGV/2D0SBEp/nhA3h83bgL6qBzFjLrgVG8dHSO22Ufbcw4ZICc1nmBZBO4WCtihv+mflwwGd3chs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102234; c=relaxed/simple;
	bh=kxoU5HcQ+O7M8SUK0YQ8e6eKmlicd6hex/t7nCbWbt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDsqXDSEvm9turk5KngSMtnqwlduWm+IgiXvS+ApuN33k3wv2LBCped/lDwk7xqCvfdZ1KoWMGNhcNWAo2sGJ2QEONdl4Vaf/u3gwig4BGHBMgYwmdRkbREOJZS2czLq9BjGgUIBpkfdUWBoIvI8ftwmQhNlbjF3cOS1CSg2lUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SS7FYlO8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744102231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQopZXdiy3xymCGR0rYIHwGprz+N88tu6wezwOaN3Nk=;
	b=SS7FYlO8pg+22bdEuswI8XlaJG8myCxjuwirrnPYI0QYhf7mPUIb0GvOpj+Z+XYm/Zn2yT
	ltELruU+Gm1nT4D5k1MJAWGOnWD9FHiOUyg8jCH66x5tLa0MWz/XdZgGuTl2UT5nK7j6AN
	PYLNfa4ikQh4DPBezTZx85gCbhdvF1w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-fdB8nwI5NXOICreZhRr8aw-1; Tue, 08 Apr 2025 04:50:30 -0400
X-MC-Unique: fdB8nwI5NXOICreZhRr8aw-1
X-Mimecast-MFC-AGG-ID: fdB8nwI5NXOICreZhRr8aw_1744102229
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac710ace217so410621066b.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 01:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102229; x=1744707029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQopZXdiy3xymCGR0rYIHwGprz+N88tu6wezwOaN3Nk=;
        b=YeXw6UegawCGiUGl0k6Yr/94cycqIuE7+YbrAdAZnB7KwgUkAVhWuUV4Q08amKLpaB
         L1gsS/cWs8HAtv8iu1HjYF1UeeW+ocVYh3crvFvQDzhk6Hlk+wfWnud3OxDqRYIWDMHp
         wrDzoY7yGfRjudivCIZ9P6Wi6vXL8GlVgGNRqWjmKKyBuKgxncUYJkWHsO42mI/vYIJa
         Cr4wecF7IBlBW81zUVXeJRzld+pS3c+s7P3dfQBnunv/EkRwRveN4D62sNcyLKaatD0v
         lu9SapzwKaicJMZZsM8X0hzmF0xN44JueMcGhuVBgOPEKZ6G90ABF9Blo9c4/kZ8nV8Y
         cAjA==
X-Forwarded-Encrypted: i=1; AJvYcCVHrWIVzlXfJQWmtzIIoOl84RjQe+X9RsAJ7e1SO217flwAMTKy6bcKaDjtnyRczaeocpUXKgWPokaM@vger.kernel.org
X-Gm-Message-State: AOJu0YwuwbqMq+AukSGWiyDLsV9hL/YzjyI+AANz9laKJPFBDXdTk76M
	q/YPX/6zclS2pM14fDjZtpz9upKsdShzVr1jMsmxm+UupCxL2Js/FP/yyX0rGYPRR6o3b7H4jSh
	qX3lzA5k4t0HJfvmS0caDiNeM4uBmT8HddLqzLqD/MA2tjgi7nzRPBGNdAp8=
X-Gm-Gg: ASbGncsgZyQK/2Ha98FIE0ca9s9/XTL+AzxkfnhGXEWQa4J1no/G6nadojuTVjZQski
	SMogXKIHqGowOmRkut6nz4swzvkACHBQnGYkSTp2rplNbIZ8BbMEe+BI0nh0FnSX0mdUW8o+qnA
	MdRfWTUM7bvDW9oIMzXO+q1+jmkaaO+ZVcWwJ7t1UUVMLUcfxI2uB0YGVDSLV6NjmnjtJjcvYwH
	5ezL8pk6ZxJOaDQ/cioj736VakPMh2egujwZLG0Y4LmYzB73ZkTn3NtHgBZpUEUQpowj1bucbjb
	vU/gqr+0e2nmJA77Be8mkLwI4uW6EWHO4gt57PwH3Vzkevpwl5ZIqWmeqsSEEIUaR1rUNiGK8J5
	cmBMdEr8mntpF1XDcZQVU4yiAFvyRpOZsJ9t2hrv+eQKrZ/VkwcdoqnaOYzgReVciMQ==
X-Received: by 2002:a17:907:1b11:b0:ac2:dfcf:3e09 with SMTP id a640c23a62f3a-ac7d6eb8de1mr1531979266b.43.1744102228796;
        Tue, 08 Apr 2025 01:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpsTVCILDyaXBZ5lkeFvik1nQEDh5z5n5qIxRWyhWTeQPllYWoHbltidBzTa2yJlwiabVPwA==
X-Received: by 2002:a17:907:1b11:b0:ac2:dfcf:3e09 with SMTP id a640c23a62f3a-ac7d6eb8de1mr1531976466b.43.1744102228388;
        Tue, 08 Apr 2025 01:50:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe99b30sm882797566b.58.2025.04.08.01.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 01:50:27 -0700 (PDT)
Message-ID: <56826617-5e91-418f-869a-bdd24bca0f0c@redhat.com>
Date: Tue, 8 Apr 2025 10:50:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform/x86: convert GPIO chips to using new value
 setters
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Santosh Kumar Yadav <santoshkumar.yadav@barco.com>,
 Peter Korsgaard <peter.korsgaard@barco.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 8-Apr-25 9:19 AM, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the x86 platform GPIO controllers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans




> ---
> Bartosz Golaszewski (3):
>       platform/x86: barco-p50: use new GPIO line value setter callbacks
>       platform/x86: int0002: use new GPIO line value setter callbacks
>       platform/x86: silicom: use new GPIO line value setter callbacks
> 
>  drivers/platform/x86/barco-p50-gpio.c      | 10 +++++++---
>  drivers/platform/x86/intel/int0002_vgpio.c |  7 ++++---
>  drivers/platform/x86/silicom-platform.c    | 11 ++++++-----
>  3 files changed, 17 insertions(+), 11 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250401-gpiochip-set-rv-platform-x86-86788597f4a4
> 
> Best regards,


