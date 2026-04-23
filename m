Return-Path: <linux-gpio+bounces-35399-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKkbHe/c6WmNlwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35399-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:48:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B7144EC0A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF4F6301B72A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 08:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4E5309F09;
	Thu, 23 Apr 2026 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1s0uG4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azLp4wTr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD77817BA2
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934047; cv=none; b=B7snUPaNJO4NRcwY/Svkp/f+Xf8IFz0EBlmLawilDoyMLnRh/1ocy7HEadQHQqcDQy8TsbMRPtg+9npS18OfEFxrbkCWtfPi+NWbaf3JSqvRqx26aIP4LGyekpuX2K+DL8yFF9RJ/JI7eZChXS2WPZXJL4JPL+9N2uxZdB+RT9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934047; c=relaxed/simple;
	bh=syY9+l34OxW8CggBtgvOwmJI5LwGfR9oYda4fLIIE38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXvILb2wdmifO1fMhmj46FQTDT6arFUk5QmN8PfO3YW8lzw2p77QxNTk2X009FF727HbmF3EQ5ERn3FJR1QWpo9Wb0iXsrBmwgMHpKxR0ymnqoNyt7KL5CPgE77u9w/Kxi0ek5mHNGRuYk2qlFGb1ReCD05Ew7PF+X+yo60J9uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1s0uG4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azLp4wTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N5a58P2631268
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syY9+l34OxW8CggBtgvOwmJI5LwGfR9oYda4fLIIE38=; b=f1s0uG4RtlJnFjAQ
	WMmjrefTcjKSoi8igKz+H+xxwY4AGsXDUpzfDsJCZXSq/eXibH7sY7YfsrB+fJpg
	VeoH38ro65z2Cd7DDnhis0mLb8psytgVF0y/QHMV6ROa1UMPjmpOdM2hSCXqLSj3
	WIpC98cTVEkLHRocgezAvtVwM78JLAvVAKmgSum+SzDZy6henKyJuyxwVTIfqHxC
	Z1ZOO73CInRj1BnrbjESv4SQljmQU2yUnCzCI8WymimLEIOKUG/NJa1lxos+IS0K
	eYbxu+fRg6SExx65zTezosrxtjO73fvTWRh2IbSkdKaYQIIYyuS7O5pZdu8MOxW6
	ftKybg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rake2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:47:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eab2831ba2so77806785a.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 01:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776934044; x=1777538844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=syY9+l34OxW8CggBtgvOwmJI5LwGfR9oYda4fLIIE38=;
        b=azLp4wTrV1m5nFzNfB6axIwEkPc10RjSAhpgyWmbdIBVnDvTiWhOxxWXdNRS99jVYT
         OkR08s4OjZik8dwNis+DK7TrrZJJJzAqDydnWTfdjBBmVGuxB5h54GTLW7+LsydEvr/1
         Dy9pUab/Ww6DeiUPrS89gN4mu7ss16m+aKAXebK8Mjr2BludK18xibXFH/YitILhjSmt
         R7wA6q2clso97zQ+hqJfW84gPdXzsXeLA19Oc5B/70HOxXTxNNrMpzogadJV5XSn5omY
         sG/98K9JBuLn94NhYqKuu/ibnMeLksvspWbbd4C5R5ygAXjABd9c31ivEdUhkwjE2IU+
         z2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776934044; x=1777538844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syY9+l34OxW8CggBtgvOwmJI5LwGfR9oYda4fLIIE38=;
        b=Q6a6g8X7K0Mfsxenq/hh/+nbav8i1ap50LEYJZsAy/jbcMVAwk1ezAqsszJQAIeg0g
         0DIiNlaHrS6vwhJOvtCg9ZgqCR/O40R4P2rLwlyqVMIBsN2taQLu6/A0PyIqH+DHcjt0
         Xtueg542nO4b2gxNR2OYGJOw2+cWWemNuA/ML28NaW1uwZAjkmvTN9xnsZElX1smHhKZ
         ucGOEWMZKkxt7rDhLoxEj66U75hjASvWCuXvZI3jbAzLv4Q/Kt1niRsnI49KD2WCFv6y
         kf7pcfZ6oGFtR1Em63iCFmB7dCoxFaJnbCe/xfYRUVayjTIRy8MgCKDTT78iuF6yd9Qb
         4D0w==
X-Forwarded-Encrypted: i=1; AFNElJ+btKl2s8aJ06ykyKRq7C91U+kkVLCRrLoLygHzIUZl1GdI55Jtld9bE8MyBVmrriZQJHtIlXV3TeeP@vger.kernel.org
X-Gm-Message-State: AOJu0YwLKyC7en+PFumZVqs7/PKvrhWZ3Jf537WLMia0AhnKpQtPoCzD
	9RN+62JEIJpSVAJUoJQmlfFMfBzgrK1eJI8II187QdyMut3NBIjar2gI2p7D/To/cFmhmmSM6dt
	ClKvobVaXSU2IfThxjrVYJwqJdVVskGTxlXUXPRQmwGo9stavjvlMHln9tdxX+axX
X-Gm-Gg: AeBDievyml4Lb0lY8RwHPdbWA5YaTApm9eE/7jedUThSvmc0YNDrmBzx7ctoJBMpGPR
	8/qTVle/O2+U1g0Nqa+DZwxFI0PrMDYHwIxm9QDNLe9OMExoFYdhNBeDzNF69JfTpy8uSSZuvjv
	feLJWab81bMhSmoQ+fvM2wgdFeDHwGXEeKhdn/cgsOq67fiYcIwtBBN0AcZcMhLArdg+1pJvQ19
	BtyJZq41wzlOJQrw8RYTONO4nxSoLQy6SsMjh0tGb00F8XINSvOyXU+Oe4jQVaGGdNwOcV1rF66
	p1Rzqg41O3gi/ynuDRyd52s2CgKPywDeTlg5Q6PU3zucjkl4aB8J3sE1eLcr7TdM6j07/KbX0HZ
	jURHN7h2ezzNECdqDta0TdD6QkpxPJpqHFeGY3PanEv6VhapsITIFjQntAW6V60HZy9JD75ZmPQ
	+bguDyn6mnJ7wEmQ==
X-Received: by 2002:a05:620a:4114:b0:8ee:3b22:8368 with SMTP id af79cd13be357-8ee3b228c8bmr1088265085a.6.1776934044304;
        Thu, 23 Apr 2026 01:47:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4114:b0:8ee:3b22:8368 with SMTP id af79cd13be357-8ee3b228c8bmr1088263685a.6.1776934043795;
        Thu, 23 Apr 2026 01:47:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d67e50sm3597497a12.27.2026.04.23.01.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:47:23 -0700 (PDT)
Message-ID: <5dae3a56-a17c-4201-ba0b-8591646197ef@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 10:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] pinctrl: qcom: eliza: Fix HDMI_RCV_DET function
 slot
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
 <20260423-misc-eliza-pinctrl-v1-1-2498b365ff2c@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-misc-eliza-pinctrl-v1-1-2498b365ff2c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4NCBTYWx0ZWRfX2UwQdIhZX+Rm
 d3o9k6vy1AME+m0PxRkKq6uJhpxdAJ5PNlwleqIBG4g9LJ0W17jq3Lnp0SV7ccdYQKpM9P9vq/R
 qfyqQBzA5ZpQHnjJXjyyflEbJTbFOApfcOG+rNUN6jSwbdWL7U/TZ55AVorUyhxEaKyVma70RtR
 3kryYJGDWSDNoEhwqVqgr0LXlZIZCNQRjKBcibXsPyfANN11VlRPu2Tya3p5Cu3L4pTMrb5Gsok
 hfTnydCyQW1rAxc0paykNVWiGW3lyXmt/WAR4s30pHlcQ8CmGQJ5P9RENydaUc1BRbVP0o6HNiN
 4Ur3j1WzbWcS7jaB+BunzQ9VE4pcm3Gcn+jEXlra+MG4f7MGPCgiW3mkwc04WdYlCHnpYccPpUF
 dxtUsbfj4EG1ndZLBsAWFLnm/sozuQNAOq0vRGEd6C1b4TOtpQFdxBlxNjlrQMsrp7U8p1Q65Tj
 rZybISj6rgxGhWArZVA==
X-Proofpoint-ORIG-GUID: 4KFDElZv2YqxzjDUyFsxsixjCz4Ez7IN
X-Proofpoint-GUID: 4KFDElZv2YqxzjDUyFsxsixjCz4Ez7IN
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9dc9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fC1gGT9K2WKUjZZoiXgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35399-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8B7144EC0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 6:51 AM, Alexander Koskovich wrote:
> The hdmi_rcv_det function was placed at alt function slot 2, but the
> correct mux value for this function on GPIO 19 is slot 3. Move it
> accordingly and leave slot 2 unassigned.

No, 2 is the desired one per docs

0 -> GPIO
1 -> QUP2_SE5_L3
2 -> HDMI_RCV_DET

Konrad

