Return-Path: <linux-gpio+bounces-5584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F88A7CC7
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 09:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 825962820F2
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 07:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9E76E60E;
	Wed, 17 Apr 2024 07:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C+7inE7F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CDE657DE
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713337538; cv=none; b=l7o5lVzXPtdbLmCj1wdQ4JOChkRSLi7LVji9ESSe1q9eFiIPXgFw/aDt45SHyMFXvq1gVJPnq16TFFwejLFCfBjfIISoEe5y60Orw7AQxaEHsVJjImZXUNAkybe+7ai18RZQ2btgYp7utuI4oVXVu2+LONXFUQ7pFo24YPnNZrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713337538; c=relaxed/simple;
	bh=mcsr3csBU7bHGMkIHe2AoCdtg1CXoDmljtGVCug6ERg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzneiPtRhfkQWzzhjdWK74r7SMdNIW2TktmtDyqxynCqAas0zO00nqEn/il/z6vkcHQNQLq6UxzeAP8IQzJbs2a4jTfNLcAlIwQwrz/1/9yFKKLaPt+S7PryOKh/wp8gYUkZI5vzDBfrk67/nuJkjGwmsjSIxPeXqW1yPOQimFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C+7inE7F; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc71031680so5274252276.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713337534; x=1713942334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EkjVwN4rKPhkulRFdv6fIescIc1N6dkILoDWgTfK/5I=;
        b=C+7inE7FU7EoI73NvofWvGDcZi+oip2wk6yr/RLGNTRsq0EQyxLpC4wL4g+HbXJf/W
         Ovv3SHrT4u3AHL/zuxVwZdj+XKVRRJ05TTy7A9j97gXYH6BG+ujNOOKk6vpvT2hxl12f
         ZD66/9udqmuxyP9c752avMGq1N2oc3kwOpYQStgiEvhcUMQsnqydSbsAYaikBwvO0aJ4
         +N59Kg2J7Ect3+tH1kr0z+atLSSi1xzKvf4JNvG2avL1YnJED+gjvSXIwW9YhppBgHX1
         lC1Q+eR7tYq9AK6iAr0++bNj3NsaiY0kmrnMAa2G1q604AyoHotA2mlbDumO0NALYY4E
         fwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713337534; x=1713942334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkjVwN4rKPhkulRFdv6fIescIc1N6dkILoDWgTfK/5I=;
        b=tZy/mqFKVJ7KP/faiu6FKuEK2hUjF4MMAgAEPBt/PcV+XNDbTpexBIdYQHyfJAtVzf
         9yddJvEK/9VvvjdACI8yhJPrp7+uD2ileVlocOcZCOx0HBV/BhKo09SGDip2NU3o0a1c
         3j1eTvtdpvzWPmN0hTgpfuLlC3WZxktvNBormXih+e9koh3Bo+LnJpnCoomVrWF4KMq3
         fD3rIZvbqbgLxx5Xv8Ud5KMKP4xjdsUVfF9smpldT2obgRNo0sgH03meUUt1ksLK8K1X
         w2KC+/33YYjz9HhS/9qWnZ3FSLcVmrcrjQ+OgRj+xctthGrgGmt6DwEUUjPDY6XGZJlx
         vnqg==
X-Forwarded-Encrypted: i=1; AJvYcCVfH0RPF/HJNJPdU75nXX1M+D76tN3bMKgU3Cpik9kmWljQcFuJKnIOzLPwcfhTGWgAtfzqD1GSSvSr0WixfiMbl8ycmYjeWfbJTg==
X-Gm-Message-State: AOJu0YwZwOXaXkus4K5TkVuvF77MQFWGPEt6CsDOtDaISSWkLGEVDKyZ
	6ZzgeC9DmRnzuDAy8zgrB6PBtkaCz/Ul/4ZozRR/p8G31UcQSUKBAPa1fWjTSMqdIuGHTkV+nY3
	AXA1vA4kehZuVnIFBeMpf66ZPNtZo/qJ9RHBwhg==
X-Google-Smtp-Source: AGHT+IHd4i1ahSg32Wqz83l6dw/WilhOpfq2RFb1LUbBXluSLvsl6Ej9Qz8ZGcvBj9jzJA20eZYuz5z2/kQs2d89rq0=
X-Received: by 2002:a25:fe05:0:b0:dcc:b719:4e4f with SMTP id
 k5-20020a25fe05000000b00dccb7194e4fmr14247637ybe.53.1713337534608; Wed, 17
 Apr 2024 00:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415141743.1983350-1-github.com@herrie.org>
In-Reply-To: <20240415141743.1983350-1-github.com@herrie.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 10:05:23 +0300
Message-ID: <CAA8EJpo+xarzGbfy42U1NOBG+ieQXwHu85fdgLccK4-_6+bNzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom-ssbi: add support for PM8901
To: Herman van Hazendonk <github.com@herrie.org>
Cc: andersson@kernel.org, benwolsieffer@gmail.com, chris.chapuis@gmail.com, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 17:28, Herman van Hazendonk
<github.com@herrie.org> wrote:
>
> The PM8901 is used alongside the APQ8060/MSM8660 on the APQ8060 Dragonboard
> and HP TouchPad. It works the same as all others, so just add the
> compatible string for this variant.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Subject should be "dt-bindings: pinctrl: qcom,pmic-mpp: ..... "

>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
> index fe717d8d4798..43146709e204 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
> @@ -35,6 +35,7 @@ properties:
>                - qcom,pm8038-mpp
>                - qcom,pm8058-mpp
>                - qcom,pm8821-mpp
> +              - qcom,pm8901-mpp
>                - qcom,pm8917-mpp
>                - qcom,pm8921-mpp
>            - const: qcom,ssbi-mpp
>


-- 
With best wishes
Dmitry

