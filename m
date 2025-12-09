Return-Path: <linux-gpio+bounces-29406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CBFCAF032
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 07:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB1753014116
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 06:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3782C08D0;
	Tue,  9 Dec 2025 06:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqvubtGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DT9hxmGt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E331ED97
	for <linux-gpio@vger.kernel.org>; Tue,  9 Dec 2025 06:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261205; cv=none; b=A0Ua7m1haZymxtcTmaCCeDBKAAQsXKNy1mhIEIWZ4Vdp/1FZp6du0jxazIqBd2Yw70tcOn1JHPkujDyqP2l7qP6hIOpsSXArmkknIfl7/1Q8xCzQNBVzkFHw/mIxOJufOBhOkXxmMe6MH0b5C0bZaRiHcdfcLhnkvQP8eJ0bqBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261205; c=relaxed/simple;
	bh=pkRlKhhntrzRvigFQgk9MxSpezoRRouQVohpugHS2H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kERR4WnbWQn/2sfBG9v0sxxs7MZ2H+Cn0WrnDGGuzVbGQRfzpMXrZJRRSOIJpXwH1T+0i7jCzfGXILn1lRlvdM2zHgNsS/IkbvOJJLYXMGnJehH+TVMb8A1mE41e6SikZRAecSSCKUUyCCkvSXA9HFY6587Fa42tt4Ljb9OO+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqvubtGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DT9hxmGt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXCNl1853437
	for <linux-gpio@vger.kernel.org>; Tue, 9 Dec 2025 06:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+Qc+3J5HjYIAtVhPr5AGG41cvp/NNguDcbn/9Z+2PU=; b=OqvubtGDx3X9Tr0v
	FqQ1l4uTTKmc6HB2RS/4EcKT0HnGzng75VxgH+s1NDcEc9Ax4S+7HIYYxJ9c7p9s
	/U9pfEXTidUWvgis9vrZVJt10F2yHJl7QWk/Wwet1g862hBd6712YKJNK5XRBIrg
	6louorhexR6GW/L3kkxPcIsgSzylNIAm/KX0nNZrxQgqep6pA9Vcz5Sq+o88b/Ie
	rQ1oEHy94YqMcBXr8zYuOJdJeBnEg+qhMWLGh9kwfgyS7dmoAWMzI4DxbiQcrFKI
	/C6uz0l6R3EkSZF9OWRAlNe/ulEQgb/aCg40sAlMxZuhejh0vL9MiHcWRDSmru2e
	fjv+lw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax63v99pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Dec 2025 06:20:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2958c80fcabso114456375ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Dec 2025 22:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765261202; x=1765866002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+Qc+3J5HjYIAtVhPr5AGG41cvp/NNguDcbn/9Z+2PU=;
        b=DT9hxmGtSDI5LvjsQZekQ2nSI+qIPw9S6MC4t53LgKu9PbirH1+gDLCoPyoBW+JP1/
         ENCLjM24mbQ/3xSNKlTlOO1Upcw4YVWSLS9GDK/+dWCW89tf8U1sfDrks90MCUvDNid4
         8QJwgWkMuPTvb82J5J6FKUghTU68wr1Uwp9v69mcsF3ktS+Xl7BK+7ztF7vjuEYXGZKU
         8XcaqBXyYT3Kmg7JH9hP0qJVIfk0J9izhBh6MOYDnknVha5nX2tFKqY8Jg16L0/oZaMQ
         LBGr9cEr1V4Cy16bOJWvs71ZhFt3UkotI6t26nCjtOykq1qN7mhhNH1pkiURwUUcEFo2
         /2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765261202; x=1765866002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+Qc+3J5HjYIAtVhPr5AGG41cvp/NNguDcbn/9Z+2PU=;
        b=B8nThbuJtSa2tlgE9kQ1zr22ODMMYVPlniC2OCeVebsWYynCdJ4axNmtqcFLRavlr6
         zHLIQDrbkGv9eHxU13JyacpmqKw5p4WdRtmf7LZsRic87mdJQeMj55iC3vcNuoBWVd/h
         lvP1I+aiIFTn65EXMKnuL4w0rwjPhm8nLC5Yb3dEwRaKps4DP9vHj8TEO/Qth7NZBbFI
         nQzEFdCWHPb73c8GZDHpBdAl3aVhZzR3z/GdTa1vbRgPTjuTUui9d9xzbyC6flL95N1Y
         HRRRRXeFHPtLX5mZN35J3b6B442WBZu44OIOrtEdgDO7cVjZdpX2p8mrB1CW8DdPnCat
         B/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCW95bb/VjbVm2o/BW2v6URkzkMOqMb2S/LJdFg1YYaqfdhXhFLIzHuZyZKVtsegMqvugMgj1uxRsG5w@vger.kernel.org
X-Gm-Message-State: AOJu0YxpaNHI4TXAJAAX1CP3AqiJwPU4AfD3qjsBGbJlJRQO9wvHOfRZ
	VEAAGWNWZ9HAfgs91SGYPz7I63qvT43WyE5FwV3SiLBcEH2fmsFamXUlFDA7bWl1wLchuofE6Fw
	d6mbjv7iH6JSs0E480DGY0F4HHPq3J4x0Fpr4hJrmqpNiUTVtU2ZtGt7TL6/3X9HC
X-Gm-Gg: ASbGncusAaXzGeFR7UYNAO8xPBbOGbSbsXezoaAc6oJ3WxjeFizBaJXJGWvl9FsFayw
	AIr2jLI5qR0AUlFBSBa5BCuyO1jyCjrjNHVv/1eSWssHh7mWwug4jvuQIckEbBLOa4rmqPUatKr
	z7HFLjE33XSK2FMHq7/wRUdIdSy/WY35RsmYDazjrTEVnXu7+J6GoKNwo628wmAHZ3k3GHU2sVf
	MlJKJiwvG7aGVroYOXCcBTw6nnjK6bFwa8szsBxYAuaBWc0a7eciXmq7mUDvv69nBm5OHAHm9/f
	vbVi0nBEvz9eCPk+rUbKlsa/kPTX/MuBQiai4TG6ugKiLBdP/lX+OHrokkI730SgvUTSFNltfTN
	36mlZHL2bHjlDQat/Mt0T+bD8YkpEmPy03HxCrhkWkLcJPghezv6gPG1nUocY3MI=
X-Received: by 2002:a17:903:2ace:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-29df5791a0emr81358695ad.14.1765261202175;
        Mon, 08 Dec 2025 22:20:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFW8pT2+DDm3Pi+LJrAqi91fWgp442wpx4U7cdIUQVX5uCJK1sE0YEQmLcNLvxy0v1Mpg0B7Q==
X-Received: by 2002:a17:903:2ace:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-29df5791a0emr81358385ad.14.1765261201708;
        Mon, 08 Dec 2025 22:20:01 -0800 (PST)
Received: from brgl-uxlite (fs96f9c361.tkyc007.ap.nuro.jp. [150.249.195.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49b196sm145682835ad.17.2025.12.08.22.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:20:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: shared: ignore disabled nodes when traversing the device-tree
Date: Tue,  9 Dec 2025 07:19:47 +0100
Message-ID: <176526118165.8958.7579761422922682645.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203092309.34737-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20251203092309.34737-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKarWeZb c=1 sm=1 tr=0 ts=6937bf92 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=kS9sT8ua8GhuIhCqqd6Lkg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mXegWyoylx907IroglQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: NxuBezpeHI3qKRi56V3msiJLOLhi5TZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA0NSBTYWx0ZWRfX4lPwhmbF4gPe
 5NpayVBn0zpMjjDamCPnpN96QgU1a+xLnQ5Kr7J+sDXFcGq6zUB42xsYDL/Y82VmulJVAjL79A6
 4UHJqH93A81M/df3TCGufx3zW23HIJ50/Mfn9Pk/ay6pKhl+9WZIOkgBMsh9AQbqyzeqrxNDUmc
 rgyi8AgyKXdr4e6ovHQcZ9qMtUf/OSHLcY48r4ZsJpHSWnBN5p8Wy//LV5EiVr2d6rGnY4x2KSp
 lip1MMWt9KavpeegffTd6ACHiyiuy+dkqpGFd/dwnm1Y7IHLlwG2bJHRIqv5MlmrjVEx3JwlVXY
 2HUtA+mk0+vjIjAD3XkjQ1rxw9u7oJa6apzE3f/AZUPhiozkLPwonhU5nMxzNv2TSLxUUFyHLva
 I5ah48ZT0JQ0G06BLfCnGR4suC+nOQ==
X-Proofpoint-GUID: NxuBezpeHI3qKRi56V3msiJLOLhi5TZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090045


On Wed, 03 Dec 2025 10:23:09 +0100, Bartosz Golaszewski wrote:
> Don't consider disabled devices when traversing the device-tree looking
> for shared GPIOs. Even if they do share a phandle to a pin, they can
> never be instantiated and request it.
> 
> 

Applied, thanks!

[1/1] gpio: shared: ignore disabled nodes when traversing the device-tree
      https://git.kernel.org/brgl/linux/c/9e7a40a2841483d7bf51b8d9a5e1f0633a5c7a26

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

