Return-Path: <linux-gpio+bounces-33471-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HNSGabKt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33471-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:17:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDBE296D59
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4776307267B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E75038654F;
	Mon, 16 Mar 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gf7B8rxy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUUXHmgi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE52015FA81
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652310; cv=none; b=GHQ60+DIjfQTrMhi8VfePnvPURjvc8ew8sDjo5cRqfH/1DEZ+JtYPD+C79a0WYlJxVeIxpbmSky4YXdceup8XkxtpaJ2eSI+/mSVb+ulnlit96orEoHef89/nq6hPKswEFLHBtFVYV/hT8bMl1KB+rALCA95m/z1jX6BfX5n/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652310; c=relaxed/simple;
	bh=3EnmOweIM4ZL5K/s3TGkhUbaraFV5f8v3WhF79Ey1nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+EqOA+fybo8VLU/rK/A3krWmfsXeKuBKLNpvZHUYkUt4Qh3bgMzLkzD3FZtf3MWnOW1d/lc4A6h1mhCm+WkUvLUEeJA/QuxzUljg/ww2SWs+IPtgau0nsLfN9vewkDb1YbhwU35Los8xA0K5donNnzqf5e41iDAwS/v0FF8cYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gf7B8rxy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUUXHmgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gHg663080
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/sIQ2B3vFGs5+/2tmxUxNEzHZGIamP+AgcNMqtKd390=; b=gf7B8rxyhBHYp2If
	NxgvPSsCTGv5WzYK2hARR/X169JBYy+DXJy6CWTKlj4tzKjcDIFudyla2PIcpPU0
	LGYm3uL9GPKmXyuRJ1bc9E5XfMPlAXEBQM0i/C8jIiYahT0rESJaEgE9DY5BBiy5
	t+UAdlb5FQxdvRobTmCwuUyB8CopCS9RQb8ZQg/eQej5JnC3KsBCNOwfpaz04ibk
	cHL7bypCG8l90d0j0rZtw94D3BdX1unnygyYFyf3roFXwRPhWwxYWtuQjUZr3P22
	v3UyYkS1EL2VaMKpzdcJCJgLbgmC8e1aJ4F+fUUJbZFXddSCnXOhFWJtfEkoX7Dy
	LtTzjw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043mxub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd83cfb36cso1162198485a.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652303; x=1774257103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sIQ2B3vFGs5+/2tmxUxNEzHZGIamP+AgcNMqtKd390=;
        b=eUUXHmgiyVwi3mpxwed57hudTjkwtga+/Vsrh8gNfGqP8O59QcFF3M89Itd+hPjguq
         UycZVKiV9uS8J49AlYIO4Q4PAfngHxYjGyJyEysb3ne2WxBOaa33vlYIGuhTxBhzuOHs
         topBggDPCSCXKmlGdO0mpeL0lE+oKMzB0aNL/t3KYS79a07RRqT4XRPPH65wabdHc9hT
         GvDcTeG4Gy0sjtPRPJP6g21e9zQwouY8Zq2incdaUpgRe9UpPry08wcjUSNY+YrUz6pj
         zlhkyI9z4cdLyzsKhUDctrxA/cGnrHvRQOttbo8T6dNMiTNJ2u/vbLWx9u8MuVHy/4Vy
         tA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652303; x=1774257103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/sIQ2B3vFGs5+/2tmxUxNEzHZGIamP+AgcNMqtKd390=;
        b=DA5htqPH7ykhBd/ouWkT+Op0ZeGH53nKlWfPaNM4ZxWU7fhq+EDqy2H+GhpyvAT7CK
         MRenc6Wng5y3HAoW5/TdRo3QTTiMWeezHctMByF/bfhd18+cK0d97AF2OjX/4gZrkala
         rSRyXxOpWzbJ0KRDmFNftyBb+w2kvpNAuwbzp9X4+ya8ibXGC7/RyUfVmzIYUZF/Efky
         mCiI9HSdm4uu5eChtC5tpchehHzuN53SqyzycgGJVMk0sqgqCgyLMHl1K3Ti6Uq9iDUO
         m2KRN0g2ZvhxYEF9Ri2s95x5qr5RYDAqLgePylcAcMabPUnoHgSjkGVscGbZpAHDDzD3
         oWLg==
X-Forwarded-Encrypted: i=1; AJvYcCUa2M4iODvF09jIyrOOF/DOFvX7Nm3Ptk8zI5kuNsfKaSeGD8dGGHrz2xq8MM8dzpuYjOniX0Ialo3d@vger.kernel.org
X-Gm-Message-State: AOJu0YyuXGyvBkxvZT61+rV2tTSkbP+9GQ7zrKeDJcxQF2WT2FJw3EWV
	N4kg2p5ktWnj4un3xeV228lRG7XLXr3BAx/RTiFc0UdusIabPGOIpPN5c5kqnbnFMZnutlrRaAF
	fPzrQqjOVLBy+mY68pRsoDjtMyWIwYwcXR3ZN6i3Oc8574G/JTvl8ehzEf3g3vpYM
X-Gm-Gg: ATEYQzxsekdebmIWOPaamPDQ30AZ1067NT6cvUQ4Zi/a2vIqmMZ/2VPLSfbuHOvAttI
	RcMUwHrpBKzGezhGiwJeWm+Em7Mct0ny/3UzGhBxUVfvMdWa4tNtlPELJttWNK2Ct95scOo1r7W
	wXi8M3me5dcze0sRgvku8Z4wtFyMZ+iDS9/TkBnhVZN8CKhZEvccNIf2gwD1Srtj20KIbA4azOl
	f0ZhR/ZsgMD9YIy1jYSoI3pawUhRp9yyd7nkibbewTs8jUoQzO6oX6ZJgGnhcnWSPIgcHJgwIbV
	cEKeEvxT0GOdiyRW5A4efpLxrIoFYz5/kL2PdQopbc/6FlTBJRyNCOmX/ptoyuACuh0Xy7SnLmB
	xVEPCl8J24SsBJZFAy1emgPtmnZS2T3PCyn0PA0kGU9VvAvV+b40=
X-Received: by 2002:a05:620a:6c0d:b0:8cd:8f41:d939 with SMTP id af79cd13be357-8cdb5a3fea2mr1590365985a.7.1773652303156;
        Mon, 16 Mar 2026 02:11:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:8cd:8f41:d939 with SMTP id af79cd13be357-8cdb5a3fea2mr1590363285a.7.1773652302656;
        Mon, 16 Mar 2026 02:11:42 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2932198f8f.12.2026.03.16.02.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:11:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Revert "gpio: Access `gpio_bus_type` in gpiochip_setup_dev()"
Date: Mon, 16 Mar 2026 10:11:25 +0100
Message-ID: <177365228188.54363.531842026026908892.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313054112.1248074-1-tzungbi@kernel.org>
References: <20260313054112.1248074-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MCBTYWx0ZWRfX+dUKiE7zryTZ
 msk6RKAa61ZpEBiQTKkEmfI8MSoYeuyh7qBG5qpjtA9VNFVooqvt6ziaS/UvPfc5S+9v6tT+B0S
 rGh3csBngijz5adtRB6GnbhdbjidyFNwUSYGBjb1QeJkKddyUH/MDS7cq8+4Kxx3tpyecXUMKnd
 fuu2wK+1dKruhAEBtDYpACQbvo3Uk+JJHC2JE2MXKr8PmAsrA4VV/2H17/4q4VyMFuGdxsxPod+
 kZYKv8kULIqUg+7OHyVX3rwIF8mAznX1C5tM0dqFtLXzW70qMn1FFMyfgGUOeo51LRi4AcBSSsM
 kP6FACOy17Z6DnojMlWyzkLQ9WHHvBLe8FAzRCoVbW2IgKlNqoNqBnNuke1I42p88wz74GME4r0
 IAhAnmxZ/8/k+rad6GP9MAGcw3t8ouJAj0PRlrx9ZGhnQzuSNPSjqs8yY8/RUMPsONu2KhE3ye4
 dyzrHYOx6J1zC0tHM1Q==
X-Proofpoint-GUID: lAusgz9cFFAghAi0IGJFd-F8-lpF4bRB
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7c950 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=n7HXwNbnzEIs9Vl2ceIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: lAusgz9cFFAghAi0IGJFd-F8-lpF4bRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160070
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33471-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDDBE296D59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Mar 2026 05:41:12 +0000, Tzung-Bi Shih wrote:
> This reverts commit cc11f4ef666fbca02c8a2f11d0184d57e6b75579.
> 
> Commit cc11f4ef666f ("gpio: Access `gpio_bus_type` in
> gpiochip_setup_dev()") moved the bus type assignment from
> gpiochip_add_data_with_key() to gpiochip_setup_dev().
> 
> This change introduced a bug where dev_printk() and friends might access
> the bus name after gpiochip_add_data_with_key() but before
> gpiochip_setup_dev() has run.  In this window, the bus type is not yet
> initialized, leading to empty bus names in logs.
> 
> [...]

Applied, thanks!

[1/1] Revert "gpio: Access `gpio_bus_type` in gpiochip_setup_dev()"
      https://git.kernel.org/brgl/c/3518fd4c780d4fa4c0e2cedd95c0f8bc5d8b457f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

