Return-Path: <linux-gpio+bounces-26034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDAAB547E8
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 11:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E95A164194
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C56274FD3;
	Fri, 12 Sep 2025 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dsghq8gn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0042698A2
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669732; cv=none; b=qovu7ahpTaoqpUOTrx+9Q4ZFZStgUHMWQ7zQHDs15PD9SDye7J5VgfKHarM4a0IiVokqxYRf/JbIX10xAEdCxoREUBtxZ7tSECEwInqRv/suO/MJ50TdgdxAS6bE3O+ThxrB3LnJ+RumxO4i1BJDIDiwyCg4vmiJ/R3N1KFvjGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669732; c=relaxed/simple;
	bh=d3ksRqF/225ykNfHkcyAYyQFHgjHDdVpApvFOiVmoGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jgEb2QnBc0iF8eeviV0yhFdo7DYOTuAFrUk/V3btUCJ5w6xJTftBfMlpWJN1BP2WOOpV3uhTcY7vVVF/4vxOUYQE4goAsnLa9wSYqB/Vx6mGYPJDEnjTM4BxthTRTDSX3opJMVdMvULOEGKhQil2+eU+4DMh27tUS1kz9iAtGuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dsghq8gn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e7516606c2so150214f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669728; x=1758274528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+uPAFUoRnkCQwhRJbg35xw6qqa1PiqgWFEiNSHZCHQ=;
        b=Dsghq8gnIsrRlGJXz6N8UE+BGf8Y0ViSLs82MIDsPwHdYPBdbh6CsBYlPLM40I6LW4
         c0KjBfSVBs/GHcIeGtQvBVLEZMpRo0N3hkz9Fp+C9dLDZQAunOiHTgE5PlK+e4WBEYWE
         Ad708fuIUjR0QiP21RsAmCH15F+zwsbjGiosRaGvuK6kOUsLuUYK8Sn+SsSTlh1nXaM6
         W1XmLI9rqz8pLNq3yHIKq+LdTFTgPx2DUnowQCvsBh0zRAmdu9csAxbfyA+bC3cbmBE8
         ykBX867wlYamAf6oBq6Yhppz1+XT1QY/9TIxPemcpc5rkyyTMygtbEeVN8cTido3gn2n
         5Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669728; x=1758274528;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+uPAFUoRnkCQwhRJbg35xw6qqa1PiqgWFEiNSHZCHQ=;
        b=KU8YRNkJUWzdh/+z50vVX17LMvKG0YKQf3CyFIbqBILWSz6o40Rl22AKvKobHnrOMc
         oYUQF2c/tRtSVbqNL/22ZECsxIgt1VQ07OuRLr6/x17P3eQXGTaPFKXI3lgQrnMpibek
         rCoKqZnJBAyBq/z/tmoCiJa1KcdR1patUhGPTExCVhNa9MYJUj7iALBtWQ/iifPWJyeG
         ZcDgPR2mDUtNJS+yy39dqyDIepnZFmUMK3MGFVaXbQKRCPw4nsQAMONaXtpCwgEAKr79
         TXBgDRuVzNsCkYyGgH+jiu0b4eh47kVD/2Sz4lsaB21+u9+Izv3QtrhYJvqddfia7WEd
         3Ntw==
X-Forwarded-Encrypted: i=1; AJvYcCUetAR0IPaZH/dZ4QP7kAlLzFfBmoPjLAr56GJVfB7zt0EvPLWXxG0RBASNid/FxR/utTcQORKUNZaT@vger.kernel.org
X-Gm-Message-State: AOJu0YzkaczyYUhABnoi6UOvYEwmR+mJiEDx1sUkWSs4YJUOzXYhTfTW
	+pQSycRyeyQfPMkUPAbjM+KT7T4W/ep3QhN4Cffup4NO1YzbZCRymbJMegpDrRq0zrw=
X-Gm-Gg: ASbGncu1j3h3o8eJi66ZBzDrxf5iLX1fkiSuVqtWJymWS/eSTJ8owanAoRzLBbBS1eu
	0FcE04z0rkUns9oD0zirqjIWBrx3kUiz68JfjqVTmhxkdK03QmdftHpvl0qlwLC2El0X+Ptw4cd
	uNJoz1XnAXwOxJNdZsGs3gZOWemBWfzGZY0n/EsJBNsSmB0dDta8JTRdxIf6i5aIOOG05hyB12z
	wPcG1/tW46oE22H93jW89NgxN1vOQaGthtHk+jePH0F6R2oewJuPlF9QGDcgWV0w/P67Fm4JbsP
	sZhINCZzMiEh6j2XEwUl0OVjoFed71D+FPruX8xqjR5v1/0NVzMjl4y5HhkMEkkcDbCJqG+s8up
	nKXjP5gmBWYSaQCduKxX2rICvJi7Ua87quikS83wSHCE=
X-Google-Smtp-Source: AGHT+IFtNbd6Dn4WdpmXjcvLYqdhbSTf/jETRe/3ClCTa+iY1WEjN/qZgo/LtPPTOxnrLrm8VWHU6A==
X-Received: by 2002:a05:6000:2503:b0:3d4:c46b:e57e with SMTP id ffacd0b85a97d-3e765536c58mr1055302f8f.0.1757669728478;
        Fri, 12 Sep 2025 02:35:28 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7d9844d24sm187f8f.46.2025.09.12.02.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:35:27 -0700 (PDT)
Message-ID: <795b3754-dbb5-40a6-a333-b333b2e11b86@linaro.org>
Date: Fri, 12 Sep 2025 11:35:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: Simplify printks with pOF format
To: Linus Walleij <linus.walleij@linaro.org>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2025 11:23, Krzysztof Kozlowski wrote:
> Print full device node name with %pOF format, so the code will be a bit
> simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/sprd/pinctrl-sprd.c      | 9 +++------
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 7 +++----
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
> index c4a1d99dfed0..16cf9d15f247 100644
> --- a/drivers/pinctrl/sprd/pinctrl-sprd.c
> +++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
> @@ -258,8 +258,7 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
>  
>  	grp = sprd_pinctrl_find_group_by_name(pctl, np->name);
>  	if (!grp) {
> -		dev_err(pctl->dev, "unable to find group for node %s\n",
> -			of_node_full_name(np));
> +		dev_err(pctl->dev, "unable to find group for node %pOF\n", np);
>  		return -EINVAL;
>  	}

Heh, I misread the docs and see now in the testing that my patch changes
the behavior. of_node_full_name() is just node name. pOF is full path.

This might be desired (more accurate warning in case many nodes share
similar name) or not...

Best regards,
Krzysztof

