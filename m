Return-Path: <linux-gpio+bounces-31082-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH1iK8h+d2m9hgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31082-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:48:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5195489B72
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A3ED303828C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 14:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6A9279324;
	Mon, 26 Jan 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1P37X+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoYALNkz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D6241686
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438504; cv=none; b=HOCd+tsOVLyKC2FjzaROglZ2lIJf8rI8RrqvQ0WC2+f2vOcCeU2PDNYCBmIOTB0TQ2j4jFYqTiF+GIoYaWEy55cWga+i8HgryQtsdVygMRShDeTF/CfbiD0Jffpu/fMJfuPCKGINxAFIg8Tdk5Q2jBAGABk5WcqGO7H3r9gQRBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438504; c=relaxed/simple;
	bh=LhiwEYIxn11LporYOdNVlFr0P5xg98toFBv0hQVeep4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgb68x3jmAG/LHGIdCt8JHewkBvyoM2z24aDn3TCwpQ+70+59OS8WwWyQ1cNJylRGSa+TCfd4v61Umq5Tb1G+VU4W+2BJkML6cU4/CZVGs5CNsKfZXe3l1NEQSo+LMBMmKeYQUC3FgCBOfHF2nL7i4pAZ7kThgmN6vwqsn0WZoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1P37X+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoYALNkz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q6qHj24190477
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BGuWz/9Pb2rO4ZsPE3Luzhxit26uWaOQ4ul2uGt1ofc=; b=N1P37X+HPLeXS+Lh
	Btc6neteO5YfronLFCIgywWsEm1jp3PcLtQGQZSIHXgYmsKFDjrcBeErj6QczfGs
	BPbVqfEA8RJlnHaLmKcNzGbi+am6Jo6IKVVQcZMrCE9N7IipkoxzJejVudSPetxJ
	OMRXqgL/CS0CINOHbZnmwynDKtWxCPxs+jSxBuYWTBLqlOsW0xU/WfKBrnoS7pJr
	HG9V5ZYSNu4xWMMH6mqsbVxMtU7dBSwV8GNUdq7lfQCwEZ9/KS4+UjONEhMNTyIi
	bLi4A9cvlGgBKGGD4SCcAKeQsbAJAB5ZI4ItstGybVVkgOsaE9P6UBudzKw5WOSc
	kdrm/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f4sny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:41:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so121786885a.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 06:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769438501; x=1770043301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGuWz/9Pb2rO4ZsPE3Luzhxit26uWaOQ4ul2uGt1ofc=;
        b=ZoYALNkzHk050mC0+4GSDo6UqPS2EuYey0ZrTLGJuDwHESI3oV2ziP+u+Dfo1RxNC8
         9nFaM/o3R30WG+OO6mPKooz5NhCjzz6luuEpI3/FtM1CMMXSMYmpiFJaOj9sh+oadcp7
         l1In+lcNmkllyEDqn8BYtGNZ0wZaw7gMyMoc53JT7SQMiMSKMIm8K88n9pwsVR+oDbnT
         bMokTVG3PX5QkTCICDp9R3i0ZqyP6KgjS7sd1X3/Rkl0GxZu/oC/+PfzrkkrXaNIIMfb
         XAAOgPs6kSWgesFlhl1Qw00S9Q9jU/FT9RrcMmFwAcvkKILEAiAgrvRNSa6+UaV9i8eb
         gRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769438501; x=1770043301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGuWz/9Pb2rO4ZsPE3Luzhxit26uWaOQ4ul2uGt1ofc=;
        b=EeLHlh3Th0yjVuTW0i/FDyVEVBtE5bxNVAs6SSnJRg4JJnc9QD20mJxkkk6tLsFRtf
         k3SRHocZZtaKzIFukzf900Bn5qz50SpuGm0vXgaLH872NuvE8T7H/cApQ4cSbNEvcmnK
         YP46jJhcj+FP4BvHYtxdj7B07mCC9NeC1Qmo9O8XgTSGFsWfsEH33ZpGvwEuxP4647jA
         B27ImCSR+OS7tqcn3yJmZkDxb4nfK7Y72xh+LVIuKd1b7GT5o+z9D3fuFszCsEHXoaE9
         OHYqDSJykR3XtrifucrjzHBPmsJW/Eq0r/thfg8//W/Nyh84Brqov16vuTm80LU/ppeq
         gSbA==
X-Forwarded-Encrypted: i=1; AJvYcCXYyTh2DLKhn0tQn5wlmTmvm3jlpilxLwJgoNe1ErNRgXXbsq2poEVGj84y+d/NNaH2H1uopdSzVTUn@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8p5Ie1Z1MVWvQtrPSJHmX+ObAEdY+maNMR2WuJEA4l/YQFby
	pRP5pNsJXSnwuLq+e+VXqE9/6XkP9h8F5rRavmXIbihZKmCvSwglBheT4ABTEPULK1z14e4ZMO7
	nRVqZCnt9McsXM/CJK7oRjv56RkQzCB2DYWBCuHcUK/yNvK+Y2elmECuC1VeNBJaA
X-Gm-Gg: AZuq6aLBOF2IWU3eYrTzZKNi1rnZEXauZKR+MD/XsNjqL/7SvQ394z5HWuDGTKBMDRm
	t02GmBdJVsR1OvyGMrMUzWbI2c7dXcfqf5vUc/GXGsciWQvIEkHltMsgUdVE1maniTde/L/c/mm
	lRF/AogHBFQA0imWca844RAWcyLYepzK7RMhE/ljmXTCtkLGxjSd5mnq6m889ku8p31uTgFFcRg
	afIKBaQ9WNpsHzPAkYc/KyziHrpag12c6NFGtWVLqdhW2isI9Wf7hEXJQ0Bh/v/bAxlIM91gL90
	xVNMpsOrWqewammviOxKZtKbeg9dB3cudMrNw6l48wFK2kgUTcqs6qpj8axR3MDxd+3a5UJAynr
	s5RutyV+/gBDxRX+GnqgNhsY6bq/o38Rl+H2FxyCKo3br5pkdYn/SrfaYO/hPN71IxSk=
X-Received: by 2002:a05:620a:700c:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c6f962ffcdmr388452985a.6.1769438501224;
        Mon, 26 Jan 2026 06:41:41 -0800 (PST)
X-Received: by 2002:a05:620a:700c:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c6f962ffcdmr388448985a.6.1769438500581;
        Mon, 26 Jan 2026 06:41:40 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b41614csm647239066b.15.2026.01.26.06.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 06:41:40 -0800 (PST)
Message-ID: <5d9b79e9-64e0-4d62-857f-dd888e09d4bd@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:41:37 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: lpass-lpi: implement .get_direction() for the
 GPIO driver
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        stable@vger.kernel.org
References: <20260126135627.34191-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126135627.34191-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=69777d26 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jvEoDTpiSnUK1vfo43gA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iyppdpYSsnV9uh8AtPwG0pLuEl8E14VV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyNSBTYWx0ZWRfXzH+h+bXbuEGq
 NQ+PPynjcE+mOGxnQSdGMHA1K2ZsfH/1qJV0892QJX1CnaflHZGKXKPAH2z2VTgkSD2Sr8boiHh
 dcH859Jkhk9yLhH96TEPIp46jZecSp+3NdDFMYxbYuO038/dp2ng6v2yBl03EjSuww9HnZP2+Ir
 yJB09ybtTN3mZbHHZwNogJBRGyh7iTMLAYAxyLo73JwnkhI0euD7vKgUbaCLWrLhoKThAxVTpyx
 +lNFC3n/XIINbtR9OaFL89V77einiTOASCy3mMHwzl93l8vRJ80hayK+PHe6/3yhDLuxUWLkhNK
 RNLriN37emqDL0Ab1IQhxuSS6+H4ymDbGV1PgrN9OviEeNiaJwKGYRl1Zm7GqZA2UYUpxGbQn0/
 4MuM8iWLTkp9zPWpViuFH6iDonFCIuyONlRP18tEvKctqTzow9dw9bfk2gHm5qZnhLvedWRUC3C
 OmbH1/DIGmMDhUAtEuA==
X-Proofpoint-ORIG-GUID: iyppdpYSsnV9uh8AtPwG0pLuEl8E14VV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31082-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5195489B72
X-Rspamd-Action: no action

On 1/26/26 2:56 PM, Bartosz Golaszewski wrote:
> GPIO controller driver should typically implement the .get_direction()
> callback as GPIOLIB internals may try to use it to determine the state
> of a pin. Add it for the LPASS LPI driver.
> 
> Reported-by: Abel Vesa <abelvesa@kernel.org>
> Cc: stable@vger.kernel.org
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X1E CRD

Konrad


