Return-Path: <linux-gpio+bounces-20103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C511AAB5D1B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 21:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 165CC7B485F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 19:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7417A2BF98B;
	Tue, 13 May 2025 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYZ71EG1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932391EB5CB;
	Tue, 13 May 2025 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747164303; cv=none; b=oe8W0bfw3wczGc+hsbcINycxsrSdu4PxtA7a1GRB6ltmG+Jqz+CqHiAZB5TZRwsuS/yxFGY4xfKeo690jqxCILFii+8/vkO43ahQEAU2mQnDbWlkxekWc+99Ln82XmK9cel1SZvN570kTV9VqcgSGBS/akRy7utawx5D3DdBHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747164303; c=relaxed/simple;
	bh=x9hq3QwBbOHuhRAkTl/n18wMQ01l0dMsEl2S3n90LTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYkr92i4QYu52WR5wvx19Nsr+GM389R4aFO1yOEDcQjBZrheehDPBuY1T68GYnlnA8ZQfkg/xSzRyCexZt0iJiceMQeWz+3LqUI9VnGBQ0AO2LNc3dPwD7CWfV/Qso0kwqSIPXblf4t5VqnBfCXftgfe5OGkfjvMVWJs+BebT04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYZ71EG1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fc9c49c8adso6311470a12.3;
        Tue, 13 May 2025 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747164300; x=1747769100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UVahQe1UPF0K+iokLjZpppnJFILmRHV+SLcIZYIH48=;
        b=VYZ71EG1033Ht0UOCKYY2aMQZdk874G5YxDnnXuXvKGLWnuLT4t5+Uvmo4NQCsMKqV
         BFFP5dMLk5nFh5kf9ljm+RNr7sZoSdvIKRUUaX8tXHM2ARDUA18DQqLnyXui28ljflMT
         At52Egxh1sDBTUW8RnpDbFj+gPuTmC4XTKFizuK1vXGSzRe560S48i/lgKTO5+Rt9/Ae
         8nibBVpRf0F6zhGSYhDy17sLfOozXdP/VYOthss1Mp8XR/ZnyGpuxZPSl3zSbTclNce7
         ZpaVJAWX8hr0yQPB414j0wiIoO8Kmns93/3tAl9rXKXj1gMLK7kXtzS8O5YGf9WjADsw
         xW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747164300; x=1747769100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UVahQe1UPF0K+iokLjZpppnJFILmRHV+SLcIZYIH48=;
        b=FfgqZVXu0FOZtk2G/FV/Eg7Ag6kSK9R1RUmjdVxjKEzEprrjCEqpnz3dnhjPszFVuc
         wIXBCnXkUEnIK4dU+xUiMuG4x04MwqF7ZQLyNe4w4q79aPhRuI72+iMgok4p2YI4AXvS
         NZlemG9/NGTcZrOUYA5QHluYgbG4IUeMSaywJD324DZnthWn77EuCr8w72BXckhKQhGM
         4H6F0u0Ns/0BFIKHooeZSDeyBehtLvowa091JhpDe0FBXIGv8oL0p/MeicJ8M8Wg2tbl
         UCIvHSViCMcOX1tJtX8tsKdFlDBpkaizLTqiTBdVRPX/7/yF7RCHV7h5qOKndknz/wF7
         iXOg==
X-Forwarded-Encrypted: i=1; AJvYcCUjrBE/NxsgV1jE9WBO/biD+WkvRBuPwdCDGVxXhFlmhQGoAKRxFxy0DkYji3kxEmXuDPTkTGdX8YhfpyOW@vger.kernel.org, AJvYcCWD53LwwZcUgFJk5FUeG01zOMcTYkBCE0lAxy0049+30tyTQY/K36zzbMkQC65H7eSJ0xs9hWpMNnI9@vger.kernel.org, AJvYcCXpvuPCk65CBWSwrjiqt6sU/Sri2rLXBFiF+NXh5yOSBCHNS/04LIVhaO/gVxNDYSps+mROASlo@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3QxP3f0Z8iWlsLtHYMvB/eTox+CFWutT6mTivVJV8kGKHIaK
	firrwIzCo1hMsmBMisAdXqmTfeJ+1qJ6/nhE6KlpgfkV+9RAtHcb
X-Gm-Gg: ASbGncsGOF77vBlp47vqB6VvTlf8TwU4MvtDQ+PrAGJdSKIkuD5exTJJMY/m3KqZpG+
	W2whuB4B/aY0i1aqWg38qAd7IViUUPjG80+NRMM3pXP0QGBLiClvoHm2D1qYdSHQSwza9nlIPR2
	9uyNfwmxoXHZElSPX4xsmLjryAFDiqSKz6SCU03ag0VXrOPi3I/U0mc3k+KSQb4tYPNCBHmi7IM
	Thh9ce7/EXUM9wsSJ8SJFwh35v2l6g5M/VTL4isLqlX7sk7wbTLE0Z9YM1FTk7eGhuapf4vEKN/
	orndsGRUJnNrRXOW444JTeGJ+J6uTnAFhOhzvf9OoxtLBV3499EN4oR0hQTspaq5XCbm+JDhD5D
	TUTJjzpNhrTTZ7yR2
X-Google-Smtp-Source: AGHT+IHlro9nmnM+A5vp7iF7ncinqOHIXxdhKiKiQNf42yzLvVSInDJfUeta/CfNghr1tiC9h00HEw==
X-Received: by 2002:a17:906:6a27:b0:ad3:f3dc:e363 with SMTP id a640c23a62f3a-ad4f749f195mr77941966b.49.1747164299542;
        Tue, 13 May 2025 12:24:59 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21f2145d6sm785086966b.95.2025.05.13.12.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 12:24:59 -0700 (PDT)
Message-ID: <73bc3569-93d7-437a-9d40-0137a096f7cc@gmail.com>
Date: Tue, 13 May 2025 21:24:58 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Content-Language: hu
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
 <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
 <aefa5ed3-1085-4e88-b3ec-4cf9958e7e2a@gmail.com>
 <f638f5ca-a479-4ab2-a8ae-6300bbe0cb08@lunn.ch>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <f638f5ca-a479-4ab2-a8ae-6300bbe0cb08@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 05. 13. 20:46 keltezéssel, Andrew Lunn írta:
> On Tue, May 13, 2025 at 06:51:35PM +0200, Gabor Juhos wrote:
>> 2025. 05. 13. 15:36 keltezéssel, Linus Walleij írta:
>>> On Mon, May 12, 2025 at 11:33 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>> On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
>>>>> The series contains several small patches to fix various
>>>>> issues in the pinctrl driver for Armada 3700.
>>>>
>>>> I'm not sure all these should be for stable. Some are clear bugs, but
>>>> not propagating the errors has not bothered anybody so far, a
>>>> requirement for stable.
>>>
>>> So we are at -rc6 so I'm not sending these as fixes to Torvalds
>>> right now unless they are super-critical.
>>>
>>> I will merge this for v6.16 (-rc1) and then the stable maintainers
>>> will have to decide from the point it enters mainline.
>>>
>>> Gabor: can you look over the tags? Once you have decided
>>> on stable/non-stable tags I will merge the series.
>>
>> Sure, I will send a v2. Just a question, shall I also remove the 'Fixes' tags
>> along with the 'stable' ones? If I keep those, they might land up in stable
>> trees anyway.
> 
> For the return values patches, i would drop the Fixes. It is just
> really continuing development work for the driver.

Ok, thanks!

-Gabor

