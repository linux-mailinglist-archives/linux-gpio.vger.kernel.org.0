Return-Path: <linux-gpio+bounces-21568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5231AD96C0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 23:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 867031BC154C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 21:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A17248881;
	Fri, 13 Jun 2025 21:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K0ywP0Jf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A456324E4AD
	for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 21:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848442; cv=none; b=PEVSQ1Arei3l6PQVk62suIiocV1voR0R0LhbDvrllIDcEmK6K7wkAkh6bC5NWpw0NjzHbUAxWB+4uebE5ZzmBXFu+/qfkm0WG9I964Vk9fPHdnQGqDAQ9aVUtuG+1rtzidwPruH57IY0WoZLSkrgX5VD2j4RAIcAKzCADVOq+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848442; c=relaxed/simple;
	bh=sMwWiyacSDvV5Tp1lolpnmezCxwjuQeCgQRuB/ycI+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FP50Qx4X+BFpXA5pd4oV0tqReplLpr+/qXWPkfwE7lWykNRs2FxXyMshX0pDLUgWdDHEsVQ6suORqH8eP87Ctfy7Tt0EcZ0IKC0n8QBFAE0t59+lLHXohFj291SMZIykGd4ewvyQpGO09tS5dCrdoYAbPclnCW3ueBmFJYLzqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K0ywP0Jf; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-407a5b577f8so679583b6e.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 14:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749848436; x=1750453236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OC4lGjpRIsFQ3PxsIGKswS7a8Sk/ulLQg+3aOcjhhnA=;
        b=K0ywP0JfoCXeDmQGezgBdJmv2ruimXOX0f/GkeeckccrSDaUd3WiTKBzq5ctDd5uY0
         UzS67BvpMwj1GD9AUh2fgmiQ7zC1bZLxBAg3+lzQM9j3oA4KFkKtztYlXxkpKPEcqjHl
         CvXQfx72B5BlHxTZtHwjsVpA4W0ViQYQbXwPkpKZBV6GuQyptCqyLKYqtxEBs9DVj7AP
         56Gmmmt59+NqxFzK/GW56yaRC+pZEfH5VWbGmx180LImFMUuYoyG+xZ7hs+Ct2XoLXQQ
         UsoNbehaKGafBw4C7EJe9uBFz0ystPjU3cei04SXU0Qj5/TqIyxTXmXPEOW7b/tXs8ZH
         Q64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848436; x=1750453236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OC4lGjpRIsFQ3PxsIGKswS7a8Sk/ulLQg+3aOcjhhnA=;
        b=GqgZoaKknD47CF8naaPhlt3hfU1TWpo7MFYMPwjGTuBvVZ0U66Aq7ideCDgDf3kGXS
         vCq3f0I4F/4sTXBZkxryByYV3KZArylHcLJLWFFXox+BroCFVxDG8C7rBlpL3db5Wf2G
         UnFp6Yq227W5+ui3joVWuLv6O7drHnd/+cB6QDQOsG7M7R9ESpaJB6jv9WHR0jsDhF0g
         L/60rQbf2VJF9XIcWsxXbBbz1YyBMwM3Iw4Qqbg2jOSKWA9wggduthsG61VzPfjiqMe3
         ya+aakSfNQVANRgUWbLAw7oFEWjumGwwJKOTf8TPDYZ++ekOlRpx/sHfGxzeIVjRc324
         ph/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQkapZnhbm9fKH8oa0DSh76NyM5Wm7FJ/lPn64qQQ5/JPmkmv+n/uRdxGos0OEjKje70ZixK5/cMVl@vger.kernel.org
X-Gm-Message-State: AOJu0YyG5tPHaY2jxJkKXetqC72rgFuGQFoTI8eXuaC8TP/ZjSHge5IQ
	FCaxbYe3fFAK7APwpJES38U03Rlqis1wjR3xiPDh5myW1rLvoXhpTIaMMAx/Zir7GGA=
X-Gm-Gg: ASbGncs61JnUGRBvY201bWrz1+/3L4eT+uiaYeadkcFh+19kvMRldnHfZzWVYMti4YC
	ifrOdFbrAKy6CWzs6CofnLFj8lmP8RPwXvuWgphWWrSmtr0OigtOtroz2Eb5T72De4x52YjtAxw
	Pib8vukY0H79mhPDMgt90pcSPb3VSlsujaOWo1SeZ186DmIoRdxytIuixqsg+8BLK+OCYcEeMtV
	T8uX2IfmdIdyOmQgi/B+iEwGcF7jSaz0draGXVC1BY6paZhKjJ61wdftXCq2VjrhZtIPsIgvBmU
	UorwMybmgi7JJuqW4spbgurHt8cy/K8nYog6aoo4g736dBrh5zbhOWYywf6PEfVfaQyonwTa3G8
	HPa2yXiP6VtMVAJfy28giosyQD2kPAQKk4xE8
X-Google-Smtp-Source: AGHT+IEtXeO28HYPr7tm/gNlkY2Yoh25MnNBR5GISA6s3KtN+9pVdziylV4ZXeGQBQkLiZ7HAFTGYQ==
X-Received: by 2002:a05:6808:2182:b0:404:766:3129 with SMTP id 5614622812f47-40a7c17a034mr646649b6e.1.1749848431590;
        Fri, 13 Jun 2025 14:00:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4647:c57:a73c:39d8? ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a74172ccbsm413546b6e.29.2025.06.13.14.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 14:00:31 -0700 (PDT)
Message-ID: <439f78d1-aa1f-4929-99a0-8d6bb1958912@baylibre.com>
Date: Fri, 13 Jun 2025 16:00:30 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
 <b0859b25-0e95-4966-a433-5757d8bd9e6a@app.fastmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b0859b25-0e95-4966-a433-5757d8bd9e6a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/25 3:37 PM, Arnd Bergmann wrote:
> On Fri, Jun 13, 2025, at 20:55, David Lechner wrote:
>> This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
>> that didn't get applied yet for the bus subsystem. So I have changed
>> the subject line accordingly.
>>
>> Arnd,
>>
>> There was no maintainer listed in MAINTAINERS for the ts-nbus driver
>> and it looks like you have picked up patches for it in the past. Could
>> you please pick up these as well?
> 
> Sure, no problem, just a few things:
> 
> - These are all cleanups that can wait until 6.17, right?

yes

> - I see the driver has no in-tree users, and apparently never
>   were. There is a imx28-ts4600.dts file that should reference
>   it but doesn't. Do we have any indication that the driver works?
>   Added Sebastien to Cc as well for clarification.

I dropped Sebastien in v5 because the emails bounced in v4, so I
don't expect we will get a response. I'm not familiar with this
driver or related hardware myself.

> - it would help me if you can send the patches to soc@kernel.org
>   for me to pick up, as that ensures I don't forget them.
> 
>      Arnd


