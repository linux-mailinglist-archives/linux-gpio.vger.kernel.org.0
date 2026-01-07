Return-Path: <linux-gpio+bounces-30208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF995CFC9D0
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 09:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98E063002970
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 08:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2166728B415;
	Wed,  7 Jan 2026 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAf3ePHD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAKaAJCu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0D5283FEA
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 08:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767774694; cv=none; b=tC2pN09Ldie6286j2qJBwmM7ZrKpCkz0+Oajwt3UaTpT/uW1WXjuCJXc4mZFdV4/RMRV2yuI4nQC7teKR/dIi8o4qYX+FvAAfdK6BxtQ8pVgr0/qjdymQ4vtomxMxrrio50mervhAagEL9Sx8iybmUh5/s0XaqsLE6+qNWZNdQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767774694; c=relaxed/simple;
	bh=sfSs/NP+7b+3Ri0ciErmRI77kOLv1weBiE9gw+qCLR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QhcmrOSvD3kAdiAmh6aCppyqjChr8EkNCz2CEkSmtHz8POITq1Qnwp9ZLQ5q5LZ8zH9ErKKSLDlJGcUKybdoq6H7Ol+7TByTjPPVY438TEPdAI9J6jQ0r/6gldKGEnzGLU0T3GLY8Hv0VZHIRH7Q6vp6emAPDPjpVyiyZ/Gkkd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAf3ePHD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAKaAJCu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6077I5ke1475325
	for <linux-gpio@vger.kernel.org>; Wed, 7 Jan 2026 08:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sO93H+QFa37P7vkvoHhZpkzVYY5lod2ZRIVKd4EtCKM=; b=YAf3ePHDs3CaRRWl
	db3WyP0IRzXYAKProK7DkpioG0z/c1Ec3mPHK3x0oIpzV3ugmxYMq46Op6nciCp1
	FgvXVcV87pUwboJc+pseSupjohRijHuJedKtmp/aPxEBw5/9SBSHeW6NBgxk7qxY
	CPe1MfwMN+ZHfxi3xR2VSvN5WP/QYod1slvq6/GM0CCvxBU+s36zLnjcimzfuqX6
	zKOrj/9/wtaMxXBoEt+j6ZRA/qc9ablPUG5GoSZKnud6heFuyor9gvra/PVlmeak
	Ja6o6C+XBt40qpMTHdccdW4Mxk6EndKBM8Xc04kIirgoHUe8OVnfKPEtcX94Pu5o
	cnNQQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhayhskbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 08:31:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0995fa85so59491181cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 00:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767774692; x=1768379492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO93H+QFa37P7vkvoHhZpkzVYY5lod2ZRIVKd4EtCKM=;
        b=CAKaAJCuavkVN5T1tdiPv0AZRDyIGt08Yn0A0WlQ7zC6dlwyZ0sBsfDPYHSjL260kr
         vaqSazEUuYqpbzDOYVdK7/g7ywD0UAO041UUb3MAyMYNBlBzTVOULdXx2JA/qlsXb21S
         C/3fADNcvj2TY3mTlbTM4JenGCwjClyBdpfipFAW/XDQ4dAGk8LMvSZa3WeGxUq7Ci3T
         b2lcKEoeyc+HI84TGGTHOwU4U+K3wOLEItCJvxolu9Ly4gMn/H1hjxih192Z59ECPuf5
         E1nq8nxiieDgJI0DTI2u8b5BpsoSxadLPt8LXKzPYR7CcJ9XfeE4ArR69RsUxAWQTLfC
         MTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774692; x=1768379492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sO93H+QFa37P7vkvoHhZpkzVYY5lod2ZRIVKd4EtCKM=;
        b=CTWS2qwVvLeNxUq5hDdfe9zgYbfqUOun0Fi/+aZk1Jkf49P5Ul1J57yGzSzndci4Xi
         pYZGbg/Rm61UEeumyPvhNyJfRAHIR9gW652PjrTUsZ5+boedUZ3rYAsIvvNxuXiUxG4O
         61zKMeHmWU6NxPciH+irikus7XcHRRLnZIaL9UtAyBFK42SBhfh/Y9qVRaQfcTRP0Aty
         G7DYP5zYe2STT4bOdqV52VeTBtAk89WidHFzPBDIJNOpHXjMUdJUQdtXLcV4T5x6jZEI
         LfNysWCyJqNBP7szhbD5BklCBqNh5DLU+mouuD/uEkvzaZ9YXM+As8XrOh5MB6EY44iy
         ItdA==
X-Gm-Message-State: AOJu0YwPx3YmfEzUYi78SbGJIpqYf+Oy1zDKG5hcAZ03b+w/zJZnlOcL
	RuiIjxbu3oNJFLIsmyyXNT03/TP1P7np7INz1Dnzuz02YIsi+M9g4ct7UP20mCvrYf+FiD5YpZ2
	Et9iN4mDGQNP1dKMruuo12Pq+gVcWLjgPH51kBwya+j/Fklvd08jjDSJrLrTMjTlP
X-Gm-Gg: AY/fxX6+vRBA25bIqMo3p/n/aFhE6AJi66w5n7NHBKYZTkP79pZzM5S3+pZs8DwhCbP
	fHZqqK9NjIxZycellKEOpazAtumFWQAW1cKowj1zef1cdmFNwfxdADJEqS5bHv/7bYxumiWn9MM
	cienQAPDSotok4qHffsmKT27al6WHXCu7Xk+6tBlT2rQ6miUayTeUQqwWP8kUK1rbI2RQZz6zPx
	8ufBhmbSnRNywMq+LzQIFCuMmr8UtwKKuK6ErNyTxFshEiOfajRys32p8bqdTxhNRxA9gzxLNTo
	nXIPQNib5kGKuXELa28CnSC3MBHuEhq6b4jbXu7Ojtzq5YpWY5pAS9lB7WRaoFfLCheNiPOgjqR
	zYGB/YzVbHLpXa0mpbgUtAgX6JKvFKPQi45zIhw==
X-Received: by 2002:a05:622a:5c8e:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4ffb484a739mr17380011cf.8.1767774691654;
        Wed, 07 Jan 2026 00:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6IltAcpMqDUqZxq1/vVtnQVTIeTGNYCG+LcMYOkprAjPOhqleDalrgIZfMVCirRonr53pXQ==
X-Received: by 2002:a05:622a:5c8e:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4ffb484a739mr17379801cf.8.1767774691272;
        Wed, 07 Jan 2026 00:31:31 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b90b:ec1:e402:4249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f703a8csm84793845e9.13.2026.01.07.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:31:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
Date: Wed,  7 Jan 2026 09:31:26 +0100
Message-ID: <176777468354.15022.5475399715540988905.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NyBTYWx0ZWRfXyOmipM1DEnG7
 L62mj2t6nU+/mwTbfcyyoLbsSCyJY79hib0WqiYX1xFqXvoTj0bRIq+EmPus++CQ+8E4byMGqa+
 Y50avFeclpITPSGF31rHRJp14U7qkar9hBsPJL8UoHrT9U6JCQ7S5g4yFpr01pRCCEFm52jxpA4
 tQ8lrxuNqojZbrIidjSLKBQOoRL0TZGtGFQ+VeVnExavAQvkwDAACgV7/IuaxTBINz4SOuv+85Y
 S/FlF6wFAgnlI+S5L5lx4nO7h9SVziUb/UCrjo4yjiYY9bDYc1YgPS38UoAWWGEMlY2TNnphJzp
 0Pzmzmv2FNe1ufjQVApxXo2eErOeghjyiyqQ4ewKao5lmNRPZ4Lgl8KUSHwKbzPAm8XFeIRYsff
 oIK2TBC28MrMEfQKkc3DBz+BshDA6a22nQijxpEU8uLnjqAC3DJVruu/eTaIUK1UYaAFlzl06Jt
 QDuerQWgzOVCk1PAkRQ==
X-Authority-Analysis: v=2.4 cv=VI7QXtPX c=1 sm=1 tr=0 ts=695e19e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=R-3ehz3GvOBFeWroKLcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: tu2zDeRMfyHs0SIkuOPKk9BRn0ioLbt8
X-Proofpoint-ORIG-GUID: tu2zDeRMfyHs0SIkuOPKk9BRn0ioLbt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070067


On Tue, 06 Jan 2026 10:00:11 +0100, Bartosz Golaszewski wrote:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
> 
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
> 
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 12, name:
> kworker/u16:0
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> 6 locks held by kworker/u16:0/12:
>   #0: ffff0001f0018d48 ((wq_completion)events_unbound#2){+.+.}-{0:0},
> at: process_one_work+0x18c/0x604
>   #1: ffff8000842dbdf0 (deferred_probe_work){+.+.}-{0:0}, at:
> process_one_work+0x1b4/0x604
>   #2: ffff0001f18498f8 (&dev->mutex){....}-{4:4}, at:
> __device_attach+0x38/0x1b0
>   #3: ffff0001f75f1e90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
>   #4: ffff0001f46e3db8 (&shared_desc->spinlock){....}-{3:3}, at:
> gpio_shared_proxy_direction_output+0xd0/0x144 [gpio_shared_proxy]
>   #5: ffff0001f180ee90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
> irq event stamp: 81450
> hardirqs last  enabled at (81449): [<ffff8000813acba4>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (81450): [<ffff8000813abfb8>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (79616): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> softirqs last disabled at (79614): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> CPU: 2 UID: 0 PID: 12 Comm: kworker/u16:0 Not tainted
> 6.19.0-rc4-next-20260105+ #11975 PREEMPT
> Hardware name: Hardkernel ODROID-M1 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0x90/0xd0
>   dump_stack+0x18/0x24
>   __might_resched+0x144/0x248
>   __might_sleep+0x48/0x98
>   __mutex_lock+0x5c/0x894
>   mutex_lock_nested+0x24/0x30
>   pinctrl_get_device_gpio_range+0x44/0x128
>   pinctrl_gpio_direction+0x3c/0xe0
>   pinctrl_gpio_direction_output+0x14/0x20
>   rockchip_gpio_direction_output+0xb8/0x19c
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_direction_output+0x34/0xf8
>   gpio_shared_proxy_direction_output+0xec/0x144 [gpio_shared_proxy]
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_configure_flags+0xbc/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get_optional+0x18/0x30
>   rockchip_pcie_probe+0x98/0x380
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
> 
> [...]

Applied, thanks!

[1/1] gpio: rockchip: mark the GPIO controller as sleeping
      commit: 20cf2aed89ac6d78a0122e31c875228e15247194

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

