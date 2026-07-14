Return-Path: <linux-gpio+bounces-40036-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FMjdNeXoVWoqvgAAu9opvQ
	(envelope-from <linux-gpio+bounces-40036-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:44:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6575207D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:44:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kDKoiQlb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jUiJkpMm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40036-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40036-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3697D30D43CF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9193F3F0A87;
	Tue, 14 Jul 2026 07:43:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECCF3F0AB8
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:43:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014998; cv=none; b=TPjn68z8mVd9PSOkWj7YtyNtTqkSpr+kM6469T1toOr2RZc2Tg5R8ZyIaSZiFUp3+ktpLlvBMKjc2fUZUk2db178tx0blyVeewcVdyJcrimHY1bj5zKqqhQnbew5ig5edyILJNQZ5yssR4AOsTpCzJzgjGXTJpDZYuRG3guXS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014998; c=relaxed/simple;
	bh=ASm7RuamRsE7921xF54TZxFnknu/p8k+QeZ1rG7yBng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+Fvp7XT+UX2aKbmv244GsnpKzDXC46+jsAiDxH2AtWKXfPMNF+xR/l9Zppw2/oW3DnVf7aJKJt1iWHoYvyJCcUC3xyL7xNp7DiIS5axI82gBNewarx52SnvTrXvX3IsQhr/uf9yk1gFollKkDNxVvfRoZjyWohEKOt4PNlKsWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDKoiQlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUiJkpMm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SZld3743805
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEe1lTtEISGDx3S00pQzENsnclmU1XHW06htfb8droM=; b=kDKoiQlbcmEDcvlN
	y6iznhjfq+DruJbYG7CW8WY25gafUkieWmXOp2LyL5TyfdaD4PU0S8jMYnC60hrd
	P2WHdaHgOQQpwk4zuuLRbVKygaPUwDtCuzEt4RBJj/d8Bez4QDDLRcfS9YcUoxnb
	5v7BHLTo6cXnQV8/IlwgSSzBMZyDTSB5PLHuVqdRl8K7+lV/S6xm9MKrWkm2L1Tm
	mX+F0Ex/N3E2Aq+hnaO0Brw8I6ydt/o+gQcHbe8e1mA6VKP8UrTtuzrzeQZW3z4s
	RXuA6Jd0pL86r/s46NPhyq45bdCXTUocFJ9Hh7xRnuJ7Gt78jqPG37Hg4lALSuRQ
	cb04+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2kjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:43:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1ada6c43so60482221cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784014995; x=1784619795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEe1lTtEISGDx3S00pQzENsnclmU1XHW06htfb8droM=;
        b=jUiJkpMmtdvAc6owGxki+PSFtueK7kzXwsB0uJk6FxRXM7WThepIQnpHx1O+GmvNo9
         U+jCi3SZdVd9Yq8gnP8meH8d8ikD/7ZXhEfs5rOdMBrkvFY4CiGpd9DnXV7ePDmnS/rU
         0DM3TEbCWsEnT2BTH04J+Pw0ShmNch/OCkAkiHwjeIhtX+rw2OL4EnSBhcaIT4qKjSK3
         FG3QwTanRtCbRnz9kJCbRV+0t4OqBH6G/CynruslWiIBW4st/jmNjrpGexkSO0qoKrtE
         Dd+S6f7/9Ou03AWb/6C5gkIFYzjdiOZpu2cB/Iz9pO1tytB4KNNG8jvm9uPXOFM/zBDM
         Eonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784014995; x=1784619795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEe1lTtEISGDx3S00pQzENsnclmU1XHW06htfb8droM=;
        b=q7XqWuwHav3hro5A8cO/9MTjvnv506iNVHaCsSqQHw/yvmwf+CME7UWD6Xdil35VOw
         cCy3dgvF+nwnGdBSdFaAInGIZHfC387Eq2EC+I8C/S7cF7JLV72HNNvYJ05GVynIcgRJ
         qldkmKix4/j1IM1f6+P9jUoNFtBSDdfsrw+T7OlaDG7pErzfXBBaTGqTg9jB6YqHgXmQ
         p8/kG2Ik92ptc2B0blKRDMWhOzVmhtSUAFd+4QiWiz+PqoOCWPJLjCKuxAEiaI/nPLT8
         B/jJWgM3LCl3++NGTY1J5BLQt7j9ln3uxzPZt4JVydv+HjoSuDimirrxNZ4kyu+DGmlz
         RZVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIxEGwmmLLpwBibmaACryTLGJOpCSuDvwcyJwIaC69sH1N9Qxt+IwPmzzaCIDCBdJNbii2FI5Mr4ao@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz4s3cP3nVnaZw96evwcWixuo2vxSkPuQinb5P/JVD2WIA++pK
	73VtC2kXtoWwbGgMerZTjjiW/XjpoxWjkyFJaFsVn/2oLQc+rpLtA5NIF1iBJB3bzJg5NLMScAX
	RCXpf5RzlhkpmnEgn9sm5s4y7l4oBnbXPnmD6dU86jPLHDX/GwPaJIDAcKwJKYi20
X-Gm-Gg: AfdE7cnFZ/tk4AnDqQSChaBasvDBQ8zntD7cjMW/zcgdhLWw8cN8Mw+bOhMbSH1XWj7
	pInz0ePXXTUa2EQ4tMrEBqzfYl6W8aAg/FLMWc15SdRqIFCySHBfeivPfOL9bJhwfjvHRy1+ZDC
	YmDnpV/gIywtuwkeSBSharK44VHx086METIplF7RcFgV5BbNFKD6oHBae9arziQ8HJJOZT+NqUB
	SDs8cDEhBMopNM2Nddt7h1vjRGDoq73OpDpIFGRUd76CqbKOxC5L8kT/m1dWCCNwdEYI6/7Jm7J
	RoTsFWKU4p8y8tuvqQ2TEhciJTlyXvtu9n0R0Wy+Q7Ushmnoe7YQpc5/p1p30A9MKzPptNR8o+F
	caA1aFmeIOp3lg8jd3RtCUpHZz7HfNtM/Dd3sDw==
X-Received: by 2002:a05:622a:58c7:b0:51c:b98a:244b with SMTP id d75a77b69052e-51cbf2bba29mr116966061cf.62.1784014993025;
        Tue, 14 Jul 2026 00:43:13 -0700 (PDT)
X-Received: by 2002:a05:622a:58c7:b0:51c:b98a:244b with SMTP id d75a77b69052e-51cbf2bba29mr116965881cf.62.1784014992636;
        Tue, 14 Jul 2026 00:43:12 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f462e0cb2sm6038289f8f.0.2026.07.14.00.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:43:11 -0700 (PDT)
Message-ID: <046bb977-dad6-4bd0-b1c2-4321c58d3f27@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 08:43:10 +0100
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260713184549.929569-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3OCBTYWx0ZWRfX5dSayq1YurOv
 fWwo6p3oQVTkWeoih52xw7PocJGRXScCXZY+qvGzZPr3QaAYECI91S0oZkYPaKYnOuYPSwep6lq
 uGFLJOKAgIfPCt5pFgYDext9UO+zizs=
X-Proofpoint-GUID: r90oTdHGZg7GBxPVtYKYEppQpGaXGeVL
X-Proofpoint-ORIG-GUID: r90oTdHGZg7GBxPVtYKYEppQpGaXGeVL
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55e894 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9brZCF5o_kxjRrlj0w4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3OCBTYWx0ZWRfX/o1bb+Egh3uT
 pzEWgsTjG7V1EprEdC0b5TEklewsYptA2E3B4jdMSqiNu+BZZAXzLRMvoYS2xl++6JLcUcIcifC
 CKJlQGc5CPtvA0v38poD9Pf9xKgmyeAHzOOGMiSkyXaBZ4shTBT8C7zjOUNc0fk8ZKFV0MkPpzB
 cacMVWWje9C/CtxFp8wNEpriqXgFLN5tmZ4nh0n+3yQUb9v3+FT9yWbBc1fJ5PWd73w2iUbp5O0
 bgpT/hATnTh7q8zrv6C+WqCgVBsSZ4EwbEqqSlpNznCFBT0QjVlASi6d3v2LW8iI8kUFCFEjgUL
 BRV+MdvnnMVSQd19bQevIaHpf+6Xcm8MphSdUbAj7WuRLV8qb7dR8xWhSjM/8vGc2zRzk0zZpYh
 J/gjwi2JV4VBvq5EDHfVBWPfA2EeCzY/wMuyaOyHLV81wMuSEskcIey9HgE1C6t3b/qt/yFb6eX
 pOKFliSMbxZ3cqEptBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-40036-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30B6575207D

On 7/13/26 7:45 PM, Prasad Kumpatla wrote:
> Add support for issuing LPASS low-power resource (LPR) votes through
> the PRM interface.
> 
> Some platforms (e.g. Hawi) require the LPASS to be kept active via LPR
> resource voting instead of the existing hardware core vote mechanism.
> Handle this by introducing support for PARAM_ID_RSC_CPU_LPR when the
> LPR vote clock ID is requested.
> 
> For LPR requests, use the appropriate parameter ID and payload format
> to disable CPU subsystem sleep, ensuring that the LPASS register space
> remains accessible.
> 
> Also add the corresponding clock mapping for LPASS_HW_LPR_VOTE and make
> the q6dsp clock ID range consistent with the dt-bindings by deriving
> it from Q6AFE_MAX_CLK_ID.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  2 +-
>  sound/soc/qcom/qdsp6/q6prm-clocks.c       |  2 ++
>  sound/soc/qcom/qdsp6/q6prm.c              | 17 +++++++++++++----
>  sound/soc/qcom/qdsp6/q6prm.h              |  1 +
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> index 03838582a..79527a367 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "q6dsp-lpass-clocks.h"
>  
> -#define Q6DSP_MAX_CLK_ID			104
> +#define Q6DSP_MAX_CLK_ID			Q6AFE_MAX_CLK_ID
>  #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
>  
>  
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48a..2b2b3872e 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -63,6 +63,8 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  		       "LPASS_HW_MACRO"),
>  	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
>  		       "LPASS_HW_DCODEC"),
> +	Q6DSP_VOTE_CLK(LPASS_HW_LPR_VOTE, Q6PRM_HW_LPR_VOTE,
> +		       "LPASS_HW_LPR_VOTE"),
>  };
>  
>  static const struct q6dsp_clk_desc q6dsp_clk_q6prm __maybe_unused = {
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 04892fb44..7a7a1d3d5 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -31,10 +31,16 @@ struct q6prm {
>  #define PARAM_ID_RSC_HW_CORE		0x08001032
>  #define PARAM_ID_RSC_LPASS_CORE		0x0800102B
>  #define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
> +#define PARAM_ID_RSC_CPU_LPR		0x08001A6E
> +
> +#define LPR_CPU_SS_SLEEP_DISABLED	0x1
>  
>  struct prm_cmd_request_hw_core {
>  	struct apm_module_param_data param_data;
> -	uint32_t hw_clk_id;
> +	union {
> +		u32 hw_clk_id;
> +		u32 lpr_state;
> +	};
>  } __packed;
>  
>  struct prm_cmd_request_rsc {
> @@ -62,6 +68,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>  	struct prm_cmd_request_hw_core *req;
>  	gpr_device_t *gdev = prm->gdev;
>  	uint32_t opcode, rsp_opcode;
> +	bool lpr_req = (hw_block_id == Q6PRM_HW_LPR_VOTE);
>  
>  	if (enable) {
>  		opcode = PRM_CMD_REQUEST_HW_RSC;
> @@ -82,10 +89,13 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>  
>  	param_data->module_instance_id = GPR_PRM_MODULE_IID;
>  	param_data->error_code = 0;
> -	param_data->param_id = PARAM_ID_RSC_HW_CORE;
> +	param_data->param_id = lpr_req ? PARAM_ID_RSC_CPU_LPR : PARAM_ID_RSC_HW_CORE;
>  	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
>  
> -	req->hw_clk_id = hw_block_id;
> +	if (lpr_req)
> +		req->lpr_state = LPR_CPU_SS_SLEEP_DISABLED;

this does not make sense, this should be set based on enable flag, here
you are disabling the LPR for both enable and disable request.


> +	else
> +		req->hw_clk_id = hw_block_id;
>  
>  	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
>  }
> @@ -94,7 +104,6 @@ int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>  			     const char *client_name, uint32_t *client_handle)
>  {
>  	return q6prm_set_hw_core_req(dev, hw_block_id, true);
> -
unnecessary change.

>  }
>  EXPORT_SYMBOL_GPL(q6prm_vote_lpass_core_hw);
>  
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a3208..bd5ee0c40 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -87,6 +87,7 @@
>  #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
>  #define Q6PRM_HW_CORE_ID_LPASS		1
>  #define Q6PRM_HW_CORE_ID_DCODEC		2
> +#define Q6PRM_HW_LPR_VOTE		3
>  
>  int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
>  			  int clk_root, unsigned int freq);


