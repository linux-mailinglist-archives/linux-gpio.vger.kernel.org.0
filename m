Return-Path: <linux-gpio+bounces-30845-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI0WHAu2cGndZAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30845-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:18:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC1655E32
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AFCF362A88A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 11:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF8643CEF7;
	Wed, 21 Jan 2026 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DegJO6YG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3dh4C18"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103EA3ED122
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993985; cv=none; b=rkZNRY9Mcea2UN/RRcbBw7RPPj5wuK6csVE9dE+vz69dGiCmBuhWaNEi2VHPEoFD+t/b9xAi+Bws6xGm1E5pGsFcFm0rztPt9TUTBohecvNUTU261bZL/IuVvuCau5MCXYrrrQsi8OeYJKkm0arAbqfqQZwYRgLOrYh5IVczyk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993985; c=relaxed/simple;
	bh=W82zO5p1N8qPAJFgSgyiE4He0afarAefa2tFtiQzfpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYnIeh6VrU4oDa84iOpvSKKVW8PIYhbRBLDlgOO96h/BSMTNNI7QN77vJsUypU9sHebFEbFbMRVtzag/bEaCBlJ4vXn8yn6OcuM250oNCVQC5udeAwPrpoko5zdgbSSxaCTWoKky8Ff4X06ThoWfIoLlHq/UoC9E0G4Knk1kVw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DegJO6YG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3dh4C18; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9iWuY3481446
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xu01O4uXDlSEGNGXJLTTg5rEF5Hdh/2ZsLcSSMpmGZ4=; b=DegJO6YGfHgx/fv5
	uzo/fNb0/Kk8VK7N/zSFyOK3B/AWYDHRg1GNcqYXADqBZXkF7uH4YtQz2VzUsGc5
	O0Uwb5omNjzcCiHomKLQpmd6SSSHHqyfZRILs8JxwBeE+SbkhflNFYw/yeYHM7lK
	MJU5VcB6V40WT23NvadPJP9WZN67L7PmTYuZZm4J3TXzWgQcZtntNtwtcsbZtFHv
	N6KtPzEWtCeD35+19CC/eYvAk0eCyKvZLW8Xz4H5DlUUmoJXOVEo1NtyXT5Lyf2s
	thoPbRj+SG5LV5BwthYA0VYek0/jmV4JA4ZkAo7HpsDOw2huXmYC2fDlYIUeX+Us
	ubZGIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvef0b9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 11:13:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c532029e50so213631085a.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 03:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768993982; x=1769598782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xu01O4uXDlSEGNGXJLTTg5rEF5Hdh/2ZsLcSSMpmGZ4=;
        b=B3dh4C18TYu9IZRcyY5nWuiiVkBIIFKVzof7QXTo3x22Tmq3J6ImYqoMPrkB6Jk8yI
         caEOJ31w5nLXXd/QZfYsqSe/AYaPfcgiRTpkG0RLNnKHc4mbWnfL0mxddMLcWNb9EK2A
         McFrhEq8YNmuK0Q4qLEvlkb/L62d5tDCWGmFGnagv5OX59PQtgpSbcag8XAu7T/Y9d9A
         J3jmpioA3enaKFkUwgNd+POxPzC/ZesKq0GRt3IHjMOnTJmgppw9y0E9/AFJ8dPJd4PX
         csEoOIW4E1aAeJ8vDY3uwKpJB1IlHa3XEE5VSwYrBnGCDAyn+6c0kF/580b0PR59Q19N
         IHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993982; x=1769598782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xu01O4uXDlSEGNGXJLTTg5rEF5Hdh/2ZsLcSSMpmGZ4=;
        b=nqJeNJeJzK87sAtTAYPRtEWhsa+XkqpjxubFNuCPnTKJYU+gow8NYD3CZtE/ysb4Yw
         oY1MU03wTqWZhqocR/2wVlNwUzn8fpsOXH3StUE0HSrcR5FU7ksZZFwlEeIxMPYKhPW/
         J5EtKVd4I/i8225L3Xne175AguCal28ifCYI1jOMNP4oSFzGoWbxdA9VeNt3thfBSNb5
         S0fpyziS0yIBbJigFooM/7VuIrf+0EBaK3UBCzXCyv3PB6rc67doy/zADR/DpKqntP0h
         LwQhpIggYY7YLFBFohwwaTyQRjouXgEk4xa/yggcKktBIBH3B0Ib3+1ymVdz5f/CvU+C
         203w==
X-Forwarded-Encrypted: i=1; AJvYcCVO/aP28so9C3HyM1pP2Q6jMO63pcwQ5IBUJ8fQMID5EGKXmvLjIM9rpM1N+tR1J7QyYpEpeJmNoQiT@vger.kernel.org
X-Gm-Message-State: AOJu0YzSsHSlf1n+AnwXBKz5plQ6TVwE7QWiijF9YIfRDJmDPtEHldJ0
	4ErEtHCUJIhRjQge3Ph3tXEhkLTwKeFgencHrrB7itZT1zHPOmoFBFVrEWJv2QRBML3AHf2hSZ1
	fGFKzDynaJCf6a5yCHfvVB3yk1rY1hoTBbxXdRX2N7vpBp6E+FHgLmGYAhchJTHnp
X-Gm-Gg: AZuq6aL0v4Ui74ANzrJ1XAlVaeEwVgA1yi8DDvhVvtiAbnwqLyly3aRPQRLQVPQ+tfh
	71+qrSBpAfTJvz0TCQ4lysaa3X1fKUevMvsQQn4nIRtQTKiNEuJCggYIkO6hait3DaYpqNM3Zat
	R310Q2+i6IPdHN3dmQcoAdVjQcGAyCgscXJ6L7vh+GIYs33LHfnDwm90/vQbg0dKSnP2E4dkXDS
	zbdpOUXjmsPXVq7NFy72Dejl7JouoZ4b+JMRULJ3QVyE+EHt/QBO4hxjuDTO6qdkrovd0+qwwmR
	tjfAKxy25+yEZl2LWmU7uxYjHshi69ey4hiURyfgRww6LxJnZkcnOLSA2wOOumtfNhrUPb1wLly
	JFzTYIze3X0ubwu+/5jRN2sHzxmH8Sd1FNTeSoGkQxZ7ic6EG+f0WgtaybtVMhKFa0QA=
X-Received: by 2002:a05:620a:690e:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6ca431652mr625886685a.6.1768993982478;
        Wed, 21 Jan 2026 03:13:02 -0800 (PST)
X-Received: by 2002:a05:620a:690e:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6ca431652mr625884685a.6.1768993981964;
        Wed, 21 Jan 2026 03:13:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6580781b7f9sm2482875a12.17.2026.01.21.03.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:13:01 -0800 (PST)
Message-ID: <4ace788b-6664-4ea4-a24f-f6a5a2c89986@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:12:58 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: Add Eliza pinctrl driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
 <20260120-eliza-pinctrl-v1-2-b31c3f85a5d5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120-eliza-pinctrl-v1-2-b31c3f85a5d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: azrbKmc4A04hMe3gF6aPrrYCV0pByVo5
X-Proofpoint-ORIG-GUID: azrbKmc4A04hMe3gF6aPrrYCV0pByVo5
X-Authority-Analysis: v=2.4 cv=CYgFJbrl c=1 sm=1 tr=0 ts=6970b4be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KyTfmqBV2Hnfq8PbPJsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5NCBTYWx0ZWRfX+5PCDDL2pjE/
 rYM7sA31jMn+qGq4Kj9gUFO9wFzE0JU0leVpMYIHOkQjMH/eqMx30gPMtawSPnMQZ+dfew62IQ+
 F9X4Xv9PtN68qMopaQXQa+J1PKQF8LOodOJB/l0D8XEULQ/RVt4xq+Vg2+P1qKwFoF+pqrsrK/K
 8toQzY1D/k+tdRDJSnnm9atC0cbZ+8kxy1p/Lki51+tixxzPvFTyiZTze0Um/7tzL54tTrVv7a6
 mnSP4ZpCzarz5h7Q5gvgyA/C3yB0uLFD1qMniob65BynjsJSPPhQYx+O651lc+tKli7WlT/4RWc
 p0nbQn3rjjkwmfsRahyi8GeB8vsnyl/0tnif+pRv5NvU5mKO19ZHfdh7dNoqo7/FH6EhCES2oeu
 eCYrtXod4bBQEH7zWB34R26EcWOvixFr5h0VMDlneTEyaxpdYPZnN7KqahcypkDyjMhT//1mmue
 Gv+tsujT8ZPeqfTgNgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210094
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30845-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EC1655E32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 10:56 AM, Abel Vesa wrote:
> Add pinctrl driver for TLMM block found in the Eliza SoC.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


