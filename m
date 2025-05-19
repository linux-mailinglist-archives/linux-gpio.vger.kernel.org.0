Return-Path: <linux-gpio+bounces-20304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E22ABC83C
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 22:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85F097A19DE
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 20:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9031D20DD4E;
	Mon, 19 May 2025 20:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="McoLpWvC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0AA155326
	for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 20:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685748; cv=none; b=QLzrx5BQeAC81HMrGocojrFnNmsN6yDj5/ev+TRzJNPIQttN2Bvx+NanbKB8k4/g3QYrp0+UU7Zzl7j8BgxRh2b02HX4FclfKVa9DqwLbWRML7cq/bkfBr0O+o5/FpptHva0/55Sg6/EIpL8eg8ONvz5arw+Yb2UgdZM+1UU6mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685748; c=relaxed/simple;
	bh=8dX8Wr9L4YGOHz+wjN+mZYVu8hwJ3J7H6NpKgGMox/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OjQcSiKZyWDNyYduVs3qxfLSLGCUS0OS4c3V5oPfFj1g+8klA4H5Y7esggxZKVJ8NvPJW+uNbbRLrvNxF821eYVe1dgtWUlDuhysFITeHWdKuRiJhvNURlc0L3A8eZRrvIr08b3o26QWkeA3axFVVlZNbDUtzCThSy7dYLpOtQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=McoLpWvC; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73384b2c7ffso1383984a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747685745; x=1748290545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxPqQrqptdt6ZRunnP9xjg4VsQBTXE7UdgcvpQp1vnQ=;
        b=McoLpWvC/nmgl4hDj9EwLeckCAoo+leQLspXx4bh9ImZrQf47pwCUDWTdKRnnHNogn
         ZUtD3L5SEDztK5Jh0rTftRqhzdKLWrKPI981NZWUwZ7IYrWawo2a5NDcbPOyLKibIh/D
         e+N1agNQgVEev7hx8R3jzncgmXsRiCckNodgNn6h5d3+ia+gM+j5F4Q3aOLYKcGyDf2h
         cFnUYjzoWGTG2js1WeQmkm4oJsL+ZnDtAgVathjQb+/7ioGepDPnL/msmyxHZwiAZPPs
         H2S4zU8HBbLKpq3cPmdOvzOHybV1P2RGFzs84TAK0242Ew/v2JEq2w5FJA/h7TJ6WUO2
         KJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747685745; x=1748290545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxPqQrqptdt6ZRunnP9xjg4VsQBTXE7UdgcvpQp1vnQ=;
        b=RSaECIQExUcGJ0SKvSpekk+2juJFhA0GrW19T1GyLJbzNBS8SleSAiwMB/E4iqJFhg
         m1QWZqzUUSIwNziTizsQCLLW/uDLp62tv1rsxXyyWjKAZrdvtauwRr7SoKMmJ7Gkn4hM
         HKKAqJx3NhzX9gvQIgn1ZAHAzS9zqtuZ3ldpTsDUs7/JkW9YoVj2jNhxeGQwyvgb9sU2
         ydKqx/4Na1dvJVJLh8/a8fR+VUJijrG+87zTCKY1g5S8D00Gk+BUilbXxXRmswyYm43V
         vqExqKWp432F8v5auwYLTsqjTbj7kJOGCRDihvaRNeV4GbYnW0NNE9vkcmyu+kPouvE2
         7W8A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0N16D2JomrQfbZTtEutsKGFreEisA6c58bDQ6LP2XnCMBFFeY9T9wU8j3trpU50pFcPysDV1Yy8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwhDbkNplc/Hm2datq5xrylbjDtKMOs/mJzbFJh9DTsH2x4z+ue
	aOdUGrv/W3QG0ZkMxx6hOfyi224q71yNoos6MyuT4/vFrEr4SCDII6TVxDA6131kpco=
X-Gm-Gg: ASbGncu2RCO+QCCVSIn5mvWgmsELGIkoGXK7xvT6eEpVIXQw0JIxCSvn7CGzE30pflJ
	7VwFSFOb5YXwWsSRmWiiH+4OCw9ns1cue/dosQ6B7KIkseKlTZMXg6KprAM9TCmasRS0fbdp1Xx
	ZxVASQLuzK7+l14DwAJB+UOA9t5fPrh8vVnU9f3+1LqM/exHWtNXnihk0NVCv6g6EVh0cNA74hx
	/Z4U2MGG4vHS1oW/S4zur4h6bNxiGdVNNFmEko2za9rH7Nr9p9iuLM11Q/7Z+dGwxiuSxh10Z/X
	byPk5Qdz5kNXEOQbuHw/V5SyPoj8/h5oOtTWgM/JL3OCqaQThlufdG5esiDNi00o39+WpnjI3IN
	UbwcFQllam11+Mffe6kVNHsJhtmPj
X-Google-Smtp-Source: AGHT+IHnM+ogubTeRYfZUDZjML14fl+Syr5GdQv0cHx7rQtXJUm1hDhfIBt4qdixN9KogS4f8h/scQ==
X-Received: by 2002:a05:6830:611c:b0:72b:8297:e988 with SMTP id 46e09a7af769-734f998dc0fmr8973347a34.25.1747685745325;
        Mon, 19 May 2025 13:15:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4118:1770:ecaf:ee73? ([2600:8803:e7e4:1d00:4118:1770:ecaf:ee73])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b5f697sm1541527a34.57.2025.05.19.13.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 13:15:44 -0700 (PDT)
Message-ID: <4843ec52-57e2-418a-b640-8e05ba60959e@baylibre.com>
Date: Mon, 19 May 2025 15:15:43 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/11] iio: adc: ad7768-1: add filter type and
 oversampling ratio attributes
To: 1aff0f813bb3fee55c5483be860b6885abdb81e5.1747175187.git.Jonathan.Santos@analog.com,
 Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, andy@kernel.org,
 nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, Pop Paul <paul.pop@analog.com>
References: <cover.1747175187.git.Jonathan.Santos@analog.com>
 <1aff0f813bb3fee55c5483be860b6885abdb81e5.1747175187.git.Jonathan.Santos@analog.com>
 <aCtmt+ozqSRDGQxi@JSANTO12-L01.ad.analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aCtmt+ozqSRDGQxi@JSANTO12-L01.ad.analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/19/25 12:13 PM, Jonathan Santos wrote:
> On 05/15, Jonathan Santos wrote:

...
>> +
>> +/* Decimation Rate range for each filter type */
>> +static const int ad7768_dec_rate_range[][3] = {
>> +	[AD7768_FILTER_SINC5] = { 8, 8, 1024 },
>> +	[AD7768_FILTER_SINC3] = { 32, 32, 163840 },
>> +	[AD7768_FILTER_WIDEBAND] = { 32, 32, 1024 },
>> +	[AD7768_FILTER_SINC3_REJ60] = { 32, 32, 163840 },
>> +};
>> +
> 
> Since we're still discussing some points — is the `step` in 
> `[min step max]` for the IIO range additive or multiplicative? It is not 
> clear on documentation, maybe on purpose or I have missed something.
> 
> Here, decimation/OSR doubles from 8 or 32 for SINC5/WIDEBAND, and is a 
> multiple of 32 for SINC3. So I'm still unsure how to represent this to be
> clear to the user.

Sounds to me like sinc5/wideband should be lists instead of ranges.
It is only 6 values.



