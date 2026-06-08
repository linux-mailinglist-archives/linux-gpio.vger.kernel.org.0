Return-Path: <linux-gpio+bounces-38062-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id juDPH/c3JmpYTgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38062-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 05:33:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCFF65271D
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 05:33:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WPcHjet6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BwYCkgmd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38062-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38062-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE450300AEE6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 03:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8318D348C56;
	Mon,  8 Jun 2026 03:33:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E26E2E1EE0
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 03:33:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889588; cv=none; b=DCm7+KlZmFM11wh6VTQkiB+xR8p4oRpeCp33TQb7GSYhtFXPlcpsQ59R7iQdrlpfVjvM2OEM6Q18IdpHBFKNg5FCfbAg/LrGELQUoHTwRvWTYlPyzM+v4Z9+ysYI1pMyMT934Ohx710mGfqqJjF+NS2Y4jgDP3NF7wSJ5FSHtdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889588; c=relaxed/simple;
	bh=FpJMI6QyTm1RuGToGXiqWef1RKdiI399N3tazddUU1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiP1qbRofej4JEo6nzYDsIhP6BdvR77N65CwtC0Z/oh171/Jwq88xcET+msjcFbS13eI8mUaVz1gVbmvUm8HnR2dqkXjry5Pvd8dFz/xzhsOI74uvfMcFt5YBjSjbBOvarBZebYor5qBd9OSUjWVa0oJcFnbriRVBepklRPrp5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPcHjet6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwYCkgmd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580ECj31575140
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 03:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pb6v+qD1GF9Tb6lcJQfNUMen
	u9ggsVGxX9E2kC4lICU=; b=WPcHjet6io8fBLfdI9QND6dn2OQUzWziYnM2IPTI
	fpRXkD4gS8vPMyCt4yE3QWUqNQj5RBFFQ1ZW6KHx3ce88AEpiqTtneiLpG+rjapg
	Jfrx9m3STJZbOERH90aVUnf6LtvD9rBBQLRGaAcYp4uDYtrCLn0HcxBJdleDfDDl
	VZXhoqMQfYUUwuHmBjJbqxxT3O1s5toJHTGoueZwJTWF2viVnVSfrnIXftHO1mKi
	SqO8MW1yAVq4mrIv8Ak41SjYkrxQ4VyfgqEUQAHfIIKaKZBS07adoBubHkJXy1d6
	aRceOrBH96Mq5PAPzexrt0kq/5AhW7sTVbOqfJxJjG0LtA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1dghd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 03:33:06 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7c11611so1575657241.0
        for <linux-gpio@vger.kernel.org>; Sun, 07 Jun 2026 20:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780889585; x=1781494385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pb6v+qD1GF9Tb6lcJQfNUMenu9ggsVGxX9E2kC4lICU=;
        b=BwYCkgmdobr+GVOqvtX79zs0+cRNvbIuExh5bIZtdt/trlYO0PeWWf2C+ilXhkuL3M
         /vrB0P/7E8Qr/I5xDOh/3cQ2mN8i9+DG7nmv3MUwuvR4uSm2jpUOtNx3DWl+uQnMwUpL
         yMATbkQ8YEFjIFCZ1p6r2xW1BvQ9iAFZzgg7zKybbFA2dXW1aaX53VM+AAXGW7m3XPoY
         /NzhGVwhNbs1RcipdoehkO5Rs8xFYW/hosuEEUJ9xRw8tUQV+WF9dqSB4TdwOLbctllf
         lVUw18YXIvvzyKTjzXsyvF/yTSdtElzSPfdxssSrtEOPYuVRSERPDCMqdnSnby43MasA
         GVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889585; x=1781494385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb6v+qD1GF9Tb6lcJQfNUMenu9ggsVGxX9E2kC4lICU=;
        b=TKR5120vmiZWokUsFPN4+5WjQ+3zDXijr4Ig56Q3zaLiSZ8HCfDWAzzEt293SPhN4E
         pf19Cz8XTf/xPqsQuY7B6k7r5fCenYpsRbDTsSNk6/sBHtlmR0BWNbn181a5C/eeEzLi
         31npFVp0Humb4zI77rpSTaN12YpU/Vuu71myb3DOmmPXjfEfuKufP6uUY85SZH7DVCP/
         m8+BgdZ2GdaovG+FhC4X1f6UN6SL+R7rTV1a2RIOhbCZPaLrD5ZmSyeikUzcS18VCQOp
         Fy4mKqmMN11SYZB07f86BhFRVezYBQJMUIvfgv04iAPNczazX0MNirJbw9sj0RM1AEXo
         HlFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DZFEkbiHhQ271gDguH59YNQcx/19GLhBnS7S/uXOhrXEtwkGf9yYFp7QnILtwEBOW253JUefEUyv4@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwjsexrnyRpyIW6oLr86x3j0rGBJWHnjfc6OKA6SjtUEbH1Yq
	3SLePCPDSmJhOAs/VzVEuo8tke/DRJZs32TAvOGTLDPMzIUcXIbedC01o34EIK5WfFltVQIhS9B
	aOOfEZ3tcIFHgZmJrQidDNtpZjVAZPWhbRyGovRLA81ek+RjjcZEwnhXVdfbJbDpFazvF9bfN
X-Gm-Gg: Acq92OGC0aHm8baUCy+0IntBnxveOFHQGrCG7cmxzfZ4AWm34a48szuENq5sEXfi0tV
	4XVl9qy2PhL9WBpoDeLO5IxEUYzazEWzZXk+SlbAlCPX7wlq5/5XKCsaAakjIlXt/NgcGhJXYcL
	pbThCK30AUz8WBUvEDVc4GiKZ/ESQMDvJrEXu4pAo6J0jJu7yiQ8Ca38q2CtCLs3mmgq5oJ1zg5
	rSwp6zwLPha3YClzZWQ6HTifarRXfgz75lJPD+8fSFvG4pp2MpdogqxVwuLIUmVfW6dhzwkkInB
	/0ux1hduC1uuD9YTm0XjS1ZeawzdDyftjhAAiVaav1CexAnR8Y5JYcv55LaXGmAlcYfY11tTgU+
	gBa8oSDXrXkghsOKJqg2bcjWAOM87uLdilyEAWk3IXDMh5hYVGC9tihB3mnqc5dtELIqEkU0ASK
	11km0l+dhdTbLCeqhQEBm1GUoQ8xX8nCRo/Rn9VdRAtw7m7g==
X-Received: by 2002:a05:6102:3e13:b0:66a:4052:3e20 with SMTP id ada2fe7eead31-6ff149353admr6181929137.26.1780889585472;
        Sun, 07 Jun 2026 20:33:05 -0700 (PDT)
X-Received: by 2002:a05:6102:3e13:b0:66a:4052:3e20 with SMTP id ada2fe7eead31-6ff149353admr6181923137.26.1780889585071;
        Sun, 07 Jun 2026 20:33:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed901sm3487135e87.10.2026.06.07.20.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:33:01 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:32:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] pinctrl: qcom: Modify MSM_PULL_MASK to accurately
 represent PULL bits
Message-ID: <hi2zrhoqzq75yqgplxgibk26c5hqnzd6i74bjxm5r6h22zldh6@3vwnwbsz6ilg>
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-1-88bfdccb4369@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-tlmm_test_changes-v1-1-88bfdccb4369@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyOCBTYWx0ZWRfX02Ini1kbbOem
 pal0sZVrX51AQRXytDORc/tkuzyxqfW7uDwWNeho0M064vjEmr/kqdMB9t1kkle+gSLqDO6yM+R
 VKIgOYDps3XUtX+f895wIb1W+2XvgkJhmdPozjx7G0I4rVstV0LaXkr2+/VIxafehaTdQqeXkXV
 /Vqn0iE23/sTnidkkPb7WLMvLIKIYfMlUKiYm3Lj3RQpKsdIA81t60b7WXL5FgbQJyPN30Nonyl
 xSTQVaoRWVv/sOYlt94WB1eyZqysP/qBGIMRSzfM8E4t7f1rfbWEANtqnGKdWg1q76xihIiFaGF
 tqOYFkxIkOh+THQ9t8ltdHbiNKiBhHVfDCvlZDqRNMSXfz3+N8iy102L8aXogcVAAAQLE0U4eP4
 dknnYsML+8JVPCaSQR4WYw4zp2zrfC5OqZNIACNIQN4VNnvMNoRTdJjP+0n+jkVTlLnIK5vW73k
 tOW4IaYfPvqLMcU1pXw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2637f2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qVY8_epACHd-z0WO0hwA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: ZziZsjJ_j9mMp_hWDxEnErBWbRd8gV78
X-Proofpoint-GUID: ZziZsjJ_j9mMp_hWDxEnErBWbRd8gV78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080028
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38062-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDCFF65271D

On Fri, May 29, 2026 at 06:25:44PM +0530, Sneh Mankad wrote:
> MSM_PULL_MASK currently spans bits [2:0], but the GPIO_PULL field in the
> GPIO_CFG register only occupies bits [1:0]. Bit 2 belongs to
> FUNC_SEL.
> 
> MSM_PULL_MASK is used to isolate the GPIO_PULL bits before writing the
> pull configuration (PULL_DOWN: 0x1, PULL_UP: 0x3) to the GPIO_CFG
> register. Narrow it to bits [1:0] to prevent unintended modification of
> the FUNC_SEL field.
> 
> This causes no functional change since the driver currently does not
> modify the FUNC_SEL bit, but align the mask with hardware configuration
> nonetheless.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/tlmm-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

