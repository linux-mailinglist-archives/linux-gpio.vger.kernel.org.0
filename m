Return-Path: <linux-gpio+bounces-30706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DADD398DC
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 19:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59DC23015939
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 18:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A093090F5;
	Sun, 18 Jan 2026 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRpcLxOS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNr9ICmN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C432FE071
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759826; cv=none; b=a6CzIyROhu9ZLitk0yCvEK2AKDbjsKcZHP55sWEL4OSo3qZoxHskFq5ol34hmzJ/4hZTq8Li4cLNkpo7EfI50Zk9z+iH7o7kPOmYxbfErV9MOKh0XDIBkDuzY9zER1oCI6oFsKsUfg/BNbRh1VYfyvpuJHNQH8ws0hE5KwtjO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759826; c=relaxed/simple;
	bh=FLZSR96VBkRrzhSP3/2OgTuUg9DxmOscsEadYFKjqPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHEnWxq3UY1tANvtjYZnuPmQdmsTlq/Z9nWCrZfHXmuYBqN75pUj4NyJhvdvUVYRmyzddGiE6iTgv9bLs117KXiIlOmerOHlcIytW3dE8y3IRLbbP7rJwcsErhUjOWvbG1lgKSiLZ4YlpyEIClhYUvJfKq6jsFTzrMuafP9/Zm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRpcLxOS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNr9ICmN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I4XG3x2653475
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=; b=oRpcLxOSIgnQcj/G
	yg8Hyar8Un3q7Ovi/gBJnj3R+oluHlUQFC1DHjF2h+VTk000kvwcmxlLWX/zOVUh
	w9fRrrwLuCluyalYVdPb3sZJZpCc/r/UNmi6zxL129lxgfQnpDDPVroP9f/ethIv
	c70ogb4hngTCCYaYJiWKzGJZLPlO4m8JtHNoJSa1MkMfEu7IoaWDAtkf6sJGjaRA
	ZsHfxqXTxLw9yGMPfIhg8nSFt/MiFAFZ+zVDeEuz121NLy0+IiSSFsIOgTKm5U4b
	S1oRRECpIpwXLg7Zc4h059rZyp9AmllxgFuqiGNWeKo/C6u4MPf7QevOiUl755ST
	oqvn7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5jyh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ae763d03so210439985a.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 10:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759822; x=1769364622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=;
        b=UNr9ICmN/MxFBIybOtTRo3IjX+44iUMXqIzx9UOXBgJO6mHNDPlk3HcLt95rruKkXN
         Yw79/kUFACRwlVyN9L4Z2W+P5Z7ph7V8aEM/bPyiKrYHDxi+VzpeiUJGjusq4JFbUa4c
         /Wbz9ipWF1M58CkzxF0MlLamsGjWm0BLASKpBd9/SobLaOL52YmaG9A0WR20BK0kR4Q2
         xIPt1QAp6cwpyU5EqM7ZKEGxc7p4O6OxrNYS6VlQe2tCA4fRh4xc/Oxh70TjnGgzwnfT
         DzT3x2ye1mFSELo4xYlNmitr3vkbfHpjz46y0KnifiZ6J360nTj8vFAkrDz0A/c4hpGP
         YQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759822; x=1769364622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=;
        b=LFgf5beygecuqRQCbUvS4MnMfZ5xwBTGWXyAW7+wJRW/MHeFR+D/8BoFV1YkB3anQL
         jGr7AdXEr3Wu6KuIMRUFs+UjEn0mrKLUSwJtUexPR+FD7Csw9k1f/gy76xbqS9Ks3C+i
         EjSdOkoobHrX6vSnb45r4Y2IsKRfsxJwBWTlGyFD71IpgeUeO+joE9/sTfG0tvsMfYgf
         zI4ZvEWh10ZNUTDLjBjKX+VafWXa/fkUYYaHgx5afNw10ig5g48UcoOAvUhZvOUfHklV
         UUsYlF38XYC+bOmu2jMPOvFXP/XIzL0OsK1+cVV3TGAqcZSwZnLACUW3w6jprnNk2p7z
         ElcA==
X-Forwarded-Encrypted: i=1; AJvYcCVBm9QW5ivb2t7sapKURU2OgJKkATF7/qsMwTB00k9IajntoGTfuijKHnMgq/9cyo6cFbLhpk59VbJq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5Tub+ZJHlZsuNRiNUB4DTZ2z+4l5C94tf+8JseBaVQGilbhS
	y52kWzv/hn0QhmnPYFptRittRnnvvWbEuwyDoih9T8IEcD1huE2B6ZtH5+mHt4uXb1vPjcLxtM7
	RteSQzg0YCdShbNPsjSbQ+vRQrYES7cS0SnKx5rdIWL6qVR9xvR/w9/xnP8WQj0RH
X-Gm-Gg: AY/fxX791VBvo02W0PmR/e1uEfXmpqywnRaV99TzmlAFLMnKzSvxbVAGHt74/iBelWX
	+9JB84tgCJOnI8VAYcZCjJ0Ci7oGKzMgs/flWmHzyPzJn0D9RyvwkO8Gq86bkrzy7VmmHk0wm8w
	WqItWGxGJzFy3O4g6ymiZzfTxGpQ7NY1Q4ZG5w17o2fj2e6YK2NZg54VknoW6KGzuQSvMNlSPVk
	xYIQV1QHtNmr4G7DlHJ4ZMWJQcMFTiwedXnL7v/nYplmZeg1QgqZ2ZHuSHnBW8o9VzRbtm9tlt6
	e+v2KbEyzCQBL5GqVvcdeecXe9Cti6qIr6jsukmZNF6ADAwUSsLC655md6o5HO9/BIO6z6L9Ylo
	O0IB+OTDKBxWlBF3VfidjZ6J/XlyMTqYV7w==
X-Received: by 2002:a05:620a:1a8b:b0:8c6:b315:1452 with SMTP id af79cd13be357-8c6b315184fmr728110085a.7.1768759822590;
        Sun, 18 Jan 2026 10:10:22 -0800 (PST)
X-Received: by 2002:a05:620a:1a8b:b0:8c6:b315:1452 with SMTP id af79cd13be357-8c6b315184fmr728105485a.7.1768759822113;
        Sun, 18 Jan 2026 10:10:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:32 +0100
Subject: [PATCH v2 09/11] pinctrl: tegra-xusb: Simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-9-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FLZSR96VBkRrzhSP3/2OgTuUg9DxmOscsEadYFKjqPY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH12QqDR9lyHrdfWBYKu5wDAWLJ9ZakzQ3LT
 0UuYPASn5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9QAKCRDBN2bmhouD
 12VHD/9unxdOGDL9Cvw8qMe+777M4gAqFDHe661yf+QCRAMfaXbN3WSV5wByRbqTx3YfWy21YOQ
 PmUn8RHfADZRESRLJ40apeyBHwmf+X3aiVzCvJrIhssAEg8e6K7zet9KS39Wxq+ggSw4RMklgwR
 648adqt9vMbooDA18DkIXowYvJNwPJKcEnez2js1gOhYtk9Et0iy/q7sWb1Pdi265zTYwxv9fSN
 1XA2P6oDR2vvTZGfRM3Y3qL9sYGLOq+7J9B2IhXGsT4h0bakUH/HwP+otw1LPAta+OerExiolHI
 mYexTPNF9qC1iJTWw9c0TKj9KMWD6/7qUHNH6Na0WwHWYNyqKi68kjfdg8ye2KAuFsHc4AFBrlg
 D4+GUG4Z5YjPvImtD+ZxD49iaeWlpHrIs9/oPs8qcDvb4tIp237aGABh+JBRAXZIneYCMNNZaT1
 StSPdDt7VhSHoNzlof1zSlpuaWaw1Pabz/Tr+4F1xEqFkZZFTdO26JMZcQMyZox72x7c/QHRR5A
 +YvVe+Z5+GsaGQttt1PTi5ccnDiKJoTagTW/dEGBAtL7aTvBTSan7k10tRuwFKj8ZWVzxHG4TSI
 Uw+E/NGfkjEagoYcsHuN9QA27EJwqMeW9WQTpq7JAAHx4NjypWFW+haLBXvrjgznmhZ8d0reg6W
 wSCbjewNTPr6JfA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX27M9djVsNMec
 5VOojp3ihsENlL8JhvfKIX/dU0qg121OTK3cxm2Sgr/Zwhkha3IlHvsj82GPgOo12to/09VTK7q
 alZp/56AVXXWKZymNkcZyRkLgOAuYPkOi81f32V3ZYfplhlvUYr2Zed/rzENMuzOx/c5J4tEnMy
 DJNzja5UWyBmWAbLqZYQ1oifRILlfc6+TiTayPjANtPn8K9qvaUiZk5TckjOZ3GWUQLaRURC9Ds
 cC6J3RqJq4D3rxzR7Upb1qc4OkpSj3cvVC7Z2DxikHyOiIjK30CrQC8o/vG/UEPN8Agr6IpywG3
 sFqkl4DMZyzQohPM0zeeYU9WWzvhe17tUV3YTyqRr+psiDhzgzE7E5Jg7Pt8dz+1WJ0ebJpa8Ua
 rjPk/4lqOfoA45Yl6JoSG6QLj21dsg0SIn33CXi+YbGNd0aHw4u5QklFJbOnacedQJQ2hL3yqnf
 V9GB9poFvWgwyBRgJWQ==
X-Proofpoint-GUID: Xi1xoqelq8rZNLFuPHYhGGal4leKUStI
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696d220f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aRO1tsgHJH1V1zxVpf4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Xi1xoqelq8rZNLFuPHYhGGal4leKUStI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Drop stale mutex_unlock (Jon)
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 34a373f7e04d..c6a51bb21215 100644
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
@@ -498,22 +498,19 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
-
-out:
-	mutex_unlock(&padctl->lock);
 }
 
 static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
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
@@ -530,9 +527,6 @@ static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
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


