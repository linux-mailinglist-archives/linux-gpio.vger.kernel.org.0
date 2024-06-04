Return-Path: <linux-gpio+bounces-7098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292DA8FA957
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 06:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2D75286FED
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 04:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7743013D639;
	Tue,  4 Jun 2024 04:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUyRwmov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB64C13D612
	for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2024 04:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717475961; cv=none; b=WXgpV5sVaCLkFvH95OhvLHoCWW3Ubhdjqu1DEGw3pHei+9kG1d5BzvIMaU106lONsS0qU8+Yu96Vwz9znCELoINiXwOL/FTz6bTjz3wS4265jzZZw3eR4sjtZ13p9BVWBHH0B2Fa/DUdvt/Oc0fPcjK11YltluO2Z6hHoUv+SzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717475961; c=relaxed/simple;
	bh=4aURNjuD3wT7wQWTKbQPob498cp3V/AVHsV72X6c1GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AEGwFJAVGhayppmKniW1JZbZn6KQplJmCYvX2dI+kcNNu6V5kYqa06EyvhUGzJHcwwPpzrt9bAuoktFpqcmiPr2LlAgIM0aUhQWTPnWTfEnKcaGwJt7YwqxNkqJoCPTaBFiHOGHJ5i7Qgbdj3hiInHagKX5/CY9cUv0PfhlT4Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUyRwmov; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-250ac3acc6dso357751fac.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 21:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717475959; x=1718080759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MaxZUvYwSW9Qm6qapjAvhOape0JLVRkwJwhm4gWq2Vk=;
        b=WUyRwmovkgvFac6DcEwi/gmwZ6J8Byx5YwCG0Ktacv+LETeVCZ32xZcrjf/8dCChef
         pFbafUMuS/TBHeX052DiHPIhsHWrBQG36yTDk6uVwSENQAzjBpjB1pNj8/Q6nzZE7aKW
         Y3H3mA7UWlNOPRkImPRGAHAghuwplwbvHEmdTN01ev4Go0hI55L+ZM2fs5+T/ygQ9Qyh
         emxxX78NjufKv1oPVH9Zm90TByu81L5b48hEIG5RFXuOXql+EGwK3GxAcIstQK+tirNb
         BIPV0TXOd0qMchAQl7L1TaGJvvQhqUgDy5v7vnUIGB7uOKnB1R83BOM1RoR4ld9z6RMI
         cdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717475959; x=1718080759;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaxZUvYwSW9Qm6qapjAvhOape0JLVRkwJwhm4gWq2Vk=;
        b=NavkyceVOjK4x17dC1XhkZtDP0WVImeZbMWNHSPFRhFLcUxFjRvkQ0FC54DQukHfUE
         xjmNX4TWO1PmghYMIUBSvj/So+o8KGhin8dYqwyAb2CLOZ7XeKze1NBPDW5zKpneKwWG
         ZXSP85iwHsNVrVJuX+rJNEsPb24oGVRclobjK18yVpZQ4u/BXtXrU4pzmurBvaLl2InB
         RuCSuY3Zb3zaHvFw+2xUfzGnV5PiIcjnITDTkiGooUt65ayVGD1teMxt6TZJk/10yNg4
         cQX1soXyUh51ZqpOI3+cdPVDeIhZh7rCStL+h6alLGt+bvREGYJdldoqCeUUVNRhUJiY
         c1eg==
X-Gm-Message-State: AOJu0YyYHVjeGMThvfLhFRE0epFv1vv/P1SAyosW4yyOees7ZVOtogPh
	zHVLAsrDKeS3l4m2NaOU6Z52ErrOZ8v8+8TmW0fvXMeilEveN4cPyk+iMg==
X-Google-Smtp-Source: AGHT+IGTd5hRdgAdRmIgxvbYp25zLgDx2i8JqIV2Nqr8QAKqzTB4v6LcP5jVBJ/xJi/aIHBiak5n1w==
X-Received: by 2002:a05:6871:520c:b0:24f:c3c2:4ff9 with SMTP id 586e51a60fabf-2508bacfaeamr12393829fac.23.1717475958426;
        Mon, 03 Jun 2024 21:39:18 -0700 (PDT)
Received: from [192.168.6.104] (mail.3111skyline.com. [66.76.46.195])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25085226ae6sm3033892fac.36.2024.06.03.21.39.17
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 21:39:17 -0700 (PDT)
Message-ID: <2b815f80-5bc1-499c-9f7c-38749e112269@gmail.com>
Date: Mon, 3 Jun 2024 23:39:16 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Documentation for line_config PULL_UP, effect on line_event edges
 and line_request values?
To: linux-gpio@vger.kernel.org
References: <d82c276f-fade-4b23-9617-206c4cf0796e@gmail.com>
 <20240604024322.GA45268@rigel>
Content-Language: en-US
From: "David C. Rankin" <drankinatty@gmail.com>
Disposition-Notification-To: "David C. Rankin" <drankinatty@gmail.com>
In-Reply-To: <20240604024322.GA45268@rigel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/24 21:43, Kent Gibson wrote:
> Does highlighting that line values are logical help?

Thank you Kent for the reply!

   Chuckling... yes, flashing attributes too and a sledge-hammer waiting to 
fall on my head may also help.

   All kidding aside, the reason I bring it up, is if this is something that I 
scratched my head about after reading the documentation and the header, then 
I'm not alone. It's always the case with documenting code, when you are the 
author (or closely involved in creating the code), everything seems very clear 
and obvious -- you've lived with the code for months or years...

   However, on the other end of the understanding continuum, is the person 
looking to use the v2 uABI for the first time, without any familiarity with 
the code, that reads the chardev.html document will likely never appreciate 
the careful use of the words active/inactive. The comments in gpio.h header 
really do seem to just make that point more clear despite having the same 
text. I know it was that way for me.

   It may not take much of an addition at all to emphasize the logical edge 
and value relationship. In fact, just what you explained in your reply would 
make a perfect addition to help clarify and bridge the gap between those who 
know the uABI inside and out and those who just start working with it.

   Without looking at the code (or isolating the PULL and ACTIVE_LOW) it 
wasn't immediately clear which one was flipping the logical relationship. From 
a hardware standpoint it would make sense that either one could do it. Your 
explanation of bias being physical and the ACTIVE_LOW flag being the one that 
sets the logic makes that point clear. That would be a great addition to the 
doc as well.

>>
>>  * @GPIO_V2_LINE_FLAG_EDGE_RISING: line detects rising (inactive to active)
>>  * edges
>>  * @GPIO_V2_LINE_FLAG_EDGE_FALLING: line detects falling (active to
>>  * inactive) edges
>>  ...
> 
> So that does not makes it clear that the edge definitions are based on
> logical values?
> 

   That does make it clear, but for whatever human-factors reason, it is not 
as apparent in the enum gpio_v2_line_flag section of the chardev.html web 
page. Maybe it just has to do with the way the web-page puts the explanation 
on a separate line below in smaller serif font? But it almost seems the header 
screams "Pay attention to this!" while the doc just reads "Here is some other 
info too". Your idea of highlighting or at least bolding the "(inactive to 
active)" and "(active to inactive)" would certainly help there.

   In chardev.html, adding your explanation on the logical/physical difference 
would work great as a "Note: ...." right before the enum gpio_v2_line_flag 
block (or right after whichever you prefer)

   Anyway, all just good ideas intended to improve the ease of initial 
understanding for what is a great improvement over the v1 uABI. I'll leave the 
rest in your hands, you provided a great, short and concise explanation of the 
logical verses physical implementation of edge detection and value behavior. 
I'd only ask that you give serious thought to adding a few sentences or a 
paragraph precisely as you did in the reply. That really can make all the 
difference in understanding for someone coming anew to the gpio_v2 ABI.

   Thanks again for your reply.

-- 
David C. Rankin, J.D.,P.E.


