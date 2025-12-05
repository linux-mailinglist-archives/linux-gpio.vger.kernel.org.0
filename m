Return-Path: <linux-gpio+bounces-29280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C0CA71DF
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 11:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BD7230B959A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 08:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4EE3101DD;
	Fri,  5 Dec 2025 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bK1D1v4d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ds4dUFSe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F403101A8
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764924812; cv=none; b=l77K1Rc5XRekK9dovW3PsZQJDbv81wtbwwjsTr6gQvoywbWrWvIbt3nSCa4vd/++xa79WZ09ug2E51PBP2U1tiXUA77VGFFReW3sbiWNMehqWn+4H0HTNdtPfCc0+1Ze3H7TtzAVvqlZZNKg48VCCd4eD3pACmnjrwo657llmkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764924812; c=relaxed/simple;
	bh=2nDsZU7ed1g8B6jl0qfKOMx/d1xNl1/LKcBjwqqcx6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FvcHqwJ6CrEGDH0UCufeemxRfIOM1TC32hSGF0vhWXBaIKCEqRa/u7rNuXhOfznFNf+wvyPkusL9O0b06rtrNaHYfYifq3ychdHGqDhdwF07ASBrLWWK4cGRVe9cUOM0mPDQihzxR+pTYr0TLTYl7Iib0cmHD0e9xSTIN5OP3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bK1D1v4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ds4dUFSe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B55cvic2957840
	for <linux-gpio@vger.kernel.org>; Fri, 5 Dec 2025 08:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TKI7MOpO6uXHh0PJgwQUZyYZnTIaBKwM2PnboFKCNi8=; b=bK1D1v4dR9QM/xZV
	E+Yqedv4aFbsIx0fXWsINUBDkx/jv7Qw7OJuZ1NFjHhvl8Jg++1OzkVO4bHzlLnO
	iKT9X/u6wpunHmU/xRDV2Xugl+0T6iZFO35RGxOqc8/dT/HucNWqOP8VSVm4R0UY
	hOb+ELTBUhqIVoU9OvIsLyyRyAm8pjh48T/xhD7yPannxQdlsHGnbZCUiPs1GUTM
	M3C/PW8zRzYz4IchY6LNjFfEdQafnhxNjlyI70/FB5MANKul7XGiYN73HG5XKmrV
	iZIRWxC0zAECQ8awO0mlkBfTCQ88H35RYd+Yxgwd4EThGZIr/tRp37G/Mrq1JdRQ
	cNZU+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ause78g0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 05 Dec 2025 08:53:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b51db8ebd9so587220585a.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Dec 2025 00:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764924796; x=1765529596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKI7MOpO6uXHh0PJgwQUZyYZnTIaBKwM2PnboFKCNi8=;
        b=Ds4dUFSezWSYu90kaQ9IbL4f/Te11/Ri59qVFwJLbUqVlEfbdznkIbGmrg2b4dXFtq
         JkyZb0FKuI3fn+Fy3J3x7/z3/CT0AsMdEG2nlMAGNUKKPS3v3A2MVRNlTxbvl8ic/FVa
         x3CTtX8kuiQoLscByZLysWXQe+trG+8o4thRVTyZEBMg2fHcbY7+CFNBL2/1QwA+lb3G
         pUPf8R/WuJW1Yd+dBaWryMq83IwjnedvrpblG6oiThoNe1UZowRvFBFYDL6JTGdML8Ht
         FfhY5/4XaUfoCokyP8ierK4NxPOYmWSPH+kHQfAsfrR2S4kFH0fYZ/AZCKPUIdxDvUBn
         9K5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764924796; x=1765529596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TKI7MOpO6uXHh0PJgwQUZyYZnTIaBKwM2PnboFKCNi8=;
        b=Xc3vx1x1CxIuA6JrG3P07DGaUqDi7OkSGMF1S3YDui6OeNupX8m+CT7XRFFSiXgFCX
         Q+dqZyNWhzcfHqiMz1wQ+6WCVu0eGQ6xNzWKjlEc3cjjRDLD86hHBVeOPAEsfFph34ih
         PD8gJFi7TY/1YWX68uXu/J7GB4aIFGyI74r0Hht2gw1bZV8mW7Uz4xeioG/d9PPxdYsX
         wrSQEbCEp3TLsHa8c/rD9qnue8nCNmLTCpkNY7kGILp+aocV/x1FExBxReoT3heCXilh
         GUUoGeDvMIc+0YHVexR8RL2A6NsC65xAFtZTFbZNiMwGUHRbsFsRCM287wLpIDZ82S/h
         fB7w==
X-Forwarded-Encrypted: i=1; AJvYcCX2lm35Ch+WouJTyDrDM59iH2WtflMValF9JBcRSv6pixoQQ7DtXEA2L3kCfWHWf2MWwxXFuWTTiC44@vger.kernel.org
X-Gm-Message-State: AOJu0YyPrWUG+0s89/7je8rckVxrjrE74Axilfeq9IWPCKSCr+aeBstW
	MjinxQY0IrrktAYIqKZ0xQLGAs1TOjxC8JpoGVbrpbBTZ025f/2KQUc8gluw46fuefmdZbKAM2x
	v4DUY+rU4zi0NoE0kY51jEK7hsWacVEZywI3J7UflpyH4wa8QcWzOlNDw1dlaoygg
X-Gm-Gg: ASbGncukPbR8y8/4+AS02ZrHcV0UmXEocviogST1LtoGdysao7Yp5zGpbMv29Hw1Az6
	TYKTgWxUMga5pUOQRE7FvE317EGaGzzjYPNqUzMagNrqejaFSwrmkr8SxT/Bav55HKjJLXFk6YA
	ILJpH6xZ/022CasYmFr8qeXGfeX1WwYgqT10s8b51GNNi+M0r/Ibi06pX02RvoEuJn3y8TGLw5X
	VXPetl3rHrInnaWwjmLYRv6xC7Y8XaYu5RsOgFOJ2dHzZMxTxjzWmXIh/qykfovo6dxNRvoQPxk
	GfO6o4hXY59dH6rwXfVp/+kzpaJdHCO0pMr/2pO8JYRJ5MKNh0ht3wFmdBxd5k7EhSSqdG4VnLT
	g3e1H3IcY3PoqMZ6N069z/TaIslL0gLOC
X-Received: by 2002:a05:620a:7006:b0:8b1:1585:2252 with SMTP id af79cd13be357-8b5e47cf50emr1339391685a.1.1764924796288;
        Fri, 05 Dec 2025 00:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEvlriyDAkPnC6Bfy+kbtSGEbvPn3GvOAEK5zzw+PA5Hre+wgNFG7dg/jNjIXaqC54jFPn+g==
X-Received: by 2002:a05:620a:7006:b0:8b1:1585:2252 with SMTP id af79cd13be357-8b5e47cf50emr1339390385a.1.1764924795879;
        Fri, 05 Dec 2025 00:53:15 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:53a3:2e30:5d7:1bde])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee50sm7648348f8f.14.2025.12.05.00.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 00:53:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>,
        Michael Walle <mwalle@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: qixis: select CONFIG_REGMAP_MMIO
Date: Fri,  5 Dec 2025 09:53:13 +0100
Message-ID: <176492479088.13655.14338870904254970717.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204094928.1031494-1-arnd@kernel.org>
References: <20251204094928.1031494-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0DMwQWetJxLFVPnQMT8c4pTQmuTjn0EO
X-Authority-Analysis: v=2.4 cv=YssChoYX c=1 sm=1 tr=0 ts=69329d7d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IdEvpUAqHS6lgXn1gkgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2MyBTYWx0ZWRfX7LD/VUKPPxUE
 1i2n9vCSnw/kirsQLOomkfcmJ2/cR90J6Ja/Hsqu5iTLm+x89XJ5cE/vLCVh8Lmsqn2FwQtD7IE
 EaWF42tZJ1XK7FFXiCLSvUJaSvLZfG3DGr9GTm/MKNDU8yFLZ8WYillV58VUFBAmUO8crfE2aNO
 2POX8P7yxVIP7o3slozHw2ddCbSnrW/B1JuUU8ZB1SsogMC9+YS5bYv4q5sBZMInlw4VaHNMG9U
 MVjkjZ8Py9GGpBXMeT/Ju1SFSu+0/mJZlNDdzbRr+yj3GGMgt7ubZwzuoCxbEfwN8vvB/lQ41oU
 z37CH1Nn3jNsxQEPrE7wX/N+0Z3i0pOA0+E/2sw0xWJSlKabZ0wC8YbmGZw4X7atOThAjTaxaeb
 rOIFghCYzYuFX/Ua94AWiTe5q6XAxw==
X-Proofpoint-GUID: 0DMwQWetJxLFVPnQMT8c4pTQmuTjn0EO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050063


On Thu, 04 Dec 2025 10:48:47 +0100, Arnd Bergmann wrote:
> The regmap drivers need to be selected by each user, without that there
> can be configurations that fail to link:
> 
> x86_64-linux-ld: drivers/gpio/gpio-qixis-fpga.o: in function `qixis_cpld_gpio_probe':
> gpio-qixis-fpga.c:(.text+0x13a): undefined reference to `__devm_regmap_init_mmio_clk'
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: qixis: select CONFIG_REGMAP_MMIO
      https://git.kernel.org/brgl/linux/c/db9c67bfca8585bb7f00f289056e7b83502861c8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

