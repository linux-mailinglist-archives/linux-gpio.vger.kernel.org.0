Return-Path: <linux-gpio+bounces-23408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ECDB08EDC
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 16:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7FEA563460
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 14:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141352F6FB5;
	Thu, 17 Jul 2025 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U556DEdu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F22F6F9B
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752761408; cv=none; b=OBCAYXqq8896gDj0mSOqa4cwwW5Edq3lBXkD1tMdkGO77WnZQCtML8Yby4fAQQxGeG7S17Snd/UAWBeeRMRpTHuB6Gd+xX5oDXfW4aE9UDTb0nsBsDznXfufs3DcAD403VbO9VxcZkN+XsIkS4rBALKdwJblfq2Eo2St/RaSshk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752761408; c=relaxed/simple;
	bh=Hn6xp41CG8R9jLKdMzrXoDdSoG3dKzhDMIecMB8nXho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alBfdVIymcecybysWywdBmMgIuatP4ep8oIhiZqi41ulS/ah8M7rGwvVURhJbAEhn5OJfvHNnz0y1eMqeaMjtegn1f3bSpyd1/nKcFPOlNlYQCGEzq8gPxsHP2ARH3NB96BxbadB/3A+hNrCGduA/2UbniRAPjHVdEfXd2xcll8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U556DEdu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HDAj4n021791
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 14:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Hn6xp41CG8R9jLKdMzrXoDdSoG3dKzhDMIe
	cMB8nXho=; b=U556DEdul47+c8LrFA0hHZ1/MRM688BpmpxOPkNNmF96rNa+tC8
	sHzehphmv8NB/cJftt9nF7yd/e98tRCL+1Vc5l0MvJIrviMYsiWQ5TpJ+7A8Inzs
	G5Z2oNGReaG81ypWgoTLWMsK/bUtRfJVVpqScJEwmQhk2/ft3QLWLWsGcDzgWNJg
	qaV9hPM40dx327RM1VKpzhG+RoPB3SzhDqNqNwUw7O5fWMSGAAowCgfaxIVAIhK7
	hArOGXPJmQj2oaK8hzABiyTwVaWryiknPWRHdHGqPiMCCVoIPoi9Qs9NM7zbPqKd
	I7KMCOSMgwcHbNi4Cj0H8oSEP60laMdhXqg==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8fsug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 14:10:06 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3e1618f03c9so10755235ab.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 07:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752761405; x=1753366205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hn6xp41CG8R9jLKdMzrXoDdSoG3dKzhDMIecMB8nXho=;
        b=Hxi+kBvbYJalZSgbNUn4qC+ygj8tPiEj7sVBbymMpKvFRSO8LOlGl1KM9FZODZYmC6
         bTPqNt1n4mpfsbTI/zVnMOblMGTqtgkkFh9iphL0MOr2qf2GVq1GZ0iHOy/pfb0z1D+G
         +LE2QHOmtnWcedP0+1Za0p9PNVcW0rPdxpnl4s0ZEC7MU+Pm/Ol78Ik+FexF8lOXYnua
         uGq22uwELohRa0PtSbu06ioNpYeMUp/webQbWbLIJ3yCBw9MJXVQxBy2Fi7+64nMCck8
         hLWncGQ11lpkwEs/wBk4vBwoJAgk280l15VNr90gVFHitYOBU/82SQ7N6llTuh0SCB+B
         O4zQ==
X-Gm-Message-State: AOJu0YybgrA0AFJa93uSDpP8YLBh0QyBUuLuOrNk4lQcmLuiGRyptE+E
	CBce3xUqbPoRVvKbrLAo7H/YNwQND2kKmh/XEMB7hUZVBIb80JlvKtc38NPSrxNMyZKXG2R56iR
	56EY3ki9HMjbLeif3jrY5LGs217O0gpxW6YRwuvHYGRFWaAl92D1bznml1YEJIq20
X-Gm-Gg: ASbGncvtI002uJfsf3oxk8phaSJ34pD+9TLhqMm3Tu0diOMOhw9Fy0ZRs3iOyXbhSf+
	pi6QktGQKGEj1YCqM/ug9oEmDClE6eodtP1pVfDOCZRIxvXed5/vKvTDSbK8UerX54i0C4JDJnI
	6jyWFbZenrS9xqY7C9MT7WrMLUybrfF+qgOKWCubxvk1FzXzLo6OGE1vCrzMTQFBg7adxoPIst8
	5yOCC+iL2gAc/yG5TiBQfh7QJE5evtCzCu8Q6fAPfOcwlH6Y3NjtCdtxpMOA7T/K0gfmC3RIeMt
	fMhXx90auhJX9766CgHtT28X5SslWpK+7Zrs3TJ1yWr3+f0O6BDUSELrspU3TW+irA==
X-Received: by 2002:a05:6e02:18c8:b0:3df:3ab2:cc7c with SMTP id e9e14a558f8ab-3e282e2ad3fmr59716235ab.13.1752761405249;
        Thu, 17 Jul 2025 07:10:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwHhw4sdYXg/rxc0xk2whzgzOEpVwWmRJcX6HXtNCTGUO9L3yjAp/57Q94d0ey9RuG/gR99Q==
X-Received: by 2002:a05:6e02:18c8:b0:3df:3ab2:cc7c with SMTP id e9e14a558f8ab-3e282e2ad3fmr59715725ab.13.1752761404826;
        Thu, 17 Jul 2025 07:10:04 -0700 (PDT)
Received: from HMOMMER.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90c4dsm1391452366b.19.2025.07.17.07.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:10:03 -0700 (PDT)
From: Harald Mommer <harald.mommer@oss.qualcomm.com>
To: Enrico Weigelt <info@metux.net>, Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] gpio: virtio: Fix config space reading.
Date: Thu, 17 Jul 2025 16:09:09 +0200
Message-ID: <20250717141000.41740-1-harald.mommer@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEyNCBTYWx0ZWRfX8UMAddcEHia4
 AkL+Q99Ek5+2evonPD02R3hme3KzXDPvOg5y9MiGOAr6fG0IQ/2d1WVSl2iJ642fgeVgruV2F6Q
 pjYBJ09WGucv1XulBCxX1PB6ppzULW8Phpo5UJOaChShaErJKjRyQU7StMKrSq5q+L2zu71vV7c
 0cvuzt/3HBLaMdJT5WLvb+TvFEdJLGAJ6nnBMFsp/46alks+qfOTwkSwrRGJcAjR3Wy1l1pVyxu
 Oj9GWOK8JW3U8MKToQDSAHckuKXAsJC2OhwgnUXiVYtC5l7mLKm86CF/ocfQ7aEQ0OElcMpR0JI
 UHYUCD1MBXArRqpw80LrlX6cbFIXD5ueusl+fQl7/D0g09FHcwDsd37KdFlyNvh9FRhBJtpQTjN
 XLHKbXyiDF1r8VwagtxttpDLiaynzjhHVQN82QjAvbC36V3Z/huA1stj1dkspuCzKfzDxar8
X-Proofpoint-ORIG-GUID: X25v4PjcZPYaBSMbYH4jOFj0G8E4IfRt
X-Proofpoint-GUID: X25v4PjcZPYaBSMbYH4jOFj0G8E4IfRt
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6879043e cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Wb1JkmetP80A:10 a=OcK3cvsEmbn26l3-tBAA:9 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=801 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170124

The Virtio GPIO Linux driver reads the configuration space in a way not
conformant with the virtio specification. The hypervisor we are using is
strict in what it accepts so the current behavior causes a problem.

Builds on top of gpio/for-next, tested on Linux v6.5.7.

