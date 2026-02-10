Return-Path: <linux-gpio+bounces-31546-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Hm0Bj/2imkePAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31546-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 10:11:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 591DD1189B3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 10:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B75943098823
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639FA33F374;
	Tue, 10 Feb 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpgSl0bs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSkEJe7C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C1233EB19
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714506; cv=none; b=mRoh2xYpT6G6P0RI/5nuncg/zJfi4ts7BonvKpzHNRJ4MShxFnyAnDe/kWVCf9nNTDON0fLijYdj5jaI2dD5jhCejm5iBEXJ0uPfAVYZR1Nf2hcHG8rM83Kja+6mNMZJ+7/ae8AH3WELmq8FWMVhuMH6N4lfd0kzU5OctbR5Uas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714506; c=relaxed/simple;
	bh=8phweCTCuSE9/1VdxFMRPXiettcccLMsQxNnAgW5v/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YeCXjkc7IgEnqt+ewOTrgYDHKWiXWsAeKItpAwP9CxhkoixKjYtqih2mSD5lBiPaMrGt7L2Um5DNjAzqtAHO0abYNNIB7XOti8VmmURu4g6m7PMPBdzeK3/P+hsiMC+UfzFtfy9udXsL2tQXrckyrkloqhrxXmYO7Ot0Q94y9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpgSl0bs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSkEJe7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6xlqu857877
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 09:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4ZTsxigu+39NKtIykvgwh1NpfGT1fBGZwq1IOP/Vew=; b=FpgSl0bs5NlaaIL9
	1u+aTJdu7inV4UgvP6QC5aQuRLwJRlZfct9d4FJQOE1jK+tq43lk+RcbXCDUC62H
	bG9WoWnx9CsHIMPw7stcK4DoP7rPmdMPqSY+ExX/VpFPZPbxUuRoUcGTXQjGwQtO
	VEWRqwRs781GTnG+Q9MExnaWOl+Rnsb0GTBpHaP2EvAWM0DuFUMAsGTIus3WpShS
	Vn1orEdcHCJt0QBchxWRXSTjp7w/UY3tyNzyWKhsfVmR2fr0fib+vSQdcn2z/WJm
	7TL+ujAJg/MEv9FLuZdL/brtBtv1LVDY2H8E/2xRxjcovmi6H9NFciP91D03Ftbz
	gYqQYw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7ga63j9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 09:08:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f35bc8ffso18737726d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 01:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770714503; x=1771319303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C4ZTsxigu+39NKtIykvgwh1NpfGT1fBGZwq1IOP/Vew=;
        b=SSkEJe7CPQ5PqCQi2tUBxnM6GeAwkPgBMBMCYiCoN/mnuC77liQejxPaxLuhrwMbK0
         Q57z2/3eFWJsMaCKG/sQxiLRipilwfQloQV09Nt19iKCaWSR0ws8RBZt9Rului3RrqT8
         xPHRD01LhdZkP8QoQugQy18Uf06r07884FHGGmI3rhbZELA/IJqk0D/VN69Nw4Mwbt+0
         ykH3E/IU6+etwoMattkLI8DCnn5+Tp45kfu7HoSkP1CyerGvGKPJG6JCu7uGwfe4+dIv
         gZ1XPNHXAK3UcfVMSgSInPQH75mWJWHvVC3A8FbMEzWVgolhv3qd3+1ihYeNQZROVQBK
         cE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714503; x=1771319303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4ZTsxigu+39NKtIykvgwh1NpfGT1fBGZwq1IOP/Vew=;
        b=fgn0KuN+GVonHgGeUzdsHPR0mHiRzmdjWjgsxq00MwBiimeYudceMPTVqjx1vd3WVe
         bQ+MOXPZywpboXbLSYqHO1TFXDPsimBXc53+z5rxAqnthoyZ9L+csEnkEbmsOdKr6UNs
         6RItwDKvop16Na9CNTviRYFQ56HkSQC2NTG6MRLkKbcjDu/UxMe9AizjmTo6ajO2ztL1
         ABSaNwn83b46F69T+xU/D8B8audsn6RcvEUK15l6Aeth5d2FzZ68FwptYDMp9OD6Boto
         e16C9MMhP1L6BH4jQC5BwljNwIAEnlDaWFLahTQsKyoy9Tvxn2HcE0AezMJD6bU3p5Tp
         uyTw==
X-Forwarded-Encrypted: i=1; AJvYcCV3LcLWcv8/gP72c3T0SxirqTT9a7QRCcdo04INuE+bM0qZ8FocaJF4ck0E30XFNGGkWReJMLQRDgOe@vger.kernel.org
X-Gm-Message-State: AOJu0YwBl/MaN+6DRfXeUhSQaOT80XiYYEbXQmzqAuQ2MB4gMxm6ahJ8
	euaxvsoEpf8lWYEpAg/McjPydcfO9vxvbh/JBbjbAqLddn7lXE3A3h+1sBA9oGlnnp5vcFeOLhM
	40uOD9ODqcNIFlrjKca/Q2LnaaNh4KLm87P8eKpj9D/pAG6jPx7vCvV4dzwOIEI+G
X-Gm-Gg: AZuq6aK1PxmK49PTREWIYl1y5NkN1xAF/HtdK+LHLc3QvKN2GF+It2ckJfMqPszvCrK
	Pmrt5PEHkcV/AEa2/zWVMb9EWK1ZipFvo5DQ+2V5fZoRktW89AVpTmkXTNB89vcY6Nx6sEEJkOO
	zdyS1CnUqgexYLfUEvhakAULyImgaLsoeSXymJMbNGqqCayRTvMbSkO2y3cMmYJ8mmjXKYv+dRJ
	mGt9NSCYqOWzxnBGqBqv6wznT5OHUHi/lVHIZkpq8ISopDdwppHh60OJvMJ0LzA7CPS9yUDPcax
	0cxuu5LYiiYs0/w+Av+7H8JGye0DssGN0n7WuR7DfVzbgI5g2f7NyedWQlY/o7iydSGJpbMqUlH
	Hxnp1Vw20Ql1p2Y4JaElL7iJRVp0BKYwHrCCwSFrrquh2/icwgEnUY5ynEd2PqOYwz5s1lXtkuv
	WUOTg=
X-Received: by 2002:a0c:e00a:0:b0:896:faba:623a with SMTP id 6a1803df08f44-8970fee2f65mr8441226d6.7.1770714503320;
        Tue, 10 Feb 2026 01:08:23 -0800 (PST)
X-Received: by 2002:a0c:e00a:0:b0:896:faba:623a with SMTP id 6a1803df08f44-8970fee2f65mr8441016d6.7.1770714502974;
        Tue, 10 Feb 2026 01:08:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983eb68cfsm3693616a12.12.2026.02.10.01.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:08:22 -0800 (PST)
Message-ID: <5fa188b3-d060-4513-bda3-6608a9bdd7ef@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:08:19 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: add sdm670 lpi tlmm
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260210021109.11906-1-mailingradian@gmail.com>
 <20260210021109.11906-3-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210021109.11906-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bu_k3pd-QTJ4T0KaclGKJJJN6n1sg0nA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3NiBTYWx0ZWRfXyVpPcpZ0x0Y+
 1jX3Ij1olAyrZdhVOdw1gPDCO/xy832ihnQke1e9CVpRIzhN8cGQG2NSrWEag+WPbo5s3JJYwwr
 F6UsL5DWbZeXJEDickDVmgHBcPMMH6KI3nB34LTRiX5lNFJ7Lh+sulrpoWgytYGNbWd+xkRhPa9
 wSbWWC9UR79DbOyDsLersPaHyppI3fFt7tD/z6bxdHqPwYh1cas/GaNMQS6X54Pz4ZxZUd1VyG1
 S+XqKCENMSOIs0nelMNvs1CmlosYsIDr9iFsMhKlzISE/tR3tq0Zud5ESbjnwE2mzBcxCWZTGvZ
 QE/T021kLqr0NJLd/baHDkdPRLQOnlIe9QTywVeCDpFSTtAXN3VJSC7JF/0c9/A0f3/BBsn4fSW
 ERIuNTCv/yhDit2fdaIMbLbKIKKs5kyESTT9fa6o0BbCe38q704g3gYOqLNhvONnTmm9fnM8cBK
 1sYnITOvQPatVZUZhmQ==
X-Authority-Analysis: v=2.4 cv=WK1yn3sR c=1 sm=1 tr=0 ts=698af588 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=nadR7umDcEpqB2gTw5wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: bu_k3pd-QTJ4T0KaclGKJJJN6n1sg0nA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31546-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 591DD1189B3
X-Rspamd-Action: no action

On 2/10/26 3:11 AM, Richard Acayan wrote:
> The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
> +	LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(3, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(4, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(5, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(6, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(7, LPI_NO_SLEW, _, _, _, _),
> +
> +	LPI_PINGROUP(8, LPI_NO_SLEW, _, _, sec_tdm, _),

"i2s1_clk"

> +	LPI_PINGROUP(9, LPI_NO_SLEW, _, _, sec_tdm, _),

"i2s1_ws"

> +	LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, sec_tdm_din),

"i2s1_data"

> +	LPI_PINGROUP(11, LPI_NO_SLEW, _, sec_tdm_dout, _, _),

"i2s1_data"

> +
> +	LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
> +
> +	LPI_PINGROUP(18, LPI_NO_SLEW, _, pdm_clk, _, _),

"slimbus_clk"

Konrad

