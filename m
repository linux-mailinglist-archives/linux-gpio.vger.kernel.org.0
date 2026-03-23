Return-Path: <linux-gpio+bounces-34059-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2INdGVi7wWm/UwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34059-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 23:14:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC82FE245
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 23:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5394302D09B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 22:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9085C3803FA;
	Mon, 23 Mar 2026 22:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGRv4RPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHldqD9R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A5F3822A7
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774304043; cv=none; b=ASMHJUW8EVYq2EmIwDPy2Xd+GxMwHjsnazUozxuNakI9sXijApS+27Km0TwNHImKL6wOmnoH9rqbSNLiL7HWMiaNL/MCVtJO4k+Zs2YAaektBEVL3Dr+ipf1uGieDi/hg29rCMiZ2yMBhmuhaD8wVXnwBu2UH/b1VdLmU1FvOjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774304043; c=relaxed/simple;
	bh=lh6B8bAK/G0Rf35K12CO6wGGToV6Ja1D9X6uvV20i0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbHB6XQ/iHAKyFyT+p07z51GimnzZRmXaqVNuB8s4+s6gQzbdC3bqhJLLr2Rz0tsZqkzlDag3E+jvQTcQtXkhfqbFGOP43i5dNMcl8Tct5XhZFDph2x5id64Ju3h33wOFN9GXzKs+Yj0dHBT6RIKqgRIfSdHlb+Ly/khm3/iDc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGRv4RPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHldqD9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqZEh2971858
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 22:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dq4WugyVxIXqcqDiAoenq+fof3XUEe5Rj0U0/uKDZ8s=; b=HGRv4RPiQNmsd1lE
	ukkXrXhU1yLPOlBfOJL8xB9jpFZbpyqABX60JHE6Nalz3lOkpK07Rb26J7K/pT46
	2mKix00o1u80aK0PVzZRM/BAcSxKqH/uEXl5qILbYN/n9586ybjqMnZMMUuRLq+2
	/qhuqwXcLVp54IhtEC0E+uV5Hlfvs+XU1stleWbyG876hMI3w7SpTDb/UeyekAk2
	fx8XJz51bcKai+reyFwhdQ5B44DPjQu1dRmRDxZMnTr6AmRZDdZONeOItjeFJmFs
	lnlN7GUGgZsIWfd5h1x7lY86inc2mib0IzSvm/CpEfmEn3urjW8FhBHj1OcUhAW0
	XDvj2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc2x55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 22:14:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2cbe7223so35876221cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 15:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774304039; x=1774908839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dq4WugyVxIXqcqDiAoenq+fof3XUEe5Rj0U0/uKDZ8s=;
        b=FHldqD9RsyicpFJvvIrJgkT/6ph9wQyrzevnbvLlSkSF07NpWRGFFcB39w70ekt+jl
         tAbVpYPjKmsrit6nWVFTqUDOThroP4PlYqIfAFdmyoXngmdgGF2sitFeb61gKN/q7nxE
         rOeZ1opzAjeLiAzFPfjvgNi+usdA6Xer4PIK8WHf6iflMviZ/qUX/6Bb7GJLe9HqLjzP
         AxA0d4EaMuI6NXf0p3cGUI10vx4Bh3dV7gi0R0JHYYRQPZJ2S1ToKCpVDLF3isvdtBtw
         V3uhuWyzh1IMx7+PIt/WbwSS28QXqOEGypYu9PGcROeYMHqfPkP2ZBt8oustCkPZoGvi
         MqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774304039; x=1774908839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq4WugyVxIXqcqDiAoenq+fof3XUEe5Rj0U0/uKDZ8s=;
        b=qafNjvBfQhXpNp4TJtRHdg4qbW5oJivi6DfemRLGaZxukXTTMHtEXKezIdl1dI0n16
         zJb5Xlo9IX092qARNYVSi/n7hgownZqcKo5IMCWCHBQYgMINxN1d3uiNhCw4FcN8knL5
         R7pf9eZC6RSB1jZ4L9B9roUOdTQy1Surnx+98beo4DUvoYFjPCrP5Ck1Uy+P4QRYbIDL
         2XCIZucjJa83NDqhjqe1G5JmSHXPDa3ZURWVep7EpeYt0u+GIZ9QH0J0mWuBViU6RtBw
         wOx1TCThXF76keBM+RGHZb+YA1ywpYac8+aG7ibIS19o4h/LHONv7ytAKxLtmsn8Rvyt
         QftQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9FOc1kkCRNxcKkumoBRnsnuptY3IQrIPN5fpZxSB0M86t+UCG+5k0/3h3JfnKY62fRVu2ti1fWxBh@vger.kernel.org
X-Gm-Message-State: AOJu0YyGhrmV4g4y07sizpzvQ0gDaYwzaP47ne3K7Q1zp3/Le9RNRcba
	7oQOhtw0KHx5MgYoeHzYJF3kDRabkc1+U6Jdgu16sOGlKWqXZhX0dNLZTpY/uEKf4YA3djaI1Cc
	QhHQC6yaVJvfwM0URgyCvtt2adgKOvMc091hpVg2Q6XBadf0USiFl6zeCgNpanmmG
X-Gm-Gg: ATEYQzwZVaLDJ/VGyGVMliN0YEXTzua83GDkOBb6vY123kTYbB7Xc2GU+X7y/OMkrSg
	Dw4V8hiN9A6e6mYtIJ13cz6GWuwmuU/U90mOLG1AcJ2l3IvJA3v4zyjOfzg+TWTBzNhHHpWMbA7
	bgFrFG3jmcTxnayJPp68iWquuCyEV1Bue47O38WZiWn4dmJf69Vp+9WVxogm0Sb8zG4+F2r9KPI
	mC0XqF8rOzr2GYoIpIYuar2LB/pe9jC6XweztNe7Ahq8pnyL4za808iOeRDKx6DpMXrM5EjrLfi
	nQCtAJaoEFwGBTw6bvOFa9nSzII9fut89PyFqziLPPbsnBuCuopzdu3y/Sc6sfgaj1k/JtX0F+o
	52DplhVlFGQhiVh1nhhoSXLCI/7elnNfBtdbeEyfRud1tqT4/
X-Received: by 2002:a05:622a:47:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b3be70c14mr198193841cf.37.1774304039461;
        Mon, 23 Mar 2026 15:13:59 -0700 (PDT)
X-Received: by 2002:a05:622a:47:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b3be70c14mr198193511cf.37.1774304039008;
        Mon, 23 Mar 2026 15:13:59 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4871105d35fsm2838765e9.19.2026.03.23.15.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:13:58 -0700 (PDT)
Message-ID: <7856055a-7c97-45ad-8571-75e51cc92567@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 22:13:57 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260311124230.2241781-3-srinivas.kandagatla@oss.qualcomm.com>
 <c50b8a91-ebda-4ba0-984e-b4121a55adf3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <c50b8a91-ebda-4ba0-984e-b4121a55adf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1bb28 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lgBHRGTc4hejgcBBOYkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -btODNYaCPHpTPWFnPCPdk06hxGVIURi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MyBTYWx0ZWRfXzDED07Yv4aJl
 JCpxc7coPV5CczWB0lEzXGBoK281uBXfVcoFiawx1fqamlTH4laHmTO8/eyUVC76U1xVS8S/uv3
 zNq1drQMouk2JRqotWt/okvm0hUBR6SgU75cVeavHZBRyebdkV/RwZuWXkHBfqUdmH4ubqLWAn6
 qVzxx/6Wt4qml+d2ZPA/R93mbsdQckDqlhWtVzW+IWIzE2+erBIA0U3teC896Pskmstq9nDQyjj
 iq4B5YFCZmrLJrk+nxerMzcFh6ln/UkcSqs2AoY2YC0JZhAm86BgycvECiyqCU2hii9GRONq+2Z
 zDqAY4LT/bJS1vWiTH5GJdqbWQGWTptkVYFMvJfjA4E2n8xrMO8gWuirkPWxcHm8KsR9DyCOzdo
 FGhXfJpHTIJKeMk8xNeuV2nWpNxTuQm6np9zixZj9knVy6cZ8rmYrJFOfkbYFB+YVM3XsWMfhqq
 vSG7V/CTwvzMabHJAIQ==
X-Proofpoint-ORIG-GUID: -btODNYaCPHpTPWFnPCPdk06hxGVIURi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230163
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34059-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,6c90000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,6cb0000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.116.225.224:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CEFC82FE245
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 10:36 AM, Konrad Dybcio wrote:
> On 3/11/26 1:42 PM, Srinivas Kandagatla wrote:
>> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur.
>> for proper sound support.
>>
>> Also add GPR(Generic Pack router) node along with
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
>>
>> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		lpass_wsamacro: codec@6c90000 {
>> +			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
>> +			reg = <0 0x06c90000 0 0x1000>;
> 
> sz = 0x10_000 (no difference but for completeness)
> 
> [...]
> 
>> +		lpass_wsa2macro: codec@6cb0000 {
>> +			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
>> +			reg = <0 0x06cb0000 0 0x1000>;
> 
> same here
> 
> [...]
> 
>> +		lpass_tlmm: pinctrl@6e80000 {
> 
> unit address doesn't match (reg is correct)
> 
>> +			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
>> +			reg = <0 0x07760000 0 0x20000>;
> 
> 0 -> 0x0
> 
>> +		lpass_vamacro: codec@7660000 {
>> +			compatible = "qcom,glymur-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
>> +			reg = <0 0x07660000 0 0x1000>;
> 
> _at least_ 0x2000, I don't know if the following registers are also
> related

Sure, will take a look at it and update it in next spin.

--srini
> 
> Konrad


