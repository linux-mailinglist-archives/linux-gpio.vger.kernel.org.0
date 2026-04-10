Return-Path: <linux-gpio+bounces-34981-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPVbAmGg2GnegAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34981-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:01:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 639963D307D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8D0B3007F6D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 07:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDD1386C16;
	Fri, 10 Apr 2026 07:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6BKfLCE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8APOXxF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2931AABF
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804506; cv=none; b=M/cWWKo8McQ/3jaO2DjkhW34NDt13Of46ABoO/q6VaHY+tYON/uHSCbrV1yYLSxXfxcedbreUGQBFnItgyx5uZIvy4Z/2H5z7IIcxDzFD9ezYRMD8sjI2wvL4QH9W3I2PHHAhKt4vY4dcvaLfPlvMQSQpTgEGAoveO+drWOFD/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804506; c=relaxed/simple;
	bh=5CwLK7N5vG4M/bjssokkvdOdUU/go2GwsEzzSsaUKV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4sf0PN4wjwFtcm5vxXyLeav9Kz/NBeV4YwIyt/J0lHRP7/gbaVvVIS4+V9QueI51I27jO2er2C3PFDauNHNOAqNJOhm6yDkAXr7W7kdC1WorCutHNkIZQgdo2TWDcJdzgyl+7vamjLOkQYxTRVEtq66lC7d+73pEo7jz87ED2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6BKfLCE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8APOXxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A1j7O4115045
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3cadraVbA5x6WWtlIouIDJTFvxZDo5K1e/Ec0fRFBs=; b=Q6BKfLCEp2RDvSqY
	gTFXI9PXRmX84PCkEyvyNoIos1cKvVKNvE5E/EYkbJ1w2tP6nio7G+DKm277eY87
	SCupz0gJj/vtJ8G9N7vr7nZKWPPgkgXZ1wh91Ogux/+GdLkpukP4NWG5TgvOWEly
	0MzmmE/YJ9H6LRm8sNBVBI4/bpsZrZQsZcx/MSa685Izh/Mq0MP1CcmeXaHMFJh/
	13wsti+1G3DB1i1VZc6CbWHi7Ygy7rW6RSou2X/ZzIb91HOTDARI6/+3aekvoLup
	3bT/B78rIouR1hhJTvuxe8zGlATRAedI6bJSoZ5VErdoUIgOMd52GaR2JI9P+icO
	5gAGaQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xaqgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:01:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-953d479ea6eso2332346241.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775804503; x=1776409303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3cadraVbA5x6WWtlIouIDJTFvxZDo5K1e/Ec0fRFBs=;
        b=X8APOXxFNXjc1vRwHbhF68c8PNSlWdqJ8uaOVLr7XqbQlKdK4zYyc9CIcScwqZrjIP
         RP1xbpZjsSiNw52HU8E4i6+wYKoEydBa229DD8pvrGK8TJjRDIDtugeW3lmEORdnKDvW
         a7xChrlb/VbHWB15q+P4CYM1h1CQtOtOU5Bsb4D5ZAYBCY1YVLzQmmL3AhOLNp9W0dQm
         QjE+p1mqPkOd+3SGuWk50/luHYOTi0MagfrdwTUxy8ojfiwqjx+U0zazXaSXiqYmw25J
         eyqCVu5dNuBUhjicC7n5RsNPHlqwm8HyF1Upu9DgIyu9kFqV3FD3d0NFqztPzmSIVfNy
         /d8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804503; x=1776409303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j3cadraVbA5x6WWtlIouIDJTFvxZDo5K1e/Ec0fRFBs=;
        b=dibi592DNmXfcSEWLttYmVpMeSh5L2CAaAr1yIxL7bUT7vRqXf0gk9KpVVCmxXluUr
         9vZv5dwVurAJm9o+k3AFnj+kZWQLa9jaGc/IJPMbpcFrwi7l23eN+y4t9nbQzigHMVDu
         Kc/g57flZyBh0G+4PkQq/axlHYq9AQVKwMJ4ovmJ3yemu+/Rjlzswd4V4nriMgQIkLJQ
         CiZUB9IJtkVpkoFyag2nuGlsfQe1FDbJyX70mrZO/acB3tPBeY9FzmyCvuNleCxO3cp2
         ym/hR/i6PsfV+1yl+dtnmKhPwd7hZO6JfquCQzyyFzmKj7i1me7f/7XY3y+dkPqNkVKj
         z6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUo9OG3UjwPWwr9e17FEvlYizf8qCiJ1JntaD9f6lyiXzN5+PGJgRlEggVZ1CfiQrS8sVMGqpgHgWiB@vger.kernel.org
X-Gm-Message-State: AOJu0YylseWxKbkOqMD6KbLWMO0sDDwq1W/b24kAT9uKc+fz2zykqIwD
	sc8Q1mdprHekxkB7EbVA0Q1WBn+KG/sTID3BuhVW5fjiq1lVcKBoTL5YNd773hU8d8y2zJoN38q
	0PCYKvFIMGw5Mxhh2lLnZ7PYFpy9oTgmsIlt0NyZP3ZrayJ5g1jrHaNluM+aK9p1U
X-Gm-Gg: AeBDiesZDWhaVFYcgnD6C2m5vXP9PX9oE5pAZc7v9L7rC62OCYt2b3w/qvz3O8vIdrM
	lnHSHX0swd4v2+vHbkcax2v6LnntE3dxFwtQ8xHonygQdtLW5oC88JSnHbCHhIeESsw70UdGO1c
	H/CdkEbb2GmBtwYAy7jP+GqH20S6OaPYrb7KaIK4/jVkU/umqUqACSYwhEL3H09TX4Tr/w3eNbr
	ytO9o1L6hRC7+H5LJOpPcAWjoka+SNC5vx+uZ3veoVOkU7QsBGrSiuNmGwgczuqpWYaM8dydSZr
	YYXbKO5Lbp21blCM0GMCDc/Y5iCNo12faFPWPvzvI3DXn3rDe6Kr7nkvAbVXVumqhdFg6qLGPWF
	PyED/rT+UIjVql0jVMoS6c8fTSVZz+BKzMk1gBJ4c06ARZARfOQ==
X-Received: by 2002:a05:6102:6044:b0:605:27db:c899 with SMTP id ada2fe7eead31-60a01472c5dmr651397137.29.1775804503191;
        Fri, 10 Apr 2026 00:01:43 -0700 (PDT)
X-Received: by 2002:a05:6102:6044:b0:605:27db:c899 with SMTP id ada2fe7eead31-60a01472c5dmr651360137.29.1775804502701;
        Fri, 10 Apr 2026 00:01:42 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7d6c:c663:fa06:9ee8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm5392682f8f.13.2026.04.10.00.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:01:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, thierry.reding@kernel.org,
        jonathanh@nvidia.com,
        Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra: return -ENOMEM on allocation failure in probe
Date: Fri, 10 Apr 2026 09:01:40 +0200
Message-ID: <177580449667.5107.1202144409942234546.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409185853.2163034-1-samasth.norway.ananda@oracle.com>
References: <20260409185853.2163034-1-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX0mlFB6uZ2oqj
 oaM/QaMk3MWTuoCUxnGAVoDUQog5gBDAGDlcDnTNTqy6atQ5lDOgPTRHzHbnV/1uVyuB3El8rjp
 ycc3gJdfAONjqyPOPV9AvEmZiv95Rqw+vSPW2nbITo57QpuJUalhbA/3MMFhztfCmbcOoBoOIJv
 ++9OGfI68acTwf0uKtOdCiVXwzjEgC0a4VlZqRqIyYZ8O2PZCpmxc1tRxB+XFO6spolUHh24h4W
 wTzQXNDK0WkIuJDI4MEpnlArj3cuC957uTfizVwBqW4tq3l6Li+Jx3MzjRPl/eacn95Fdz7W/7f
 YcS/vQj/q6eLuhdPxJsXbmdZamdeoZmEtASsDLtv3SaTnAXFVauydmnqytpTlZALWk0ERM+1qq5
 GuHRXlDdZ/G2SdFckAZShX6vitu7KBRSz0S1TFcbcwayagBP+CLSWB8bIOHgdhMcTaWiSv/0DcV
 BB3mpOVMtOeo59WIjvg==
X-Proofpoint-GUID: 7D6eK6R_V3yYKc1Vv0muUMqGynO8m7Nr
X-Proofpoint-ORIG-GUID: 7D6eK6R_V3yYKc1Vv0muUMqGynO8m7Nr
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d8a057 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Uc01JgEEHFk6bR3E-fEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100063
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34981-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 639963D307D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 09 Apr 2026 11:58:53 -0700, Samasth Norway Ananda wrote:
> devm_kzalloc() failure in tegra_gpio_probe() returns -ENODEV, which
> indicates "no such device". The correct error code for a memory
> allocation failure is -ENOMEM.
> 
> 

Applied, thanks!

[1/1] gpio: tegra: return -ENOMEM on allocation failure in probe
      https://git.kernel.org/brgl/c/57df6923ca53b524d06d2347b896d9de74b3bc86

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

