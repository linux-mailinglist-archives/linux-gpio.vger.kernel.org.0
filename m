Return-Path: <linux-gpio+bounces-29673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5F1CC6CB1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 10:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E05D303788A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 09:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845A733A6EF;
	Wed, 17 Dec 2025 09:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1OU336M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2m/Sec8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED12337BB2
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963591; cv=none; b=F8dzoPj+ypYBROWoTfIFCeibwAoWdcS4/UBi+UtrbrJNS6KcecKDEXwbPUcgBxYHhPaX3yZKKN/I/5IJdt/HaeqHUPSRhpwcGv0CAaBqU/AjhRFV88spH9s/ZmJLUXeLPaJKJFaU6EOK2kIIjDEk4jOPNUHahuK0p7Pu61nmYqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963591; c=relaxed/simple;
	bh=eilPgaC5a56TDGtdi2o3sUAHvYFiNCtzrXXsNvP4CR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxFJswAzD6Z0WzXonKlFyteiz4AFTCeHbDBSTLUaIX3XJ6mHSeEGrX6Uyzsi1sXR0LEMD/1kGiwZedrWUhnYUn2YBnngHBLTYnZDWHqU0TLKKt6+THdTRfwbuGbsZjLnZsX+uVM2mpT3SDq60wycn7rK3nLlgeDW3QEzm0m/PsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1OU336M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2m/Sec8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3EvS71871277
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZPqWkFDO77Se8Ad2HUQFAQrFafE87vOJ31tLHOgA74=; b=H1OU336MG9TPZ9dB
	mGaXPBFnrWECRoh8CfuTidCkrqM4P61w5r5lyV26XyG56NLnE4subyj9JCpWhHX4
	ZBvA3/pnKOMUkVaYW/QRkZtv7GANNUz14IG4+P4eviDb+keVsBaqX+mDzDXJ8IYn
	DAuiICQFHF9r0gZyhIo4Y+er9sJ69q1vGWUOCs5yUEL6t4Ge/ZYjp03Rg9O+WY59
	zY9kQ7MIXy68EbWhxhfhKzLzflPGE0ZlWBptMp7IeI4Bc2HabA24fg2M7eGCm6YF
	to36hb2+EBv9PT/5q37C6Wip45VaVmQnQwFsrw20zft8RnkhPJIqljwoGq8FNhk1
	GIoblg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgq9d72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:26:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edad69b4e8so9060601cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 01:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963585; x=1766568385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZPqWkFDO77Se8Ad2HUQFAQrFafE87vOJ31tLHOgA74=;
        b=G2m/Sec8KQl8h/0rTe9AnK/xBl46tJnx/LKNfyYiw/vI0eWrGQaqM0QIS97VB6eS9E
         hzHIDftOKybSXoxGHvNWnZTcYtm7JByGW72Ps5bKWwrm4rofQWy+9kENsSiAPP8KBFX4
         z0uXJmhFqPRCtoWU7bf+JRKN+Fl58R3B4HA1Kj/phnTS/GMYbdPEwao7FnS8lvQHKB+R
         hdiy2UtPuEtIUPEYiyXdBvLwvRQhuHE49cj3fBd1aNgmzsVjWBSJhB39joYY5miBk4G4
         RwkXUVuaqf76F3nGwv8gF+2dCqb3EiXaj/yT8QwY8F3Ob/evfLCs4OglZLzLBzkiGl2a
         gstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963585; x=1766568385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZPqWkFDO77Se8Ad2HUQFAQrFafE87vOJ31tLHOgA74=;
        b=jhIDXFWupXpYx6lBprvpgi0q68k5Rc3I3Pm3Ylz/yOkwFpJcQA4AtKNicK8BViy32F
         R1Dby8It99DTJ8FbOOAEj2lmag4CHzAhhJvYSTT1M40YV3zyQdhTVosavJCHlDxosi/T
         XBDuKlX681y5pPLWKsZDO5Du33HlRkEHQx6iy4iSnR4mvxf8hXvoZxuyxYvkXWtvft/b
         UmkzIBqdHmql/uBrn+HMqNN7myqa8TnCV3HgZPcE3eJUH7n6qwllD4yWc+YtN2Ef+CDy
         3/CeWXKrxXPhPv7PNo77sZp9rLXFf0ssyclBTzwWy2RU9RKos7AuIJnoH7PIPNpyiw0O
         v7hA==
X-Forwarded-Encrypted: i=1; AJvYcCUYYPJC8dWgKKpFo/Ntyro+s8Ke3Qt54psB9Htvqgubd/g0D5H1K7qmmQKIHmGDM8zsGHwO4i7M6CmM@vger.kernel.org
X-Gm-Message-State: AOJu0YxA5IMtDTDNt8vmyuXbZMdpzsTmeUnWjZ2CzIfTywFtna+6o86u
	RwHhsrbOuDjyJybZ/avFkW9XlMdtDOgXYFL2byyQLDNESs//siNOdd5lPIy5GjSdF6gTXMQ57Qc
	xv6tVQ/bbSRgmbo9vrAunjnB9lO6ooMR6QUieE+oKwzt1mJBzo4q0VB+gOmNIk2exMsMfp/Oc
X-Gm-Gg: AY/fxX5FgxcMvHWu+AqSeCgv61OLVlvt0b0SDERFFLkdZvgVzGn7kmEnjdcCjvP29Bj
	BcjZSL/AYkbIk4Ayc0DW1w22CjmTq+ePYXLVys0GU3Sy12UHLWOKeQnoUNw47gzjtE+mwhk++wV
	pYmtdBo5nN3hzRHLx7LU8xjuGTSzJpUuQmgjZpDVy6YjNt19UpIanFBv/zn/g0JGNv5JMa93hko
	ec4v6nqJ8Be5xZZUoRjYqrSfOl5fJfn382XulX2zapJc2c2hxo39FiUZQSt/WbXLekZo0ICDLFA
	4kOgSNKrzPdmd39pWZuR4XkSS4NmVj0Rvz4VcjyN6BZX2V6o8Du8pYFBIrGjE0T4u1YMCmYczhv
	ingHl2XltQl0upy82urejTANLsZgoRmgzqLgP
X-Received: by 2002:a05:622a:54:b0:4ee:1f69:fdeb with SMTP id d75a77b69052e-4f1bfbbafdfmr278656461cf.11.1765963585396;
        Wed, 17 Dec 2025 01:26:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPWQWXrx1icgipws3+4EFAFRt9v1GZac3e0Zj8213qN2FjkHqFMywhiU4vg0VcOrPpZTg2KA==
X-Received: by 2002:a05:622a:54:b0:4ee:1f69:fdeb with SMTP id d75a77b69052e-4f1bfbbafdfmr278656281cf.11.1765963585009;
        Wed, 17 Dec 2025 01:26:25 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:594b:272:c2fd:21e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1e6306sm28874335e9.11.2025.12.17.01.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:26:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
        Daniel Palmer <daniel@thingy.jp>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: of: Only compile in MT2701 quirk when it is needed.
Date: Wed, 17 Dec 2025 10:26:23 +0100
Message-ID: <176596358047.7650.15633360778751649351.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214034045.4029590-1-daniel@thingy.jp>
References: <20251214034045.4029590-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=69427742 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=BAls1eSrFPvmOLN3:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=L_8HWU65OAsB1_SPZpgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NSBTYWx0ZWRfX6ySR3TSGp2Uv
 CEyaB7FrDbUdYzierS+uxi/zW90sEVc8ZLAXttgKlP2vxLLyy1ner3qWryjVrQBQxY33ql73TZq
 GhmAZjb/16UyNy5niVV15/2JUvKd5ntHdwt67NCxcGXSIwV6DKFirE/5X1qIxQuaI5PYqkBqsFn
 VPj/udNW2SKBL2qPKIfidBMLRv07bBlyiu0Ib4SsqgEbCZ3eKU7u1YYDlUHBWNXb7gWwMYqPcGN
 Ml+mt8+vsNUput/iGv55vMqD3aZH7FlyaCtbryeGhCRvMRgj7R3jxeBv3sJFLkO0MeSJHdcufKr
 J48sWj2pWpZpq/GLV1WywVqiSxVF2rhxkYb+pnK4hvl0jdlatAao7/1umtQz/mqxBqqDHrLOq4D
 2EzKIfpkSS8BZRfc2f1JLFKm6jSfZA==
X-Proofpoint-ORIG-GUID: CZzuY5as2K_b4751YUu2sDqh8zSAeb9D
X-Proofpoint-GUID: CZzuY5as2K_b4751YUu2sDqh8zSAeb9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170075


On Sun, 14 Dec 2025 12:40:45 +0900, Daniel Palmer wrote:
> The compiler cannot workout if this is actually needed or not
> so machines that will never need this code also get it.
> 
> For example:
> m68k-linux-gnu-nm vmlinux | grep mt27
> 00135742 t of_find_mt2701_gpio
> 
> [...]

Applied, thanks!

[1/1] gpiolib: of: Only compile in MT2701 quirk when it is needed.
      commit: 77f25f0c2e1f59b35600b4d29bd6b2c54c31ab75

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

