Return-Path: <linux-gpio+bounces-37897-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S6xHGbkzIGoWygAAu9opvQ
	(envelope-from <linux-gpio+bounces-37897-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 16:01:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5456638562
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 16:01:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jhjgfj2d;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RydogZiZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37897-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37897-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3724303CE1A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 13:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC71733D51A;
	Wed,  3 Jun 2026 13:53:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51233FE09
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2026 13:53:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494799; cv=none; b=GnMGaoTCKH7qoURPFujqzb5xrt6cy97DvRzw/jv2GsH7C5Wg8iIKqceY604dyZ8kzqm4LXf2v/yFJR9l2WSK7aYHTiLNxQAOWZNjg1ZQyTm2HmfME/HF1nJ+Ubh/LiimcsdS5rjLTJHZKgjYdy85kP8EYa1VfL9Vr2l5ai6ek/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494799; c=relaxed/simple;
	bh=Pe0/nyaz42Pa0EfzhxkmJhiDip4+rKIwI3SR0E4erKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgVlw66QHWWAd0o26nW6AgHO0FtLXKLLzXdSj51azO7NOl6+mb6I/Y1iFoKAULA+Eqjdf8ltPfprb/Hlebv7IqccKyGB+hrhnrsQx6o7Fq8ZEF33pMvYn9Y9bGyKHKm59pkiN2LF0PsimtDaWMgbOdhoDCpSu4SO1GsFQL7d9hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhjgfj2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RydogZiZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CONoC2076183
	for <linux-gpio@vger.kernel.org>; Wed, 3 Jun 2026 13:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSDRVkC5HWAm8ddfs1//fWde9yiUBI8PwhpcLay7p1E=; b=Jhjgfj2dA9H1mxrE
	7HeXuPqDmBGKvs+II19caBrRbgpUy210t0JtKA1OyA+tS3AsRUGZMWwy3HTgaFQp
	X0UCuK5eSIVVuRExGZk/hAlqYX60auzwFE2fZVTbQGZ43+YCAuvjZ/McYsFnrrNA
	Libbb0fL9phbZ02CrCgGfmpgFNJ2mOfYKnzBfhYSq8xhRv75Td7T48Jqe+A08FRi
	qnu2jXtOcy75DLDFjVZ9K4ESQUQHthKmZis2Vf/EOCLgsvsHJqTg16QIVcGyu6QF
	H7oNJ0IHqta105861AILwvsVfJ6hWnpoCQ3c84aHSKFa6WITH0n1q9rrRvuSWHdz
	z56G5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev19t9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2026 13:53:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915732517cdso50994285a.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780494795; x=1781099595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSDRVkC5HWAm8ddfs1//fWde9yiUBI8PwhpcLay7p1E=;
        b=RydogZiZGhNl+gUIUOYmNhep4skdZb+fXWJfkRdtAp4wEcmTJLwgTrr8pcWwQ1tox2
         jD5PJI+e0y0U3Txvrx47UUeAWSXrwLCj3Hbke2hg2qSgCyrEqJm+9RT27SayxcvAJBsK
         xWClm61oqKLoTtqxMXjxWgIWbf/LnBrGx14pcwqT06T/urOGPVRPuNgl7OJHy0t6qpcW
         lFUFNG+uTaYt51dwWPNJbCbLR1tJ+bdIboOPoVi2DfmQOHIwVd+0ApP7YaHZ2hegOlRd
         AJ96EXe3+wAtvt3idamt+HnOQ+jymGly/Njhd0JuMpvFHs/60ZCOnncs4nLTn+YPdf4f
         wt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494795; x=1781099595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSDRVkC5HWAm8ddfs1//fWde9yiUBI8PwhpcLay7p1E=;
        b=KgG0R73Il3Fo4xuFQh/9Oh4nxi0GT0X+Bt5vNzbq+uSaCcIk7okCJCMeZoqaYXoPMQ
         B25x0pm9RlxUxaFo1GfCDiiPPOT+tmInZc7VpTaUjLXK24+p+uhQSDxrychU0KMptGx+
         mS1AtnKqCtmW6ZS5ScgYJFl5HAiitVSSgQFQZTp6QtVsQqEcbZ0YfnixK2gB6LQqH8UT
         CUlgeTwA4BpYchj8rdj1ptpq/BfrB6gbEFb7zNAqCbbnmXW2OpomxPFg/7CiB4SmdLTQ
         7WC0jh6E5k7wtYHHDUwx5e5Y7OVi+ICn+od7/t1MId4JSM3p7nMxIjtIQ+VN/yHNONLV
         HlkA==
X-Forwarded-Encrypted: i=1; AFNElJ90TFfvAfO4WWqKxvaU2w8Z16oF/ZCmDAh+XHE/FmQzn/InsVA0Q9hYDM4mr4Nh5b+fxY3KBEHjwctB@vger.kernel.org
X-Gm-Message-State: AOJu0YwcJWv6jWMB8SO5eTM6E8DBmdrXFfQBIbt63OqnyMM1wv6iqqxN
	PlNAwAgJ9SNfLvBRIrEJ3t/+rOElxLfYiUo8SVXGiLbP9ZQz4hWvRO3smBnCpoDRqvJqgqdWPGN
	f4jCU1/4qFOTdPqFVcxXiaF0O8U9B7iOa9ydxsx0d9CQO+AEmgjWixzZIXKjpto0W
X-Gm-Gg: Acq92OG8pMJxztNjILrQvFODBpEgO+H84M0BJ4wBlh7YDd7hcRu+xSN6HzGxQ/qabMj
	RAlhf96X/faQUEjpb+YumV14iqdRijp3gaFH4uhpUIAR2+GkiDlit4cT+y1FaOoTgJk1jQi8nKq
	ORc1GAU7AI1Boe+cX1oOnx9WeogBsKabMpH4ebA3yDyeGpf71wWxeZk/LBpA6yYr+v/KaVLCnQp
	TEIaoy936B+wn1b+wA2C8iOA47cZPMJJ2iRZR13RCgdsXmyagTrg78kCx4zgSTjLZxbwxgWsBid
	XpgnyBzDPonjW/AEVZH+j8sR714nv7jvlr95VjWEa7zpnz2dmuZovfPMTV0fhuN+yAqrxOUkVX8
	gHvs6E5ehy2xRn8ZDbB7cO2Sa1Anf7QD2bFX15mi9JG+4iUOfe86UaqFnI4Lkzni7SVwWr+ndpx
	+7Gd70cKYqkWU=
X-Received: by 2002:a05:620a:2955:b0:8f3:5988:f97c with SMTP id af79cd13be357-9158a2c0f2dmr352296685a.3.1780494795479;
        Wed, 03 Jun 2026 06:53:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:8f3:5988:f97c with SMTP id af79cd13be357-9158a2c0f2dmr352292485a.3.1780494795048;
        Wed, 03 Jun 2026 06:53:15 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2b79bsm1233851a12.8.2026.06.03.06.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:53:13 -0700 (PDT)
Message-ID: <1de59ca1-0063-4ef4-b78d-acd7b3cbfabe@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 15:53:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] pinctrl: qcom: Modify MSM_PULL_MASK to accurately
 represent PULL bits
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-1-88bfdccb4369@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529-tlmm_test_changes-v1-1-88bfdccb4369@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -H8_wcnRvi-4oOLrPLBLwO5qAtkLiWnM
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a2031cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qVY8_epACHd-z0WO0hwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -H8_wcnRvi-4oOLrPLBLwO5qAtkLiWnM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzMyBTYWx0ZWRfX7xxxAw/gOozG
 at9IadMDVwabQDxHpbfI2WB5dop3W36dIIOpVblx90ilO+rwraSPoPnOyL9XBfW4laaIBmwEC/5
 ail6+MsgZ4UlXmfqsIdaVkbwYm825ah2mMCzYJgiqC8FMqJQ5tpvRN13+IXwvgHzVumJC8FWnTo
 tu4axTxFGl/WzpmOrz/42U7NnOdIVGzP8Or4LZ0AXK1p0ReVqA5EMm8BakB7fA3vBUwy+3eDuFW
 BrCuRdmz9SOWpg/Ak8sDwm2FEPSz9o8WorbuEOy4cV9Wk1rQ0Pl3pL2guoDZuFCdHhSyEqoOb6X
 IF2AM3THlEty6OIZALLmqLKp51uP+W/qax91UM0wmnBKvkZjOA3+ysY6URAE6l1HchLm/UTCOHM
 s/1p74rHzJZkb0CrrJwYrFj2jOf2IqpyBDRkTn5c5WQMcapu4bcVDJ2lexOF51mr8u83iXdjVVk
 Og1EUr8TPO1d7eRhQTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37897-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5456638562



On 29-May-26 14:55, Sneh Mankad wrote:
> MSM_PULL_MASK currently spans bits [2:0], but the GPIO_PULL field in the
> GPIO_CFG register only occupies bits [1:0]. Bit 2 belongs to
> FUNC_SEL.
> 
> MSM_PULL_MASK is used to isolate the GPIO_PULL bits before writing the
> pull configuration (PULL_DOWN: 0x1, PULL_UP: 0x3) to the GPIO_CFG
> register. Narrow it to bits [1:0] to prevent unintended modification of
> the FUNC_SEL field.
> 
> This causes no functional change since the driver currently does not
> modify the FUNC_SEL bit, but align the mask with hardware configuration
> nonetheless.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Seems to be the case down to MSM8960 indeed!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

