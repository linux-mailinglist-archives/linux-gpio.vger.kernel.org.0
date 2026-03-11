Return-Path: <linux-gpio+bounces-33132-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA7vIZBrsWnsugIAu9opvQ
	(envelope-from <linux-gpio+bounces-33132-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:18:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FE52644C0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 416E531825E1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220FC30EF74;
	Wed, 11 Mar 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixIc2u6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdDJUyCn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1442FD1AA
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234940; cv=none; b=hJJZkQL1G+qnM4a4ZQunb2NFaa4Ug2tA70DMw5cyu8v0+DZSutDkEsWChCzAx882BstCVVdv+f973n2Yeqt49QoOjmTyg9K/xyuLGG/SZvvSWOVWdD+RT5MjahcjZEejBMCt2f5PXT0GChA2LxAn89dhp0lD3gdrZolPQWXxmso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234940; c=relaxed/simple;
	bh=NTBADCB6TF2ojV/t7asSFmFixT+L0BNlMfiH+NGGoz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyJ1zYZjXmdG5PeF8ZXM2LoXGN3n0VPnK03KhaA1v/dEUzUFnwXtBPzLv7lx9O/zUsHH3QVRYACvWRm15U07G9VuklFEudZA+fs80K7j1zKMw9D/N7eXRNz7tEXb58PY2diDTKSlg4dSktkW0D4xh1zj+aG8PuzuH0PDQQvhXu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixIc2u6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdDJUyCn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9aOnT614019
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qFLr+olHEtGQdnQxnwdiXdFDDRGupqHLezcuLy1Qfc=; b=ixIc2u6y7rkovZzb
	xDaStPworBb+GxcndGrpE+Htf2OYnCmAIb5H7LWC9drSqdinQG+5zOVdIfDIqArJ
	TRdztz6c9Z9sJiiQHxUbRgg847Sv5Q0K+WNRwLEZdxkXxOhxcBu4AVUa84EtYLKq
	GDJQz8rvSyM84F/jHna1icL5+krPCoI4DMSLAvMiqMSXb8df/Hwf6nR9XXrnfmNP
	WHW4UBbMxJUGiO1b4IpsE7CF7qraAZp7GS4AZfJWwMKWK1Ze8bABUHkROsxq2+4z
	aSmnkSkin+aTKVqLVoNARZy7ZzyNWyNf6TO4K37UtWRZK7XGRdaJafVaSnRB5WhY
	aqMH1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu0jf21ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:15:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so118093785a.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773234938; x=1773839738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4qFLr+olHEtGQdnQxnwdiXdFDDRGupqHLezcuLy1Qfc=;
        b=LdDJUyCn/cRaejJkF98kDiaJMCsq+5jRdki5JZirYW0edUeoRXzQR65kcZi080MIhk
         hkHrjVOSeu9dXLMaISN4G2pS7+Z2kriCo+nKsoTEu/w/0f1NAtmVeNqiebHMa99wOBzZ
         S9cCGt9/AwnCJXE4SzXy4KGjrZG9UsFdWIzely6lmahwPDeasMv58chM9JF6HMb9DImP
         6MEWMpQwJLFyiKEhaIAvGrRePzHlOZ3DS+5W8GbkhbUOX6EmY9FCy3DLCpvpitj7TMqO
         +5NZny2pVAnZ3LdSIz4YgUoFglSsuAeE6oZcKeIz7uL2kcWiBl5KBFnB+/syUwuY3H17
         Dh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234938; x=1773839738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qFLr+olHEtGQdnQxnwdiXdFDDRGupqHLezcuLy1Qfc=;
        b=eaE1BQgoXEsqYH51beq+tEMN2HuYN5GvtaE07N5AZQ5Z4zGVSudhSX2Q1uQsW0wWLX
         ztHhI6PeBMRAx3x+2mxOUu5K04fwrTYlOMGFfYvICB2knl1hLnbQqksGW82Es2jy29h3
         4ckQZmLywrKYwKKoiznLJPwWJE4vgCKq9xTd6c2Z3mhCvAUGOCT1+Qn1evSJ3EFL7z0X
         bjoHK7R+nli1e+1VkfAC+2e+vO2K0S2ZyD89m3tF7aIaImiEVBHoivwWcQUSUDYXogpX
         m+UPUuM4ap6HrCuuI0RhDOftIwbzuGZ+qO+h5JADwQMgl+QfKiHQKR7Ng5EDB8GIlWNM
         Ez8g==
X-Forwarded-Encrypted: i=1; AJvYcCVpd4Gem9rMlkZgPg3MTAQX25Vsp7fsvLPE4HsYsDi4paZ5qnhFkiGYFPA9X3wcnGHLO58BYTCt8Tw2@vger.kernel.org
X-Gm-Message-State: AOJu0YxU7YecOiAljPUq3b2/GKgdETXmpTPbtXqqwKUu1jfazfA33PIq
	3P+SGTtW/PP34rPEjqQhBEh5HNl282dBG9mGXse+mCLOak64OXOjQjMcOTSgX7U37SKL3dT8Ib4
	H/tqiQBhB3oCZ+AWj4MoQk0ipoB4cpNCOWAdYrSBgtp3RCP/5DjRLA4xlGgdHy/9Q
X-Gm-Gg: ATEYQzyVZEUb5REQYq1Vxy/Di0R+lO/tYT+UmPrq0DPIFZ4ipFBl3MsQMF8tFycEA8A
	ZKBjvCXG51wDTuESas2iCZFpvsemkNjlb/E1+N+Eq4qOc3ootEJkAintTdynYsMhWQpb9c+ePRU
	bozmRwGd7RFpiaRyKk3XOaG34JGX8MUlT8RLB7qPAFXZuRmdwTCtiJ0pT0Mfz/+qgkUpa9P74TV
	DrR9VQuVlW0irt5hsJNhqkP1Ixx+OdYEiWH8NQKEyg8+csCq5PfFFh8WDH8Ikef8D8jtotZLOHW
	5pxb9vM3cthhfg/PmCpsTQPRakf/1Nf2JwV4deKS/YHBTVDjLq+1GXfGAD9ollv05ECRigwfm5O
	IfvzKmICc0o+5ueNgdiyIMrqlXOGJiV/AqeZwotpcpVE6MRdzc582AhOEqZ6ICJEYSGxbSU6Lle
	eKToE=
X-Received: by 2002:a05:620a:4487:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cda19ee32amr237423585a.6.1773234938359;
        Wed, 11 Mar 2026 06:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cda19ee32amr237417685a.6.1773234937687;
        Wed, 11 Mar 2026 06:15:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de8556esm53621766b.30.2026.03.11.06.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:15:36 -0700 (PDT)
Message-ID: <9666df8e-eb80-4665-a393-8cfcd7182446@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:15:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-crd: add Audio sound card
 node
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, linusw@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260311124230.2241781-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311124230.2241781-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O4nJwMQCZ8TjY89Fx2mI3xSCdz3_6KEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMiBTYWx0ZWRfX8CoBcMNfA4IC
 3Z+RPRCJdWfjmuWEU6oI6LqnOb/qzB/kZTfE+ClDgFiOQnXo0DuSgNzWx5u+WmpFW6C0XoC3oph
 8PxVLQXFIZFGVfwLanMXtJHb7St0J+QNSJdiSjza7JIpXib9Mm6FtTiQ+kk+M/130I7s3UisjB9
 spbDvJIVykxAHzgWJl4l+fBNcB2Kpk/vgYzgsYp4FANd+d+UYnlETFQUQRgKhILxyF9kAcI9arX
 HAKcdq+YRPY5nf1EhIN+Sp39eW2vEe0xIhnjtgBJUHgy3C3QBh+xAyCfIiYr8Ld8Gv2TOeCxwqx
 uMTWdyjFiVxtwCuietVE5MzzpZyFkbA9isZFC6Le5WETProAqhMkGyYt75AOLXQUArW1Mrr8RcL
 ksnhLInmTmCbmRqDVntYHGHt6sahrSidWK3cfy28y4qCXQOWbtN5Zyw66ZTp8LUyELnbHY4A5xf
 Z8+itTPenPuJ7CIdr2w==
X-Authority-Analysis: v=2.4 cv=FMMWBuos c=1 sm=1 tr=0 ts=69b16afb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mRWUlT_zmqOSk2Bp5cYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: O4nJwMQCZ8TjY89Fx2mI3xSCdz3_6KEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110112
X-Rspamd-Queue-Id: E3FE52644C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-33132-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/11/26 1:42 PM, Srinivas Kandagatla wrote:
> Add the sound card of Glymur-crd board with the routing for Speakers.
> 
> Add device nodes for the sound support with WSA884x smart speakers

Smart speaker amps?

[...]

> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {

'co'dec < 'cp'u, the other node is correct

Other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

