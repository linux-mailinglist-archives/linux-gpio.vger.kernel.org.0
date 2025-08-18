Return-Path: <linux-gpio+bounces-24472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EABB29897
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 06:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 633113A9693
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 04:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0283A1D9A5D;
	Mon, 18 Aug 2025 04:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOYTTFc/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E451E8333
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 04:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755492101; cv=none; b=FG4iB9CiX7qjPzJEjNHAs7tVYo27wKqLf5MqKdjfgh0i3kCDy/q/uFAfyESE9UM7uBV6JJphqQRDQlTfjCA2dGIBHmbdlhenX82exszeEG0VlILzI+lxZOAGg5qgmK3ebLd8JyJu8K+O7prrfaSCTWFClyD89bRw+GEvRD4nW9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755492101; c=relaxed/simple;
	bh=uDnTCUlVtYUEnhAsmvmthDUWGvkn8yZ73+H3knBCChU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bXlGy9V3/qIbn30GkgxuEK/rQudhd+LEqKxrCwQWOSpP1QJu6lH6ESn9rZJUAv1T/nepIV/iN/PNuyRpF3Gy8plKvvVvnr00//025zkho6G+pHSPd46RWXkqhKjnRG709kAhVi1678g6vz92qKUtb9do+10i7yMvoltAdCwJrh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOYTTFc/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HBkQI6031796
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 04:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o7I5IvyDpDsrud1uxxC1FO
	tgxPWQpfNuEtfugWVnsak=; b=UOYTTFc/erC4fPfz8RAalVneWLd/EESS33toDB
	PwesgbCjJ+s1P6mFrJb19zLedA5k4WoiFJSaqY3ZAfKBk+ZkDABVmZNQYu1QxeSG
	sQ85p0v2Kix9UzlRs1MRjTTlsgwsUkHntLZ1QYwya2PJOi9ui/1AFr2+m0LVZsKp
	ydqYbKlzAeW4xdkZS8q5Pjg2aN4XryCzzgD/CzW2j4alxg4sD2vv9W5s7eSMRvVC
	xlBdu9BTQVeaLaz5yySVdUbHN0hxuMY4cx77EnTdrAvqzgVZe9VwffnhUglBJtsn
	8NjaIDkIB3Nqwx1UX+6JChHmqPQsdIyWeU4ykEN9LisD06Ww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfbnbfsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 04:41:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445803f0cfso37759965ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 17 Aug 2025 21:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755492098; x=1756096898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7I5IvyDpDsrud1uxxC1FOtgxPWQpfNuEtfugWVnsak=;
        b=ilsV/aHXWXQ59pRICwT9GWcCbEjKM1Q0FVWt7tih/GXdqk06zEwbBM+2ZjXHE8S/b0
         XUqRv81Maaj6V4uhk5qV8kLMH7erbQYwuPCSWZ5DhyRZLsVyGOfegh6fDAqhtjkQG3A+
         v3bnjhuTiD/BZLauRxJjepICSzXHpGj1mzrucUSfO/amaU+Mvow7uRdqddHKfrsvxWiP
         O6QIUsE1KBKVJwCm0DpQnrrfQDalP4xhGo1ICH9CC7M19xzBJ9VPDfjFc8Z9ebxI5Xev
         PiJ0+7iEQh10j7CRHbU15qtrNaWRqswW1Fx/tQkit3/GwQo6VlE23yNUdKNs42RbDHxc
         XPlw==
X-Gm-Message-State: AOJu0YyTimcneyXw59f5ahhtCj+KAPiXHosg3L5qq4NiujOdmzhVK45G
	LwJQn+hqZXetvQ1eHrfKUrPvic1j/mBqDn6V+YNTdJmyrhpUhe49i3/qKDCWoeF8HU6R792gTcL
	4xdv1T9CikYo5J3mtWEPBc/nmQVZvFRtwxv8bcM75pJOLjZLxgblR6Idtzf8eI8Zh
X-Gm-Gg: ASbGncvGhSYy3c4WQR3u+8Sio1+jNzo4PgLpjKPjhCdfCBt8iQIwrVD4vvb0QIUcsQ7
	MkVEPdo/vkwXZREz/50imRmJ6ABH63jqVyMFzxxjPHSD6pZ4OfCRG72ia4b1iO8/o+oKiCnBbBu
	MjiSGGavXgTaqxcqt0zmfTBobnUZkXvmB+9XjU+beBK9jc8Kl2Qq1gwcGn4VrzmWnkkndpvjXIh
	ZEO7LxF5LlL7dNUao5DLZ5u1qolev2irKztMVYMMhFhq1o7J7/KBtV9BpU+uKI3mmLFb9TpzkDR
	rI9OKdJl0xMVdaC8K30kx/oy4bL7d691RPT5Bm5P7q8naDs+amAtxixIu1eVwUJO4Qqq4mrloiR
	nYJRJ2DLOq3E1iPJxLupl02KiW+rJR8TCJnCKQbqGld3NUZH1YQZK4ny2
X-Received: by 2002:a17:903:2288:b0:240:50ef:2ed8 with SMTP id d9443c01a7336-2446d756f99mr124189065ad.21.1755492098144;
        Sun, 17 Aug 2025 21:41:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgpeqD4kU2YgdCDwpl0WnaZOy8L39AQdgkY4anazhYf3iTsVeZyOcpkw9FZe+ue2OHfVzGWA==
X-Received: by 2002:a17:903:2288:b0:240:50ef:2ed8 with SMTP id d9443c01a7336-2446d756f99mr124188845ad.21.1755492097690;
        Sun, 17 Aug 2025 21:41:37 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53ba5fsm67547155ad.113.2025.08.17.21.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:41:37 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Subject: [PATCH 0/2] Modularize SX150X GPIO expander
Date: Mon, 18 Aug 2025 12:41:22 +0800
Message-Id: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPOuomgC/x3NQQrCMBBG4auUWTuQKYQWryIuQvOnDmgSJijB0
 rsbXH6b9w5qMEWj63SQ4aNNSx6Qy0TbI+QdrHGYZjd7t8rKrxLfz2D6Bbcu3nXeqxZGryFHGG9
 IS4ouLF6ERqUakvb/4XY/zx8W8Q5GcQAAAA==
X-Change-ID: 20250818-modularize-sx150x-gpio-expander-cef7fd0a7511
To: Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755492094; l=653;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=uDnTCUlVtYUEnhAsmvmthDUWGvkn8yZ73+H3knBCChU=;
 b=jTwENWg0yo/FzfRh8Zq338WcnEPGHT7GBuPKLFuCbN8N5GU0P4PIlg8/A8qeEl4WfIzqif4Fn
 CiriMa59r6LC/Zhw+QRK78H2UqOPYMaH/Zx3qxA26aS9ASWcv4BjKHq
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfX3IzO6hsvF/bn
 +VsylPCMcK+ryB4W7G0HWTQ8x72A4LAltHN86CoWOK1zh0YmOq/MlUxoOEFanRU8MzKfRA9iPmC
 hyyLmHFGt9c7ijirHeqL5O9Bi3/fWRLdU3un0XM1wBj1Hw1XU5MLovfNu96e316abke7hmBgRrq
 D5tvsRwgOn9yNHWiOswTB1lUjzg7lRTBITIMsJZrbMOv0GXzq8nFSShWGBfjl9x/S500b/v9IVO
 5bf9bCaKwfFjXC7/HjRy2bqRDXpDjRn5jgMoiDTX3c/tkh9IKnvPBf4cm/GsjewEEy9KOGx06y3
 aC+OF5viY6C99KcIyH6ZM6pzILoZqY55nHxkUFwg3knBj7yNEo+plgUVn98Gz0Ohfo60oOBraIN
 Kl2ijDTT
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=68a2af03 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=li5FUaLgavnFvxL7-nUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jnxd5dwudXIowxX3dBnpNyFQs6peHwcV
X-Proofpoint-ORIG-GUID: jnxd5dwudXIowxX3dBnpNyFQs6peHwcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160001

The ANX7625 relies on SX150X-controlled GPIOs for reset and HPD for
the QCS615 Ride board

Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
Fange Zhang (2):
      pinctrl: sx150x: Make the driver tristate
      arm64: defconfig: Modularize SX150X GPIO expander

 arch/arm64/configs/defconfig     | 1 +
 drivers/pinctrl/Kconfig          | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
change-id: 20250818-modularize-sx150x-gpio-expander-cef7fd0a7511

Best regards,
-- 
Fange Zhang <fange.zhang@oss.qualcomm.com>


