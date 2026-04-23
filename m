Return-Path: <linux-gpio+bounces-35409-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAGNOPsC6mk/rQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35409-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:31:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5C4514D3
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C49113012324
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 11:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33D13E92A7;
	Thu, 23 Apr 2026 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXgZ6aeM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrJsgtcz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62D41FC8
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943864; cv=none; b=uc6RGUUv5Ylz1xS4kvDG5IJTlkyOyxisTW03H5ig9qHItlG3GgpxP6vDrw8EfhnJB8Rvgc/hgfEGVYyZLKTqutj3lHw3V25UrTdSl5iYvBRGFZPb/deyKDxJwXy1qX7hQyiezadtlWOK9rPFd9NM/sFZ/H3fL0Gg+9y8en5LItc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943864; c=relaxed/simple;
	bh=kNPwiG0o2fObAHYTHHpzsClucyGBTSOmux8OqwF7iiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFDgHDAul9KgWDsFEwC4FyoQNWI3yCLG53G7HoJ9vv9aAIEGJ5j0iTP94YsOb/7n5ysjtg+Aj7nIltyZXq9oslfRKVOkA+H99TBj1GksUxqbfxdwI21IsTyFO/5ZOEaWOAUmdAurLaD1ncf3EwHe6FKX3jiOFJ2HnCqxJOKsaOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXgZ6aeM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrJsgtcz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uI1t3413367
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BskI/S5B/mV8Mgc2HuCbjXXs
	1Kjfb8aCIP/6GQAsIPc=; b=MXgZ6aeMg4FJX452Bjl78JKokZ6rT8CBJgUQwXBY
	B2ESLBkVY057Yjzu7QE91w16x9GbFhJYood9oR4Lqv2f62Ch4uo/lwqIX8lhIH+D
	Eb8JbPdlfTPRf63hEutaQP9OVxrMYhZ4F4thEBPjP46a3LaBmciRc9yH/RmXCjgZ
	i3y30IrQuli9fuOENMkJuTHc0j8PdY8g8pqMcGFpmt6h3N33aAFSAk8pOY4YPdCa
	5nRh+pWfO5ueCX66EvkKkdhVO+aOqEaOEOIrU3sU1dlSmLChjbBh6dYPs//apBDg
	Lh2uO6XNX6dDts4ZLZgGS3NLyLiOVPAfTl6hMYw2pSiLdg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6bncg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:31:02 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56d402a0cabso5602532e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 04:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776943862; x=1777548662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BskI/S5B/mV8Mgc2HuCbjXXs1Kjfb8aCIP/6GQAsIPc=;
        b=VrJsgtczfoqtOqhBIrWxGPu2KEbKwfSc1WWh+o80qwV9lLL98pMobhA8ra3i3d9kmi
         M+hnXm4S7wPC3xGCI3bgVm0BlpiQrS4vrseiZ6okrrM4NSqDtOr8qIxLhaNME8YourcO
         6xIaTry1G78sKe2rZ9gfqETp2oqZrzAbgUSKx+NZmgqxIv2MeLHLonsa6jCW+pNwHAHG
         uG+IvA6swtLsVsiGcXrAEE64uWfuxtGQeyGveSx+cfQW9AxDkFNq7cuB0WeM8S+TOJ5D
         m6jJWTUZ5kqXj+AvmlqqGaqB2D+fP/zuf8Yj30RAv+NST0wjPAAbGsyXMlObn1MbgMjT
         QHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943862; x=1777548662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BskI/S5B/mV8Mgc2HuCbjXXs1Kjfb8aCIP/6GQAsIPc=;
        b=X2G1LlX3VKN2ZJDxtHNN+xpWjlQokPNuxboZOKXoG/CR3bSc35voFKazkJg0IKi8P+
         8OshukcQqXvNKuXrPaWZWcy7vW/OeLwlyN7MmKqBB8PiQ9xP4gUQsCc8D1CHZioVD7+Z
         R7W35CnEn967P0tppayXBGXXK2El8sWNVDDefCR6KRRTMy/vBLulD40qfp5tCcNDhb+y
         lp3+4IHS1xUIznb9uZlE/+J9f3odByKqs5zNer2KfwjN+SMN3DWtcdrrmemegFq9bo0I
         rDlIdFjBSGZF15ZFNIQWkGKXEwPP1YF3FCmIBNGWqrxzChgRt8c38aZzFJhCFtgevd58
         LDrw==
X-Forwarded-Encrypted: i=1; AFNElJ/6l0kF9GPCBVo4YlwpniZHS4k5FnvBUVzRA2YIdlY/3Bt8L7XLvYZNB9653wJY/jsn4ArrQAHT+aXu@vger.kernel.org
X-Gm-Message-State: AOJu0YymCqQi4S+CGJjzhLLu6rBTw/Vq7r1py8L7got2bUzFhozD30If
	wh9Rm58L7IE32RKjIEfFHFVjQfrD/+HG2hPaSrowH6FHA79AyaMxAm1sWSVX0LKgjmuBixovrOg
	5GVl4UVoBVgFE2fYhH2wCfZXzAL6OKhQoXKNgZDLmvxNP4MBvuDjKy3yF7s7MBCE5
X-Gm-Gg: AeBDiesAzItW714qLJgq859W4ehtIcJv2FObBRBSeyu6noHmOAVrDUC/aS+rU0Ip2jf
	ksyRmZc/G5RrZBnajTMx/UIYJHU0Dsh1FaPOWyYOH+0JbG+9fwQU7N77z/5Yd8NyGtKtrXu/2KS
	+WrEkrO5W3o8FrjLo9uXwXKCaeBBBydkuW+Dbni/P77lL08FYOJujKpyEBiL9Olwzmr5enBQ9G2
	BDEfTEeW9d62iMZOy2MgMZIzYOwaufrTdmwWmFWywiahRPfLk1VZwZoZ3tFjN4JsQ0zx5C6exLI
	NndRKNmy7tNUD7UE32KBC/sqYpwqRbNx/aGItMT/xzh4iV2qfId9UedAcz8CLsMGmeGH9nSAP61
	3oZcBFjt5YElH8yjxnvcBkLq1cXIMY8MzzUju1GJq6d1vT15uP37a41IZH2KueUuGB1v0g9+8mr
	hlUpZ5GKpR3X2TOfODWQVNEG2Ajy5Vq0IaMfV/P2PKmc+Gzg==
X-Received: by 2002:a05:6102:4a81:b0:60c:3f9d:6a0d with SMTP id ada2fe7eead31-616f56a5579mr10400768137.8.1776943861521;
        Thu, 23 Apr 2026 04:31:01 -0700 (PDT)
X-Received: by 2002:a05:6102:4a81:b0:60c:3f9d:6a0d with SMTP id ada2fe7eead31-616f56a5579mr10400704137.8.1776943861017;
        Thu, 23 Apr 2026 04:31:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc333sm5221504e87.24.2026.04.23.04.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:31:00 -0700 (PDT)
Date: Thu, 23 Apr 2026 14:30:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
Message-ID: <z5bkivkfvr642qpjujpqzwpozpqeqhs3vsqcpjfbkgipr7csko@fs4hal7fvqnl>
References: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69ea02f6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=xojN2YTdWNvqnkyeGbgA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNCBTYWx0ZWRfXyXCauEyXNUir
 W8dZ95DTOasZRvgN/99vZNHI6g1ZLWc+Fvc4clkCbqojI+aKRKQMMORwoUrbD3uvQO7rvEBEpHs
 JKWQPPN924H38IkJ9658ZEv+mURnQQrtquwZtIvOuSpxp3QSFLvrLN/tmXQDfc9yFYHSmRhmz9J
 ZrP25ytgv5n1+s8U6gGxl00AgZQh3jWpY0bJAy5AAQsjadEvBhjI9SfNO7yO2D6D+KKx7pzM/lg
 63VNeplWyW8qeihGhrqwZLMW42mJ36vfgCwE1ZGDHOnvMbeV8c5tePqy9qQlwNY4NVtp/iVxMUB
 dDLtq3VjnaE1FjsTig4hO5yD6/TET25I4KC82r1BGvBOVTqR8rFVrOlIqL7gDsba1PnhCtZI117
 D8UqdmTeCXcZcYpd9WdrVJRbrCA7+oVC/MuI8FIzFPU6pkO2z/bl3mxFa7k4Xd9VIy8yyh+OmYh
 f9HTn1Iff8utgb6ogiw==
X-Proofpoint-GUID: ej0bxHUnNzUZo-HskPQqmDYvLMVhVqqp
X-Proofpoint-ORIG-GUID: ej0bxHUnNzUZo-HskPQqmDYvLMVhVqqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230114
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35409-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CF5C4514D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 04:55:24PM +0530, Navya Malempati wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> PDC interrupts 122-125 were meant for ibi_i3c wakeup but qcs615 do not

Is this something which changed between SM6150 and QCS615?

> support i3c. GPIOs 39,51,88 and 89 are also connected to different PDC
> pin to support non-ibi wakeup. Update the wakeirq map to reflect same.

Should there be two commits instead of one?

> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

-- 
With best wishes
Dmitry

