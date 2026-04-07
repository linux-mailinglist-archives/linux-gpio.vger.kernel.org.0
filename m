Return-Path: <linux-gpio+bounces-34806-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICm/ONT+1GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34806-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:55:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC733AEB5A
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A85730182B4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4D23B5837;
	Tue,  7 Apr 2026 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWUdLsb/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUpnZz7o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC703B5850
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566399; cv=none; b=u7ZUNqP9zlue8ShO+/GGjya9q9rCopNsnw10yL1Tn6Ur+AwgY/16gRZIHyTtlg+oibBkCxhyuFAk8WPU+HUZ+fD+4Dw740yhaJFg6RCbcQa43O5TMvb/I06/luRfTBTmZg8DvbaXJKYAWhbXKL5T9YJf5NkwYnJKyDee4nit7Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566399; c=relaxed/simple;
	bh=/7JajruVW8euFJUKBD5/1QuEFJkYqxbIDwjnYp3mFek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rKQ+rEUYYSdKg0RRJj59n12F6Cq3z0U6EbIOLxpd4cQuzUah7bakqs34AL3W4vJxoawBrm3suVSFu8F/JoXDas1Y+CAHBwCgc5slP/bGNu4QwOYtfO4Zi69ZfbvzFyxJt8WloM8X3es4US/yQA5LuhXswKoVr5dPNSBvo/8+bg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWUdLsb/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUpnZz7o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376VxLT1403582
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XrDDsM0bZRWra9LQXskX2jNqC8R85T+UXnJOE7Ij5c=; b=HWUdLsb/bhYOLBmt
	yUNSmS/WxSvL7UtDhdnnRF6oaR0WKtELdi+EcYC6w3/YJawwWjXCJcTualehwbWF
	a0xTMS887dVnT68CW0MyX2FRYj7q+kdTRtUcufELmujrRXn+M7wz7nMJhOK13AyC
	ZXgtnf6noowQWxPmX8RS66EEYD3GROxL+5mdFn5t2S3JmMZRqT85DgY07SjJ+27N
	IGVkHi3Z5tn7S2Lin231zQbSlo8rXeFeA5YttrwiY12akcNsqJbNSjESMeFHwa9N
	1tUgjAWOfNaGtpC63InEKvHGHmD8ouT+z9wjEAp6xpYPJVNiuiucp6lQct4A+/hA
	8gI41Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8ash3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:53:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso67556741cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566396; x=1776171196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XrDDsM0bZRWra9LQXskX2jNqC8R85T+UXnJOE7Ij5c=;
        b=gUpnZz7oYpLwcUD8j6D2Q/ssQysnrApRv/n34QS/N24+kN6xH5DjsAu81wV44Dkj5r
         yRE300gLRJywq18pV2i+3WmxhtLh+CGSRwU0OWwjWejcVZIgiTg18lq8N2FKA+BrifM/
         k2lSIvqOd6BuQB4wJhx3cmSarzKsojK07ROmTkryLRjrT/bDGNxctGhQEHRCjObsK7eR
         68dyP5kNMxrOOFiROX0rrT2Od87GSbkWTK3Pr1nNnsoLSOmdjkHXSXatFRgkH5nbi5tj
         DN/yu5LHpBWX5UkM9oSr1TI80d0VE9dgcFM8iOz6GSTl+4KcLfEgtm8zrRJQw4Nh5Nrm
         lrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566396; x=1776171196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7XrDDsM0bZRWra9LQXskX2jNqC8R85T+UXnJOE7Ij5c=;
        b=Dqc+HmnqtGC9zFZLYa4D3rQCoNTTo4cIFoanF0TIRp7vr3ZUMUgNlkMHbW3HkKqA3d
         LHYEk8ooAWQ5BchCGVX13D18rgOp3fSlzPuOD8S9GZ7mo/5Jzx8PoGgyezQI29tGGqQR
         TXztGsyVmN3vvQoWf6LLgM3cxsCtSG9Y0J1DPrMBJBnOFQIo5hTNFUId68i34ER0MWRa
         X1fBJixxT/4wXNI19rOoTXww4DtdBuCDsArxwX+hsTkrfFOjkqSj0uJbpK6jNGQgDLtf
         tYsos1YWBUnvDtL/x7LEPkiw0gXbdw2SZpXI/ujqYYJGrfJtbaLe8RXE2UB2kP110El6
         ESxQ==
X-Gm-Message-State: AOJu0YxT2PYtQAuDEIIhyo8Efhd1PHrhxfUMb1NRe6HtM1nInFyTqx89
	KdcQzXQg8ApgJa26X2LclPodvpeqWLQDrRzxCjVLfLi0OBMc+FWzJKLT6CLap0mlTLOXnQzdRsX
	souXE21/Yc24on8WprSitRDkov0eou6z74Z3gp2dkHjoTeRHDuJQ4K0ZXqueEgd8XIy7+YhB3
X-Gm-Gg: AeBDiesqcx9igaNBBvsopIzHYTN/bkO/CdPJbfO8+F3bOKBOK5LxrdXVgSuvZNTGkMF
	viuweVYQQkGS7yCtL9WtmQ2vHmvEbzAwiiL5T2fKKC4mCLODvZBpBchICaf8YfwMP7Dqjzg4m5L
	pjkaEt6kSw60jd+1nAAcoXDH2UwWvKcpulL0eq9Bbqkq2+TRnR3iWjbfbdaa60KHR4sZbUohI9d
	I/WNX5TVFdPmLHBbsPP7iuRbT0yafotLq6Rb5IRkkA7jbsrNOS45KRFErNmHOyeEvSfeYDY+JuQ
	+s6f0Yzxpq2GApmqzSP3+zvMmBt8OoaPWcATfLuBFzcR2p5XdZ8sENT17v00jo1J8uXekAfMQBg
	6+UQ5i4H0yX1mUnvdka8SdyA13faZPaKxgFV6Ibhl/hzh1ANSQg==
X-Received: by 2002:ac8:5f09:0:b0:50d:a602:1263 with SMTP id d75a77b69052e-50da6021b8emr24992011cf.63.1775566396517;
        Tue, 07 Apr 2026 05:53:16 -0700 (PDT)
X-Received: by 2002:ac8:5f09:0:b0:50d:a602:1263 with SMTP id d75a77b69052e-50da6021b8emr24991631cf.63.1775566396045;
        Tue, 07 Apr 2026 05:53:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577672435e9.7.2026.04.07.05.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:53:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org
Subject: Re: [libgpiod][PATCH v2] bindings: python: allow releasing a LineRequest multiple times
Date: Tue,  7 Apr 2026 14:53:11 +0200
Message-ID: <177556638700.273757.2923801356427376697.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260403154629.3944942-1-vfazio@gmail.com>
References: <20260403154629.3944942-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KCTVtl1lE5N896q7q-uhXVB28dwo2yRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX/IKwZPQczFmD
 a2Hk8ZDQNgYB+S/gQFxtUj2IDYjWlRykwWFYigOxDCxI40kBaXH4aqgIDAUex2ujxrGH8RZoGXR
 s0PBRmLn3AY8l2DU7juhEG7RGEyiXwO2oBPTL7nW3mqw5ag5PzdhgaYDD+KlRmlxC5UiGEYNNNr
 xjYT6CB4zQNBIzacPB4EvWuozAtZkcZ/3y15qmT5kYUOqx8qXRLTlhv2zZ/Srp3tzceRbbcCk08
 Uk2K2gZQleLwL/IPtjLdJnOgNLPCA+TUaGN7mFpT4H1mRLFmdKCcPrMIyljUaneiDA5buMlEeXZ
 bTbPfIfCjEsIf8jPpeEvfreVB46YwIcog8D+6jW0lROIx2ieLXelbRcb9fOTqYZZDGLGbDvlpGq
 Ak/IcRefUTbdp7JF3e5Vw7Po1mSQEtB1IX+TxfHEUpNjmDTXsfc693llfySUjvsOyoQbLupQq9y
 mL4ZYWRtzdxigjieszA==
X-Proofpoint-GUID: KCTVtl1lE5N896q7q-uhXVB28dwo2yRN
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4fe3d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7DRgxWuHDwjEjyksw0cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34806-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FC733AEB5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 03 Apr 2026 10:46:29 -0500, Vincent Fazio wrote:
> In Python, it is common for objects to allow their `close` method to be
> executed multiple times out of convenience. An example of this is the
> `IOBase` class [0] which is the base class of most file-like classes.
> 
> Update `LineRequest.release` to follow this example as it performs the
> same function as `close`.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: allow releasing a LineRequest multiple times
      https://git.kernel.org/brgl/c/bfffd6506ca11b409db7e478b6186256dfeb4d41

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

