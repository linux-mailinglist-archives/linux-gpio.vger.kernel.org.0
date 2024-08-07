Return-Path: <linux-gpio+bounces-8645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 523DC94A3F0
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077CD1F21F1D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26A11CCB33;
	Wed,  7 Aug 2024 09:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsP4a6VV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A22F1CB32D;
	Wed,  7 Aug 2024 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022119; cv=none; b=gv5DaPV23sW/Rt9XQh6ycvAbRdZsmQLZrP0miXCuYMgMO+ki6aCNB2yq5LhcGMjlAWaNXsQpOiMciq1dMqpBQ0onSHTM+7MZrkNrmZGrhzf12u8yNNbKe9asBTrmqMS4TdWPx6W1BNjRsDQYaHDm2F7/OhLQd+s0iwX2cWJsd8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022119; c=relaxed/simple;
	bh=WAW4WAbZjj7ozQQ//z99AVwDz5MUPaFuGqSugyGLIHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBsKXxP6UK3O9mLzsj7ZW8p+l7P7O9Vyld52h0twsTm7H0y8+E6LxhcWPiTYOLMialHYkbQlRW5HIAH2OiOv4f3TD556aFInEIOflN7EB4d3fJoKa9P1jI0W0ojlMECFe/nU7hgoxZfCvUlsfjcWGNu2KW0QyubFjcvGu01OFz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsP4a6VV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so10405665e9.2;
        Wed, 07 Aug 2024 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723022116; x=1723626916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WAW4WAbZjj7ozQQ//z99AVwDz5MUPaFuGqSugyGLIHE=;
        b=QsP4a6VVHVuZJQenqtlZbhVbSmsGh6nI2Broa2X7i0Zldr4fySMmkqqrJcxFAfxKKe
         xla9gioj9GKNinrk9SBt3dzEwnIrzXL2c7USwJzlAESHNRQSJ2Cl9dkUA+i29Xe3UUCU
         Eo/mjeM7g7nZNPbkCraPDu3wkKqlC4l/0jkJNg4LlrbEvlYBloE7wE/E7pWxUmD5ucmr
         VvytPqTaxi7zDfitG3CgfydIZJjv7TIgv0MwxlQjdAZLzqQGFVJaYPuhXS2wve3TApfv
         2uy+Tx4vu6pk8mXroiOe2I8OorLmPCPfP/nU2D4tX4wsevt9Goa0YWJsJxMrOk/ra5y4
         umqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723022116; x=1723626916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WAW4WAbZjj7ozQQ//z99AVwDz5MUPaFuGqSugyGLIHE=;
        b=n9Y2+YQmdbkZDeFKMo6VruDQz2/OgaJ4t9JJNMpL/567vRye9UHAJuxrG6cpCV98X/
         nlRGf6lS4QunWPp4Akf7FjQde/lTb4qnXA+X3v9UItIIYCmX7MmqHAWguiOQX1WtxVRw
         jy3CEeZBd8upL4WtmntwPwlQbtTz2nc6p5k9z4PPHB+UvXwvCG4CNjQ2AI9TgvCA9Uma
         zalWht+SU4Ya++wcO6AMUqIKOpNYREulV9d9jYzggLWh3niFD4qnYqhZPIhVBgXvC7MV
         5K2NaCc+RJGqYLmbQnGhYexrJLmtcXSEhBJ969GDYXiOTp45ZZ9XDxRp9Oh6ZJ8rkJns
         C1zA==
X-Forwarded-Encrypted: i=1; AJvYcCUIrSU51XFXkgY3BsVnANw/UqQmC6fpOxHH9VMrSK7VzEzieukSDHwu2mzHZLAfL8KCRzLPzndZNy7CkptqIZHIc+dDEQO/ifP+cB2zHNc/F9969OxQBQnqwTEcW5lOkLMQw5TxNgRxtQE05wIKnY438mUilk9pgPhEFV08LWzea/Bf2Ks=
X-Gm-Message-State: AOJu0YxypeYeolRH5pHTIkxFE7QDGc7tzGwbYgcYDGvjLKO57PD7dzYo
	uQKtQr+6gTxmvvgklv4rE+NDbIANka23OqIToHJFE8cojcZOGHiOTsZ+lAff
X-Google-Smtp-Source: AGHT+IEctfEJTlJWJclkwAwP1qPj01sRRAwqzgxnUWqm8NUgw9LRmDGW/K/imyM4MujFwSU32871aA==
X-Received: by 2002:a05:600c:1987:b0:426:641f:25e2 with SMTP id 5b1f17b1804b1-428e6b7e80bmr110889905e9.25.1723022116273;
        Wed, 07 Aug 2024 02:15:16 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290580cb80sm20162845e9.45.2024.08.07.02.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 02:15:15 -0700 (PDT)
Message-ID: <a1086e31-4738-76b4-38e9-b494aa39f1a3@gmail.com>
Date: Wed, 7 Aug 2024 12:15:14 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
 <f217cd23-88a3-e8d5-641b-482734c8f2e0@gmail.com>
 <84283d1a-fe69-4adf-a93f-8d31a7a18c63@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <84283d1a-fe69-4adf-a93f-8d31a7a18c63@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Well, thanks, I meant the "From" header. Although right as

you replied, I sent the v2 :P. I'll just wait out for the review

notes and send a following v3. My bad.


Best regards, and thanks again,

Ivaylo

On 8/7/24 12:09, Krzysztof Kozlowski wrote:
> On 07/08/2024 11:06, Ivaylo Ivanov wrote:
>> Unfortunately, it turned out that I have an issue with my git
>>
>> configuration. I'm sorry for the inconvenience, I'll resend a V2
>>
>> without the sendemail.from.
>>
> "From" header is not a problem. It's ok. Did you mean something else?
>
> Best regards,
> Krzysztof
>

