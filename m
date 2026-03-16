Return-Path: <linux-gpio+bounces-33449-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCFTBGWut2ldUQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33449-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:16:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B13702957FD
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FA3D3016C8D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 07:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AD334DB7F;
	Mon, 16 Mar 2026 07:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYA4RzvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HniAZcmY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2048156C6A
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645403; cv=none; b=HXQPkoHiVXflnKBBYHHn4hg62hrwc7lNVXVIrarxkVZKq71CD6Cz77CrtSfILahXz5dYfbr95JrWLR4Bc8exqpnsvAAVp5tS6CQrt0ehIRotfDHJ4jD8fGfW1b6hHjQ2lTeMqMh+Bjbc5T84uZ7qSAt1AP+bMtyOaj8O7eb/72E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645403; c=relaxed/simple;
	bh=Ttsz8q5cDNZexWmXXKaGyGp1lEELQQ1lNOBljmUtN/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OK8Wel7r0IfXNXRHf+IcTY8G9Wy69XKWh9NxFEtFWV1iKIJNp+RJHEgJieZ95gRymoQ8Z/Y6ZqiFMuaMbxbkIQf7/8LsK2gfFvLsbDgfNnf1VhDGCScV511JxsILHqnaQuxCaYp6CjWCUP2iH9LwZqjVcmjKaFJ5b4ueQeYOTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYA4RzvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HniAZcmY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64hPH1724726
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AfTd0j3qDjIpPj5+9F/8NtKQlbfzmA3Mmk2X4HiLnE=; b=eYA4RzvNicB32xuN
	g72yxltGFGSifnl3joSG+g93JglS4MYtWrfxkybyIL+ag+BnaHOXAbyAjOKA0obr
	8MSxQUbNwIvo1l4f/At4/T3Wpw9I1ZS/ro9QzQ7Xz4RK8x5Xn6+eaXxjblyg+eds
	2gtHYDCRAy9wujm2JQ+BF3aUT6jvePF5kTY5t0YkiEG5NHrgcHOD/pFYzUXR8BBy
	pMfzkJo/kz+PbyivDzZdr7KWmsmhYWtfN2TSTTse2E3kj5MdxN50mpCaWlJNMMAU
	gkUYOdSLfEbYuU+HmT7qAa2qi7puNr8k8nHLoke4N98pvhTpWCc8BddaaeasUmQ4
	gSIwKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udmeqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:16:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b04293b16cso98691845ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773645400; x=1774250200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AfTd0j3qDjIpPj5+9F/8NtKQlbfzmA3Mmk2X4HiLnE=;
        b=HniAZcmYxrWTXuQdTyuiB4QO4D7wT3KLhoccWXXQT7DtNv12iTbYDFsozCGm5k1wX5
         AlM/ztBZDHJiAnXlC8SkzkMjpJ5tmRKAu3XzhwszbMPc6ZSmHuBUI5C5h++p+yBV3wg5
         PydcQBHvwQd5QFOLClD03XR7vjGzGZonjojuhpCPLVNKsyiigHbEm0Q+/s8by+x0JKb4
         TtYqOqCbioFnGk/lOAkklas5xmaQnVaq5I+WoF+JFi02T5xGIZdD6BuQUc7y8HmIGy80
         Qmubg6G86VF+zr5PzrqCzhxdI6VXQx9UIvvge3y1EN09LXl/bJkYkL319jTrn2GjP3+H
         E7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645400; x=1774250200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AfTd0j3qDjIpPj5+9F/8NtKQlbfzmA3Mmk2X4HiLnE=;
        b=FQrWuPW99+p1Bk/FcGHAmdnPt2X04GCYk9VnKLsg7JkZedQtOmpNGO5s7e79ySPs3q
         CcXb4eOAwAG+7yTlksCJ9y07wUAjHewFx9GUo9ui7JoVtDwgBpygSkORytKJd/nk8asl
         0eM7y13+jdq+JKx+0yHunAgcortniDR6wBtpvBg2ldIDqXVGL8HI0FGFzTFWAJAmg6ll
         SOmrNQBPq+GhBwfEqo47++yZwUEosqez27rJdkOhld3FVDbXvlJphalf9XkmxzkDLFmv
         VBjDJFkyjycLYn/njNIDl+VJgjRPDAcPZPbeh5HvjFx2eAF8Wc61/UazKX2k07WZ+bdv
         MU8g==
X-Forwarded-Encrypted: i=1; AJvYcCXn8cvDwuKAo79lhLZG/7U5JGzuaJoljEspMO+EldqNQoTYJM/vy9Lm2IaJ5L7J2fOqRYDfhlPaF5Xt@vger.kernel.org
X-Gm-Message-State: AOJu0YwiwDsUjMAkr4+EmrPlUZHtEYvPDK4H2NW+R0LpIGF/qoeathpY
	pL/0FFM53yOqq5pbMakzBiAOGvPH5WKSC5hxAV+kySYEyTLlYesqn9pbI4gaicm0zI1jFQNIOpR
	c1F9DJ/4FZIBH84FIMk0F+MOSiXSPrus+0hWJo0C+TYV/YwYHMhf8n0s/zi5dQj63
X-Gm-Gg: ATEYQzwWu3chW5pksiSv+eOc+Mq3RWK2dpvxYthQN4+z26KZX2iuiyXQPDmS2Ee3oEf
	Gre8ZRKC1HN86k2lqfW2W3dzaCKw12Xy50nRILckQM/w8VBPKhk6MnwTQN2J6H3qFE5v1shzk5X
	tIFlh4V1DI6C19qAWRBpKx8BUwKFY19rvvDeW3CLrT6SRAla207Pl8fuE0GA+Qc2e6Ir5+9d8Mf
	glmslKZ+18/rPf7ALb3rL6TtkfNB5IA9x6xQzBz8H7Gy1wmSBunBwA8GqkE1kfYTRZ09G76+Wjs
	XLiO+v/Y5JR2OUs1Ls3NLdKocYNcdwd7iDhLdnC3LCFdQQHBhsLm+t3xZLhMs9xk/DCn5mRk92g
	J+Bq1PT182qyfzcgrhWrr6lXSzlQLJpIWRsjfSQcf6fkFZrcIfS24iAcmoxQn/Lz2Dw==
X-Received: by 2002:a17:902:dad0:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2aeca9b8bcbmr127501805ad.8.1773645400324;
        Mon, 16 Mar 2026 00:16:40 -0700 (PDT)
X-Received: by 2002:a17:902:dad0:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2aeca9b8bcbmr127501515ad.8.1773645399849;
        Mon, 16 Mar 2026 00:16:39 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05d95796asm9603665ad.52.2026.03.16.00.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 00:16:39 -0700 (PDT)
Message-ID: <a8e08742-c6e3-4b62-a97b-bc2ff26f03e4@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:46:32 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: clock: add Qualcomm IPQ5210 GCC
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
 <20260311-ipq5210_boot_to_shell-v1-1-fe857d68d698@oss.qualcomm.com>
 <20260313-demonic-ludicrous-lionfish-fbbce0@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260313-demonic-ludicrous-lionfish-fbbce0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7ae59 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pmxRcdgLKSYvSCRR0ycA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: uTsmXpMvkfw1YAMj_oYs5WZqirvzrWjB
X-Proofpoint-ORIG-GUID: uTsmXpMvkfw1YAMj_oYs5WZqirvzrWjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA1NCBTYWx0ZWRfXxUCx5zkcTdTy
 mXeD+KRFLPF/ecfIincS+IVeQmfSGyDTnri8lHl0Sf/z/HXo4iwDP/MB0h1zfhfSGN87yVvvCNr
 VoL7z7rQNmNBehXqYDykhUDr6IYPIampj+Kv++ovpGvZq7MZZTBxmtermcM3JI9QeNfYUPvJOVC
 RJwooMWDXPeHIqGBKHeZHUGA0yBi034jQYJhhJ3gFQxFy/WTe3bpifBuQ9/G4tS1kAPyR8kM+cS
 PPMB1yif6rKu/ACan5EB0ltiCEW+g1RsmZ2QjmFNhBegnBlthTUPnb5yr3ZSUdhvGG6xuT5bLfW
 FK51Kz0iKJ/hX3kK3ttavxe1NU8Fo3ATcmIvK2QMSwWqD9/GUD8Jg6YeIHzawkrBBD/WEcyOD7f
 8/2IhMcQcpI2e1rBfKht+x6fcC6R9aVm4T+ugqI9sxkk7vscZLrvnMLs6k+BXk5JjturyAC0Sau
 AthzfAVeexDGvEVYEeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160054
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33449-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: B13702957FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 6:52 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 03:15:43PM +0530, Kathiravan Thirumoorthy wrote:
>> Add binding for the Qualcomm IPQ5210 Global Clock Controller.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,ipq5210-gcc.yaml           |  62 ++++++++++
>>   include/dt-bindings/clock/qcom,ipq5210-gcc.h       | 126 ++++++++++++++++++++
>>   include/dt-bindings/reset/qcom,ipq5210-gcc.h       | 127 +++++++++++++++++++++
>>   3 files changed, 315 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..aeb5d9a3f8322d5d36d2fd19a1d23b275efc34b3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq5210-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on IPQ5210
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets and power
>> +  domains on IPQ5210
>> +
>> +  See also::
> Just a single ':'


Ack.


>
>> +    include/dt-bindings/clock/qcom,ipq5210-gcc.h
>> +    include/dt-bindings/reset/qcom,ipq5210-gcc.h
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Thanks!


>
> Best regards,
> Krzysztof
>

