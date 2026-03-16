Return-Path: <linux-gpio+bounces-33447-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBSsKO6Ht2m7SAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33447-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 05:32:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4720F29493D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 05:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9505B3016925
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 04:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FE533A9C3;
	Mon, 16 Mar 2026 04:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UA+CiMXd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXdXIety"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5271C2324
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 04:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773635549; cv=none; b=Lhkg7Bk+HkERo/6/3+P0Uq4V1/fsNpBuuJK7YusavcxdU5vJVW8iyZpus96qx5QOkIZKEgbPx4arz8vhmiry+dV3C9deOyFOPWc5LK2/eR+mfyN26oCGdJs3XtT0Rzn73o53YEYorFILgFUP4zm2I745uR0/QMr/rkok4WjqsNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773635549; c=relaxed/simple;
	bh=9HFjfEORUlKKwSgtfJlSLW7hbHsKIVDNi8ELHeSd0yk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IvQKPkDlnsWE82ueSwCZt31pSetlkZdLJTSgMSAnx/ZniFOn6Fab/X9sDhHgTK6JdTD5qwDK+OpB1+L8vcWLnQ1LQqx4npNp5+qOAyjNq+kqKB5Fv6yu4u44TVlCmNrL4uvjZWC3Jj2fQudRO/ZyMjSMP0eyhadtNkmveFUKFE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UA+CiMXd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXdXIety; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FMjuh51737522
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 04:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1U/r6zrSnIUZAmklpxaFac25mww/c05LQa3rndRuAaY=; b=UA+CiMXdHa/kkXTj
	hqcwUoG+AQbNUSEAJ9Pvft99v9LjSozmP5X1LQpHo5whnLriB6SddzrCE0WxHZah
	BoLqvG4LOORPpUeq8bKzdMd7JtHz8tU+9zDx0i9x0nSQOZW5Bfwkjw8NiTjz/O4J
	nBHgZ2cFeDJQKZSL6tpXQJ2SzGw9HEwK9juzGveRhmBtgR1zaLGMtVjWwFCEWe/p
	RsNplfeb0qEnmj5znDJluahQJq+Z0wfQDP9sS1LFkG4th7xWf/mCG8A+foIp6Sme
	uFAtcDBbwo88UYLOnpwtzrIygte6eBqctctTLqEKlCxrbgJzb2+DwubSoDSgHXVU
	bJB8gg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xm5mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 04:32:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aecd4f7c37so35291685ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Mar 2026 21:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773635545; x=1774240345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1U/r6zrSnIUZAmklpxaFac25mww/c05LQa3rndRuAaY=;
        b=fXdXIetyOLxZhU7oAJo3z04If6J/Zv8ehMJf7B5cBUKgVvAoRD9D2xIQ3jvcGZL6ef
         qJgbjiElVOweU+pbQxUclM8ViUXOJ2egFf3O/oybYYr8cco5VYVjD1XwasrH0lJQv6iw
         tOpU3yIEl3KiKKOjdhfv8Y9nZrCWQL8TKW9JH/6EcYH8XlpHEYaEpKschuNZz8M+hQtS
         2wUVAq2tbFnj7PDfA+yvtBZ2RJQ1GVIbYt21t8WRQtq+sNuNQ2czK8eG3+iyxthGgcEV
         GVrLCXPeqalclO1+aHiS9MSK79LPxEGK05Ap6LdwQS80w7mEq04d8iesJ04hJ5y65/XJ
         tkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773635545; x=1774240345;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1U/r6zrSnIUZAmklpxaFac25mww/c05LQa3rndRuAaY=;
        b=j5G5Y0LtgiiuTj44VL39Tgo9ttKbEcP131v3JESAIpU+U3Mo9Tfg8tF0lezy4KfMOu
         ksG6061PvYdGst5n8NZr1UL/AuBopeSYk4u3GjZZXkXWATtIy8EyfJ8EkIt7e9F1w2ao
         pDI+rMkJuEb4oTcbzV4z0r5J+4p3c7HYTbJ1Qv0hMtV2sG9Iqu5RmMDsO2Yj3F9H8W5e
         iymczCQHl98JTx0GlxDJmisBlWg/y620Et5ynErxj2/DzHmT44xifzQyqs4rGvjhP6+y
         NXwgBBjBIETld7Pf97Rw0pLxO3rQp3JEzZO7upKbmSpDpvVKCs/HCBtP6jFqY3wu2XOr
         gi2A==
X-Forwarded-Encrypted: i=1; AJvYcCXg6ByoLUuVt5djzwXb8jUCtotVp70N676TUgx3muT0Of+0M0yRM0UZzAWVhxMUVwdhLmtZbnQ52EGS@vger.kernel.org
X-Gm-Message-State: AOJu0YwqEYnbPj77eRALWP/n6QIPtXHsStOQ48dGHu6qhtYG7tEpCtzk
	1wRr7jgEcuytDp6kOW0vtXuhwhvyQrLrcvQNsDa/Hl+CcH+McVIGg10LT9oEnqM6DCsqkb8/Ihu
	AMaCguRFlLvj3M6yETvlZpj6JX4MeyQO8DLtv3dMHZq3HiS8TiA7Ek7ZKlICD96yc
X-Gm-Gg: ATEYQzyd7w8bqRx3/WWnNc/FjRRi7lLd//DSGHmiLaLabieTi2N8MwLOBWTTOG2vQR/
	revndcjky8kpgFffF1k8ae72iFCOdM6KwU6tWeM+yRwvbp42bnTr1X2vVybmypwNYs/SOMs/JQO
	EGeVsDv+txREZgLzRhgm3a8ECqZ8+qdYsebkRgjWeew9TDrCljDi+pjyoFjyd0UNQqE1zzQ2QNe
	zU9O2kPtM/p8lwB5GHQot8uu7zBC8IEk+TkPcoQCdkmBzz2wJJcR5fhuG1FevvfHfY5vL2HrRew
	zl1LIdQo5faVMTBdoY6k5fmtbRtLiF4J89pbj159W+/rj1EIErQb8gmMdASMTMx5EBXg/kFDgUq
	7ANWVmLMtRkvkdX38lMuZBiBKVF85Dn7znwt1NjXqraKGsXXTbw0=
X-Received: by 2002:a17:902:f60a:b0:2ae:ceb0:d5ec with SMTP id d9443c01a7336-2aeceb0db3fmr100893075ad.44.1773635544597;
        Sun, 15 Mar 2026 21:32:24 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2ae:ceb0:d5ec with SMTP id d9443c01a7336-2aeceb0db3fmr100892815ad.44.1773635544004;
        Sun, 15 Mar 2026 21:32:24 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56ca17sm97791965ad.13.2026.03.15.21.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 21:32:23 -0700 (PDT)
Message-ID: <5c100978-a371-4e2b-ad65-b160eee8fbdc@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:02:18 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <20260313-nippy-seahorse-of-security-b1b6f6@quoll>
Content-Language: en-US
In-Reply-To: <20260313-nippy-seahorse-of-security-b1b6f6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAzMiBTYWx0ZWRfX4qL+6DQ1bewZ
 16H9VgVvUzYcu3f08u8sxgkvQ3MDIWaZtC/cankxvjcAa4QMtRROtusVpDBHOaMO3B2O7x2SSFm
 hkJDZYwd07ITBrSX+bi6pGKW6IxTqu/RPDwt8npaiBMWQuB/KXy9JoQq01N7WE4YvITtPRr+A01
 8iQP8xy2e+Ja5Z+KpTWh8J34H00zE5fdJY7+vQXd8hErN+Zwvv/R4nLj6otQKdJZ27K2qYhKmM2
 x/iIY5GVpDyBxzQJFOdKXWOaNlk6Ai6wW9cTvbMnPRbcNAXWe5VduNEA7Rk+/7TxyKzAybfnl9o
 MoiXhX02sOsmTT0Q88Sb+1t6xyR6XbBtrbSDLrZNOrdaZVjsknIYaXZk9bRYRfLarvPQK9yZmku
 CJ+fes/prpk1QcySD0ycW5dr0sTn+Q3AMnh3+3st6dhawcElbr27L9SiQOPXAS/OhobM4+zx2+Z
 Gd/3+mZWLb8jfEalXpA==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b787d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LLmJQVH4VZ79FyvoyrAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 5BYulbIbet_N65iOTBmyaXje-TAvsvKO
X-Proofpoint-GUID: 5BYulbIbet_N65iOTBmyaXje-TAvsvKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160032
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33447-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4720F29493D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 7:26 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
>> Interconnect from SCM device are optional and were added to get
>> additional performance benefit. These nodes however delays the
>> SCM firmware device probe due to dependency on interconnect and
> 
> So fix drivers.

Yes, will address in v2.

> 
>> results in NULL pointer dereference for the users of SCM device
>> driver APIs, such as PDC driver.
>>
>> Remove them from the scm device to unblock the user.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index d7596ccf63b90a8a002ad6e77c0fb2c1b32ec9c8..ebecf43e0d462c431540257e299e3ace054901fd 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -308,8 +308,7 @@ eud_in: endpoint {
>>  	firmware {
>>  		scm: scm {
>>  			compatible = "qcom,scm-x1e80100", "qcom,scm";
>> -			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
>> -					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			/* TODO: add interconnects */
> 
> NAK, interconnects were there already. So after applying your patch I
> can just revert it immediately solving the TODO.

Yes, this change will be dropped from v2 and instead will be using qcom_scm_is_available()
to handle the dependencies.

Thanks,
Maulik

