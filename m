Return-Path: <linux-gpio+bounces-30700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA7D398CB
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 19:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 456A03009749
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 18:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0362FFF9C;
	Sun, 18 Jan 2026 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eL0a1Qb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZyLaTjx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001972FFDEA
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759810; cv=none; b=VFiBs4Y1NNsy6eCU/f7bhZ61xTIKMnaNGdwWY/Jh+aYy0n0L68YqXmkmxDUQmaPEfHND6neW8wvUOTvMJVoW4AGcv5WwvUYYb5YPsSNzC3dYEKKIa2j59fdqVIQ4B5x52bXpaMFwWwEeEKyZVUAow5kxdKLwiGVBJKXoMUCxPSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759810; c=relaxed/simple;
	bh=7QVsX3meH/ya2n+MBwkYR1pzRXVW1X0rbx6284HAjYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rszqEzUGJ/9w1fmfA22IfNvsOB3huABuT4KlhLVxtJIluN/N/KwTKyKCK2gBd37/Mq+tIdOIVkUy4kB9an7s1VwjzzUAk21YgGeh536a3fIyF4/P1YdbaAj1La9EwPx0mcPSYFwdIH4oWMGTRIJNVuy2F0gbDxHgrr08d6MdRfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eL0a1Qb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZyLaTjx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I6oQUP2359211
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=; b=eL0a1Qb7gDs4Ddve
	0NXzoUo9WM/0fPiz+owufJ/TN7UB1YorGCL5iME/3xC20RYpToTyzU9rMAl69/cX
	p0se3f7oX63VGOYHAj579mzRleSJhJKqA1K2iejV6rNmmjQiZuwrXiluUYJeYd43
	p05ezSi73YZu3gmMpnkbK/NT/g02StJ2p+xr68eOs+RhPvxe+nqM/+kqh171eNhf
	e1I7pgMXFtt3HuLgyHGwJnoLoHWAQ8vKfYIWwT6yLRTTp7thQtJU6gCSi8EfTM55
	bOH6F+Br1a/t/yoE7EIMymmpb2Q/8yYy+chJp1osPlgMqMctqVegdOP9YCBrenu9
	NTwUXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqay0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a291e7faso309770985a.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759807; x=1769364607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=;
        b=GZyLaTjxGwiQgDRbu3sL/e4A9c1cd2ag/n3tCUItndGWxgVlEbRHWEvzdgEkjWwUHC
         RSaCn8pGvF3evR3IJmm197i7F4VUSCAPYJEcjIJBJPlOQeDn5gB8vbwna7aqqzmPE4Iv
         ya5K/evDv9sXUCxfTdVmwXQccOwGzi4EQqKXVYmbypwsQhc/W30heopHNTdoVJz2tOv+
         VJeIiCV3OKLoUdPPwFZrnURG9Rra07ZUr5aueZAhTwRoatyruP687trtIkWsJlOPTEq/
         QbaARyT4SxweVda/mapTBlMBVCF87cSI8TxzRkG4LlIOFxKCmjkTErZ1kW8xJ5xTly//
         oW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759807; x=1769364607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=;
        b=fQniUGShepg34n8ms++ZbrWd9fHXRpRtMA2JqzJ7my2e6sn4+t9d/wbY8TDupiNjmR
         dLT+j7jSVwic8yG6s4M494NU/0JuWw/TAWjL32dS6p4CQjsjUMOvDHRLGKXEcwh9E4tx
         QyA174FHmt+4OBiK65Wa/9CRmTf9nMtRtRGxoJaGn+2I2e4atl9nRiCGTfcMwbikQk+N
         Xo0+5ZQ9pxFC6clu2U2hiCVHrL/2hSyKuPDjawem80jyh3FOVmq3NFkEXg+tl3bjM+cu
         9jP4fdSgut8g4CtsgwDr4hS2IFyJEEQsDWYEAzoO2z5D1HmE149/d2UStmGKPdeeYTMO
         /+xw==
X-Forwarded-Encrypted: i=1; AJvYcCX/o/jJz5csNlaHtVNaX7F/vCIcH8CkCwT8739No70eeJOxFCDu12b+A5U1BxhO6coS2Td/dygQXwUO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Z+ym1m+nV09LttNmJb9IZIyNMTf2mUsV6npC/yZWEtc4jbrF
	T6bRgIwMFzF3P6DEZZY0efYlzj/+MikLhoK7ky1PRSTITX53GxV7LA9FUC88mMJv18Reo2eNXLs
	bXyT5d4M8iEP79eXUx6hh9w0BiZYDFCbynRwfO7mS42eywB7Npsq83jwh0UnAjz2Q
X-Gm-Gg: AY/fxX7Mfqgew+YqeRKOu2XPi0KhftPhu3iw+tdFiTsscoh/sKHgH5P4Zfz37TrHxe5
	Dx0GheEbSbq6vkDibQfpkLlEstSsfthM2GPTk7zKI5atEdif4hzab9S4Zj0NZby9wmKSWojELWX
	URlPziTSjtdo7MbGxH6S9yZ7MLftLoYIeVg2JuSHLHTglLsQ2FX0qP67Hn4iNgUTTIpom3oAkMX
	NRCka4j+srMK5T8/z4l6GMorY1ucATloelvIHGhXZZf7hOmMgXrzq8bCIZDwdRhCqVJBMvpWLNP
	Z0+IrSKXNWeL4636fwVQ5pAjOQ2zX6EoDjzv+iF6IK6xr5SfqhzXH+dWkqrccd6rkj9MLaindZH
	OwiYzBpYLnqpyBN5xwTxnLiZySzmQLGLLPQ==
X-Received: by 2002:a05:620a:319d:b0:8a1:762a:ab13 with SMTP id af79cd13be357-8c6a68ed101mr1320494985a.10.1768759807237;
        Sun, 18 Jan 2026 10:10:07 -0800 (PST)
X-Received: by 2002:a05:620a:319d:b0:8a1:762a:ab13 with SMTP id af79cd13be357-8c6a68ed101mr1320490285a.10.1768759806815;
        Sun, 18 Jan 2026 10:10:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:25 +0100
Subject: [PATCH v2 02/11] pinctrl: starfive: jh7110-sys: Cleanup header
 includes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-2-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7QVsX3meH/ya2n+MBwkYR1pzRXVW1X0rbx6284HAjYo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHvR6NL3AOW754D5v84SJb7LIyFBtY8KP66G
 rat0rpoDimJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h7wAKCRDBN2bmhouD
 140hD/oDwb35yyHvtbjc/M0Lb0PMZ0C388lWdCmXu5PHWfBfqbi0pqIpiLHa/I8lydecaQng+2T
 6pXYaLCQXfyx6d6HjJ55DKT0y0CB6wGv6jNrkEel9RIEZtNF98EnmNQ16fH/1rSb9mkMC7i2p7p
 uDQZ4QUXT4LLz83NgAx9pJhb0KnfOtuSCj7ilWSVwBJAtUtjFo5I5GRJSTTEh56yE2ZABLc4cPM
 v3zF59Hm8PbD3E9MuXG9dkZ3zcW4LPXVh80oYbkUYomCkspDgpq1XUWslyrduP8BRg61ub43bFN
 D7b2pKxQcp9n4qRPG87arVBUJzO5bUdZriEhcvIwRA8g7Ty4t1XjUE2dBdcmlu1jHGR4yu0AvNS
 J7gZipSXXYh7pfrpXX5hfVYQaU0Rx5NjFvVJYlHsg3MPu58t0NRwsCZyu5njKqBnL97H23DcTnb
 OGU6INWVFiyd26HXHhgTxNPu8HbyBRFE4CXAtbLk+R38puFmLXoAIe93PD83NKVNNA5JuQ1qMDT
 03Mtb/klRnsQT786huPeUBAPeMhGoyfg8zbw5gZNhOsb7qtBjGABqQ2+kFMbdfME3WC2aEWdkol
 fQpOxqisp1hpLzun3NpNsowLGMaZelCuMxI2s0Eqx5whKM1Oq8cNrvIZKO9NQDkY4SqD/TZ+3rw
 05cWuH/pid0x7LQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: C0pr9g0mXvGRwq5yMOisFWnf1JmNscA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX4W57NdtPATCP
 LYHOH7WoETRUZKY78GGMcYlDGbuQzSAS7+1YEnMdTjeWYGXQJi9CxyAb9/b2sE8DVlABsUWaMCG
 NUufak3CwmBSXkTFlh1rmBtbjidD5IbBLYZSU5D6+dLBGuHNLX6PbAQXAZ3r1RYC0x0JTDa001g
 6Z0/riEug5z9yunuOF+OMn9ZSo9zNN+1BYODf8T/8eyed1v/2tM/pTWPlqHzRoiaWQHWXkBe564
 mRQsbROr1HY4ac4J6wFs3xDvhQ2OumGokQIopZ6tcaAWh/UBQsovOL+Jqdv7O02hxQ2RPMS6nOX
 pQTiHKXG+RANac2xgu5fx+iEz13GDNPVFqE/h14S/P5VpMC8AQGYwyEDcp9E8S6cq+Ry08Sq+yO
 3/uiiwRKhAI15djPf9bjYKziaV6IBOyMwUbyk+fKSLgYFTK8phwQwXHL2ElOsw7xQUDUvIKfoSt
 mosF7t0iLSNxsaVWEHQ==
X-Proofpoint-ORIG-GUID: C0pr9g0mXvGRwq5yMOisFWnf1JmNscA7
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696d2200 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Bq6zwJu1AAAA:8 a=EUspDBNiAAAA:8
 a=2Nzugx-BcEq53SDkSVIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159

Remove unused includes: no clocks, mutexes and resets.

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
index 9b67063a0b0b..44f84e4c29bf 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
@@ -7,14 +7,11 @@
  */
 
 #include <linux/bits.h>
-#include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include <linux/pinctrl/pinctrl.h>

-- 
2.51.0


