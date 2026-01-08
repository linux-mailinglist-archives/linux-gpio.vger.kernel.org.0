Return-Path: <linux-gpio+bounces-30277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A06D039DE
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 16:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D6BD30131F2
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 14:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5704D47DD62;
	Thu,  8 Jan 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqfR5PxB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhP0/wbt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD9478876
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882213; cv=none; b=Hbpl3FzhzR6XOLE2o10WRq3r/bGrOmdTla6yn5nlbrcxzQEWtDINGnbDZueifcKXvFesjFd3Ac9/axVK1UHFl3Bgzupd7ywiGDggnZsm1bHdLPTHfB2k+BTT2h23/BjMluEWTGI4PG5CQ5qHzTJ/derJmwT2aVBHSF13a0iuObI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882213; c=relaxed/simple;
	bh=+ZrfrczNrfjW1fCSCyE/s4eYBeev5Z9TIijLKawfABE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gFivVxbI+Xy0zHsSiykGX/z5BUK4xaciUR3/fSQWs21iIpsYJXBB/BS2QM0df21g6f4Kt981KrDWOlG5nnY7NdKScRMAVI5bjmsyC46HjgoZe2x9wmoh6UCL3x0gXMX+8oE4pVQqf34P2b+TCQFJ+jAIMY2Oz/q4KSnONDC4G3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqfR5PxB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhP0/wbt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608AiG293701435
	for <linux-gpio@vger.kernel.org>; Thu, 8 Jan 2026 14:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eVwRtiJDUxHxmpPaowK4PRzknoSMnqs+mAFYkctgzw=; b=HqfR5PxB+N0BuNjt
	/zLTxgN+vdc6YD0jOkrhyewIPo/hfZzMNWGPE9wJ5heia0L+ZjDKzZZkBYkjjT+8
	ieE0h+KBe/atu9c/hOlQr/06YsbWGzipSvmVUrFQ8qAtFRZSc4+5AcJ+4PS1vCYh
	ggMGSymqqsY1RwmiW04w7wztxgw7vmWsQkKU4jjWyMAexq1CunytTGFCd4PJjDGM
	aui5oOHncgjhMxH4Y3ihYu7tEnFbwp0gJGN+UhkSoKDlbyHatKSyJzmtrSyYIZxd
	IHJj42H/b7Gm8+JmaItmi+27F5g9M04jOzpNZdIAYABNunjhJnNBfq+JQvp+LSKX
	O6zMbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjb39rkpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 14:23:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1fa4a1c18so764318485a.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 06:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767882211; x=1768487011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eVwRtiJDUxHxmpPaowK4PRzknoSMnqs+mAFYkctgzw=;
        b=EhP0/wbtQUaNyolUbYs5hxXEmtWe2aN1CXraRPHblSr6+upbYTI12BO9C5UjqCVukq
         znJGzzgLQhVo6s/FguqF8OITRypvh0uKI3DJB7YanhJEGF/iL6G8WYA2AsDPCp9ravI/
         kh9Ub1tP4CCfJ+ndwkgWORdi8HuUMcRsCjZEST8qITAz5HxadRZQbxvf46BOPLKZpeXn
         yHz3sedOY5ZcHt8qFRw9L8EqFa4wgnDfAIzqjeYBgzML/YjXKoRCoC55tyhUFiyI8RMH
         /1EfhTJH5qNYjgJzqnQNow/o8TT6y/M8tRPSOeD0WTbFUTE2l3m8uW/H3JYygXGMT2vQ
         VOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882211; x=1768487011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7eVwRtiJDUxHxmpPaowK4PRzknoSMnqs+mAFYkctgzw=;
        b=i/GJHhMnk1ztU/dvKivuKluajponZdcqMpzp12Sj7KEOsveasr9KnUsNtJhnBHcxSu
         leZzboEypTR+pwO609jqxm1dwgkjWf1F/ySAnQUJRG/UNWvnqbA1Nyy44zxzzdjaaArP
         /T14Y6qkpIF0nYCl384RPeP176Po3FOEllxAvI4hUGlauPK38mNO+mjMN8a2j3aaeqvt
         utuEMfvrMwpglRL+a8O5X1J9R0yVZ7Q7MtSepkChJyP0KV8gvA+QP+cWZkdvoSeppjWP
         SuzsQqVQ+MxNqLhz4s1Suabd7ffh67yLclH0bpHSd4YbRz95vxfrU61pUA3+O8jOqfkR
         pJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX97hoQpYsCnp8pHdkNSX07Z1EOf7hPEhKF6qlCLxVxy1JPjlm85iO9kNSjJGOknxXU7dlqWt0o0drK@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9GsvfR6YeaSe2/pjECtTyZhvmmQJw+9qfX9xd0MzlY4f0ZeP
	moRMn8Apz5YbXktG/eR4pn3tK2UxrSM0pJphSqlFm+EdE8CL1e2Sj046JuywJP01IVj7sJZbuxl
	GR7qhmOw9cSs1uwmZhQtLmpEI/RAba+Kl82Vf1zvz/v0Lg2gnocQ3Prt5J5N0UTkC
X-Gm-Gg: AY/fxX6ONEOGsjHelOHPmUNb9xXuNkPQTCYivXqolneP4YVGrVlbITqWjpF/KVaYwGU
	ILJ2qWyaRCRC76CIeHGs7iqJYrYhYJJl1eixhYusI6xSxDRP9bZQalyshNGpv8Mtk19TBlJjDGt
	ME/DjOiKzoJPiA9rcGJOxPWgSxWiPFiJvtIaLSJj/D8yIEbojDK+ycDTampaLN8FJ8lpBdy/AII
	H6v08wi7PSjvxMYoI0maUm3uXM8g2kaX4UmCtVIrVZJ6/EoCCxqW+gEP95NnFWIHFZOhuj7Y3xo
	ibJ99GPWkXpJ5bJsDPai8iGZm76pCEBZk1/jrIy1ASaUQMI3WHBamHaNUsmXUmB5Z/lkumMQrQR
	haC57e0IbzzTaBBLBWuQJcMz42qnf+F8ZT3yprg==
X-Received: by 2002:a05:620a:2587:b0:8b2:db27:425e with SMTP id af79cd13be357-8c3893dcab2mr768026685a.50.1767882210701;
        Thu, 08 Jan 2026 06:23:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyi3nWcn43SMjVyXdm1qGDbCmIHQzD77uA9IDLwKb1zgunp1lCtmXUXMeUfTquFgvzqf54Mw==
X-Received: by 2002:a05:620a:2587:b0:8b2:db27:425e with SMTP id af79cd13be357-8c3893dcab2mr768022585a.50.1767882210291;
        Thu, 08 Jan 2026 06:23:30 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5171:301c:72f8:fd25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm165185405e9.6.2026.01.08.06.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:23:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix lookup table matching
Date: Thu,  8 Jan 2026 15:23:28 +0100
Message-ID: <176788220238.35397.4252497861767343282.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108102314.18816-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260108102314.18816-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i5FP-Ki5YimiJ9H5zUStRar94z07YFOY
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=695fbde3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AQvHNiK9wnbVyoP9-IsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwMyBTYWx0ZWRfX7eP3GW8R16MQ
 VajH8C2qFVC4/4V+ATJBzLVyplPEu2sZasvGMgkaxACANCrVvAXQ44Cki5WrtrIXyg+Tq3EBoFU
 D2FwjSXj4+HroWZrqOWJu94KzAEFOEojU4poIe0/o9fIukoQQeUcbpsxGxxLxfNXWIzcEBbcTkr
 V2hGsjUU3GOamnR+QNosp+1YnH54CY167kQlofAe5ZjSfzP1XgZdxwiclDnRgUCfwbCpE3l7KSa
 QvwAXl9fIuOFGerNihwGUTSTtMm972uqGqTLUhkdGYH2Rkba3XyvOGtNqNc3ZaFj22DQ0+mSGyI
 l/fAy2ZUPd4y21J3jb4O9sfkw1P4XpEMot5VysmwOCMeakrP74M0Op0L/CJ4g7mqEtJMjsOry2C
 HCK0qXC5lCYv6eBesavChfAhGDOqJB1vDSD5ZqtRLlujSVMD4mveYpfiUnr2XOUuNisNVue4f2m
 p7aPZ2qvRVjc1P7YWGA==
X-Proofpoint-ORIG-GUID: i5FP-Ki5YimiJ9H5zUStRar94z07YFOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080103


On Thu, 08 Jan 2026 11:23:14 +0100, Bartosz Golaszewski wrote:
> If on any iteration in gpiod_find(), gpio_desc_table_match() returns
> NULL (which is normal and expected), we never reinitialize desc back to
> ERR_PTR(-ENOENT) and if we don't find a match later on, we will return
> NULL causing a NULL-pointer dereference in users not expecting it. Don't
> initialize desc, but return ERR_PTR(-ENOENT) explicitly at the end of
> the function.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix lookup table matching
      commit: 36f597bba049928004a050c132ab787ba0eba524

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

