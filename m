Return-Path: <linux-gpio+bounces-35169-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDt4Ajp732nFTgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35169-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:49:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4440402E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 959FE30138B4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 11:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B03737BE96;
	Wed, 15 Apr 2026 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExWWm9lP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kj2Hcx2x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165702192F9
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776253749; cv=none; b=K5t8hSGFLHOKhCu/xsYrXh2VkxkZvYqymzqAcUIYiOjAqlfbu17H45aQ2T6q6j4/GChmRKQFb+ZHE93Fync9t78gSsHG8TmdLgQ3anQoiUZmIORn9o0FpcEWADuJXXWeleFFHnT1ZvI/5wlTDiAaF1L7a7T05cvHjMTDDHt51Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776253749; c=relaxed/simple;
	bh=BeVIX3+yXifAg92JEMF8fUzLL4UnEBRx9jVpPwh7GHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ar+hfJR9s3pCY34QEYhA9R8VHuloC7Jd/b5YUz4rJIZ4kG5aMRJGROFFv5wC49+OnqI7jlXrMBOf8Z2vPNulCi7I7ckBknUxLpMT+2Fq6BoyRrVzwb27mOC0IU3WWw/eG/NnNGnzAKcGCX1KKmguc0H8HUEVcf+x0zgwG200yNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExWWm9lP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kj2Hcx2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FACeJK1701741
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRcoJaQFefkka3dgm84pE6p9Dhtaa4IjHa4M9jG6T0w=; b=ExWWm9lPlPQ/JcuW
	93DIZScSvgW45NLibsE/zelVjAxyPDiSWQzUqzK2pxSGN21tElvrsGfklWWw2l/d
	aePGDoLVsXRoEze9WqnaL6Npb2S4lOeGifV/B8igR70NISQrbepafgo5zozGhhtn
	ApWBSLh2Ka9Fj10sKEG6ZYPDK26iu+j1iV+jmqH9Zj76HeVQq6KI0nPdVrPepDfk
	0VoihgM+4h5JplA+Z580TeFYKjcRIPnyaIVoCkSxJ6C5PLrmWu4TakaqS2dILdpj
	KJo8n2g1ubuBOCXM60Z3QrFepB+JeQa9zHsPVoLQaeIX7J/oxhFJumGogDrVPemk
	NXHfXQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56u51d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:49:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb3741d12so8839026d6.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776253746; x=1776858546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRcoJaQFefkka3dgm84pE6p9Dhtaa4IjHa4M9jG6T0w=;
        b=Kj2Hcx2xpfCDHufeoZF8DD1utZxIsTPC4fUNZ9mtML1RP8p7henXAtRUdQ4Tikwghu
         U2rGIEv3cs1qVXYy8fYdE4taSXabS3dV65wIEVIjOLMjcw1dFjCkSLsRTC1Eh9BMR7sY
         hOBVS5aXuuVOeGt/myOypw6k99Y/RLfYWsPDAtBK84rK75gj4E6+UX1podYlyMjxJhWW
         m+0xezZRowFCR5E4abNMhyLoIb9iGk0j6HvaSWy03Ulgvr2TTMZpRXdoIVH9nTPdIYa7
         b6ylb3Vg5BgivP2g3iPnIqC0Wh/XsiwwGqXVNi09AC0IfWrqCN004R9vvWX4K7RJtqUu
         BOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776253746; x=1776858546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRcoJaQFefkka3dgm84pE6p9Dhtaa4IjHa4M9jG6T0w=;
        b=c1fTV+BkeZdkyDYR6G+/pvLzztqF1VQp5ju7Ghz7kz8K79ggFmLC6NFcI3Vwkgw62Q
         6pCT0vmYLf3Kd7d1WaJE1CvdlIz93CcVmslRLNuwMsoXzUjRotJt3yDH8UGT/YSWPIKd
         QBrwNoKMXRYiaC97mUVXRm6JGieuKE/jvF6fzrp2sJ6mTG5jCn4mVETCEkjpvqRbfNM6
         Y1pm5dofnXtsW/wdn5zz2/kcG5YmXXt0MMbjpud0gcKjERBBdqLRIj2c78MeRS2w1rfs
         vNJh9OZR9iyREqllEaTvx4azr19ex2I6nvx9PuLPq51Veeqt9PfVlNhSB0exqoyCFEx+
         JQsw==
X-Forwarded-Encrypted: i=1; AFNElJ/tXi9DxhGzzKYyTwNW57OJbyLlF/fFc9c9F9p/JMjP9aGYkvJ9hxNJFa/iLIUM6RJai5gbz9N4aX7w@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJFi4rPesR2Ur/D8BNFyUYE3zZBmim4kvsAzbHR9XpCsCRJyj
	xS4RaBWc+mUwz1rPipRSInptiEgCIyqwPpODdt0g2zF2KEU9Gq4NjpYSI2cusyvgN1rpCpr1PKT
	kvkOPt1USNwcd03zjBwntCr4mLQnlyhvygJO/VI/40byEuy3NXx1aV72u0j0Z34DR
X-Gm-Gg: AeBDietPSFX0LICSvGRACxISkbGJGXRfU7y9VfeRZeBto5tVZSit9BDYMfqOgFaODxw
	aahrtkiz8huGDfgWIfAwSxRHWXUKb+MwIsIJaRs48y1uKPL/CNbvesUZzvlrQ2mPGYAtBPlELbz
	BdC1IU4Znirro9RGckFSP5jHEO9QQhO5vlxPD55e7710D3lnQW/Xn95A2exD6+CGvoJfAiwJmiX
	KUhj1YhqtLVti04/bLFuznLGP+pS9hUyFU4uGXqMqVGrF2l1A2RcuKlZnwfyKWssPJJ0MPNK5mI
	mB7U070YZKbTpGpu+QTkLEzFJCwYNPLeL1aJHRpsPqK+u2KNRvFwBLi2GxR/GCYS3YZ+ArQgTCT
	gk1pWoybbmqthRPc0T3HglO0szCA/LlKiUW2cIqlrx6VXxQgaJ9Blv497U8bwMpLtMoxKXhQGNy
	F8S7i1dpX6F/tzbg==
X-Received: by 2002:a05:6214:d6d:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae6a8ff4dfmr26026896d6.3.1776253746433;
        Wed, 15 Apr 2026 04:49:06 -0700 (PDT)
X-Received: by 2002:a05:6214:d6d:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae6a8ff4dfmr26026566d6.3.1776253745984;
        Wed, 15 Apr 2026 04:49:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba170629d7bsm50353666b.0.2026.04.15.04.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 04:49:04 -0700 (PDT)
Message-ID: <de0b1b6d-caed-430d-b152-0342ae4388c6@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 13:49:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Introduce IPQ9650 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4negAxw4c9qmaQo-W57POqMQsHkinZIf
X-Proofpoint-GUID: 4negAxw4c9qmaQo-W57POqMQsHkinZIf
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69df7b33 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=okxuOKQQA2PoeQeDH9cA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwOSBTYWx0ZWRfX2YqrBt8czKr/
 hKdRTISUxQDDtKFY4QM5U2k1Rc1ZsR0R9rq6joDaIGD17Mgz1xeDeJmAJvXFgscZJpn24ZydHyc
 DQJvZr6z+5p7uE3rZnTEl3vBRXTbtEye/tGDqc+7foIcrA/QHRZautgl6ZZkJDQsXQlN4yoV6Mg
 ZDx/v+m+7zx8v1KHADGoAZIjO4J+/VOVGQxtHMEONuCrb1AXpqInRtfa17q6blUi3lAgrQXQl7f
 HMT5eaipbsb+VDZO6Nq2EXEut+4VtUPlb5/+bBCusADFKqvRpUnbACSfxgRbB68cvuLBsMFNJad
 V+lwdJ22Ysv1QBGTxgqDJYw4e2UvvW2MULFMF13lMNPXGU89cfEQEHiH+jSCaQrQRImoQAp+ryp
 g0KW2eTcJ6hULfJ1Xra+NM1XHv0jbAKk2adTEN0PNOSSNKipKv163OH+rhB0+z9K6gZvQ/RM4ry
 vxBdRyergNoiz4PHQsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35169-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAD4440402E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 1:29 PM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

