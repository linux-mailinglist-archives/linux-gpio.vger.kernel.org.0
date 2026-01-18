Return-Path: <linux-gpio+bounces-30707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4536CD398D5
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 19:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E44E93012795
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 18:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08289301037;
	Sun, 18 Jan 2026 18:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLHmcbh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZOGH5Z2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3C3002DF
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759826; cv=none; b=MOUGsTFtT0T4phHED14KS5hKlNRi5MWwwZY6dwBT5IegipJ0I/CBHIMQvuX+cTa1/WvusgSIPB/6LU5wk0ywgXRKMRpbtJaZXjrZHV7r0lUT8/C1cUjXDf33thWFzBqzwI5iAqPJN1xgFKSGHmdpnQtkPSlZJNfLlE0UBy5o1vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759826; c=relaxed/simple;
	bh=adtV57CgOwnY60Si6YEP4k65ve4WmCO5x4rzf1ZqeaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uH2zMBZKP05REPWt6R3bEF8unz/DFFibGm5vLXsYLKKjuK1ND5/qUwYkpvCZaULfCy6FuTs7w2KHz28r4D8kTNTUPB6h6Z14kuQo3ENHqSSq4dfecE5SYaSdhfJPnjZsvb2t9qSfP63XXCm8nfKNOpispHbAsCyfMtAMjP+b57Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLHmcbh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZOGH5Z2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IH2nF72873144
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=; b=FLHmcbh8VeT0Xx7u
	ocCWXxIuvjB9tBx5LxiCDtIBDccJU379nP+UmbRcoyBcr+3edNEdpueWK9J+M9dg
	On/6tG/zQrLm8kIshV6N+0lPrvBMlNib7FFNeOZ8S06q3klUrsezMEtoWQSE7x8a
	iEZVX+2oCVORqUTkeyErZZCtqx37t6TybdAYQxnbiueXwqeFCCkNWbDhB/sk9zJO
	wyGw/a/G1LG/16y68VMQZIcKCntDh2BsmDjLvW1Mt+2eHXhh9/2Fc79ypv3cnxJq
	yymNkMmzrvQoaprecP+D3OwcUzhJd+k9MUIKezJvfuCKhbJaAMB2BIcNG0+2rc9i
	yD93uQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3q9amwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b4058909so290628085a.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759818; x=1769364618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=QZOGH5Z2uP0IlEOwDzLWQb0+GAkA/MvEwJ10alBhCv9IWIl83kQpZJVlZoITq5/UGD
         I8alMcOMWB31mRb4C5WT3WEPlFZNmjYmQ6e8mLGYIs0qXgnlTZkCndy60SHLbSXM0hkm
         bPIAaQv0ZsChjoRL5xn26zh/iGD4OYa1c9N2tZbhRTBZ9rSVBt+6kgMU+zOSEM8zp5yg
         vuRAOBvkRTTeng8LLkmJY+M0Ad0dxUDBvCylEnB3H+niJLYjP74+TRZM05PntmG5cVKK
         L1OHuUnH9c9ld9N9I/T1QAcDQMH31pwewoy0ECwaPVz1qmP/PBW+7ywJhJkVKBQKnhpu
         j4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759818; x=1769364618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=ZOnAmzM+zUsNg4kXhfhW3f+E1tLKrrrqaxw3oJIZgDjQYeBzWhCrggke/z2lSgpOyY
         dn48xQymHcXPNGnsDGEtxehnHRtZYVrklpIQAS3O9FGEveqygCE/pCpX/zxE7CYYSOqW
         Gk8VL77o7gwl/uxyV/IoBKhBYKYwKpuakcBXN5eS6BdAC8SY9y+SBBea6LMwTc8uHPRw
         HESUAUGCH2GIG7LnLljh4ZJ1hve+oZ2HMQqvnKyD/7z5oZp/hjvCKbDA4P5JsCH9t2GJ
         Fs8SVGzTXnszAsygiZ41HodZtxL7xefe09LagHxmw59ZvIaxxjxIpTIzCU+ZY99W6Mk0
         TsNA==
X-Forwarded-Encrypted: i=1; AJvYcCX4kwlolzLJbLqrG/cpONRtSE80/3wKKVJ6FCQ2C7IoD/sH+UpJuIC9T4NI1H8daNAVAxx62TcnHHu1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr6+xwji7cPrasDw2/usPdTBQk415lxlAJNQEhgFATMGgBSjD7
	2HvpYkW5OaSkB9MFxyh9+m6xrmcpf0C2LxbOypcWI426VbbefDqRCGE7B6arQEqz98LLJ92D1Vi
	MNvx8yTAT+8pET8rD+EwZsp9DcPvqng8oLVLZkutljiJr/2Pk6BIpKNK3lUwqJ/9k
X-Gm-Gg: AY/fxX45ujvL4/79tWPylvgeEvszbH+GMxIi2ekIsVU2YGQ8bkeZs+9UFrXE3a+oLfZ
	GXV6ZN7Z2+ZWGALfrkFdixIN6YXJZQPk8cpQKNfq+4SFu0xWNyaWNEMgBTLvU1M9IsuQtO39oW8
	MsGmT5x7lavCljNwLpapJR0lRACpl86NYvJ3+3ARiEwmIyQEJwmayZe3LfNRUd9jRhJ1f3x7/Sw
	LlHfdES5tl5bsOg5NDyELgwuGXGCyFPyJx5LPKw45sLrBmbvBl41pubaEypsVeMFyndSaByuPTu
	uP/l2QQgqInPd2EKN+ZZnD9qaP6cX+at9sJI6DfaA5r+gl/KYY4J89KdhhZ16FfM3eoqHx0JoK+
	EpbbCHVRkuGChx2N+baQjkx1aVUz9rz0I8w==
X-Received: by 2002:a05:620a:4543:b0:8c5:af6:3efa with SMTP id af79cd13be357-8c6a67bcd01mr1262133185a.86.1768759818331;
        Sun, 18 Jan 2026 10:10:18 -0800 (PST)
X-Received: by 2002:a05:620a:4543:b0:8c5:af6:3efa with SMTP id af79cd13be357-8c6a67bcd01mr1262128485a.86.1768759817837;
        Sun, 18 Jan 2026 10:10:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:30 +0100
Subject: [PATCH v2 07/11] pinctrl: tb10x: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-7-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=adtV57CgOwnY60Si6YEP4k65ve4WmCO5x4rzf1ZqeaM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH0P3baB5JzE0xj4EquivvpaBBrqdpm6amOt
 juDbwiBC2KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9AAKCRDBN2bmhouD
 18o1EACUQyCgNzHZcDtTGGjP0XngZqctytCl/BhtXdiN2scGWH47PeJ1EbokGmcu35oOMeMoF/P
 Ai/yJjffW+dvyctYiUkUjdX8qhiC2jEMnBnR8HZEw07kz1ropOT3VtM9UNzcOP4VVa6XiU986gx
 +A9IxfYMZgbHYem1kw5uWedXNzll31yR6NXl+qm3YmcapiaWrXfhMQr5W3+Y014NvLqFh0h0nY+
 VxNPqKS0K7Oc6imDFiXRU50DUa2PRBddUY72TCkg8IbNE9LNnC+IouRZfrpjgzU+o1sRF5zlhhE
 I42rY1W2TwyfNm25FScOIOwekUr/tt7XHK3Q3KNa7vNG+uurb06yeOS0NW5zEIh+fH0e0tevRbL
 5txnHIVmMgsVP9qzzc3Br1lDZbc52FUcLV7vvC9rMpyHoyONur5eBHMB2UKz3Xqa2NBtZPpWsFo
 wo5+VFlpkkdh5y2iBoS1iDvXQLvtiqBpaHj6Suu/4MiSLX+PkV0aId7KrTqfcC2PmJjOYVi5Q9Z
 vShD+pW5GDt3E9qbXvJRxs0a8bvIwVXqG8pg4P9bsL9v+rGt5VbCvR6FyNIf67jL9QRcUvEn4Px
 54ALdRQJBLaZ4OkpCq7oTGr0tO4yjqNJDKYKdrn03h/zNzPbiXClpfTtiL9qzncdjmoS9IgEOV/
 vTudhlAhqE6ovOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX6/D7godDirxm
 gA1Z66hRSgnVJHhs5Ik9pigueaQ6CH7iWhstIM1Lrha8Q65ukauM7mcMgQCcUWAeZuduJtyzI8m
 r/7qzR382m3Cf6A9tJEXaLfaXNcwyRhNSs84girhoWNzrlTynC/5jpcLGBaEcXLCChehvHULOlp
 5HhdiUPjuBtpwPKtbrj7qltaqzlByhi+Jx9l7NyisySD21K55ElxL7UJIANjznTQIgm0uvX/YEi
 VWq8Oi/WMZYIV7NX5Fn0lkhDHx1HTXyDpiaelW/8kXCR8buk6QtMV1PWj9mQ/00zCnyk+ixsWv+
 QXw4xoGOiZ9/TEJBT6dXag7ncwYC8BsQeA9rW1a1MSU5a5iWnQXjNdWMuuejfpE+n2XpC+irDRh
 DEyJGRIJ5ypiksNAHg3dHWJhwodXwiAiITcuXQv5+4TazdqCiCvjsscMt4pTadV+S2guenOSlrO
 Tj2eHb3u6vMxARkSnFg==
X-Proofpoint-ORIG-GUID: Uqy9pk2A4c_4ycjvOc20ZGHDb7dRwiIe
X-Proofpoint-GUID: Uqy9pk2A4c_4ycjvOc20ZGHDb7dRwiIe
X-Authority-Analysis: v=2.4 cv=dPurWeZb c=1 sm=1 tr=0 ts=696d220b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fB2tTgKqvhDdEbG57mcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159

Simplify error handling (less code in error case) over locks with
guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-tb10x.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 129fa51d13b1..3f581404a9b9 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -607,7 +607,7 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	int muxmode = -1;
 	int i;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Figure out to which port the requested GPIO belongs and how to
@@ -642,7 +642,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 					 * Error: The requested pin is already
 					 * used for something else.
 					 */
-					mutex_unlock(&state->mutex);
 					return -EBUSY;
 				}
 				break;
@@ -667,8 +666,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	if (muxport >= 0)
 		tb10x_pinctrl_set_config(state, muxport, muxmode);
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 
@@ -695,34 +692,28 @@ static int tb10x_pctl_set_mux(struct pinctrl_dev *pctl,
 	if (grp->port < 0)
 		return 0;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested functions.
 	 */
 	if (state->ports[grp->port].count
-			&& (state->ports[grp->port].mode != grp->mode)) {
-		mutex_unlock(&state->mutex);
+			&& (state->ports[grp->port].mode != grp->mode))
 		return -EBUSY;
-	}
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested GPIOs.
 	 */
 	for (i = 0; i < grp->pincnt; i++)
-		if (test_bit(grp->pins[i], state->gpios)) {
-			mutex_unlock(&state->mutex);
+		if (test_bit(grp->pins[i], state->gpios))
 			return -EBUSY;
-		}
 
 	tb10x_pinctrl_set_config(state, grp->port, grp->mode);
 
 	state->ports[grp->port].count++;
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 

-- 
2.51.0


