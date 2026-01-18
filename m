Return-Path: <linux-gpio+bounces-30708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B6D398E5
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 19:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 727FB301D30B
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 18:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A61B2FFDE6;
	Sun, 18 Jan 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAJnBbDn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPnOztoB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C42308F35
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759835; cv=none; b=kcuyBhM+9zdOkZM0Pf2T36xu0QV5gBcqP4VIE3n79Qk0N7I95WAdp3tQjXEpK5AQiloUL426xu4JP1M2RvABWBS7egNNgIfHZMw+J5cEp6Y4ChDAvAE3RC0unZ1CUnFmeWuWODsHD/SyAaz/gWyyNdUkSSUjZQZ+GhIIsyAshIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759835; c=relaxed/simple;
	bh=k1GvsBNYWO8pFPyazMMNabsh3Vpjdc1LSTY4GGhIuOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7BxQQrELL7ZpMo7UT17dOs9CKkjwBheXPl/JzAFa//kQJisOnWFitOT3nS0Law8QRmy8QA528wrAqpHSK9H8slBucD2cSb+iOWNlCWJxWa0k71OnXmki+UqNIAv4Lh6LiOBpTmIj6LLzmBhxTUXGdgLh/SwbobGfP8cj6n3MGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAJnBbDn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPnOztoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I3ur3D3542356
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=; b=CAJnBbDnA61W8ImL
	SnAgPRZ26uidWw6/crkIz13LXLfpToynIHrH8fGSxXxetED4wm5RJiZrZDg3rIfp
	I+yQhrd1CBcJ2Ad1lFGyf0FsGqwUca3zvkkfCL3ZCW32iOW4+BU+zFImpamvkP5L
	3osMGujdYac1/k+nkBafEmhc9umBL/i3W2CHMm3rb7+w1xHJXWCVXvQUKh2K6id9
	bp6GniMk26pToQycFEVVN2Av0pqMYej4EFc/gwjGx53qUMEe/dVECDdxjQSVVBKJ
	QGMQkydLLEne96NU+CuKEKwSYdrZH2VFYby+MaKWI8kzKlyfM27gyaBY1pIwxY0N
	TkbXFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3kh2md7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6ae763d03so210444485a.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 10:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759828; x=1769364628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=;
        b=XPnOztoBqEthESAP1tnOH7Vi2lPZxfS83fCS14tTgZslzmzbvl9fEHOYjOZ+c7pkLS
         pL5LWEiNwPs+dms0fff8PPImuubS/FNe3hZ2awXh8wK10047p7128+k0lIVwWzh5xZVw
         vHfMdcSLCb4PVMvudxUOU1mraQmgpd3wHGARbOG9+C8E/F018AFoY2MJbUpgrjSZ8dmT
         RQZXadhgWlpuLjwYj6glAn9vrxM3V7ah/7TJh0qjukDZLv/qIaNYSbwepggHfRzN9w1x
         64+99b+kMMsWuBkNNemFC+OlwYVOkU/JQz/HoTzPbVrRSEjD9yKCgnIXy2NKPnr/NbtM
         35uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759828; x=1769364628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=;
        b=LT3rjwMWi2Kxc7fEIttpbSTO+O1P4j/7CXwJppz4Gu/YQZFTqY9SRbwZ7jCEpYP4D+
         2YcvbY1zwR7qSTlv5bvjepcpFm2Psu+9gPI0OuIVoartZEvrzvADPgc5kdt6YQo60M2u
         7SOuJAiIUDxh2dMkCbI8S3okNU1nbKs5ZzFGxQG858qCrXIJTNOc+nvvE315gTSskIJb
         h7bcnLfJANRDIoQ+nHULumTdA/eH6N9zZ84mNvjYcuVLor3NlcYS3ybvaZA8bvOSCuQg
         g9tQgFrOmyFvkXvX1cifQFs8gPsEO2DFd5lB4nktfoTeQmlMJ8phokJngBW9dYwQQOC9
         DxlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVrAZb2D7QqI0X00aO3f/M0ivLKGXzm3yVqAPbhY9o7n6u8OSxNvS+NiKGopIGVvyDB6Pc8BVg4HGx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7mOdiwQJKKd9RvTZz7RE/61BEHpvZdDxoI/Ek8fmYayoCuH1
	GIsjwEdfaIsbr23VOFKzNTVQ9QejQKtq+Y9RLDAwObjcnkrhaFMSzsFQxmMuuAL+PNo9iuGNcAf
	WePY9687N6lAtoetaanv9U20Wq5dm9FoExoSkZenXRLd0f5UOPyq/sKbZkgrkd+KA
X-Gm-Gg: AY/fxX6mz0eSMmwlPrLCSW5ERxJykCJunfMk1ZVeeZXJ6qB6O7i39RB+yoEuLyzV52V
	PMzJTfckOvk+vSdPH8Sjt3V5D+Qsiec8eRr9pLZvueZU33ibt6Sad0w2dZlSKnRszV1QSOym+wj
	BqYcbFu0qnJQB/C84pcpARWSrV0LeTmfldTTdC2W/xRlfNKbYBx6VuahOtbPmtcesDsBNvbwLTt
	FKZ8e6kmYCZA70xmV0cUMCBz5V1nYKzulo94+MtdXksXyizxRPP2+JWgVmXJ2wlwlyjKLlDuWN8
	+6fI1+3x8YNS7kOo1yZAFNYWowKQBsdrC05qJxZ5tUyKplviubrpWjBUcK9i4yIHtv53PoKTkCv
	bXO1I8ZNYrFcEr8waJYdRPLqEFGGohaUSbA==
X-Received: by 2002:a05:620a:2808:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c6a67b79c5mr1285496385a.70.1768759828497;
        Sun, 18 Jan 2026 10:10:28 -0800 (PST)
X-Received: by 2002:a05:620a:2808:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c6a67b79c5mr1285491785a.70.1768759828043;
        Sun, 18 Jan 2026 10:10:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:34 +0100
Subject: [PATCH v2 11/11] pinctrl: st: Annotate st_pinconf_dbg_show() as
 holding mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-11-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k1GvsBNYWO8pFPyazMMNabsh3Vpjdc1LSTY4GGhIuOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH3xTqF1UPuWpw21q5i4y/0ItOY7uFl5LJRk
 I/zBJTe0SiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9wAKCRDBN2bmhouD
 14rID/9CmPz1fyhRfWxv8BXOtmT8JzPxM3Qn1vrvoEw3Redb2US4V07grJBDpsNMH2yrzXble41
 qSybWyUX5o3mUWc71wO3IsMFu4uIK1mOxv3WeIRfETEaVH6Sn7DYx472fLtIqS9oZ+qA+sCBJja
 VZqb59C2Wu6FxIQy5jRXgkXFhzpMZX0nRzYzDwyQb/gPSnWoiBOSRkxbAxvnAWqmPNWAHehSuS+
 S3lTrzXTkY98p1nxFqfdeU8afywPvhvwDpfmevQNjxy7iF3EVPf2z4pyHTOQREBUBBmC1perTa0
 ANxtLXo2E8BaPttpb8EoZLHxfX7PIAA3ibfLPS0dPI9Yhlhkq9HgRSbSvTKCGxLSk4sxrjTofoP
 8reJpHpMVSLdOfwPApz5sWcX+oq/L74sPON1vtXunQcS1QSf50DL+Abn0WjuoQWPqg6LsySITQc
 oE9X/C6PfDtxOP7YFCEU74SomVt5ZtAwYGK9tgAjJIhKXro4U0APc9TE5T0ekdeapQyKRAkQIlh
 2oeg70iEhT2N/f16R6mk9EaIeneSiNYN/wqgMiPo418GRPwnMZVANUWr/har+gk+z3ScAHAYU4w
 LCmu/3TUFx8+BZXGjyqMjtcINUApT5RxEOVxvgAkv9Z4jn0eIIZd+UQuZn5nKG9jKV3FlgN0K7J
 BiN1rYOCb1j6Hng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE2MCBTYWx0ZWRfXwTfZFXth6/54
 qpNewtrx6n4NiFoPOnqVAkJiCcKXXihtE8/thDcmEAQ4LmMaBq2w3xYYTiMLhwQnQfO/7tT9O/t
 UdMpLYJuSeMuPLWR4Rn1ITuM5ggfVvKOb3ksSwSHekwldfRUf5PMqGKBDIrsej1R9v/5YQcy/f5
 zga0IzzNlW0ASj2uot7rMc4j2DzulwOqAWz4ddSlVGSBkGmI+hVWioSFZKFgfecT5ZH+Hn4lhR5
 c24wnyO4bQ/rUbCA+jJs7Zmj8HLCwMntSB44odczOpT410QStCs/5rNHHysTK84NcBHMPwLApjh
 njcbJ4Hfc9fPga7Dze6kcJaJCbJ3fsxktZ0Ku1Hyc/pBD49quQgqiV3xaVErEnvZA10k1Pl+eZk
 6FL1qOCmwfRfzU5aMHQgUDBISy006BtwUSNg+SIhc/QhMrNlUVZrznnn2C2KnCcNrtYQ2XuWnIc
 iRsYvlg+732m9H5bcdA==
X-Proofpoint-ORIG-GUID: 1ELpC9GtuUQl6FMSc_9Avr_bMtJK1_c4
X-Authority-Analysis: v=2.4 cv=JcyxbEKV c=1 sm=1 tr=0 ts=696d2215 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=EUspDBNiAAAA:8
 a=RIxbnQC35JVfspY8PfAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 1ELpC9GtuUQl6FMSc_9Avr_bMtJK1_c4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180160

st_pinconf_dbg_show() unlocks and locks the pinctrl_dev mutex, so it
must be called by the pinctrl core with the mutex hold.  Annotate the
function with sparse __must_hold, so any changes in pinctrl locking will
be statically detected.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

I think this is still useful, although maybe a bit pointless if core
explicitly always locks every pin_config_dbg_show() call? Anyway,
pattern of unlock+lock feels to me like something worth annotating.

I left the patch at the end of the set so it can be nicely discarded.
---
 drivers/pinctrl/pinctrl-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index d3cea3437d7f..8ce88e591f47 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -987,6 +987,7 @@ static int st_pinconf_get(struct pinctrl_dev *pctldev,
 
 static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 				   struct seq_file *s, unsigned pin_id)
+	__must_hold(&pctldev->mutex)
 {
 	struct st_pio_control *pc;
 	unsigned long config;

-- 
2.51.0


