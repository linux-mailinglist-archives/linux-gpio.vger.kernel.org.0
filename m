Return-Path: <linux-gpio+bounces-35131-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMpqNRf93WkRmAkAu9opvQ
	(envelope-from <linux-gpio+bounces-35131-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 10:38:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8053F7713
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 10:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 262A8304BD80
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 08:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861273B3C05;
	Tue, 14 Apr 2026 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrmwI59S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBdD8ihk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A613B2FC8
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155602; cv=none; b=QDMD2WEfM1DND+wI8xbKPl2gJRey69UIvxLKoFLKQeBsv/pGz1hXVhN60NmygtPCPkvVyacumjqMf24ZU0v0P0r0/ibIQfKVyOA+11N8dPwWGgOWt6DGanMjYgxH3vBkuZB1mSfWBHEOmtH7vwwGFq9V/ltcG1EOFWd+DVm0Czo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155602; c=relaxed/simple;
	bh=pqeIxEVaQr6V/IOkIUvOfqQXeO4x4//o45wsKxvVprA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ievuMFmc6LyTKfg0GMLMgAxuy4+xuP/lEkDB2DQgWeYTpSDrO933RIP4QGSidaZkydFD/y4oYnwONUPf+FvETZUHvrQH1Vd1+X1NwKxN72e75z5nqHURefKzetk+omkz+9WLi9Rhm8WcpVrYda9DDoDmE9kzhJRzTHfR9jq+66s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrmwI59S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBdD8ihk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6hfSY2386429
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 08:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0CuSkB2pnlQhVztE1zz0rl60TQxMqXS0gKaH0Ccpfhw=; b=RrmwI59S5LLyvxdI
	zp2vHuJtv73f0lEZxrK+aSHjRcz7+QZJ/cZrTAqpRPl/Bm64ebj6sI0bM8LSN3Mi
	mfKOA2JhYYDbNtokMj8MJaLHQmO9hg/V5gx6cl7Yc/KeKrn5p2zJejmCazUWz1oy
	o4fxydgAHHvtxtXWwqQlmI9rOu6WIIwOjb0uEPp0p9fM6llVWwJTublbH24mpJij
	dlM3Jv3EekGHVs1ZEVEZnFVkDLCEQS2tGHjCYdy87uRa2gAFXGbRMVNBKrv+D4em
	EC38LriAdzc/phOUQDi2Q69KGUEVDHbY5MMKQ84GYvalw43QsRcf8vfIS2x8rEv3
	qpIfTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w1t52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 08:33:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acb3741d12so4675856d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155599; x=1776760399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CuSkB2pnlQhVztE1zz0rl60TQxMqXS0gKaH0Ccpfhw=;
        b=LBdD8ihkdW5I2zYCJ2BiO2sJRpUZtzTcbSHKEUwCBgdX1v+wQpaF066Bn2p9YepeQE
         vQSUOLI9zyAYP/rVmGU9JLKvEHPlcQ7YbT1MZyoD+hYF6KuoC4QFXRRcWs7c4Fk09bZs
         2rQzAHA05P5v7Gvzr3ZekddmkAnI1hoGRKEXA0xDQhkcCrri8mhao3Bi0Lw6JKLYJyB5
         tJSblMz0NGQXDrqumeJVzebJZTd/d7F3tbxmD3n5hec036qIZBa2d+35hWVmSTCCqMw5
         trvgYIH2n9LF0jJ23E9o5PoggQujz54r8Wvu6mTqH7eogxsz4s6xUhLoAAenZk3zmGMD
         HTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155599; x=1776760399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CuSkB2pnlQhVztE1zz0rl60TQxMqXS0gKaH0Ccpfhw=;
        b=O01i98FVBtE+SdG4VT+ETJ3z6oKFVGUo1Ifc3+7VdmcvVbOXoCBB3We3AmYpXBEddF
         tJWFHbKorOPZBgsfD3o6PzL3wiuD5zU6Fs6y5VwFSbQpmlOzlvuCHTx+jWQgN7T26Fum
         FjYgt1TiS2x91Z5C+7Z+BMpZkWufRax1CeyQm3GIJQhKwDBjzJCFPNjXNTSZLCIH1SbR
         Js8JtCd57gN/ihD8U7ILPDP3dBlksy2cO95liY2xMYfPsNoG3v8gzb0/sWOkeDG1F2y9
         CFps4VJKX/jbqxUkoOptDlFoldOPkpN/s50wZY9bH8Ns8IfJIZUC5Q5oFikPZg+YXBDY
         rT+w==
X-Forwarded-Encrypted: i=1; AFNElJ/HMxgYE0efVy9pydI5HOjj12KokwUirpo5P801s/CBzoHLmv6TiUdb/7j+3+WJzb24K4YJHKgRWuTm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5eJAebTLkVWREIjAVl2FtY+di/bvGU83UFGOV+ZIg4Bp07LU9
	tGWSaI7q3rOAwgT+KZvhaNqVCimb1ksgbMplJwjqiY57csaBD4TXz99u8ZO8cbX1Oc+rT9mZVqY
	7Y8x87oTtqLN3o3FTkBYOcxfUBeRfatF64aRsVcH+lJv14lAliMHyU1Plqef4dctA
X-Gm-Gg: AeBDievMdXvYf1i7cM5hltAGGeZ61X9VMfCQChWVIpAmONArSvKCKKWTLjQ/v/yLSUJ
	dsQAW0fTx4yd49d+9lDmp/cefIOV6/xN/3hzpPauIvnjAK31tXpmVuIca4v5/oUdL70r1dYq7EZ
	bk175kY+8DdYUTLCGtXsv7GwPJ69Ykj1dfYDZwmvIcS5YI04Urs+pbZ8Jjd35jWtU0XcGUAy7ab
	zQdQpLYP1gXGuEMy28d+jE7zYXJnNxKtq7nphX8SsCepzxl6aRquBpgDBM5UJAJmylyn5Sst8Ia
	t27Zyv7m3VHTkh8e/YwumWx+Rs4cW4tavNjQ0h66xrSj8wVOtgAv4Jem91NI4wYPOZ2Rx/UUAdr
	jMAF6xoIghsgkXrLcBKU9NRhmACsjoMA2uV5xXw9JSK1z8+CVfgao+noJBRrcWDbKUHweVDuq9g
	0SBVfyIvcZs1vhPg==
X-Received: by 2002:a05:6214:c8b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8ac8601ec4emr193277386d6.0.1776155599426;
        Tue, 14 Apr 2026 01:33:19 -0700 (PDT)
X-Received: by 2002:a05:6214:c8b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8ac8601ec4emr193277086d6.0.1776155598981;
        Tue, 14 Apr 2026 01:33:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a07sm376240366b.51.2026.04.14.01.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:33:17 -0700 (PDT)
Message-ID: <36b68a87-4d52-4d6d-9e5e-393eece1a434@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:33:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x8O7j_G3XT95V1cbFBlSmL49WNy63vWE
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddfbd0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B7V18gaytsi8T3_IuaoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3OSBTYWx0ZWRfX2w4E5I1YDSBv
 mSzVtL3hJUoeJVPjrwB0fybh3WG/j8IplnrToCOmEiPqUmQcZ4wQjCBZ0k6ShxsQcXOaZknRZ3i
 G65ylCkSe1jBLCIDQ0gec0HiXYNF0BBhFv8buYAWzufWHzPnOWsUU6vVbAUEzmOb21m+oDdQpP2
 +PFwIjgVi4/CjSYedq9tUDNwZ9g8wvkY37VMUkaIFGfnfCYHAb4sbDIzbK0GHCNwOdHMvXFaKzz
 jIHVRS0dshkqwkL9ABlPtQZrXci7S8aPR5QJC2gijypwqHy8K8zlY/Ellq52pyx/dETLvtQh+U3
 fFU5TAOQLeXE4zfAZi9z6diGjavRbbwHi6VSLh5tLPFwacnS1Rl8LFQG0i8p8wBVgxjn/ahtLQl
 3YQ8ppa7o9baka6LiIT5JusMc+YedhCPRPI1PnZWesFHgjoHnuEZ/S4rGZxV1YG78FaWOg6NAHX
 3TiiQC4Zzy0ec0mp/Sg==
X-Proofpoint-GUID: x8O7j_G3XT95V1cbFBlSmL49WNy63vWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35131-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C8053F7713
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
> runtime power management.
> 
> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
> improves power efficiency on platforms using LPASS LPI island mode, and
> aligns the driver with common runtime PM patterns used across Qualcomm
> LPASS subsystems.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

> +int lpi_pinctrl_runtime_suspend(struct device *dev)
> +{
> +	return pm_clk_suspend(dev);
> +}
> +EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_suspend);
> +
> +int lpi_pinctrl_runtime_resume(struct device *dev)
> +{
> +	return pm_clk_resume(dev);
> +}
> +EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_resume);

You can do:

SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)

instead

Konrad

