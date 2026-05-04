Return-Path: <linux-gpio+bounces-36023-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHjyLD5S+GmmswIAu9opvQ
	(envelope-from <linux-gpio+bounces-36023-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:01:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD624B9CB4
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63E83022067
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2DC2BE05E;
	Mon,  4 May 2026 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyICL8ZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSb+FaNC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C36309EFC
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881394; cv=none; b=qhpOTnhJNc35fGC7DYgfccQuMPMgZ6ERzu19P2FpIuLt8zsubzTDrtJTMbGofMCxfrvSftpC0Lgg7y6oL7nr4aSeHmr2TMw4ShN1tFpqPtgs+ENDCLZGuIdMd43HLwAQB8TWac08Yw6fexDLRepOt8gxpgNzErI57mCAzVjbrD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881394; c=relaxed/simple;
	bh=jd0s/jvIDISRsyDV2jaZSUJqYEywMClZG15n5rakyxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGfLTpPeAGYyN399zkY4EcayszVi3WO/6XwEYan8pih5RVt3P8/uyHTFNz0ggoSMtcymTsPDE59Krjf5Kypk/HX3ISiZ+ulztX/GblQAFsegGQPqjAygeWHEb7i+oOgOZu3cc5C8O3uRNLLpLQNcbvhNPjSf9jjSXC8Dso72lwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyICL8ZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSb+FaNC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DMqA875803
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 07:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pRZ96Ld+Gp1PrytRI2L1DzZwGRx5l3Gs/96clMZAJbo=; b=SyICL8ZE7una0WN+
	dkF9Drg2Oge/LQ4kEaXOq8ESOQb/Emd5n2OSQ2GYP7SDaL0T3kk+XntYM0Getu97
	x9AZfIIEBoKKUXyT+VoZXJmnQZYBPa4tEzM+wwgBM3cNiLF1VgcW8pw2FKh292NK
	fKzhYpInC/jV/CFMv0sxDRzS9J/ZJaymfJ42f26++bqv3QfM+Tqi/JOOt3Iz6ye4
	ewpZFSYrV5LN8cXvEBXT2EsX28zD/c3dY7oNxvwOAncsPMHWLhTRqczRBTUhXP7N
	AsXCPqxEYywoI7GpYFq1v0WMNcBTopsWAq2e6zvxAXxdfXidP9bYuf9d4khZCWZ1
	avscLQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1emr9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:56:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so2529543a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881392; x=1778486192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRZ96Ld+Gp1PrytRI2L1DzZwGRx5l3Gs/96clMZAJbo=;
        b=LSb+FaNCASFkWApZqnoeCes+lqQsP/fsRuGHnijnmvvSLl7EARC6v9yU/eSJ+G0Kll
         MLMWbWjojrsGtkWwa4UeXivq/CzcR4LlbeUIpr+VH6h7Itik5GrkkXhN53PHghsJ4LXv
         N0c6ip4UY0GOdeov7MCdP5fqG0uzvsl8RKNjFMyEGTjbLx4l7Kr/sffMPsUPtmUHPrJE
         HgsOITOdJy//GLNd4JKiD1UxJT+QsYoKa7SL5HoxRmigF49o0pXrF01PsMUQR2o50bzS
         MjnOQzpQs7I7JMAK+AifxNdwHMQELiyH+0s1XNeqDdJLiwO8s+IQsrA2RvPabfMW7Ntf
         Uceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881392; x=1778486192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRZ96Ld+Gp1PrytRI2L1DzZwGRx5l3Gs/96clMZAJbo=;
        b=gROy86e3jHGTcZwtorP4HP6UzbH8gOna0TpWfJiKZRABrQ+QQITdEaK44Jj2PON5dV
         40+3dqtP4XD/JGZCDwd2t7zMgY1kx7Ek7Nx+/IjdBLQkmD3uuRtwIh7dgHg6re48Ual7
         0AKiIPIVUWIixkXvfr5cFvBLkNsMM2KUugqHrM/8tZ2IogmxacWWf14p0YYv69YfUK/q
         fimE0es3YrdYYCz8qfW9ia1OaquxZROAuW8vNEOTn7nFNONqAE3tyQMdNSzu1ZkoNQMa
         U7tgJEA1C87yRQo47ZdhSyL3kuvJL86vt+kpguIWkg7Wk9/48A3qCwn+ztlwwaTsegWp
         hjgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QA/4ueDoNcN0GKVbQiuAplXDUAIogQUomCKZrgVx4ji+NXitHTMbKev7a6VJQWR/Vvo033l92aVp/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4N+akOiW07Iny/H7tsYfKe06aKjflwC0muLqXcRALWi1sjEH5
	dnzDLQQkoAB9EzT+UYzcA5mR2SlFLzN5hWvl5ZK3j0p9Yl1weEANu4D9VbqNkuQXh9TMOhWj9ge
	7k4CNrkTdqIqVD41oJigGkHA6V2MogCCuImYyTrKiuGl5BZFUId3dy+1uhRapNq/Y
X-Gm-Gg: AeBDievJTaWcuxvftJMBZhXV09ttV9Au1SUT9YX8ue8P2v2teMloEi0XFQg53f1bhwm
	C8XTZlmUDXlBRv7vI9fn0X5ntuoNU/KyAqy1klmQR44Z7Aq0eKMEU2Pw8hs9NZ33lAehxrd8P7+
	QE8C9S9G1dxqiCxuHPottS6+If2Dn4SqlnL9rzO6mYPwss2zJhJmmlXzHZEuCqqoPxFw824ZLGm
	WwO//UYUBNNmmtgOb7o07JkwK1DpVCyEmc4KeWszYsjf6fI0cX9ZbMGC9XOphVVcDR+/TO5Lc53
	uWif5OZBBgMpg47VadLxhN7woe78AfGpPxkXtFB1CsGOYw72Cy32E8sRw+IePDLp1cE16PkkUEK
	NQXlVAuhYj7QZkdtpHmY7Zjq6rYTn+paCYY/Pcr41Oiid6yxMfAdpDdtGVq8=
X-Received: by 2002:a05:6a20:5493:b0:3a2:d838:bfcd with SMTP id adf61e73a8af0-3a3d17c42damr14494824637.0.1777881392172;
        Mon, 04 May 2026 00:56:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:3a2:d838:bfcd with SMTP id adf61e73a8af0-3a3d17c42damr14494801637.0.1777881391699;
        Mon, 04 May 2026 00:56:31 -0700 (PDT)
Received: from [192.168.1.143] ([59.96.95.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c801fd404basm4379097a12.24.2026.05.04.00.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:56:31 -0700 (PDT)
Message-ID: <7bb59b79-511c-4a40-acb1-05e08cea10a8@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:26:25 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
 <CAD++jLnDc_Myjt4TKUHZAqYqVwO37TaRO6t23ABew0M5VnzJWg@mail.gmail.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <CAD++jLnDc_Myjt4TKUHZAqYqVwO37TaRO6t23ABew0M5VnzJWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qjmnBXjVjKmARIJCXOExcOFd2iBguAAF
X-Proofpoint-GUID: qjmnBXjVjKmARIJCXOExcOFd2iBguAAF
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f85130 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=d18XUvOkrfNYrh/LwM53Ig==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7-43aZWuTfuDHQZ0LJsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NSBTYWx0ZWRfX6SRgaZZ3Pfcc
 g/utKKow2ZB61iy97rJvo2nGnx7IXFr98Cv+UZ82KoWwAx7phWn1h2dqjKt8pmruLQSfTv01nCh
 abbA1y2jOVFA00qfUFPc18YECG4Mu8HeAB5H6PJBb2+r1q/I4GRLSzdzWFs4hejcsFN3Kj3WErX
 thE7I7pV0XV7Ovlt3ZB7hydBSAa2Yh/+SF1ZglU6qIur84ZVXkxNbJ48UOZMFUIaqtmmEiBwdFe
 +VpnzzQ+o51zxw3iaCX0SfEsS8JBr6hH70mEtjWSt/Uc2tv8pIkNs0SH+WBzrHn2MaZbX3Q2QKg
 KUwnko5SHaBbUyKQMV0hW9jSmmsQ4y6BKMGS8iFrAA7Bs3mbPFv7cvYEw5G2WJNPKnlWIb6SuHC
 Bw0MAtM1PVIFqfpvovx0chn1+FoMvjPeCqleBzbKL8ph5aO2Jo1QfrQfwztjoQCquCBxPymS64+
 uQB5v1wPB71wObtQd2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040085
X-Rspamd-Queue-Id: 5FD624B9CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36023-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/2026 5:21 PM, Linus Walleij wrote:
> On Wed, Apr 29, 2026 at 3:12 PM Komal Bajaj
> <komal.bajaj@oss.qualcomm.com> wrote:
>
>> Add pinctrl driver for TLMM block found in Shikra SoC.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> (...)
>> +config PINCTRL_SHIKRA
>> +       tristate "Qualcomm Technologies Inc Shikra pin controller driver"
> Those descriptions are changed in my devel branch, should be something
> like "Qualcomm Shikra pin controller driver".

Will make the changes as suggested in the next revision.

Thanks
Komal

>
> Yours,
> Linus Walleij


