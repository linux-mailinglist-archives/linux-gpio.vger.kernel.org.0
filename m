Return-Path: <linux-gpio+bounces-35780-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC2xJ3HB8WkbkQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35780-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 10:29:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A44912EC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 10:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4018301B5B7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 08:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFBB3B3881;
	Wed, 29 Apr 2026 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNIzo59C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnws1Hw1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A043AEF2D
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777451347; cv=none; b=ciXgq8jyBYAeyj04IxNHJ/TLl3KybeRf2fNzFsLJIsFZ+gkt01mIIGEU2uLQIQQSj2Y1mfs7Thd65Inf2x4aE+01tpKa1ttdczcKGXRa4p9Sky9Js1kxfiPK5qe+Xv/fF1BGH1dugcoxGv07axsspAGgkoT7U2TQLKrngA0m4sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777451347; c=relaxed/simple;
	bh=NMbmUa/Z/P8s1i+9J9SWnpDqu/ZnM5WIaLzDgULOUOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en8WpjZCp6pG96/yjGnzV1VjfmofSAHq2P5BtX3fBgwhAor6m8M+ynlg5dhUhYj3EIKwyvrTQzFmeH5xTV7uHfzRUgeAZYlcQCvstAFWI1Ydu/j4rtPeo8S9pcLJZghtKGKwq/yIr4gsbr5gxJn/poRa9LQttCjhktSIYOaLdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNIzo59C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnws1Hw1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5X05h3347832
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 08:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlD6Drlg3A7sUzQoyWrCGwHxyeMtG1KLVPsv3qmuRxM=; b=UNIzo59COmbRk+I9
	lRVW/wcxw3B09B/UKEnF9Q308iJ4di+UEodyA1hKRVHhgwy/+6u1DRV9Vt8G69C+
	5pIihZNK3rxgQULbf2c+tHe12pBtggH2fsDodFV2WehImHMVhmsj0arfsaA+1lNj
	nNAc1CysprUxHX0NOHzcdmM7EwYIT5CSSOsujNAy5GiK0hikOJyDoKgfwEP5LgVI
	9R+xbsQE1tsQ2gbbI+PlKM+1sq7l8+YOZ0O0C67HPt4e+Qr8oBWL+1bwkLdCfqXX
	OQRMsetxeopojSy3DWBGltTstPtmEnsM3TSOP9bEKvp3m71KR/smngx394wx38Tp
	qvOuww==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4tfhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 08:29:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so27575687a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777451343; x=1778056143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlD6Drlg3A7sUzQoyWrCGwHxyeMtG1KLVPsv3qmuRxM=;
        b=jnws1Hw1G/SVrladfDA2BjGw/1Oy0iZm0pihCeTVNN2tM/EAmPcniX3Il/Jj59M080
         clIOhtvao6/FjLvHGEUdrwdmKbBE6Q6+km77an4x66P+A8rz6aCey425k7jWaMQrEgKu
         4kFDdJHn6EjnqiAyKMc92GmF9W7OFGD9/QBz61xqTQJlQdRohnNt0nAa49zU1r1lgPPp
         ed/CiclzzcQyBW2+gzVreJ4g9/ZLLbPIh6hF2uuYrjC+MJqnjOO5Iy/UzkMAxG1ATQHz
         vJT1iSPw4bapmn+FWdIGUwOYWqFOx3em2JKhUQWRCRz+l6oI2YhKoJk0FvvyKamva4OB
         UJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777451343; x=1778056143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlD6Drlg3A7sUzQoyWrCGwHxyeMtG1KLVPsv3qmuRxM=;
        b=nMO1prUjLMixRNUjKOltZAp6OcyWtqE3g+TRJAIWrNmK1hJV9kyaZ/wfK/qQVtQ3HJ
         BLjibcFxeW4Fo2/LMqHf6mO9ZqJjHkjXAhRTyxbC4KjQwQKY5h0kckDjhGSHAyo/gbL4
         kTXUDZeFqlZmLjHjlPSG5Bi3WBmQmP4+npgXjHVN95IITo0zJZVw0IR4/nnqym8aa7DE
         2mJzIJfw6sylbNPwQIlg8ElrtgmUqLd+hWi6DDz3Z4fZxD6uAL2jO61FqyHyICcIkKlZ
         E9+oA76BooSDDKMoqadmLe8WMfbTussGdxcSNgLqguG2MGNNXRShjUYzP0/RfSQ2t01W
         tDNw==
X-Forwarded-Encrypted: i=1; AFNElJ/iq2GO8ph/sFbqJPWMSzdQCEqONM8xf98oa9z2lgUoy5HAEMkYDulFeuaiJ30HjZmgA9mQYyRjr7Bv@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0BfRmQOgYJXkI6B8sy5iUk8L1agodJbbJrmssWAGCFuIB2YU
	N4VDy/H2QaEVROMFh6mn45Yc4Nx5lv4wXzrVaPZlyubwWS1UzHcQ7RflIsWOHKCGB0h5V4D521N
	OvH7+7upS61GcRG/6wIQ55b/96YGLuGc7Iunny0j1HTr3Jr+oyyS87i+wrEB9xpF0
X-Gm-Gg: AeBDieuxo6/0nV7bTJgKb/boUaqYzvc38ISlnQRsXlw6868hZcCphzXx5FuGScPDEVR
	qOBsicBAjbDCLbpSlgJooeEHtTMAhzp05pDkCd9in58O9jMax7lhTGDWR7o/fT3LYaXFpd675bz
	2KIwtLRCAVtonI7dZpes1PZ8YiJhB5WI6tpBILUraOdjalpEF7nYf3Xzxtk0jMplEG9/e8EXgv1
	UcJhZyBWo1fWTBLxuaU01gMPmtDbUHAzWbMqQUOcpZ6GlvS+YXVc4SCDBUQ6E1vdvdrwLb2YyRB
	kpXBKqnnVqoeAbV16/T0rSkF752rQqcmjLTPUcqaZlUatN4PsZ6Emq33VF4nm518Za8FNPiLVbo
	IdcfDiwI+gEsVLHRnK/EVIb+ydZxhbVGgoJDd5fVc/Pl5Rj80y6pVkxrKaMqWT+XIhjfNnteVRz
	xKkp5qWWBx0zeYblDgn4H5jTPwc6e7sO3zjw5FbhP4Eh36B4sHSxk=
X-Received: by 2002:a17:90b:4b8f:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-364921bfab3mr7376146a91.21.1777451342798;
        Wed, 29 Apr 2026 01:29:02 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8f:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-364921bfab3mr7376128a91.21.1777451342309;
        Wed, 29 Apr 2026 01:29:02 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a41520dbsm1396271a91.3.2026.04.29.01.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:29:02 -0700 (PDT)
Message-ID: <cc4380d0-d9b3-47d3-bc80-1c970ee7a5ea@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 13:58:56 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com>
 <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4MyBTYWx0ZWRfXw0oLQZWhv6mu
 vOd7tu5eLcmKqp96d4WUv6P60d6LbqL/L4vymJZsZo4ozSU/+PT0volGK/0PnO3lpmfXOUhf7v+
 Tjjnl6vGRk0QcPXeeKsXdNPqT/rPy4oRQCAww/csOHpdEgXcVwhTc+mjay0HLFpJpbw1Rb+cbNo
 MR/f39a18OA533bbSCYpeGmDnoapZNkCjjZ+Tl5GJVv19No6dgFcS9b4o16ur54Q18HfsoJzuFS
 bz+5Zfkc2EbzsYA1/5nOAZVZIQc3a0Ka9mv1CRQ8WZFjEfH6r4NqHrPVIaucDVx+b31e6uRrhXo
 LQhnJFgF3qdu4XCl3FCflpcSRlwAQLfAKMEHLbZ26nRZfpWUd0Pk9K2JBOE9P1KKUrbZRh0Zuax
 MzKLdpBIkoSNrOh3Y8uPzkTe8yB4Jirk53G2jItrY+5TuZlrGYVZYbrfS2IKuXbB485HQQLP8oQ
 /VmMN+LdXqdIfk/L7sQ==
X-Proofpoint-GUID: 4bYRztKpHfzV9Kn6zQ5fEWDYhhrhLDBr
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f1c14f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HC_c-dvtGznJx1dPDJUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 4bYRztKpHfzV9Kn6zQ5fEWDYhhrhLDBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290083
X-Rspamd-Queue-Id: 3A1A44912EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35780-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/2026 7:18 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    8 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 1771 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1780 insertions(+)
> 
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

