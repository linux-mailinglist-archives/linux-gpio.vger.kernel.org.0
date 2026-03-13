Return-Path: <linux-gpio+bounces-33389-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE4zNtoktGl7hwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33389-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:53:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90174285573
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A9E9305650B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDD53B0ADB;
	Fri, 13 Mar 2026 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1+Fkfqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFux0IXB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED32B3AEF41
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413275; cv=none; b=fneNDwLpIkl6Bmw7wf/NyKmoD63Mn/R18pM9uzDSwOcroG9VXfVhD2DeVzz+qhjHcErufTq6sH4I0hhI3K/LvVtED4WNoa7RmNiLe2iKoRdoz0DH/W69FJUmlvBxZjz4g/cYG+t6KUjCmoftNjTnksoSD6jsi9M36jt1VU8BiUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413275; c=relaxed/simple;
	bh=BwyR3wMEIv+XOoo4gD08vL2uWYEwf9XPM06RxHZmicA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLHbYr2Cq8qj875dmFa9OllQ98KxsYopcI0wlpKYbvOccBSYbcnVJNrdPUJvngq+zzlt+9O8mUyCTxj4gpwvm+7pMt2gdm9aPl3sclmOtieDl4Asdc9VdSujyxtCHf4AXyaE3Mvg/+8YP26RmaYUu4yv1I0TF313egTIINw7u/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1+Fkfqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFux0IXB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAmvMA2391118
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EIjzCgcCqS7gor9O/lJVl3Uf
	7RzlS6vZQX73cMseU68=; b=g1+FkfqymcZfTK8YTMn9wpWbqvfIbhBqJ1PqC9Xj
	yKJHhJIEcvzhGKb1nBF1hAmcfEzfjVzTbrDcWpvEGM/8IjnEVHXfDoChDfZo/hJA
	XU4Uz7Xxrs2GM49gxNwg8VL0UmtCM1gUmApFoDHYSBxBxjD+Y1N4lIFfO+vh4xMt
	+JsIgFna/9vnaI7f4l0y6kbjRgg2N8NxU7aQX9bOvq2zUdxxJDocQGN13Go4Qfei
	vtNjBX6t30wgeaYEwUuUbALTuu5Zl5GSdOu7z6ohnCpJQ1BpL/ZdhECVmdttTVQO
	uDGEeB/VdirBcmLXZRmxwTMJcKVFZYgm/I7+9YSpXT7eyw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m8scj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:47:49 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ea747d58eso2166255241.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773413269; x=1774018069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EIjzCgcCqS7gor9O/lJVl3Uf7RzlS6vZQX73cMseU68=;
        b=VFux0IXBWPfzNkQ7elO+u57wA9waIb/zmQC0Am4YFUx/nNVC06TzTmZPg9X0lBI37C
         JDqxuWMTC2tiZnqegWr6jSpC04PEq3V0n90qvM6H1HYARvTFUGdQUujlWQT5B7TEwwdP
         XT4HRRKXb7rGELxBaeTYsKLqm19SZHZgqZ1qjX/nFtqsTRTohw7ooUF1RBo9zhnGkNw5
         WDdrVypHQ+EHPFHNmM9u3aedPpTNETzGrgX4hzTVbtWIVKWlE0m/yD6Ffw/mDQkK+/Jz
         vt7F+JwFtn2Ga0xMEHcA5YPWvxjc5okMLbG2TelNzdIWqk6kRJyeLVn8nkNXLOni5czB
         I+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773413269; x=1774018069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIjzCgcCqS7gor9O/lJVl3Uf7RzlS6vZQX73cMseU68=;
        b=mDz2G19/paGae4UdpDHKg/tTiiDDTB0Ri0KNNe7LULlJnz/Ut2UqHQYHQksCHLLSX5
         xcbtdSB8rdxlA/CH7R051dnbQ0X06IUD7KSG6kfiLpPr4QHZETtUSObNzt/u1fxEcDVk
         ZUrXI7VxdOaG9/SDIEKLFW8MK76rg1TG/mqX38vUnEg+4w4aUqEu4cy9wHZMcluzEBku
         OMEv8GDhA7K/jRsan7OI5TZdVAk101Jt1dFZcv3jUldxYNiGFzVtNVadJSxg1AOZ1kc9
         J6OKi1plNRh3C8GMxJ0lf1/GgTGT1BcMv9zCPFPB/EdMIEpQl5P0Cskg/mcO56zn38Wm
         UYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEOzx5CCrQKzBZtpsbxGkJJvDa9z2LLm784QMP9JuMOepMtvVO0Y1Rjd7jLD802d1GV5IO5cXUvQk+@vger.kernel.org
X-Gm-Message-State: AOJu0YwZjnZ/4Go8zVIsp6XlA0rQ6hPzeTVxtFd9EOGgK/+ZoE81ee5G
	izYwUxU0keS4V1C5tfsbxyEl7b2GnPlrHhgDw3oNcelvPXpAwhhZ+fGTWQWxl71gKXq3RREEXgS
	qlFHra9RyjsVVGuzqBJ36ilBPBd1GbNET5oWhyiJISURJLil+WhkNErYBgz1uwLfI
X-Gm-Gg: ATEYQzyOaFGARUg0ymeZfQPgPlJ1ozJUfCFSKawLXIZUpS88bB8X94rTnVAI9JhPNsx
	9YJ0CDkSXPPsP5t3W/aFDWAaMLy6av26/mRJUrOwY5gb5ZA0zGSFms3T0hsyFOfNzH6oJGF9nTe
	KTnkFd6bCDn7A45E0PvVSmZz1XqJRiNrv+a7Xt3ErEQSlnGBWUWiXK20gJuqoSHriWr/z075Kkt
	rXv+XBH571s/Df+/X8n70uCp2FCEwQlDXf2wnz09U5uuBWUgnEHT3nA04ULi8Uq1RbYnzF5IgQ7
	KLuAHE36Ssn3KhjPfSuHX9GKLGYJRuLRQAUS0d02DGo75imwR8t0pKe5w0Z2wKasd0cQV7gSRdo
	+SbBdwKTVx07a0YeOkbfPku0nVq/vbysJMCnx0BJ/TYl9wDp6+XwsILbAwlEjlHuqYdBzPjzIUV
	NE8SNttGZQqIRnkGAFv5S/u2bte/fnywRdTUg=
X-Received: by 2002:a05:6102:ccd:b0:600:11e1:2a4b with SMTP id ada2fe7eead31-6020e5a22bbmr1418122137.34.1773413268838;
        Fri, 13 Mar 2026 07:47:48 -0700 (PDT)
X-Received: by 2002:a05:6102:ccd:b0:600:11e1:2a4b with SMTP id ada2fe7eead31-6020e5a22bbmr1418106137.34.1773413268328;
        Fri, 13 Mar 2026 07:47:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e7dfb3sm14777811fa.45.2026.03.13.07.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:47:46 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:47:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
Message-ID: <ro25acm4voifctjfd4hj2v22ulcx7mj4xugzkr3ai34eft6r7b@vhfajna3djja>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
 <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 14QueS8IkdC5NBW3wMpFV4TiDeBZq0Se
X-Proofpoint-GUID: 14QueS8IkdC5NBW3wMpFV4TiDeBZq0Se
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNiBTYWx0ZWRfX12LmezE7OczR
 mEjzMrM8/qUuXFTWilYi6sngJqwCKqGQ4pVtGzIuG3tj2Br3U1W2RQuH9HOrudHhBQ3nYqbxq8T
 5t14kP2ztRzfq06ZP2NcUGDav25PFwljJZDMTQARRMhjYrvoX2WaPdfKJG6lkqWU+EFHhfQtA+R
 biDgjW+Jcv0lo+UI3Mpqv6a5XE1V3jikkYn5Jk6h00KtxkFlRAaXigG932EdtTR2HHtC3AEWJ/E
 Z6QER5U994BHP76q6a7JFJqONWsrGjw2kBgLaQX75x5FwzzH0VzBJ3YJyMLLjVRRz3Btb/5/gUI
 nGiqCJVR/NCx4JU/LzbqkGjDQwepTbUhT6mFHUea7piRhdz9sxpyrX07bPQaz1bCArFolULnyti
 KQBhj8mgyqPfRqL9/ackqIGfCzrhhm1eu//kS4hhwbuWhrn9MGepMnVp1gsKsTkKYsu0Xc7Rj7o
 IbSJATEtaAEV5tD/OMg==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b42395 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=DApZc1ZKry7Yto7750kA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130116
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
	TAGGED_FROM(0.00)[bounces-33389-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 90174285573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 03:42:32PM +0530, Maulik Shah (mkshah) wrote:
> 
> 
> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
> > On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
> >> Interconnect from SCM device are optional and were added to get
> >> additional performance benefit. These nodes however delays the
> >> SCM firmware device probe due to dependency on interconnect and
> >> results in NULL pointer dereference for the users of SCM device
> >> driver APIs, such as PDC driver.
> > 
> > This sounds like a bug in the PDC driver. It should reject being probed
> > before SCM is available.
> 
> The SCM driver provides no way to check if its ready or not to decide to reject/defer the probe.
> A new API like below would be needed here,

qcom_scm_is_available() ?

> 
> int qcom_scm_ready(void)
> {
>         if (__scm == NULL || __scm->dev == NULL)
>                 return -EPROBE_DEFER;
>         return 0;
> }
> EXPORT_SYMBOL_GPL(qcom_scm_ready);
> 
> This is inline with what cmd-db does today with cmd_db_ready() API.
> (drivers/soc/qcom/cmd-db.c).
> 
> > 
> >>
> >> Remove them from the scm device to unblock the user.
> >>
> >> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> >> index d7596ccf63b90a8a002ad6e77c0fb2c1b32ec9c8..ebecf43e0d462c431540257e299e3ace054901fd 100644
> >> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> >> @@ -308,8 +308,7 @@ eud_in: endpoint {
> >>  	firmware {
> >>  		scm: scm {
> >>  			compatible = "qcom,scm-x1e80100", "qcom,scm";
> >> -			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> >> -					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >> +			/* TODO: add interconnects */
> > 
> > Somebody will try to fix this TODO, reverting this patch. Let's find a
> > better way to handle it (which would also fit other platforms).
> > Originaly this was proposed by Sibi ([1]) to speed up PAS
> > authentication. Other platforms require RPM or GCC clocks to let the
> > firmware access crypto core.
> > 
> > One of the (stupid) ideas would be to add a separate SCM (child?) device
> > which would be used for crypto-related SCM calls. I'd like to point out
> > that currently we bump those clocks or NoC bandwidth, but at the same
> > time we don't vote on the CX rail. I'm not sure of the firmware handles
> > that somehow or not.
> 
> Nice catch, AFAIK firmware don't handle voting for CX rail during SCM call.
> 
> > 
> > [1] https://lore.kernel.org/all/1653289258-17699-1-git-send-email-quic_sibis@quicinc.com/
> 
> yes, I had already seen this,
> 
> So remoteproc PAS driver gets performance benefit with crypto vote and interesting choice was
> made to place it from SCM driver. It was evaluated and considered reasonable one at that time,
> pasting from [2],
> The clocking needs for the CE relates to the SCM and not the remoteproc, and it's in line with
> the management of CE clocks from the SCM driver.

I agree that those clocks must be managed, but I think it was a hack to
reuse SCM's iface / bus clocks for crypto. Originally, *I suppose* were
added for very old platforms which had separate DAYTONA NoC clock, most
likely controlling access to some of the backing hardware, but not
necessarily crypto hardware.

> 
> With my limited understanding of remoteproc, SCM and crypto,
> 
> - A crypto vote would no way bump up the performance of CPU jumping from/to non-secure and secure world.
>   (actual "path" of SCM driver).
> 
>   if remoteproc requires the crypto vote for image validation/authentication then remoteproc should
>   place the vote for crypto path before invoking SCM APIs, SCM don't really use this vote for itself.
>   SCM driver though today adds/removes vote within remoteproc APIs keeping vote placement limited
>   to remoteproc usage only.

Looking at the code, I'd assume that once we start testing HDCP we'd
perform the same for the HDCP-related calls. The problem is that this
kind of management also doesn't seem to belong to the remoteproc driver:
it doesn't know and it should be of no concern for it if the firmware
uses crypto behind its back or not.

> - Firmware could have put the crypto vote if firmware is doing image validation/authentication
>   after the SCM call lands in firmware and remove it before returning to non-secure world.
>   clearly not a choice now to update firmware.
> 
> - I see crypto device too places same vote (at least on x1e) so i must be missing something and
>   both SCM and crypto device vote are needed here. I was thinking if remoteproc should route the
>   SCM call via crypto driver (which would places the required crypto vote) and crypto driver
>   should then invoke the crypto related SMC calls.

I think, this also looks like a hammer plumbing. The use of crypto
device for those calls is a firmware implementation detail.

> 
>   crypto: crypto@1dfa000 {
>   	compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
> 	..
>         interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
>                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>   };
> 
> Let me know any preferences from below options or any other.
> 
> a) Add the API like qcom_scm_ready(), this has been tested and works fine.

We already have qcom_scm_is_available().

> b) Move interconnects from SCM to remoteproc PAS driver for all devices
>    Take the vote before invoking SCM API and release after return.
> c) Remove the interconnects from SCM and rely on crypto driver already
>    placing the vote, Route the remote proc to SCM call via crypto API,
>    This would ensure crpyto is being used and it would have placed the required vote.
> d) Add separate SCM child device (with interconnects) under SoC.

This is going to be my preference, but I'm ready to listen for other
opinions.

> 
> [2] https://lore.kernel.org/all/Yr0Os5TOITY7f0Wk@builder.lan/
> 
> Thanks,
> Maulik

-- 
With best wishes
Dmitry

