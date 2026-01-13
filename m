Return-Path: <linux-gpio+bounces-30473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7AD17F6C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01282302E702
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A8A3876DD;
	Tue, 13 Jan 2026 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvpFC6eS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcUdvGdJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DADD33F39A
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299391; cv=none; b=i/oQL5k9023bmSY/dqAqxisuOT/unHuQ8ZdG/AF0BhZHBSjN5N+5jwh5LWLkApFKb1/gE+4T6ODw08rHClNriPSokIJjiF9rojKX50xksAaIN1ihvkByG66LkadxYB3KluQN8oyX4q8S5UfiSUam1q9U3DMF+S8bLe9IanHtAQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299391; c=relaxed/simple;
	bh=/hi3vmGVRmibueP/GzOHh+y5m6gBG74Y2unWA8/KRiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqwReRwfeSYRM7rISSzoL2+RfCqiuw/9iPvrIlRdj3N9TEOpXlIkRlALTvpy5drVGC2dIkOvOCda0M3o9MBpXhHCIzJN/5gF40utc8bGmHle0LUI30ieNUy1M1lfIITtGIKG/Sb4DcGBYr4SjZiuek+j5WpJSJQJ8UqoeAxZpp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvpFC6eS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcUdvGdJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D599492835172
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 10:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u7BP+T9KfTKV3t1Y6Hsoao9DfTny2oUDwctLT9m1Wy0=; b=LvpFC6eSRw0imxpV
	4/gRYF7YKTe75hbblA2UalarKzu+9Yf12wSC6iWySwO4ToFrNdngAWK+5lTG1HtL
	VoUfRuH4NLk3PoDp38a9iQmDdCxxzcEnLxEDXVSeSU+8Olw++O1cZr3zM1YD+Ubd
	5qXaFFzjpdk7l/7JADTxJe592ZTisezQzqWH3yyfn0SDpZdnTTuWTzaQNpN+nmIT
	pvoWCaGSIDr8FOwmDWc99ZLu26ESKHzsZHURe/W1Eeb4crZe20o/tdtVGqAesZqo
	ZfaIs9N8yIaYfUymlG/bGzTd+rgSpvM6jloZmL6o9MkZ5rRmNWZ2oPLF6XSlPaAG
	OAtcBg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9rwxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 10:16:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22ab98226so2169356085a.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 02:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768299389; x=1768904189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7BP+T9KfTKV3t1Y6Hsoao9DfTny2oUDwctLT9m1Wy0=;
        b=OcUdvGdJaNtkxPBIhRNmkvVQAJNYBUx2iRL9v80i/GT6cj8WJiUXUnpayXb2004IdE
         6YG2jIt4PMh9U/xfnrCdP1JZjH3dnkNab4X6OpQnyTpWpkUNShYrRYxIrQYe2ajYY6u2
         dDyJMFJ4NaFa+DgJVdWQgIJupMlw92O8mXmNIIAmRy6tZtFvmU1/js1P/8BAOgKuKtGa
         SsIBk4T113ph0XB8ZpXZmkmnEZaymnX/nBh8vBfcwhuyGYyJs27hZ2ohT7RCHB+/NAe0
         NIiyPb0a56G9Pkq1SSMdy3tLXvJpw17D1hIzKVcfKVsswuCwkpdOZvdK6Kes4uGk1KW8
         uqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299389; x=1768904189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u7BP+T9KfTKV3t1Y6Hsoao9DfTny2oUDwctLT9m1Wy0=;
        b=IPTYfYEOcqN72lUfJjGWawqXCj644bVtKAExoUtSsTu4WiiitjE1mrkDZkzRmDFcOY
         1Rg212w7Kim08DhwEA9I0eapVQESDQrLbBsP05ttlxyl1mJkW6lGTWt2wxdgxpTCrBXb
         mTDfyvYSs58mxpcJZRkXZn3aXEbKWM9LiNzGcI8rIhDdxJhuDrHOrXH6gn8wxQDAGXYt
         GJ0GjtXlJDnRCBq9XDdWEeLB0Yy8bccDVmfLgw/7aAR6Vu7e+Mlutj/Fh5tlebPzsaQP
         qMT7Hg8grWYxBdeCHfLVpfkmO/ZsJs+WCpqxeeXvj5jGYoO7IPqS3XyOyQd//860r21u
         DsnA==
X-Forwarded-Encrypted: i=1; AJvYcCVfJ32Uj1axIsJUlp289tTHTcivNuN6SeO851A+u7EIgiYDvajqoiXYrBeut6HMiUqyH8zZvKNpxWjs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+Q8JJqJXcGZek645tc1IOyH+j3IKSYFuvEg3AtNEYoa5POIF
	6LEZtyS7OXXRMDNoODN975i7A+1UUCeASQ1knUI5h8ni/NllVNpRfVFUD9ajxXAkEw/r3LWPFGu
	kPoyvl9XfoSP4flafY0JVaHwrFkek8t0Z185qIzgV7QnLlCiQeSyUSnIQQQd6rBtr
X-Gm-Gg: AY/fxX4+z0XjdwGWVYu894c5yeOTpEPPRr7W0qDVLmhfhN2ucgobIbC8BmAo2h3e+jA
	kF2QK6gfneOFKnHg+vSeIwi1uSn9tH2dPtKh6gOR55/rvrBB51POfuL4rCevWDaq2eNqnX0gPlE
	/pszH2QPiDf7EzB1xy2OsTej1y0j3+7dvgdBjFhQQbGdCdKCQIvs5J5eHi87aUIgh639b0XUtro
	2sxv1/zgy+pz1D4Me1nBEUkgZuudcnA0fBwmweP1cjFHtZ0caP73C2tx/ycFkQ8p7EfevhjL38K
	l+/hy6CC2ZC8bguqqUltr5B0U93zxUDfKqHzjzA4hwsc2qu70mdSwpzjYb3LoetIjT1oUMxy/5N
	LoDKSIm7fsC54CHOlGUXxCqoCaJjg3iZrat1WvQ==
X-Received: by 2002:a05:620a:4543:b0:8b2:fef0:742d with SMTP id af79cd13be357-8c38936c957mr3323660885a.7.1768299388987;
        Tue, 13 Jan 2026 02:16:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsWU1L06g49t6vPP0BavY3MOxA3LgKhS4yFHThUJqK/3B1UIOAfQVddirD0Y1zLSuo9ch7xQ==
X-Received: by 2002:a05:620a:4543:b0:8b2:fef0:742d with SMTP id af79cd13be357-8c38936c957mr3323658485a.7.1768299388577;
        Tue, 13 Jan 2026 02:16:28 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fe8e:52b0:d65c:dc04])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d9610671sm26114957f8f.34.2026.01.13.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:16:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: shared: use device_is_compatible() for reset-gpio
Date: Tue, 13 Jan 2026 11:16:26 +0100
Message-ID: <176829938074.46577.16957061752468424613.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112093651.23639-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260112093651.23639-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B6FX670L1sMbgQPKWag_vm5aJhMKR27s
X-Proofpoint-ORIG-GUID: B6FX670L1sMbgQPKWag_vm5aJhMKR27s
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=69661b7d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mR6NXVEVQTz-ZhukixwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4NyBTYWx0ZWRfX+GkfjE3TcInG
 Q5JV2KQuvR/Ly0QgBjtS/vIJOnCyY58HkO7Azbsj1MJIoexpsLAa7H/L5UzjRRRskDAZ92qCAsQ
 hFGqZKI1xiagz9zBe4ERvYkLnwW86tDkyHm+PI8FSFuF6/29iB2LK69TZJfdH22OSx8tKK3dO0k
 ea9NGpMjZlRXulXY9fMWkogXBhQWP1w+2nRZ9cr0G5M/cG4ta2HXKDxDC3HofObjg8h+bs4xCVg
 LrdvllYJKPEJYmmcI8sF3pHB+9Si69AZ5lGm//fo0uI/YTZHSAT5P2I54kbAqKnGkEJXTfuxkjo
 vFDzJDOWkKaggx3GLcj8PVz8BQ/ZEc00v5UWkm5SugDUiQs+XNe2aLS62N9Q6aQ5i0z4+MB2Kbf
 5aPoDt/A1uBOJdNcfbKP5TpjiOJZlqSDwR0Wm98bgkDYa86s32P34DncmPDQTMJC5N8wPU5GsKr
 6ORGKjgQdMqBabZwwfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130087


On Mon, 12 Jan 2026 10:36:51 +0100, Bartosz Golaszewski wrote:
> reset-gpio devices now can be identified with device_is_compatible() so
> use it instead of checking the device name string.
> 
> 

Applied, thanks!

[1/1] gpio: shared: use device_is_compatible() for reset-gpio
      commit: 568ea51e61f7da72ee290d24d6ee952586a3e168

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

