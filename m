Return-Path: <linux-gpio+bounces-10679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC9498CFD3
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 11:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44F95B26848
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 09:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E9519E99A;
	Wed,  2 Oct 2024 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ct9U8oS9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364D197A65;
	Wed,  2 Oct 2024 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860205; cv=none; b=lGbbB4ayH35v2uf+NzkI0kjtNz0LU6eJKNP8qwdZF7YIMd6Io00qD1MqUwbGMz8qNpMs+h6qVV1WhaueZzhVOvUYBMk+rH8S+wOSMjzdRCSiMDv1cxjVMfK0YblGkaC8PJ1e1jhlaDd7df0BvC+i85pXGujz627Zfqx/51PpAM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860205; c=relaxed/simple;
	bh=e7Iv3/Xxs39jmo3NJG4BFZ2WeV5KTVOV4SbGbgyU6xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxryrpa5u6WIvfs8hUvNhtlWlv4LYQlVq1YW1p7sz7mpxFC+mQ+gmh4RgA+SCLUDy1zfiftJrsOmovMNZQgFresvLZ9/H8r/pq+zskat4NA+zIejaG1wAKuxIZT/pa7G1T2y6AOpHiEvV8vH8SevRhvRFP9Jg7ii74NBZl2UZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ct9U8oS9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cc9aeb01dso3697189f8f.2;
        Wed, 02 Oct 2024 02:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727860202; x=1728465002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kX70lk40Zjcsd/aT69QIfJewD1Y3gv6yv7IZeOydp+0=;
        b=Ct9U8oS9gd85TGvXiJoqEq1YwunaYUgatzBk1JXUeFAPAQwsvbHarRpuQl77Ah8xZh
         K7YfjWDUwPz7S6pKZ1ChDg1JSAO1n4tCdtmlpT77PINceNn1hXhtPBLOm6t/d2Dkd3gt
         wdQsQazVpzrBI6jsD8YAPeSIJW0zHKEjMkZC037IGJJtv5ESmFpOWOMUVRE4pjW/tFfu
         EBZ6z1iKeuGl4Y13o/xbCUgS+xatuzxQokgAujmCRDtHF26S1Z86lRJ36sPruC+BhBmc
         RNJT1y7PSJNXFY5OxxLDJR+uR1NAen8hvtzsgXJ2owd+duz83Gw9oMj25zL0JtJ1IWfK
         q1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727860202; x=1728465002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kX70lk40Zjcsd/aT69QIfJewD1Y3gv6yv7IZeOydp+0=;
        b=b3OU8oZQtyy/UfvWzVpdO8Ht8GBHqjrIjttsEHrrx6N+F85QKPApeDavFWTzohOJmj
         Uh3qEN50tBKzUs9BUGFqSuw5ZkzbJHHVbie8K+DLC6+2PeGMXrdpk+iaCKbbO+N61n8N
         yQME2+/R0NP6wmAPmkue4e6X8jesqY51FtnuDVNNPrj1bfo8nqKzxtbLLTcMeYFKsr7H
         OG3EvknaVtlWl0Glm8CCbB2PLdahR2pAa69WrQFpY655/0f22SXocB4Py+lUv9sCSKn1
         +F63h1jbq4OSvhusXN4KAiVdxSVCmFqRQA+iu3IKKAqUXv6ogI3abHecWcjbGIymM1Ij
         Hc3g==
X-Forwarded-Encrypted: i=1; AJvYcCUca5nRIi6XUqmeO+WNHygFeb+KqJbFbULcg3jyUPnkZkEY3XS3r2FmLr4Sl1HKplHLKU4Uw9oazFGzlTb/@vger.kernel.org, AJvYcCX6qZ2DpKBJQFZLNMUjgMlWSogmJcVELN99IM5Rka/uP4G4JK0uaG8FUrFgMo6nuYGgKBgP1ttu1TL98g==@vger.kernel.org, AJvYcCXFw1vD6/zGuAfmpPWcyDI9c2QAE3dInd3oOT9C9Je5fKmj+Xx1vBGqIniaB0qzFiYt1jzIZk3bQZXd@vger.kernel.org
X-Gm-Message-State: AOJu0YwdIgU7OSn1eQszh5vxacgaSAdD3uVywS0Z22N6sUsXDGktvlsN
	F4IJgEOnS+SYqlE69zpNCi7+Qwyn3Cz0VNjlsOty5WhPr9EJHJlv
X-Google-Smtp-Source: AGHT+IHv0Yz0eKOXIvUq7+8mad7L5nNx6OQu4RJZGzezPs8mhCoS/uKNpQV2NFZfqfMr8EDurKYbCw==
X-Received: by 2002:a5d:4e03:0:b0:371:88b9:256d with SMTP id ffacd0b85a97d-37cfb8a1e57mr1591668f8f.6.1727860201506;
        Wed, 02 Oct 2024 02:10:01 -0700 (PDT)
Received: from [192.168.35.18] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cfc262852sm1344494f8f.41.2024.10.02.02.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 02:10:00 -0700 (PDT)
Message-ID: <d9edef6d-bf73-4675-9033-72467eaaec4a@gmail.com>
Date: Wed, 2 Oct 2024 12:09:58 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] Add minimal Exynos8895 SoC and SM-G950F support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
 <172785576336.22676.6859433470666367416.b4-ty@linaro.org>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <172785576336.22676.6859433470666367416.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/2/24 10:57, Krzysztof Kozlowski wrote:
> On Fri, 20 Sep 2024 18:44:58 +0300, Ivaylo Ivanov wrote:
>> This series adds initial SoC support for the Exynos 8895 SoC and also
>> initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
>> dreamlte.
>>
>> The Exynos 8895 SoC is also used in S8 Plus (dream2lte), Note 8 (greatlte)
>> and Meizu 15 Plus (m1891). Currently DT is added for the Exynos 8895 SoC
>> and dreamlte, but it should be really easy to adapt for the other devices
>> with the same SoC. It has been tested with dtbs_check W=1 and results
>> in no warnings.
>>
>> [...]
> Applied, thanks!
>
> There was quite a mess in submission, so all patches had to be re-orded and
> split. Below commit IDs might be not accurate.
>
> In the future be sure you organize your patchset per subsystem and correct
> order of patches (bindings are always first).

Alright, thanks! I'll make sure to split patches by subsystems in the future,

especially since I'll be upstreaming Exynos3475 soon.

Kind regards, Ivo.

>
> [01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M2
>         https://git.kernel.org/krzk/linux/c/d27c76fcd4190cab051543b2ffa2f183a6142c0a
> [02/10] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
>         https://git.kernel.org/krzk/linux/c/7f6ea7198e8350ad199bc56f524ea2cc753f8ab7
> [03/10] soc: samsung: exynos-chipid: add exynos8895 SoC support
>         https://git.kernel.org/krzk/linux/c/e6bb0575953f3f850f5583e9adae3260866e0cbe
> [04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
>         (no commit info)
> [05/10] pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
>         (no commit info)
> [06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
>         (no commit info)
> [07/10] dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
>         https://git.kernel.org/krzk/linux/c/496374c1d0045177cb5c3e85ce33b2179b11a413
> [08/10] arm64: dts: exynos: Add initial support for exynos8895 SoC
>         https://git.kernel.org/krzk/linux/c/dcabaa8ae457647e334bbcaf21f9209315e8f752
> [09/10] dt-bindings: arm: samsung: Document dreamlte board binding
>         https://git.kernel.org/krzk/linux/c/2caf56f6cf69b026749a2c6c8ad083e5c47b8362
> [10/10] arm64: dts: exynos: Add initial support for Samsung Galaxy S8
>         https://git.kernel.org/krzk/linux/c/296621bfa3ddefcbc4a3c1f64f6e868680a1be59
>
> Best regards,

