Return-Path: <linux-gpio+bounces-16048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F6A365C5
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 19:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE17B1894E6E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 18:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2604318A6B2;
	Fri, 14 Feb 2025 18:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/Dge0QB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA82753FB;
	Fri, 14 Feb 2025 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739557983; cv=none; b=jlPYrjAHT5IxDHPCLHy0T9yA3uyAIxjZZognqFuKEmTUfPTNYm0DBqhkeNYsjFFZ2WlmgHDOrwIodj4tWQZZ7tI5mlu3qSIrt60c4hqSfxr4PPw3u0xw2U6GTMxdFH6I3MoKEy2b/2OfHgp3P5WGf9TZXSATvLlSEisdKyo3bHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739557983; c=relaxed/simple;
	bh=pnFOH8zhYm3oS0wgYnqRw3S7bqSx5fgMtfVpnVGf+QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLtgCOcPhcx7wlu7hfptVX/XvHAfbrhcjyXPE27zlmiOuqm54+Sxxs/3H2kXcaG2aEzX2AhtRtunRQpZrXQ55/hquhlGzkToStOhCW6PxNsPkCvTjyhhGi2fONutdcQFHzaZy/MDz+F8xHWE5Nxt+t821KLRTEyMwIFWGLQi6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/Dge0QB; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so4488628a12.1;
        Fri, 14 Feb 2025 10:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739557980; x=1740162780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbdDOQ0AnP4Rf55zqYAzOFqcv0dQXTgldFGn2OhR1Xk=;
        b=j/Dge0QB82hca/rtRFqWjIimYamcmIxbmUt8x5oSbMbFZpuwaaama8NRCgzBLuWVJM
         bs+Y2f4Hl8IQY0E7R2+lpWo2/ehPFoZLU91CDqI0JF3IloOIafguF7i/GXDG9PW/ttIm
         +Z1C3jwCkUB38Amgvwlg2PsA/ZoJmrK5HjC/YSBuPG9voKPeMLI32Rf1NdkaEqabqJBL
         Rsu8vxwJrcSlz2NOTXA9uRH1bPFZoiPIqGPN3H+A9amrU0naaVxm4NiyYzF2eKqqiBH1
         3R5uJb0zQtd9to63N4wOoLrINPdsNwyG7A6TCnhoqOk1+KaCxa8e48C/uuYDAwPxY1oT
         Ejhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739557980; x=1740162780;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbdDOQ0AnP4Rf55zqYAzOFqcv0dQXTgldFGn2OhR1Xk=;
        b=PMaW+FFf25klGR0bJM9vwVT3kFB6bsclF0PtChoYMFirJna69FDgfHaaRpT4w3+MQJ
         DRX97GSrWdVHC+SaOxqNN6emn5oOB6fJS5GNeITpvfFAYncLxWfu31jsSTfq5zPluZBl
         LIyNOVkcaNyLVOVfRq4tmCvRFluyw4d7Hxnqsm4IhFPmX3LPMFIRrxHU8nbX455qeRuG
         MJqM1XLZZqWPN5dolxtMwOFnT7ZBp885v2fTbJXPrfBKEPjjrZVHLgoevDwLVmL4+yxY
         kOBVxL8Pgg+tvsJs9+zfogTvZfIqxCLPqtEu0YOlpTKNn8x8Lb7JS489Y3yV1gRK8/YD
         GAkw==
X-Forwarded-Encrypted: i=1; AJvYcCUWEJel9nTWj05nv5AjuBiCLZehH9WRYrCYpA2m/jhwWNKaaQcVOhLSAnMqr/T1pLYiqveZ7AfP0gJq@vger.kernel.org, AJvYcCX639OKzj5IYA0aMUw5JJRJEpeMCYQkTALUSDbFp0cXxMw1PqE8vZKeYXVf+BhsPSAF5bzYLhSWHW5wUUhR@vger.kernel.org, AJvYcCXErrZZTk9/riqS5Dt2/0EP+xJwyIe1ASkQNLAVDdjd0LfnTriJhpIsgtq5f/g2fGtBjSskZy4cAks1dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhduO8znAO+eOkx4tPDyQZ++9UBx0/IeGjzDGepFChZosQia72
	j6UqY24BZ48sL9H5rfTpCxj/vq+Nq/Z0wewcJmuntMmkLawBzRNI
X-Gm-Gg: ASbGnctf3ewv9aW2mT19I2JUYSS8NY/GtK06/P6e1zI4WLC4/dQsgCasFTjOr4fNeKf
	F605VC/OEDJn5kQ2onwYuuKsq2rbNuh0SvTrDVfa75fMJ3Pdj1S8NBF5SjVznLgtwNy8fj5YnQN
	fBmcBYD4KJZOblmiJVWf9GKksTj5mR66Gk0r1BbUs8DaGcfs1RltWTeciAK4dUnYZ4F6581o0l7
	n6Wd+FBeESd5kZH9D65nEsYHbhTlH0bj6a+mg71juNEtNltsW+qQ++FAZxd4wz9A9h6wSInWPiQ
	YvnF6YM7xlFyanH5Si1yhmxHbxFIePw2AxACentw0+Dv2vW/EJlrKUopOBrQ8IjLqg==
X-Google-Smtp-Source: AGHT+IGAmqQcNVs3j79OGPjj0iiEgipG+7uUlLGnwdrB/uxsXc/DrOZaoQIra7ijKjdssLi9bJXvJQ==
X-Received: by 2002:a17:907:2da0:b0:ab2:ea29:b6 with SMTP id a640c23a62f3a-abb70d67772mr18427366b.35.1739557980167;
        Fri, 14 Feb 2025 10:33:00 -0800 (PST)
Received: from [192.168.50.244] (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2880fasm3248852a12.78.2025.02.14.10.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 10:32:59 -0800 (PST)
Message-ID: <7a055e68-e72a-407b-bcf0-5f2ac43929f7@gmail.com>
Date: Fri, 14 Feb 2025 19:32:56 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] pinctrl: bcm281xx: Fix incorrect regmap max_registers
 value
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Christian Daudt
 <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
 <20250207-bcm21664-pinctrl-v1-2-e7cfac9b2d3b@gmail.com>
 <CACRpkdbwVdEa_xgR=wRfkPN2_tpYGnbdpQkTtvgDMRSKPT-GEQ@mail.gmail.com>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <CACRpkdbwVdEa_xgR=wRfkPN2_tpYGnbdpQkTtvgDMRSKPT-GEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.02.2025 10:03, Linus Walleij wrote:
> On Fri, Feb 7, 2025 at 9:02 PM Artur Weber <aweber.kernel@gmail.com> wrote:
> 
>> The max_registers value does not take into consideration the stride;
>> currently, it's set to the number of the last pin, but this does not
>> accurately represent the final register.
>>
>> Fix this by multiplying the current value by 4.
>>
>> Fixes: 54b1aa5a5b16 ("ARM: pinctrl: Add Broadcom Capri pinctrl driver")
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> This looks like it could be causing regressions so I pulled this patch out
> and applied it for fixes.

Thanks. I assume this means this patch can be dropped from the next version
of this patchset now? If so, which branch contains the patch so that I can
rebase the next version of this patchset on it? I've checked the "fixes",
"devel" and "for-next" branches of linux-pinctrl.git[1] but did not see it
in any of them.

Best regards
Artur

[1] https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=fixes

