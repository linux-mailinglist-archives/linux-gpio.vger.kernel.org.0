Return-Path: <linux-gpio+bounces-37556-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHw9MECkFmoOoAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37556-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:58:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6654F5E0BE5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4118300EEAB
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 07:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADCE3CE4AD;
	Wed, 27 May 2026 07:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZH+asxex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1pWLOJ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49063CDBD1
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868732; cv=none; b=sQrrRWAF38Yph9ujA3qkGI7eRIHlgbbA30pMSKKaHHXvQWHY+BH03aQNnQXoInTn7KN8G9PLT524OpELBoXBbZ5vg7MFF0c+J7U3xpPfDos9gRC9TcRamU4gh8z2+n6BfyS7CA2Nhy/pQgcDNcmY2OeBljGiPZgQcxb6fUfT1W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868732; c=relaxed/simple;
	bh=NSFEVSAiuz4nw0sK5rKcjrXCQG7EGOMRPVeae91BIAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jkdL22+ODNtMB2OF9LdNZrjx3u+BmWq1lEk3KZhSUXekNVXjY/MlkA1d1mWuRmEugdeUTyJfs8AQS6riCYMySqbW3OVgk0tlpRZrxkn8uFrcaxhOVsRTXPT0beOaU0izxqG95PA/MZFyVVqzTIrwieJDGupxnQg/3rKNBc8SbDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZH+asxex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1pWLOJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2XCsr033903
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYdntofG6bKmr529zSlJ9/2d9dRF0qQ+5hgc9234RyE=; b=ZH+asxexZ19/dSW1
	xQ4eb9iRqW/2avDTIcwrIeN0TVZP9FmZPFL8oF31sahWFIz6waZR0PfV1IJy6A7x
	9dKL07Jy2ujfJcD91voRAWoEKK1NbC4tcAN42nuOTp6cqNxJPsrf73RLAIaEtd5i
	BrZYj9zjJFHiixMZEcIypWIncmqZAc7ltjYEZ0jjLpS4uhq9J9t61iRxmTzu2xme
	ndbnOQOv9C8DDgbYLK/ZK70SQpJ6NCzvAzQUsqgI+++4BVfHGWWRnSCA5pMxsrT1
	7aIC29YRA+TDJpBIh5/AcHljKMCfLhRSzTcm6Gop+KRnBlBPskhIb46SzKVJwqWg
	uS63yA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnukas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:58:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cde13e8cso120718981cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779868729; x=1780473529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYdntofG6bKmr529zSlJ9/2d9dRF0qQ+5hgc9234RyE=;
        b=O1pWLOJ8ZTq1z9pn6R4lcmxqo65KrFeJHxqniBRYMZAIW77ViQpU00RoPKa669C5Oo
         wPxvwPOn/KpuwLlRUWPn0TzTM3ETJm61xzGaFZ97HX6lZUwkz7mH7ePyT5Gbnx+PZH9j
         wes35kGfvPl3xTncn9oIacxfkZxgyI//G2cfcSwvXGN8o9OCJ/9qVZ2NsCkjofE4p7bh
         fouNQA4f7UvdXkFsab4KO32ny/rdGSzbURBwXSzmkW9c1vudwdw9ipNfqe6WyvQhlVDj
         j0oLtvA4eTI+cmG1KR05mVpIpIN41W/qyfgq+6V3H80YRGpLZVb100tqWZbyjley4V+d
         6MDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779868729; x=1780473529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HYdntofG6bKmr529zSlJ9/2d9dRF0qQ+5hgc9234RyE=;
        b=VBUWXQKtvXE13qAttQLv1PjwtvyJkvfs1LllGurSjUQbQdZ2klDQuHOOWNPX+7q3pj
         CLcRfBE3xXu8V/WrWc7FZaPNZrcNWAb+qYqX50G2JkRO22NSSLhqNG5zd0YExGCqt3m7
         Ei0Lxg9O3UhCAK7+hwFImXXRt3TeB3keHCWCIW75JkXI/6KVOCGETuSdT0It3Mg9Kdut
         kp8QPXcumkiLAQjkI3eKj55r4S6DjYFlmIfCRH4MuKIgRvkKOZ4534nDDUydYBmdNAPy
         CKiBhZat3Nbkkj68o3rrcRL5ePZAiEBgDyzANQQTt2qCPRWahFUYvLpLFP9y1o9grxzH
         C1Bw==
X-Forwarded-Encrypted: i=1; AFNElJ8t+iVMYVeHIb18VF+bfmpWoUhdzVrZ/eziW34Msv4oZF/4R1eoI6aywhcI5FYZKV/t+TzL20yKHeZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YzhvE8eNqVG6MU5Wf3GtoSmm87d+xARnL8nINBK/FP4ZYnMzM54
	SL5j7WKUspu7zl8qgqmD8LYpav/KHWmPE67WmUP0kkuJL6dG3LPPsuDcsnODl25A7cfUUBPsAZF
	RA8cFxTEnLHJPUsaQUNIePXaNrg+o2AuXTYzJI2XUSz/du8TV/t1gVpdOZlVPegzf
X-Gm-Gg: Acq92OFEqfQ6dsfU4/U3UyTVUVoZqADJU4kxJ2xaW9PM4MLPGh1m1HBsaPHtOTJTcgY
	H/5Ckb50wgGxhyttKeN0nwI4hv0rz4ofju3kTqeeuNdejvdyxq9tWR8zHry3XwSXmItZIyng24V
	WPimMc81jUFI8bmj8ckJpjw185M3zTwVNQ3U20L8L3/m1T8QWgPQOdpnzNl7yQihPv59w2UHATu
	UVrxfu6CP7RM+Qw8mI9z1bBA/XQNcI01PMCvui/zKF3jZibMKnpVxklqN7Om+rVvsPq8K67ZctX
	EapCvMSQFEJ+SNuSSGZWpdkwwJ2N8lTmgbBEQ+9tkR6/28o4PbizxiLu6VcTH/uR2AwLmjHMwtI
	79l1yntM1Jvmbegv0dSOLlzY80arSg+tIt9ryVJpWBz1KyWpa5YSO28q5yMac7P1Mn03YPhY+Lz
	cj4DeS3ik3lfikU811TczWJFcXp5SnPDQyvpm2W/I=
X-Received: by 2002:a05:622a:1f1a:b0:516:ea30:8756 with SMTP id d75a77b69052e-516ea308d3amr192375831cf.36.1779868729014;
        Wed, 27 May 2026 00:58:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1f1a:b0:516:ea30:8756 with SMTP id d75a77b69052e-516ea308d3amr192375671cf.36.1779868728605;
        Wed, 27 May 2026 00:58:48 -0700 (PDT)
Received: from brgl-qcom.local (2a02-8440-e500-3194-8c70-1be9-4d87-8bf7.rev.sfr.net. [2a02:8440:e500:3194:8c70:1be9:4d87:8bf7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb4bae01sm4196193f8f.0.2026.05.27.00.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 00:58:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: ts5500: remove obsolete driver
Date: Wed, 27 May 2026 09:58:44 +0200
Message-ID: <177986871156.3841.14309991307984411037.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526103424.3246915-1-arnd@kernel.org>
References: <20260526103424.3246915-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Vp4syS-DbVHtMfltokCszjXaN5TBKxGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA3NSBTYWx0ZWRfX9WqyeDrBBQXC
 Ss53amh1t4hH6NDNZzdDRsbyjOgDLLZnpomwFPcWpmOb8aSXbpB8KMuMlyDmA7VUaeoVpb2Uf3c
 uYZfcNB2znQ48Y+FB+/5lwnMYNM4dUTSHLElCOiX4Nv7uxjAbdDHQe+KXbNkCdSUOxAWHMWsc+8
 b2s0zp6brpjEuo6tzSSb/0cVAT+NV660rOtUBgyMolJH9MdlM1dHmBsVHWK1OcewRqvkE9Hwp4O
 uT6nn51s6mW2xmmfmmOPndqNQKLviMpxLkQ0LKT17I8L5cuTqNZuxfAvp7dxsF0jqq9G3DaHTVt
 ueLBodVe5usubZiZ/yK14gDbwMbA+9EvI9K5BF8h/SGILEaH0m1A0/+jP03af4jQbUK3HmP0jRi
 yAvU7A5tp0inKYcIURZtJXvMQ6RWFgfcHOm8AXCDr6+LkxCabcqsdRsTEjUnj7bLYnWulZPxakh
 TNgS0loMIjW99110XJA==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a16a439 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fKa7eDpT89N4I45PtyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Vp4syS-DbVHtMfltokCszjXaN5TBKxGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arndb.de,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37556-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6654F5E0BE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 26 May 2026 12:33:54 +0200, Arnd Bergmann wrote:
> The ts5500 platform is no longer functional because it is
> based on the removed AMD Élan i486 SoC. Remove the now
> obsolete driver.
> 
> 

Applied, thanks!

[1/1] gpio: ts5500: remove obsolete driver
      https://git.kernel.org/brgl/c/cacb104ed9d4c8dae46029b21f481fd132b3f11e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

