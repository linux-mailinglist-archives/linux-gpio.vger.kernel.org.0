Return-Path: <linux-gpio+bounces-37202-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGp7KQ63DWrC2QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37202-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:28:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E85158EC25
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D62573045091
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 13:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB173E2754;
	Wed, 20 May 2026 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUsdQLyc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REe/X9YY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9CF241665
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283535; cv=none; b=XADEyVwdYLyUZxbuV7KnOpwL8JbpkHwYuyM89y+74U/GR1E7vI+quPOxZ8V5jHgMzJ8zw/b2bEg9PaVX/rexAA2VIIC3OaJzrMpIwbyaJMty7Z0DOj+vxxP2inc09CfUXi4NRFHKEVPWLpuD2nG8liJNy5D2fo6mzMPiK3Q0pqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283535; c=relaxed/simple;
	bh=cnEiN1CxVPMWy1yZ3FnAkxYejBHDlhHRZjJrLNd8RLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByljpmcfzUbqF3yLeaDIjDUlzdYJ1mbcJrfzk0rXi+mYaTthDXFRMiLDtFQLHwqR19J0kgts7t61VelgaN/htZLu8ODeMLz5joAeh5HkXOepooThjE5LDpC7CEYa1tDfJQAJUSQfPEwwBycBRe3lV5CQsiWmHF2EazXc3XYgX8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUsdQLyc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REe/X9YY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCUB2C1725558
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lliHshHZiiVDySBU2uweDEu+fUoldHOSfZRk76G4+vg=; b=MUsdQLycmx1mFteM
	5iRBPIGzCCexYmy6JwRxEbK4LhKpMEPTwVq8KVdx5S0RVX1UaWAuEEXemm3Bxi7F
	TdA0np/A+Cp7uEqxvDyQTOHV9Fb8s73NATer9Usiywtc3JT3JWW9g1kFtUB1iPd0
	cV+2vdBsLINJaoS0LIrVyanuI6IxUi3qNZQyLzC+VgneMwpwo1PuA9VJZqRxKR89
	X7dQR2Gt/zs+QraXy9nTSO0L5Hghz7oqp06RG6j89Ucq7PJp4/Mpm/l4EkplPZ+Q
	TpKvP5wpdKUSVOlQDO5xqrFsVIIBAJ2gZeC6lBJQN/iY06hlNBlv9UtKduaC61OW
	VVqj9g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qmwk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:25:33 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-956732444ffso9254764241.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283532; x=1779888332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lliHshHZiiVDySBU2uweDEu+fUoldHOSfZRk76G4+vg=;
        b=REe/X9YYQoZGMoiQf8ikmK/iMNlLMdPOSOXOp6PofcHpSVFw/lh8Wvdmahqfwjc99l
         JwUwrf1DwJcmDsrWWAqkqa+aHGTSCjBJfRnMhg1Y+lD/UYYyi50LeOhfUPcBPqyleP3a
         kil8RvRO3XikMZoEXzKS/vQuV7HW3RJwFG9NDT0LQPSXg1Jp5V8oZ5CA6Fego0583RVy
         f6Y6h0kSUskrRIxyclOKHSeEi/71a23HpRAdkJZjJ5Dr5S4WPnWpnSL9gEbj/1dRx2B9
         Mvv81YyMiHYU7ZA5pT5Np9JcDmD06+51xnI7xNzJ2zRlbUfOSUimNqUErTWCaae9qFBV
         o6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283532; x=1779888332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lliHshHZiiVDySBU2uweDEu+fUoldHOSfZRk76G4+vg=;
        b=Kvoe7RltPNETZfc9MiYSBOhYWRtDZ1coVbhnaHH6E+fUzlbI2lBZmFVs0pcImSSGc0
         wxMN0zMHWOSkdau9bhn7u/dvILb/N6q18TczZ7+WnY35gJm24PphAvikfW8f04CXCoBC
         Tn1WOsgjy/hoRW6Tj1lFOEwvC/pet/wLJQtB6b7GidLw1TJzZqbchJJRL+pragL1YA4R
         sHjQUvROPl6mhEb5DW6mP96eIJMvlos+XYLYdGWOa9550tKTN7ilL85NOMw2mmByJpVs
         8SCz+Ab7S1uRb9U9dcJoJDNWqxHZgeYdU1jaLdOhsdoBkzhv6VnZ/ugnFl81DDn2l6PI
         zw+w==
X-Forwarded-Encrypted: i=1; AFNElJ+TXTEkc5IXfzeNMptQogV13mIU1psaEV3nCk5rYYvKkoI8Q/WDPNqKwKhfkssG49AzaTvjcNTj35Gw@vger.kernel.org
X-Gm-Message-State: AOJu0YxTOyTgTzULNt5p3FFH662IaxpqaQwSm5woaxscvqY632IWLXjm
	VrpkhctI3F70E7gjiut4zSJ8Rg7UOpN1BrvVIzwvju03wH4EFwjEuKB8Ld3OneFAX/sAJEO3+7z
	800MA+Do3S71kv2wWQGPuaBmi6a4qRG1mOBS0MYz7m/z+zKVgijXjrcZxeC+4zjrW
X-Gm-Gg: Acq92OEnlP65qsugFsLj0dbGH6jF/RG5xnenKxUQSY1bh8J+wFISBRJoiduLTxxEkru
	DbO3dZItl1vWvTi8m5MUXOQqFI61E7y/jk0DeBhXqukEqChTGWcrWxoDbgj94WOyDaQN38TkkPs
	tQq0uN+DmiK8UmsU8mke9UObWsA4IWY0VMia1UAwNIy1Zfopvi7qO2KtQghJMeZBbha6/iDLeni
	H6BdJwRUJkF/d+WXV/7skjQRY/9EKi3MTBYq5R4/7+gpvKuD+IQwqQYiK0pe+7D0pv3mubMTtLA
	S6JmSvYR0L1lB9LJFlTVbSKwhVRHylNxHbFBbIkO8WTpyMsKkR6aVmCe78rCSsuf4e7jlXSkKrk
	VMDXyMuZ0rsA56BqnD5q32SjIfxVqbLdI0oTJgkb2p4jf1AnAIw==
X-Received: by 2002:a05:6102:50a9:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-63a3ea7d313mr13084968137.18.1779283532229;
        Wed, 20 May 2026 06:25:32 -0700 (PDT)
X-Received: by 2002:a05:6102:50a9:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-63a3ea7d313mr13084923137.18.1779283531799;
        Wed, 20 May 2026 06:25:31 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm127925495e9.17.2026.05.20.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:25:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Initialize all i2c_device_id arrays using member names
Date: Wed, 20 May 2026 15:25:25 +0200
Message-ID: <177928351980.51371.9171677884142523111.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520074812.1632512-2-u.kleine-koenig@baylibre.com>
References: <20260520074812.1632512-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX+9pcp4t8AzmU
 pCoZo0+Qm9sMsbr79VgZvwKNf/bQws2yU3ateMRpZ/HcFH9RhO7fLcCHj+Ldf5O7ipWOXGoiQ9b
 HvlhCvRX5gHLDro5N4HRMINDHDzq0VhSHBS2ZsGHyK7HwzM5DLltrckCkjpLaMvpCZgBhjE/MDx
 jGuZ9881/NV+Wjq2cDWElztSdnu2yJVzQVMpK+VmcQGVrCTgdk+4tb4dWttC8z3ZjFBSbyh9nhq
 +Th9YNFtP8iythLjp+BSr2tcx+Py4WLyjJhRfFxkHvUe04A799hJugNJo1ETUukrinD9+106vfz
 JnumqpsqpsSjdlKgJcWRDNzKt/gd/Ajxc2LiILDbvDrtOGQLCniO/y6Y3lXMJRJhbdd3MKanRj0
 rSJdE89UC5sJZ6lA1zONsnLKx3Qep9HbaQ9ioGgVx4edyKsOJxE4j8EUtMwaTGNhtJ8PcKOGRHb
 PvkqEwl3+1oVGok8NXw==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0db64d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EE3jfmZoKUJSNBeX0jMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: xzmhK-M0qh9rRZB_A0mv6hdEcV5Fh6CW
X-Proofpoint-ORIG-GUID: xzmhK-M0qh9rRZB_A0mv6hdEcV5Fh6CW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37202-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E85158EC25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 09:48:12 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The previously applied similar commit 553e26a45e0e ("gpio: Initialize
> i2c_device_id arrays using member names") only handled i2c_device_id
> arrays that also have an assignment for .driver_data.
> 
> For consistency also convert the entries without such an assignment.
> Again this is a modification that has no influence on the generated
> code, it's only more robust against changes to struct i2c_device_id and
> easier to understand for a human.
> 
> [...]

Applied, thanks!

[1/1] gpio: Initialize all i2c_device_id arrays using member names
      https://git.kernel.org/brgl/c/c010a78304a648fd13556aff63e60a83f35d23c9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

