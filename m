Return-Path: <linux-gpio+bounces-33450-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADahN/eut2l0UQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33450-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:19:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EAF295844
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8000030157E1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 07:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8312D34E75C;
	Mon, 16 Mar 2026 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLedPCbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hScF2Ru6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8C234BA57
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645547; cv=none; b=Ly1YBGtUyCpv/Zf7uFixs2AUC1McLt5K7RKpExyeC32XbkZgpswZGujHXQb5GbynDsYo8eLBZonDlwJbtj7oG5L0WlYcZtXoUs9Z1pX36+XBoXxsmO5PZVE9E6jlUj+Ed+s5gxr5SDN5qPTpKJORKxPZmZJiVA0CWFygfS7yACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645547; c=relaxed/simple;
	bh=j8v8ld7zJoZ9UjhL+Y57qItIiIfZVj2JTddzfGquieI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWkKCB7vh0Mtt4nlVHJxnlKLJv736Rej6cXZrayym9DbgJTprcWR1ZqbQvaaUXGhSCxIsgNCG65VhtZvTuTTGYdVBrMTQ3Q/0iSEkuqshw9ty7cgZiyAldHHWmzNl4dJx5UZ3fGKIcIOdFxnppBEFlYisJB4tCKtLSfcxgNaxcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLedPCbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hScF2Ru6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64erq2128495
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9XNQwagjQvS1eX8YPd1QfF/D3gxhUMNjfLGG0HuA04A=; b=pLedPCbIxWA7k0aE
	j/AH2ZN0Xz4dlUErhfkoEASMaztd60FdpVtZKk4rRP6nGM5o4U8a5u4TpJP5tHoe
	CGaPRdPf00qvgRg+fQpIJlJg2xyFVkXEAODPA1Vck4F5ZN0qvY3YXKCwQxnqSYd+
	8GuM36SO4VVpLxNqB2D3hgBvbGvNi5i2pfF2lMdo8UObuoZ7uBertxReEk7dhTu7
	wZOhAhCCw6wNv4H6ct9J7475v6kZZ07wsiNBTLyViMdDjBb1om3NU6MVrevpdJxY
	HY0IT98gSrTEYM/wG7ojVnAuuGCiD3vBl3TnEZpdUedjKuGF14W3DWZBhxc6gFHE
	60ScgA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00ammkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:19:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a0071f14eso28479407b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773645544; x=1774250344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XNQwagjQvS1eX8YPd1QfF/D3gxhUMNjfLGG0HuA04A=;
        b=hScF2Ru6z5B9/Lvgs75NImvnG8fAwrPYa0oNfVKLbgNqP0q+NSIKk6ngCfKQ6X+0OV
         RiDAGneBi7RtZNGLWZ8oabqMkSU2o+TnPsxm07XZ4JyqmsNmuLzp5nMhJmT42qSD1sSz
         k6xiwR6g9WJClhB7obqHLODhRc2kdIzm3gJXgYn1zwcQpJ70Sd12qsj7MQFuL7S6mo/A
         FKS/uCSDh8lASSKW45TwSTkQaGV0sikzrYLZxmPAnalTJCtyBIl/Bo/zJ8Qe7AvyH17W
         sm8nPI6AE0XzGBFmQEhtq7swECGZlqHzr1QEmmRZ9IYKres5k7G/zf3ojtqUbXAsKxmu
         6cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645544; x=1774250344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XNQwagjQvS1eX8YPd1QfF/D3gxhUMNjfLGG0HuA04A=;
        b=L6AqMHSeYmX2inCktjJRxKlBQMJcmiVZ1bo6M7WPnTWZgLJIAusCBIQuI10Q5LlS/4
         8oWom502L+3wkCkQaqnWKUniFwobCEF5/SeWiBDWN+L+iNpGvAFZfyS38arvdL/5NVvK
         m9Ve9XFIXBmR+EwQOzDa3j1RqQcmmGjbxQqfgPd41NuWplR2zOD4i03ieXBOg92G7g2m
         tExrXbglLe8GumWu3ZIycaE21NO8hVT1MrkYgWUa49sc2l0jyZsSknhGoy1aiJzjXQcX
         tbpurrGaJ0A5kdwNh1JWQKjlxmgK/MJSle3L4OalumT7TRi6tMD6lW1armi6rvz7YW5B
         FDEA==
X-Forwarded-Encrypted: i=1; AJvYcCW0JbZo0oNzTzhXheFRH7C+Zjp+skSYXGzlVfKa92P4fGxx+DhGbFV7ooe6O3Afikv9HpZlIC3M+fs9@vger.kernel.org
X-Gm-Message-State: AOJu0YxM6Bg1622hJFzTzjlHROzFmMhJgu/0jMkobk6niJqyMVxq9bp/
	shkEoVcTAlWsvOVikLuPzov8VxYGOBOcmhbTRGsgSvyifI4Ng+5WLfKvdfOOs5Tvtz0ekX4vhB7
	vz9yUrDhUKbPhWqZ8neVVUFZ+aDP5iWuV7sKuhE0Fst7nhryGMs2Lu/i59ZH3tUs4
X-Gm-Gg: ATEYQzzDu4J9YE1jStNp/wZ3JnDQd4MCYU+VduaoJPHAr1X3de9Hs01JhV9MTzGBbdY
	TyXk/HY06oXuYC78E3l425TAyFuTSKC9WzaQKAOa7kEQe9Be4bDG4Q23b2c/LzlNy3HA/oggS16
	foAmO93lmP9IfKrvTNYozF5nb7jKBldqMHEt1Hv7SfdvxAjpBI9eAygaCWZz6zvntmGaCW04rmV
	iMVq8CW4AoM1j31O/LklJ66PZ2jW2AhJn19Ezhl0qr7YHevinMGqjx/2NxkYTBcPl3/O8UFPzXq
	zzouXSwkSPYAfdrND74xFi/6YmyCPzNVgBdQAT/Rk01LH5hO18PPMwO8tbUBtS5eLQiTIxmfB3L
	0auCxDtqj96ef/CmQSdgDYSWPBE6JGkLPJ68Iq+a3Fj9OygIblBr3ytG9ALqBuKxDHw==
X-Received: by 2002:a05:6a00:2989:b0:82a:ea3:c174 with SMTP id d2e1a72fcca58-82a1993b643mr10389514b3a.56.1773645544028;
        Mon, 16 Mar 2026 00:19:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:2989:b0:82a:ea3:c174 with SMTP id d2e1a72fcca58-82a1993b643mr10389496b3a.56.1773645543599;
        Mon, 16 Mar 2026 00:19:03 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0727e581sm11875787b3a.27.2026.03.16.00.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 00:19:03 -0700 (PDT)
Message-ID: <309abcd9-3baa-4fa5-830e-c9d36b6890c3@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:48:56 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-3-fe857d68d698@oss.qualcomm.com>
 <20260313-primitive-talented-boobook-d7a7e7@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260313-primitive-talented-boobook-d7a7e7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oLvIZz6NujJ28o17ziHWYNz1alvfF7IG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA1NCBTYWx0ZWRfX6sIsY1f9yrCP
 hPYAw8995jrWtORtFf3SOeBmqJVeozKMNPh8a9KBu+y7qzFxHDUxU/xVRRG0qfVx3hbZgKo4dXv
 Kx/Ipktenrac49mFUIH8FIobklKbiiW3xP8tSpsnMajLOKx0b5viphe4+tL/mloh4Ja7zLjMoQN
 mL+vwAaFpzqgknc4JDTPc8cnZx3c8yelG23dpmq2yu9kb0rWBpM9MOvsgEHxvtDSUNXJ2x7Wzal
 RI1R2qN1NSp43C37a6eAIHHItnTB5IEGeEGAi+I8Qs2hL8ekIiefJM/sF5Hy65awOlp6/fUK7TQ
 einkhieEU2NQtKlRt4YSrxugH/XiD68SKL+/D+pN64eQjGU42QAgs/83oAYfBPdQUJi+NGjKJtY
 tM4SSflUYGukMfOhqV4erE7QJZ0Cy7t2ZVDEOgtCkx/D+zGlmMMybI2IX5ubiqwKagtzJjL+vDi
 nT/RUxiXcQHY6D6pDDQ==
X-Proofpoint-ORIG-GUID: oLvIZz6NujJ28o17ziHWYNz1alvfF7IG
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7aee9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4YdXfc-GfyRXmrUFxqYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160054
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33450-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.15.66.64:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0EAF295844
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 6:54 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 03:15:45PM +0530, Kathiravan Thirumoorthy wrote:
>> Add device tree bindings for IPQ5210 TLMM block.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 141 +++++++++++++++++++++
>>   1 file changed, 141 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3e5a46638385cf7925963c7e4b615c67e642152c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
>> @@ -0,0 +1,141 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,ipq5210-tlmm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ5210 TLMM pin controller
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description: |
> Drop |

Ack.

>
> Please do not combine completely independent series, targetting
> different subsystems, into one patchset. It does not bring benefits but
> only make everything trickier for maintainers which need to figure out
> dependencies and cherry pick instead of applying entire series.
>
> We raised this multiple times and it IS documented in your guideline, so
> READ the internal docs.

Ack.

>
>> +  Top Level Mode Multiplexer pin controller in Qualcomm IPQ5210 SoC.
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
> ...
>
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    tlmm: pinctrl@1000000 {
>> +        compatible = "qcom,ipq5210-tlmm";
>> +        reg = <0x01000000 0x300000>;
>> +        gpio-controller;
>> +        #gpio-cells = <0x2>;
>> +        gpio-ranges = <&tlmm 0 0 54>;
>> +        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <0x2>;
>> +
>> +        qup-uart1-default-state {
>> +            tx-pins {
>> +                pins = "gpio39";
>> +                function = "qup_se1_l2";
>> +                drive-strength = <6>;
>> +                bias-pull-down;
>> +            };
>> +
>> +            rx-pins {
>> +                pins = "gpio38";
>> +                function = "qup_se1_l3";
>> +                drive-strength = <6>;
>> +                bias-pull-down;
>> +            };
>> +        };
>> +
> Drop blank line
Ack.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks!

>
> Best regards,
> Krzysztof
>

