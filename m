Return-Path: <linux-gpio+bounces-32023-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KmLAJUknGkOAAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32023-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:57:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5017463A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7B25302B222
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37823353EF9;
	Mon, 23 Feb 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjRnBuE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVW+hmLb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDDB354AE3
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840652; cv=none; b=mf76s1ZAeB7TTfRjQ4afoVEmNMWPfDknWzzZ3dhEtliQqDsLbPr/hAD5L/35I6a5nr845qivsSmMz+0Av53gi186ZedZGulS+S4F1wtEqxxHddE1mtFc6KmPNDjAlbjm1Nd659a4VWvbkTlhNo2js9RmtjTDTNxTSzB56+FkOwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840652; c=relaxed/simple;
	bh=mFmPhFI2f1Acz2yseN92iZsxDEkYMlxnuDPBGQZDLn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgImoGAtu6i/yuBPYk7OeT5Jl7nQ2J2COUZiO9h+S2fNsA1LpXEoNy4XF7Zity+fQbw8ylPUxB6hnRZ67yEfoH4UWh4xQJI8TzuMc9Vw7Us/Bmb9eFqWVaVt3iuql4cLZ6zWyFqbbS8ZQ2TL66FCyK42RJZCacS9vQRJj6CLhEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjRnBuE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVW+hmLb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7evuX1745021
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSAuhEy/wfR8el4QBzajfY3+8FFflOc9RdizmIC3Azw=; b=FjRnBuE0nyi8xigr
	mKD48VF2fstEAWo/dknUbGHCHIaKEXCCg1feJbB2JU6deR1hXA5S+flpzqSPzCUT
	Uzmm13HeVtpChsjhSlTV/xhc9itk1Q1YQ8PbcdWfZy9v++2m8NzW9sYWG/i1vF66
	AmcCLOE5M5rBZIufdA2yYe6pZA+p4v0POBCq2859W3uskJXuUkIR3T9OJBFpwxEh
	xc+SFYZcxqshDqejHgI0yYneQGozPIp2gQVanc8whgRk8MNc3VL9IR1yziMpgjD2
	Gm7B4jI267bfrm2i7M4OJAafLg4O83HmrSl6qxi9kdIUcILqAhgwgADc1br9PnAH
	ymRG5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgva18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so4163155485a.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840649; x=1772445449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSAuhEy/wfR8el4QBzajfY3+8FFflOc9RdizmIC3Azw=;
        b=hVW+hmLbWrp3ge71E4uC1sZBNACl+Uc57xxiG4naemct8dr3p3dwkcLc5ga5HKkT5v
         fqoL4LehGVYCHeS81/jeBAitvCSu4TOYKw+jDKwoWZfNUQYZOx65ixbGK0o0QIOwXl3h
         AF9lEo5JoyNhIV2yhd1JHS5AEjmpg2AWJt0+i/AduRDNe8RCEKQ8GWkt5myNLfnDr0tY
         Fo24otFZEujZqT+Jj+Bnk1mepciBZaWrDavXoqfjtHjBXIf2gWqIEkH8P0KUxcjTXwMH
         VbsxoaRyf8fs3d3xnSDsXsrIhUquFNHfajdfs8IhPUUEGa6Syir7dI4tVJQm4yIteBVH
         pQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840649; x=1772445449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSAuhEy/wfR8el4QBzajfY3+8FFflOc9RdizmIC3Azw=;
        b=DVeha+W8Y0vWDhYHqhoKU3vYsFRHlJpw91l9J9Bu3qUXs9pJ1jWHLEySe08TYb+LFi
         lD9nHr62+hhdIGfXyj4PPegT5ekC5AUmzde//0u6fm9OBczfiKA1Z0Dm/VPFMzLBInxS
         MSXhknxrp+tBrdPVPm7ZyvTja39qbRvD9AqvuJ6NYHIMyS2piKCWsfkcG3LpUDtkkP0b
         PVyPYDXRthHIn2DMw8/kvHwSNi9qTw5Ji3mYxYeJFYR599K3YzjDOFQ4eA2t6BZlPKRx
         CkTUIcHZWhjerS3P4UZNxmPjZg0HE/djaA6pKtoHV41qI99kXX/WimxZSjNr7U+QX0ST
         a3EA==
X-Forwarded-Encrypted: i=1; AJvYcCWd4JnKgyIADShkgEjvSs8nYrp2eZo/2i11YrtK29Ay2fzFMQQQdzLNiCcgP2WJDetZBGRFNCtBx0m6@vger.kernel.org
X-Gm-Message-State: AOJu0YzxKyntHSR+D+TObqwNL1nIpYfIN+T7pslKUXxz2Ktl6qyi755K
	BwmJGNo8gEj12etTYp5tHBqPsDOl8FNkezQGrP15TNoxwKHdCT6yl1U/kKr+qa9Opl2Yzq90i06
	ASutonnCRMAWVOkSWla75uCyIzR+cA2HsQSkcAh4kgk7fQmgW3Gk7zbs+haU9Dy340P+R981h
X-Gm-Gg: AZuq6aKsyVumyb1MPbsauBPDNbmCxo3ytJhECFGurfOXUyhHL1Hi9JoUkJAhPFnH7Gx
	F25tsEZbOLNeOcKIrsDXmPeAyNTPPDX+PHjLWSnDvprfxdOlbefNkVzYdidrJyjaUdauW/j7/es
	MEORPss+Ht9D0N9qjtaIp02Q99A8GIjQTFsYzyfB2CTzX6t15p1e9pMK6saabJ1UrHtS4nNtRkL
	PvnDqFVLEH06nauHPsBkoYCm1/EHQPNosx2VnxSpJXLz5pRQineMQF93kNSno/d12k9RGRiXKr6
	A+KLBBvxsNxy37qmlXsuKp6pxyhH23ASbUhhpOM8oQeVbIRnbpSl/X5zVM61CNbfzXEDJ+VaHum
	1GF3B7l3CnMjGdOWiAn23SHCPV/LgLfJ+z57yveY7xu1JHw65ErQ=
X-Received: by 2002:a05:620a:d84:b0:8c6:6e2b:ac1a with SMTP id af79cd13be357-8cb8c9fbef0mr861888985a.28.1771840649185;
        Mon, 23 Feb 2026 01:57:29 -0800 (PST)
X-Received: by 2002:a05:620a:d84:b0:8c6:6e2b:ac1a with SMTP id af79cd13be357-8cb8c9fbef0mr861887485a.28.1771840648741;
        Mon, 23 Feb 2026 01:57:28 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm275752805e9.3.2026.02.23.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:57:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Doug Berger <opendmb@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/3] gpio: brcmstb: wake-up interrupt improvements
Date: Mon, 23 Feb 2026 10:57:15 +0100
Message-ID: <177184063423.89486.13285732205335253549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204164333.1146039-1-florian.fainelli@broadcom.com>
References: <20260204164333.1146039-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXxFpgt8MvhhSt
 AUxnD2N7Jd2ipkkJ2/oAxPCqwccOJP9ZIwJ7p+LjShz21NPDAEoFraAQTESGNFVVaar5rjYmqzt
 MIBCyK+jZeWTqdYr61kTDyiR3wGMdMb85POBDSZK+ymOO8pRMmH6WJkotforW+LHHyErJ2hnSWZ
 R+CkfcvJHGxUYGhU8WRqmEH5ib1wTdurAFpkhirkInzeEpFXFPklzGJv1Vu9th02m2BvYHIeo02
 3drBkXrQ0MKKuB/tH85LXEIevUs/bAit5tilfZsP6KDx6MQhjKhJkBW6bDUKcskGlXVmWanbRqO
 AY5PPn1Jd0ypHLLrOYtf6J6aS+UZba0Ha64dOWNoCx67LqaB+riXYE2OR3qydnQ++ZfCJUNtBm4
 wr8yuFRIiHTUdQyUgMvMp/4SfKnsZmdCWKmfbACygOSb4NU4UPALr/rzI1YeyuFmaz7ChUhO/av
 HRpwcC9VJ2MHBa+ks9A==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c248a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=T0f4Fs0Wa8uatueTJocA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: n7S_7mQ3buPET7fk35Wz77ZTRFkXNx-c
X-Proofpoint-ORIG-GUID: n7S_7mQ3buPET7fk35Wz77ZTRFkXNx-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,broadcom.com,kernel.org,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-32023-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69B5017463A
X-Rspamd-Action: no action


On Wed, 04 Feb 2026 08:43:30 -0800, Florian Fainelli wrote:
> Changes in v5:
> 
> - collected additional Reviewed-by tags
> - utilize irq_hw_number_t in brcmstb_gpio_set_imask()
> - clarified that irq_mask_ack/irq_mask/irq_ack are functions
> 
> Changes in v4:
> 
> [...]

Applied, thanks!

[1/3] gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq
      https://git.kernel.org/brgl/c/5711ae6de0646dcf5bf90cc9d4d7cacd34896472
[2/3] gpio: brcmstb: implement .irq_mask_ack()
      https://git.kernel.org/brgl/c/66ff5094240e6e5cea743f5e656e28734de31f1e
[3/3] gpio: brcmstb: allow parent_irq to wake
      https://git.kernel.org/brgl/c/2c46f19c9adf7634d1eb4ce89a715ca3b0374134

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

