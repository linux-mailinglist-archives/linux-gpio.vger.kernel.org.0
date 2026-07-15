Return-Path: <linux-gpio+bounces-40094-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MMM7EEo6V2rkHgEAu9opvQ
	(envelope-from <linux-gpio+bounces-40094-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 09:44:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564C75B8D3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 09:44:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Uf1+EfZy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IzMGrD+H;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40094-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40094-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A6C73139984
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 07:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27313C3C01;
	Wed, 15 Jul 2026 07:39:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA59B3C3C08
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 07:39:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101195; cv=none; b=tMQCvtPoQxIvmj9TlaRcs5PtjrzAtoC4H1aZjsTlvR52WAsXWMjA8uuefs6Al4Mwp6I3peP0vfnPTDAQBWAN47xsfLj+PlQF0jU4QstQA7WI8OfsHtgXL2D9/L475p7FKYAWkzhFZH8zQH8WiFfsRuDpnWMlyAE6B8lt/ycnJD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101195; c=relaxed/simple;
	bh=ebWtyOH9kSpxJq6vDBko/JT3b6HXaI0oy8ZLOlgDCic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U46u2/PI2zeR8bW5AP2Rx69y6590GK2ddXmYOmh79FJLBsncQ5Zozh+brLfVqm9sTnrOqK27nF2XSVPjwBg5OUJ76OFiJOJcFpMXwmh4l3RBeLDsnLaK2kuoZawHylsDBQDeXO10WtJwosUU9wdtwPhkL5z+IvO1/rgopM/3Kmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uf1+EfZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzMGrD+H; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lK4j2528201
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 07:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmzy3y4hnVRggDf3ypxamZzXNnu9V8aagRm5VsFGWUY=; b=Uf1+EfZydOomm85r
	qm8k3d/yXZDZwvRB4Ese8LoKt7xxGqfYM6dv6B4XGvRAYBHOyCX6tPK9to6jUBhM
	BDAEExtfUN7x3Xl0Qt27QLmLSOsl+ERZ4LNpVc43dvyloxdnIUs5vSLGsaZ5XT1k
	UmqAKxNpDn+lyIygvjIcduU7aIxV3Gnp2dGKTC33n5VJTG8jTWL2+pGQAN+YKtA+
	JlFw9C+k5zq+AiYuIb1qr0t0V1nTSrI173E1sHIla/4ahAfe9A9j+eusDEdeCsVT
	kEZxS8idLeGvLGVkYTApAOuTE68AFnHrSmj1s1OrZY+4w8s/whKzySxP2xOINzfr
	pnXmow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr3kda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 07:39:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso20824631cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101192; x=1784705992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmzy3y4hnVRggDf3ypxamZzXNnu9V8aagRm5VsFGWUY=;
        b=IzMGrD+HdXuO8cXwIp0ul/2RbJp1by9wv3Jx/aSLc+GsRpLk6T6GRJbNq4CRHYIBG9
         w4jW1eD3jbgJIIZbqp+FALJQQaDFTxw1zi5ko2FnBwhxgv9vvWmXK3+JWb+uZIh2asJg
         LW7Lqf7z1P2s4VXebxWwWG+RxmkiIoRSeYN8eL2LwTwAqyHyn2lgN4jaB2d4GfF02DbB
         FbYUMkUKizt+a09cr2uUsky/7Capb7mA/wr7jq28c42lzi6UXUbURoZW1Iapoog8EJ7Z
         VvsVxnxaVzNklVBT79c0w72kbCH5MZ4zqfuRtPbBnkSAZo5XnwptRZLh/HkGnL76cQ2K
         KPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101192; x=1784705992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmzy3y4hnVRggDf3ypxamZzXNnu9V8aagRm5VsFGWUY=;
        b=SkOy1j4vCq8fAxc7WqDSOvThz29zmeLJTkqJC0mYNE6mchKNegV9uWXEK6xctAlnnX
         IGgWKLNZbOHKvhGjDOvw2Hx1/5E+MrILOAesmXvbKX6KqnLUNMeBMWAUTpU2ynVexPpG
         +xasjJx9hmBvBKWJQGz6bxT3QCoOs/X0wr5A2JYaakcYObJkV7l5I8kjC0BwIIc+Rmog
         ttLCaO8I9CPE3YYX2sd10lkPVwS+Y9tz5CVZnlDhdvbExVf3xI2/TVo9P/KFT4mAoT5k
         gDcf5afb+ygMOHvmWIgUh7QGCQzEcpCizEDFOq/rf0LVGGG8o4JfTh5NT3OX+ALoAB/z
         GAmg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5J6j/6A5B8Uz6eOQvwNSGGBM4Beur44gbkLbKedihsS5GM0AiZlJ3tpY56eRIoT9GI/A8cafytZJb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywly0aX+mMkyFtjoy9PfV7HEbngSwPPSF5uVwofDNhb5JS8PVR8
	H0UtyxcculnUwl6C4oikYPkFTItsDiA5lWGLR/dnwpDbjQvJ5DVRilSC5Rq6gDwJ84gCFv2hi5p
	MiEXsDScdUj9N2ib3CUdd0chNgT2N4ZWxKNgBA5HKygHG8+Y3eQqWeUAcXCp+/7Ck
X-Gm-Gg: AfdE7ckIC4rqEI4oFb8zHaql611HCRrQrPQqFqv3q/MqO8GGJu1z8WnjOnl48A8C5xx
	h2h51Epmr7NbLwAv6dLs50v0q6n+YPMc3CQ9BN4+hMaXc40leXVjDNi7VgkbpksdRljkM5KAf59
	o/PcoP9Qbu8cqyE7zN+BWSAv4mMWQ4lmZY2Cn3ybwc7DCci9BChtVe+rKvxiD0jo131uYrbqJ6v
	piSOsHNEbZFKIkv4fm1HoKGJWAi2Ayqpa/qMWmDOr00E6vFDWK/wOj3wCN1b4ggx+D92L/APmkz
	24a7OC3n09ESZ3C6da53W5+fE+5e/9J6gLxzkyn/RCWBrtAAKxTDC/3YVj929Wtv8G8kqP2/l72
	L/myY0UKSmPtkqV6b9llX62nlbSKR5vi36lfqNQ==
X-Received: by 2002:a05:622a:1909:b0:51c:b98a:244d with SMTP id d75a77b69052e-51cbf27e71fmr150224421cf.63.1784101191851;
        Wed, 15 Jul 2026 00:39:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1909:b0:51c:b98a:244d with SMTP id d75a77b69052e-51cbf27e71fmr150224211cf.63.1784101191222;
        Wed, 15 Jul 2026 00:39:51 -0700 (PDT)
Received: from [192.168.68.103] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm12046110f8f.21.2026.07.15.00.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 00:39:50 -0700 (PDT)
Message-ID: <75d64369-6e1a-4d6c-bbff-36c395b384e8@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 08:39:49 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ASoC: qcom: q6prm: add support for LPASS LPR
 resource voting
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
 <20260713184549.929569-4-prasad.kumpatla@oss.qualcomm.com>
 <046bb977-dad6-4bd0-b1c2-4321c58d3f27@oss.qualcomm.com>
 <dae40416-f7b5-4f36-960d-808c1fdeef42@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <dae40416-f7b5-4f36-960d-808c1fdeef42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX21q8VrCU5SCA
 OjcxQLHotNI90Xlz6Py6cHVUZUn6XrES0Zx2uRNaBwtgg6d5jgD6AuazeNOCBc2ALu198/+2QEq
 pQ/Ls3bZdULnatKZs2B+TzMZqiiydvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX5yCGWOALfsnF
 RXnZZymLp+dG9cd40pMzhvLpZ+5sewq/XN35DKfOJtF700d66SqfDytzwQIecsdnG0HZPOk+tYF
 biyZRr7hMwTj+ECt745MBXm/gRsWNComeoTg59qPTT6Unh7N/9u4PVp/+mOVaWmXHC6+XyshjB7
 DANei7Zh6Qamy9/qgsU5m5iXPtsXPVR25uLUtsAtyLznmBY9bXQ1DyNTrJ4EQUpK7++DRcYFrMf
 pXw9ovL3dxMK7P9SXYfaUjLFJvsm/VDlWXzfUZLtNvKK3nPXQwVd6HqMER1lTBGC+tZgrCKixGV
 2LW+uX0WjgyXs3obbjthUXEmFDijwUlz1+bmJpYZ/O9iKIKWal3Dq+qBXMgjIlg6j+DdMbnm1d6
 PrLRNnIMBUeRA0r48Yz5xQBhpyVuiApTwxAgZBHb6Yw+Uv7qc8K4DOnfcicYM1UsTX4nr35xXQN
 4VAKLIFDxJavjfTKtsQ==
X-Proofpoint-ORIG-GUID: xoFss4IRa_ZqKN0TWvk8IwTGm4_Uq0VG
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a573948 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qc-g8TG8afFpgMJUDRYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xoFss4IRa_ZqKN0TWvk8IwTGm4_Uq0VG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40094-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9564C75B8D3

On 7/14/26 9:43 AM, Prasad Kumpatla wrote:
> 
> On 7/14/2026 1:13 PM, Srinivas Kandagatla wrote:
>> On 7/13/26 7:45 PM, Prasad Kumpatla wrote:
>>> Add support for issuing LPASS low-power resource (LPR) votes through
>>> the PRM interface.
>>>
>>> Some platforms (e.g. Hawi) require the LPASS to be kept active via LPR
>>> resource voting instead of the existing hardware core vote mechanism.
>>> Handle this by introducing support for PARAM_ID_RSC_CPU_LPR when the
>>> LPR vote clock ID is requested.
>>>
>>> For LPR requests, use the appropriate parameter ID and payload format
>>> to disable CPU subsystem sleep, ensuring that the LPASS register space
>>> remains accessible.
>>>
>>> Also add the corresponding clock mapping for LPASS_HW_LPR_VOTE and make
>>> the q6dsp clock ID range consistent with the dt-bindings by deriving
>>> it from Q6AFE_MAX_CLK_ID.
>>>
>>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>> ---
>>>   sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  2 +-
>>>   sound/soc/qcom/qdsp6/q6prm-clocks.c       |  2 ++
>>>   sound/soc/qcom/qdsp6/q6prm.c              | 17 +++++++++++++----
>>>   sound/soc/qcom/qdsp6/q6prm.h              |  1 +
>>>   4 files changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/
>>> qcom/qdsp6/q6dsp-lpass-clocks.c
>>> index 03838582a..79527a367 100644
>>> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
>>> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
>>> @@ -12,7 +12,7 @@
>>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>>   #include "q6dsp-lpass-clocks.h"
>>>   -#define Q6DSP_MAX_CLK_ID            104
>>> +#define Q6DSP_MAX_CLK_ID            Q6AFE_MAX_CLK_ID
>>>   #define Q6DSP_LPASS_CLK_ROOT_DEFAULT        0
>>>     diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/
>>> qcom/qdsp6/q6prm-clocks.c
>>> index 4c574b48a..2b2b3872e 100644
>>> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
>>> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>>> @@ -63,6 +63,8 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>>>                  "LPASS_HW_MACRO"),
>>>       Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
>>>                  "LPASS_HW_DCODEC"),
>>> +    Q6DSP_VOTE_CLK(LPASS_HW_LPR_VOTE, Q6PRM_HW_LPR_VOTE,
>>> +               "LPASS_HW_LPR_VOTE"),
>>>   };
>>>     static const struct q6dsp_clk_desc q6dsp_clk_q6prm __maybe_unused
>>> = {
>>> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
>>> index 04892fb44..7a7a1d3d5 100644
>>> --- a/sound/soc/qcom/qdsp6/q6prm.c
>>> +++ b/sound/soc/qcom/qdsp6/q6prm.c
>>> @@ -31,10 +31,16 @@ struct q6prm {
>>>   #define PARAM_ID_RSC_HW_CORE        0x08001032
>>>   #define PARAM_ID_RSC_LPASS_CORE        0x0800102B
>>>   #define PARAM_ID_RSC_AUDIO_HW_CLK    0x0800102C
>>> +#define PARAM_ID_RSC_CPU_LPR        0x08001A6E
>>> +
>>> +#define LPR_CPU_SS_SLEEP_DISABLED    0x1
>>>     struct prm_cmd_request_hw_core {
>>>       struct apm_module_param_data param_data;
>>> -    uint32_t hw_clk_id;
>>> +    union {
>>> +        u32 hw_clk_id;
>>> +        u32 lpr_state;
>>> +    };
>>>   } __packed;
>>>     struct prm_cmd_request_rsc {
>>> @@ -62,6 +68,7 @@ static int q6prm_set_hw_core_req(struct device
>>> *dev, uint32_t hw_block_id, bool
>>>       struct prm_cmd_request_hw_core *req;
>>>       gpr_device_t *gdev = prm->gdev;
>>>       uint32_t opcode, rsp_opcode;
>>> +    bool lpr_req = (hw_block_id == Q6PRM_HW_LPR_VOTE);
>>>         if (enable) {
>>>           opcode = PRM_CMD_REQUEST_HW_RSC;
>>> @@ -82,10 +89,13 @@ static int q6prm_set_hw_core_req(struct device
>>> *dev, uint32_t hw_block_id, bool
>>>         param_data->module_instance_id = GPR_PRM_MODULE_IID;
>>>       param_data->error_code = 0;
>>> -    param_data->param_id = PARAM_ID_RSC_HW_CORE;
>>> +    param_data->param_id = lpr_req ? PARAM_ID_RSC_CPU_LPR :
>>> PARAM_ID_RSC_HW_CORE;
>>>       param_data->param_size = sizeof(*req) -
>>> APM_MODULE_PARAM_DATA_SIZE;
>>>   -    req->hw_clk_id = hw_block_id;
>>> +    if (lpr_req)
>>> +        req->lpr_state = LPR_CPU_SS_SLEEP_DISABLED;
>> this does not make sense, this should be set based on enable flag, here
>> you are disabling the LPR for both enable and disable request.
> Hi Srini,
> 
> The intent here is slightly different from a typical enable/disable
> state variable.
> For PARAM_ID_RSC_CPU_LPR, the payload field (lpr_state) identifies the
> low-power
> resource being controlled, and the DSP API defines a single valid value:
> LPR_CPU_SS_SLEEP_DISABLED(0x1).
> 
> The actual operation is encoded by the PRM command:
> PRM_CMD_REQUEST_HW_RSC + LPR_CPU_SS_SLEEP_DISABLED  -  Requests the
> resource and prevents the subsystem from entering the corresponding low-
> power state.
> PRM_CMD_RELEASE_HW_RSC + LPR_CPU_SS_SLEEP_DISABLED    - Releases the
> resource, allowing the subsystem to enter that low-power state again.
> 
> In other words, the payload does not represent the desired runtime state
> and is therefore not toggled based on the enable flag.
> Instead, the request/release opcode determines whether the low-power
> state is being blocked or re-enabled, while lpr_state remains
> LPR_CPU_SS_SLEEP_DISABLED for both operations.
> 
> Hope this clarifies why the payload remains unchanged across request and
> release paths.

Yes, makes sense,

I would suggest to rename the flag from LPR_CPU_SS_SLEEP_DISABLED to
LPR_CPU_SS_SLEEP_DISABLE

--srini
> 
>>
>>
>>> +    else
>>> +        req->hw_clk_id = hw_block_id;
>>>         return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
>>>   }
>>> @@ -94,7 +104,6 @@ int q6prm_vote_lpass_core_hw(struct device *dev,
>>> uint32_t hw_block_id,
>>>                    const char *client_name, uint32_t *client_handle)
>>>   {
>>>       return q6prm_set_hw_core_req(dev, hw_block_id, true);
>>> -
>> unnecessary change.
> Agreed, the whitespace change is unrelated and will be dropped in the
> next revision.
> 
> Thanks,
> Prasad
> 
>>
>>>   }
>>>   EXPORT_SYMBOL_GPL(q6prm_vote_lpass_core_hw);
>>>   diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/
>>> q6prm.h
>>> index a988a3208..bd5ee0c40 100644
>>> --- a/sound/soc/qcom/qdsp6/q6prm.h
>>> +++ b/sound/soc/qcom/qdsp6/q6prm.h
>>> @@ -87,6 +87,7 @@
>>>   #define Q6PRM_LPASS_CLK_ROOT_DEFAULT    0
>>>   #define Q6PRM_HW_CORE_ID_LPASS        1
>>>   #define Q6PRM_HW_CORE_ID_DCODEC        2
>>> +#define Q6PRM_HW_LPR_VOTE        3
>>>     int q6prm_set_lpass_clock(struct device *dev, int clk_id, int
>>> clk_attr,
>>>                 int clk_root, unsigned int freq);


