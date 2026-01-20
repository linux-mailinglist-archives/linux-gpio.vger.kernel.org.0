Return-Path: <linux-gpio+bounces-30825-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHJXHHUJcGlyUwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30825-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 00:02:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBECF4D6CD
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 00:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B814A8BAD2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 22:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3459743E9D0;
	Tue, 20 Jan 2026 22:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd3x2ZPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqoYZ/79"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3277A2E9EBB
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947897; cv=none; b=VfXXjVBgeKqwaaXEe34pd95zns0I/sTMt7XDR3+ThLhuLHaySn/VhE9bzH5k2giiA0HxSlHYVaVegW5OeyPvxZF8oH0I93Kfc0cO/AXOJj2/CzL2mTTwWIkwM8blfTTa/NYUfMOOErl2rZFwePdyqSX+8YYQI8SYoP/evIXn0oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947897; c=relaxed/simple;
	bh=BrSgaNZx+HQfBwpu4sn/zg+03psniiStvPrgOycbRaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/5u14YpCJ3P1OH5mlapaiZVopIR/DM+sSxuyuhuSBOYl89raKR/ZDYeRo0k68TuRasi7neCZi0/dr9PSocqKb0xt873FTtxiLHNved/NfFofbIPdGhogo5IBUaeTG6weNP0OrxP9PAir1v4qtHzvF/efQ3/NbwuPnWOBmjTiJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pd3x2ZPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqoYZ/79; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHBhSF314357
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 22:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DeZEMvDv+Ew3EjInq8QMcaKT
	LAuKh7vFSCIGrUk0dNY=; b=Pd3x2ZPL6HJaTTQH8pU2R5z1KGFqbAUwAx7vbQF5
	9bE1RKZkaVNAW6viBIODsA3HZMC+YQWzfZl2SkRGpIT8cTX5CuGtF+OfAA71GoPU
	u959InI1Vc6uGa9hfmaZXJghd0YuuPlE3nFroLYkxME1CBPHidUN+eYRrQ8A9XFy
	7DWIxMTWvr8DonfUnz0HjdsKlTTEADgi0oCjDJbvpXTef+641MOCV+AJ327WSzuy
	UY1vS2GazAHWsvKU7/Is0crXCmdKkZlQz7UqGUMs7S7wGH7iSn1T5NRh4qsZcZAa
	49EGY8qv8dAH0fd9mDJt6kRw9dlPYAB7CmBM1/7W3/SvMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btdw291mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 22:24:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c277fe676eso1558509585a.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947884; x=1769552684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DeZEMvDv+Ew3EjInq8QMcaKTLAuKh7vFSCIGrUk0dNY=;
        b=LqoYZ/79Hxrt+3/KmvGfaTrmv8/HFv+uWuBbDKr/08iDgLrNpQp5KShgAybwu6roDX
         /EqVT/k1NR12Y1kjcjBn03UOaA9kk3rMt7ePQYHnRfCga18K+If3VmNXwqhT89paeFQ8
         LZU96N/J8TLVMJpKu7HYN6vtkvTWvlbCGISsF5/kiOtd+wuRF+R2veAhW+pBT3cVbhSf
         xJ4Wlg/fVMWCmWlnw/FBTwCgK2WZVZ4u29Bn+2vIrioqKaQEUpTKBADN9O1f+NihbBEl
         VogdQ0raFllCn9UTEXUbBGZCdaytW5LoQIWKgGht5nKedZQvNPh7V9kuYAGJffjOWBOK
         vdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947884; x=1769552684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeZEMvDv+Ew3EjInq8QMcaKTLAuKh7vFSCIGrUk0dNY=;
        b=lKls5Urk/1676OCpTST1B90fmwUaFUKABA5tV9jeCXiDpnlPqq49noaKTSc0igGzCt
         7a2nxKaw1MEXhN8maEdS8QHhUdHx85gDdUb+a/LaVzWqVLO6TCEcr+U8iecm+IshgdBZ
         uK2sZoLtX8wMFj0QAcu+6UZpLd6orD5WRCHgzBpB7JYZAyrQEXhZKdjdUXrjNXpvsOQO
         1LQjbUgC7fooKCzg4n5AwSRwk9lTay1r9xaCqkOgokSwW72r1GINRBUvetBk1nhHIkc9
         ep/kPreEawKpmAN47zQFQHpKnZVODVvxophf1p4PM0xjUZETHemyAHCwXHPIIWHi4mSP
         yzXA==
X-Forwarded-Encrypted: i=1; AJvYcCWfhBxpBBeZCUyq66enOC3vKl1D4dwy6hxSTS5YTzQ3lPMX54TLQ9CAe+FUY1uSLv8Ul0Pu3YmrvFC1@vger.kernel.org
X-Gm-Message-State: AOJu0YwUXNfqbIwXe4jCdZwS+lRID2FK/+Vay92SlOD3ntVz1bms0beb
	rJUi1kZK2sXfEjOaWLcwpfRp8stYpGK5HoPPysNnoT7+GUPAk4rF37WvUHTGnmnlY/n0gELG+5a
	fIu0aKG6VpUHrEThw53WGmV8k+rOyX5A1KjO5F5CnIMCTtUUeiC90A5ewre0cCVE2
X-Gm-Gg: AY/fxX4mh4orYFz9nOB1xYw/q2eZ2d7lMrgyClezPAHFF0Mu+Wtr1GHtQlCx8pkJCiv
	nafrfdSuM/FFwydz0Yfm7NR1M/2HQGmcCfgR1GfnlDlu0ZFWnwq2+JdDfJUy1td2sRCw2FPxUOE
	APNldKW7LrFXnrFrujlT7hlW3XNlMHiUZodf3vuBFbb0qgOY403ewDUfR8SAreOR5gyQ5QpbIWs
	JQBRhA2IkYc0z9CblIlSwU+hwgtCiVwjuCKLaqSwHY9Wqa2GBgZLjJ62DzGbvW+8t3B3ojBYNbV
	XDzKw5tgG2rV0vgtZuqK3JPNpmaxxz8Rq4PJciucxAIluN4JmirxP0bwfdY9SdFRTrG8WwoLjJx
	qlODtWpDP/Wde//Xue0NFsgH4CjJuIT4dtBWe74G6YieXehe2dL6L+QUfA+2HnBbBt6YyNfJZzq
	oV3RL3RU66KgscpgofSkDKpdw=
X-Received: by 2002:a05:620a:7102:b0:8a7:2373:1c75 with SMTP id af79cd13be357-8c6a675aee6mr2039827485a.49.1768947884135;
        Tue, 20 Jan 2026 14:24:44 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:8a7:2373:1c75 with SMTP id af79cd13be357-8c6a675aee6mr2039822885a.49.1768947883535;
        Tue, 20 Jan 2026 14:24:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf1fdc3bsm4348474e87.0.2026.01.20.14.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:24:42 -0800 (PST)
Date: Wed, 21 Jan 2026 00:24:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Message-ID: <c3vo6vuvq2vwwmu3iqpmdpqajtsfdpzyja6toaycxn7gmvjv5a@yqrapjovdb6k>
References: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
 <20260120-pinctrl-qcom-mahua-tlmm-v3-2-8809a09dc628@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-pinctrl-qcom-mahua-tlmm-v3-2-8809a09dc628@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9Qn8HkS98BzSPbW13Tiqnf3cGO7PDdEd
X-Proofpoint-GUID: 9Qn8HkS98BzSPbW13Tiqnf3cGO7PDdEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NiBTYWx0ZWRfX7aj5XP7BP5mT
 E1PZx0e/qd6BK5j0d9FYxL3gohKkuABNUgzXXEmT4SsGuYKQLQ3vVNn6IL+Wmm1rQ0qa22qYY+O
 smI510Guylie86WFgZCvVgNjMAIuQZSq+VV0zkAsMNDD1cgyYxeI2U7uaDirea3jupn/U9cJvUG
 RGs7x6y/ItOHJOnZjRG9S2BaAcEh3ovmo7hot8JAtwtuMxC7uZyYh3CBuggYg8BEv6KcTOtmsdd
 sW9lOKY77wWooYmLvLprYe7qA0C3dCXGljbRU9ichbSL4s0gXMB+KEdobia74h/zzWHBoOJL3uC
 NlD7wm9wevaIs1L/YiiIOU2M9hYxd/UJX0ijzyF5Bt3hn9eWLe8gzvABZuDuJyihdHtzarv0WBx
 m2AouSPcVqF5/kjYRGjrzqBbIzaDEh7LftzVBs1K32oG+JaHxG0g4sclHjaaAe2QOZqDmRf7XEL
 u8GMltmlmMA2dBE84Pg==
X-Authority-Analysis: v=2.4 cv=RqzI7SmK c=1 sm=1 tr=0 ts=697000ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1AF_eU0i6fnmeDSNickA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200186
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30825-lists,linux-gpio=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBECF4D6CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 09:22:51AM -0800, Gopikrishna Garmidi wrote:
> Mahua TLMM block is identical to Glymur, but the PDC wake IRQ map
> differs since PDC handles the interrupt for GPIO 155 instead of GPIO 143
> as seen on Glymur. Hence add the Mahua-specific PDC map to the Glymur
> TLMM driver.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-glymur.c | 46 ++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

