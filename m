Return-Path: <linux-gpio+bounces-31527-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QELFNWneiWnGCwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31527-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 14:17:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5627410F878
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 14:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31524301629C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 13:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3283783D3;
	Mon,  9 Feb 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhOB7q46";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AeJYzvl7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8BE365A01
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643047; cv=none; b=QPJ3OjofvyGDMhflKFhz/UoNfbSjEkUmazRlFLjJlaCqx0XXRWoySj+qfd57vAz18cqHeQQbA/6Z890SuXKk11TdbKdMLg2sBOibcYefxanPybqsZVN5FWfIgiTHxyeeXh1XWNIVMwmHcNHYI8cc7e6qgBGSkzyjcrmW9XKzlF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643047; c=relaxed/simple;
	bh=CXyWA0iFgKqMGbzJcUwtG+Lwt6uuIEzkwmNmbdNOWno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLgwdPLEf2fhMVz+TEw00BRCKQTwvmqFj2YlpYSQmeRLNxU8fZYmCmgXmaqlgydRMsQdl6b/sssLQQGDFFMuWmNFtT+FwEZxDiMWd2tzy48LlusMn1Uq8VLpUqebbJYWkW5i0r8YYWp8O7wcVykPnMuBSj9sw9R8iIPc74X15GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhOB7q46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AeJYzvl7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619DGlPr3081680
	for <linux-gpio@vger.kernel.org>; Mon, 9 Feb 2026 13:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKkK2hy2dALldFLFLtmTEX9h
	hLjh6LMDjf3y9AIOaO0=; b=mhOB7q46jiP9T15Qa0BIVPvmlb/5AVNZTVSqrezu
	3Kg1+cEHEnrr4j5bONFQKQWlHS5kO1iHYTdxMUPnhqCUh/61AthYJ6RTddJsdc6F
	i/spwCfhsjP6AUbdXhjau3g+6R1lGdsdyLaMOPJMRweFxjLS9KmoeQ+z2Qcn9MeR
	IkYFOsE3v2oOoxX3w+YgJQ1qMwJAu3DW8Kf7HjD/VrLImQZe2IBqEAHptuja63zF
	cmaI6fORUADFIgiH1P2/86HZw3EsR9B9yVy28pkXSiU3m8UFIIuURMCgHgrJUKri
	ucdgWXUzoqqg3JwSdbhNllGfQhz7JRjlWVhInB67m/RCNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7gau8042-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 13:17:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70a08daf3so1160278485a.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 05:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770643045; x=1771247845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKkK2hy2dALldFLFLtmTEX9hhLjh6LMDjf3y9AIOaO0=;
        b=AeJYzvl78lEm93oj7d2B0vP4tKI1jqNbeIjyo5a9MhmG+l74qs+K/xIINJE64fFkha
         xlvL1M1qjLKvs28rUktrMbZ6EXzLECv3S03Zq40a6VuZRw1ct2DDOelSZNIvdp5hrInL
         LMIbfCvwXKqT9G8S298p85FmDFySdDmVXZoFSe2PL2qmrSpQ33Ppu7wqOAWKU1L8SJkJ
         JErNxbSEeiOXcjFGXNXn4uTM3Qi6EW6vuXviCIxFQRnIajEy7K2ZcWMpv3iYKQnPKgUw
         nHYUezZmqi1q5SauEbTh2m4hFlDrL0gIE67rBDWv5YhkNRiUrllSwYslERFPsD1yzILO
         7SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770643045; x=1771247845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKkK2hy2dALldFLFLtmTEX9hhLjh6LMDjf3y9AIOaO0=;
        b=ohDYL+im8I6fSj7vLghnSBk1IEMbdfJ4xSEcLYvy+pI2GNkL7BV7e6U5KbRekWULLp
         uA2ut643Lv3saaHBHxI3hX6AyRENMa4nqDsvBbSACB50Q5eAAiF7jyamyYHDtyUZ19Dj
         VyrQC6VecPpCwZD14IjkSDhjjV38eNEshMrsO5ScTIpyyJ4gwA4Mp+DKFaBPgknj33mG
         KJhOr5faytPUQybKGAU0gXiLvHmDO3cVbJ9gMwpwj+npZHHku2T3Yt3vWdeL+m8MP723
         ZFNNaMpswnTaub6CJLYKo+qr/j5yVcx+FEw3GfY1Q3imOE3/x7fZN+k4wXLGdZG5CBnw
         JpHw==
X-Forwarded-Encrypted: i=1; AJvYcCUVDTqdmln7GYB5RS8vUxjkRxZA2f1FpJVlOuF7WJ7D3Tznogv+PTCu25HZcMdN8oPSI6ooN1McUJjG@vger.kernel.org
X-Gm-Message-State: AOJu0YxZpapcX4y5P2Z4iGpCGgKCZqJwghuS9llEJFLjZ8fVHslx5kp+
	TjS9YxU7dI01o1TDB01Xt9pi11DCLpEDRZP2Xo25v3PISrSfTfsL8aL+9b7Xyqn82kaQz2HqK1F
	P5CURELSJL/e4NL+Zl2dKN0lxGsdZJLqzTuAZ2nlV0wYknuF+CHZhidwl9Ztui1AJ
X-Gm-Gg: AZuq6aK1U1d7XV7kwSkVh6e7Urpxvh/0s02tYqBIqC6gfL8RwGlPvnStJK4m6QIyZ5I
	vK6B6zBNGC8LsMPqIsoUo+umy3gU6NHAJAJ+CG6wi3dQdNFZ1tEiI2E168NUosEsdGt4KcMiB8c
	8Cueybdo9FtG1+EziVRsrdlrisavzZF9YL9GXFcr6s6vLVpxt8TfSZW6JKiWgTiPWYDR0bqB6N/
	KuaWA2RmG22A0br8rVT0YpR9bFdtwwgQSsx7U2zOH9siCTsp5QlQoH8IHR56GBkRLce5PpWtchl
	dLThC/GaRLLXqZ6yIePda4iMSe7xXRCV5rNfvDmMmYzCySZq7Y87gWtJRzqgW8b8QLwbVFg5a1c
	cAobkNgabbK7puQrc2eAYAJHto3PJVNwE+BsdE/b7Hq9fyZ5oaC66I1G3Ig6+oSijGuGusb5OBF
	6ZzQGs3XEvf+5kqAYTEswl7F4=
X-Received: by 2002:a05:620a:3912:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8caf086c635mr1442044985a.38.1770643045404;
        Mon, 09 Feb 2026 05:17:25 -0800 (PST)
X-Received: by 2002:a05:620a:3912:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8caf086c635mr1442041285a.38.1770643044917;
        Mon, 09 Feb 2026 05:17:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e25e4bsm2631324e87.88.2026.02.09.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:17:24 -0800 (PST)
Date: Mon, 9 Feb 2026 15:17:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
Message-ID: <3snsmno6rbgzsbjdgrauac7lutetyve45vyl7ttvlljjxckhv5@ibi2opiq5ygc>
References: <20260209-qcs615_gpio-v2-1-ff15114d837a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-qcs615_gpio-v2-1-ff15114d837a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _MU5GBzG0xL7ZTj2e3P9rgRbBgTN7XU4
X-Authority-Analysis: v=2.4 cv=eP4eTXp1 c=1 sm=1 tr=0 ts=6989de66 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TROzdEh0dhA4UvP_4c8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _MU5GBzG0xL7ZTj2e3P9rgRbBgTN7XU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMSBTYWx0ZWRfX4RUXpINts92p
 rtqMpQAVj7KBOwJnNO6qk3lgfyM5u31cr9OHIZMwqWNn1ysdv1OBlNYfOwOlt54FzLLYBiBVAci
 J9JEfaOpuV34yCni0ckn7wXtI0Ft5AAmD0Xs3aGNOkHsjOrYzGHOsqDQ1Fy/JXJCxa77x8XDTY9
 KGlXFjksA5i+gAmmc1xRexl3URkObL0QJ+CpsDyBZg50W6iMGEBrqQoE/LHzDBZMVM29tardhRx
 WYg0aL40Yy5LclRflqnoygUeCpaZ1rWoQvPt8fwo2AyV6CtfUrtn/lnsevvtvb7wg7mQ9BnYM8V
 NKwBCpAxWmwweYx+7fWGHlJwfQum15qnCzdJA2j+0S0Q7LdPwJRDDunJyT8VqVOq/MNjPwGKTK0
 0tT1bOw4hdBpHiF5w0B987xCmT0kXIHeWs6C4r+C2qw3A1r+l1oj5T+7nac0/Rp2o6bHmbiuQvd
 lt5av4ZfqMeAZwrIqaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31527-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5627410F878
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:33:44AM +0530, Maulik Shah wrote:
> Wakeup capable GPIOs uses PDC as parent IRQ chip and PDC on qcs615 do not
> support dual edge IRQs. Add missing wakeirq_dual_edge_errata configuration
> to enable workaround for dual edge GPIO IRQs.
> 
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update commit message to reflect HW do not support dual edge.
> - Link to v1: https://lore.kernel.org/r/20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com
> ---
>  drivers/pinctrl/qcom/pinctrl-qcs615.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

