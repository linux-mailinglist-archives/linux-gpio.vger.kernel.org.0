Return-Path: <linux-gpio+bounces-30562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E010BD1FC09
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30C123011991
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B5E39E6D9;
	Wed, 14 Jan 2026 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ja6yf+55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GojWMTLn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A2D39E19C
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404632; cv=none; b=tq8F7YQ7i/kz/tp8hH3tFsChcc2opnvF7uNyS7EC9xuH3oMG5/bIFr7qTs8AHCU6wdtq2BAwH1eDyNG3Ruj9P3T2wTBnXLyHMCOEy7OFujATx+1CZgiM9vEcfCfQ58h0PI6smPAIpDwWteRPSjh3PMwKEai1emcnQWEQP1cHDH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404632; c=relaxed/simple;
	bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgZ/bFdEOyMsWL1RL3IpyaDY/vRlTEeaXN1sbRlvSV1cmDSaLvu9MDO5sXeK7/NL8pXwr9Ziz0VAbuQZEMZolVlFeXaex8RKwlflRgXbGpGoYGj4b8Gxw4XR6IjKbxvzvlNOSeX36/1EEKlBcGGIPvUgOOrGsVm2nP7V5DhPf2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ja6yf+55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GojWMTLn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EA5BST2902944
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=Ja6yf+55fHq9cr9+
	3BmQxbt5bpN7SHtBWVenCY2tSp/rN7yEiuQCqdkiBXi67+06a/9pLEqUAeXLTdNc
	a1grs8LrblCreo1vw7SXp2xl5M9w4EIMROi0sTqscq5x2HqimEYP+t9LG7NSfIN0
	oW0mJSmKZfsrffOl10LCS9I+c68oIPg6PMdbu9NWlAbfYeIljtZ5LwgkSSYHwo0I
	3JOnKWXYOoVsAlspcsRJg5tELpY5u/wJniUo+jZfwG6wj8mYx63YcXGrOMDwboK7
	SOhO1+6gPKgS8ghvVXEQWk1ZVwZqbf1Hap0Q/5oJrgreJR5QtLCL1pFJaKpiTSIP
	2G8J/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931h2am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb9f029f31so2434655485a.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404628; x=1769009428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=GojWMTLn856GBE3cw1UlRi4V9lU0CuENVqrGSG7TKCtNjFW045TK2Lb+jjzaVFE5zE
         3DPcksE/2qTQssDp+/h36abJMFd/MHmKzdnZl7Oz4kVv1U+yQ697HPjacf5WrSDdQ2On
         lk6eha2SyZKrYmnkZdpS0t4fJt0wpavI8yCOVBYKMFamhQI34aI7UQuBMCR6+9takPuz
         D8WudLgpNblaggaJoUPMSXq1rBAHeB//gi3FAZ0155yyMwwM7h2EY336ooM12q0BwQww
         vDTIIkhQCIyGhZ2y0FR5uRmBzDqX1NeO/HIFQ8idflBi1IWaCSO5FulezRPYGcQtEIQX
         mSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404628; x=1769009428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=uH9g1ec3AGmCGCQxVoWq7r8nvSP+UQapCrBgu1Y755yVo/GgMfcnefiVwGwJatK1sH
         g8yuwZb51jvoXDjB/xGfC0AHl18wA6zSD+wGIul3mgnDI9McXDhMyMTR095WE/ZITfyr
         xtqht/esCqp2PbO6oGXXAIh5CnM35xcxBXgjcWFhbGdAILuth0jPUGy0jn0mUJMU9UKq
         5r+hnvLYnk+heGKO53UWGxrAcAFJ1CmNEe8IJYekEj2qesc2aRHyibQkuhwz/Mjh6UPx
         MWNPGbwjerX2EJ/osAuu8b9BtgmKEq0YG1L9kS/T9j9ETKz5A/B8DM7NUAWWoATA57TZ
         z+dw==
X-Forwarded-Encrypted: i=1; AJvYcCWxuUP9aUU60kb9zeRrXKau7zEgkKNZOsT3ITI+ADguGdMGmw8enj+hJDN15OY1vh0m04yM61uZCg/B@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9gSUkDLjqT+2UPDvarFwooXNv8XWkEDHKrVKlFIYcFNfTQV4h
	tny0T1ey6BFUZUEZa9O2NhSBrVAWyTCtNlnf+QLUv6Lnos+/GvJ6k4OZM9XUI2F5j29FMUx6iCx
	8SKUZu/0DIcuOvHMXyH/hyZ+CUrnpOWpgHY0RBtT3vWf/3BZoKvGMVVNu/4xGm/rG
X-Gm-Gg: AY/fxX7clA6oatMtgRG1s5VuRFLm5hhVwgHnaB95KCPBzUxzI0Ph2N1c/T6ok+MfTFm
	d6tYc9HIyk2MZ34+Ty7WWjmqEioErId5bYA5KiYU3ZRDNy2dLKNtUV/0q+akWgL7/5mjT/wAkbD
	WSBvYAQbMBm5rAiM7FNMftYM2i1N9bS4D8BumfA0GzXYCbdPIi06uVywd06UuGlpoIraxSDAEAt
	zpK4Y4u0huKdYWg7bv3Ddbn7geN994gEfx2Nzs0sY9t8pPrULu5ofBvWpEPeAOP6u0EKAD0Oe6s
	1gYc/ZmdLgJPZH4QBS7ypFxFFpa6qSDSKgUOkQeCOfPNhAWusUuvjkqtLREoMjDCMoOxGJDOGEZ
	O8Z6C17d3KOMuMfQvnLieWUou61Pdop4iEQ==
X-Received: by 2002:a05:620a:4443:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c52fbcf013mr422897285a.47.1768404628279;
        Wed, 14 Jan 2026 07:30:28 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c52fbcf013mr422891285a.47.1768404627841;
        Wed, 14 Jan 2026 07:30:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:05 +0100
Subject: [PATCH 04/11] pinctrl: amd: Cleanup header includes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-4-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aDV+noj7ZcYLzGFw85urth6DKCl65+zERGB
 6whzCjLMW2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gwAKCRDBN2bmhouD
 13ELD/9w2SYmYalYA5vFc6Rf1PTVYZ4B1dYRonz1b2DQNyOu2VbPve8mcP3qP5S8Lunlmu9pnM9
 XxA6ShVzZzR8X9u1+aHI18FkeFftaZO1X/ipHiRgWYmwxHee50F43GoRYkUKtL5EeGs+pgVFtvS
 N35v5ZOaS4dRcJ97oRggrrqF3+rewugdNfcOjABy9z+5McTb/al3fNFk7obz1H3xjL77Jo3RQcb
 jKwvKaJYn+puhraiSHisoI1Q8H0GnWywr6Yq12zvOzY10VAU828u15UF1rvvfdSZBMNoDaZN8YR
 MY/C4aYFC0Y84PtJu62kmJ4n4v4JBd/PrIYVnOSEvIoAZkqMo4it79WoNtuEoNx+OhSQ0P0+FTw
 ncPMJVQ0RwPTjUhmgU+Siqc1uuFokQOIgc8sWxA187rXXifisB8e0Qz8cofr4vT2YdFLTDQlTtb
 DsVJhtQvL20afD8ktEE3e9SBn/kC2U5XBha9yUQiLszF7/SkefUvWkoLphBJoHJQesPlcSGwLES
 8ZjODkLNTik+YIzT+y6r9oBPDa+Ft1z/sPRZtZpjZCeGeSqLeOkBl2iH5kgzmgSjGANsVseb/1k
 xn+gb1RtR8rDo4/67L+lt6mr4ki4euFWZMFfg8c6VM8c7ZQonmBPCX9sGdbGnfFG3z8Loh8tgWe
 NlXvgC6SiJVTR6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=6967b695 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMXyHTyi87mTYQFNLaMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OVYJYwH-B8ru9mdmH4Jl960Bp4kLtFe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX2nQv9tPbiJTA
 o+UYk/c1QDQ24pxDjEplD3xkVyjr4Qa1dHSd36mvn7mHQmq7Cy2gsTlBdrNj3sijQWOYgxM++sW
 SGe1h4CpCnOsP/UbTu5lm4TUfbPghiz9tE5A0zs+5KdHCp/aQaTvkjCcs//ua6V35YfHwjidwX3
 yvOVSMt0msLI13TsvxVAWYNG57ZFzgUDTGFrn8W6K+ErhiZbSKPBlIVzvtRK2jD86tOHU9hUru1
 tLbLwzDSYaRgWRbjYIkhS6DgUkwJCWGXgTNP0T17ygyXW/QXxhZJq/HlEqwL8+by22/O7xa/E2o
 Cke5fFfdWfkQjmy10bi8cbzITuwcx1BAzoOtbJPVHkqpz7RolHScqvw1JVKM6c2ZxcVDXCfr7xp
 1LjdjWx59R9wTvxNho+hoIJ7pB9bVqcXHMGAKEVu86ocpt6ik07YBSgXunYjL203hFF+OwyxhnZ
 9CICuN/e7g2xQypOdJA==
X-Proofpoint-GUID: OVYJYwH-B8ru9mdmH4Jl960Bp4kLtFe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140129

Remove unused includes: no lists and mutexes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2dac5c71eb00..2af94ef56434 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -21,11 +21,9 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/mutex.h>
 #include <linux/acpi.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
-#include <linux/list.h>
 #include <linux/bitops.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>

-- 
2.51.0


