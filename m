Return-Path: <linux-gpio+bounces-7734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 943FC9184BF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 16:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC4D1F2124F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 14:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D09186288;
	Wed, 26 Jun 2024 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="REqT9qCp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF68F5C
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413140; cv=none; b=q4dvx4K1QSbsarWoo9Nt6cKeZOHHYuUJEogcHI6vXfTF4QSzrRJxrr+PbY2wVjEu3YbjNbP8MtPRv20NAzD/w9VjZxV23HSpCVzP/gKpmXetciS5zedDPEUTF89D2vY2Xl/+xjMdQh+ZLy8k1bvnOCQK7/0KVnMOkllJ/e2t6Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413140; c=relaxed/simple;
	bh=y8zm/3L1kXWTD8QfW3j4aqxxls3sAhrR+o4g6osU3lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tftBBIRs0mZOx2NIHe9RaU//xQS/pdLUsk/MeyEiUlTr2AhfflT3K5Tl9D/UpoVAMY15ZVmJQLZ9GyM/QLosRCwQzT/IwY34dpDb8mUGqj97/mLqyy4MhBKiPUyZZpNABTA77gh/qHwwxgb4Xt8HY89tfx8tiIxeTFzn5aOfJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=REqT9qCp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-365663f51adso4954009f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719413137; x=1720017937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ImcCGyDE7I6yMqJMnY74qb5i8teN732/9KzoWXlhoo=;
        b=REqT9qCp5tZLzKt3q/V/izKOFnQaeGrLvZmhMeXYC4JevAPAxAJvuAN1jMG2LdPdPP
         MyIaSbTa52r2OHjxGHafER8ow8HheNogFKiOS9AjJipjG7J68g/X+aXg8+crBOAqtOhB
         ywlG7QRw0b+FfxqE2QsVxf6j1COWS6T1n7BKV1hn1/mSqbfGKhkiDCQze8t1CzppGcPO
         AEuK/RI8ectyupxygwPfLs+EBb+ud+OCat78lzmAq8UxhE1hVjLhpy4fCcXKApMjzjPC
         QpJAq3j4ckgJSFdluJcMFzuv67B1kr+MVE0r2vns1ggWiXI3bBPQ/SmOYRYlDSnz1Heo
         YOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413137; x=1720017937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ImcCGyDE7I6yMqJMnY74qb5i8teN732/9KzoWXlhoo=;
        b=aKfbvsBy03B3H5neIgSri6ehN/BUyg1OzRcOE9dsrwOjysfJk/V5zLK1PaTMkFSHxN
         VSaubBAEPGm110CUS+JrF0dmwlsK9uDy1lGE8N2+EvD4LHLLGUb0/haKekRSFvJp2MOQ
         WrQh3CCVsa3pMg4+xvEva47AVj9MmWfJ3FsSPjpLSpl1XIPGJ5yYm2SUdPrCgLbo8gJs
         DsvzR8zSQIb/bZRxVsGtyoi3r86iVvLPwnB40Y1YOZ1bEtfRSzeFddDdWfWUbogq88ku
         Muhwbms1hSw2SRhmlcNkdmzb3tIeL+Akm9XPjoP2j+MPQiYdk5B3KI0ziO0JGZE3l3IX
         uWjw==
X-Forwarded-Encrypted: i=1; AJvYcCVFNiOH0N+lhfJlnbzICNM19nOZ3Ym4bV7NQppoPYN1XV+lcALljjXkK+SQxSKoguI8SpNN+haODfFP0ywX1FbgaRdjIGZ5gYKb0w==
X-Gm-Message-State: AOJu0Yy4OOFsdZ2fj4k/zZ36VSAmTMRqJEBQYPPGN0IUUiCRRl6jF0on
	xKkpMFUvsYNM3UKkxLFMYGfSPA4vdqEfnS5Oisrb27hjKVeNKNFGH5hIjwA9Ufc=
X-Google-Smtp-Source: AGHT+IG/AlewYPc0Dy1UlBU5/51vgSl05qv7I6lz3SlZ7lI0KZGsBYKoYyPqgX6httWlcghptbIbPw==
X-Received: by 2002:a5d:526d:0:b0:35f:b7c:5330 with SMTP id ffacd0b85a97d-366e4eddc42mr7416578f8f.31.1719413137016;
        Wed, 26 Jun 2024 07:45:37 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b85cesm16336996f8f.46.2024.06.26.07.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 07:45:36 -0700 (PDT)
Message-ID: <758417e6-337f-417b-a6a6-aaad01b2f966@linaro.org>
Date: Wed, 26 Jun 2024 15:45:35 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexey.klimov@linaro.org
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
 <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com>
 <4106f2be-be0b-4263-9e61-c3a29e837a7c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <4106f2be-be0b-4263-9e61-c3a29e837a7c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/06/2024 14:42, Krzysztof Kozlowski wrote:
> On 26/06/2024 12:04, Linus Walleij wrote:
>> On Sat, Jun 22, 2024 at 6:49 PM Srinivas Kandagatla
>> <srinivas.kandagatla@linaro.org> wrote:
>>
>>> Add support for sm4250 lpi pinctrl.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> No major protests against v4 so patches applied!
> 
> There was a protest from Alexey, that driver does not probe correctly.
> Can you still drop it? Not sure if worth revert, though, better to fix
> incrementally.
> 
Let me send out an incremental fix for this.
These patches can go by itself.

--srini
> Best regards,
> Krzysztof
> 

