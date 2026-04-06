Return-Path: <linux-gpio+bounces-34692-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uRGONxMF02kVdQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34692-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 02:57:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A82C3A0EAC
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 02:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D60AD30048E8
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 00:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F7C1E8826;
	Mon,  6 Apr 2026 00:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejT81dlF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdrKvjp4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61769CA45
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 00:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437072; cv=none; b=dGCGesKG2OtCfc9cEfG1PF0ds+Ch+bPqEfXLeZGJyW5VUN4CBl5lRLmhpgzp3a0MnXokfkNc0a3tzo5Edi/zstbtHilQPZW6K8rwv7ysPh6dffsbTXntMpyGiT+7ehdH5j6ShpgW6o4b/gBglo+yJeQFof5smc8eQGLawRi0mVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437072; c=relaxed/simple;
	bh=+CFzJYSjgXMgc90KnVDGYWpr3RS4ovCzPOIc6R5/1to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB04kN2kj15b8cpqGJEEAmX+4LrE+mBiZWICrT/VT9pI3CquY12Fyak8xehoX67qXjcjhpc3l/6UwNfp0Eo182gX9yHZ46JFk2OfKi6DCb4cdmUsTcg9BAUp6BEjfQ40xxentTHs3EnP2yaq0hIbUODrMC8mVUDoJN55jH4PRys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejT81dlF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdrKvjp4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6352qofU3883661
	for <linux-gpio@vger.kernel.org>; Mon, 6 Apr 2026 00:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Le5cutdB4jQDvLheS8cinLj2
	ayr3F6NZHLdqFQ79kdE=; b=ejT81dlFEK8QRtHAsIYwDgMlrJL9bAIHQcB7Ir4o
	pQ1FVB6WHQALLMRQT4tYzUE3+Ro/s2+zQ1EURNmUajvp9LsO1G3LPpx+zprYzJ1P
	Cear5dgmVz0SJmD+68cwbsE+g55nJ+5KpoWxsjJeMs6mXUiBPwghuoJTIT23cheH
	vbRu3CkQa8Y6DfXjNdLydHkgRdD9Lpu4xEUcGl6y2OAEnsTYLzKY3VkIW/kC6lSU
	6mS+L1bjPvGAPeTRiG9mYIJZ+/jfc5jdXIVBAfoQGhXgIKtCpan9JNn+u4BxuwPr
	lDnqcX+pdrqSE8ONUKzTiKhQcruMfz5cTNg7y4yHq7Musg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd3d4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 00:57:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso46672031cf.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 17:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437070; x=1776041870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Le5cutdB4jQDvLheS8cinLj2ayr3F6NZHLdqFQ79kdE=;
        b=JdrKvjp4PuduihIYbVn72x5m0HKExUWk2SacpPSn5SQg6JhTDxQCKIfAsnqYTLjVwK
         ETTxLQp/OmaQF5+obgADhBqAvqtEUf19wvOuaoWjHD+8v5UdZrqrNUO5Wyk9Q7ZHKeq7
         FJAG3Fcu+c3oN5rzxZfkS4XifnSGySgxnTp9P1UFWqUuUuQdkM7VVL9ESEYEvZ3QwtTI
         21leg0PvOGTCouNgXBP09y6kZ8VVpnUTlfKAsDRKiKPNXzhwD+91jLr8LM7tE7WWOCak
         HmPC7VR2A5BAUA6r8I5ZdJYFgBO2cqmIzM3cCH4y7S2JFm2j7WmS75g1w1bAFrscELC/
         fX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437070; x=1776041870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le5cutdB4jQDvLheS8cinLj2ayr3F6NZHLdqFQ79kdE=;
        b=kCpyNH4+fadCS1rttpDZ0OFXA78hQ2/LfDVoo5tZaLrecXYzQIjCKarqkYsJdNy0cA
         V5oBsY+QRXr45k5UEOpU0uQrQaKsWDTblhcjpAYHgeQ3TXocCH5U8QocXhmKs20lzwti
         i39f4eGEs/vPfLqpRmz74997yCEUo8RGgY2wPjernYKh4yshGenbgL61plbndwE2X08J
         CG4312OI5RJoIL/Bmen0aoZLGsiwZiEzwRXmo0k2/pLbZcDNyiOLgd5vwzg0bjebHGxe
         +J3SbuIda0iEWyia49OA6NWlJNYPgTb6CA4bh5kR/U5ldv1ljO2EhyXMbrwUKF1W67iU
         BtkA==
X-Forwarded-Encrypted: i=1; AJvYcCWx3p+LtItLsMrwoCW8zIpXRAQmA8N+rqlFx/6HoNFUssYSwRwC6qW5BcOlCqeoHcBwA/G7IpmJOGAY@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsvLXZrUEZ7nWySjNVGKuaRCJslPpV9RTuFGuEN5yyy6AxhHu
	hJNCywY1TVH5q25gGeNknqvELDUG8LPgO83HmzO94YLNHgommU3Gp4xytwtiBcZH0XaLHvN4/Lj
	ilsE3Hi+jrZn+OVVPCVlIS5y4iFKg2Ix98gRW6Nr4JNgaEI8LR65ULw9/N3QCi66B
X-Gm-Gg: AeBDietTGX6W1hX6X7YGf5csh+LckXtuU5g+gx2ZgBMYYJjelmDfkEO+C7jmSjOZli1
	lsL/J8jQGwv1gaI4OLZFGSUCcK3cL91HTWkLATQZPR9VDjxovEsXOpOe1XRmWYgaIbXw+VezP+V
	1qYfqFbbCTyHi/R8Ek5O5hEL4+lf4oxZxB5hbi5AZvfeUcRHZhKwQF5XGQRyxLwkaAxO8FyZIgN
	wPwmGq5AbK69kURsp+lJORRGaCEzSCt2jicRzQXx6DfgRzE91SmJuWf3N9DsNgPdhYXk9r9JYK4
	yXuqnSARmph0odIvlAN4ph4Cztk/P2nkz+czbjkRT4D+PLs6PfgjzHIXWioUDj7yHVqQtsSVtmy
	krLQ7Q7zMg74r+ECYdtHe0rtotH0kkwfDCK36OxBPjzYrWO8Xn08yfuZlcxU8U1JUOrLC/cWEe8
	5SJsFxKvlKrkkcRpN6PWw1SGlWWLt0KP2Te9U=
X-Received: by 2002:ac8:7d88:0:b0:50d:6acb:42db with SMTP id d75a77b69052e-50d6acb4a89mr144364271cf.23.1775437069783;
        Sun, 05 Apr 2026 17:57:49 -0700 (PDT)
X-Received: by 2002:ac8:7d88:0:b0:50d:6acb:42db with SMTP id d75a77b69052e-50d6acb4a89mr144364131cf.23.1775437069312;
        Sun, 05 Apr 2026 17:57:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc8e0sm3095275e87.58.2026.04.05.17.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 17:57:46 -0700 (PDT)
Date: Mon, 6 Apr 2026 03:57:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
Message-ID: <uit6oystisslmbr2xo5yeofzdfcxicobiuvwnyymd26rfmhynr@ec3jjmjay74a>
References: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xNmn1K6o2ZhzsB3azARGbUOloJDY4bsP
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d3050e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Dz0YDFsVkC082G2yLhEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwNyBTYWx0ZWRfX7aMr25T1j57F
 rEOGf0aOUpwlEA9uQ4+wOisCzqcHB4HUWwjI/rib3xUCS11UnuhjcKSHOVw2P0nD94NKV9SRZYX
 aPFjzzOvP/qVe/g/TXFKecrqN+7ADnSyLq6thb5uV1NTNwreFx7OfjHEqLLBvUkVQg7SbKsWpG1
 ysUr218ZgoIv6eoYdpZyCinuiCqX3uUiEn2xkjDjUUAY/BIHoIfjstrsrsgTw8jZleT40+kWrkX
 hja+MaQ3hhE74uMhkIFwl/NTPzDASlYDL4dpsQGGTSsusQKneU12eege/lTuEq5G+SDH2avOoyt
 8avnZ1DTpvA54uzjqwLGQ4eXV8iUS5N2rL+sOYMfKkKWUNSUV2i9RkJ1kPfLcttHieRED1cDCqS
 O1UCf5V/faZ+0ekHPEngeirfTqq8jiAGWsHnsC6ZWFr/jihGqKhucUjfl6irOnegfCzhwjEa5p4
 pBiHVyRuNoBNXv04VYQ==
X-Proofpoint-GUID: xNmn1K6o2ZhzsB3azARGbUOloJDY4bsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060007
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34692-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A82C3A0EAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 12:04:04AM +0530, Maulik Shah wrote:
> Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
> platforms they are unused.
> 
> No functional impact.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-eliza.c   | 25 -------------------------
>  drivers/pinctrl/qcom/pinctrl-qcm2290.c | 24 ------------------------
>  drivers/pinctrl/qcom/pinctrl-qdu1000.c |  6 ------
>  drivers/pinctrl/qcom/pinctrl-sm4450.c  |  7 -------
>  4 files changed, 62 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

