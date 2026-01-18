Return-Path: <linux-gpio+bounces-30704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11DD398D9
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 19:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E583A302F2FF
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 18:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEDE2FFDEA;
	Sun, 18 Jan 2026 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="japKNcnf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2/1Xibm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF23019DC
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759818; cv=none; b=rkUw1R/elRA2wfbZOKIOkWChYBbDzccAc6ysdmRHAv6d08ZJEIjGqyLIBWsQN5NHtokgs6A0RiBVzpFTqyF54LxAMe1uEhyIm1K7gW6gihbNQa6wOysgoFu++1jEymQonLusFrEpwnmRK3xxtTHq5jvRgPBg5dGDkG+Wn0eqOnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759818; c=relaxed/simple;
	bh=7TcfQldnwsgDeNj9THUL7ZJpvo8wBH6EB0ftex+EuCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RElWrQvxWYTqmXTJE2pMnsEecELQcDry06Rs22AWzJXOTAynIZIbrvwsokrZAstrgs+YS6UGEaP/Ozo0iZrTZSo91/KWJ3NGj+H5josiLqCReJ6vWb/k+97l37eedIb2X2pADm6KY0/bOkwnTtMd5dy8b+sexOqHgtUJh/LiXVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=japKNcnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2/1Xibm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IAQm5n2097948
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=; b=japKNcnfAcEprVtV
	0bUawGTTXZfbthfW6B3TsG8SOrANCsLkg7+/n7DXtuSnDQSKAnz3usFRiyGjxOj2
	+tPoYHPy0SDVDav2D8OMjbHMnyAIRUOJCc6YT7Ti8/Jsu0oJRI9rek6MgZf2St3c
	heEzwj4GUyubAeqSY6lo5q+3kGDRU7stWSWOAZ2olHVwkhtTkyTRJpQ1rr+wzOHB
	+wVhVSdyTbXGW4rCcE6MUCDGhhR16OCgC2i5uhHVrodFaAum1yFa5gvt3ks8eXrZ
	m2q+iBAO2sdTs4NNckCqDI+IQx8+BEUWCDxfo5lF8Ut1fbWYDdG0O/PFOwgxIs4y
	0wCOwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3q9amwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b4058909so290615985a.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 10:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759815; x=1769364615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=;
        b=I2/1XibmNKHLPFX6vKohVo9urv5dEs3vGi5TphDcHNglsCwK5GoeYW0J5zmaLVKp12
         spx1qdA6ZfhrdqasEtUqgT7lClciIWXiSrm8u48g1m10ane8Vf1zztTKkB8kgGFraqNB
         xoWZoG5JUFz5AqN2Ainc2W8arscAapLiSRA+3y83ajWrfT2GOGSHtyfA3XaqeFAtmfA4
         9knusUNhmwc3yZMInmhP9fNMxJ6R/vyiHd+Y0ZbzK2ymIG4BQr+vfNinZLfNeoD7MbVF
         fhqPnULHceFKXyA/i4tlgtuf6uifxrYg//54mLEVp5mGDZShHubxw9lechF1r02JcFm5
         HVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759815; x=1769364615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=;
        b=TzMHfNFRSf4RrHUhR5QLAHSn6JRp22rtxB+8etvTWxhaRb/g9mH4s1at3aJmoa0FMX
         a3EFX1n6J3vq192jB7/3nrBQAW4WO8gN03NU5QKHMWmYO/U/dC4N2FIgYDfDbiiIju6+
         c6yAcQPdiZKXyCFCie7Syka66ytkEX0Ea2JpIrwU93dTUDxwnBJQj7wYqR0C0sVFlAbO
         AK6RHELWl7tK9oO4VomzHJ3WOlwKQImBTjb63xQKCh04iIncvz1pFWD5z5HJNKLSeL01
         GbVVv3VkUkuxRO6ct3+9zy9jt4QVU6bcBw/fjo/XjGxU0G/VDjjfPJMZwoJfjOwV7nqJ
         0hhA==
X-Forwarded-Encrypted: i=1; AJvYcCXUogSRU//HGMv/x2zM0X574rs0Ihd7XgtdF8opuE5fWS0ZmSyde7evUiZSWfYO3S/bhrC35P2jUIrS@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKIy3QLVa546Ei80APLBLN7PmN2T2F3l2VGLyxDJ13cRbaJIf
	0QESc5uxkNVd8wujLVc0lAINUUh3jo2eXUydy92zoFgoKiM5/GEaW8pSRPR7jwWMCsb11GMWGfV
	T6vL0NGJ53l3/xR1sF3J+cOw9utiBvAATr9oAOoHxJUY/cyI6h7MIR0BCs7qTaVtV
X-Gm-Gg: AY/fxX5DttTFEnz4R3pWUk+TJAXnKDXA9P+FhSexMPylizq5/g3/2XVttPHpfdDtPmH
	mUPhaNOfg/Fp1fz7+Ix1Q2p3ta2bOoaslChhOs5B2C1aj63sijMqjRoMe8NKSp19wnyo3Hs4YXT
	FY15z897F4s/j04kzbg2v2/fTvOvfkeTL5yWgpTouf3Ycqe8Cb1vra3tr2UnYp2+7CHmsnsVW0J
	mK1EVCWSqY2OgqaxhBQZMDaOXMi9U4vGUHW9BiLL5QAOr2dlNlMqoR6FPG+PWqN/wWwZxw7W/wf
	ixEU8tBsc69WxgAMPcWoC2v3FBttFm7rz6uZ+6RC9sTvaUAkNt2kpC2BtoV/oOSahcYsMuMVn7u
	gtXsjb7sjHOS+bUVCtLqwXGYgAhPF/GFsPg==
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr1275475185a.67.1768759815262;
        Sun, 18 Jan 2026 10:10:15 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr1275472285a.67.1768759814840;
        Sun, 18 Jan 2026 10:10:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:29 +0100
Subject: [PATCH v2 06/11] pinctrl: microchip-sgpio: Simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-6-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7TcfQldnwsgDeNj9THUL7ZJpvo8wBH6EB0ftex+EuCs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHzNyyJB2/5YcDkWVD78wo4fivaLa92BnhNE
 zEyQbnq1T+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8wAKCRDBN2bmhouD
 1/+ZD/9dLR0GeZEUoMpu1fyeS7gbRrh/E1fAhv5P7K1Wy6+T4QuZh0GJyRvYYNMop2bEXE+o/zg
 m0aJF5TNvzHCDEzDGh3hTWMW6zhEfdRW1x+41NwBiV+jUGVIHWeFXu64AMbTDIAep3SiKsUu5ur
 USeXISCYy7enjRAKdOU7c0fmdDnDnSSlMVF202nX4sHTfroJF4BlimVIpWz9/ILOSA18ewjMxl0
 PaymU0l2amlmpZmIpE3edSB7zCVqvIGVyl1rD1g1v3Slmt66Wa0oJub3si4o9gWtDj/1mE2HGW+
 YwsGcKQ0cx3eU9jda6IccRxjIrd1gwgf91zoZT6MdePaW7LZKOUWQ3TuPyA9SppV+7mNXJ6g7fg
 5iv4i/aSKv878Z/9BjfRec+iDlhMHFlE1U/0TNLeQEiSePRFjzQkBZW/VD8h12mdLZyJ25RIeIq
 zcvbjxNdMPYNXX6zyo9KpdnIGRzqPn2eow9j7Ty/MvWaRS2UaQldkFjErgbKNlYyLyF4xueV36m
 JPYBzgnsAenS6V9TUf7bUvkG/jLLhifIhTXucaqJudGLGgqioXPok09zN5scbaryZOnU3poSZa3
 r/njGSPDgsJ/i0ZuO82abROFWzVcuRbleDiqZ1V1y6SeGIH2EV1SlND3ueBORj8RHgxVja6hguI
 G262GYY0ih+1KCQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX2tTcG/G1m09d
 wkEodl1TbG9I93jrZlbp6Me0iOe3OvQuaJjaZFdmGZPJf3G/k9hTf9bABDzki6Osag5lDl7VZhJ
 a4xzn7nqiQ/0jPsetdr+G6r6VyLPd0xOqqA5MtSr7Ze6JaCKF1ALjObtnckSdjiVeBMyLsoJZth
 sOJmpB03+rhlADyad53KY7LyWe43N5lpxhDJRI8/12UOAzp5vuW3jnqH/CMsyjTpoPr6/BdBltx
 +8TDZC3HVbWziG02cvzS9Sn54gDbEBXXFxIB97a9UCNmMmTq+U1uOxFsOmN5PPaE9GQ0PlW3fwa
 z5Xi4qdZAiQLMYLpvLbkFEShNSq+Ln6qm+/UxshPB8jTVUI26OoRRtIH6VEo1vn4Sa4oHZDsifC
 NVE1GyvZcEfqIKVhpBR8Rt80u7pjTxLyGIPjEoyf3nZQ2Lz+WHeviPVkpc8Wkj7EAAK/9GmVIu+
 cIUxWApj1A5qJ+W1Blg==
X-Proofpoint-ORIG-GUID: VhBIPAxYOlggNeYWqPgoZ8p1ayIH8rx1
X-Proofpoint-GUID: VhBIPAxYOlggNeYWqPgoZ8p1ayIH8rx1
X-Authority-Analysis: v=2.4 cv=dPurWeZb c=1 sm=1 tr=0 ts=696d2208 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6VTnscBjb5kX48BWP-sA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index b6363f3cdce9..7a6cb5f502b0 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -264,19 +264,17 @@ static int sgpio_single_shot(struct sgpio_priv *priv)
 	 * setting.
 	 * After the manual burst, reenable the auto repeat mode again.
 	 */
-	mutex_lock(&priv->poll_lock);
+	guard(mutex)(&priv->poll_lock);
 	ret = regmap_update_bits(priv->regs, addr, single_shot | auto_repeat,
 				 single_shot);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = regmap_read_poll_timeout(priv->regs, addr, ctrl,
 				       !(ctrl & single_shot), 100, 60000);
 
 	/* reenable auto repeat mode even if there was an error */
 	ret2 = regmap_update_bits(priv->regs, addr, auto_repeat, auto_repeat);
-out:
-	mutex_unlock(&priv->poll_lock);
 
 	return ret ?: ret2;
 }

-- 
2.51.0


