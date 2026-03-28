Return-Path: <linux-gpio+bounces-34345-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH7kNYHKx2kLcgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34345-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 13:33:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8397334E6A8
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 13:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DD72302B750
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 12:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B1238553E;
	Sat, 28 Mar 2026 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjEH4Skf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFZN2VSq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339C73783C0
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774701176; cv=none; b=WduLN0NscuFi5v8FuaRrhafRJyoa9xxjlnfW3nrdgzQkzi8ofmBSvyI7EJtlWYUz6lNzM0Z+P3Fg2WP/78Ns5HUYqA1qsRqVEl04jnaK0otuXLsksqmduz6XouPHvMTElNssOyvALYAlFUyq6czHZ2PDxXXz2gmrPZNXvJfsPwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774701176; c=relaxed/simple;
	bh=giZMbyB4TBmhjwN3fuaqoO9FFQ80IGzzaQKVLzkAGjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6HZzvim74+RYa6Dut3K7Kq+DPaJ3uYbjXGij8l+ejkE+ZdVgT5/1mi1H4XbltbHVIYV+mCwlhunGhhj97BCpIEoOj22n9Z4xso+lECKDuAb0WHHNRDg/Q8FyY5NdwLghiEyeovOgoDa7zOtb0ea+xIcM4gcW5dAybqm0cZe8Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjEH4Skf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFZN2VSq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S29BD7855046
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 12:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zLIE82aKADzB228U1GH9uwyA
	RHJTAmhtB/2IjfL5YW8=; b=UjEH4Skf9ZaoMJjdK+YZFva0Mr5jcaf3VeBd1hXG
	a1W4SjwioaxztUoW7FwkuGikzEBlBsj0UtlTdbZygeX5s8CS23qAPiCSbCvj5TdN
	xA2X7P4p4ObEb9z9iCTxECDcQri1+8I+uCwaJGKN+Zm4f2NwyfX2fNbLeFnTbLhh
	Ik6RZHJ7QlbH87IfsBliEUDsVKtyDyVL2i5QRet3XeQHzkxf1eYmOWDlD6vVtgOq
	xHBzmDEP0gQ80znQQh53b8XI+yU2wtqYK8kPHOQMONOzkJs6plC3GtM0hYJvAns0
	xYr8jJAvK7EhHn766szgP+fZTd55cfPoViPECHXZEgeDuw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqgx2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 12:32:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso40282861cf.1
        for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774701172; x=1775305972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zLIE82aKADzB228U1GH9uwyARHJTAmhtB/2IjfL5YW8=;
        b=PFZN2VSq4BH2V8oVn7SO0Z1y3RL1IWtBzbWqLj0i6Tf0yOx8Trw6AD7TKswRcS8WqW
         Vtcxg5SySRtNKXq6LfdmLMAMk5V6kU2ZeXdDb8N6s7xu8EuDgcYCsix6VCE0vVJodBbI
         HNk9Z2JrTZ+tYjoMcTy4IQpfJVgV+SzXWB13aEQjcQOZgLtAC+oF9VbzXWt/VSx8ibfr
         Sxd91DntpIcl2PFiXHCQmdrR99z8h4chtLXz9iys9uAkgJuWhAaZPLOpwu5xAukPVzK/
         ETk3Wl/z/4BRc76VgX2Cs29AAlJwM3o6J1haXsxLwv75Zlk7pNdJ7HAb6kLM4QMZzWY/
         8+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774701172; x=1775305972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLIE82aKADzB228U1GH9uwyARHJTAmhtB/2IjfL5YW8=;
        b=FvvfNWqgXSTFLkqNAxVEYnOh+QKv66fcdC+R7ngXOCk8N/AknwZutCFgsy4xarR33K
         XjYOLoGbxuZ0oZHzZc4FOigNHZELh5dge7M3wtRBEPsUAlfxWSRQfQeYR7Gb3vb3cRjz
         wC4nk8Q8UCTpdt03aaL1OhdlC3SLiEH7CSETukoYiHaWB8kMCY+UI+IBQrqmv5lpmaxj
         qupABosUm13U6PEKRZBN3Ac7oUpcy8z52wk2uwO8t36SwuxARal9M1L8yx/XvGOqCNx0
         7Gk8oh+JN5YLJHvzl5L0El5KUfekH82EDospclFuo00yQ+fJF7TYpfLWFGEpoDl3Hh30
         Jlsw==
X-Forwarded-Encrypted: i=1; AJvYcCWRSI8vzOwORD/RalYGd7Leiks8cCukdByszbXLaTPSKlWxCRbchAZJ28LtckQ05TC0gpP9Vm6HIHP3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8x1yQBU4vI3jwOUyhNz5gr0nGLYE0LNgKO5c6pD7dsOuerY+y
	H3KLNYUxGgWMQcgqlulVvyJOIY6oBdLXCBXf+owf1b/lWTH9Yjur1roSN7/MrBrrGLthaTolf3n
	lqaE0+g149F0F1P8Z0cRbPO4W7XVVEXHBpezXxNr8hVZ1lgHlk4XRViXEW+3fZLmU
X-Gm-Gg: ATEYQzxRLzjB6ovzh++4GgqxcontqRUV40t1xcMgEDnNG04Q2SDLVUBUW6nG/BSyihw
	eZNMH8jgln5RQsVfiBJRv28QOSkiA80/RkvIKq7sJyTgR+6CWc8G26vpLrTYM5QFh7tr1HMBQSy
	MDmFUHKw0l0K0ezm+nt99EHCMbfVEyR5GgsRVVIcTUpsk4myhE0hBTwqJWkzGD6QuRYNeir/8vQ
	U/Ra4sOco4f0xaLSBX6EZytdargzhpGEUgiFPWRhzR9E2e2hjeEx+w6vHITQo1fEbYPTc0tvWzL
	O8xGb/JOONDcTZ0hBpui3JBRnkZbrxw8O/Sh6J7lc9tUUI4+DeGwjnWpLphLKQivOJrOYDaWth7
	fVD041ceRuuu6fmC3oYzv/qnZK0oDOpuoLNA+
X-Received: by 2002:a05:622a:283:b0:50b:3f50:178 with SMTP id d75a77b69052e-50ba380ba43mr79328921cf.14.1774701171759;
        Sat, 28 Mar 2026 05:32:51 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:50b:3f50:178 with SMTP id d75a77b69052e-50ba380ba43mr79328361cf.14.1774701171143;
        Sat, 28 Mar 2026 05:32:51 -0700 (PDT)
Received: from oss.qualcomm.com ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e265fsm5125925f8f.1.2026.03.28.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 05:32:50 -0700 (PDT)
Date: Sat, 28 Mar 2026 14:32:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: eliza: Fix interrupt target bit
Message-ID: <gjld42tywuc7ggxzslcobwwxjr5uiwgukj5tj54ipavhpi65ny@easgpb7t7wli>
References: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WdMvPfKh7pfL1i6uWUiKEUkViecJ7ONp
X-Proofpoint-GUID: WdMvPfKh7pfL1i6uWUiKEUkViecJ7ONp
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c7ca75 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z7K5_F5WLHyQu2uRg4YA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA5MCBTYWx0ZWRfX/988pJAiRqDU
 9QQJT+o8rIqttl4qFzuZxj7VmWUB1PFx/cao4By0Z2T/VLZJk9Uc/OVqUm5cl70JDm6X78EXqgv
 bH+RQlZ1djEW/6vwzMKVj2aobQbOj4EBPy00KvMdkmHd3LvdtvivnBKSoqaWMF1/OyPc9FeEcVD
 Rbmf1MX0EGk7fRO8ra9SD7KTtoGgxOZepvZ2njm5FHTapN1AfOThlzu3Dn8kn+zPPvBN+lbxtvS
 qYqjzu9sz30+gwxqTlaZQ92/Dp1y3weOh3ULRJLkoeUqMmYYLVyDepI6bLkD0QvVPpgMsxW/CC0
 bErCFDWH3iYNUoEm315lJ//ChyRd4gI2d7XwPv01cukJ5nox5f6jwSv+PNtyWSTWeIVT0S+ngev
 Yh9dd5idQwCLSE3yezJLI3DU9oRKlrTKtWzRCsQ0rR/b+bk4CqvYX3JpHsIR+ynx1WE5ECi+upo
 LiGYjF2HFOfthmtfFtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280090
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34345-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8397334E6A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-27 22:42:39, Mukesh Ojha wrote:
> The intr_target_bit for Eliza was incorrectly set to 5, which is the
> value used by older Qualcomm SoCs (e.g. SM8250, MSM8996, X1E80100).
> Newer SoCs such as SM8650, SM8750, Milos, and Kaanapali all use
> bit 8 for the interrupt target field in the TLMM interrupt configuration
> register.
> 
> Eliza belongs to the newer generation and should use bit 8 to correctly
> route interrupts to the KPSS (Applications Processor). Using the wrong
> bit position means the interrupt target routing is silently misconfigured,
> which can result in GPIO interrupts not being delivered to the expected
> processor.
> 
> Fix this by aligning Eliza with the correct value used by its peer SoCs.
> 
> Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Thanks for fixing this.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

