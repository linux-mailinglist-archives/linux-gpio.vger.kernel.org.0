Return-Path: <linux-gpio+bounces-30434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFEFD1149A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F0CF30738B2
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 08:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1EF342526;
	Mon, 12 Jan 2026 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L73P/yaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPiegj4B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A91341076
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207276; cv=none; b=S9FHynYwt0PEfOgBcZGyeebalchO4b44iw8NCDRjNQ0er9dBQAdeIR+U/uC+15ZkivKOWGXDcvl4SDHKz3dSLwgVhkXJtc/xFePMI9f/yBqaNZYf9YaaQPTs8hCjaN+NlTTd2Vz36Ey93jLvwMiFVZLB/5e2s56GIbPpdHYQWLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207276; c=relaxed/simple;
	bh=q2QlYokdf03S0W2UdwO4jA9l+yQf2xP33BPLIi1S2/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWeVzU0m/XZm+FxzAiaSYHLMuNshObQ0k/y30yCoXkYMICxMKT4uRwpxnoi9rkuvboayzqsGpIszXrUkrHcCPLpuCGQkBS6LVGPGLw5jyPGvg9lqrtRm8etGiHhnwdftz5W9Ow4QvN+riKCWmMBHJszw2vBRHS4LgtKtVXuX2AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L73P/yaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPiegj4B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7OjSI555467
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 08:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDUjGx/ZOw56ZloBT4UrEsIeJ/wiXm/hCSNqcWwCQkA=; b=L73P/yaYvkHc3+z5
	AuO4ehXGZKUrI6N/CjFgriRjCj8wRuT7/10RFAA6uEjBjw6e2tMBLx+05umOT3pJ
	d3A2cj2QyMst2Qt1kmL/CdxkaXm0ZSNheq+3y8x8D8cU5mzN2POa5BbYvGGfjI8m
	05ULgh9R7KY3dVlBOmkFUz9WBhebMMS964/c4Vg/1EjmoNhCHGU3JXECJXn6gKwD
	fdFs09GSUDdCVPpoa+4X2GMqWN5uzy9Aw3njoDAjBvFxmv/tCqB/Evy79B7BiL7T
	CsGIfa/n4QfaH/iZDT6JoiJog6GcD0RiByHTXdEdd5wGNBJYq+TeF7nQYMuidCY0
	CcYVQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw099k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 08:41:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24383b680so2475621085a.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 00:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768207274; x=1768812074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDUjGx/ZOw56ZloBT4UrEsIeJ/wiXm/hCSNqcWwCQkA=;
        b=jPiegj4BxLuwcTCioitUip9eiHZhQqjkB9GZ2FhVzuiN4TjqbVMKK5U91QqJv3Qh8V
         cHToryMwIKebpntoTL3OsuKCtGOrccfGviPpPYhe5YAD413Uz85gjyVLEZtzIIYaLgNq
         qakWCns4FJeF96VO03LfNk3VtrwwQw1v8uLG03dFG0oc5QQ2KSCvuofHDu+p5dBtTEmd
         gC3A3r0JwD98c+EQ3p+fwKTytjE2Hq1oUkHfkHONp9s1CSrWj2CwJu5SCczJlUwZaIBD
         wdBugt8jS8BlIyKeA6sag62jCblh8aYK72IPnVJhokx6sShj9uFSE9ZADwPQ0ivcCcLy
         hmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207274; x=1768812074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YDUjGx/ZOw56ZloBT4UrEsIeJ/wiXm/hCSNqcWwCQkA=;
        b=T+hfSwIDP8mS3vtj30avrtRVOyrVBuCpCP2dc8vURMeAgAyCoYVAd7KPP8JDsWZuo0
         hN3kanBP7iewJkno8WK71qBoixsN7IkeajqCPEQVaieh3yrO+39vDKimwW4Mf8OokcB0
         LsvAcHuYFxKkquVeXDyW3gKniu8jzTgjWXGowl4AvTLfN33Z8K8EIoJC8NuB2BZMZ5rD
         ZAfFjmqbCno73T7Tnp1X0nya0H4nltnehsppwNex8KdXSqTrrrULPg1kGlRGnrYZQy6r
         rciK0j6WKfsf46+E96+sopED+xXXkRbA7+KLjtWomSinuju7JZJ+yXzHWRt3MAzVIr5f
         G3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUZXwPu6f9jGKSoTZU7j0wCmQv4WGXzxmGExdd0dz4UjnKx1efPOQ9ZaNPyOS7lmxVh+B2IbFVezNj4@vger.kernel.org
X-Gm-Message-State: AOJu0YwfVofuv9+oKpa1sqTPHu+MhcRjmffxtUCVKanpYVX5YHvSuyaQ
	F/ILl0XA6zepGZcohk4OJAuRTNgx3myw07qLQ3s+H8xDVLAVDhJWQX+X497t7xe8wqQEDMYQRWr
	YmlkxT9414Wvzo5Bp0KWgGccmdKxKQkFk4PVn4b4UQuoA+doYEq8KFwRhC1w1oJ4M
X-Gm-Gg: AY/fxX5APP/IVZQ4twCfhxoF5fcpUKWG/iio8A+z/BlpOtK9AsucxOlpaQr8LsEDzpI
	/OR1M338bDuhf3gIXZ3nikTYEOMKgIb4K2qfzkWu4Z/nLkQaJhlH0siswoGXS72EcXTnZmYxZia
	iTt2vI/RQW92M+19B718jcvPzlQ2qzDZ5Yx0f+u7uKDgYhtEeDvCg9BbUMjPBuPM89RBzH4nhl7
	AfAn6NOiXyKdF3XpOlJYJ7q2GzUpqsW8/EWMzM43hkbrVdy0zkfiSdMxnOSW23H8IAvVET6z5xY
	E6S0DXYxBOn4g+chriAtPXF5LM/arSzBuujFH4CUWDW1dfUC8kjXcG4GPggitDFxNs8fGuL/zxX
	dIqBWj5A1d6DQg/hXMCm3afgwshKvvnmelHkCTaU=
X-Received: by 2002:a05:620a:4083:b0:8b2:87a2:9c60 with SMTP id af79cd13be357-8c38942b90bmr2357473185a.83.1768207273683;
        Mon, 12 Jan 2026 00:41:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEez+Er0gfsZ2wOCuWhTgBz8Je2voAyXBQuKBPt8pZ/sobpqFcxVS5GjDlird8dbnAScpKuOA==
X-Received: by 2002:a05:620a:4083:b0:8b2:87a2:9c60 with SMTP id af79cd13be357-8c38942b90bmr2357472185a.83.1768207273287;
        Mon, 12 Jan 2026 00:41:13 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a056:e497:8fff:6413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacc5sm37279608f8f.5.2026.01.12.00.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:41:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH] gpiolib: remove redundant callback check
Date: Mon, 12 Jan 2026 09:41:08 +0100
Message-ID: <176820726230.8044.8743651981622570624.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109105557.20024-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260109105557.20024-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2NyBTYWx0ZWRfX+QHqIEzmJdfO
 vCjmVlwp0wSsynrr0nffu2ZJPCav0A2g6aOe38wYVUlVKWSF1plgEUqL04I0ExsGTccE5p+9T3K
 hySvJb+aIbRim/Pb58M84bAcfMk+BZcdDfQi6JtvqPKLwZLDIXijqfQuWZbGicIHVwBgGYpZ8yA
 j7d6JdLwxUiuI7YM/5hGq0u3B+ni2WQkkBhOGTRBZczp+ZxCvNsPAoG+O9CZeEQf4LGzKVxK5Fv
 6iOQ4niGlI9ZsF/mimfB1lcHi2+OSBoqnxF6KuVIcHoUfpJGAluppjc4z1NqJbffKSOWReUDjdY
 sOeGtonLImhl0JI3E6p52j5B3OhMCTXtIXlUgOi49/NNwAZj4PGaVTFBJ0ZNBhUMsBmuPmbhDGK
 sUCIsC1f+TGV2jdpPsWdyeP+UYrjy1wKmNmwPaH8NY/ng4YD7Lq+LJ9U6L1cVKjYxQ4jq882GOq
 zhIJbRCXRUVd8G6rVlg==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964b3aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Uw1MibG_T-EZoDf9ypgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: eWgaBl9laoIxBy76o7n8dThZ9FrCkCWB
X-Proofpoint-ORIG-GUID: eWgaBl9laoIxBy76o7n8dThZ9FrCkCWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120067


On Fri, 09 Jan 2026 11:55:56 +0100, Bartosz Golaszewski wrote:
> The presence of the .get_direction() callback is already checked in
> gpiochip_get_direction(). Remove the duplicated check which also returns
> the wrong error code to user-space.
> 
> 

Applied, thanks!

[1/1] gpiolib: remove redundant callback check
      commit: 471e998c0e31206ff0eac7202b2659698cf9b46e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

