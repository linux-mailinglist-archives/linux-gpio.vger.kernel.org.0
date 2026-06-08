Return-Path: <linux-gpio+bounces-38061-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NkSxKss3JmpVTgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38061-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 05:32:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400465270F
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 05:32:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eKDb8Y2f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ei03D+QJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38061-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38061-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59640301DCE7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 03:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055B934CFC2;
	Mon,  8 Jun 2026 03:31:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719413128BE
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 03:31:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889512; cv=none; b=ZwBzBC/eqgUKqnuYj3Y0qrtA1Z7usjohzxnvwNIdpKoZOBWj6mkQyIlXcGb2fK+k1/4tYuq7le7pGtSYoAqX4LQibeQAIDgber7HAi+jRWJQ3R++WrrHRkHRCSah4oWWNyaO8AxZbAT/gCr4b3ygv4JzB2sRDWmosHb1YfMoCTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889512; c=relaxed/simple;
	bh=Ex1YHWZKMyUft7zTCR7zLPd9VoFEJ63ktGqW7Jr7bSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWZRsw1s9vxFhUycVsXrwA8IQJvbS8GC2OJJQ3oNNtGU2v9lTARM2j4GoaoDLiOpaLC1Z+aAeYsgwW0sHtmBLm4kN30mCIgzqZC9FpyRCaq5HuCGeZrNe2hNCq61YOK2pvCbSIN+ced84QBFoT4v6MWFW7Hw7J+H0T9yFbWpFWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKDb8Y2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ei03D+QJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EVGS1575805
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 03:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PCJKeL7rA6qvumeb+wWZ0PNY
	7hqL5jSNvC0EZReuFiU=; b=eKDb8Y2fQGPWRB70mwEDKUMKRKcbbUU6ZGjlnObH
	RFF7CapCSEE9TJZQr+oVemFkQyoMjJxsaFLVBfISccl7JXl7PdCsSWk7Vp+6Njrj
	TVQ2jjHhX16eo99YI2YewGiI45YlIb4zNCIMvlBzo/D3M5+19zmuyVypMlL0wjlF
	JZhliGO2FWNJqKATroK0spXYDPAIlaURx200lRKunIz2sILc/w8X6iNJ9F+wDLfQ
	sErXHJr9GpHhIgncQ4siKQB2bUt4PXKBCwwYaaUwUmD5LzxVgT/+zOIeTRSK4ALW
	rWzoFFXo1ZFQJYI1AStoc8vJl9Mjik60/DFRVofVBgMoCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1dgba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 03:31:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517582695d7so91828521cf.0
        for <linux-gpio@vger.kernel.org>; Sun, 07 Jun 2026 20:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780889509; x=1781494309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PCJKeL7rA6qvumeb+wWZ0PNY7hqL5jSNvC0EZReuFiU=;
        b=Ei03D+QJ98DqWnOh1u9crx87n/YcZorOJmhC/5go7UyvcGeIzUN8CPDMRCWNqLKZhK
         DheIssabLYp+L0636KSZGtCRkckki3Kus40YmcFmp5e1tp4U7YM/yn7QCR2iTaf6lPWP
         hGNsKahK0MzWoBn5uR9IADsXlghhvY6wCJhITQJHs7RExzV6K1/gm7tIAuLKTu1Q9GAz
         qXUqu+rrSWhxMehq86PjbSXhbFW2yVqbC5GsQrVVY/NTgt7SfsvJKBLsE4REmsHj2xy1
         nQicujKGntBrJ0T8Uy+w5L5SOVoPGIG3FAUVSQwussksHBNyjyzPlsDhURFElmaQuH6k
         OBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889509; x=1781494309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCJKeL7rA6qvumeb+wWZ0PNY7hqL5jSNvC0EZReuFiU=;
        b=F+fXuZIYel/72VzVMcRx7yd9Sj6ymVIJX0F7TwGztfJPvhhfSXxnB0fTqC56boa/IO
         vss4ReZavwABrZjD4lWFMl8UIdqtsLp1WMEu2+f2GJ1C2z19cIeCQOPdGg5UJ06dyW0+
         /0cbyjbkoVXzVTCdd+WD5/Bncnjv+ny2Iq5NjBtGfkPE75U1CE9EdEbJgrqQpi/PCSWx
         aJ0/XQ+pNkcdqbizg4r0FgtUF7vm+qztVpqDNasNr1f8MdhrlhhaRmzemV1vmJito7q1
         meCo6rX+85ElGHtFJKSShqUF0+wPVA0dzWxPmnioFstCPDANMhophueXI/NKDsdVVWb5
         djnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8V9Rz6eBCv4BJjyprzXLZuLPgcpWypmKEEO5NpyFjEv30pb4o1ANFr5+wXOHbKK5hN0MhjPznTXkpC@vger.kernel.org
X-Gm-Message-State: AOJu0YxI7LsMUtAJFXxqZt+WWe1EFFbfur+47pBs1gNrzI0bCn4Jdml9
	gYFcxFAP9M+2pbbnisyYFeJQV3RX+uXcpUtd7wO48mxOHRCktDGdjcCFAYGhe7OoYJadRD78qYd
	BVTQx2n2SSeNXYZKuOju7YtnXPYbm6wYkPjQfZBjqJ2BwFk8L6BUc5rDhjPqmkbL3
X-Gm-Gg: Acq92OE2yb4Q4n7a30JL9VR4/5CeVP5qe98jjuFlN9BxYBtWZ5LK/IxtvhH2bmXL+mT
	9H6MPHLFZ2oko/KeH2jl9o+Sr62LwXCWeL2SXDlPuqlkn6sBVQN+aZesejnKKi6Z8lv6YjCgIud
	xaCkpib9fOn3+xxYKgHKGWgJgVeR/A6NWKv7C5Rgloq5ojSJdqrMe2oTW7NeFfSrYQTjIY6lZzo
	bsxQ5KTrStgzXhUoSyU97aWNZr6C0k3n4CUB9ajuJh2sgDAIic1PMWh5U4XFo2+p3Sa0i/eA9Bo
	RNVXVg05Tykxy2p/0FglI2/OVKn3wedRltVserWXS5wN69iHnOod0Gpp7cmoOs3+VRq0h07sB35
	0uOFCgOcAaROelLFxn9WalrHV04tTuGuhYT8tUyE0lQ5bBgNJpSftecixSolRXh3LxTxvTy3CQP
	0by+8U3sKgvpc1SqIGdNytt27m9xKwTwwBaxWi3HDNPVJa6A==
X-Received: by 2002:a05:622a:8cf:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-51798825e05mr131738021cf.31.1780889508649;
        Sun, 07 Jun 2026 20:31:48 -0700 (PDT)
X-Received: by 2002:a05:622a:8cf:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-51798825e05mr131737741cf.31.1780889508109;
        Sun, 07 Jun 2026 20:31:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac091b23sm43291931fa.17.2026.06.07.20.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:31:46 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:31:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: Add a driver for PDM GP_MN fractional
 clock divider
Message-ID: <h7ai3qajk4yq2jgvy6etqpchxuxo56sxtvcgvh7xhodw6jkias@ayn2thdck4ct>
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-2-1522662b6c53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-2-1522662b6c53@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyOCBTYWx0ZWRfX++jr/VU4JCqq
 0YaJhKXmwiGTzpuRq7e5vB9ujYP7Qv703z6+ozSGQgo52Lxrs9MaQPQav2lWpkX/T6ZTV5B7+KG
 leCYW+FoYE6pvtUsRYiAQrh2GHtGI574dDUv+rLE9kqgthFeDk19Ep8hAPgiVwX9Xj5Bih9kKsY
 FGYUrZPLUfIuKJZWinAKP+7f4q6UCnmlsXWYodUGtnEW/1n4K2+r30xmSnkCPTCHpKL0BBY1T7G
 BaoIcRhQgN2PtOp0UtZw7cZu0tI8W6ErKW/+YjuzAaz992CMrrDK6k6IMNfHKft+n6wRE4QQ6bm
 ZA9CQM3lCtkcma3wE1wmzn/UBKTPxwsj9ad4b0f37RmgUn+vWNHe0A+e7SorpJD6dtQFLSIzuFz
 tfWegzpEJfnmSn8eIz2MWVRtjC6JZOjHFsM4MI4CLJUJ9jL+tcWnbkT/llmUgFm55+xuqgpceJO
 wPk9Ato5I2ToorkFQMQ==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2637a5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LUSPxPFnT4N6VsWNMmAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0ntm-dnHz0tumbV6MAwiP8BN5W0LUeNL
X-Proofpoint-GUID: 0ntm-dnHz0tumbV6MAwiP8BN5W0LUeNL
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38061-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,redhat.com,gmail.com,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ayn2thdck4ct:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0400465270F

On Tue, Jun 02, 2026 at 08:51:50PM +0530, Taniya Das wrote:
> The PDM (Pulse Density Modulation) hardware block on Qualcomm SoCs
> contains a GP_MN clock divider that produces a fractional output
> frequency from a fixed input clock (typically TCXO4):
> 
>   Fout = Fin * (M / N)
> 
> The hardware encodes the period in the NDIV register as the 1's
> complement of (N - M), and controls the duty cycle via a separate
> DUTY register that counts the number of low-phase native clock
> cycles over the period N.
> 
> Add a standalone platform driver for this block that uses
> rational_best_approximation() to find the closest M/N pair within
> the 9-bit M and 13-bit N hardware limits, programs the MDIV, NDIV,
> and DUTY registers via regmap, and implements the full clk_ops
> surface including determine_rate, set_rate, recalc_rate,
> get_duty_cycle, and set_duty_cycle. The PDM AHB bus clock is gated
> around every register access.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |  15 ++
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/clk-gp-mnd.c | 333 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 349 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index d9cff5b0281d8cc373b8ab14683370cb9b7f8bf3..df27aa10243435a20a57cca3ed4644284630d11e 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1759,4 +1759,19 @@ config SM_VIDEOCC_8450
>  	  SM8450 or SM8475 devices.
>  	  Say Y if you want to support video devices and functionality such as
>  	  video encode/decode.
> +
> +config QCOM_CLK_GP_MND
> +	tristate "Qualcomm PDM GP_MN clock divider"
> +	depends on ARM64 || COMPILE_TEST
> +	help
> +	  Support for the Qualcomm PDM GP_MN clock divider found in PDM
> +	  (Pulse Density Modulation) hardware blocks.
> +	  Given an input clock of frequency Fin (TCXO4), the output
> +	  frequency is Fout = Fin * (M / N).  For every N input cycles
> +	  the divider produces M output cycles.  D controls the duty
> +	  cycle: it is the number of native clock cycles in which the
> +	  GP_MN output is low, counted over 8192 native clock cycles.
> +
> +	  Say Y or M if you want to support GP_MN-based frequency and
> +	  duty-cycle configuration on Qualcomm SoCs.
>  endif
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index e100cfd6a52de9f88f11720d9c2043db5e553618..438f59b25c009ee72308fe41707d6efff6613690 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -207,6 +207,7 @@ obj-$(CONFIG_SM_VIDEOCC_8550) += videocc-sm8550.o
>  obj-$(CONFIG_SM_VIDEOCC_8750) += videocc-sm8750.o
>  obj-$(CONFIG_SM_VIDEOCC_MILOS) += videocc-milos.o
>  obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
> +obj-$(CONFIG_QCOM_CLK_GP_MND) += clk-gp-mnd.o
>  obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
>  obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
>  obj-$(CONFIG_KRAITCC) += krait-cc.o
> diff --git a/drivers/clk/qcom/clk-gp-mnd.c b/drivers/clk/qcom/clk-gp-mnd.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..826b6b62ddc7b272511accde1ca0e885018a8064
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-gp-mnd.c
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/rational.h>
> +#include <linux/regmap.h>
> +
> +/*
> + * PDM GP_MND clock divider register offsets.
> + *
> + * The hardware computes:
> + *   Fout = Fin * (M / N)
> + *
> + * with duty cycle controlled by D, where M < D < (N - M).
> + *
> + * Register encoding:
> + *   MDIV  = M
> + *   NDIV  = ~(N - M)  [1's complement of (N - M), masked to N_REG_WIDTH bits]
> + *   DUTY  = D
> + */
> +#define GP_MND_MDIV_REG		0x0
> +#define GP_MND_NDIV_REG		0x4
> +#define GP_MND_DUTY_REG		0x8
> +
> +#define GP_MND_M_WIDTH		9
> +#define GP_MND_N_WIDTH		13
> +
> +#define GP_MND_MAX_M		GENMASK(GP_MND_M_WIDTH - 1, 0)
> +#define GP_MND_MAX_N		GENMASK(GP_MND_N_WIDTH - 1, 0)
> +
> +/**
> + * struct clk_gp_mnd - GP_MND fractional clock divider
> + * @pdm_ahb_clk:	AHB bus clock required for register access
> + * @regmap:		register map for the PDM block
> + * @hw:			handle between common and hardware-specific interfaces
> + * @m_val:		M value (numerator)
> + * @n_val:		N value (period)
> + */
> +struct clk_gp_mnd {
> +	struct clk		*pdm_ahb_clk;
> +	struct regmap		*regmap;
> +	struct clk_hw		hw;
> +	unsigned int		m_val;
> +	unsigned int		n_val;
> +};
> +
> +#define to_clk_gp_mnd(_hw) container_of(_hw, struct clk_gp_mnd, hw)
> +
> +static int gp_mnd_clk_determine_rate(struct clk_hw *hw,
> +				     struct clk_rate_request *req)
> +{
> +	unsigned long m = 0, n = 0;
> +
> +	rational_best_approximation(req->rate, req->best_parent_rate,
> +				    (unsigned long)GP_MND_MAX_M,
> +				    (unsigned long)GP_MND_MAX_N,
> +				    &m, &n);
> +
> +	if (!m || !n)
> +		return -EINVAL;
> +
> +	/* N = 2M + 1 leaves no valid D satisfying M < D < (N - M) */
> +	if (n == 2 * m + 1)
> +		return -EINVAL;
> +
> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate * m, n);
> +
> +	return 0;
> +}
> +
> +static int gp_mnd_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +		unsigned long parent_rate)
> +{
> +	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
> +	unsigned long m = 0, n = 0;
> +	unsigned int d_val, n_val;
> +	int ret;
> +
> +	rational_best_approximation(rate, parent_rate,
> +				    (unsigned long)GP_MND_MAX_M,
> +				    (unsigned long)GP_MND_MAX_N,
> +				    &m, &n);
> +
> +	if (!m || !n)
> +		return -EINVAL;
> +
> +	/*
> +	 * When N = 2M + 1 the valid D range [M+1, M] is empty; no duty
> +	 * cycle can satisfy M < D < (N - M).  Reject before touching hw.
> +	 */
> +	if (n == 2 * m + 1)
> +		return -EINVAL;
> +
> +	ret = clk_prepare_enable(gp->pdm_ahb_clk);

Can we use CLK_OPS_PARENT_ENABLE or pm_clk instead? Having to manually
toggle the clock looks like a coomplete overkill.

> +	if (ret)
> +		return ret;
> +
> +
> +	ret = of_property_read_string_index(dev->of_node,
> +					    "clock-output-names", 0,
> +					    &init.name);

Do we need it? Can we generate the name instead?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "missing clock-output-names\n");
> +
> +	gp->hw.init = &init;
> +
> +	pin = devm_pinctrl_get(dev);
> +	if (IS_ERR(pin))
> +		return dev_err_probe(dev, PTR_ERR(pin), "missing pinctrl device\n");
> +
> +	pin_default_state = pinctrl_lookup_state(pin, "active");
> +	if (IS_ERR(pin_default_state))
> +		return dev_err_probe(dev, PTR_ERR(pin_default_state),
> +				     "missing pinctrl default state\n");

Isn't it done by default for you?

> +
> +	ret = pinctrl_select_state(pin, pin_default_state);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to select pinctrl default state\n");
> +
> +	ret = devm_clk_hw_register(dev, &gp->hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register gp_mnd clock\n");
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &gp->hw);
> +}
> +
> +static const struct of_device_id clk_gp_mnd_match_table[] = {
> +	{ .compatible = "qcom,clk-gp-mnd" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, clk_gp_mnd_match_table);
> +
> +static struct platform_driver clk_gp_mnd_driver = {
> +	.probe  = clk_gp_mnd_probe,
> +	.driver = {
> +		.name		= "qcom-clk-gp-mnd",
> +		.of_match_table	= clk_gp_mnd_match_table,
> +	},
> +};
> +module_platform_driver(clk_gp_mnd_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm PDM GP_MND clock divider driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

