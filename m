Return-Path: <linux-gpio+bounces-4728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189888EC40
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 18:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FBC01F267AC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 17:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516B312F583;
	Wed, 27 Mar 2024 17:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u24CyQ9i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CAD59B74
	for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 17:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711559624; cv=none; b=F7OVOuVrDpDe4JpXGf3x5aU2QNgraOjPWUK/v8aJXm7FLhF41B2pMC3QyFUUdMeY+sazdVI/h8hKmMc5TLFKHSoe2nwSBktRE/bJkYRSWaWU/EkKT8pRgQm+9CpSRg5Y6R2M9rHwF4LWPz7RK6spm4WbRBbL5ybIKs1lBaALWqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711559624; c=relaxed/simple;
	bh=xbY2q6DRS7RicrCydGVyY6S+bGxs1by5hytA6w9CBNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5ymYagzKZMgRHp10ez8JqKVQOyHHld+wwvni11d8c39veg8rYysotcb8XoNcVZwgtBiWsipPgma4VUWTw8woEP5eALU66x15tr4Rv/DLYXXUlh5Sz1fktBucBSK4ZrIZ880fMZSBJ4vgB5QWDVd4eTMFJO/MpGuvUCtwtkXep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u24CyQ9i; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56c2c41cbdaso32633a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711559621; x=1712164421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh9shS3i73IGOIOWjBed8Am9PLNuJSBVxZDUKee4P1U=;
        b=u24CyQ9iwF/a8j3brbs1D3icqqHJM803dq5ZkCdLxZad8q/OZwcQFO3v45eH03l/CX
         OUKD0tW5N6dOyn2lxee3CINOhYG0dZBoFRoAPCXRg1lhKWSGG+5Q0c6jCKD046NuGDaA
         WlEsmWlBMwW+RgzXg05WSHKSf3Tz8K/i1buUTsoUzQs6FVlc5AiD8fjSzMTd1ncjYVmR
         oNcZkqPV/tqcYBmaa01sUdSIkvVX8L8+9ZxNq8hmRNIAi7twaGloq4G1koOGIifMDxFB
         0OVNm4GfiIgeMgAKHcYaoDpTwTY32EURepqygDUaiV9sx04hyK2atc7RcONd557CqrCL
         5maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711559621; x=1712164421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jh9shS3i73IGOIOWjBed8Am9PLNuJSBVxZDUKee4P1U=;
        b=JGTRx8muNO2MGI7ctX3k1FMgpFExbWlbAHCW1t7OV2gkRSGfGhYZ45kfBr0NmAG+M9
         brZrvu9+zXHUfCFYdHXQKgyWvvU0kx84xweF8v0ZHqKQvTPn9/oAgikA9ekpurEOEiDH
         KZC25TNLe2ZgEI3h3f4aSK0SMEANJn+2sMsevnW6qYD8mIHuD8idAck421qXLVgYhzNt
         5SnOnhL7OEFLC3FtzU4zqnUtl3HPDhceZlLSYz5wgTq1S88nAZ0f+QzatfD1asQ86G+7
         K1s3EZkqKGVDNPl+iBrrQeGcxPVDzH9jXz2hr00NJMFD4sPNnNb24x8nON6tpy+SkD6i
         +tAw==
X-Forwarded-Encrypted: i=1; AJvYcCVHMTzU2qj7YOvuozFL5+apzUcwBdCAk9Q2U62DDaRmpp+1+W+kTcRLwzSEnkkgxiyFpuwHKmx+9goZmeitZvrvnfu2DATE4mRqJQ==
X-Gm-Message-State: AOJu0YzMA4Kx4W+Vi/1m0dgnfCSeDGiVgKY/2GHJdyVIqSDyNxuciRik
	HIaJUBdV6nf35D0lRPwPhJwUbLGbEAjP7CVHxNWvGtp8RbQU0YcTmDlBM0g16xAU8+6pm5W3D8/
	7
X-Google-Smtp-Source: AGHT+IEfDiqHvV97l8zslXZUDoQyIs5PzffcO444PHe79XCaGJi6M+TZTtly6KyH4ufleoNHoTr0CA==
X-Received: by 2002:a50:d65c:0:b0:566:b09e:8d24 with SMTP id c28-20020a50d65c000000b00566b09e8d24mr431892edj.12.1711559620675;
        Wed, 27 Mar 2024 10:13:40 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id u14-20020a056402110e00b0056bfc48406csm5056187edv.7.2024.03.27.10.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 10:13:40 -0700 (PDT)
Message-ID: <32abb873-9a05-460d-a434-f474fda2bcd0@linaro.org>
Date: Wed, 27 Mar 2024 18:13:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] pinctrl: qcom: spmi-gpio: Add PMIH0108 and PMD8028
 support
To: Anjelique Melendez <quic_amelende@quicinc.com>, andersson@kernel.org,
 linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_subbaram@quicinc.com, quic_collinsd@quicinc.com,
 quic_jprakash@quicinc.com
References: <20240326220628.2392802-1-quic_amelende@quicinc.com>
 <20240326220628.2392802-5-quic_amelende@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240326220628.2392802-5-quic_amelende@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 11:06 PM, Anjelique Melendez wrote:
> Add support for qcom,pmih0108-gpio and qcom,pmd8028-gpio.
> 
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

