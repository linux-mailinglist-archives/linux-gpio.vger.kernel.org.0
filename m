Return-Path: <linux-gpio+bounces-32913-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKDoKBADsGkWegIAu9opvQ
	(envelope-from <linux-gpio+bounces-32913-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:40:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C4B24B3F3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A40FA30C3063
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 11:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46B138A734;
	Tue, 10 Mar 2026 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="De5oVRMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2jrtKhC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34037B413
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141999; cv=none; b=M1jAkEpt8Dbvc3lV0RowVegLpLPLGxkwHRjAKCPifN0KRLDyzNiUsPseMStP28+NLvGLwqEHRt2qbXD7Ii+qYFs3KtWZDWU7ymVG4UxIlnfSQMcoyQAcRP/sWVG9GIXqhlR8HYS6qRydMBZ0D5hG7mTOjVkDjoEP/Z1b4T0ksgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141999; c=relaxed/simple;
	bh=u4cpgBsAOPuxLzwpHwDVepez9bn5DsSAub4OHQKackg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VwiH0jSFD1QVT7VpFqZnise4ituE3uYJ4ufUMrwpjBKEmrKDmDpy/WLqIhoF6eLXAEpmDDEaEe2W4VxRUmv5X4miU/4wUSlIOa5+Kk0iymjq7ST/7f/gNuX/aoIWHPYWysm9fXZX1rPyu5716/hn7YwRtbLfSKwLGgGAGq6kzJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=De5oVRMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2jrtKhC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A91ech2363185
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilmEub04l/yoNaj3hejIpgA2R8zZZzja5wJSgrJl5VM=; b=De5oVRMZCvuNi5fA
	CcrA57pX7Zv2KvwQT1Kc+x2haO0+Y5ufHPePobOdeUbirYLvJEzez9z4Cr6blAbr
	9hboCMNd0jxyDkfgqyQJi0QOjL3u9ZhgC0ooaMIorcExKzK2RLGc7Dwr4W/uBhu6
	dYT0T7+wY0M+oOcrlhx1gXFq/71GXR4NbBQ1yo2O9PnUTh9hOYbtz33sQdmDvG6N
	0L5XVEpoP7h9CWd02VOFSvznUrPr9gbNqWUHI2Mv4FCptxmdi9oocjQKVzp4QEid
	4kyG40sLgRrIxQjHLTK0ZsZdHUMAmspT3GqXtLGq7sDus3qc9rNw3z9XMAaIXc8J
	NS+xUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032byx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:26:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb50dfd542so866801285a.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141997; x=1773746797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilmEub04l/yoNaj3hejIpgA2R8zZZzja5wJSgrJl5VM=;
        b=M2jrtKhCVczIWNpJemoufDRlDuSNocs9ML+p8Cwq3PYaJjTNPKnJ7JjU1i5xtqb9xc
         tVks+crE2zwlW/jrw62au8UdWdE5o5WQhrvl/Z0Uf00EiKIhjzHgd+yaywbm5tVH9I8S
         6qD12wgD18xRlpeEKUKMU7+wJ1tkD6RHIICYn77yqfwk5POxpVLGyKgTTQ7GO5ThElyV
         upSsiKVXLhiUm7jjxSHNH9ZkzumM/lSkvcU3sv9wjAw5rhNN846l/SZpTnhWWfbrkbLc
         aG5wu5UoBc3QWbPN5nct4u58ZT6JiJuxNtv8qnlC5sxckZmrWqjCu18ATxK6OFanPJy5
         8Uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141997; x=1773746797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilmEub04l/yoNaj3hejIpgA2R8zZZzja5wJSgrJl5VM=;
        b=UGnT9jDYEEKeO+3WEd8qhwKHH3hzklqFybC2GfB1NQkznxzqw9JoS7ShVnAXIKr9TM
         En14/2Be/ifprhOvYpFs7ENj9euDwvL8izGfYvaHhjwVTgKwpZzjbh7SMrrgGT6w/cVo
         YE5HU5n+4kpnjUM9LKr85FEkjJH2J9vaZiS10IZSkEXHSOom0NSYVY6O6mE6poiu/yQ8
         4V/R7d/8ikmOzzk5SspK8JKJC8zAFPXqTs/as0RUipABtfaqX5TyLJJao/+ixwk9bF1Q
         j5lQwHGsJYe5emOeq+h5lyu7Om9oGG4U1SOlpn0AUGUMDAM49+XF8OC3bPiHwCKjfDIF
         +bVg==
X-Forwarded-Encrypted: i=1; AJvYcCUCWNYUsfgP/LFK3f2+urFRPVvrFOYn+w59THhhpRhUx216w6H+2RputQgkqHrqtz9icFnV4nWU1leO@vger.kernel.org
X-Gm-Message-State: AOJu0YydNG4iu6Le7jY7Qa+GM1GkGVmUa/nDEaeWNcv+0yudWfyJbPEc
	5PhbARhpziJuvVnxTxWGG7snudMS732Brw+vWdfFKgZXVK/Cfg6fUXUNCoTyeGxcGH9FT9XLRh3
	sklAYDrbkBpxbm7aoEvVhO7W5y/adYTo/OPqrWrFw7mRTY7EjUzYPOYFzzicNC8Na
X-Gm-Gg: ATEYQzxm4qFDztwdowth0h7z5iQRlUZUrZt9NxpqdvRX1d/xtngd5CD3ynllKiomepS
	Xhvyxyd4QQTLoiCsIz22WMZKK1lPGD2YL9CcVYqRoaGOZpV7Fbx27b5CuG5acgBMxepVUM+RZbC
	mlXj6SkQ+fIK4X7c35MT0VgEYWtXOuM3LmOdkYs838iTC2sSmu1pQ6UXB970rW6reiEtfvLPQUb
	afnQoaMz41COmyCELZEBQaPTddARS+fxElOm2q0bh2QOJ9B5icBPyYL5+QwNiNol0lCvhNRGMts
	fytIXGzkK+T01fXcrg7hDezUc/0tXGX53KQnahfwzIEbPIAZ1F27ASEYUcPeo/uHSTxNhk7Tees
	1pyOjDMOq4VdYhlLbV80zOjRWZEFZZkD2f6gLMLOmTVhthlz1fjWk9tERWykpcir5jsO4ndNLMw
	2/9Ao=
X-Received: by 2002:a05:620a:1a28:b0:8cd:9446:cec4 with SMTP id af79cd13be357-8cd9446dc04mr240534185a.9.1773141996896;
        Tue, 10 Mar 2026 04:26:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:8cd:9446:cec4 with SMTP id af79cd13be357-8cd9446dc04mr240532685a.9.1773141996465;
        Tue, 10 Mar 2026 04:26:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b970e8ac4f1sm101640166b.29.2026.03.10.04.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:26:34 -0700 (PDT)
Message-ID: <995a76be-939f-4bc7-be42-80c51de6087d@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:26:32 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi
 gpios
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260310012446.32226-1-mailingradian@gmail.com>
 <20260310012446.32226-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310012446.32226-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX8WmsggOQDhGF
 SPqdBiql6g1Qg0aqlg2qOJ/+q/OhYD8ReOvwRdVIwncZ2bhloZCtTOyVxv9Oyy90tHbd/ILY2ok
 6biHFt19MTjwLjG/cg7t2o3aeBWDgTpR6Kfi3KRL+8EdU69fRprudQZadScMy9mTfAUlk/sOh2f
 h25yA0dEKtOKkZsJ06h4TzGwZbc0vsF8RNHeAALDXvvouk1VLZMtBl0wHqJjKZcW8C6DSpgXdCs
 ew3/0RJmvJg++kJuwfm2Bzbw1NMNlRHpXdJy/sdhZtv7zOgI8IH9hR8/jTTOKFkZEzAPvzA0zOt
 7ENfw7GxsUOUpRCJ8tjduaSY6C4BhdqaWG/3dY7j7C/2fJaxVkFVx/S6wdXU1y9XMjD2DXbHKI5
 N1JKsZkdoui8uINTRQW7UXc5tSsofQrivyXlRPqRlaZM4JB56chmY9ujgiMnSYL9y0A5uTE6ghQ
 MgqliCrgdFzzQWikUPQ==
X-Proofpoint-ORIG-GUID: 4bV55N3MhcMMMhSRHyK7ptYoFvhoqu8W
X-Proofpoint-GUID: 4bV55N3MhcMMMhSRHyK7ptYoFvhoqu8W
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afffed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=lZi8hNnBo1xzNWG_37UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-Rspamd-Queue-Id: A5C4B24B3F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-32913-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 2:24 AM, Richard Acayan wrote:
> Some of the GPIOs are reserved for sensors since the ADSP also handles
> sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

