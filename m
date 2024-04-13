Return-Path: <linux-gpio+bounces-5454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C98A3D8A
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Apr 2024 17:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 698D5B214C8
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Apr 2024 15:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EF247F6F;
	Sat, 13 Apr 2024 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y/vZRVEs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C7D45BE1
	for <linux-gpio@vger.kernel.org>; Sat, 13 Apr 2024 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713023358; cv=none; b=Sdgcaw3zq5eRi+n9qnnBSsqBvCyXKCUqB4BDTu+Giz1l6r8xr5Ob114zwzyrG3NOIeqPhhl9RCAB2wNjxyFqQ0q+IHzUXcKGvFrer9Hf12bQ5/fOpbzzDCWg7KUPP9Nuj8uKblSgCG8uMluuVnOmkbSHWvQSrhChujcmOVtdDPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713023358; c=relaxed/simple;
	bh=rx+g1MSVwq/oqS/V1kYTwnSADbN88wdvY1M+SrZB51o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YBZvW7AVZcvxXyV2gjz6LhWovwK73oi3xg1HUi0zDTu0CaE6ZTGI3tCFCnZffMDXwBvK4ZyaOKu34RmFXW13zGH8omz/7MVODRqgnw96I00eUloQ4SCXZxc3pdiPYCHt1zDRO8QkReXbahh62RXEAjzwOG8SYEF1HgRryU9IYfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y/vZRVEs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516d3a470d5so2117055e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 13 Apr 2024 08:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713023355; x=1713628155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LI1j23QI4qxI38ZToeDX84dvQ68X7cYSls1NW0rPep4=;
        b=y/vZRVEsAwB04TAEfXwIUkuDl3Zuv2Sl4Z6tCLYGSEMSNDQP+9F+H9Oj/ANeGE7u4a
         gYOVkUfJmP9YrKYZ6y+h3gE+9qa2w1+7MMb/Xhu0S2SgGEbUK5cTkgzfhOHFgFEjbDuw
         veTiUGYjuFzfwVMiU1aBolfjuZ/tFJ19ysOYDgfv+qLSXoC5H1w6iaVWs0bivy03kHnQ
         52FT3FhhQhTZkFSWfPPUxKIDHkBnMKId0kUI7pKbT3LRNHABScL09iyQOS5L6OMx0VWV
         GEOb/8DrBnVecgy5KX5NH9P/noVuDSChsTvAev8FL0dPol+FiAsBcyOE6wwG1UiZFIGh
         9emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713023355; x=1713628155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LI1j23QI4qxI38ZToeDX84dvQ68X7cYSls1NW0rPep4=;
        b=Req33is6w/Jb+4xmsVSYw4taZvPFc1KhpE12+zqlhc7I6SL9Myp2Ah1/T773jVweli
         nKTQFwlo+j46Z2v4BNllOv0PCz5tt7BTM4ZE41XBiM5fEYbV74qpQzsh8qiCJSm0FQ+x
         PJ3G3rV5uFJbiLLYZ85Ho3zIZkILawtWy16O/KCVPNIkl809AeEOlRujemaF5151NMwW
         y3VhjnWkULzk+he01mcMa34wWycfCQdYvCjBqbh6+KGbTsIX5hfvZ/9jZqPf3bt8QjvT
         yogr2rIN5NwZic1ZHu2yqhrTd/OlXV+ynJ5+/C2dG4msZ+MoH8fb89TFqR+fqDMs9BPC
         rmrw==
X-Forwarded-Encrypted: i=1; AJvYcCVGhcyQ+uNiiuZszTi8DZDLBZrxRS1YLfnzQkDukOCvmSahfl33ZkWWNAv+mRDnhzX5y2n2FAQnqVtDLpGPRPcffnKSh8YNEiXKYg==
X-Gm-Message-State: AOJu0YxJfu9c7xxX0af8mzz7CSf0knyq4oFliVyE53VAdVemAE8HuLuf
	JqgSMo5Q1X70WfIht9NX49s1kQK+v00MimVBNcCWsr3CrTb/xLigfIeIZL7g0gA=
X-Google-Smtp-Source: AGHT+IGEgI+QLJqSo/abtBRc6T3hoK4XDlnELOmCXYz8Ua3pBgaflgnnDBZwLNOA76sH2R4Va5xr4A==
X-Received: by 2002:ac2:4c81:0:b0:518:9952:2740 with SMTP id d1-20020ac24c81000000b0051899522740mr2486516lfl.41.1713023355353;
        Sat, 13 Apr 2024 08:49:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id r18-20020a170906549200b00a4e98679e7dsm3125754ejo.87.2024.04.13.08.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Apr 2024 08:49:14 -0700 (PDT)
Message-ID: <45eea851-ed28-4066-8bc1-d04acf4021f7@linaro.org>
Date: Sat, 13 Apr 2024 17:49:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Avoid error message on rk3328 use
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Johan Jonker <jbx6244@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 shironeko <shironeko@tesaguri.club>, Etienne Buira <etienne.buira@free.fr>,
 Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <ZhqO-DEmh-6TeHrt@Z926fQmE5jqhFMgp6>
 <f245966c-267f-4159-a9ca-2561693d24d9@linaro.org>
 <Zhqjhvq38oNH5-sR@Z926fQmE5jqhFMgp6>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zhqjhvq38oNH5-sR@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/04/2024 17:23, Etienne Buira wrote:
>>> presence of gpio,syscon-dev node (or it will call dev_err() when probed).
>>> Correct rk3328.dtsi and related documentation to follow syscon's
>>> expectations.
>>
>> No, look at gpio-syscon driver. Parent is used.
> 
> Parent is used, but the next lines are:
> ret = of_property_read_u32_index(np, "gpio,syscon-dev", 1, &priv->dreg_offset);
> if (ret)
> 	dev_err(...)
> 
> So if gpio,syscon-dev does not have at least 2 items (or is missing),
> dev_err will be called, 3 items for dev_dbg.
> Current tree displays a spurious "can't read the data register offset"
> message.

Hm, indeed, then I think driver, so
aa1fdda8f7ebf83f678e8d3c2ab4f1638c94195f, should be fixed. Otherwise
please say why binding is not correct and driver is good.


Best regards,
Krzysztof


