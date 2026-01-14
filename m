Return-Path: <linux-gpio+bounces-30568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF8D1FDE3
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61C78307BDD4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB383A1A5D;
	Wed, 14 Jan 2026 15:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0gmla3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMwDOif1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A839F3A1A26
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404645; cv=none; b=rCskkXGGulhLSQZsxXdxIGRRXL81Ku7VyOiAt+C+UaSXoaYPVI8tPj21eVRLWHBk66qcLAXPonASAlJVWxcnWcIYWigL9VkdyaYS00L9nQN3z/sbrFrq2ShxK+beMqgjqUEMei2CVGkyBUAFn49qaVIkDXGOS7Dww8jFA/kfYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404645; c=relaxed/simple;
	bh=9+1hnIFGck3b+xQzUfQOk+LUFT1gQJKcE/unZtByYAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CV99g66QDRyQY6Lc0hR3bqQ7tN9x/3HHfn6BB4RPSJn1LbfBmtD972DDHX2YY7Mb0Pa4v3dwP3L8j7Qy6sS02afHghwEzeWjQQ05DRvYrC9iTJ2cNTwmKTwN250cuLWEVQzyCblC3S3/dJsadyYWUA34YtDxWkS7SVJc5+ovDQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0gmla3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMwDOif1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDuKxh2081592
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=; b=c0gmla3nEwW1grom
	dXfhMbs2CUA0nDw7P+mN/FxD+dkR3rvaLg1kj3Nh9uN83L54wADzxSvhai1Czh3o
	2Z4/Gt1Ftvc2cgOWr3LZiD7Uq4ypjP8ZT+7sDuhbqb3HYJDQpZ7OrzIf81BX0H4J
	lF1mR5L9zhlV6RdlrxyvfNJjXvrj6xgubK3JL0usnUC2m/6pPMzEsOqSyd7zVVdT
	uZolIq0Q9qTwubXeuXWTAJbOaeGgW8HmvOOKNw2Z3XPfK7RiY4Nd1H40O0BGDa4R
	EQ1XpTh5M4lrFkiSZ1EUhg58ozURytLvOpuOMTchVUUu0v7sRbxOU/92dxJcw1iO
	O68bPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58v006-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5329ed28bso160202485a.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404641; x=1769009441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=;
        b=aMwDOif14mxqlHQ/zUp3NJkhmq6+X57IOT6uqnnVJmJLgkS1KnRn1LGJYGn9i/8Kot
         /v+8qNKNSIdcP5NQtuAACut0TYKn8T2+0MvRoKnyi4GO7qvpUh2Z5DV6n7qwfudxUWpw
         R6JqTs6qoSzwJCfEhRor5X99dpAaBSdLJ04Rwcsq9KxIC7ipGyCoRgtTL1YU2y446jt5
         Ln7ZNl9uI3LyhZQVxDRVdLy+zQr2BnO3Y9dH7ZJEC4tspl08GTZOTs/QDDLtFLaLV5cy
         bThUIpNMt0z0fPWBGY5MUwOo4SIkoaDKjfqW8RlaWroccHgWcBTsfV39V4WL+QKDGVFK
         P/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404641; x=1769009441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=;
        b=aQnP5Lm/PCSp6kDXEUzVO+s8f+8GYrdk0PbIJVmMQJLAwkEVgBQqNwuCLB5/YPCvpy
         oetzGAwT6O0BVZ2RmJiU6rnpiLewnfJAfBl7z08tyhZBT7W/dBZa61K+tyHQGCXdD2sw
         0LYVCKCR2AzsEzNfmUDzQHsXGMOqUzP6VyD3kSstY/7XwGac5pxQVD0Qvf/g4cs3MeVh
         dbZ7YHEYfFmEGHZtrX9WA+COO7ajZttxrlLnZKvxcQ02ZvJyK4VzzQGUXNqjvmwNxefK
         NNZiIc5tIzi9eozK0infdpC8H7R7SQ//mcrWZafFbIgKnwqfx3Gh4MCvKF8S2vAx0v3u
         OxKA==
X-Forwarded-Encrypted: i=1; AJvYcCX6c03OLxFmvofJMQbGrbqxaFTJ4Bij1uKORi2XjY2SZqQaDujt4LrolDrqRen9WYLvj42HZAXvEqL5@vger.kernel.org
X-Gm-Message-State: AOJu0YyVjQVoxOm1uOrIMgj0P1p4HeP6KECLY8ppFha2kov8PVM5aSBG
	tNAC5vl6B3KWrk7Si0HC8L8WOFW9zxYd3VACNYt6ke2rj69dLL0jA9nJH5F/44+bGMnAO5EoQv3
	arPjCI6DW9gF5CTgWCfq851Sg0IuzJLDt6c3aj7qLELd2Rp38eqgRvzn1/XOwqkbK
X-Gm-Gg: AY/fxX4w+9J4L/ycPIjkrERH2y1JBIhnIrszp4ZsffMxH8BFH731adfcpdHadJEzRgn
	G5iJ/y7oe3ZNhxlj8PJOaRif/TcVDKPiYp3XWZ+N/nMF7tEY9KNrW4kmm98O4ZBq2pIoIdoZdV5
	U58Rr0OpHkVOE9EbZwqW2lrnb9rx0522Tv4xRwTPC0RDrNuR32SIz2vVFrNTw6/oPS+hmFHaW68
	XBaBiaMXl2n0fdA4VO1VcQDrPYcJ0vUkssKpJqTL3+s6jBkXFu4R8aCXwROaVg9nFvcV1Kj1nmx
	3pZf0gEg2zo9ESOMvMqWlAslTtRZWvgRF/HooYH/Scq8ik2Fg9YLcG4Jutua7IPra7RzXlJGDXe
	vYpKagGt68ja3kMP+Z1dQxQuJ0ULRWX5x5g==
X-Received: by 2002:a05:620a:6cc1:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8c53168ec37mr311806085a.28.1768404640529;
        Wed, 14 Jan 2026 07:30:40 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8c53168ec37mr311794785a.28.1768404639752;
        Wed, 14 Jan 2026 07:30:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:11 +0100
Subject: [PATCH 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9+1hnIFGck3b+xQzUfQOk+LUFT1gQJKcE/unZtByYAA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aIvjtMFFp1u5KZIz3s1rXIH/N4W/pA1awz0
 axCd4PEfTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2iAAKCRDBN2bmhouD
 16PJD/4udox+AT0qW++6/oS92v662DKt4vHflxhkYd1Y7cNFl6VsgBSRfzaoloaz0MEHOAVFGMt
 1UyMr93P+dS8fvc4VILacc5vZbJ/kr00OTwdcwQvdnsePTgGSF9jxGxB1yMVKlFjDrLF1zPkwpl
 29wGLZ37hS0UH0TeGW2udTIV1YUSrFiYFUZYsEcMt39OwgRdby8TpKGWJUjQxIvBk+/3xZOt/e7
 NPVy4lUSbhDTBQIXlTFIVTRce1yycOyBjEl+kvd/FhG6SHcCL61dVRC/HGbXL0M/wiiofXEdasR
 r9lwXPamriRLmuyjJw24hnarxswAqVCniTLhEcripalHasg+sQl3suIahqkaLyitP7Cnd/tzwbK
 +0IG7HVcQKU3c99Eb4MDp1+DQhaoB7hYCDuhAfVj131lDaC23kfGy82We0gW1UU3HljSGp/099i
 9dIEF1tOdwQ3Fn8QJ63QNMNDQrnXvvHNhKtSsvxkruUtxPw5PxcVn3TXp4E7SFojcFSU03Vjr6P
 1PerYKudeLt4fYL25YhswZnxQ55f9YEHdXOpcT6ioYr1ADvhmpbxvYqiutI5oF079O96zENLJW6
 XqeT+zpnIQ6JT3SXsguxvuciBugFqYtmWU6xsPv/UBK4NLPnIsNYRhMDUmDpn3uqmgo9awP1tGd
 9qrQnqhwTfT+JiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX0M6+l5QLIear
 nCAI88iFHdcoWxd4LFJ+Zgae1MlL9Obp75RBAxo7AjNOtNp3yN0QHWiPX+dw+KV7ZRgH8y95s64
 fl7hXhsRzVG1L5US5DGmqMQ/lkUNDEq0PTsIeAxDFx7jsRet4viAwf98jg9IW6SpzYVXSHuvJrP
 H0+Mf1GZ9Qvmt2VnC1x3m4CFQb6LDebIVAN7iYnmI4E/E6iZ0t0KnDfpq5W/VV2C2XbLrg+gTzp
 tFF9apo+klNa1e6lVW1E4lwydYU2N+RI1M0SE7Ia1yF1CBWLjLCeLdiquprAMkCMviTAbClkWq/
 YCXTYMD0+PtP4KogtZ9DlH+xThCqyE+nEl233cXMjFvT7sR9NllQDgxO5U2jOKEER4zojk9rgx1
 VxjFET4X5kn4luUhnWCgT33d/E6OF4CmVdnamLOHGgS25jFU4LfzV1LIyevToLMNMI/f4kHEyXC
 rriypRrunD9bVs9UdxQ==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967b6a2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zo1y7j5tH0XFdPBYKCAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NHsl3f0W6yiiDcddSb0sQ5V61U8n470z
X-Proofpoint-GUID: NHsl3f0W6yiiDcddSb0sQ5V61U8n470z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140130

Simplify error handling by removing two mutex_unlock() calls with
scoped_guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..bbe1cf712965 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			 * The lock makes sure that either gpio-probe has completed
 			 * or the gpio driver hasn't probed yet.
 			 */
-			mutex_lock(&bank->deferred_lock);
-			if (!gpio || !gpio->direction_output) {
-				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
-								arg);
-				mutex_unlock(&bank->deferred_lock);
-				if (rc)
-					return rc;
-
-				break;
+			scoped_guard(mutex, &bank->deferred_lock) {
+				if (!gpio || !gpio->direction_output) {
+					rc = rockchip_pinconf_defer_pin(bank,
+									pin - bank->pin_base,
+									param, arg);
+					if (rc)
+						return rc;
+					break;
+				}
 			}
-			mutex_unlock(&bank->deferred_lock);
 		}
 
 		switch (param) {

-- 
2.51.0


