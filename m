Return-Path: <linux-gpio+bounces-34927-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFmzD7Bl12myNggAu9opvQ
	(envelope-from <linux-gpio+bounces-34927-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:39:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD23C7D74
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 651DB3024946
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469D43A640F;
	Thu,  9 Apr 2026 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnYozH2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1Xk0Eos"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8103A3E6B
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723932; cv=none; b=Ss9oYrjCnA4mbT16MQEXzqT1bO6o9rVHynQFVLEbGQUyPmUpw/MK2Czqf5qoPJnHQ+hiXewQjh2aQUErOUmN7YXFga1jfbQx0Aw7Hju06Tbx6g1E0s+u6+rgRvJJFvC9xG4AzO6qYxUhL8pcMrG+MpTkZeCd/yg5RxSLiCxowI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723932; c=relaxed/simple;
	bh=dyEYiHJn+GTHqglyejYAPDrVqkVAks1wYNWEwgjs6cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pkZql9aBfrCCrhvtosgNxhSmk8ZbypCVft8j9FhCPYL4pdN/FLo6nfvUgVNHmcnYEFUv83S8UofTz+vfbZmvO76CSMMDVEOKDrbbd2+jd7N/lg09NhOcAO92quD608vgG0WJpiienlU5kZ4eG9EHkViZnci02GiacTpk4JXQlM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnYozH2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1Xk0Eos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395kTZn1613667
	for <linux-gpio@vger.kernel.org>; Thu, 9 Apr 2026 08:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eYwBa7/PrdWkGLaZRdNmRk4LtVyqDp1vHraC9+Qgq3w=; b=CnYozH2b4HT+pQf7
	vDB8RUiEx9gIr6MEUJfOqr0QvZZNAcOPEFitLDaDLAD31Nl6+3ey+xXagusradCb
	miswIkALGtL4Su/cKPX7pnLZSz0DfaNxPyO1YB4Yy4TOd0rDIJ+IBtHUH/6GZU78
	BKXC9MHhzdNZv96c3r44CFjx5BcYGcHhoUFtsXFQ2mOI3DrKf5dNbUF2W01MxOyf
	EJGKYZacdrsAGHq6nDtH4M9rPNXCjtaqBjaPPeiNGST9/AcQio3GE2bnrbaeZvsE
	/lEUPdX0UqDwHXDxrJ1Dkod3CDJDg/Mrlt2VL24b9dmvw/Gj+hMJqOJrDPy2fvpV
	CQP4yQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de68v8kfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 08:38:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d984c74a8so20134211cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723928; x=1776328728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYwBa7/PrdWkGLaZRdNmRk4LtVyqDp1vHraC9+Qgq3w=;
        b=G1Xk0EosZ0h32t7+GnKx/3yQCoIk386pRqpNIjCOf1ISVjsuCyL8zGn5i9+grTo+/p
         WyLZ5v0UTslqCNHyLYYkP8VY1XEe5KAkpt21w35TQDGuMS5YPT7TNqlVvrr83T259VLC
         EWCOael0tIguJDOoG2CJwVN3ABu57orN7ReMxBfFD4UPskyujP2gd2YGfWLH1iTRFxAq
         xM6+lQ9c4Il+b32T35r72wBeUNeakWovAwve/Zf3zzn5ecInuNy1b27DJc0A27VIRbVY
         5wEuLZOm3dl4g6bcS+nN2lUGItENfE5wnrWaI+4F5lBYcy3HV++IfI3MMCZsD2k/If7M
         61lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723928; x=1776328728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eYwBa7/PrdWkGLaZRdNmRk4LtVyqDp1vHraC9+Qgq3w=;
        b=bmwwiCnZYewOihauDzfb7elkH73AyAljDOJO4lXKgYZEMhXrJ9B3eLMMnP7Ggl7rWS
         +2DKZ03ZzpNCccE7i2ig2/CjscN0pu9O244r4ZDd+/Qg5sXgy24aCKE52y8VRpaSre3o
         DFazCL1wWiv7SgkvYcxbWvqgRpuV1ZAuHVbuggigAm/tx/WqtJqfazLg/43yCI8Fawqy
         nn8hxMGUtjsjncj/LncsPAVEPWwnE0bekQnygiSOzh0rHR1E1FVLnQMz5NDQapVDx7hl
         rRiqix8r5TIk1yiiu5ujlAtDN43ieGQ9cl72T3jX+J4P2P8NEyYWQqYMyoqnem3mffpl
         c1UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM2m7rIldVkZ01rFX5KRm6hERo1k0WsoCtv/1lJy+QUTx3yHPseodpFB7d6S2i6Gc6sOwOO/G/3eO/@vger.kernel.org
X-Gm-Message-State: AOJu0YwuDyB8NOhzYju7SDtLOBfKRFpn60/csMvjY8Q4bsEnDGs4/9Iv
	OlvSXCFmUcf0OnBfhvBq4AkgY1AF6kHhk7QH7/hXKQNctVenrz/xa6xEQHkF26edfiZECMB25GA
	HpB1HXU5/j7F0u1eAkMQeXz0J6yhlW/x1oB7JzD11yHJPw9P6zShQqm6AWr+nfGB3
X-Gm-Gg: AeBDieuTNIxchC+W0+siykv9Nm4c5eCqrc6dxhdBoMzZ+V9J1MuIDr7/lIuUvfhih5s
	/5wR4JajOVYL89fKMKVGbLW4+ixfQAYkpua8Sn3ZH2jENMYLFizd3SCktAlT6HAaQpRQaNwEl9o
	r6j4Fx6560MrUUiUIWz1xmfZ4QTlw7+cZ8K0pSA/pkWrQRdDwR0qdI7SEFYzauF+wv1JQN6lgF+
	m5DO1mnSd9zPjazvz/ERYnH8BeV8pG4iyyWRIfJ5nwnYoueZN6bQg6vIkUcVVC3zvVTvHfz4nwQ
	rxD36h0BF4UoO27MCGTSQKjNfIaP7niYsRu2iWrLSP/UXXbT0dMFmi/bBJIBAl3XTYdW/Koepv7
	7C7YmW6bYpkRy1rJsttLJzaRxpWOQdbVFeerOaDPqQIDdLJhAMbY=
X-Received: by 2002:a05:622a:2588:b0:50d:6557:5cb1 with SMTP id d75a77b69052e-50d6557686dmr335304821cf.27.1775723928308;
        Thu, 09 Apr 2026 01:38:48 -0700 (PDT)
X-Received: by 2002:a05:622a:2588:b0:50d:6557:5cb1 with SMTP id d75a77b69052e-50d6557686dmr335304581cf.27.1775723927864;
        Thu, 09 Apr 2026 01:38:47 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:25ad:5d40:fb11:35a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c60a2sm63428947f8f.10.2026.04.09.01.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:38:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: robh@kernel.org, Shi Hao <i.shihao.999@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rric@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gpio: cavium,thunder-8890: Remove DT binding
Date: Thu,  9 Apr 2026 10:38:45 +0200
Message-ID: <177572390344.62363.14529394859379173420.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408093313.17025-1-i.shihao.999@gmail.com>
References: <20260408093313.17025-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 34-N3l0VhGvJ63s-25XTuhlQkNkqZdWs
X-Authority-Analysis: v=2.4 cv=b7OCJNGx c=1 sm=1 tr=0 ts=69d76599 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6WhlqGIWKwR2Oo7JxYYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 34-N3l0VhGvJ63s-25XTuhlQkNkqZdWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfXz/7FxQjXHlnV
 fML1L3eolWTM7qVeXcI5sMc4YD2LZyx+CiDBEStgSG7JjB9O6pzCmZ88orMubpLkAXBuL/yi6OK
 1NXqcwCzKd3Erlcax3z6daiX/2PXbf4RjrnHeaiP4aTl6R3iLAWr8/JjcZLzKGItHvgMIRisvMJ
 0dtzehbOieGMSoKcy/OYp4OmtlHP8bbfjbv2pvE71uqqwAaaDCRRjfMqkKKgHJluzsImsHRkrTX
 optvaoMhE7NOy55Er8C4b6CF80HoJqqlpA9hhbQRFb1mquyMbFYGoM0g2z/KvbWiEIMC9mbFVyP
 1cdMIAE2o9NbWKfSPgsdzxv9R7q87HHwsWJD5/bQa6Edkbo5VK860AU677PyFl6zZuBk+6GAjp/
 WoziKUTEIQoAR68NuNVX604uB+I0thGggCW0CN8iW0cfpYc5jkYX8Jc+d/arvy8MaQjPptmCxqs
 EVxfYhX5W98Ghhc9laA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34927-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBBD23C7D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 08 Apr 2026 15:03:13 +0530, Shi Hao wrote:
> Remove the cavium,thunder-8890 GPIO binding as there are no active
> use cases. A previous attempt was made to convert the binding to DT
> schema, but since the binding is unused, remove it instead.
> 
> 

I tweaked the commit message as suggested by Krzysztof and queued this.

[1/1] dt-bindings: gpio: cavium,thunder-8890: Remove DT binding
      https://git.kernel.org/brgl/c/5bcd451286176202f4ba84b89fd98c7ea74f33a2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

