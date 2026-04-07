Return-Path: <linux-gpio+bounces-34777-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBH7Dsfg1GmZyQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34777-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:47:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AFF3AD2CB
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B33893043AF7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264BE39EF06;
	Tue,  7 Apr 2026 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlzVi8cI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bu0KWsmg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71943A874B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558813; cv=none; b=n04nU84tFwSUeEy5IrLYfvPtt+Gmdqz9UVMuZ7dFw+d7N32icUizLs4kjX9fYrfHNHm0K0iqfNpsIlE2CvdkULq9ANYVTWWxili/VB0NZGaO6LLGvEXZ5094OUqINewHZo+bCtUHmlE589dxQh6otQVSa/cboxTq6GZAzlGyC70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558813; c=relaxed/simple;
	bh=NcY+fY8JCC6H+qbIZgMhX8IJLGOBiHW7LV6ZA6kmtMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNiNW8IREidqtA1iVxnsz0VCe0pQ3RoWcnZGToeUGQaJ+c2pLV+Wd3f1UT8OWqdnMyX5FqZr1REg7CfF8514STmWBLBRDDnZQ+YcbCr+ISYTi4VSXyIMYoQTW+r8+enyjkz1ZHfUdv0pzRyAtEUAJHvCf55TADJTTfFgPFGbmSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlzVi8cI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bu0KWsmg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376kIen1403547
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 10:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAlbLe1GjjncBGVwCi12NAldhq0Ds7PE++mMLbJ18So=; b=jlzVi8cIY+L3gtTL
	DXJpAHOnhEWX+hfuRi07G5jwjT4ISNK817KzMXa2ILAWijMQILoldH5XGfknJRSy
	0PfygyUvMQM6ZIe8t1SpQjfnTRH8Q+daenS7SGUHjoifvGe48eJqcZZrxkb7/iRV
	Ty6MKhybCzTR7Bd6GBbzxi3ZXwLpjpgGw/kORQ/hj6rYK+2WhX9IXFawDZsDhVpc
	8n8EGU11y663oMexyflsSt7tRo1FTLcSdDn2xnj22OQueHBVI4PLE559tzsGXkX4
	PRqULxWQUUS7EMEJCDqPzhbqlmQlwrVRZI/Jm4QnR9x6k+2asHWQGlzRXDqOCD0x
	RkqzcQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8absk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 10:46:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso33286581cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558811; x=1776163611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JAlbLe1GjjncBGVwCi12NAldhq0Ds7PE++mMLbJ18So=;
        b=bu0KWsmgAhZ1djPOu5CyhvjaSU6fmvx04OO0OWSE+OaT6SIjt9oeInuSycrnhiB/c+
         CuqLVRWFaJJjQJbKIv6AiV4rcmAlIA+Ti7LedQJu8uGul2LKxm+3DxnAoxOKp/o5EXbx
         NCsmqEZw2sX0s6vv1ca2GeHanDiQFRIu7vllmx3m7Z3proOi0B2tMsh7cFi194EB4Jym
         AgPQUBFNk/0AgP/+cPR1mAnhHdnJbPQhZQ31cClAnaVnfmy6b+ijlP16Y9xHllKm32a6
         8sPqJpv65rpVidFp1UFH7CjHoqL8Ps5UI5TSZjDqUH/Q5OHwrBdANBWyvJcA3aRWTOo+
         8D1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558811; x=1776163611;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAlbLe1GjjncBGVwCi12NAldhq0Ds7PE++mMLbJ18So=;
        b=FCnkySW5hTPaFi4r4vR7yeZ/lytszV3vtgR97dREJuX7z0kpRlEIF59KUvCwoGX/Ol
         jvfZtNE2n6U4R061hLwoO7tZJN+4nzpgLUY2LdDLsMyjYB/SQiyTN3c0isYIGDfDsH7o
         tJwETGoFeAXmI1+J4AWzKWQKK/5q/05Mlle+aJDj+LqcTl63Uxmg2sXBmAK5GlG540ru
         4Rjs/JJ4qTLM1c9nbnC3UduO+uZdIk2s/U+/N22OPQz+i6U25cX3rrNqi23u9Wwvx5gL
         6HeMG54T6WYNqTGVlaXTETthgYs5pAfTcTQd8IhyKp+hZZhAXr2YJ+kazCbIuLcnYD11
         Qzfg==
X-Forwarded-Encrypted: i=1; AJvYcCU+40T8+ZfkKFucQjfxQX0SklitO7gWrn7fZ5vB2o4SqRmOij8wMinZ6tgRP/oY6KUXbvFuztpTnwga@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/IEJRVmeV5dYL3kBDFcxAOvbMs77kMe2MOcnG0b9lQmnxLtWU
	G5VvRocLbpwSz/tj/XqsU2jTtydFtdugz98iH9JDJWlFNBaJX8mJrKSh/1lnpREN2qKxopxyTAc
	w9JL4JFumGNjogwVNWryFLirLxc3TzNMAYGboHVaVw24/98PU9u83KixDwWmXJtj+
X-Gm-Gg: AeBDieuDj5aIYPRJZJ75gUvYmGDTcJL5W+bOwbj24H8l1fl1mP55DwMIofrsV9K22wK
	4HqHrsKDm02OXLN58DC0xd3VnAQuOaxfJhi1MhsXpi/itqYD6DNvSyv6Rs6ae4lRJDF2Kq6hYnh
	vgH0IcR8KmH0ZJttK/3cTcCjJTy8RAxsd3wEJaQR4rNY5fYnKbiWDLynKXaGH8jRrRSMlnaHnR1
	zZfDqDPHleETam5aJA2HN3nf2MPV/qw+D2qpzZFclSRWtxOQ0G2G9ZXAjt65x/mi8oDW8PTTNuP
	Z3kXV6yg0/bfEz9/abgHxtnzl5nDfmDZvYPubGyyFpM7AwGsIDVrVDi/4An2WCmVJV0zyncuHyJ
	7f7XYITWLH0sNO4bpLaEckfIVX332tQF6rz8ck6oL+KmfmhGE
X-Received: by 2002:a05:622a:684d:10b0:509:1a36:6ad9 with SMTP id d75a77b69052e-50d629c3819mr185805761cf.30.1775558811145;
        Tue, 07 Apr 2026 03:46:51 -0700 (PDT)
X-Received: by 2002:a05:622a:684d:10b0:509:1a36:6ad9 with SMTP id d75a77b69052e-50d629c3819mr185805421cf.30.1775558810617;
        Tue, 07 Apr 2026 03:46:50 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm47139435f8f.30.2026.04.07.03.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:46:49 -0700 (PDT)
Message-ID: <feb13e02-e6f9-4b46-8944-1444999eb478@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:46:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-4-5e9119b5a014@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260401-waveshare-dsi-touch-v1-4-5e9119b5a014@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i0zopW84OFifjK3vS6nFJ508KZ7X3WjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMCBTYWx0ZWRfXwRghPl+Tazsf
 3hhp0K/wom34LHlBhV+qNsVx55sDvT6F4dxWSm20TDBKk2Qp/KM254CjkBy03Ga7Js7ZEPkVolt
 zvNq7xRHqflI4tr1CPkbZ+ZPXuIyHfARuj5VA/iOZPF4AneVkMix21mGCAmti03ZQ7fAupC/29I
 ZzMkWwLGNQ20p+ZK2lPMplIh38UAkkE/I5vpShW1W4RLvY+aXmnF4znQXeHWKNyXG8WFoI0YLi4
 EDHIMOyMY4G10LIAykPjZfESJW+Sn2Y/KtHMngp+wBOWkcAfoUz+N/kKgawNgut9gS/wETyiaCN
 zx0ose6WnY3ll9wIgNcfL6WpISGL3V9HjzvXWu5RceJdw+hVWnWmjkWK14kKDmgeHqUd5qVLEv6
 50dgtcdCg9/osqj6Lz19QjmeBJDEYE4vMGdXeEiNDKBirzMrPkzf2pmCoZXHo8yMs6Ozb8fHqxO
 ylaNUDSYB7cjHbgqaxg==
X-Proofpoint-GUID: i0zopW84OFifjK3vS6nFJ508KZ7X3WjI
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4e09b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=oEhWa5UVeuFdW5Zz-UcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34777-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3AFF3AD2CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 09:26, Dmitry Baryshkov wrote:
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> index d979701a00a8..42e35986fbf6 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> @@ -24,6 +24,7 @@ properties:
>            - raspberrypi,dsi-7inch
>            - startek,kd050hdfia020
>            - tdo,tl050hdv35
> +          - waveshare,7.0-dsi-touch-a
>            - wanchanglong,w552946aaa

One more thing, this looks misplace/unsorted.

Best regards,
Krzysztof


