Return-Path: <linux-gpio+bounces-12204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E01FF9B2AED
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9D01C21709
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D731192B7A;
	Mon, 28 Oct 2024 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIo20fPT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0159F18FDA9;
	Mon, 28 Oct 2024 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730106351; cv=none; b=hfjnnAOB1fzNQpAN7gaLog4QaqJ8KMM65kHyYMSTkCXG8Ucn4kr+H6ResM4Mmc7uyHV+mBY0weq2hIwC7AYW+aBpoFvItuFR6dFl5t2W6x8exTV3rxYyybOvYEsFigRMyo7W8sS5fFCcBHtBnlikOFdZHEat8njB5nq3TdlGb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730106351; c=relaxed/simple;
	bh=Yl9tw+O6QkT3U+ZD6myaEFbVQQyXatx99EhqWNJNGhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhBFQdc67KF8eYrKdBmI9chUOJelKxKkjqLx65bzGFFeUY/bSvMXpcVH9oZ0zK9qjDoN07F5jDX58eS5VPin8cXPjPPscgrFoKU1Hg/H9qupJdPgTHeywQHgf2oWq7Jdma8FjLv0GxPslEEXE4Qcbh5rm7qHVZ1t6qVQ19k+ww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIo20fPT; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53a007743e7so4584548e87.1;
        Mon, 28 Oct 2024 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730106347; x=1730711147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/iW3yVH/8NOxTz24X5gK/GWbyqWrPL3AoPPa5qKSu0=;
        b=BIo20fPTYlUGQ00m+/Ls8TjyXBpKpXv3TdleU8s0FeoRkSN7YqR1HpuRFnOVZ6w36c
         9w728U6AjEYdq3rUgjVXY5FxVHJC78P4oQQiokyxuc64IWhUZRJ+gV00LPwh6dSe26bT
         4mkL6rRJFEaSD/OnzY55Ccs7Er5/z/JetUFCpJCnKqnDj2s1/bxfTCLWBiN02N+wTri6
         LWUhhXcaNU3kO8g5cF5OkBONrhmpHzbE9lWahY0Se1WjdqJ/PkmVHgkZcZBWsnp6YQ0n
         nj7kXvXTFla+3NiqNH0Rdq3CWfL9Xn7Wx1PIkWgVfhdazfmAfezRF+bxulPl08vpqw4t
         Uvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730106347; x=1730711147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/iW3yVH/8NOxTz24X5gK/GWbyqWrPL3AoPPa5qKSu0=;
        b=J+XP6Pf9xZqV70yqgMK4ldYLKkL5U/fi45uAowGKK/hVfKsPzCiZHIF4vlK4Gq8WTi
         gZ9nSmfPEdonaQ4O1t8YwoJi3zBTFnWmpFzCb0oe87r5a0j8PajD+88ZtH1Q1VNnm5Su
         xLeNsSKjjnLn2bqpL32o+D6n6kZmPDEpBRMO2uKoqkfZvueHlCIkNbeXXto6DfWHkwBF
         /eb/gDW9r+n27CRxAgUce3qr6s90Vhxoqj1Tkb66VKqrap9APv2BYunOw0o/i0OUiCgr
         h8KAKTHyco0IUuFGW66+6Ws0qEBVLyIoDpxw8e2RAbz0eJugTtRLrigdkmAbrixO05PR
         YAwg==
X-Forwarded-Encrypted: i=1; AJvYcCVgIfHyxuZzdzQCaSTTNR4rMWePIAMU606IJhmY6MsJaDn4o7G7inFYwk0N/KyKAsYIE6axyWxsCJxENZ3Uio4FzmQ=@vger.kernel.org, AJvYcCWMJaL+3ht6L+pr/k8yX1TDJGeSAQwmPSogiFZAjT8QJjuFOPpn4yNKLxgNMlNJPSJHIlL8PSS7t6Z9@vger.kernel.org, AJvYcCXh7I1uLAzltOB5QxvCGDoHYBELUn4LahtODaut7v9SVmJ2hl0ZIW063M3uwiubUGeCbW1AaNgCFcxGJxwv@vger.kernel.org
X-Gm-Message-State: AOJu0YxCveZf2lCJukr7Dn051Q98+K74he1LMxgn16LPsU8oCSgegubg
	vMGBbvACXh/WXbxoZ3BG+rAnv93KRBIHb31wNYA2kuKO2fUj5KFY
X-Google-Smtp-Source: AGHT+IHVmBa4H7k9JQ/o53S5M05CX0LrglesNv2ZgvT67Tu1yo4p3z8ZUDhwTdaMItW4S/l4znHmhw==
X-Received: by 2002:a05:6512:1389:b0:539:e2cc:d380 with SMTP id 2adb3069b0e04-53b348e53b9mr2411570e87.27.1730106346700;
        Mon, 28 Oct 2024 02:05:46 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1ad9dbsm1012807e87.159.2024.10.28.02.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 02:05:46 -0700 (PDT)
Message-ID: <5784f869-9094-44ce-9d18-88015c29ed46@gmail.com>
Date: Mon, 28 Oct 2024 11:05:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S9 (SM-G960F)
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-10-b89de9441ea8@gmail.com>
 <c3b757c9-3232-4429-9f3c-d57ec76fb26b@kernel.org>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <c3b757c9-3232-4429-9f3c-d57ec76fb26b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/28/24 8:50 AM, Krzysztof Kozlowski wrote:
> On 26/10/2024 22:32, Markuss Broks wrote:
>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x80000000 0x3c800000>,
>> +		      <0x0 0xc0000000 0x20000000>,
>> +		      <0x0 0xe1900000 0x1e700000>;
>> +		      <0x8 0x80000000 0x80000000>,
> This patch was absolutely never even built. You must never sent code
> without at least building it. It is not maintainers task to build the
> code for you.

Am really sorry for that, this change was cosmetical and I neglected 
build-testing.

This won't happen again.

>
> Best regards,
> Krzysztof
>
Apologies,

- Markuss


