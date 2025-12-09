Return-Path: <linux-gpio+bounces-29405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A51CAF026
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 07:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AEF13031700
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 06:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E392C08D0;
	Tue,  9 Dec 2025 06:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSa5XGz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Drk8BCQ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3272579DA
	for <linux-gpio@vger.kernel.org>; Tue,  9 Dec 2025 06:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261202; cv=none; b=nOY2kpAzvuj4rzRmITPUPOiTN53S35ZyOSRlxT9FnLuQQPqPiBFVIm+jBBDJ2tYmltdEYvIczFubzn0cRz9s+aK9mwnJJIkD23i8BXhUSdnpV3XRUK99AQ+Ue5HwOftPsPwCRyNEApeMVMIpRyPnjUH1S4k9A6TnzlNJ1Naukc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261202; c=relaxed/simple;
	bh=eBWbYgr58RpwEGdpKEdcYRyxb2UDORrmyG1wp/V1PKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6KaBooooBXjv4YbR88w7HfBPD5vGSy+s0vuDidx1HW1jC2HjsDt6jsZwWbD9NMZlfcJ8l7LbCgJ0SYrBElzJX5PQoO5LseKph37gMxr23q7GicTSKdqYDAYBrnL5EpeuS3YPJfyeXlElYmWTFnu3uDepwFppFbiKZQjVajHRPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSa5XGz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Drk8BCQ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXBI81853424
	for <linux-gpio@vger.kernel.org>; Tue, 9 Dec 2025 06:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxhH59Zs0MAYoemaS1w5P3ecvA/yJwx5/A2sqaXA7ZI=; b=eSa5XGz6hJJ4QZ4K
	xoXIkanx8qWZg/IrPayngmq0L5H3yIsD3dvNOMT13dH1ok8pQoeNDUHfQMvljDMZ
	gZ/xZOMAA8MLfYkNct+2qA9770ewbFi+ZShDD4nuIcEfwf0oiqqY/WhiV52HMa+g
	0MnujS/w4EC/4IdDuSkjf43nIqs5PTUts1d3aB4tsWgxeXLH9MzzN50D3DG4tYHk
	GsZ+fc2x0AecN4M0ti7QX5roRfojRXUK2FhPL0gVk96e1zqla5G8ASKYH0ocUe2w
	z8yzupTeSHrJwqzPSRr2MG7FTiEMq67PKs4hiFwLdsSHjkZuK9DbZObAfKMq1r8T
	/K6hQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax63v99p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Dec 2025 06:20:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29848363458so109844805ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Dec 2025 22:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765261200; x=1765866000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxhH59Zs0MAYoemaS1w5P3ecvA/yJwx5/A2sqaXA7ZI=;
        b=Drk8BCQ5med++3ZNn6Mpl65h5Qz+g8/bHamAgJwQ5adBPzS7J1Rs37HgByuuhRU5uh
         +IYxGr3JuIKQ8DwSscMPUYuHi5e6ErmYT+gNtkziQ5vNKmDSoiTuY60sF8gsfq+2i+uG
         YAEeX71O1SeHzGCx9MQMQHSbo1Wfwx50+WMFT+MJ4UqMufU5nKL4YMZZegfiIjZD8leV
         7OuCeJhDdhoWnNkZ6wdLuuy7AjsCrvgAUCIsajximkbtpKf0qbknZBB0WqnQBrWepMUS
         It/vsAjPSYx/xq+H527zljiNB7S3mNsaKbb1v3GtkzkHZHXwzNzebZH+aVtDqUNqOOoh
         IaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765261200; x=1765866000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OxhH59Zs0MAYoemaS1w5P3ecvA/yJwx5/A2sqaXA7ZI=;
        b=BA2Ciy3CzgzVOnPHN9K8fW7pQrz5GTYlZ8bT8XaRtLEitKOUQLFqs6MHQmcp8PCpql
         6I0OwMwM2Qej/Y9JtBvqvfBnuZZ5529Ptp3w3wb+sBzRRU05PMqxDz7XtiInHAaCD4Pw
         zUwCoWH3bYvNNWUomk1ocb05NnoF411wzhLKnwx4mU8HMEyu53LNGkvwS7X7MiVPS2sA
         vZQWSISEMkA5hf9XVrIYjZjY9+jk58m+AjvtntRJvo2E59U5jXO8gJdgMtY1qOlW3zXo
         VBxwTHxpxPccEACMwwDF9CGP4MyaHYkicQ0P8ElHLXCYEx/pQwuOpG5LtGheHPyJLg4G
         Imww==
X-Forwarded-Encrypted: i=1; AJvYcCV06fXsKgKV8ZpYGhunFzKaNfTzViJm7GO8WxxWboA0Fa4uwnhTM88gGk+m9rJ5ZkatidtDAFbD6xkv@vger.kernel.org
X-Gm-Message-State: AOJu0YywXF3AsK0X1+o0kbvu/mq/atAI2aADkHj+olXYwQtWTaZ8QG97
	kBjj9pN/jFlsEYsNklO9Gt9gijOwgU+rdn/GfWArI7tZXrH/5YngnTAWJY6gjLyicBc1kdj/h8F
	F74QANqoOuZsGJb6Pj7F5sC9d40a9/kIh1qGnnfY3dsm5nRIGraPjadF00pqwdpP0
X-Gm-Gg: ASbGncsb8/yTJKIaYFYVffvM4V6Qx8ZN0K3O9VLxeNjGnZj1yr9i+I5el3TIi1sRTyg
	MglqWRHYCEh3OEGMM8Bf6S8rUbQBfVLGOwVVpyztWMtCQl2oQvQdhRMxNiC5btkfcUGEM/Lc6Lw
	F84NPfgkQLI9Zd8+Ol4pgMgSAvMW7AKN2kxYf05Enp4kdq5g+2CyuDBrWp6ySgIkhuOg/JUTWsr
	dLBaymsplcjsAFBYw9vj6Ha/aAfmaXTWjDwyB4ceWhm/H2p85qE7CaXuEGI3lE3Cc+fApUa/ToU
	iGX+x1hmEyLFayUD0MWKsjvYSApgYzdr5SNmpXIjDsUd59S5M9UrZrJ3PaiIb0DDXb39HKDD1KD
	YsBubSnglEj1sV2BWWKfKNTmjaspiRjAVvMTSK8qrixL56R+1o4fCoAmpIFuv31U=
X-Received: by 2002:a17:903:3508:b0:271:45c0:9ec8 with SMTP id d9443c01a7336-29df5de017emr87029305ad.37.1765261199751;
        Mon, 08 Dec 2025 22:19:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOaV+yH+sjjSWt+4lO6qYPYZTOyI5J3W3HH5LAqE4MzwhiT3PlL1J3vhfn+74ewzfzI1e/Xg==
X-Received: by 2002:a17:903:3508:b0:271:45c0:9ec8 with SMTP id d9443c01a7336-29df5de017emr87029085ad.37.1765261199302;
        Mon, 08 Dec 2025 22:19:59 -0800 (PST)
Received: from brgl-uxlite (fs96f9c361.tkyc007.ap.nuro.jp. [150.249.195.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49b196sm145682835ad.17.2025.12.08.22.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:19:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] gpio: shared: fix some bugs in unregister and error paths
Date: Tue,  9 Dec 2025 07:19:46 +0100
Message-ID: <176526118165.8958.17776075092772284633.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
References: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKarWeZb c=1 sm=1 tr=0 ts=6937bf90 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=kS9sT8ua8GhuIhCqqd6Lkg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=z9GYmf5VULPt4NTHiAMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: LdQggXp0k4iSjpNJ19d0eGAWhcVjX_K-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA0NSBTYWx0ZWRfX2mb3zKHEqOje
 MYd3zLKeYsxSBgUBvSk3ZOK+tKNP5/YOvZk0syto1SRAE8jfPr5YLcO5wg4d4/SBnR8hI7Ov7db
 twaQWYx8qebAeUY6X39UOy9HLlLX2SCaqfPz29nEAg6jSH/+35cb3DNVl63pbq5/VqdztokBycE
 o9/Me/Toy46gWGATrbR06ITl2F0RcwiK8eNpmbbZNkvm2yuxtRU7qvEtiSd1eA5ubxze2qaj1sf
 3puYdAROgPMFhwfp0vt4EJQGCYEjs343Bkf6Zj79Q07YD7kuga+VdQ9/IkMbnJWvmr2Dmm9JAMm
 s/DLWIFaS1kmMnpeCCcD2wpcLVYebQ1eOJKB0iRnws2X+RynOi9WKi4JpiOBflh0hQfU6sYPw6N
 FFyo07zBAxYjg40shpjtHKnnm3Hn7A==
X-Proofpoint-GUID: LdQggXp0k4iSjpNJ19d0eGAWhcVjX_K-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090045


On Sat, 06 Dec 2025 12:53:52 +0100, Bartosz Golaszewski wrote:
> Here are a couple more fixes for shared GPIOs that I want to send before
> the end of the merge window.
> 
> 

Applied, thanks!

[1/4] gpio: shared: fix NULL-pointer dereference in teardown path
      https://git.kernel.org/brgl/linux/c/e2c4175b8d3b3ea65fc3801c190bd93fe8b7a7a9
[2/4] gpio: shared: check if a reference is populated before cleaning its resources
      https://git.kernel.org/brgl/linux/c/c904a0d8525d5f03529ae3176e99bd32466ece7b
[3/4] gpio: shared: fix auxiliary device cleanup order
      https://git.kernel.org/brgl/linux/c/d382c765d083ad871b4a053059351edd348a2442
[4/4] gpio: shared: make locking more fine-grained
      https://git.kernel.org/brgl/linux/c/ea513dd3c066074b12e788114b45e0f2bda382cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

