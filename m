Return-Path: <linux-gpio+bounces-31518-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOrqGrNWiWlQ7AQAu9opvQ
	(envelope-from <linux-gpio+bounces-31518-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 04:38:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345510B679
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 04:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 713BE3007C83
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 03:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA822BE05F;
	Mon,  9 Feb 2026 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdqxhDr8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdcuF0X9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57D243964
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 03:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770608296; cv=none; b=UGnRd1fPNY2hjzDivS20j9A/dfTVHSB3OJ60SQzBZrKfF6MSnk41U6xXnokUQWvckaUxwUBCNX6AO22Plmx86ebOMvkeWjibMpI+wq1sEQQy+A8gWZKSBxBRwzoPRmlXmdwNzaqlxnwfgs7O8dGS6WveCnYbHfSWzLbOtTfcKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770608296; c=relaxed/simple;
	bh=ISb808vuzcpKPA3OwlRkFVzN0FTdHkQxWYYClwFGfqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/MRdlgdAQaLqYH19RfKk5p6sP9CkIyDOrfUGIqyFa/jqUwUMxdr8z2bTRrnpuK5+LpNzCMvy0ZnaYdEHP7xooWr0ubTS3WXK2dzdM1U0TRWovbFDTYocfTWgggB58mHfUFByIfYOQtscQnVPn3/bjd2hbXKyZk2/LSP+7vUQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdqxhDr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RdcuF0X9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618GV9uh480199
	for <linux-gpio@vger.kernel.org>; Mon, 9 Feb 2026 03:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7dkTSN+gf84Pwm7rvnKbFpbCB/IDANZ5nDGXN2AIpc=; b=OdqxhDr8i0wKDN49
	Ujf5sgKOsHRc2UoDcz31pQSYZwE+XPww7/3rhMKRrxHtQ0SxMn3IJB9Vlr5ic31J
	F45DRY4/wVgDCutsYQZS4CfmJQ1/LwIjXOFxa1rziz4WFa+RjE4J+vZuLZ04cLwt
	9f9XMpjoyLs0tAFZk61Tf+tZaFJHJmOgFBOA7zYWsHkcBElTLEJtMv6h7hUTBMl+
	8sxW7ELQrKeV87FkEeUzZZL16xLkXbmIn8hbwW+y8gCFW/xijIMdZj7JRuqjA1KD
	e9l0hTjBjU77nndgBjxzHWk4CpXWkp54akECd9XpjHYuJHCAbD26QCTHURexey0M
	xNslVA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4uh13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 03:38:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f5381d17dso2527901b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Feb 2026 19:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770608295; x=1771213095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7dkTSN+gf84Pwm7rvnKbFpbCB/IDANZ5nDGXN2AIpc=;
        b=RdcuF0X95p01VRkhHtlqrbOMpotwto/LzwDDNnfUjf2Az9tj6Ft5h2m6UajAoXBQnD
         Ga5ROsO5DjZ/Q30saQERTa74PbMNqPCIoK1Y9wFuOlcZf34GwVyM8vuk4mHpZh0J9oAE
         Za3hYBOCefjIZrDstGBSq+7Fl6eZV+PUGN+zGQDK5G5U6t58qBCV4A8Q16k4WPmrhBkU
         S5VxmF2i4ZTO8OnKKipnnjqt47Rc0gaiVDNRyeLwP6LLKneuJhEk5QlTASDdO0WHmP0w
         d+oiF5u3Rl9I05FOJrnsEvBewLHFibPHlBWsBZv7lqqbkue2s82qBBlkR0fgrnsX960/
         dmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770608295; x=1771213095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7dkTSN+gf84Pwm7rvnKbFpbCB/IDANZ5nDGXN2AIpc=;
        b=VzhEtpuX8bsN3BwxU4wJxe1gVuoBONSiifwGvXzgq0PnV0y7ApV749pvElbcslMptH
         c8v9VqNbM1bGvYhfV3IKsMRa9Nxn1sBgjT5yc1bb4xS5HDexRx2/7bOI3vwgZvHFd3EI
         amSw9lXREfnfD2oOmjHDt02x3cW+tdhxT6M3p9KM8Qfi4y1pI9kzEEz7Joqm5apJw6Ud
         6+ZFXWru7fRdFNIFSnpX9BrCVU1sf0LLFl8FsaH/zNkNdDRtUUQUqnudxPG6XFtz4NQ5
         vmWisa8C1TbrkyvzFV2JXOHSCvs6Rmq25XVLnp2Wrhn3ov44Yy5ZtFiyrTrhH8Lt+9qu
         nS8g==
X-Forwarded-Encrypted: i=1; AJvYcCXGh3dkMpcgvB9cUqZ3cQu5XJL4FpZxF9eSjjtnu+MqSJhEgWo2N/bL7O11Jk8ouBy46UujsV+KpqgF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Mfw8SeonA3d/g+DvdzKE9CyXbFROLkIIAro25zVpnaaGn83Y
	4swvtl2Uy4HMfFMaZqqDWO28p6xfS46CGdA5iT8HX269BE+balb1kdS6vjmq59VhuQBwxLajGRI
	t6CGzNuSgNd285xbhemiL22GzEdR94qN1BkOw/GGy4SWLpjaOAQquVYn3PFj4sOh+
X-Gm-Gg: AZuq6aKIS+uLHCNF/qZwF5i0NLu1MCUaJeO11dhDFDNgN6GUaAjG422zwM5kTFHYxbF
	jQ5MXkZ6iaQ8/NoGhQBAr8LnVyzxbZa9IsvRcavl0XUYufrc0ytlkaCiFrvX1vW+PUN2BClxlme
	/a5qo+tMmZnjF66E6QedE+pWi7Wb6EnvSEje5IrT0+nnJ66amsgK92x/fZA49RsfysdTmQbIqnV
	H6WutO5fW5IUKXvPXvGUExzsha+wOv1RZqNiY5T/RFxhRHfHHvPGsZg/8y7NFAzs77DO7VBrMEa
	rSXmp1DTUpWUyZOs/A+Eq7jMcnuaPY6YneJ4ALqIvITEdGtkk2c1+AwVCWSpD4HTaVq1UbNBYoa
	bF94NV2JgHDXz6JbnQsr6eIYdAFRwHL/F/RWJrco=
X-Received: by 2002:a05:6a00:2381:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-824416f4c61mr9061283b3a.33.1770608294354;
        Sun, 08 Feb 2026 19:38:14 -0800 (PST)
X-Received: by 2002:a05:6a00:2381:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-824416f4c61mr9061261b3a.33.1770608293898;
        Sun, 08 Feb 2026 19:38:13 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244166f269sm9609675b3a.7.2026.02.08.19.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 19:38:13 -0800 (PST)
Message-ID: <3970569d-99c3-4f1a-9282-829fbee0b117@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:08:09 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com>
 <k2t4jm6vqkrp46reo3nhr4e5awthm4gu2crow3hnl254p33ywo@pbbdhtdq5ag7>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <k2t4jm6vqkrp46reo3nhr4e5awthm4gu2crow3hnl254p33ywo@pbbdhtdq5ag7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cLP7rfF3C5EA3AS9YO6dJbcIctqiLG4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAyOCBTYWx0ZWRfX0oBuqqta23Si
 rPudMwn/+E4OIRaLCmCdwsodSNHcMkGNY9n1/8PA/+ZMy0oqUezPgRTPsZChL/SXQ067mH62No3
 r0vltan3EHjEyD0dJPJ6kife5BX03gKWsAS5obIojYXNMkqTTNPMHMi1jBpXGue5pZSfG0oMTJM
 o3cGoYI3Zl4SNS4931kzPoqLvlIJmWyMeV3TvX+m6BXBrplpjGWgVlRr8AK2EwJKp0Uokpc53I9
 SfsJbq/I4R76GT7oD4fI2u3MxLd70e+ILzXCQZq0xHGRzc96FhpVd5Imr2Jqmb9Km0LJgr8xWhz
 fzcp5t17QCFEJYU/t5szDvCqj+GAXy5n6auhzDx2eddV0PO4cOiOPj6Vhyb7S4cQUhlmVWWb4x/
 c0uiGb2700QCW5bhYiNwwE4omCRq5CpLkyecLAvkg/zwDkcLLDnEi5/p+D3ELsQJtJiAiq/swU4
 a+SfAM58Ew8QfMc+O2w==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=698956a7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=0TJnWh_ibtJh2gTiH58A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: cLP7rfF3C5EA3AS9YO6dJbcIctqiLG4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090028
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31518-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1345510B679
X-Rspamd-Action: no action



On 2/7/2026 2:39 PM, Dmitry Baryshkov wrote:
> On Sat, Feb 07, 2026 at 01:03:30PM +0530, Maulik Shah wrote:
>> Configuring GPIO IRQ as dual edge breaks as the wakeirq_dual_edge_errata is
>> not set. Add missing wakeirq_dual_edge_errata flag.
> 
> It breaks because HW doesn't support it, not because the flag is not
> set.
> 

Ack. I will update v2 to mention older HW did not support dual edge.

Thanks,
Maulik

