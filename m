Return-Path: <linux-gpio+bounces-38665-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t28SL3SmM2rXEgYAu9opvQ
	(envelope-from <linux-gpio+bounces-38665-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:04:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE7C69E529
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:04:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oO7GsKla;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iISC5tfy;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38665-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38665-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62E8230F2972
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9473603D7;
	Thu, 18 Jun 2026 08:02:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF23340406
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:02:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769769; cv=none; b=DysMYBsNVkeOe8I4tsJZgUf8gsfiHLymPxM9iw1ZTA+iCZWxEHvOSaZGmMai9m1KC/XtH8//eDyNTU1dCKFjDto5AGrILhuBcN4RaSeC/JEkVFDHA29OlvHmOTyWjzYTMp9FzCJQf3aO9jPbkDkaWSzctQeic7uJ5R7xPqlCYeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769769; c=relaxed/simple;
	bh=gIgwg07NhORFUo55PNg3iYZiB2iaD8bFHZEEN6PAB5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EbN+jadWTlikPb8pkG6qGD9SXcgYXH48tJD84GAeBGnCDIdpUV4HieA88ssWg2yszxdslpLAxnQJHdMKbHMy/SSVcCXzUQuRdiF5Ue6WKZrcT2HVfbGkICyDMmGNPrM30fONLM9g+cnixV4PMnTtjdT0X2rhQN638U1CGfQgcTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oO7GsKla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iISC5tfy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I3KgxH2976524
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	19ANMkk1VCbapB4V6x38n8KnLEFh2G12hOsdryCZYaU=; b=oO7GsKlauran9N6W
	4Eyq7Ds5xg+WIMIggsGFVyfbnavGi/SgXju1ftFMYVRJ2iUDGB02Tp7POWMNE0cw
	+qDZh3601E83ynlCU+8FF2aSCD5f+wgvnpeAp3/eJHP+ZIJkNEc1137qaYqan0E4
	C2pWVbKcbDPhYoCjAihF6C+0Rn11F3wJX0Q1BEu8zmuaVkcCpBHrhDQVQQEXZEeV
	ppfUG2OxMyklhPkLMEjXUZfIeA/Sfv2U/Xf9L6KzJO+TAO92nDGjkKZ5+oDNrP7R
	tc5RUI8etQ81IRZvWrMOjIwGEscPC54t6BsMErezvKaDxCjb/xI6X/WOpoMqQaLG
	c+5WSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cbjct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:02:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157de5360fso369612185a.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 01:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781769766; x=1782374566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19ANMkk1VCbapB4V6x38n8KnLEFh2G12hOsdryCZYaU=;
        b=iISC5tfyQLy98xXXn766wpWek9LuvygNcg9IFYTAhwFRHS/+PbJVE1hIOayVONCUMs
         HYDjLl9vTVp/RGCGpew8UdUXU52ZslOSGCAx4yKZ06tu2KcK0YokpIFPCOrSvP3C/xmU
         mbv9Fs/4fTy7IPmbkGpnrQWcwBzDoJnHGzQ9io+uueC7FU1+b+kHIFDiVwrvG+ZqfWld
         jLlZnNoAe47HWeG+kYXnesUMoPCMPlO7P4JT13wNWlImhko1q/Q1k3hWeK7RTh+d8Xa5
         M8zqDVNBtgMFsh0WnWQzPiPtK4NUq35aNnIvD2S3uVhe7K3c9llFTfSmfE9tXXhDCBbe
         DouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781769766; x=1782374566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19ANMkk1VCbapB4V6x38n8KnLEFh2G12hOsdryCZYaU=;
        b=EfmZnhrtyTHuo51ckMWKPN/gBbsIoK5hPmah7O/ZgMPhGRBHOkVc7uf3lGZQyzFpmU
         aaPHA3/EfqEk5CvzW1ZawXK0mxm3dNbjVbDIA/O8wAKNLfY+C5oKwZCv1mLk3KHYI4w6
         UQC1d1T3HyI0GCnI2+hSlyvgJVgYGntxiMysZ1EE+f7X4hGFm37z2F2oavcckf5lcBos
         zMH6Mi+vEUGGB0SsIjPsOb1Ycal4464lyN5g5ap1gXOmiDx4dWLxvoCtoVxz0HbLyLPb
         GCLnGx716VLK0XACvgvV7Gs5wCn2eQBWOPoFibThynM/WwMgySEWH7GqVNt8r87anEm6
         6RrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MkdRcycNmT49F4kNf+9FN8XNAPlr7Px56DyIf+0l4rMOs8xKU8Q9u22uN7eBNe8eOVMuhh4oKZPUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMfqWZ4KpvrNQE7WSlWB1IWs5MLIbKcpzHZVTfYEGOE5MC55L8
	7m24dFs7dspV7dlq7hsS47EG+hjPWLuM5wLq1qym+O6V3BZFEwVYR0DICMEO55n/CqXCzyo8Isl
	A9b4uksAi24d4az6eQvYkKmadcjU46KrEtSjTH4kzlHBMdZNc8OOMpdUDtcJ/HzXR
X-Gm-Gg: Acq92OGEiVurJlepXqBgZmp5uBF4SOLANJ6qneImNl+FOUn7exJHBaCL5g/Z7I/Vy4m
	h1pQixq3qAGwmU15bL+Qf/UooaQHDwvVhm77Mus9mcgsDVHELNIonzFlfbbUF+39iC1q56WGNWR
	R7dZNQDZ+lUsbr5OvmhPEDV4PbZWIedZbfnc4NXZpCBW2TXMgfXAwW2yOHqbdqy2xliUJDpspEF
	XEDXiHauYbe8mmpg6rP6ODN65G6w2exUrXj0K2xn5Wv61EAI46OBkSOqwV6rLqrt8QXSKoEcwSs
	gxfJNe0YUQ/t8W9JJK6Cz9+nXoPNuDC43Dczd63iLRf3YzCv2VIG/TmQwSupdF7jDPj4oNT2kBN
	cEWEdYfe8il6M+RNqrTUAhDeLkIvoFU56fVs1vFI=
X-Received: by 2002:a05:620a:469e:b0:915:8f64:604c with SMTP id af79cd13be357-91f082ff425mr440348285a.15.1781769766295;
        Thu, 18 Jun 2026 01:02:46 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:915:8f64:604c with SMTP id af79cd13be357-91f082ff425mr440343085a.15.1781769765846;
        Thu, 18 Jun 2026 01:02:45 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:41b6:7808:5ff9:cd42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923a1c3c4esm21638635e9.1.2026.06.18.01.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:02:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jan Kiszka <jan.kiszka@siemens.com>, linux-gpio@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        jianhao.xu@seu.edu.cn
Subject: Re: [PATCH 0/2] gpio: use raw spinlocks in irq startup paths
Date: Thu, 18 Jun 2026 10:02:41 +0200
Message-ID: <178176975701.5432.11843620279684767377.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617154035.1199948-1-runyu.xiao@seu.edu.cn>
References: <20260617154035.1199948-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3MSBTYWx0ZWRfX7EEB955+t4LU
 xL/V/qypk74ijw/jkW+6+VX8/2WHahU8yxmBCxmHS6MHw39UtbFs7c3xj93ItZa41hB4JXbAURv
 E+PTzDeJ/xV8+lGxHOZUR96aDoCPfS0j0hFr8txJ2/XOiad1KsOTz2MfE4l9dmxYoGb7vX5BIej
 z+OnrSjcArFXUf1GdHSp6cL3yeLPpQbnzEf/mc/2Ftor5n02aqwINRL3hqexvj+O161Cx/T/uyo
 Dzy+fbiJv18S6C7pEFALf4rTiyu8b3LvwQyJz8hlj7mWHIVgDtv3fBw8atkNtPbwTfMvX6gmXnD
 DxDYnrsth+eEcqc1S/wTds86Ur0c0bZsdTl6fz55QThzhm8S4OfWUix1ZucxCMoHM/1GplMK6aN
 aE+XY1xgs4MASjDPUSGsnts/UMzt0ZKUYH0/9J0rVHF+7Cma1FFbsJvxxV7o3n4Bj7/QaiailGK
 MRS3VL/oC1GLQ9FJFMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3MSBTYWx0ZWRfX5i9Oyyu5KFl8
 iyA6Jx/YQ3y3w00LAIPWPlTjfc/34feoaz7hUnrQfSr00rCMbn8oNAW2s4Q8p7bfsi+pEb6Co4Z
 HVsygN3E7+5PalT3NCUx65hsI65Y1I8=
X-Proofpoint-GUID: HNeClbnaidJpvAxUZHkNzxDqzLsj0tLC
X-Proofpoint-ORIG-GUID: HNeClbnaidJpvAxUZHkNzxDqzLsj0tLC
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33a627 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CTdToGyfExxhxWjKcZMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-38665-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:runyu.xiao@seu.edu.cn,m:bartosz.golaszewski@oss.qualcomm.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:andy@kernel.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:jan.kiszka@siemens.com,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.alibaba.com,kernel.org,linutronix.de,goodmis.org,siemens.com,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FE7C69E529


On Wed, 17 Jun 2026 23:40:33 +0800, Runyu Xiao wrote:
> This 2-patch series fixes two GPIO irqchip paths where IRQ startup or
> unmask can update controller state under a regular spinlock.  On
> PREEMPT_RT, that lock can sleep while irq_startup() is running in a
> non-sleepable context.
> 
> Both issues were found by our static analysis tool and then manually
> reviewed against the current tree.  The grounded PoCs kept the
> request_threaded_irq() -> __setup_irq() -> irq_startup() carriers and
> Lockdep reported "BUG: sleeping function called from invalid context" on
> the corresponding driver update helpers.
> 
> [...]

Applied, thanks!

[1/2] gpio: sch: use raw_spinlock_t in the irq startup path
      https://git.kernel.org/brgl/c/286533cb14a3c8a8bd39ff64ea2fc8e1aa0f638b
[2/2] gpio: eic-sprd: use raw_spinlock_t in the irq startup path
      https://git.kernel.org/brgl/c/90f0109019e6817eb40a486671b7722d1544ae29

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

