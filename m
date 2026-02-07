Return-Path: <linux-gpio+bounces-31499-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHPiMD8Bh2ltSwQAu9opvQ
	(envelope-from <linux-gpio+bounces-31499-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 10:09:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E5110547E
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 10:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C600301E975
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Feb 2026 09:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C7C3033FF;
	Sat,  7 Feb 2026 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLW+1UiE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBnahU14"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE107DA66
	for <linux-gpio@vger.kernel.org>; Sat,  7 Feb 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770455353; cv=none; b=DVheAE55Tm8ibhvVVbLfGf3zjlF8KlgxKH7XneS+WibWbXDa49WU1o7Pp2gxnyI474vFRn3IxZBn8OXMmje/UDpBjdo3b9q/RstF3ILi9+UKkG57DyNz6JsM3YSo0KeAB3KAAXFfYULSA9SsYtAUqkg91t9ykph48XL4IOBnPG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770455353; c=relaxed/simple;
	bh=/Q0De9mLDPa8YKtGWTTYvyBpC4eza9AMSOw35buO/K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzdG0i/XkibDNy6r50EtWLGre0i6Guy2YGVbpOQHwlxusUe2AGfvUZ9g55h/cDAwjuI96iNs++LVNEwCP1JGgCGE3s56/VQ/73tMf14yIrVUIYuZ9puJzyDwfE2aJRLqZeAQxqU3mJwVkZszo6oq6T8RQOxqGR4p0EKu3R442hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLW+1UiE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBnahU14; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174QhOJ922206
	for <linux-gpio@vger.kernel.org>; Sat, 7 Feb 2026 09:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wKl1UJTA9PkCdgtMISsIvfb7
	RdXoHgYLCJ8J6Lj2IMM=; b=jLW+1UiEqLrQtP04viQnA0hcJiZOH/F81El8hWzj
	v9UB0Hj0ngmIvz3/BR4QTZpE+dRAZFN557S9gzMm3Z+7Cad2OmuTW1LVN+HgHy4p
	ZRpz/5CnlULKXMjZi2HfLAKKI+Yqj7Bnf/Qkt2lxyh8YZaNjszQ2mDHzJ9VPpqNk
	eN57JUOT0dn8tCp557iVHhU65OC0XdpfiRw5nhXfJpCfI3SDWDjV1HWuzh9+jlK8
	skGGbvtRRyAAmIfkNvpAi/Sk/nXNopoo/kw+zUYyOY4pw49mKFQ2RMnePfArCt3X
	CDoc+G02QyDAhV0CDEQFOVoES7ez3bq07KK/Ev9Dp6l8eA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xccrddu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 07 Feb 2026 09:09:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50355952ac2so77250261cf.0
        for <linux-gpio@vger.kernel.org>; Sat, 07 Feb 2026 01:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770455352; x=1771060152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKl1UJTA9PkCdgtMISsIvfb7RdXoHgYLCJ8J6Lj2IMM=;
        b=FBnahU14dOaf86hC0vZs8pn5EcWnRPauhnVNloN5J0dysoeBB+jWJQQtVkeDv4fUO+
         1P5Orj089gQqR+BZnPKdTBxjsvFCgktpb1IHMnRnl2xDZS2PT3yMvCulRcxoGd9993xn
         quzayDYn9TmkX2BMxiJCmFqIcxZRr+/k1uoDLAQduNyodcxYDd+h0v1zp1Bohiy0cHMb
         Ch9kXw2Zyyj/7mPr56TfrDPM00QATZXus/tr3QbcQ4arpI6vY+mfKDlUDtX4r2AgqMk7
         I/TEH5ES59OJTqFZ2ZtpBqLrIk22OAvoAlpgjM+lK9lI265xgVvwEfKekEopndZYYuvf
         boDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770455352; x=1771060152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKl1UJTA9PkCdgtMISsIvfb7RdXoHgYLCJ8J6Lj2IMM=;
        b=FB14lLqUUEXz7opiXATOXjGA+7G4W8wahwiip1q2EjX5xu2kl/aQ0gKjnuhYYPKlNV
         GDcf4GQgcCqrtey7+4TZMTShgCt8aZSMG9C6fTgHBageUQMay/Wt16SP+daIojMM8nRc
         fHFB9y1V5N3ZnyXav/WjwtEEl8/GliEfjyIw/tve+3L2M/9JEyw8Y2ZmOhNPa4VY0X5F
         a3+wvkKPKWDGYk2LXT/E6Zl3loC4D7/YYhASEnqOhODiyLW8lAF8AvEr9Q0Ykily+uUB
         Fpjc3UBkb1khQAKKg63pM5oQQlau7cGKgJQl3sHaM/RHePBv6P8ob4pRol7yQsCDy97G
         FkYA==
X-Forwarded-Encrypted: i=1; AJvYcCV59nSAQm4vNMIBrWYVluXdmAtoIqJhip32BUi4pv0xaVpIeGJ4t91pQuqR57055cQL4wCjLLqq3Cnk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2UEEByzwZedpqnVJO7wmCFSFOoPsKWrONeoDtHhhAcJt8HDR
	DRlIqLB66/wQ9WjK5JPJz9xyTxzTzybeQld38J9zX73BCfNkwszXwnPsUjOJDQHbBylUbotMXzL
	14/25xpZAXcvvjt2JK9dO6TWRBU1P8pMXBpITeVrrV0R/nY/5ssuy6QGg5nN0abbz
X-Gm-Gg: AZuq6aJaVsfSo5AevCJLXMjr8hu3eWeDEckCeOevURJ1Ukl4CEFHx2UsTX72twFLSE5
	5ZDeAAqh3hM8qKEGmSs4k5RRB48WoQJZxkizoBCUNjr0hhEXshh1AUinhJFRlHAXtpxrqVCnJsC
	EIHfzlZgyfVMhgbCtCSQzo+TpNZmxY2xO9xm+o8iNIRs7nQuchQoo3YaOy7W92shOUUTDj+Wcsk
	ZQwoIDt5RPFpMhqU9R/dQkGiGIttPvl5m82q//KYmRklyXvqicE9n/Tt5vEuGCXWNCPZyAz6WQG
	Kc3aKKFdhUQZePRUN/grCS7VV66bqrn9U7s8M5YkCmwVmVVwMrZR6lf426iqyyP9wOZSauUlOpF
	hJtodiBxvwTEKNTKSkogP/KovsMMHEUuSgYZ8/wTrDGY+scfQOO4Ip3g2luSMyCZceSAYI9rZPl
	ozqQWjVesGSZE+UBfiF/gjvJU=
X-Received: by 2002:a05:622a:134c:b0:502:a218:1cf with SMTP id d75a77b69052e-5063927d1dbmr71949591cf.4.1770455351838;
        Sat, 07 Feb 2026 01:09:11 -0800 (PST)
X-Received: by 2002:a05:622a:134c:b0:502:a218:1cf with SMTP id d75a77b69052e-5063927d1dbmr71949391cf.4.1770455351341;
        Sat, 07 Feb 2026 01:09:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cfe00fsm1198900e87.32.2026.02.07.01.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:09:10 -0800 (PST)
Date: Sat, 7 Feb 2026 11:09:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
Message-ID: <k2t4jm6vqkrp46reo3nhr4e5awthm4gu2crow3hnl254p33ywo@pbbdhtdq5ag7>
References: <20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MSBTYWx0ZWRfX5y7ILpEL7yYl
 6rjL5C+fDXwQGwDhKgn9Uo7Bb8OCkC8jukRKX9e6NmD/dt3ojJiH23hJZwab4MkLqvl90BP04bz
 k2qYyTzLnHpjCJI2eGcKs1KsCe+TiAKOEAX6zj77V3fVoi0AATMzG4b02E8JCtVzBYjnJXier6/
 PDtU9piHCMI/Z6ExsL76YYh+59e1mJWkg8eor7AU7gwJlfMYHcC7zgkEW4FNRVQgpSY+LbYUvLY
 dZBMfmSSZVitAl9CWpy+fSc00Uqj1ekm2tVUcDFc6RsZEc2YMxSt6PytUTYPH2jLcQ1sayD8WH9
 I3D1TgN63uLe2UG6GQgC0Uk6Syh8ZU246o+h8Y4tHPxPopbFnF9vPoPeuKXGSeQuSIo/Epxnf6g
 wfsaMVUWniHGd+J3Oj0pxFe2q3j2/mQ0eVVGA31gMwpT0xy99Y/SttZFj6p8bCSsH1/539XinVy
 GCq4719qaugFqXEaLlw==
X-Proofpoint-GUID: 3YbYL73tQzRbj80_FR31pVzAYGvaOEgJ
X-Authority-Analysis: v=2.4 cv=ft/RpV4f c=1 sm=1 tr=0 ts=69870138 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Csa7zoAcJ9EAlDMVfGAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 3YbYL73tQzRbj80_FR31pVzAYGvaOEgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070071
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-31499-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71E5110547E
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 01:03:30PM +0530, Maulik Shah wrote:
> Configuring GPIO IRQ as dual edge breaks as the wakeirq_dual_edge_errata is
> not set. Add missing wakeirq_dual_edge_errata flag.

It breaks because HW doesn't support it, not because the flag is not
set.

> 
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-qcs615.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
> index 4dfa820d4e77ce8157a3503ee8ec6e426b54e030..f1c827ddbfbfa59d03ddea560eca36ffa997aa8d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
> +++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
> @@ -1067,6 +1067,7 @@ static const struct msm_pinctrl_soc_data qcs615_tlmm = {
>  	.ntiles = ARRAY_SIZE(qcs615_tiles),
>  	.wakeirq_map = qcs615_pdc_map,
>  	.nwakeirq_map = ARRAY_SIZE(qcs615_pdc_map),
> +	.wakeirq_dual_edge_errata = true,
>  };
>  
>  static const struct of_device_id qcs615_tlmm_of_match[] = {
> 
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260207-qcs615_gpio-7b76c94f6921
> 
> Best regards,
> -- 
> Maulik Shah <maulik.shah@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

