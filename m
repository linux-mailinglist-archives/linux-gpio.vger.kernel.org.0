Return-Path: <linux-gpio+bounces-25882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C83B51465
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 12:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D611C8100B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 10:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B50F311969;
	Wed, 10 Sep 2025 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFmjIxH0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F6C239E7D;
	Wed, 10 Sep 2025 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501334; cv=none; b=uEuhV6/IEJi1KmICLKXTadem/BW6rwzRlPVRog7cjuvNy62bF64nl4LN9RYcfj15GLtxDyniNCWAvAL4tWME1h3L5S7GJVsLceuT6lkOXdy6nu6b1LvBughV6D9GmmY/pGpRkEk2dzXqlBoOtP6asOn0QwE0lXvOPDY646LpaF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501334; c=relaxed/simple;
	bh=oZuskF8rQFH7X1X26xw4eX994bR051hWbKT9n03w/6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTZtKydDKKD3Mz2yJ/rt4bD8USHOy6HEsym3eUMOc3+chVINabwBHUVgOpqYP0pDodVtVAPjoNs94t/elrYaz3JmSQnqHmMr5sBijmI7b+yyB0ynasm8tdddt6G19+V/c9T0/LMMPcsMRRPb64AWUJHmH893zwnFTk6i9BPRslo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFmjIxH0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3d19699240dso299008f8f.1;
        Wed, 10 Sep 2025 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501330; x=1758106130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+N7hk82kSw/hD5RnH/Wdj/jHeKN7m/X8ltb3+xi6FX4=;
        b=GFmjIxH0/6BG9POU6zwX30h1CQxiF814sHXYThxhVMP5/19kxIpflWgpkB4vnjhssi
         EkHp8F92zljsDvYAphYasdfpYnrW4B4VvCkxgNzdjp+vpiszuVv8VR0YLpMBeJf5kCxZ
         y+fk00IWSvDxbn1rS3As26oAkxPkzkGNbKxxnD/1YrK0GV98a2yvtDOUJE4pPR9UxeVl
         JHI8TJg/rkZHy4hJ+t8E2wDq+gO4Md9l5lrp4DgbpoeTfjBlEtaHOu+YQZO5yQsqFrKU
         AEa7nLfDbiGUz9ppXPSRssDjRR7v4JF1b90ximl5hHOUHBVAlCJkCjohwLwtz+nG6mQS
         6p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501330; x=1758106130;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+N7hk82kSw/hD5RnH/Wdj/jHeKN7m/X8ltb3+xi6FX4=;
        b=rUYWakpveUIVhIgSnZLq5SHXNqU8Ouo6jAZZ+QcxempGpN3D6IOmIdbWl/eMAvXTNS
         LF6uMQCoTZn/Dd/NFF+GoOZaOMssxhUMACzhzPgLRLRsDaokWLXivRSGwgh8s6ZlWEPi
         de68URyoWoeQB8w8UawcYypHF9P33DiAk32qiAvQS/dhHEewmGuH01kSsnUJ8SzdG/6y
         h8fOKaSJ5jCHgX4twm0J3iYyuq7d/VLO9a0dsT6yqNOpnZlC+ByLBFaS7UK7raukb57T
         k6hYM0a6sVX2mpL35f2aqbyCrQk5d5wv1zNJnlUXvFHwM1wRW620WOLzLXNEFqttnik9
         Gxkw==
X-Forwarded-Encrypted: i=1; AJvYcCU9BNfqh1GBAJValu3MS1wKjzYouNrxFktnk9sD4gpvAwPgcOAOSe1tvxM4T/z87pO+b+efS8YT6vL6@vger.kernel.org, AJvYcCWagSnM7Z9uWTKewpqcRnsii7qFq3m18/VMSDoVQVsoDu4/qbnDtYbnTaBr2fSBqCiA8lYbxadkcWKnnQ==@vger.kernel.org, AJvYcCX8UoKoyPxsFv8KjaA3HTzkmj8NiFnK8g3vhN88JFvej/RidJ7CmKQb9PN+gUkR7XTM6iP6v6yxpOJMiXE=@vger.kernel.org, AJvYcCXzt6NfotCEo4Zs4QBVdn26OC3P2btpc/MTM5TWS/qSxgJVrwhbDahxD+tEvYAwMyZMOBbFyCNbXWmcWR3p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+hkgS69zsv4WqhLEeSWX664UItnqGqqTD/b2s5+mMJspekfcz
	xL1QF50d8+MuHAnQEpklZWd44ypNPw7pQp5MB+AxV2kM9sGNtE1iqTdF
X-Gm-Gg: ASbGnct72QMffhGfYmv5huMHDjZYxVb3aK6lMxDC2bxl2pM5u0je/lHGwv/9D1EvQGB
	bCz66qutr/W3sczr2moFsfCiIPHnYQ5wzUPNlDmszV+j6YauDjXxLIT+6rdXzxo2UfjbmMNNdCT
	aDKQ3oL8MXr4csVk95f6sLY/c/Omwl/Fxr+tDhLCOHC1dTpLfMrmSCByvvcLiDY4AY1cXZVnCTN
	LvtyEejTA8vDsDSrgSCHF3ihX5qziNAbo3KK+KlvUPsRZz5k5he0aXHmUykhwMRpL0mkhWijR75
	3VUXocNkG1WGwXQh9ObMUldR8NIgSv55wGZUrFTolPnk2kYAY9FcGc4GaQBQAU6q2x/IPQGAzRY
	YVm3FshS/FCJ0ZVVLUxgwCJP9KvUndX5WdPC9BPYxMo9+EtsWQwjoNrOWKBs12Jk=
X-Google-Smtp-Source: AGHT+IG5tS3kYUiCCRtnanVvpm0dBMkyeaNotcMroSTBo+RZ/HHESf9S7ra3pDeqhyi3AeZM8IcVgA==
X-Received: by 2002:a5d:5e92:0:b0:3e7:428f:d33 with SMTP id ffacd0b85a97d-3e7428f0fe6mr15632685f8f.16.1757501330343;
        Wed, 10 Sep 2025 03:48:50 -0700 (PDT)
Received: from [192.168.0.100] ([188.24.124.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca0e9sm6821205f8f.25.2025.09.10.03.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 03:48:49 -0700 (PDT)
Message-ID: <1b79e467-1d39-457f-a488-0f3eb9e14efc@gmail.com>
Date: Wed, 10 Sep 2025 13:48:29 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
 <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
 <aMEgNtjcy1-NuBds@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aMEgNtjcy1-NuBds@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/10/25 9:52 AM, Sakari Ailus wrote:
> Hi Cosmin,
> 
> On Thu, Sep 04, 2025 at 10:52:09AM +0300, Cosmin Tanislav wrote:
>> Hi Sakari.
>>
>> I recently left Analog Devices but I will continue to try upstreaming
>> this driver. After the upstreaming is done we can switch the
>> maintainer status to someone else.
> 
> Ack, thank you.
> 
>>
>> Here's the output for the commands you asked, provided by my
>> ex-coworker. It's for MAX96716 + 2xMAX96717 + 2x IMX219.
>>
>> Do we need to fix anything based on the compliance tests?
> 
> Looking at the errors, it looks like some fixing is needed, possibly also
> on v4l2-compliance side.
> 

I'll take a closer look at the failures whenever I get the time.

> Regarding GMSL, are the image width, height or mbus code used for anything
> by the serialiser or deserialiser drivers?
> 

No, not really. All the information needed by the GMSL drivers is
provided through get_frame_desc() ops, and there's no fallback for the
data type, so the stream format is not involved at all, but as far as I
remember it's necessary to be set properly for the media pipeline to
pass validation.


