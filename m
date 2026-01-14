Return-Path: <linux-gpio+bounces-30560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2641CD1FC06
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FE27300C35B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D310139E186;
	Wed, 14 Jan 2026 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9guE2VH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRYHo8YB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC739E192
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404631; cv=none; b=IPhLK6f8WZIi18fyBarbrzpOGnqiBs4o3gaG+nTCC3NVRWF7WlmwMCGPbFXBOnZ1N/zoZ4pPfCPMz1BNjn7lF7APrQpP3kx3ymVvUs7OHdXEhxBFxpo6rmpAL24w2w3BNOeID+FklJm8veRM+gd1P60uuGvSr5ZzXDBqipHpbwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404631; c=relaxed/simple;
	bh=4PObio8XO1Yv8S6gHkX3VQh/PJ6tCJixfC8ij3DGRyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLKs9o5QTNj5DvBZdokDifooMuhwXxBh7gvppwGbvGSN/fyXbTYfLXLy8wobnyF9sdkKeP+LWs7ibTufrZKMvxozm6thYi3Ot3rVeN5t+azEsQC0fhFQdHhWKPpeUy7p7JgFXUD9Ovn9gKtzb92TT6aTsk3r/egg+QDP7lf5hyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9guE2VH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRYHo8YB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EEHuvF147879
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=; b=m9guE2VH4qUM/cRJ
	F9CSne1yWYFXLejgSGprT79ctgmVOvU0Un8d+0E8aaesqKyWhy39p/Y5Nk+zgulz
	Nj6F97jEeXMdB7O/77IKakV+NC9vzbhiwyv0+JxNix0O24cIR3nPDmsy2ToeuooL
	eg5rtcsqs5cHJVQRQsNOMX2C29hm+J9lhkLUgwwKjku/sN51CRNUJXXhiP0Sqfoy
	ypK0q0R2Lu2+oyU+x76U7mJA9dHP9si/D0jfLUBBlngAHXOWYjQdmWkUXTJ/Cuy6
	hpIlMQ2m9ih2/r4ADu+T3z57erTicOBqKkLRdQ9hDxgyp6sNsVw+p5Or6YsQ+5tK
	PtqQ8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp6rahpfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b19a112b75so2181698585a.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404627; x=1769009427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=;
        b=GRYHo8YB8tZir6lr8zk+U4hHlGXYDV89KkHKo2f6BP63Z52VcWcUrrzkecGUlfDswQ
         VoHEZjfKWWGYgKhnh+E/yBz6cgOIr1r75nuaQuSfwTKq/wZPbMSo12LBUhSmlp56F8Es
         qLIRHXrn2tvFKYhQh0G/LwA//cH8IX+aaZ6MqlUALHidAlvB4HuZXZyojprHufsy9zyS
         f5EPmNhazBl1HdgQWGQRdeylC2yWsvtn9e+Hz3PkSqmHBgD6JOyrLkFu8SbiYNhoeoKP
         qeSZHerjBfzvnpJfVbLL+A4WZ0JxK4LLKMI7ULBvnBiiQANsNaBa+cvdgSCCtX04Scls
         obbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404627; x=1769009427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=;
        b=n2TJr2NWAsUAvnoAQCTOARtkzZwHJDyIpbEAHEKkCj3iy47w6HkCLpuz2eAxCF/UhS
         KL0syi1ZNzq6SFxQKjPhPg/fHasd8CPnb3yKIIHyNgPWpgQzTFi1AlwORwD2XNen0Omg
         Z6mXJFIfl/kbHD/IfWK2a7vOQntN7etqsAGtQpiYYO6vko2vQ6PCHJN3qPxE0mgv/15Y
         caViwQYpH5wHzf6t6A9vNWe3pwVy/IunYGqovXpUI8EK7iwfsnuAbjJdVXyAwrZfZ4Fc
         pZ2k82SgCDtXfjm5+V803mvLOSh8hJzPT5F38BBfs7fK+2L4ZtG6oRryNMQmDqw5hIds
         kT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyA3oaTsgCwScJDRVBOfr4WfF+cql8DR5eWUpJISJFyoGIi1yq9HNvzkTD0dXP3AoCdND49ScowfeE@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5iLuZepcwdgTmr6Z7+dmVGBu7XqMFRjqxkQ7xkKT46f+vVjM
	SWsXJo42lqG1Anh8SN5n/2DfoNdrZnK+On0IdhqYziYUEekEyfqTezfG4gZY/kO+29GaGXeFz9t
	4uATsnxL8VQNyqD/FHYZYpL/OqFZghIl9R4omhpSZnYgNfzlF/rlSH/tTuzyJUsyb
X-Gm-Gg: AY/fxX5zULcZo/IwDljaQCL97SJWJKUKra4JZlFAa4DWAY83UZiSvJE20HEDldWH2Yd
	t6bFXfqVsEaaPjqukCUMvaZvb0sLzUKcYM4WmR9LfKSAU/m9e6fkoVW+bRL3EMMinvuUft+e939
	6kLSWQpyrj/pqkkV6k9FJ2F76wRY8bdtXf4Gx/Zy1hnMGx1dNeXChU9LmndQ+Nb5Eajvq+pcBBQ
	MZaR+4fPBWP1J39wiVyp5Gs3BhLL1iSeIPZCua/0xacxPYh/KbJvjT8gx8CEKPXzsFNG1d3ugzB
	7l2ojEvdQa3dNRpSRlJ0M2cR5C0hY6huVoeLZINuDj6LlTkGo7pof60UTlWI3wjupDgp/f+NAgw
	i4QixlG2tQJG6dKSwgziBEF5DCsUIQOVrYQ==
X-Received: by 2002:a05:620a:178a:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8c531817444mr270059985a.78.1768404626549;
        Wed, 14 Jan 2026 07:30:26 -0800 (PST)
X-Received: by 2002:a05:620a:178a:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8c531817444mr270052985a.78.1768404625897;
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:04 +0100
Subject: [PATCH 03/11] pinctrl: sophgo: Cleanup header includes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4PObio8XO1Yv8S6gHkX3VQh/PJ6tCJixfC8ij3DGRyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aCHz5EDoUoqxZYrNILSL7sGe0v1k0RWIrht
 2xoRozKYP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2ggAKCRDBN2bmhouD
 1w/tD/4gze1JdYhn1yRw9z1Dt7upNwMEXwviunBaUWTiyScupfZYrZZ+mi8XAQ3h7sV+pqVxDTa
 PlkvxnU6zlG9dkymlIE0QgQwLo9fLEkTv385MPjlesnC9lrc/f4FDfX+4dPN/oXA39A4biQkB+c
 +amG/ZurwftY7LyIH7q30PDuDYI4vF65nRj/b1+hVgqxfAvp9gAvZSRqpQHvBejFn4Y/0jwRz9U
 a/edRO1L1nMLZLFNbB8+8W6lcAPnWlYV4bma5tTKPxGMBTZSNBHmnLG78ad7y2kuVLduxRIgZZL
 BGStla564Uwnso8MjSs87/BMaJR+GTfNwesX1/LRok3T6S4JdM6K1/KHCtI/jz/+gWrLYZokrkU
 ecfBDZj08Vkc/2LTaQ5kpQDxJdktYM9STLZFAlNercSl7aVzW8OmmGBOw+iLV3swzbnsI1tUfQf
 kFwmjYQ0S4oqnI7TBdpuzYuPOn9N71vc66VV3r2ngU9DZFiWSO1ZhGwyfvLqDUvvLW1+JElj8Db
 jdcFgyCm0Tzu8bpsTC+DfNskjK/kXhSqapyyboNwAEEnFX0NZ34wopWT0mmkUiYg36PGz5siF3w
 nIvRqmBVbenaq9nzL8bCWZLjfudHFcAUvDUbRkL6uD45begdv/TVys2yD0mRpm6Z8qUVqmIDry0
 uvlzYRfNG+QaVoQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX1+QYjQbjXT3d
 f2XWSe2LeCRaHCJjVrLvpa8nixUpK2tvfekGAP9jmIR2Bikpe6SbZJ0d4/4uzvEN60KletqfmJi
 P0rS9N+5qEe0eRlPfha8iLCPdAlNULtMn7u24GJ1M9ho8d7zt2qlCBz4++jkPIH3o1ovMc3S/oO
 +xWUrTqQeGhvVWI6SUuyYmUG0CFevSx/7UQWPGlxebJLJuLK8AeleUhuynjliJKVAK9nJcwEi3S
 9GCdfpl45AEcCxE06UpLmrONLdegsK9Apxm55GOg75fK79U/kPNEGzQtgC9ParryLE+QKrG5057
 zeeDbkjJdXujwuNxVmTJHM5H6cBuYSGPfvAMDJ5VbXtjXaKx8v9yhWTADAnaG1Lcb9YMWuzN0EQ
 R1lsAu6b1ONX3367XYam8yITJjFE3mFiNmzsUnKbzQiWHdNIpSLFCx6z+de8QQBwL00VBYxeKfG
 x7OgVnBM4VqgCJcuFPQ==
X-Proofpoint-GUID: rZc15VSbC3YDzaadUE8q77mxQjW-Prtc
X-Proofpoint-ORIG-GUID: rZc15VSbC3YDzaadUE8q77mxQjW-Prtc
X-Authority-Analysis: v=2.4 cv=L/EQguT8 c=1 sm=1 tr=0 ts=6967b693 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XMepgddcWT0EFqeyVMQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140129

Remove unused includes from internal headers, because they do not have
following: bit manipulations, mutexes, spinlocks and struct devices.
These headers are included by actual C files, which seem to have all
necessary includes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
 drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index 759c0e604acf..973ab9a38fcf 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -6,11 +6,7 @@
 #ifndef _PINCTRL_SOPHGO_CV18XX_H
 #define _PINCTRL_SOPHGO_CV18XX_H
 
-#include <linux/bits.h>
 #include <linux/bitfield.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
index d481973fcf97..1a2b00dde1fa 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
@@ -6,12 +6,6 @@
 #ifndef _PINCTRL_SOPHGO_SG2042_H
 #define _PINCTRL_SOPHGO_SG2042_H
 
-#include <linux/bits.h>
-#include <linux/bitfield.h>
-#include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 

-- 
2.51.0


