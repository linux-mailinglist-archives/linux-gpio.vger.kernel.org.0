Return-Path: <linux-gpio+bounces-10406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B7984AF3
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 20:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A4B1C22DD5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 18:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EBE1ACE03;
	Tue, 24 Sep 2024 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REJayGTy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBBC1AC45A;
	Tue, 24 Sep 2024 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727203145; cv=none; b=BSQ+OeOK0JSLrD6TcnAUT+6UkL3WPp9piREpURPLE2mklgLdZ8kIiM3EOFsc4Nd2/Td/6izwlKHdo9l6pITmQhSgQYJ2dtk++HFqyBNhLvP2VZLeH9WcMVXIpgm/6o1bmpe5RFI9qe2iMVrnQiu1m/eSk7p80A4B1njUpShToDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727203145; c=relaxed/simple;
	bh=qlVpmiFg8i15nd6jTmVhMDRAo08ef/F5oFu+Ie4XXWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a18bB8vyUEQUlhkh9pev6st07Xrl/1RJVD7h2j2GIqV/0PpQRlkfoe4KSnOSSC4VvuECXAGYAM7ua3J4nHmQEnJHzP+iTMUKFC0oSG1guCkS0S4ulPimA8TMODS9vP+wgK3vlVYTUDQC+tzpR9gsRH1YVKgdOQk1LiEOmyrEffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REJayGTy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45C8C4CEC4;
	Tue, 24 Sep 2024 18:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727203144;
	bh=qlVpmiFg8i15nd6jTmVhMDRAo08ef/F5oFu+Ie4XXWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=REJayGTy8xykHFAGb/Xv8u89d6lVZBeu1JnaC+VcXSN0W830ViRMBbEu/QYTdbq21
	 Okhe0DmMfWcSVtPD2SeQQwm93Vizrow+4CbxjNNbBo+0FwWYx4CcUqB4df4ve6eCfz
	 quNZ45+rsC6NGYHJ4TxcpuAjdoZuVkXPtdYJTKRnGxMQLM49KdFtqLWyIgbGeZ6mre
	 Ny+P7BwilrdvqXDBn6V5QCrHrWbUadUY7mMnreMTHWBh1MZxIiXznZz3qd7lF3MV3H
	 s9awMR+y3fD8vyVXHYS4lGmDzWbVD9UOdiJ3WCWt8KVli5TWhn2E274Cw9Gd4zfaz6
	 Q9gvJr/3/vW2Q==
Message-ID: <823fe98e-eb80-4b6d-8c35-3c14cbb52dda@kernel.org>
Date: Tue, 24 Sep 2024 20:38:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com,
 p.zabel@pengutronix.de, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: quic_varada@quicinc.com
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-2-quic_srichara@quicinc.com>
 <4cd3d3f8-7d73-4171-bb35-aba975cdc11a@kernel.org>
 <9f2ccf3d-fa71-4784-b6d2-2b12ed50bdd2@quicinc.com>
 <91392141-af8b-4161-8e76-6f461aaba42a@kernel.org>
 <30fdcb3e-a7ff-4764-bed5-39494c3e3326@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <30fdcb3e-a7ff-4764-bed5-39494c3e3326@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2024 14:10, Sricharan Ramabadhran wrote:
> 
> 
> On 9/20/2024 6:14 PM, Krzysztof Kozlowski wrote:
>> On 20/09/2024 13:56, Sricharan Ramabadhran wrote:
>>>
>>>>> +
>>>>> +allOf:
>>>>> +  - $ref: qcom,gcc.yaml#
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,ipq5424-gcc
>>>>
>>>> So everything i sthe same as 5332? Why not adding it there?
>>>>
>>> infact, ipq5332 has 1 dual lane and 1 single lane pcie, whereas
>>> ipq5424 has 2 dual lane and 2 single lane pcie. will update the
>>> bindings in v2 accordingly.
>>
>> Hm? What is the difference in the bindings? I don't see. Maybe some diff
>> would help.
>>
> 
> For IPQ5424, clocks items is like this
> 
>        - description: Board XO clock source
>        - description: Sleep clock source
>        - description: PCIE 2lane PHY0 pipe clock source
>        - description: PCIE 2lane PHY1 pipe clock source
>        - description: PCIE 2lane PHY2 pipe clock source
>        - description: PCIE 2lane PHY3 pipe clock source
>        - description: USB PCIE wrapper pipe clock source

But that's not true. Open your patch and look:

+  clocks:
+    items:
+      - description: Board XO clock source
+      - description: Sleep clock source
+      - description: PCIE 2lane PHY pipe clock source
+      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
+      - description: USB PCIE wrapper pipe clock source

Either you sent incomplete binding or we talk about different things.
Looks like first case, so the binding is just not ready. I am not going
to review it.

Best regards,
Krzysztof


