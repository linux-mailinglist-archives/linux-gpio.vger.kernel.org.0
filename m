Return-Path: <linux-gpio+bounces-29278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 656DACA7158
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 11:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2711722B608
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 08:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49B932ABCD;
	Fri,  5 Dec 2025 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFuh0Fhf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ev02OXpH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5728934F
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764923601; cv=none; b=Nshpny4XFGoDZ53p5AWOYZmy9AUEafciydwBMImxgRtQJ84If9ZqHz1ULEWiVHOAW6aBOh6ayho0X9ekPOzYvsXL93P9N6YKPATUghfVFYMtYo5VIlPJU14K5/mWzcxkvaMK/HBP4itJNxyDKgNX2FwdNZHWXntBZulNwoUJ1rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764923601; c=relaxed/simple;
	bh=MMGuL1vI04W6tUU6AIQeCC2kd4KIozOfeyw6PVUXtuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MdvV0NhNd2k2mfKt9qwc4ozxZ6uJXjPElB3kW1ND/d/elYfRexFbglibP1scp7JcBuWpYjzJ0iJdwdycekIXFuHkCjS3DGOPg0zd6m54WfXyz31P+ZttviMksav2yp5T7UznkQuYNrj2Y4obssEwPw2rjIDSgcL/y4sgNAjCHRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFuh0Fhf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ev02OXpH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B57ue3k2408066
	for <linux-gpio@vger.kernel.org>; Fri, 5 Dec 2025 08:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eC5PNHDlygWpLQKznc8XPdUOqSVo8sJKvA6Tip9r02k=; b=IFuh0FhfJPqL8HrP
	FMH6mppvIXUjzkVH7RZozpfq+T9A8IkOZn9bNmLXdrNuMMXcXPhkCKMQ5zX+LW1z
	78oy9wnBQxV8nPl+8kSvsqQ2rhVUPgHRn5Mm5iQrmd+C6nydbdlj2mniAJgFw4V6
	Nk9FnnW9Ok5KULmUFVwDmTjpyQ955MtGw5fXlR2XOFCsrH/iNfaNT1/HnGVY6ktO
	1fjUzfaHShwR8HQcr7G0wohl2a54pQvKRztw0bA9W2Gbi8LTZfhNsx65U/OsSZSb
	p6W5cBRItMgZTNW1B9LQOtTfHVbDDQbVJS+T1/4KcT0Bb5WtDPiQWfw8hYIWyq9t
	msFeGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auhty9hk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 05 Dec 2025 08:33:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so230320885a.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Dec 2025 00:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764923591; x=1765528391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC5PNHDlygWpLQKznc8XPdUOqSVo8sJKvA6Tip9r02k=;
        b=Ev02OXpHHA0Kt4CLevsy84+c8DQBS/HPONfzsJlPajUS5LAxFiyswQusK/TDDE+Yh6
         Xgk9UuPTNb7SYsYaPYMN27MuQDKVUMM/unw5cVGWRk04g7o90otL2T3WXxvXvxRQWMTs
         EdcfLyexvtKMGGIOihJq8B5ZMZj7+hBu26gDGxvMWTjl+lUWPCmV2fqzfJwnIJVA9nHu
         pOzZPWf2HzGBj5/XYiAywaARUBq9pSJprUwKBdu9zZWAhtXTVzzpspAqZ/oESMZtvZAL
         xtFWaUoEchv43pQrDkfKT9bA+pDOVj1ExyIRabdyBFMfj89dgOUJnUPrSufISXTrk08O
         lYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764923591; x=1765528391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eC5PNHDlygWpLQKznc8XPdUOqSVo8sJKvA6Tip9r02k=;
        b=Vm1UQCqHvVnuB2IqtssKUnUM+C6W37rgYOEYpxvHTFqwcKphWDXKirwR1dwJJXiba8
         wo/yxDfD6ZOWAuAKnBfhMn418lRdU6Jskf7/XFHRPgoD5CisRnZljHlXkS7eoUCSBm8w
         bqv3XTE4pYWDbXQGhYOKVkmrZ57UY+LhhFZ01ZVGX3XhYSLaXPP/8MmM67UyrZvS6O4T
         LKjmNWU/dt0WoSRPSYky1ZtoMULNbxjbcZlEIaW23bQTEv8gDgxLv/h8/fkBRHbxOtz1
         tcQ5dsgDdYpJDGG6HOSBRw1OfSdJMqutBWfo8lf57C5KbeHkykniq2IMKje9W21/Xocw
         D8dg==
X-Forwarded-Encrypted: i=1; AJvYcCWenEKom6rHIPH7W2BySF6Yl6NNXSXl53+KBzB8gVvBPskCX/bYRT5xJJDSgV6FBX0YlgcM2Bf/ZrZg@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMfE1tAddGENR/erV3iHaKy0vPIEhKG3APPKhh8PAEVgG0Lka
	yGUpo5XSr0KoH99xm7eeZFV6tpKppuOBym9EmrbhjXo746mJhkZgtIruvhAdrQC1UyCHo32tgCy
	FFoIPjXnk31B+A0cJo1rPUN4RbvnjmzqfeLs2VzB8bWyo0pmpYAJdYf6m6puzc8YtN6s5Fck8
X-Gm-Gg: ASbGncs5KY1P9Nmbr9sGJpw4z/FmoCcvc41auo3uoIMrbz10EhYOJghS3Lo0Ni7U8uw
	G0GonqVcO5VYI1aj4yHja/+ByKqAknw5CnmAa5fvDijWD5f3wyZcO+U3lKSKUaeoeKQwZF9TrsK
	ZhuUf8WgrUaN65zZu24v6lNgBNTLR1oxVjCt4xdFzn8g0y1HXwuMBvTuHEs8xPb0uSNxR9SYJZT
	b/WlpFso132vlf9obrD0ANvNpK6TQs70zJO3ZKWkgZOv8fC2wWSSvOtU9ZuAt4lmYmLdvfIoHaH
	aDiv6uibEdS3WhVzH3eR8ljrFCqpstS3vlARnnDcMlB+3psZsGpKut2THk3/j1tNky7IVRD4AvZ
	uNjNjsL7YnsOpRNJ58zjq/8K25D1eg9Zb
X-Received: by 2002:a05:620a:408d:b0:8b1:1585:225d with SMTP id af79cd13be357-8b61822c8ddmr761340785a.82.1764923591067;
        Fri, 05 Dec 2025 00:33:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvCTznjuLTd687VjM6qtxYI9yUJOjuyMNTDmIuSFHO+nw/t8MIdWeZTeXTyfuTr7AAid7ttA==
X-Received: by 2002:a05:620a:408d:b0:8b1:1585:225d with SMTP id af79cd13be357-8b61822c8ddmr761337285a.82.1764923590357;
        Fri, 05 Dec 2025 00:33:10 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:53a3:2e30:5d7:1bde])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310b693csm69356755e9.4.2025.12.05.00.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 00:33:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Wentao Guan <guanwentao@uniontech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        andriy.shevchenko@linux.intel.com, mathieu.dubois-briand@bootlin.com,
        ioana.ciornei@nxp.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhanjun@uniontech.com,
        niecheng1@uniontech.com, stable@vger.kernel.org,
        WangYuli <wangyl5933@chinaunicom.cn>
Subject: Re: [PATCH v3] gpio: regmap: Fix memleak in gpio_remap_register
Date: Fri,  5 Dec 2025 09:33:08 +0100
Message-ID: <176492353839.12178.12868945450381013529.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204101303.30353-1-guanwentao@uniontech.com>
References: <20251204101303.30353-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2MCBTYWx0ZWRfX0eOOKENzl2IK
 9EOYo+INiUvGWmYWi+oZdlCbbBdHjxqAM3dUYWdvd1aorikGhCFdE6USrEQktduYRB6lo8r1ceJ
 ml0KMOgNVkG34Z2uvXgd9OvTmZHbd0r2KfeBpQ3nKT2XamKmV+fIgwGI/e3ZbXz7D3jf1w9LqcG
 bzhY9N2fOg7dxGACL4wFtuyRR1GkWf6dfzk3bVANKHewxPPsXcgOp+T/7Qko6bKPp77JZCcX1Ph
 QhsCBMqdpnmA0bzD1dxeuaF+8IvW/m39/BAYyqojN2Ww8soMpPHSzlRiFZNMfg6Xqcv+IKWaNyZ
 yeh3Lla7GHh3fmrUUymW9MGuZt8GQcbSbIo6g3DvAWhj2GY3nXzLMB83eNLUyXPugHLwLSuVfif
 qOdWTAihCBrSRstJU7Z74b84Z2fe/A==
X-Proofpoint-ORIG-GUID: GcBWBFJaj1mrCUH2LiNi407D0VR96dFH
X-Authority-Analysis: v=2.4 cv=DplbOW/+ c=1 sm=1 tr=0 ts=693298c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vzvxVwKKtc5QML-hEyEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: GcBWBFJaj1mrCUH2LiNi407D0VR96dFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050060


On Thu, 04 Dec 2025 18:13:04 +0800, Wentao Guan wrote:
> We should call gpiochip_remove(chip) to free the resource
> alloced by gpiochip_add_data(chip, gpio) after the err path.
> 
> 

Fixed typos, reworked the commit message and queued for fixes.

[1/1] gpio: regmap: Fix memleak in gpio_remap_register
      https://git.kernel.org/brgl/linux/c/52721cfc78c76b09c66e092b52617006390ae96a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

