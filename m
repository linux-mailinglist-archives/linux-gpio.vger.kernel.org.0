Return-Path: <linux-gpio+bounces-30274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 687BBD03BEB
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 16:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC68D3052625
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 15:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C8A38B9A7;
	Thu,  8 Jan 2026 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gY38rtPZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227B736A023
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880127; cv=none; b=aCRc9JO9GxbxAOfe09/VjmS2VQalub9EUAZdMBzS6YoV2dxfHd0+7WaIVqYVqQROOyfClLoCvAE6oc7uKRpJ1T87wtoMgQq3NPO7NkJcVPTv+X1bqePVbZjID6XPCWh7TScddp6t0w9gHQmWGywzCofcPKPu8IJjKZKnk496bt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880127; c=relaxed/simple;
	bh=n8N+CKAPIFoLszRlbHptTyBTVh52MW8VkHEm90TrFkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iW0KADk4Ih8bN+ZQTEy21DAfC+mssx6/h0QKJ1Lt5J/RoXuQOHp2zcoOM/GKiR8UPaPjo7Xn4qoN+GeqAzOUoDnrsV111Q80WWJvkkSVHom6vNuUUDnhDGiwxuEXzxkrK78B1ckUWN+hi2uuPIJQ/GuhFSBOdG9qX8KAT1PzuHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gY38rtPZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso23784725e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 05:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767880123; x=1768484923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VR5Near76uEpKL1uvgvz4fJXXRgjVyevYhLP2Yn9Znc=;
        b=gY38rtPZoSCg8hbUThaS3rVQehVutXwMMTXVf0KGk0lVNW3phcA/HJsGoLH+NHTfhj
         LuVn9hr9VSImtfl46K0W1c3ODafJEhqCc69/OikmojizlvWyUSA2wUrnkGlUPxHbDaKr
         Ss17biltrZZXe7A2TJQW2mu2RwRVoodq2ggtQYq0sV/pIJqLz/Z5YOfPsmWQiwgriONa
         swTbL0YySKbfYXAJH6BHMggiju11NjbQQiiMHtOyBPNiaw7cnU6nYldvDwpVxNaJgFFl
         LcFQ/MXhOByCwfKoseEx1bgtUcgi4gocI6ylNF1aDxD22U9tvTfz8sGNObmSTDEDR1/q
         5pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880123; x=1768484923;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VR5Near76uEpKL1uvgvz4fJXXRgjVyevYhLP2Yn9Znc=;
        b=TJIYUJRHg0Oeq4Cs5HdnXmw3djBB7nYZTtrNOn/56TXKgvAVfZQRAWdVxroVx6w7WE
         XkJxIb42uHREyAN01LVxDDhwrH0cptePtuIlsM7ZgKZnk01yjm0ejnH5//v+K3Mm+u47
         5WfPcHDwaX0uJgU4hcOXEUi9Xx6nhb7AtUIReGytfQSEWf4Cjeu6ZqNiFUzkmt/Qmcqb
         2HKD29HGaax7zu4uoeHTe8NAzj5TLwd2aomgRjecsMmTjQzeBntYswI1zRvh1qc3DWFL
         22Ij95xq0iANniMpTPJkjWxeM7GQMm4qFynuF+Um5m2RHdJ2QswJIHaBwvLpm2fPBWGA
         Qt4g==
X-Forwarded-Encrypted: i=1; AJvYcCWKnBowI4bU7MJjeBezdoFHihS2EhVvE4bnjNsMlWAQV2AWtdv28Km/LpPzEGg7XXsDRwbrGbaD8xOf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx18vVfrCuZLbM3bygFpMHkIh50mB+DZq8LX7VV05euU8GBMy7
	+IoPbBR6lwkZ3MrfqWnPitNkRQn158LVBDYMy6Sh7gpd+TKppNJ+h2Si
X-Gm-Gg: AY/fxX5GSp51grI3T2w8sGbsOPOoEUlzmj9YSP9QXOSqzKr1ptMblUX0zO24HqQgELp
	g7wgPS83Nz4SYxKWO4oBPC1sghHIfWGQUC1bvT1/APr6AeVvrwo/DU/rvdsKbv4ITrXS1ehhA/7
	L6olmpYmvmS1EyPeZMer8aIsbAGrRvpqBhV7NS+0D2gLW578/7afLpz/5p0xXrYn2Dg4Kximorg
	ZmrmqcvlH3vwI10B6/Hn8/+iGa6pyIsvgaes6AdSlxyIR9RxikpvRC1qpQyKFmk+xLqQN0zh5cq
	gZgZRBWCNi1ijSf/fzddXsFhmIMV0Ipicj2NuKusOTTS1VCWGdIvhCn/5w3juXLU28DAs3ZSjDC
	S7V0zUZPerL+aPFulnbSz7RuXqHjLeKpDm18VF9BPK44TZCXtn56RcJxGo4CZ38i/97Q9qNRNJC
	u/y+nnD7xs0tqskhiyUg==
X-Google-Smtp-Source: AGHT+IGpDU6JLfvzHqJSaoogrG0562//ALgzEHvj8Oq82kva9wo4Ahns8LraI5InqwBI5zqAJMVkhg==
X-Received: by 2002:a05:600c:3b01:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-47d84b34501mr70092875e9.19.1767880122785;
        Thu, 08 Jan 2026 05:48:42 -0800 (PST)
Received: from [192.168.0.100] ([188.27.129.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f70bc4fsm149977345e9.15.2026.01.08.05.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:48:42 -0800 (PST)
Message-ID: <44b41858-fffa-411c-b4c0-a0c4da8a497b@gmail.com>
Date: Thu, 8 Jan 2026 15:47:52 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] gpio: shared: another set of small fixes
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
 <2889f386-65d3-4f89-ac11-aa51e4384ed9@gmail.com>
 <CAMRc=Me5nNXU0foqToYs4W8fvbTZ0DZSRXAQ7rfHdbcoB4+7cQ@mail.gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <CAMRc=Me5nNXU0foqToYs4W8fvbTZ0DZSRXAQ7rfHdbcoB4+7cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/8/26 2:18 PM, Bartosz Golaszewski wrote:
> On Thu, Jan 8, 2026 at 1:13 PM Cosmin Tanislav <demonsingur@gmail.com> wrote:
>>
>> On 1/6/26 11:34 AM, Bartosz Golaszewski wrote:
>>> Here are three more patches fixing issues reported with shared GPIO
>>> management.
>>>
>>
>> I'm still getting some intermittent failures on today's next (which
>> contains this series).
>>
>> This does not seem to happen on every boot, so it might be some race.
>>
> 
> Should be fixed by:
> https://lore.kernel.org/all/20260108102314.18816-1-bartosz.golaszewski@oss.qualcomm.com/
> 
> Please give it a try and I'll queue it shortly.
>

Thank you, I can't seem to hit the issue anymore.

> Bart


