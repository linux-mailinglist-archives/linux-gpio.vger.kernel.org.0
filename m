Return-Path: <linux-gpio+bounces-33305-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Nd+AWZzs2kQWgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33305-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 03:16:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 992D827C9D3
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 03:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76467318DE85
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 02:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6EE31E847;
	Fri, 13 Mar 2026 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtoHtrl8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbRPW1iz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB5D33D6CA
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367907; cv=none; b=lzzusV6vXyos5hYXBEKmX7DtGP48R+m7B73wSpZbz+3jjDE1FP0gOEYTfzQ+kKTEJX2pL7pA9vbznUzaGwGTgm+4OQhu8GHA+xIgqONtTKv8IL+kb4nb8shFC2LPi8XFKedVtsqjGJ2xskJaAuEGzYo/BCCjsZ/en9rxaQ0TLqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367907; c=relaxed/simple;
	bh=iEHWAOMWK9NBZlmVkzkSZR2rVMRLUZHQpZHVOg5mmwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewt8BG5Wm1FJEJDxAmFu2uYkwEDqwttHyTXPyQDe/hPmtMvX73zn7ToSFWd6T8cihgJr/wUDOkh/hNDPEuLu6iBTGNtmV9+QdXcv9HpAuuyeE6z8yyRaPcS9SGxaeeOdVsC1KXarjmTOT0D3tVy1i6/selmPD39qEzGZXW2MMSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtoHtrl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbRPW1iz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CMK3M13285337
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z8nQMK/dyX/NcjJbrlQ377Lv
	LK9n7wIl6HwnSAm5xgg=; b=jtoHtrl8plFtSfni9vWe48+HdC9NYBxh3bJ5jblT
	1XbNfJg8niVlsX2hdPV5ZcRYwBN3cqVoVr2Q6p7Nw9M9U9brVSk+eap0wNUGvqAU
	TRoidlBW8PVk2VJK0ZHSfNpbNfy76gnQebtNze7AMNUOWhEjcToL/1sph+Snt8g3
	vvQ08ohgHwKJYD6HflVtBVUto72+giBJ2VZPUDEvylw3etRDClkpgMEGFbOzo1QH
	dSVx1kEZ64xUbggvDBWrs8p3+UM7eOPv50lifmfdlV0qFpIJOLI5/cOuToE3LWh9
	p+ldJgoUNSwd2AsuwBFa+UwQ7WwT+ClqNvp5LqWMZunp4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w4545-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:11:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937c5b742so67416081cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 19:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773367904; x=1773972704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8nQMK/dyX/NcjJbrlQ377LvLK9n7wIl6HwnSAm5xgg=;
        b=SbRPW1izwaPnX/ja5Jq+Gl8tTOItLElICkHYIB6jCIGu9Ko53UPSji8oalocta1MEZ
         FASkw4IvwvOw4u1EaaV3NQPvNuKPHt4Enk28FaN2Wj2gTVAIsNzXad1bC9gT0mvLttkF
         k2mq502Y69iflIGIHYrEAMPwtNq3G6rZcWLSpXdK2xt1Zg5ThhNjSBaiQf8BkBS6unXT
         ObvzrWz1xF8a0I08ogg/xvB+OEX1nxhUNsjCJPamYCS11TbnJ/WzRPIwQzbTBikKIak3
         z7t1R0Lpy+T/gz/OKsVmPzP26nDZb/g49HCNpI6/vZ0Xjy3Z/oEXUm34I5mMHOz/e3GD
         k7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773367904; x=1773972704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8nQMK/dyX/NcjJbrlQ377LvLK9n7wIl6HwnSAm5xgg=;
        b=PWXw9aaKQk45yg5Z3fXZLp8s0+CpIKkKOEC528zJuEm6mHjJuECjv4+dV91pKvz/M4
         nM+tprECckACtV3GyaVhw3c6vF8IpF5uS8wenk7N0D0vChxljkN0H0l2gJZdYmKMgtrW
         c0DqKM134y8sOHv4F3u1ewcGo43dOFFa2YbClxTfSKvslnhJXaFyo2aMGI3ijxRiu1o4
         Ea7ZHcjy0q5IOzwEyTBCoJMq0H1Om3tJoKcmeMchrTQE0QZDSusUt4xzC5Eoxyxuuzb0
         yo1dzlgufmFx0paC5NwPV+GijAeNPieKSeHaAQn9NI3z6W2zedy0Eq+tXMjfGFcplc+j
         YxXw==
X-Forwarded-Encrypted: i=1; AJvYcCUydiTuvaW90Eqd7KHDa2AtYacrw2BdMilWKFsjShXVMTFt8maxj/04IBUiCINCWvrkPp843dckPQlG@vger.kernel.org
X-Gm-Message-State: AOJu0YxFcPdTxvzUXZWrkKNwa/5e582OZSKDfc3XGo9EAqqmuj1e4/Ri
	tTOuVlPdLiHN1QroTsPhvsX+w8w9rg6bYFOP1oKekCo23kzH3Z+bmfuKwP6rVWYfLesJzKGYXns
	zIAq1GIDbTzeQ4E1i/NapNiKTK2kdm3CwHrSOeAte8LpfIrN+qeCSRdNX7gbQfCet
X-Gm-Gg: ATEYQzy4m1pcXZ8lTUhZ8FcPUXIlVB6Fm/3Pefv/6HYi6gNpwlbRm2CGpIs6Ei6SP+M
	xL6YJ5yoPPvzO+4iHqCXfKy4CZxxhYam2yxMtoRl/NuXtu3AJJPEZ4PPx4RD3B+608HxZLE0ynR
	x1slDdKHCWlGS2bhmsnB6v7AWQ7NtKWMLcYcnmm3DktI5S94N6PRsu94YqPOVCNQa9VuydFcmmb
	9uciNzPp96cwq5I25QpyOvp30WLY3lvZtyG2demBxf6ykpMwkzifLLtDQCe5yTPUq+hyy8pdThf
	THuigcO3mvahI7HCqzIq/BrWpz0OLTg6dXMD3apA2D0F4ooKRYYJfC1Csaz0FjqouYAHb+w0/yy
	hrOzO8BvQ8VUJDafNikz2dDYjVvOMZ92Gy7DnXynYpwxeZ+qSXvuBY/tJ5CbT4NvhQGFBEpbl1m
	8cSXb3/ygkn5qvPNobGZIX9mpvZFFBUuf0B1k=
X-Received: by 2002:a05:620a:2549:b0:8cd:98c1:763f with SMTP id af79cd13be357-8cdb5a4abfdmr257099985a.11.1773367904030;
        Thu, 12 Mar 2026 19:11:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:8cd:98c1:763f with SMTP id af79cd13be357-8cdb5a4abfdmr257097885a.11.1773367903551;
        Thu, 12 Mar 2026 19:11:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162c12sm1222960e87.52.2026.03.12.19.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:11:42 -0700 (PDT)
Date: Fri, 13 Mar 2026 04:11:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
Message-ID: <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
X-Proofpoint-GUID: _4T9WOQTg1hYFJcjTd3LdtaCGoKJc1qH
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b37261 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=buI6ytlUu26sYBdjsKoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _4T9WOQTg1hYFJcjTd3LdtaCGoKJc1qH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAxNiBTYWx0ZWRfXxlBA188avxvj
 mvZmHkwGhFGdl+wuorlvnnKuB4RISC9otChh65kd0rmEEj99llaTyM0kk3cS3ZXPjDFE5TNcyHD
 MqzoB2Ld2O/kEL5N7CCS7Ol5OXPF6ApHPo8SZwDc5lpBBBntM6+KghUOiIksYdlGvZLxYPDJkkR
 gP6Sz2jhh/64xYo6ablFXh/CLb+oiMQDJJ0u86CeuxIEFS7gmX78nDulznmtM8gmvIi0DDr9817
 McE+QJlZNViudUNjiSkT0iqTafzB/btcgiwMZ9bP4rAENfgltNTQKXlBF8kuvtiOZUO83ItmuLl
 eI/FT3xaEnoE1LIM8EvJbcXQ+Mt3P9vz/SgKPCivcbEqVedzVBiZnZxBYVJ6mV2dFNUjlvb4QuW
 Dh1JvdRUEboQpEWcJpfRBwLtpCD0ojl1rdOuXPFYyUK8MqEjK0PRoB22lc+OOcdRtYybIK75m3d
 84Fwa14bPBCyX76Nfaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130016
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33305-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 992D827C9D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
> Interconnect from SCM device are optional and were added to get
> additional performance benefit. These nodes however delays the
> SCM firmware device probe due to dependency on interconnect and
> results in NULL pointer dereference for the users of SCM device
> driver APIs, such as PDC driver.

This sounds like a bug in the PDC driver. It should reject being probed
before SCM is available.

> 
> Remove them from the scm device to unblock the user.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index d7596ccf63b90a8a002ad6e77c0fb2c1b32ec9c8..ebecf43e0d462c431540257e299e3ace054901fd 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -308,8 +308,7 @@ eud_in: endpoint {
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-x1e80100", "qcom,scm";
> -			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> -					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			/* TODO: add interconnects */

Somebody will try to fix this TODO, reverting this patch. Let's find a
better way to handle it (which would also fit other platforms).
Originaly this was proposed by Sibi ([1]) to speed up PAS
authentication. Other platforms require RPM or GCC clocks to let the
firmware access crypto core.

One of the (stupid) ideas would be to add a separate SCM (child?) device
which would be used for crypto-related SCM calls. I'd like to point out
that currently we bump those clocks or NoC bandwidth, but at the same
time we don't vote on the CX rail. I'm not sure of the firmware handles
that somehow or not.

[1] https://lore.kernel.org/all/1653289258-17699-1-git-send-email-quic_sibis@quicinc.com/

>  			qcom,dload-mode = <&tcsr 0x19000>;
>  		};
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

