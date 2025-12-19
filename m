Return-Path: <linux-gpio+bounces-29752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28670CCF57C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 11:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC2AF301C0B1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 10:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74F93074BA;
	Fri, 19 Dec 2025 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMheFPC7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/0B8s0z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261152FF66B
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139123; cv=none; b=Gm0hJ9LxXn6QnihWkZUQpxSBDeZG1ves7eZ6CJW9aluSRZBLXz0iUKO+itVp3EbSY+79QcE4qjDvclh106eMq63Exobg/gFl1CozFt8QyIxLihpz4BhM3PLLYC2P7LSMtm3nXuW5Z/1jS9HiW+kZC740yutti3WmpjlXeVcmG3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139123; c=relaxed/simple;
	bh=Qe1g6vLAqNtu7EEUBKJshU91y2FQGa2X/OwnQVn2wOM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n5fOxK2M3Sic6AQ+f1osg36vC5MjLI0vDGdhQ+NdT+mxKX4GKLqyDZpMtjwp8R3y7RAToaD9M7Usp9N0dyCHmGaQgmPlwO0k712itp2i+gKnLoPYcbLzHSXDCj4Ly7xwYYNtV4Z/HPl11Mv2C95gaZm29RTunY+A3A6rcG+jpWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMheFPC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/0B8s0z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c2JZ091068
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K0JIeF4k33yI3s7+w9je79
	opOs88ZXUfAhVsYJKG2Bs=; b=HMheFPC7ELF2bkYkX4Xae+GU2O8Z3G7geqAIAd
	q9zPbeCEBbJAU6rhixZDYKR/1BTLvK9pbXhckUlZvqO4yn5yJ46jBQz+c811k6xx
	YslPFRLtjhMjElfGfClz/GorGQBEZza644n2wMe+izoGX4jOIgQC1NSfbR9Iexex
	GhY5srjIRGQVuzs2Bm9c1XOTpw72IhOklLIrdqzmnaq7TOKWGbTF8UHfivSLTlwi
	VF3J94Ku6gHOiBnS1v8b8es6Ui72M5fWjLSPn64mNzryt08xrbKsYrPW5y3/L5hg
	cxgavzAR2a+3e5+x9WPEBIckCF7dQvieODW0jGUe2c4oxozQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ea8cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:12:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a5dba954so26816951cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 02:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766139120; x=1766743920; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K0JIeF4k33yI3s7+w9je79opOs88ZXUfAhVsYJKG2Bs=;
        b=P/0B8s0zzOOQAjsC+7mRZjQonfmHEO5Fz3H7aRY58WroeHuqRQYReX4ab8rrCA1gX8
         SK/8kpdhJq5FaCDl7HRdWtSgx+srYY2aLyCrZBYKzGe+EYL5HBLO6Zo19ngmQ0K3ejOX
         OprqN+gjNA55yoWb9dxTwdI38Y+fSzfEEIsIXK0pzeVaDoSaWFA7coTUFMmPSjIVlkgq
         EKWFBwzBlNI1YEdIRoqc0JmU57qow0ADgxLo5gaxNZxVbjwhjo6h+XyX0ye8TMcM91de
         wd32GjA+M4TGfSKQMY3JenDOsR0U6hXzK0kNquwCE/5uD1onRd5FOF3GIHVT/iqY2rQD
         ErrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139120; x=1766743920;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0JIeF4k33yI3s7+w9je79opOs88ZXUfAhVsYJKG2Bs=;
        b=fM8FgIjFuDFs3kw5xlz//aqWR1zsLQIot9B/cB7C197HrzPU2HiHOf46wKkUq+OOdP
         5rd7WM9A2CebI518lUEYSsCNubVku57ygdE8JN2Tm/Nz32Ah5+dvFP5pRFZ/d0yE+Z7k
         +2IT2GZVbVEkWhoYrKiZzvaGgVVcAXL+xa/5F/9J6u7lf4egwXIWdoB/OmS97xUnkWr9
         nj5PiPq2s2bErnOEnj4HrprYDywBrRHAoRLKZ+H92x4JnlXbqWX6zziBB1hEPOYHb7De
         umUSEwxjPIf4/tOpGaysH3skcCg9KjdmzxU0Yqw6jj5Ujsz1Weh0Ussm9Z2WZ9Str45D
         5uuQ==
X-Gm-Message-State: AOJu0YzCYhp9mHFF+8iTQUHPFFNDcY4goFZo3c4Oiwg0EenB7RwKosAo
	Ad9X9l8v5E2wUYMySAGzKAhJopfiy1QQ0BZaLvdpsuFxlwV40dpWNQ1QGy8MNC4dT58PW99LkWm
	9pmRdrbx3m4v6qkbZ8D+azpDm5+lCpbNkqGBY7dQmRJosNn/yNi5wUNSVE3yi7f1T
X-Gm-Gg: AY/fxX5y7kt5X/7U0Bbix/D0ZAVlzwAEcMbuiXSf8fnxeRGh4A91YRtoIAxGNd1R5pX
	9NI+lPJpDp5+gwHRN6c93iHm1gHObJ5x6XW9406zBjAcwtMcXSxpONTeEFGpXmBHcjj8huLkcan
	iTSTzrKHyYYrCWdv73VEzUDGXSZf6CWFtFr9ALKb/GR44w0FH8K297mlxQ03C3n31afo/j6r1JU
	CHiUYkKMmhfmixsaCw1CKAOKFLi6ZM9CHBFKZkNJXfCuObooNqt2yg9+PLB82fM8+f+5Hp5zUug
	LAij2tnjQTE6BWH8ggfX4J8dcDYZiHbPMakoYzDIB7spdsjEWL3R8KrqYTdRq1F0HjrLJ8C46Nm
	gCfRV+wxMXm1n3UAmxjZr1jHh2zimGKsyIiXTHD/ePqk5yI/RzbmPEZGswFPxRkKkcZaJ
X-Received: by 2002:ac8:57c1:0:b0:4ed:142:ed5d with SMTP id d75a77b69052e-4f4abd79a7bmr28425091cf.50.1766139120242;
        Fri, 19 Dec 2025 02:12:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQU4yzy9rycPchG6dBt6pBK+cvMRNb2Vm1Cb+gznhIXBG26wgDUcba13nJs8Ny0xZdgBevhg==
X-Received: by 2002:ac8:57c1:0:b0:4ed:142:ed5d with SMTP id d75a77b69052e-4f4abd79a7bmr28424891cf.50.1766139119837;
        Fri, 19 Dec 2025 02:11:59 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm197282666b.29.2025.12.19.02.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:11:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] gpio: Simplify with of_device_get_match_data()
Date: Fri, 19 Dec 2025 11:11:49 +0100
Message-Id: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUkRWkC/3XMSwrCMBSF4a2UO/ZKkjYVHLkP6SDmeUGTkpSgl
 Ozd2LnD/8D5dig2ky1wHXbItlKhFHuI0wA6qOgtkukNggnJOZvRr5QwOXypTQcU40NM2hjH5hH
 6Z83W0fvw7kvvQGVL+XPwlf/Wf1LlyFAyfeFcKjZJe3tSVDmdU/awtNa+2GntRasAAAA=
X-Change-ID: 20251106-gpio-of-match-23b24cddf063
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qe1g6vLAqNtu7EEUBKJshU91y2FQGa2X/OwnQVn2wOM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRSTonfljpnWP6hKoodhrhaSuKLZHgGp/wZolS
 iMrHOuyizSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUk6AAKCRDBN2bmhouD
 113/D/98lfgktoyZkbyuDmhOQeJP3DbNTJM+fle2plZVHI5+Ak7Jt44MnYcfk5eZJR2diRg6BCU
 VjDf0E34stmkgnAfAiE+KGjTCMum4uo0E+7qi3MD54G3tM8LwRAadJkJLxUz1ytiWMqY3ylxiQI
 0bA66UE72MQAfew4h0k9wiCWudRlU4noYnF4t1nsIixYx04vmc7eeAK9roTbvOxu9MqEyeBN6V1
 PiDJ3YrUA6C3a3A80vhJyzEERpAmXrYS+6nmJ12F6cXQbrJwyG1g1gxBnAd/GYI4glQsJP1PBrY
 WwytvmF2SDHf2N/tpGQQzRSvEf0UNNOHaQ3bsyxY52ah8NuLTmqPIQcMX+wV+e/JTPii8vwVdnk
 +rp1LqIrgk499zT5Zn9jlR4ecz1nmQaoWsa5fMDPYfB2FWcCplhDHYZGIyVBVBJTuXZGLapApL7
 5r890r+N41BQQkMRwmEPfQaqbae6PkNC9MlOx644o8d681A06Rh7e385j/ouQQcK/SRNxkIDMo4
 Ngr9Sa/lqpMnpzKfdTQ8hVJO3i57S/rkJXx81olk2vnkdIIpfB4LWuJF8yTsKgYThPPLmd+4O1U
 qcBV1fnKQntNrfzhIVzptEd368c6tOISvliw/Pt2LsBmdCrLM8o+HtDzpKkfX7LdHHOqxjvdWzY
 LXMWBKFUMqQdXCg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NCBTYWx0ZWRfXzz7ZoEXqmd8B
 GnV+RM77nlE5YH9epTIyMtVL2QaVuFDDbKdvb+RwNWbp1dJUKIb/iCaAtLrdJKjVWsefVoTNZXk
 PsiKF0ao6YtdSeimlBT8X05ctQMZTitrL2T9KXdo/jrL43e7x84kEJ9WYXU9BXfwgFpFxD0pKeQ
 UxlNbAY90xtfGIJsFfSAe2+wx2fPNjgqhmbe9OmtJWVMR6m6b82ifvxk8KSA8aZ9BmyLm7Z+iV4
 xAgw7ePVzjxXMLurVR7WYgNXa3ByXyNRd7g4V0E3Ra9T7vSlYBDwA21U/RdcJbw9ETvH5taRb9/
 /x8WO4hmZnpVItbUTNSE+z8AUVVqvJMiuaOiSENHkfyBh5dXnBhNPBMmtwm3d5X1EZd/3u8ICwD
 5u7muQ3r2Gl7OEqg6xzDoXGEZUJkuU5ybAAuMf1dlrjT9iLOnHBFlHoK19Z6gUCrJ30yB7Q9XWw
 jDTtLiRk0N+n+KdZ/OQ==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=694524f0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Gv4_7YmOpO5FjsplTRIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bAXKLbFdN3b_o6Ik76b5oWt7ACO27KPC
X-Proofpoint-GUID: bAXKLbFdN3b_o6Ik76b5oWt7ACO27KPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190084

Changes in v2:
- Drop applied patch
- Use device_get_match_data() as suggested by Bartosz
- Link to v1: https://patch.msgid.link/20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org

Few simple cleanups, not tested on the hardware.

Care has to be taken when converting of_match_data() into
of_device_get_match_data(), because first can check arbitrary
device_node and the latter checks device's node.  Cases here should be
safe because of_match_data() uses 'pdev->dev.of_node'.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      gpio: aspeed: Simplify with of_device_get_match_data()
      gpio: creg-snps: Simplify with of_device_get_match_data()
      gpio: zynq: Simplify with of_device_get_match_data()

 drivers/gpio/gpio-aspeed.c    | 7 ++-----
 drivers/gpio/gpio-creg-snps.c | 4 +---
 drivers/gpio/gpio-zynq.c      | 8 +++-----
 3 files changed, 6 insertions(+), 13 deletions(-)
---
base-commit: 26ac2c4153a2c543a4ef3dee421b46bedb0f8f0f
change-id: 20251106-gpio-of-match-23b24cddf063

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


