Return-Path: <linux-gpio+bounces-39025-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZIuuJZVIPmplCgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39025-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:38:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08A6CBBFB
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:38:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kehIzXX1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bpwX0Imm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39025-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39025-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8144B302761A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38903E95A8;
	Fri, 26 Jun 2026 09:37:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0B83DA7F2
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:37:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466668; cv=none; b=kuZp5fCWeVT274SXUCi86GbRm6XCEgPSl+EIS+ZKTun64pPpjMQRe8A5rOz6SWw1M3ksDdQ6aBvo108I4KHt/GIfINp1CAA59H9tYr4Xw9MKjlbEuM0VkugNpeKuR+117xmqpUEbHFyoZ0PahGcJ8QTkqD588ovAr0ZHI2Ruf0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466668; c=relaxed/simple;
	bh=1rnVk8W819E6evOX4TVbXM/kFFdFVrobQLLa6i0j6yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SB6NgS+OOEbIkzVQTbiitbzniY97jwjw6h0RoQfU7jQDERDvmc6XLDIlx0sFIFr8mI5fILweEpBcaaCvjAVukbYVQx/Z5o6bcacnN3KTi9SzQAi6+4uoNjUZ8bduDH2DviHTVBz9aK/+TMAnA9BnkzMm/XDtMc18Ma9xVOaPu3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kehIzXX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpwX0Imm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q7vxi6692770
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLZXsBBzRz51R7G7oxEqwhsRh35KtRpjko/MEX59+CA=; b=kehIzXX1p1P4Fc88
	rS7wbl8+Ia/aEY/Ysou7Xqzdw3DAbxG4EClxIB5Y4aNO5skDtHxzzrixS6uO1/9r
	CAi5A5poIhB8nGLeAmk8FiqE24tFzJySyOHH9kC6F7gVn9cQ1IxQblZq8Kgtw7Oi
	hvd6eOvA6jHFxUXF2YpEYZWFsqSmxhiVYNAY6B8I3nGfJBo46y0mZJILjMsYKiq1
	/H/6Iwqme7RkZhOJ6xWpvplxizdZzG9IrsgvbV75lmlw96bMCzck/fzHhXUtyDSr
	/TeIFuLAUqT+gL8FqDDL/n1M4Qgt8ODXSHDeDDXiMBDdvhc3PnTRozknO1imCBUD
	rKNmXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ngggbav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:37:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9254309dfd4so157774185a.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782466663; x=1783071463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLZXsBBzRz51R7G7oxEqwhsRh35KtRpjko/MEX59+CA=;
        b=bpwX0ImmMAVYA4a/5zwwptR/Uf2sX8kFD4Qdt9kWg/KNnaBFuANux9JFsXqr5juuFz
         aY2B5bgG42IYbaQWTzTZRdRlW5264npSAt2X67uJAsX9PS5RAppwXligCfBY/OAKHbBJ
         v3T1koVPLU36Sx2I7TxtMsiuoPIT6DKeMVKTdelufbmWzVv/Of8Rts8jvE+W5U7zFCby
         NIiIw9ikPrje///2Dd+tM9qpHChjURdykW2/h7uQe9hFOf3kPUOGSgSIIZWqLlRUp6rM
         tlh+u1oZsGLtA3TUNL7OGkeATa3afS1jU6RBB1arCILHxqAVap+V1wqMnc0eqBmunzG6
         7yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466663; x=1783071463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLZXsBBzRz51R7G7oxEqwhsRh35KtRpjko/MEX59+CA=;
        b=tOrA4VYRObCsA6AEK96FzpuEXAK67P7k9U0WP+czAYbvRLQE10xN13AxOL0HVogkxZ
         oy5tWrtlp/UNw792sQW7VzmPN085wnASEEdAN/8cOeSy51c8SPgts7J/Pn7g+CR5/neP
         ACnRJ2It3Oc99NH0+k1PPw1az5wLJmKyJOXA0wReWcFOSJsVint4K3aWBB0iGJBleaJF
         kdOQA7/kyouBi8tbfEvI9IDU1dnqIAtO/n6U0VPXR83Te5Li3gBrO/1EeK9DF78Pbwlo
         UAM2155EySl0ipiYGFj8fryyneKFnxl9yHY5QwWEpzndn53sedGdTq4fuZyVJBAOvt3D
         LHTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bMg/6Wtcs7jH4oxbY/41GoRoHIkxDMeAISZFI9kNeuH2zYa/b7uAr83CiBPC6VCpHOvFhAbBzRmqk@vger.kernel.org
X-Gm-Message-State: AOJu0YwerjhdvwpeSpEiI72H2z5F+upfODDJtXV+iDWdWG2z/ecXoBIg
	AuRFGV3/CDuz9tjK5UeK3LJTdQD+8qD6nnV9iGcMcMExYgXWDvLNDmzrx1jOnwdFPuZ2OtgYqzq
	+0WfzS0Qmo4+rHpdF9fLxw7tK2od4TB7sO2EgoBK7Tfy32hr3nJwtGODErXLGjL++
X-Gm-Gg: AfdE7clrIlwtfaBWAH6hRooZPIRVpuYcteinorXzvPd4CEHuzcU8ZSr8wxQG2E/rNRd
	ds5N6+c3xNHSuvrvHum2eZJ1OoVvHx90oi2Gek4CgiFbVI2Q74eiisy/qdozyk26zujxnVLQuKT
	s8uCfjmtQw3bZ9mAQeYaRqPYUo+mAlv1cIbTkrRDdCAqC2J+utn3g4qj99C0v4tSMPxbFNPgyXz
	+OibkEgOHlwkeKUaC4WAfioPGecraDYEMWmi/qne/AOwVTQB1RDJ4T4fk2g1Ih/E+gjjyrOeT7s
	CoHG7SXfnX8lw9+Zs8Mo24sqSTn3GTW7cMUl2s1BlqKJeGlZXDi6jLZHW6yc5GMy+SECSNZy0XX
	Hzf8uD+7XaIrr15ApVg5yV8mcvwUAStbFHHR2Evs=
X-Received: by 2002:a05:620a:4114:b0:914:d093:abbe with SMTP id af79cd13be357-9293a6afa19mr922375285a.12.1782466663078;
        Fri, 26 Jun 2026 02:37:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4114:b0:914:d093:abbe with SMTP id af79cd13be357-9293a6afa19mr922372285a.12.1782466662472;
        Fri, 26 Jun 2026 02:37:42 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46caad603b3sm21564178f8f.7.2026.06.26.02.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:37:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca9570: Use I2C match data
Date: Fri, 26 Jun 2026 11:37:40 +0200
Message-ID: <178246665779.12343.2845827438481981999.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624053744.72612-1-pengpeng@iscas.ac.cn>
References: <20260624053744.72612-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3NiBTYWx0ZWRfX2OU84w1u+bVz
 aHaQCQoaxiwZOuwj7faIqyOVnB1Mz2ARrhLhAI9g6VCgkSy9FOLlrpQORng+7ZFeNrZkq4NMZ7+
 iqyg2NMcGMDlEEiTB7ArRuJP3KOJrK3Jg1qxT0uDxj8tFkAtT498rq9NTnfpPPqaKETA5nXlS+9
 dq8mdZww8t8K+/4hUwKS/ZE84mh9ZzIFTOv7YicR7zZYsn1LS/BsNMja10bjNkIxwbCeoLtC1K+
 cEj6qdcSAMlK4T+QMQOP0r6YVm2IMW/hLiQp3a+GEOSGkRpfwCOtyAnU+C4bNYbeA8fC+E3i24D
 mnoQjhqO7LrWyk892e5vprWM6E00xpQSyFY7LK/F9nAsglYTJ9o2shQKiTdrJtqSYkecsbiloT9
 9s02uXctZqZkG84Lkrjgy/xVu4cIarJIY+lbMF54z6ARFl14bxMvs9A0lhgqFefsSv+mt32Kjr9
 8XdsyCOHK9zufumIHFg==
X-Authority-Analysis: v=2.4 cv=KNlqylFo c=1 sm=1 tr=0 ts=6a3e4867 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2wyFZB5_8w-tLK2wxd0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3NiBTYWx0ZWRfX9ewzZpwZIcM+
 XU0fifySVr4i96yDT7OQPAI0Ia6Bomppq7AOOJE1jZV2rLmC0hYAxRDftBmGBdj766hPVj7o+I3
 YR/749shWcDXb8WXghNAwk9Rpk48vqE=
X-Proofpoint-ORIG-GUID: QW7-iuE9PhMti50aMUsclKG-6Fo2rj99
X-Proofpoint-GUID: QW7-iuE9PhMti50aMUsclKG-6Fo2rj99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39025-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:pengpeng@iscas.ac.cn,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A08A6CBBFB


On Wed, 24 Jun 2026 13:37:44 +0800, Pengpeng Hou wrote:
> The driver stores chip metadata in both the OF match table and the I2C
> id table, but probe currently reads it with device_get_match_data().
> That helper only returns firmware-node match data, so an I2C-id/modalias
> match can leave chip_data NULL before the driver dereferences it to read
> ngpio.
> 
> Use i2c_get_match_data() so the I2C id table driver_data is consumed
> when firmware match data is not present.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca9570: Use I2C match data
      https://git.kernel.org/brgl/c/415c63896b76fd98883e190bc7518383cb01779c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

