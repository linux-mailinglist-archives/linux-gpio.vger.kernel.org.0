Return-Path: <linux-gpio+bounces-39587-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 36SRAN3zTGr9sQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39587-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 14:41:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B171B71F
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 14:40:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ipf+ITrc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d1k3UHmF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39587-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39587-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA348305BF6B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 12:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33D241227E;
	Tue,  7 Jul 2026 12:31:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A0540D59B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 12:31:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427470; cv=none; b=rxlg4Qd3M3rTXxSlSCMEU+JcBN0MWsHO1bbcSc60Znb1ocYl9eF30dY2oFt+SXB4XgCzgrhlWIYjHHBXwqqlCcqc1SK0Hv5622wdCeBPbNf6JlNvOJfMuWUL0qVhmIH4jttQ+kzZJr6G5QFI9ytd0zLSHUIBnge5GPVZtbUGckM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427470; c=relaxed/simple;
	bh=1UKYtvpwXCuwDHAO1dMcDKDu1Wf3P63RbYXmOCqQq0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rq5C+zQ9ikpOd7N30KaN2+3qmX5lfcaht/TjR6UYmRE0I1h3imNJa5nXbK6tBWIf7szamq5FUVu73pnAwsVfTnixTYilr2Bg8xwqQ+c4o40gprClRWDsvwEw6hgB+M5ka/74/GAznrDsmKBUNL/97HYANfVrfiVSrH/zbRYxvD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ipf+ITrc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1k3UHmF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9Mxr3740915
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 12:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QWE9rusbH92tP4wYoHbY3wqrLZESq7eroeDKkdKE30=; b=Ipf+ITrcIrZuPRDX
	gx/M8F7GRPUrle1fjxLHLJQ2KuQ/qbjHLJDV2Q7/EA8mrnOndVF1KiyNqjtXcbrK
	VaH1q75bQzgxJbHOWK3UdkZQCVJRjnqr4B9If4dxQQmnFYrRQ6J1SSdXbjthty5m
	22dkO5DQ4Ciz6a1ICDwLtlsVKtnKpFPbZuk7n54wDOXCpGRjjwG5NRxeZkh9Ciny
	lEZ65wX14RyWD7FnDHlw2LktYcPpNyNfVpKauM1N8VbjjLFlloxpEvMYOmRljKVm
	gwBWVk+0XH0qkgMR74dR+KyZNHhgkbqcWm3Xq2CenDguXMOzcJErSvKHZww1gLHO
	t2d7LQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9e67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 12:31:08 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7383a52d9beso4023360137.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427467; x=1784032267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QWE9rusbH92tP4wYoHbY3wqrLZESq7eroeDKkdKE30=;
        b=d1k3UHmFI0nF+ko1uCk+Rary/BhhscDEHWgFJOLedB48PBsvXbsP3tn4F+01PMB3l0
         7+KEX27pcJGLyWkwejo6rdGuJ2rjEQi2bS6GrTqNjnBS7cGFrtp3PZETiNRXnfWA9ewd
         Znj3NgMjcwwVGXl3MvERdrlUKhP1u4OspLe2eXqOaxVswb7hNedAMPfVmA0gc2DnfPCe
         78vllISWJz0swqc0vdnsHupShzwacjXQ5FKDLWurnbql3uG85fLQV+T2jmw898f+oILq
         K4NX4tVZzzQ33UJ+xIwdubDL8mMIFYl57TSDfvpeY4CcU+y/8HhRpU/4Zi++MJAUBR/Q
         KozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427467; x=1784032267;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QWE9rusbH92tP4wYoHbY3wqrLZESq7eroeDKkdKE30=;
        b=CRMvf+rhg+nZMzZ4ynQylvqPkcrqkEtXIheGTsX5pR50QgIe69ktWY8WUS7MkVwLun
         A/hRCB2H4Suaqy0Mf5X+AJ9uw2A6yntxUE8fNUz84Ay0GAo9eF212mmWwoecvR4kDkK+
         KX4a7SWUWdwoLmYOVgXVuL2qu0zuU7FfpmL44/IJMUlLx57xwBjR8Wci5+3lbBu5+HnD
         72iHaZagA/8M9hHaltpJi6r99SUJg8x+LlS0/1aSh5RjJAkHfz+TOp8wPFZmc99lstFG
         Q5g/4XPM86k6IxAne6C8M8OR4lFJBAcTyKGlcA6U3uPhpOztcv3WDxVlKUQ0yOz3zzrL
         1YJA==
X-Forwarded-Encrypted: i=1; AHgh+RppExloKd9WskfcsNYeVJ/t8hwEiGrvaV+J+P+jH+GXyI8eJpdqyxQUSWo6l14C/wMxCZhTmRAHYUSl@vger.kernel.org
X-Gm-Message-State: AOJu0YwDqzTNWSPVGWA08IkK3gSlOzL/LY/bddsjpB+YjOK1lxkVSyo3
	rj0pVD/gbMrn35DS0V+kFS1pkAnbpnWf5bGU+JUhg/d4RdYDc1Rs7iGpAD+TfxvFWgG0+fPEkX2
	l/sp9ZKTqBcZFED+A5WnkI0Z8YPr+AM9GtQYLBe14j62Ncw6BlKQnHDNfdMI3+VY0
X-Gm-Gg: AfdE7cmS6DFsGOw+Z0MouFhWShS6jEfvpRacTkgK1wbiyQTQF7cMFwpnZFJAVBWKTaz
	p4trxvi0Odr5Z0rWJLwGZ34Vt3Na/9gjNYFGLyj//4rbmEy3nzXrMPKe4hZRWToKrOJMT5r8bFX
	bSyliQWXM74JYFROCHt0F0VTYhe6dHnq6CF1q2ALUy/2Qga6OgyPn6vXgWcQGMIw8bWnFL7zEPF
	eSl3TZL9PkIR+Q8PfOmaGzZEspm4klK0hmEkMZ3u5dx2/lsQIT4Ot5LKpuZT7yhDi985K9FzzPA
	KZZz4b0LWwbJSEQHUM0rbfwO2DfVoady36SyPocz3Zt92rvcBGJYQ5IoRHmvnUHQiD8aYEjqoWM
	Zph7CSVyusgeoW+ly6IQg8cMFZIUKVkTY/gTJhG0=
X-Received: by 2002:a05:6102:f13:b0:726:9f22:cfe2 with SMTP id ada2fe7eead31-744b7e4e831mr2534967137.26.1783427467439;
        Tue, 07 Jul 2026 05:31:07 -0700 (PDT)
X-Received: by 2002:a05:6102:f13:b0:726:9f22:cfe2 with SMTP id ada2fe7eead31-744b7e4e831mr2534944137.26.1783427466989;
        Tue, 07 Jul 2026 05:31:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:47a8:72a4:c756:37f3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482ebsm122911666b.61.2026.07.07.05.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:31:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jia Wang <wangjia@ultrarisc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Hoan Tran <hotran@apm.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: dwapb: Defer clock gating until noirq
Date: Tue,  7 Jul 2026 14:31:03 +0200
Message-ID: <178342746086.38309.9285122954144010633.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702-gpio-dwapb-wakeup-v2-1-203f2f33429f@ultrarisc.com>
References: <20260702-gpio-dwapb-wakeup-v2-1-203f2f33429f@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bedmE3LWUFwUs-EM0mBIjqRCkVHO9t4e
X-Proofpoint-ORIG-GUID: bedmE3LWUFwUs-EM0mBIjqRCkVHO9t4e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMCBTYWx0ZWRfXyJZHBM1bUTdm
 6CMLVy/oVSe52Fhyyq5wUZHDfIFv79Pmdl6tMjiQ4l89EFvnFzLL0zLMUmeHa666MqlfK4DQd7C
 mY/x8pzG6vHy75ZY/iNJW3gpaob/98Y=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cf18c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=I5DIT6F5hXfhwvNZwT0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMCBTYWx0ZWRfX92x91pGJ6foY
 SaNAB6BLnS3cv1841rq5zNtbYN0lB4FZssXY+rnqya+Pr9z4vYZqpD82nr2DXCIhAZRDAA+7fgo
 38Bvlljtj4Abi3xXdN/saZG/OH+PawOSCWL5TxyKkTwHQgYrRLkWIWp9XH2I0OUzpkAmWL+jaji
 6C/8GsTFMPm+cx0GyNCLFOKJGRi3+VedbN19nciaswWdssUVAPqPFB96JJWG31pRab4bMzzLcS9
 1ynKB6qH48beyfxv+RKVkpLJZo6x9EeAj2SB0EUZzTYQAHES9jxeQdS5RswbpND5tr4QSeFeVfl
 spmquUyhCAzRYQZTyJTFzilmUCkUZfLzneNDmUo0YUzmI7RQQsH0meD9gkEULFRSeilRrSPqtfp
 U3xBA+Q08GO2omHVfmBt6A1ED/F/buezzfcuLAiMg1bU3koqZnhsnjDMQKz0DDQ+cpwn5DB8ES5
 ox94YTI2+KOSrbI0vuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39587-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:hoan@os.amperecomputing.com,m:linusw@kernel.org,m:brgl@kernel.org,m:wangjia@ultrarisc.com,m:bartosz.golaszewski@oss.qualcomm.com,m:hotran@apm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD7B171B71F


On Thu, 02 Jul 2026 17:22:12 +0800, Jia Wang wrote:
> GPIO consumers such as gpio-keys can enable IRQ wake and adjust the wake
> trigger type from their suspend callbacks. If the DWAPB controller suspends
> first, masking interrupts and disabling its clocks in the normal suspend
> phase prevents that late wake configuration from reliably reaching the
> hardware. Systems with real DWAPB bus clocks then fail to wake from s2idle
> through GPIO keys.
> 
> [...]

Applied, thanks!

[1/1] gpio: dwapb: Defer clock gating until noirq
      https://git.kernel.org/brgl/c/d775b9451eb8f52021dea6483ad758fef81dbf1e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

