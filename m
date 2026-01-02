Return-Path: <linux-gpio+bounces-30045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5C3CEE112
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 10:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEA71300180B
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 09:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A82275114;
	Fri,  2 Jan 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFQcL0eJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNS8xF9d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B661A38F9
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767346488; cv=none; b=YxwcUqg9RXbeX3kB/PKs6OBrBeRWimi6Z9orXDOAPb8wgGyhJ3b/Ch/6Th3bK6OHokHR1b9HeG7sWBa8fPXB+cdpnyPeSVnTTubFHYPirc1r/5uiXqs6iHgdet1kbZ55y2iw+XwggnFKrULujaknyB+G/Idn6CHBkxvPjZ044u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767346488; c=relaxed/simple;
	bh=SlW14TBaY9CFkI6DkYsG2jIwP/qw29dlK8WIA2CP/O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h/DwBbHhmNnKOdJ78UO9zJ2Xc//kBvE+btZlbGVAXaZ/h6puUiRWXK2j4YSrw+hk1G/XCS10Ixk4PG4zW1Gi4osCmUtG+Jes/IHzfQBkWwClXg5SIsd2r2VYAJVlbkZjE/ol0KCNaV6p9VRttRfDNtDevXgs+KanrUtCfAE7yms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFQcL0eJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNS8xF9d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W4b4637672
	for <linux-gpio@vger.kernel.org>; Fri, 2 Jan 2026 09:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+WdJDLAkQcuSvtGkyk9GRz6tdDlM5qFMEm6LiWKXbw=; b=WFQcL0eJPNb5xyxe
	EGuoTPJk0X9HRderTdIB12awyb4kQ/62czTj4TaAnhMJ+sbnVGEHmVXfpKAWpD2V
	nhUrZAdnjqsEjQllXjuMzx3o5itIP/8gHj57H/aCouy3u/qhIyYo0JYeO03loTCj
	fEa4oDzk64a6+uS1DArEeoZngtkjk5SIEzeuKMKBKoOlkv9VamqgUxELyoaaS8E0
	BHeVmyvN+VIihl6LB4a4SCJxacD0vvVo/sAcLM12hEzDQLH7hbg+SEnNdYpjl5pz
	Ab2/pk6rffKQZ31NeJ046v6y9R5EbfOQsJOiasQLwLk5Zv/cIDoNoFoJEAYOdxzf
	SLx7jQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8uf57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 09:34:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a366fa140so594726936d6.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 01:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767346485; x=1767951285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+WdJDLAkQcuSvtGkyk9GRz6tdDlM5qFMEm6LiWKXbw=;
        b=PNS8xF9dgayEjMhaTjhCeS8byJC2Bb8JkhLJ5TGfXTXCXoAaOLnXHrq42YND2fWz1S
         FOXX6jclAm3z8Whu6/VQWYeG6eKt4OVM/A3XuduCCtJ4FI8F3DjNPiNyMxOGgQztlEZ1
         HDG/yVAEv010B8MAMOm7gLb+yRB6onaUzLDmYREMaCqQR7iC+3cAsyH8OfBm95BgEJp0
         Bq9jUwF1uEiGtb4xcORzhy+ady1aRS/wu9X99g37yAggUuEy40OgOujPsFa8aAA8ZJjR
         q/U9a4x8dKga64NQrGyCFph/97ZMsthiLBpSBXmlnCvUARpikb52tO8zGf0FMaZmmuvl
         MUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767346485; x=1767951285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+WdJDLAkQcuSvtGkyk9GRz6tdDlM5qFMEm6LiWKXbw=;
        b=JYMKxpfNKAQXszfGmAb+S5DWknnJiDipxCdNpIBsd78yCuO0FqhFYZstOS03KWoYtx
         IS79rOsiL84Ax7SYSk0zYja/aSQ1MgvoiNWJTHUtA53+f2/+aJIH9elN7ZGzIZXl80sF
         v+iC4Ay+fHH+tArhpyx8DI3Y4/hpe6xr5cmPXVaYlRh0pEBVVavw0HZAGclFvd03Tl/X
         QXsFF5+VyMc68ls6OOAjtJkFa2gKzye/nsG9Df9EjDgEr+4BVc8oOTr4YeKZktsMu5uJ
         SNOlqZxQf4tUSmYtukNCrhnrtPJ/0VpBikkuKXPA7VT/IglobK7a2a8C0XtArtxZQ7cP
         M02w==
X-Gm-Message-State: AOJu0Yyci64ADm5alsbstqxDcV5JerzqqeBjrT42sSULlyRqZVpU1LcU
	BmGaFPfV9Lg/3CbEgKnMLEVuOiPC9N65G5PMZxnpKiPOKpA409aMBWRG9Ks7Zi2OKQ/PJD6pfcr
	4ncRZh/5bJhwatNha0evCUIECJTM1qeowVCQkVw1YKqu9Oi9iPPRoRAujC0doW+h/
X-Gm-Gg: AY/fxX5jJz22GSk9WFExmz67cW0GTC+Sd5YVw6pUdInSRQJJRt1LAV7RvpIyvY3tcZW
	E8sqcqx38d2ex8e6yKXyK9hnuCpgp3Lhiu0mJL2V4EkjG3QjojXJT61ZtpQDIezD8bfQJN/+K+M
	2bbxDZZABCunhdd2vQhdu1ANNYQ7yCFnEiVBxSMnOwVIbAKO2pljZmtuD0nhMz9dXM4RIzAQagw
	xI1STTSYZSpTpTSSVcSLVk4/lJrWQ6CQzmvL5YszPWee8CMRPZgUItQWHtj9/XGhy+c/g6xxuAF
	/DOh6Fs7hFyZXjIGR4h7c0t2SeFIpqjkiltz7Lsc8iqygVwpNTslknB1V1cxT88v32sgu97auKs
	4gt2fRKMj26DYxRAZVbKCx6wnfH2pmBi3lg5icw==
X-Received: by 2002:a05:622a:1cc7:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4f4abdba5d8mr655384361cf.73.1767346485562;
        Fri, 02 Jan 2026 01:34:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfAFeJId1dLZXtGlXD9uwxtxMwzKflhHqLrz/m/j8Vn3p26bRA6thi5YkFU73rhLSB9Co0LA==
X-Received: by 2002:a05:622a:1cc7:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4f4abdba5d8mr655384121cf.73.1767346485220;
        Fri, 02 Jan 2026 01:34:45 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8630:1161:9594:98e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm744352355e9.3.2026.01.02.01.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:34:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] gpio: shared: close remaining gaps
Date: Fri,  2 Jan 2026 10:34:43 +0100
Message-ID: <176734648036.18078.14148823625590475628.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NSBTYWx0ZWRfX6CrLKnqur3dZ
 TIVvnP7q6EfzLi9yN3RiEOMJRw9lk3VVyr95Nak919mWNaNfWurASMEusBcUHjgJwdtj4dEZjMb
 qzCi3KHLJZB7TJJpD997vTdMfN/ORDumgc/uTB7hpVEsk/8EFbwd3P8PElzHBZcjeCtblHDyfTw
 BsodKyCL7sVKRzEoE//Pn1i8u95VMZHcgqQsfMHsTMxhP+hhdFCbADDfp1Q11TQ+JOm3M7aBegO
 rWhqDhA0DOvlNsVTAUQrUgpDy956FIyV6VVQetoEsmno25hEsfWS4p4NkI6HvaG8eohh4vLrizz
 QDrTrDUXzYt6oqRXonjOVJG827MrmN4vksa4qNyT0MBwz1QxSitVxCnkLHtaFG+qM+8iDrUNYJU
 wEaukIlVxE8axdnx4hol5d7+fCYczp3ifKZ1IScCm/vxyqXuhpAGMGKkH+MlqjqFrJBuMc1VgIf
 DzeOU6eE55bweWO/Qew==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=69579136 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Q2rdd25-hw0bXcnHVI8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: jmdcJAhKbkSgg6XT5EMcs6FSCitPLxUG
X-Proofpoint-ORIG-GUID: jmdcJAhKbkSgg6XT5EMcs6FSCitPLxUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020085


On Mon, 22 Dec 2025 11:01:25 +0100, Bartosz Golaszewski wrote:
> This series fixes some remaining issues and corner-cases in the shared
> GPIO management. In order to address multiple shared GPIOs per consumer
> as well as the reset-gpio interaction, we need to support multiple
> lookup tables per consumer device.
> 
> This is targetting v6.19 as it effectively fixes the code that went
> upstream during the v6.19 merge window.
> 
> [...]

Applied, thanks!

[1/3] gpiolib: allow multiple lookup tables per consumer
      commit: 9700b0fccf386b671e6f8401ddea6c5669cd0914
[2/3] gpio: shared: verify con_id when adding proxy lookup
      commit: cb0451e33be047fff7137f58d9996370e11fb344
[3/3] gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib
      commit: 49416483a953662aa53c6d9bef651757d4a95ba5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

