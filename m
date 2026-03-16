Return-Path: <linux-gpio+bounces-33542-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMB2FdMSuGk7YwEAu9opvQ
	(envelope-from <linux-gpio+bounces-33542-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:25:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D529B4A6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55BEC3006B40
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570DD27F75C;
	Mon, 16 Mar 2026 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A10ZIBne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/JvxtE7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6622798ED
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671118; cv=none; b=pxnTadoloWQiPsQFHZqCG0/FYL2Jf31AnS10KJq4jBGe1pLz/x9hN+nRYlVXLlH+yKaWLsryhuzLR4yPyLuGhtG87VZpey5S3OWOvvx5D/MJxU8ozlOxzntrPcO0f6bKqHZx2cM4mGgwLKwFaYWyB483jlhuXqJrQ8ELugbNFWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671118; c=relaxed/simple;
	bh=6e4rhKUtU+/LA34RM+vpnxP7j3EZfsa1hnnLA2PMQdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+iQ7Kfe/AxLJ7Hq8AMluWdz9idT554LUbyFfRsxnYegl1LZ5DXRPpok6hUSiiUp9mWTkgxapVjwN+zYpiCeEdZbBPz8nZTOfYDzWF3U2nPY6YXalxxjntk8F5WWOgcgI+4AmpnZxAZU8vYU5lKh2KadfGz4J0/Oa99egS/jlOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A10ZIBne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/JvxtE7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GECML11639209
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FufbBZ6KvUlCc/8h8yiBS/sA
	Fm2PiNYMNbxpqry01Wk=; b=A10ZIBne9/AheXRMdep7+OH79lS2u4K6A5a8t3lm
	VDFFPREodtSHUsauP/HRrSv22UYmt97Pw77nNioO+6UzAXei8XAtHrZ+y1VNpn1M
	Oqy+jWZXM40PuWNgO2O5K05DG2zlV+zE4H3HlUD5Er09wD3/v4O4J+zXwy67NFou
	zHL1zgmzEASuahO2Hi9qc4vBbycB66sCQMVK8jEAjHOzTD1ZYDnNbS8KGu9gUX9e
	eL4zQuzEVpn6L5Hiy6E59RLGYVJy6wAHJvETE1zi7HxfM+8neeWw13Ju0+duPpZO
	JX++IibPtvhYTJaqC8iLguFNJnb4exUynUbfkDfWzS+k4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke081pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:25:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd80c4965aso3150771685a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773671115; x=1774275915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FufbBZ6KvUlCc/8h8yiBS/sAFm2PiNYMNbxpqry01Wk=;
        b=R/JvxtE7xzr6+XF7bjtB6cjBES9YeQ4zsYMor+XJo9y8TPv4Iz3jaTeOxrIl6f6Lrf
         DILEqnc1wU32TLnXxJZMNwVDHjz7mD6lhKElXP1JficCjCyQ4DUYYeeNpvxDbk4/5HdG
         z3rIfKYj0OI6pD+0+XNP3NWNOfV0DOEIuSfErzOofaqYa1pGlnAyJPQAQlXFc48Yy5LY
         sWDYpVQ+7K8yXZiKnC/Dg9hkpYezOrySEyEJ6WJTOCXhM145K7q9uU2+8kIMxbEAsEWZ
         7oe8WdTy6KQqJnFV9h2Jnqrmrry7lWkETAZcbtndxpL3ji7P8ilXvCxOntex9mBH0G+m
         gTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671115; x=1774275915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FufbBZ6KvUlCc/8h8yiBS/sAFm2PiNYMNbxpqry01Wk=;
        b=CTx0vT5YmLhGz4g9SovTjqyt52abl12Dbn0NJaSg3WT58CHgoOrYTxn4IV+drZ1K9d
         P3b6MejBYBVwe2+A5lN61HoRHvmmBBiwZsMBnAdvbTeFYQlmzUPhLCz/4Wy+z5neAng8
         2jSC1MA2HWZ4AXBeQv9bRDrPPv4leF7RKbQeLWCzfIjL2cRyQm3jXGZlJKj2CrT9QBn0
         F+kWFb3x791rqcCHTBTGc2GiAwvRiXpBl8qMN/uzIo29cFXC0jqjQoRK4vqzxWXN3TkD
         toTYry0wE1C8JW+2y8g3FGDmwGfXbnUfpYsayAPaaei4Kqbs56b9jK+m2V9bDuTo5BHf
         KkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfBvdTuSuad3J8qV1HsHhjkbUjYY9KNaqq2spBVTwtaRd94+ASeMRMadq2+1APaWSZCYBwRlS7vmL1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz28YRDa3jeuos9tuehOoK3Gs8PicREsvab4zuDrYgqM7pzSF8H
	L+TvNXXq8qpPstt8SKukJKv9kTE4L+U/OSGvs8b6sRq2riHhXia/67ZD6SZ0EJDta2M3EGsnavQ
	X/0hQJTrTwY5jb37mPgHtmNO5Rv7JvJGXTL6O/P59HLFPEihrtr2HOW3P7IDD7R32
X-Gm-Gg: ATEYQzxdMZLIVBvk1lTKE0PmLIkWQlJwv3cZsOnD8RIwMcXSrhzg9w0keQeJcyiVMCz
	37JPnCcTPUWx2oVscqxPpSz+atCGO1v8aaY++U16o6O9FCjIvUQEa2pCQr11PpvXcqPpp5o8Raj
	ELenvq0A0eHHlE5qS9P9J98ksIA31OB2nfzeEzFYB1jC2rDTFPR3C1R4y+h7EqMf4os3qo5dFWf
	rlXPRGRaUYnZiD1EcnOrFeRZfQ/eyx6cgHnzpGl6Y4fApbLBELYiH/X7SOK+9fDeiUOU1ePtHJD
	GvDZZBXq2hCvZ2myNPcLhpWYOXHO06gjNK2J165JpkfweampwUfbX85OA9byJQROwui42zsgxoK
	ywWBgcuUDo2FU2Uc+DpKvl8JPYEj6/qoLPkcf7Z4ilLvAOFKmPNFDFne+1D4UAqmm5lEEcksxb7
	xfOEfq9FCwuloMOUixJVjAMeOYHs9j5fNFOpQ=
X-Received: by 2002:a05:620a:2913:b0:8cd:94f9:1bbb with SMTP id af79cd13be357-8cdaa870dcamr2006148485a.29.1773671115335;
        Mon, 16 Mar 2026 07:25:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:8cd:94f9:1bbb with SMTP id af79cd13be357-8cdaa870dcamr2006141585a.29.1773671114641;
        Mon, 16 Mar 2026 07:25:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm34863271fa.25.2026.03.16.07.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:25:13 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:25:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
Message-ID: <jup7h7tyf4efv25mqj2sz4jmztpqbng3jgk4dvz33ec66wj4dr@kgmp5g5pnbon>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
 <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
 <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
 <uukjr4c2uymzj2pe544hn2w5ecpmqle56mir642zieip4ixwor@3uuhplnfo5qt>
 <822cc610-7984-4684-99d3-8abd679eb06d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <822cc610-7984-4684-99d3-8abd679eb06d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UbaiV_YrSOjLR3tjF4VsMxnTb2Csdhdz
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b812cc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=SIwUhOV2bdwk9Tn9vP0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwOCBTYWx0ZWRfXzBqTtvk51Vpj
 6LWqonq/iKfN1kLHvfLnuhwej7/AmiPwk7UPCQVpRgi7Yg9zUXVgodcsQNG78xCb8xAeeUS/VUI
 227T3XxqeM2mlql6qet/f8RScZnmGkDdayHAhnsqKMVbyrhBFMcZms2y8net2bIWB4Cvlyb7I9O
 VoVP3mbTQgHXBaPsZdTxeUjaFs34K/Sown5qUhS7x1/fgEYP7eOEIV1HgtdQ0rgA6efNWjdjuDq
 V1D+Y9r10bHJBIzeRRSz5h5NHKb7cpEP/FPkE/0UAno9VDg9qN9VbyfSDtknyMPE/NXhOIH51qs
 EuujBA1MiJapn5oceQKXC0kqRhbV5I+l1iWIza63Tw4hmVkjlC2cl1Z/wixKDWHSUc46w/UfHRj
 5JIGYjGuTj/C6z7GrL94WT0KocYMzeNDiZuQpcD1p8hSnx8G0SL/qk6z7TyHuCoI8xbgGK4JcPO
 aYtWlE8KFF2hI9XMI/w==
X-Proofpoint-GUID: UbaiV_YrSOjLR3tjF4VsMxnTb2Csdhdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160108
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33542-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E68D529B4A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:39:09AM +0100, Konrad Dybcio wrote:
> On 3/13/26 3:48 PM, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 12:59:46PM +0100, Konrad Dybcio wrote:
> >> On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
> >>> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
> >>>> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
> >>
> >>> d) Add separate SCM child device (with interconnects) under SoC.
> >>
> >> We'd then have to probe it as an aux device or something, which would
> >> either delay the probing of SCM, or introduce the need to ping-pong for
> >> PAS availability between the API provider and consumer, since some calls
> >> work perfectly fine without the ICC path, while others could really use
> >> it
> > 
> > qcom_scm_pas_is_available() ?
> 
> This comes back to either having to wait for the interconnect provider
> anyway, or allowing the ICC-enhanced calls to take place before they that
> happens, stripping us of the benefits.

Yes. However this way only the PAS users will have to wait (i.e.
remoteprocs, venus, IPA, etc.). All the basic providers would be able to
probe.

-- 
With best wishes
Dmitry

