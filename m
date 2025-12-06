Return-Path: <linux-gpio+bounces-29326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4637ACAA5D0
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 12:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 376CC3056C5A
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 11:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794BC2EDD7E;
	Sat,  6 Dec 2025 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sq884JSS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krcskO5O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CC2882D3
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765022093; cv=none; b=kfieBKNxNrekGH4wR0Bo3mkkFUQ2RUf/pg9DehFoyEp+Eea2hu0gbegWo8Zti90xJbk9Lebx8heCgauvr+vUaNSrxqiZBvSWQIz56+Fc0JGOpyVna46qKjkRUdDvkpGmRY2WJbfplrizdoSinP1ZwNO/tjXkLKQ2ANO6xAdEL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765022093; c=relaxed/simple;
	bh=VVTbU2/dKOMjXoAYN3lqrHZtM/yHfOchcOh6hjJZWJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5iq3To6OEgrr9LJPj1sk/zEIiLPV08VVyhwsHscrghMmZ0fn+40odIXf2kSZbIMkCaQtcaMhLbt37myFtryAlMJn772m11MBIeUjGo9k33/3X9Bzlbky5hO2Uhm0pIRBZNpCKjik7iv6COww2oOebDRmfWFoMYHkNDS38gEed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sq884JSS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krcskO5O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B6AVtS03363574
	for <linux-gpio@vger.kernel.org>; Sat, 6 Dec 2025 11:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	my6o8tFWviNzCsYhrZ7kIra5fNR2z4ZFuE065YnIe/A=; b=Sq884JSS2p56JIkI
	ySPiDULuQeE3GujoBrjeYhgXZuvim6kerdWwS/g5kEkdWBGHcnZu0uFGMlY9Rrhf
	A11RHJi9dA6MXdYNdWjzgrVnlY9VdE32t16/C7s1WSc3GfBlkdXTCtv/WWARW17d
	sG1dgGm8jIU3JZwL1srLBmj+6NV4eDtLjf29t/3as/Zq98LBgHwEFLXXhipqAARO
	ew+LjQ/cLkUHSGlyETFdj78C3IHQMlJz07TSQ/FrFrBXImtm8VTYU1PugwZCKBE1
	jDGc0eNkJBDfbBzOITFJdiVLsEp+XbnYer3lwTWoWjh5sx11+9H89AzbXlZZlCY5
	nunmCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcv80mtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 11:54:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24a25cff5so645977885a.2
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765022090; x=1765626890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=my6o8tFWviNzCsYhrZ7kIra5fNR2z4ZFuE065YnIe/A=;
        b=krcskO5OdLxRN58jcc0eZnpuIXUICYqsD/iauMU3mwEOSw6rq3/DI6tctWFUjVaoeq
         B41QvoPgTqeeiH71t5N/sWROkkVnQ1UnegeJQ2mQmZWLLZ9Hl2Y56qoiXPfPJ5MJgx77
         w3i5Zeh2cEk4tplWIGwDdIJNEY+4NavEkDoGU+3co2lqTgziUmSoLxgbmsA5kcTeSqNg
         xKH9hUa8goo+wN3TiVlk4RsJZENeQwlvJsCoZIis2Wl0zbdIkT2f9h2o9an6JdwHNDYK
         SXEgJ6BxIfuV3yLBzjWSebgr1neQRVC6ceQQzqR70NHZQwhDlLI0QxedmirLWyAGppYX
         XZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765022090; x=1765626890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=my6o8tFWviNzCsYhrZ7kIra5fNR2z4ZFuE065YnIe/A=;
        b=vmdMubf4oeGEYJgNYx1TxtnrZA8NMZckw0EAX/2ttNgXq/sKAh7AeiDf86Jona2Va0
         3XpCuzfQZRElTcbkjqz/FViJUHRQQ/PrLHb8uwBppPEdcwyw7KRqhtBAW81CCOpc8Cmx
         1rtYcVxvag67J5GhSSTSrtdTo4abTv4JUYQxi8pH/gXd6fet9tA/b37d8X0itCYpJkHr
         NnVKo0Dsuc0ypICE780v0B+ZnC38AWe19kEC7P2E/BLlW5mFigtt/AkrmvislWIsEBJP
         5ArADjVx4RVlsD871LdtDjbiqtVdghnVLL7kkHLSPO1GqQqX+vGTs75xnjRXB8+iUGqB
         w5FA==
X-Forwarded-Encrypted: i=1; AJvYcCVF7UtvHlYbEaEbN/jbDFd9CHVc6e8m45bS64gWHTHpqwfsp5ve0uTbkkcMriY9WINLyUhpVTgjWDeB@vger.kernel.org
X-Gm-Message-State: AOJu0YwZSgD5rIJarTCVsjMcqboeqZOZyCvnWhtUQfKE1ZkGIJIBQkhv
	CVmZq+OZ5P47A59li6sIzLpKLdiJ98WADRZbIX0sFB4MHLcy54FCtuMe1B2kFOh6mTgsqa2HiN2
	qE1hL6uir60nDRUXcPVM0gnPhLNuFF7+TRbrXMeRpLvasFbfY4GhPQguhYIoPlnjcIzVBWAtNSK
	M=
X-Gm-Gg: ASbGnctUN/VXwN0iblHVcfYAghl/B7WJkLoAP263P//3ynjlIitgwprtf/ydK2h+GoA
	WtvjIQhhoMMPL0/B+W1810adogxawkTllfTG6sWqb0ZK4nNGIMtb6hE/qbejQizrLPbYesw7tyC
	C3/eOpLF+RwJR4/cHF5741rHcfJGgEnn3hN6DgZiZyguqlRURfWUnECLZpB4++U8wO1RYqBMFk3
	3IEXyflokNdawDTUx9o6FP9sojBNu0xtHrSgQ/WJTq8A3poC2aCKntA8MmF00E+zLINxqh6nzKK
	gxrEWBLUfeivgSIpNpqJ6F+HKJ45kgaDa2wehdRPH3FVHd/UycGDII1nVH4AenfiaU5x0eC4ydV
	/ky1Rmim4OdS7u649utdcsbqKdkLK4Vn2uYQx1uzgFSiLTiKZ+Zk=
X-Received: by 2002:a05:620a:25cb:b0:8a1:21a6:e054 with SMTP id af79cd13be357-8b6a23fc401mr240683485a.4.1765022089992;
        Sat, 06 Dec 2025 03:54:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF95adHo6eCNveLY76R241pMtfsAs9bVaJnGPnIV2dWAw3M1wpOsNFJAjwHVugWsrz+I4c79g==
X-Received: by 2002:a05:620a:25cb:b0:8a1:21a6:e054 with SMTP id af79cd13be357-8b6a23fc401mr240682185a.4.1765022089589;
        Sat, 06 Dec 2025 03:54:49 -0800 (PST)
Received: from [127.0.1.1] (75.13.23.93.rev.sfr.net. [93.23.13.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeb38sm14027048f8f.12.2025.12.06.03.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:54:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Sat, 06 Dec 2025 12:53:53 +0100
Subject: [PATCH 1/4] gpio: shared: fix NULL-pointer dereference in teardown
 path
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-gpio-shared-teardown-fixes-v1-1-35ac458cfce1@oss.qualcomm.com>
References: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
In-Reply-To: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VVTbU2/dKOMjXoAYN3lqrHZtM/yHfOchcOh6hjJZWJ4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpNBmEjkPbGvf73+QQQ5R4Tj/m1Tat0SmNArotD
 J9u/KH9pJmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaTQZhAAKCRAFnS7L/zaE
 w7AxD/9Sc2406YKevUMnKAdlcHwNa/yIBzEvm21YjDOOwF+VAji3u3ASfFnurRmLi4y9YiayLHX
 5kP1kMeCFKM7w/f+VHvySwid3VtnmqSC/+5FKEk2tirWmTr030jtspDLjfTNSooQwvg4TK1QZs3
 4nNHnSqfC0gjrX34Ko5qHNoWzH+R3wGeop/oWaDTVBumHXF4TV700H8D/npzE1eHU0OeJNlZB7L
 c3ClrrZJhbmy4YLKFwAY8f3J391CHFSbU3jbzFSSVmRJnELERpfBa/bwBPNdLklv9QNLO5qR2fM
 OGrZtn5np6iR4GDkXo9UAkFvPLcdZzbGyJGO9q1sK0Thw1UMYFh0TYvU/g2X252qh6JQqkW/Bh7
 xvCrhscNn+wkQCYDnrEP4dXLdn7kHMbSFYiOIaSuX2ZKzLYPRfA5JorMWH5TdQRXZG2lVz4Icfn
 VkzVkr2rtCjutOoPCcmFkqDPL6XGT8DtYPRVYqoWCT4f/5N85/tI/FZ2EK+BtzrMyqoQS+qjSnW
 SY7doAo5ZmgquO8AhUYvYHzxkHnXoWZtkBATpQDJjHoiUlWdyVRYF3LbNdnLS6uPGxo+UUpbmVB
 KJEQVTPhQ8nWB19urHaPF8JwMlmFMjbidFLTvtNKRTvUMnZ7B7xmgPlWY1fMq+FrrySUrJDr0Iu
 Kn4R8VGSVsscTHw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: O01rxLscyTiAPwZC1c2NCS9P7tPO4rYJ
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=6934198a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=OJCUNAs2RTwferbJ40Rlvg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5g9cdEO9-2RChXZdgEkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NiBTYWx0ZWRfX9rawKLz09Kzt
 zXGKRA/HQRVGY04kBwHRwwRyfczuVdzrIGowuY+Y1aoCiIadwVbrSDc8nOtAPrUJE67bP7A1kew
 dHAURvgQqhjJtf+QcTf0TXh4Ie8q78+CbHYH4P7OXH1uhtmJ2rm82gzw/SYAyjjYhXZbvrMbvvI
 701vJ9+88JAigbUVRS25f+9C9CoEZbiC0ng7iqJL9ftw7mr+R/x+Q71qjlaLaNn5ltWVp+faUPo
 EKH0529bggIO8KemeFnVvk9TZ7WX8H2zWUTlTR33x4os2YgrQvnv6pcC79KQPMQ7YWtmVBcT5qh
 usV56qMklslxp2VA4TKCsgmtrh6L/rQ8uROIkCF6Yb8T1n98b74vCknvgW9JJohtIokiQNQAq0B
 SysvuD74I/w8ofiJ+79fgDstCXdk9Q==
X-Proofpoint-GUID: O01rxLscyTiAPwZC1c2NCS9P7tPO4rYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060096

We need to actually store the address of the GPIO lookup table in the
reference struct before we try to free it or - worse - dereference its
members.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 5d15675d61ea52b21a8181ef9a93123774b8e7c3..17da15c1075f97f4ebed969b38197ac155141406 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -399,7 +399,8 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
 			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
 						       ref->con_id, lflags);
 
-			gpiod_add_lookup_table(no_free_ptr(lookup));
+			ref->lookup = no_free_ptr(lookup);
+			gpiod_add_lookup_table(ref->lookup);
 
 			return 0;
 		}

-- 
2.51.0


