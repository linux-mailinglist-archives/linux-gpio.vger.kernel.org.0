Return-Path: <linux-gpio+bounces-30865-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGrUCvPScGkOaAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30865-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 14:21:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE357753
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 14:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 035796A154F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438DC31A069;
	Wed, 21 Jan 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fybUcBEa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjxfS7YS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BF229346F
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769000825; cv=none; b=QsvWATF1t0tmPjq9DXhcmWPN1BS8TLMFskEMzCez5SkwrAwV+lORSw2ZAIszBU73JTTQXdhTN1uQ+pH+7c5diN29LH2GmjavHNYn+ez/vtil1l2GFSJvXHFVtWN/P7IbD5EN/q+n/E9/o5W/frsq8734r+TNTmno/zrGVAWmtKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769000825; c=relaxed/simple;
	bh=igUfJtXFCoBZwqDGpBeH6TST+603l9TqH38snu6AyyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjrz0h2Mwz8lxdcj1X0yCRi80X3rvDFX6OvCEOkIUbpRIeFtZJdZfeIYicmuiD9+21zd++3yohM1xyDne1XPwxS+MZm1vPqpdGVvreu+H5y2ZF/Nqx51O1NvB34oORp/BmyQF4bGG1iFneHI8ScNyrcS/lPN1wdNA7oZT7k1GO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fybUcBEa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjxfS7YS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAf1q22818234
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEKuP1k/JzkCVEjY7XCvCYBkin/z4TR/WyHur4iMN0I=; b=fybUcBEa+AY6Jw1a
	b4vtAkWbdSvG2x9c8dEGZdragPRNpiZJ9Ampk3cio0M2zmasuzt90vJ9DJw+PzdF
	cHfxLQAWzuMt7L6HD2G3CiXz1Mj+q8Jzvhv8PWj+eYdFLKy9YOlvm8kFMbNHGNur
	tO1fesbMnO6MIHveydTnT7nQpuyL1L9b+YKAt0U7n7lw/tBEgEMMkA93N2PaYv1d
	gETG91so868tvWc3Ql7gQHNMtQX0NZcgzxBO1rmxCOYSA1K1ebRqrT8OynVeEqab
	xL2wAdYfxOIbyCHGTb/YNrHMPEcXy+ntqc7r4O1xii2jirRj2ELiabJ758MI7j4g
	0INZlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btw8kger5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 13:07:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ad709d8fso243534285a.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 05:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769000822; x=1769605622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEKuP1k/JzkCVEjY7XCvCYBkin/z4TR/WyHur4iMN0I=;
        b=VjxfS7YSDIe1HPo9ECeVRDRJVt3Fo8GIMeZo5Z62+rXkLxJgDjmNJERx42vj7cvrlL
         q6ViBwzVRkYGuDVZdTm4qpY+EzIHPEiEFh14MQSOhX3fMooJc5nJjcoFtcNm+YgJpXRS
         5aXTZAaI3J/X1GE3X93D+Cuz5/VBeabauo+o+Oc+g5cmvJcHjCM4ml4EiLEmG1uMdkAU
         eoZyOLR5A3lG+D6cmLBuRhb/0L5IFt0Rjz18r54x7ET/mScV2pFJNeKgdVe5uwpgTckY
         tICXMablH+NYgoTPogZWEJFyvkTxZBjsLvCs6BYjBtp9/UY0VactnNO6SZHorSHUMO8G
         LR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769000822; x=1769605622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mEKuP1k/JzkCVEjY7XCvCYBkin/z4TR/WyHur4iMN0I=;
        b=lnJLIxxnCFMDGjIwybL55afdqq0E5XrzsyyVj5nXDjW5Eykv5fRRb3vmpGFQXNwO5z
         0Vwx7EO+SJU0Ba6AidNtsvpcy6ubo1Yi60F8QhP3osebSBB7K/nO00eGOcUFCGUj0c1X
         8flQuxqzGEV7sapvXCNBghN3qHj8BMldfJNJflc0j9rAVvMpdIVlssK3YZAyYijXVbYV
         AJOOiavlfW/j4ZPr5v2EoioxJNe/4zocRqSpBMg2B8uWyWIJLugB7saQFH40g14NMtLQ
         oYekZWjXhaCkawBwwV9PJw41leXm59cTrYW+xd1Bwf8Z54PSIzcROc7reoE59Vt2r5bp
         AU+g==
X-Forwarded-Encrypted: i=1; AJvYcCWJpDtqxKYvQ/bWScLntvgL3r+zMmbN3o1wHx1uz5+srm0oY4k/v3MIm0v+svee7V9FkeAiptYDLzdK@vger.kernel.org
X-Gm-Message-State: AOJu0YwqSz8H7usRQbIzJk11Mqew7KD3hXQpbpgOtUjYLPnl85yfKYN/
	zCZqLCd6txPFq5+HrVeZ8IFpmnY34O04WkvhU1I5leC7/x3lq0cAC+M5rPoMbmVFdjYDguB+Jt3
	8BpCGFpcsII0ggOxzsO+61QziwfdTIe0C2gUx+e9FTxuJKEIRBG8T62764tdGvesA
X-Gm-Gg: AZuq6aIwhhNtXwDWrM/Dmratho+tSohroT0rRx6g0GlDkmEpxatppfez5miaOpSzNH/
	6agbuNG3PQy+1uUaUzEHM0F0Wr0I5YH2FT4XaCgnzNZ5GqRk1T0xDSzt9YIZcOjOlFa5NtUJ2xY
	b1AlLAnT6KZtroURxRb9ugHUdmgFqZZ3F57WaF5DMuEq9DW+ZOMfjBOQp94HuXRYRinHPntXRfU
	tZ4U/uRHnQP27LBq864D8gXSfRtp84ofBONiNrO+6dVC4/SCNrZBC/Y8j389UgT4hAxZfjw8rDv
	STML633s2rqeE1mAXrWri769GjTkytasWrIYTx/tIox3MGigW4BIV0Bw6jCaXOVPHie8MEaHmbD
	hpETT0rtltbNNnwG6eL9eLD/QhREgaHtFhjKHpg==
X-Received: by 2002:a05:620a:1992:b0:8c6:aff3:5a79 with SMTP id af79cd13be357-8c6aff35b99mr1712821585a.44.1769000821937;
        Wed, 21 Jan 2026 05:07:01 -0800 (PST)
X-Received: by 2002:a05:620a:1992:b0:8c6:aff3:5a79 with SMTP id af79cd13be357-8c6aff35b99mr1712818085a.44.1769000821515;
        Wed, 21 Jan 2026 05:07:01 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4e9f:7645:5b3:5a1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43595609c8asm8798203f8f.34.2026.01.21.05.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:07:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohs@qti.qualcomm.com>,
        Ravi Hothi <raviravi@qti.qualcomm.com>
Subject: Re: [PATCH] gpio: shared: propagate configuration to pinctrl
Date: Wed, 21 Jan 2026 14:06:59 +0100
Message-ID: <176900081432.32732.12601231042951814892.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154913.61991-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260120154913.61991-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExMCBTYWx0ZWRfXw2wmMXmxF7fW
 F8tSV+4zAWS0o0cPHnOyvUgIa+ggzpG/IwspVtblvYs4knOtZ5FV4/b5FpDR4hfFq6e7s5W7+Kh
 N4dfW1wrhyBpp5T97gcaLrZI0p8PciH4fkOsUAjj1RgYclR2VzvEjXeFalWGbSuG6/PXHF/xepO
 Zr3j3h8riowIb/86SXh0tHUPCO/UqoRdF3WMXiRPX0vrZDzXjIfgDuTz9JibDutP12KnNU0Fd5e
 oARSTyCfG+g5LwBsjxNa6R+kmv4UVRsUHvfoRhY3d0elPo9Saq4pkNhKm8cw3Nm8c+h3IAHjJF9
 9mYS8DjhpOGWBfHADvZZkICU2jCMyoiQpwVgImVFtvewNmX+mOR4UMLWLs7qc5dRkNWNYgmHke7
 Gjj7yW42Us71oRIuoSHWVuUsJXZmdK1qjKB24DpByr6rBUS7Pix0x82mFyvovGHq3RqwQaRZ55P
 JSO5G4xjbN5gOMOvSJA==
X-Proofpoint-GUID: mCXJl-Aq-y2KDJiiQkPuzZXwLk26Rykb
X-Authority-Analysis: v=2.4 cv=BPW+bVQG c=1 sm=1 tr=0 ts=6970cf76 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gsdG-Y0QoL_Z1tDjP14A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: mCXJl-Aq-y2KDJiiQkPuzZXwLk26Rykb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210110
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
	TAGGED_FROM(0.00)[bounces-30865-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5FE357753
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 20 Jan 2026 16:49:13 +0100, Bartosz Golaszewski wrote:
> Just toggling the descriptor's "requested" flag is not enough. We need
> to properly request it in order to potentially propagate any
> configuration to pinctrl via the .request() callback.
> 
> We must not take the reference to the device at this point (the device
> is not ready but we're also requesting the device's own descriptor) so
> make the _commit() variants of request and free functions available to
> GPIO core in order to use them instead of their regular counterparts.
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: propagate configuration to pinctrl
      commit: 4918cc05137cb347686462923ab3fd249ef7899d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

