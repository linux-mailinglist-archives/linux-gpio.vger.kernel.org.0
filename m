Return-Path: <linux-gpio+bounces-30566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C875CD1FC36
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0374301A21F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2625939E6CF;
	Wed, 14 Jan 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oI7iubuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UT+hN3h0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8789A39E165
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404641; cv=none; b=bbC5mn6RlAHsjvhSm59z85PybjYfHKfw3yjvd80xZZH/4eeUZaqJRK0tkIPd4JrFeVElBV29bo6w52zbn8SHzi9wawMsQA68+8IPm2Q3iatXyfFGTxDP1S8AKV2oOyQV7Usrl2HqzrsLXfPtBoNu+00iR2MZsGgiH3RsrezLDKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404641; c=relaxed/simple;
	bh=Hz6iLmKEfxDKfrrjH8upUbRNGTU/avM3tmt35o0Wjvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBHz0M34qwRFRDyuZU3mhkicVSjgep2U1VyYsffU44qLLh5QGCIOs4PBZeJ77QCv54bzYVKYXNRcjAMKE8rIESSVYnE1gLRuMAnZ7A8K9pLwByFtdyJ35IkecZSomUqzQr39T/TGUkK++14dfqAJjI1NP6Z6JzIoQEklIC5c9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oI7iubuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UT+hN3h0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EChVoM3925436
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taXBNyuQJxmj4iOFqIUfDmb0YEDOzZ29KLE4Dq+0LV4=; b=oI7iubuJrJC0fgMI
	lUkAMQMVAzmfEMIfufrp9rsjWsXcH2o+6+++OU+t1AgtWvYToBTqLzfCTJ5hbWWc
	zsOmvaBPgp/FPEP8JHQwucbS/WuYShGxyW+lgPoVyVgGAfV3FaYqJ4LDeQjsxxWb
	Hp+0cgOkI35fRxgRp+kIaZ0O0Kq0Jd8CNCAK9GvKzPufghCvcwz0vq6alk+/IZLN
	+Yvdv6h3DUvdafI+5Fb+qaCxdCVOlggJXoBSasoUUjTrHxP+nU8ZL9/9fuBl7ZXb
	GOHzOvBGPL3LIchFN7uT6MG6DvhW9TaYkkitzZ1yRJ71Tmhn3kONflVTlxvRYGfg
	EW4g6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbrh9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fa6f808cso2634236485a.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404638; x=1769009438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taXBNyuQJxmj4iOFqIUfDmb0YEDOzZ29KLE4Dq+0LV4=;
        b=UT+hN3h04eYUzyRpvc4prXX1UR+mocev5REzAu1FUxZm4J6hn0IkintnooACOiskE7
         Jz94jDhvdL7QTLB3kcVSIdKXVG9QAfbINX0ECuP4YbBuSktinbIk4rOe2artVlf+yEzn
         0rNUAKkOTGpAi4Bb+AHVZucFRrmUyH5cQCp4BOR+KTJsh85C0IdN2bVCJ5i0la7MeIkX
         8FNW7Q5OR3SsN/TboCH2etzV/ECn8pLSdf8VpfIfdK147gnf103kiJ3+QzJtA9CXXQs5
         E2nnEtEcY20w9VE00o0S74dLlYgk4HCCdQxycFuPqmF2ZrLGnWuihaUTqmE8gJeLUNh0
         920w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404638; x=1769009438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=taXBNyuQJxmj4iOFqIUfDmb0YEDOzZ29KLE4Dq+0LV4=;
        b=OUAQTAZEqs2llRq0GzFvh++rHo9M+BuNvk1AnJ74GdNTT6SfhdhQIuX6zHhBNtp36B
         9ut9BLtvmWrjHNzc/+kT20WId8Eir1Wgk6PG5BWexjqOfWU5lxdwtHLhTfBanx6wl/r6
         sxt+8HTemF63xR0wXjgl/4StNYRxBVfX549GXqpXJWJYzjmY2hPBPSW2OH49k5V/0wXX
         6EClDyWXXI8cH+zNJxV+aMnoqk5Wuzcqwo4sGsA5fpOlJ7wom1w6UzK5IqJbK2YYfNy8
         NGUu3pg7REJTbxfVo+7/1WiyqmSWfGDYuZWuhAz7QAb43QlWb4YGGiQngs+TXo8ck1aw
         1fXg==
X-Forwarded-Encrypted: i=1; AJvYcCU2hGUiEVZjashBRoqcjIHsKyN0LUJfXBFss85MNTzZSls3/LuN0JS5cyVQ2yvYaMiNbhbc3c62oK4O@vger.kernel.org
X-Gm-Message-State: AOJu0YybZZAHbOounhAwut4vJHFaMDV6Tb5p8UeoeNsOwWeq5aGQ/rOM
	jbAVu7/o0iTJZkb7qJoyXRDZ3h0aLPaKswsrlmYSW43RKs0vzV5PYPjeeGzk18vHhJrCs6c5m2E
	vHbekfWTC0s30cVGYw49hHK00CEUnEyHgu+OZh4Rhu0LvhQkbbvo5ISh9zpdJd6IW
X-Gm-Gg: AY/fxX4UznMeI1sAY5pMAbABxSjkY2b3COZk//Rye9Th33wbH1/quiJRR0UuI6ZSvih
	GQzYFfzF+tQhjYT3hlX76JhtP74fwO0iOQtGtyVn2orK6aMMpOVOR8k+ycwm0KoSKVTwO14CVpK
	0hsHNOtwXPtvS6dyD2uqIEKofNffo0ZgsTFLufdvss+ei0ab9tKrYO45H+b1WN+sQooNY6bveP7
	RpiSCAoLoNdcO9anVQhrPsWLNE8hdT7kDXgtR0PCNUDXfjls/iw7WOUcKWr+bNUtykU85GbSBu8
	QPRXdTVNn3A56N0E5wTcoRatWCJhNNlR3n29E2VyLvQnWabBXcZ6qHiw6o91+wc68PKfHQ49vFo
	fi4XMs59ygmvaLe4mI7suJ1rUob5TWQpdfQ==
X-Received: by 2002:a05:620a:6ccd:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8c52fbffa64mr413617285a.78.1768404638355;
        Wed, 14 Jan 2026 07:30:38 -0800 (PST)
X-Received: by 2002:a05:620a:6ccd:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8c52fbffa64mr413605785a.78.1768404637689;
        Wed, 14 Jan 2026 07:30:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:10 +0100
Subject: [PATCH 09/11] pinctrl: tegra-xusb: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-9-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hz6iLmKEfxDKfrrjH8upUbRNGTU/avM3tmt35o0Wjvc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aHavwX9VGYJNPXqlYS557XrI51pw+HBiAgS
 ksF1auZQ8aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hwAKCRDBN2bmhouD
 14N6D/4u0Ishpad2NsggJaHhekQq6iqnAlDq+P4aUzZ2je0asU428AUXHgBNvCHiiaRNuJ7peKn
 kZaXFhOLRJL4lxXomi8DHl1w9D1wmI2dmJY6uuG7+xE0WxinMpd5kVfeW2Xtb54zER0cJh1D5bI
 sVk4n6tZOECbNOeSCkDuz9iEmckynK/jzlrOtYLy0nBFnaMx4id35WfzzlMbiT2y/C/eloosWov
 Hmaa4SZ3MfGPYTu36FG2d+rvHNNb9+WSIuzkjv+VTj3cK17PThBorYGBp/w0aJ8TZSzhi06ZV9p
 muZ8lj8SdZ97AguyfiMxk+Bn7pnrY1uffQ50Y+89Q0MUkED8IzjqPDYMxxlEPSUsTi4rcPT/Nwf
 YjxycS6wVR7jaqPzsW9sPjVnOGg4m4RSiiD1UI2kij+foiDbWUDEcdzMktasIlpA2SELsmvfpKe
 NkKfC/MRbCi7phtLl2BQz7sIegR3+lh5wHlWf5Bp+vdP/TwV+uSXTTrwiRsQhuSaTR+J7imqz7v
 rKwBAo7jL18AC5SjN42i/KN+kBPDr1ukX+5zCgQGI6rTDSkYOwuTeWTgHMyLQmymCwjNAz4SbuG
 wHlm83t3XUAC1jznj2naoOonPyr+Xpa9qqPg4IfTnnixh13WCTfgidggeW++iXeRSKLA/Q1o09+
 FxL7I1nczulzGhg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6967b69f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aRO1tsgHJH1V1zxVpf4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: --gSmMPpXapYU2l3RNmop-1uCQOLc3lF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfXyCl/s55d70gS
 +G5KlAO0VWoYJUGYP6KS2lVGforsfNqqH+7VtrCH8FvIyvyfjd/b7WZPJTnlqkbMRO66f1ju3Ls
 OoS+Kv3mC2zH1VSDLBMIfm4Bdzg2OegaUM640Dyxh8qS3Kq9TZDJ3kbwxotZh7FUY8NoD4HAjUN
 Dx8gw18HqvjSME7pu8Z/gFb0jXiws2ELlXKy+w54fFp08whQBlSn2Ovr2olRlqfZTGs0EuvBbhP
 /IE/dA+ebPQn/4R4ZrfR/u6S+AYPhFghxuEwuOntbqYj1jt9/xHNFJV6IQSiUwrBKZdR/9p51BL
 VaHF0EpT5UApMEeXqog+SIAiyleHB1b1jxcJjXoQ8GL4++tZoFqbTfhG3MBloAT6NoOb7rcXxLf
 DyhxkkV2P7DXNGTyG5LhqHAKsZIuYhu/3i5Blm4wZl0oZHcU7D81vDov8O2KRh3OvEWtvMPM+CR
 c7cwPN31NGNZnzMdlHw==
X-Proofpoint-GUID: --gSmMPpXapYU2l3RNmop-1uCQOLc3lF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 34a373f7e04d..855f708ce510 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -478,10 +478,10 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
-	mutex_lock(&padctl->lock);
+	guard(mutex)(&padctl->lock);
 
 	if (padctl->enable++ > 0)
-		goto out;
+		return;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
@@ -499,7 +499,6 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
 
-out:
 	mutex_unlock(&padctl->lock);
 }
 
@@ -507,13 +506,13 @@ static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
-	mutex_lock(&padctl->lock);
+	guard(mutex)(&padctl->lock);
 
 	if (WARN_ON(padctl->enable == 0))
-		goto out;
+		return;
 
 	if (--padctl->enable > 0)
-		goto out;
+		return;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value |= XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
@@ -530,9 +529,6 @@ static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value |= XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
-
-out:
-	mutex_unlock(&padctl->lock);
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)

-- 
2.51.0


