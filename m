Return-Path: <linux-gpio+bounces-4054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD286ED03
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 00:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 451401C21B90
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 23:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFE45F46A;
	Fri,  1 Mar 2024 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYleZ5U5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16E758AA4
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 23:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709336551; cv=none; b=CfXnR8thioybLKXQn7Kb76u0dFH49z0hiOL2kwnV1Dr+vDNEx9SuD/OYMtXL37S6f6BJIZO3N1XA0frw+Z9PQTxrccFWbdsErm11rEciupf00Fd6mBAztJLPsDwpWJwe/N864xHsjApFKexT0g78AmvwlgVVwDM1Rm6YGlZ3x6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709336551; c=relaxed/simple;
	bh=25h2s03QLSdp6bRNpLiP+irXeh+fZcWx//JXhu+B3aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/bJO7C4k6OJFGXMK9GSoptYivjWxYDyf999j7cWUjfw8qonEWGUi9l3MXLpnlcMYKSwrlQK0VUrdqQ4OV8Ub5VjM/p1lxND6Cy9rHNf0nx7OaGwZtzZL9rQDPrTcwAjwLzQXhX8kSs1YNrR9COBymw38/jSAQWvpFwrhv0Kv70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYleZ5U5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5645960cd56so4050857a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Mar 2024 15:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709336548; x=1709941348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTpk9ZPQWyNrhHVW/3ykx8bCWFEXW6TZCcUdpJn/0yY=;
        b=eYleZ5U5uRz4CbzUtw5H0NJ1TRU8JZzL3x39w306wijfF4ZNzoAO9lE5J6Tsbi6zIf
         W6LdUSET5UTCqscTpETnnVcudqEso2Ox7dSOobgvIrK4nb9BPAlHEbR1gDy8LreGp7pl
         EwjcDBdmoqFA6SXVx6Q8jalNnUDcm257Lgh09fDmse0Wn+Vur3NeW0r/vDFtm23JetcS
         1MPbMOBEOXgp1NPmb4EJ5xAkHXxui4sCMW7x+COfd3VDP3g8+B4r2vxjmpkTibTcjN7l
         2mMcRFEF1dUZ4d3UioqUHWEXFzxOcWXSuuuVwyHvu673uBS6sFdHsAmR5s1yPpzx2VDC
         kebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709336548; x=1709941348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTpk9ZPQWyNrhHVW/3ykx8bCWFEXW6TZCcUdpJn/0yY=;
        b=NOZpsxuYw9tZg06q8fK7nOM8QQnHJoISO/CWAf5BAybD/xBEf41FL+E+RekI9S7Xjb
         SXGdP4h73Un7l2F2cLZ0tPAZqCSmhx7FxG3AmsYV8bQUWesIjVrGyqIdYWqidElScHL0
         upzWB029iBHW2otxzv+IRYr7pzCIkvTNpX+7pnqLbmi2QZmenQCQBcrNL0jpSlofWU01
         AZO4A88MslIWBSkchtJ4stXO58eUJLZTI/VR8GAz7dtxJdN15Ls47ZriBTqIjffbRaj3
         PnUzAZ1smdfNKloU2PsuLotnebmr+PFXf7nsTkT52iMGBEwr1HmHl7XZWoJMjQ4bFpsX
         Q+eA==
X-Forwarded-Encrypted: i=1; AJvYcCXRWWXigbPZwrSCLZKQpJIMCO/AfX5QKGikpDlN8DShl9XIVOHC/D3sZjKZ99EkvzVtd+d9Qh0ifw/N4BBh0Vxr0MVydW5r9aOgdg==
X-Gm-Message-State: AOJu0YyBWyllAK1OLZrIWVHwxthyYNyqFATftkfhUqO38ffOziXy7Cth
	EuFJ9B6LcgmQrPWqg4PsmNirmv6ApWzGQJifvcjz60TwuTelc7tJksUkWnylX/U=
X-Google-Smtp-Source: AGHT+IFRQx/BGvRRQHWnehLDkyl5yY9eCMtCmTp08r8NunqurYAeKV/S0PNGCAL3TJ5DxTCTzyOX9A==
X-Received: by 2002:a50:c8c9:0:b0:566:348:fc4a with SMTP id k9-20020a50c8c9000000b005660348fc4amr2195978edh.32.1709336547817;
        Fri, 01 Mar 2024 15:42:27 -0800 (PST)
Received: from [192.168.216.32] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id c28-20020a50d65c000000b00565a9c11987sm2077259edj.76.2024.03.01.15.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 15:42:27 -0800 (PST)
Message-ID: <77485a55-c9da-408f-8dcc-77c6734927da@linaro.org>
Date: Sat, 2 Mar 2024 00:42:26 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 8/9] firmware: qcom: scm: Add check to prevent Null
 pointer dereference
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org
References: <20240227155308.18395-1-quic_mojha@quicinc.com>
 <20240227155308.18395-9-quic_mojha@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240227155308.18395-9-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2024 16:53, Mukesh Ojha wrote:
> There are multiple place in SCM driver __scm->dev is being
> accessed without checking if it is valid or not and all
> not all of function needs the device but it is needed
> for some cases when the number of argument passed is more
> and dma_map_single () api is used.
> 
> Add a NULL check for the cases when it is fine even to pass
> device as NULL and add qcom_scm_is_available() check for
> cases when it is needed for DMA api's.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---

Most (all?) drivers calling into SCM already check is_available()
at probe time. I'm not sure returning -EPROBE_DEFER would be good
for calls outside .probe.

Konrad

