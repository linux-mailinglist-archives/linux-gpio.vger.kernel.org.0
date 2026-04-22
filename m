Return-Path: <linux-gpio+bounces-35331-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO0WItMn6GmVGAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35331-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:43:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4EF441219
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 570F23035889
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835762F1FC7;
	Wed, 22 Apr 2026 01:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U23XLmAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irK4VJF9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB4C29A31C
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822220; cv=none; b=ObHm8yNpxhcGQU7JTJiLPoINHa6yrWlFuxzaw6jMMMAttzcM+e0hQOOCquLaR+VIM/p2YagZ0iG4afiaY0yNN6EP+etfM8L9PbrMAYIweFDe9o8LPzwTcrt/I52aQl2uiKXj6E4xqzZ7/+hpyzWP1f/MokilMZHDKkElWq1u4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822220; c=relaxed/simple;
	bh=OXH8DH/ui8xW6txaS8itkY02XzsE7K7pwEs85oFzs00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/mfFvaJDJyGRxThGJ3Ntx3zgj40fWt59Spz1lOTWQA888TieAlWPTYGjuWRBzIsb+yk6A+AoANHh0j9vsRGYPXxUHKBxrBzw0gINqtmsg62Nm7QWuNChl1v39PpVB4KyltgSSXchS6n7MnjGepzxXVOiuVjecylh9RNywboETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U23XLmAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irK4VJF9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZuL33730893
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EzMWH3llJFQMU2+MWwxLHFCk
	KmB6DC32H1dvf8Nmf0Q=; b=U23XLmABdobPkxFYtmI8j2BGwsaJk1LImoGE7BER
	clHppV67jKkvNDK7anLP8roPOy/hGKplGiJFGSr1jWoJUBhemTjlEOw9EwvsBlIj
	UFtOeny3jpAS+WxYWvPfg5Rl4JV481wxbyX2UfqRTCVrXqcJzw3sUQXxH49cnc7d
	UoCHODQFpDxCElMc/gD2/Dcxtq3wwrl9Upf3iMtg5osGu9iZFtjTmMJSvBftWpBg
	Ge3vtt/RIXTuBpv8CEM9PDt0vtt/kiuSLR9SEq9Cc2TyoIQtyCcLPUF+99+SGXmw
	X+3T1FQ0x2eDMuK/pM7IlXRUQlIllGkyl8n9xrYmt1tdng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfs3jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:43:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e423a05c8so24345271cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822217; x=1777427017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EzMWH3llJFQMU2+MWwxLHFCkKmB6DC32H1dvf8Nmf0Q=;
        b=irK4VJF9LP/HtvkAngl06//U8wRzxxiw4vbOH67wug5T3EKCKKJGeXX1TfWejzoJgn
         Qhd5nKpDjkbJNXf2SI6p0kna1cjTavehy1NgUSIchXEpOKhRHh8YWczAYhTkMobAkPfw
         SZ54tkOpNWULuF2TP/6ki5Bx1IqYm/+/H1szIjjdfEBocAX4IjWF3p3nyNDcCPaCo6Na
         fEqVRJ++P5ZjNEB4gGJ/Ke2NOG7be7wsgILpdpj5sQja4GBvHcHHIK8M/4OVcTOQW2IE
         XrSMvrGyGbK7cBoc/Kxsjf07bblbLYaSQmTSsz5cBUf7JHcml2MNKigVxD7WGcoJDsux
         C0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822217; x=1777427017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzMWH3llJFQMU2+MWwxLHFCkKmB6DC32H1dvf8Nmf0Q=;
        b=PBvDzIVfQQJR8dWOcLnurlpCm+IJa0WONdFMDzMbYZFQRj7ju6RJLMqEA4o3nyr+nF
         CHiU/8XNJP9M3I4KMV+dv9YOiKnknLf3pehyWY5+mnVCfxILw6XR/kcX0BuXbsLtyWfM
         H3UyLxrnXVhdLrhJUX1QiltQmD0nCp7eGf2YAY8D9TeApOH3XICoIA0h4Qd9Kp7kdn+a
         4cM+msItd90ZH6OZ1MQkc1FKwdFD4s/rzzDnzkowKIdfdaXjdhUcI3E34qVAWFlXq1eh
         MJFcNXClM1IJDIIa9riUmsItkh10l+Pz/G+UasbyeUONWV9GCXiCvWdhnOzM7zkT3/+E
         RNfg==
X-Forwarded-Encrypted: i=1; AFNElJ974xSKBj9fLkWwdMBnsFZTsIGKX4526KTm7jBpNM9np/SGndF4JGoomGI6vVNSIQJLnRrZBjdX/q58@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3iKJMjf0kYWUwDFl6VwHXdEGnsd4Ov06GOG5rHIwbAyT5imb
	kaLkJno06X+tEJPEP7oSeuXUVUvI6iiHcA+w/epwz6+VfwVhpjylo3OV2odUKjrZM2xLNfZxCzQ
	PJh3cn/Eg/ZQUztL9HcwoEPKcOAKddg52QT71aVCNaN9nwYjFavP/spFHdPpiQsuy
X-Gm-Gg: AeBDietNyBIsEgwP01Tvrog8ZQSerE4LV+YSmw9cXnvF5GEYNB9stXh7+EvtS8/Bm02
	dGLf7J+U/Q7XKNgK9U1CpXO9E8z533Wtrt71UQSGHDXP1vPV6jcDmkvAKLi18zo92FPDhuu/HpA
	JNjcyTOs0oIB5hQLlyGRBoU3SPH/QePqwPkTrJQusqOulTXItaCxiHp4O2g61Dcf10nYQ3wA/4D
	tLAid+4RzjmUpeRcX7isUNcmBDIqkNLeCxMHwc0ebzl984efzD9izL0zZDBVQpItQMuuygCZSqP
	IRZN3FJS9BcSDMthRpBnfPXelIhkZ01KNP2xZcwBmlg8MGPNZ3q3v/dKv+YBiT22UM9xMxRzQAg
	hryMTStLVeg06V1Kzyq28Q8vh74XJ+EmDqsIsjVZLlsAlfStstFnDMz31g2+NoFb22HWN6IQxFB
	N4YBnCSmiBgtr1K4OYR4+IzU/A7i7edl8/VYqddfpnhXrN5Q==
X-Received: by 2002:ac8:7f55:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50e3664bc7cmr277776571cf.14.1776822217225;
        Tue, 21 Apr 2026 18:43:37 -0700 (PDT)
X-Received: by 2002:ac8:7f55:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50e3664bc7cmr277776341cf.14.1776822216746;
        Tue, 21 Apr 2026 18:43:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc297sm4026483e87.18.2026.04.21.18.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:43:34 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:43:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add PM8921
 compatible
Message-ID: <7zumbrohiu255tngsebrm5bd3xthwrgugqa2re2ewgxydzlflx@j53a5zj3yude>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-2-bcb0857724de@alex-min.fr>
 <46a322f5-db18-49cb-afb4-ec1a5bf23717@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46a322f5-db18-49cb-afb4-ec1a5bf23717@oss.qualcomm.com>
X-Proofpoint-GUID: PmU-ZewkIJ7w_gGr3CF3TFuWTlK9AjPf
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e827c9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=F7yC289sF44U6c_-gYkA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNSBTYWx0ZWRfX+MQd+7bzuDHQ
 WmFb/1Y+DQey/Eiv+ruGu2y4FUQ2xvFZoaw5ZZIYyPRe3e1afU4DHuXeyV7KTg/mbpdoARUqwiy
 l31MVbXp7KRGB1sZB1JKGcRToHrM3OcLo6qYxKMnZmdszvWO8JXCXq6RFq/icBPJ9rt8ZWHqNwc
 Uv7Y2jBu7duvhpzQ5IqqhC8wt0dmubxMvCaoBYvNFsqIW0mYC1oU9ywZvdYYq2ayXztaUoxivfv
 nWlv7jL7Yym9efLgKepAS90ytZqieBnlR5sohJZRtw7IMDhXXwn6pYdwn/MIY76/RhTvKgsZLGT
 QZC7apAgSELfQH7Q44zlglkccFOjCcHsiKbZP7WIA2bcd8O+WtjrtNJsKzexvBac5JeTmHSfq5X
 cSJwSj4k0oH545XLLPesEw9ZpR4Yl4nJto9OJli9NzrioBYOiO7vXvMLo79V1H9knQ/lAA0z+n3
 9sfIh6tRmMuZ1ieaacA==
X-Proofpoint-ORIG-GUID: PmU-ZewkIJ7w_gGr3CF3TFuWTlK9AjPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220015
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35331-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C4EF441219
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 12:03:36PM +0200, Konrad Dybcio wrote:
> On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> > From: Alexandre MINETTE <contact@alex-min.fr>
> > 
> > PM8921 exposes USB ID state through the same interrupt-based logic as
> > PM8941, so it can use the same Qualcomm PMIC misc extcon binding.
> > 
> > Unlike PM8941, PM8921 does not need a register resource for this use
> > case, so allow qcom,pm8921-misc without requiring reg.
> 
> That suggests this block doesn't really exist on the PM8921.. I
> can't find any information that would suggest otherwise.

It actually exists there, there is a USB-handling block in the PM8921 /
PM8821. The IRQ is present and it is expected to be used in the same
way. I'm also not able to find the actual registers. The closest one is
OTG controls (0x6e / 0x6f).

> 
> Perhaps what you're looking for is "linux,extcon-usb-gpio" or
> "usb-b-connector"?
> 
> Konrad

-- 
With best wishes
Dmitry

