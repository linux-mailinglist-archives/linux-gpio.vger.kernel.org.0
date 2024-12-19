Return-Path: <linux-gpio+bounces-14006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9253F9F770E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A76A41624E7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3568217717;
	Thu, 19 Dec 2024 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YF8O/PCe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A44821639B
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596153; cv=none; b=ovlfRhnghYjDd2wYIZUwTvtbxFFqGxJecib1Qa8A4LGLQPmX9s1nYjU9JWON8GLbQNwg2H7mCeLI9fZ1Gv0i1wCsYx+aD4yo/eMBtBRSY56YpUTdCQvC2Qk2yR5yJQzNpmKx+l9sG1aFdPApEI4AuNU8fwQuBHm4f3rNxeQb7Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596153; c=relaxed/simple;
	bh=1Pa7ZqK8jBJ9o6HDfo2fK6P6onPvi8M5AseR46YM6Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaNFXP38Z5UZ5mvMjwlHlQy7dyyOFpKq/p8L/aydcpMSJ0QAKZ6JkBWxDZXmW+TZNjIUuICgIR2JiyrHNWKljQgOFsSPCPTcQtYv203eQa38V0TUkHTmCNDIGkaCF9MHFjH9bSEaYOFaGF1MSAItjOXRJCQ7fVHpEgtgFWNA8b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YF8O/PCe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so795075e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 00:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734596148; x=1735200948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R8nkKPNVeuZfDWhVmISypup3R+4qveiv6WjtfKLomVM=;
        b=YF8O/PCelwIgGTUoekeovDGYmBUfJZLYHgzHI8k3vB76+oG/NLCgV901xfQKkBlrsf
         j54cv2zdUSuYUOgQQt59X22ivV7g5qBjkuWxIMqv23EVRb/FKHWolLgsfwruB1Il25Rc
         fN9DhT95aJ+UAVZBonm30W4wF3U/kug/7paneADsQeaCmABJrcfld/O2BO2UiUOY2jKP
         wXUcoC3O1lJDUWXrKCoi/Q9fe35iBX7976nRdZgvSBqLa087qyjhaRTv46ij/Gzyu8me
         zVrbzliWd9mDFq/s3CDkkHpDG7wk+e80GM60e89lk8euXKu55+fvYs+o6Z2voyEwOajG
         6zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734596148; x=1735200948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8nkKPNVeuZfDWhVmISypup3R+4qveiv6WjtfKLomVM=;
        b=IwGszCC9p0ztegncERmTDqrxzrrChh7zsc8l7VaXqbDsue1E1GkaZ6RJTp2tDUL3ew
         wXJU+z/DfaJEbrVJdL7O/p73ooWfop3Tt+Q4xF7eIIQHx/k+ayTmZvA4n31gnsTYcCkT
         SFPiAeacQvfAVviveHE1Qcwnns+F3hqBJJc7NIL9bJLPjNzhvJX2H+r1aXwxGap/GuAW
         61B0PH+d0X0e7bV1gpe7+SRoXsAH2FU/JZmpWCxo/ta6VdsnW3QA32t1Hf+LbvCdJaF1
         aRAl4aihagV9R1NlZqxUXFpC0sp/17Mh2nMIserpSdQCLgkM+G1V+w6+cl8SpkcQ/spJ
         /b7g==
X-Forwarded-Encrypted: i=1; AJvYcCX2w6+aNU7a9tyYoLrMMRXaz3kTQmdontSM1IAuP0goi9W3wzG7LNPgZCWwva4fF1TZbaTw5pp8Be7s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy25rss4QGIK70y5KN/W7T8H8wO+IVD478OCUf3kUNo0YmlAdId
	ovQc9CZUKy++HQoIbYY6Euzi3pqbP08LhvumuoCoc6OJedi4WD10VGaG6IELhhU=
X-Gm-Gg: ASbGnctFNYvAkUbtWDTINM/iWp1Vzh0/fyXxfPZSrK3gKDYapHQh2zzV41AH+LySweQ
	pkMOkZBQS3kj3b0WgRhChohU1ps/7smjnZV5D2lMyfFNjRuxuWjvpI2+uCq/nN+R/ZjUgcZGVIv
	cq/ftgt1LWcrP+p3xobxk1vWpdFIiH3KMYSX0y2Q+onTK5eKhwD3au0031Twg/x+P7mahgWL7Me
	hyuZxXORXjDphrqzSE4t5pp7UXKJWv1C5pkW503GA2xCRK125LV6JWbeG0HvPr+gExLxSqSyJVE
X-Google-Smtp-Source: AGHT+IG20Dvi1Dz67p3T/a6LyvS1PnaCCT3e57rdfQ3NKuFlKzLHvMEgrF9Ihf72tkGDhtPx/hc0BQ==
X-Received: by 2002:a5d:59ab:0:b0:385:ed78:e188 with SMTP id ffacd0b85a97d-388e4d4f60dmr1851988f8f.5.1734596148550;
        Thu, 19 Dec 2024 00:15:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8330e0sm931348f8f.34.2024.12.19.00.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 00:15:47 -0800 (PST)
Message-ID: <2867cd9e-4de9-47dd-b4e8-c88f78b1113d@linaro.org>
Date: Thu, 19 Dec 2024 09:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs615
To: Lijuan Gao <quic_lijuang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
 <20241219-correct_gpio_ranges-v2-1-19af8588dbd0@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241219-correct_gpio_ranges-v2-1-19af8588dbd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2024 08:59, Lijuan Gao wrote:
> Correct the gpio-ranges in the QCS615 TLMM pin controller example to
> include the UFS_RESET pin, which is expected to be wired to the reset
> pin of the primary UFS memory. This allows the UFS driver to toggle it.
> 
> Fixes: 55c487ea6084 ("dt-bindings: pinctrl: document the QCS615 Top Level Mode Multiplexer")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

