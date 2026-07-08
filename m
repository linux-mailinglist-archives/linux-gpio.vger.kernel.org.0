Return-Path: <linux-gpio+bounces-39655-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uGf8Fa42TmqIJAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39655-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:38:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF63725EF7
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:38:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bo5/dN0Z";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XDd3dOFK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39655-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39655-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BAA33058808
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 11:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C497D432BF3;
	Wed,  8 Jul 2026 11:33:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE01432BC2
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:33:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510432; cv=none; b=CkXHir4W/RZN6ULYJ2CnqSXfjH6OP2916BXfA/qJ7PhUpxA3vwU/v92ChBJC33w7tU4PfkT60c/az3RFOvZx8hXUubG/Z+vWTsomGIa/1tY4ZDCqAtKiwSsalhujjrl1z5eaXIMHLzGm0nJORSbgV8qBINjUSoHG2VJ+O7yIDpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510432; c=relaxed/simple;
	bh=WfTaYLxK7jfmMuB95ifFmM7sae4YPR0LI5yVLCdGTYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjzf0xKG6D2HvPxF8j2Y1Mk0/h5SpSDy+9KAOUANW9SHgDo1TbmLV4zJ2vb5+kmTUD8j8Yx1AR/M+plHw3ymHEDnAOgSTaPNirggr+rHolBIv+K+3sKX5PJh66tUNoXjeFdRqYE69ycesmO/jxWZvMnQMhME/IHbkYn9+wBJ1zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo5/dN0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDd3dOFK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSwCc2680921
	for <linux-gpio@vger.kernel.org>; Wed, 8 Jul 2026 11:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qtc7rp/gCFBd3NFusQUnJ7/sjXZcIqKr4x9KvvioeHI=; b=bo5/dN0ZyY/w/D7J
	OQSHL6Uyz1CRNumujBYga63rieFbHsELKU6lJi50N4kLA77WjZZml+OuaKUH5a7E
	VpAT8zS/Km0xeIfsQcKkWR1qw2TYflHlMyvLE6oOTg3mwdd/+KgIkC/Z8he7uF92
	M0zQaN74sBOZE3jZ+rmwrQMXpxlpYZ2JqBY2u7Q2rJi0ZR02e+W92wXI/LDzatSS
	RQCeimijkwl7IFwQXf8r2YlhPFaFvwzBlUpXDgxGZFKBYgM8MeRSrXJuy4kILOcO
	6IMdX7A3mvxcjcPj5ge0a8jDViq1kQXiHfMEvrHNCntgzZNpUMJXPXA2Iapicsyh
	aRPfWQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5v6t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 11:33:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845317fa7e6so1242118b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 04:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510428; x=1784115228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qtc7rp/gCFBd3NFusQUnJ7/sjXZcIqKr4x9KvvioeHI=;
        b=XDd3dOFKqCmt6hnFUiILL3cUtHHsQrFaLViKam/WZdDgn0r5CjFkQgBo4rC1Y2JrQ1
         6UKjG7r1gDQPIYJLO0UBHzWkQ43uM/Ka4pV6v/i6eD61jAxaSvX+MIRQC4Z/ts+1DFZ0
         9z2Mr+Wru8Dw30Eg2GepYpriDfXIf9NUa9W6ryBPBsrQX/m1xX8tjIim8jSmVBKUcz9+
         yd8BbDExAe/zLExg4+U1LHSelbZJ4Jz2JgXszXnkkbEC6Zl2SKP6TqEqB1v4UyXZa0fl
         yo0PcNn/AwfN3cFpNGqVyB6lMqmuw228Bu6xcTSMo5efg7JOlGka4c9gAjs0LbT3Tafg
         HeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510428; x=1784115228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qtc7rp/gCFBd3NFusQUnJ7/sjXZcIqKr4x9KvvioeHI=;
        b=AXfyCjeiQom2NHGfdc9q0ZyOWp3S3uLORcDrIlWDApXGVfDJKyE6HbaSc+bR96UBuT
         qmSJS/D2/3otRwAufUhWdwu8WWfjwy4ypOvz2qW+xIeIlSFnt4HMLAqHSah/kvweaELt
         iCTng4aO2kv0jqfX5OPmhuBPai40Kqy+E5lbmJr8XH4kwnfFPjwIFB1QdbsTGYMzM6+B
         Eu95xN2pSFAVQVnhYD3EWooyyPUjJdlN1QSe13m2FPgolrBPZdgP2Y5w8O2CBV4T0Wkd
         R/QGsqGmBdIgKa6LUSDAFSBMKed3Tt+jBo5BoMdBnrnS3J6STXsM+6608ceVasd9z0ln
         HqUw==
X-Gm-Message-State: AOJu0Yxg9X4+JVE/lDRzFehQHwzHxSLRSU95G/oooX+k4tM9TcZ/OFBU
	WvwvW3M7aYhyh+J+2mFgOJXibCJ17jktgr1YRiaWYEdKPeLKRYNSP5GDwiG8qT4b2IfeNya9TpF
	+SMV26v/HJKga7BivWwllAyimxn7dC/vi+Ed331cNTVoV+XqyDIeASRaApcxTjT8f
X-Gm-Gg: AfdE7clBC0IpHD62LELs7dFlkX0H98ehLCBSUGwYdbj6UMk2n1KP/Wudh84na/wobzE
	FyyaOysGVcn0G9Q8+yRgplVDANBu20aT+P5I/vOlCAtURP9cJaju8YkAtyKZz8mysSw6F3qHxj/
	6iPh7Sy6vYSOseJAwX8BZjGodlYxjQSnr6mfjE9w3DA101BmPer/ydf2Jlxt4SSp+HcUTlYbpTn
	KrT3hg8Vi38mrVdm6kM+MepwxwEuhzB8l90taaWT2nyel9Rfqvu0IcOhiouXMk0IUqgV4nmOfnh
	dF5CthXBocB4IglSH63QeXxMPZL7mNR+8VvROjPynLS2qb7Ase/3qKfBCIuRZuAFZQRcgpZkDrs
	YxGidPnpv3mTgZQp+aVfzVenFgKOQfQZ/fqHICw==
X-Received: by 2002:a05:6a00:1795:b0:845:cb04:9cbf with SMTP id d2e1a72fcca58-84842fec8e2mr2468153b3a.39.1783510427517;
        Wed, 08 Jul 2026 04:33:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1795:b0:845:cb04:9cbf with SMTP id d2e1a72fcca58-84842fec8e2mr2468117b3a.39.1783510427037;
        Wed, 08 Jul 2026 04:33:47 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm693665b3a.22.2026.07.08.04.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:33:46 -0700 (PDT)
Message-ID: <6b42c4aa-bcee-474a-990f-f1fc2e77ae6c@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:03:40 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com, Luca Weiss <luca.weiss@fairphone.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
 <178343111013.2437204.2936966826993460040.robh@kernel.org>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <178343111013.2437204.2936966826993460040.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MzoUBx7Ynv5AZM25shEpjeeS3wh1Af3C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfX5RSKUxinAvmq
 9H8khh6NKq54ZeVsd773hTjAmQjkkxMDTb0PJbYUBaxwLRti3k956TdWh6UGM9Evn4QA2SeCFtI
 eY/JAGOLJzU2LHARQr/4QHcFeulEMbw=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e359c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0awkmHLjsCMGZ7zvgVIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: MzoUBx7Ynv5AZM25shEpjeeS3wh1Af3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfXws3RDFsdDhd5
 y2DuIx7fcb6weLM1O+qETx8ZSolQwGMW1wSleAmRfB3lVJcTnq7Dpd6jiHn72BXuhveYGC4R0FL
 RNU+rR3KSZOWUKbk6MPvWm4xrxw2rM/YINEcJ5P6A2Q9w2Wx9H/Jdu8zgJ+BznOXijGdFzFPTlJ
 VzvFBuS35L0ytmPHfke/KpFxabDA9QNIAYxJ67eApmVt8EZWzCTuEoDX1k0RMCREhur8UMReBSr
 x0hmdzBi7obxMwx1sSqHE7eLpsL9n6Aq4htYNnesCX3oxPCPgjoKx9YXjByJuOdQBEzY/l/5Epx
 wUo+1Q0PnUwruI+s7JUfQ++6XBRnpRl9U0n71qa7Yue9+MdetD5ktJJVzCzeOhcTog73WeS/VzQ
 GSWpBs9k5z/0O/KLRJGrVoQnQvxFCdbgtWD/rNxtbmt6pXyNd5XgTzClRrf9/zBgWl5auUF052I
 3DXO5HXjaDiVAU45LpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39655-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:andersson@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBF63725EF7



On 7/7/2026 7:01 PM, Rob Herring (Arm) wrote:
> 
> On Fri, 03 Jul 2026 13:00:28 +0530, Ravi Hothi wrote:
>> Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
>> Eliza has the same pin mux functions as Milos but uses a different
>> slew rate register layout where the slew rate field is in the same
>> GPIO config register rather than a separate dedicated register. As a
>> result, Eliza only has a single reg entry instead of two.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
>>   .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 22 +++++++++++++++----
>>   1 file changed, 18 insertions(+), 4 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf: [{'const': 'qcom,milos-lpass-lpi-pinctrl'}, {'const': 'qcom,eliza-lpass-lpi-pinctrl'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
> 	hint: Use 'enum' rather than 'oneOf' + 'const' entries
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

ACK, Will update in next version.

Thanks,
Ravi Hothi

