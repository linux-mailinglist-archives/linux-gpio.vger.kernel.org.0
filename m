Return-Path: <linux-gpio+bounces-21299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D87AD4ACB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8AB7189CA51
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E4F227EB6;
	Wed, 11 Jun 2025 06:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F92wVi85"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B512253F3
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622215; cv=none; b=ljpaR8xkubSP2r2ClxZ8rwyWggczdCggKXt3LRycQhzwFxIRSK71+A4C+NsMkR6v4N6dFeB4K4fotfLzSVCtjPmq7Sl13/TrcPy31NmRQpwROfMkJGO4UAfFc4UfPtxGxQt342YcAqh2eUaLXj7B+DPn3c8JnbUkW+PdRBChA1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622215; c=relaxed/simple;
	bh=p1ppVXOrjNn2xJByx/0BiTfp4Xr81WeiCONkH/TVUw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nN6+2OislW897e9UycQCvugAGdG2VOOES3F/XuipVoAr5CO6FyqYsmAVfFm9+ntSly6Or5claV2MyvTDqLDOLHTpZ7qabmWDuH+Rv+k2MhohrBxz1yTYzyXFt+XHiSZCBU/+SbdNYsMj55RE1l3e4NRgCU937/4wVQEbCq0EoMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F92wVi85; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so24337f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 23:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622211; x=1750227011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UlTHW3VYWOtyjHi00FtQe2a8OVg/B2yyKP2g45rTIyM=;
        b=F92wVi85O77zyDbrmV0Ca9yCZN6P7jmW1aqcOeT3IKapyGDhYiBwC0b/DBEqINzcX0
         +KE6N9M0H6M3gPKemnS89FGYzo7o+bKGOpu4LkOhEYd6NufPwg8D09r78WzJkkPAmXlp
         jGqIRa+2qQ4apwGIpIuwFtX201RGUEczPxDzlFHAShGOfMtB6NTOLQ3ZZqDgexAnyGTZ
         1xv2BE7wIiOoKxqqrtYSwn/FiDAHd/SGhlkTWTYrEIpVqRHmxSXuMEW4HLe6qhp35xlW
         +5QNreqbWuuDRnIRJtBNNoM7IlDnEraors6/mRWQVAJjVr/yOwdCokpXaYG2GNjVVgSI
         g90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622211; x=1750227011;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlTHW3VYWOtyjHi00FtQe2a8OVg/B2yyKP2g45rTIyM=;
        b=vc/R0/lsXvtnu1Z+uJHPpIgQuU4ac1gqf4OhFwF2wm3IGKmY+OtHi+hH6fAKQnR2Ki
         MmT6tBLdSG+noPUZY3mWn698emf+zHwbTH7pbwCa6JKuA11jOIjURzrQYAz3vRMPdRXr
         aVce24MTOIuy0eN6Ut6n4DCmPxMVBWJsTFyVREDuPXTq5OJrL4ikKh35sxMrhff7U1qs
         sd6+rTOjl9Ak2YmjwdO1p4WqTnVq+TlOscxo8/qC9QOLbHptOgSKNHqtvGsf0B4SG63D
         WzedHLhjhlPd8aG/cGsB9sk4c2MRZXj+GqMgHsJsAhIzqs02Lrmgu4KUyGqXu12JK/dP
         pcGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM2wSZu9Q2AkXQMw6xAOvmKv4C7wl0gODoVZKSJr91HGyQN0zD3wC2bwzetog77ew6OB8n6Mp+KTo2@vger.kernel.org
X-Gm-Message-State: AOJu0YwshF10lSWaYLEZEeeuwpQA439qtguoeKyvi8yBBg33mylFoqgm
	90bveqVZY9xRLQFo8GRc+zjVo9S43jtmnaCcOXW2NCawLZN3FF1UFhOGHn9MlsdNlc4=
X-Gm-Gg: ASbGnctwBbFABB5EHfPkg61amK5g99I1POOr4mf5nmPJAImPvnUmiCXWxopCJONT6ds
	1cS5FqE1AUtpzLPt2g84dDZIZgyrQzRl3fbA3I+AAJ+uY8lBGE/H37uMwYsgD4mwAbx26WoqpDA
	/Peyl061ECGU/EtaQhv6O6RSYlRb3kEvmp8l4HrOA4p1ACMrKaesmDKruNMrub9gjkA5Rw/MbBc
	qO1TSKz5QPCr28qUW4bV6fDcsYWE926ntyZoh1EBSec8RkPpKZ/EJm5DVFEe6j+Q0/y0CIZPnh+
	CVc8OML3TIlNj/hHd/VzCdC3ewnW3zCOvXxZ352ic9iFtJ5/37oi8YnSMXAm13RLfMG770lJYfp
	iEpnZEu8=
X-Google-Smtp-Source: AGHT+IHM9dS5dp8fJvcn9zUW8nWaKatdo2FvAJHnG1+WYyvJKPi7a7lMHzobSq5cawskiwEzsR/Acg==
X-Received: by 2002:a05:6000:2303:b0:3a4:d6ed:8e28 with SMTP id ffacd0b85a97d-3a5586cba86mr497584f8f.8.1749622210982;
        Tue, 10 Jun 2025 23:10:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532452d7esm14103802f8f.85.2025.06.10.23.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 23:10:10 -0700 (PDT)
Message-ID: <1b5b6477-b974-4cc7-87ab-a2e8d1e2498c@linaro.org>
Date: Wed, 11 Jun 2025 08:10:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and
 more
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <CACRpkdaQLq3YGfOg81gt5=1Wh2ZkoKHeK6H=NWaeW9aLbX4VCA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CACRpkdaQLq3YGfOg81gt5=1Wh2ZkoKHeK6H=NWaeW9aLbX4VCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2025 14:16, Linus Walleij wrote:
> Hi Krzysztof,
> 
> On Wed, May 28, 2025 at 12:41 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
>> since core does not modify it, it can be made as const.
> 
> will you rebase this series on v6.16-rc1, fix the snags and send a new version?
> It's all nice cleanups so it'd be great to just merge this.

Sure, coming soon.

Best regards,
Krzysztof

