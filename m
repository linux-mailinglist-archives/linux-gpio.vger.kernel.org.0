Return-Path: <linux-gpio+bounces-29786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA337CD5700
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 11:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9E473009F27
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 10:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769D730DD11;
	Mon, 22 Dec 2025 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ta0+iFKF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elH+J8qu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4236280A5A
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397702; cv=none; b=BvSEGo4kWkzZpDYrfq6Tdy+Qb0HecqyvTHVOwlHPCURnvY4rUA5uyVbNA/+8+k08X+ePmkLxlvJ8JOnvVG9B8twMZ5+rZJ3nDaMBuGSX83Am4s919/Z22KgKzLcXCuSAEbJqqqYW2bYD99u0rztGkNbunMSQswaVwdnMjnqKdKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397702; c=relaxed/simple;
	bh=F2Egr6gTTMq0vsg3Gq9u2lHP6Igh92FjHFaH8TKI/3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YEMlraE44OssyscQUeszH0p33i4TfGun2vnaJMYdKLNZqugKcL0SZe7BSIe+hLzJk7WU6ljsAcQTTe/cEfZ4ImJxb/AUOnCyHetZ+HzP3PRJxjxh/EPQOQxxZF1abt8t8a5XCVDL+btTZ9I1yEYhO+M23++8uM6YVwtVQIwuF+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ta0+iFKF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elH+J8qu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM81XkJ4116971
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vw6xPff86JBqj1B3Wfo7JW
	CvHRmYQMjbzrKd9Z6Che0=; b=Ta0+iFKFyO0ZaAXloJUA6jDCht+LKb0Lea8Q+F
	HnpHwwmACOHOOhgzbYTBi99xEmLwD8Qu/TWcbmdwl8dvzWZKZDnXi64UY4HoVtgh
	Xo39B0914TCsJ/jiLTMGwMOkpI4JdAvh3iJpLVeddBeLunSHliOjcAiW352Ni+4q
	pU/XPtICjlH+y3fhYYfBjSmhhEHBWfHNHRCds7xxVq9BLTcE2GUPqgC0RfvVadvh
	jp3I4W1xZp/HSmX9j4mkA7h4gD8QMbpC2hZ0E7EecoZo6ydoWQxTWBFWhUpSpvaw
	SYMEp7GEb6F7ca/aDkdxJ7uNrQznMjP6IkAKM2cKsmg3Ljng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux4kh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a5dba954so88672611cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 02:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766397699; x=1767002499; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vw6xPff86JBqj1B3Wfo7JWCvHRmYQMjbzrKd9Z6Che0=;
        b=elH+J8quN9CSIljHG/+Vq4uYAgLWTrahvq0UYjP4hW/VhYH5j8MIgazmHMHjlvULWD
         r4aRYfSsWZUziCHK6bTkuetteaOHBazz0Fv22O2CA1aantSsfzpLzrXd4URb7P9ECC6F
         dE5oaYyoNfeLkT0iCjCv8u9KYXsQteehPSyXD8hhCvhppv0gP5VCI+h3NRxiCBPZhZdF
         6bIToEeuxrGEqv8Uyrqrd3pDIjOUV6/WYVB81nlevLvMut0O6yWf+HyEgHJwVv5akQ9U
         Den4XjBBsQmoxhHpfAzZl4mh44uFhicLYUjDonb4QNVHQBwRkq+kTKDWby+In0jURI5K
         HMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766397699; x=1767002499;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw6xPff86JBqj1B3Wfo7JWCvHRmYQMjbzrKd9Z6Che0=;
        b=gHaOJSBuxlthMk8Du+mbH/qI6IXYbudDO9FnUgR5r1BJuAlKrPMsGXs8ZRc0o13y1r
         G8r58S4H+HdalcsdRrS3Tsj7SvEwYAxmVtkrQdQMYYreHN22zZxe984QmwjSCdPiqBZz
         rGBYNEPDkFUZBDxFzv8HQ1lgvSnmASQgWl+FSti7vLJt012Y2a7o6cIuLzkyUiQo+P15
         pzJLn2wK7z9cPIxx2fIHxmxO0oh79gYdIZAVBHDjeroSkHXbUDKhzGnQLmFqf4jF7kUQ
         gIp4PtvKQjbMqoeEFyYUkSZBR+UEBAIL+xytyOZE1ODKp0JbidRAqj1dA+SK0CQe0x4A
         Vw5Q==
X-Gm-Message-State: AOJu0YyDDjILEbeSofQGKn6tdmDleiClCYpiPbMNKUN1IK8SoO2TZoOB
	26cgYuYaCWU8I9E6FnHxi1jU1+OqdJxFuCBElY/AYLqD47PgCc6nepOfhs94OLTRcb0ZabeV43a
	iYLOEX0fsfyWYcaOBA3GeOmXqPQgqE7u1p0xmzX9kAHzmwB+Bvykq/xaCF9qkC8Hk
X-Gm-Gg: AY/fxX6yXdu8IxLbyWG12GJhJtM8iXqNj0MpcY0PkH1cjBbIG+dB1xj6pM44Qp88TAv
	6bAy0rO34Tev9w7N/x2IHGvw6pLhkpwoFDjilz02ePIu0cFbCUOZ7zQuwdAHTDMzcDPqdPS9lRg
	4Y03uLjQVW8Zq2aMPIHPQ1IhfaCK7eyYXL4nMd/zGtoCaXoUIlc4FVsy5dvAEZn8uA3jVtUoYJz
	NmbzrVKFnJou3BDuY+eG8wcwYr72+IUT1FRbfszREQT8jn8PGuDbAe6z0kIAS7242wMMzOKJsTO
	QoHYBT3thudczwF7zD9a2QnqiB1k8VSXBIRw/M2sY/pqk7aVDEbvzvGEfYsEjH64G1Na5J0GBNc
	cGe23EbAJYWMVpR2o5w2Ihz2CHmppK9ahdaqfORk4
X-Received: by 2002:a05:622a:4c1b:b0:4ee:49b8:fb4f with SMTP id d75a77b69052e-4f4abdb326emr149819651cf.71.1766397698912;
        Mon, 22 Dec 2025 02:01:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwI4Ro4uBkDdmaeq+DgKe5nhv24QrgSEy51qiMQBLNyp61Jq/ngDvuBnmqqHsRPKKDR7sM1g==
X-Received: by 2002:a05:622a:4c1b:b0:4ee:49b8:fb4f with SMTP id d75a77b69052e-4f4abdb326emr149819221cf.71.1766397698428;
        Mon, 22 Dec 2025 02:01:38 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd86:6812:7564:9961])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm8174665f8f.21.2025.12.22.02.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:01:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] gpio: shared: close remaining gaps
Date: Mon, 22 Dec 2025 11:01:25 +0100
Message-Id: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPUWSWkC/yXMQQqDQAxG4atI1g04EWntVUoX2vnVbJwhEbGId
 3dol99bvIMcpnB6VgcZNnVNS0G4VfSZ+2UCaywmqaUNUjc8ZU3sc2+IbHCs/5It7V8GmuEu8uh
 CHKgssmHU/bd/vc/zAj0gq89uAAAA
X-Change-ID: 20251203-gpio-shared-reset-gpio-proxy-ee3b722891db
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F2Egr6gTTMq0vsg3Gq9u2lHP6Igh92FjHFaH8TKI/3c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSRb5L5V7s9ouO9Ns/udgD0VZ/Mssx5AYFs/pt
 +yH8PKUdwSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUkW+QAKCRAFnS7L/zaE
 w0xFD/9+EgsLUmNRg3Pj9XGB4GnN8ym/UhkFcJojlB79DFfF+LXYdWksk0LAusXjRUNQPpl/EPW
 DqMoaF5Z8Hcgx8kIgQE7YLj9kziyfrm6ni7paWPnRqmdjBNhXdVQh0YDMNBXTRwCLTPYytnKj9s
 8k0Ru9T7Tp78/7qIrpJEmSAlzeOL618K/+URyfyi90dIhPWNrcZm8+94fhxngdnEmbAtsrxJPPH
 oMxptky8kyQszL8JRL4XVbz6XEsJYFo1PvHzjA3vEDwmVZRlm7QtujDbMjIWmkhu44T+PJgJTfM
 wZhDaShOO+xoPnNzk/6UdrkPkuO0bt4F49Xax0E9Phhv4+7PQHHBXzmOni84F0blJFrsXB7kyi2
 AKYO7WRVKKOihVXkp17MQ4LJslj+4TX6qhx6ES45NpNEp7pdZwh690ewyNWOkyb8xi8Kcc1mlCh
 TdSrwmMhjJiTpt88T9I7HHoiQWnPSn1DJelAOT5c4RN7sezn8ZqyLs0eJ9lSAPK71uxevepxY5h
 m2pDflBamUW7uJO2RJatfPwYkCW+sp6L5defPBihmxtg3bNE+WmV2HB4Idvo9Wwr2up3O2vDUO8
 QHMJOFqZiwIE9JTIPZR8MQiwig2Eao/Bsi1qmtrich4K6cMUM0GzqmQ2phhfdp9J58tuiPmNd70
 c7OU3DcznYziRyA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Ahz957z6VIWTBnFvSkQe98cITcA42O56
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=69491703 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vZtJ8gPTdbeIRMn7ZmMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Ahz957z6VIWTBnFvSkQe98cITcA42O56
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MSBTYWx0ZWRfX+b/qax9ISFwp
 IULHnKbmw2inVbfN1dRpw3wOfhTb4RP+F07EofggbJL5xjgQvTrg0agaJFkqMR8mnUEm1O/nkdf
 d0/x0k3gik5SF6MzdX8QdIWAiLekJzhH5e3d5oOr8OQGdF5yuhLkJWLwGwGlbv4G4A6XeRkPJpd
 QOQDafMie/DPHOcy9UyMLGJkhl3B+l+sXLru6ehqkIIQBHRQAA4SgM7s0N2XdIp1fkaQ2Oh3aBU
 9u77fbEvDO92mZ/j9+3T7LehzGBAyc36GY+GKdl+NK9BnElgzoc7qnlGUaJ8PWc9id6qcT1PpEi
 c4NEQCqx0/nwjFUfs9VQjNSNHzDENJLsAAeTz0gzLuV4ztKFX1M/l3oHpByMSxfKUt4jb2sGcSH
 3m3GCXITbYLYknrrEPV+CrSRn7YlJBWs4EdyOS6OxFMBvdq1zla+jKgDzF8kU7i5eaj6ieaOt4y
 TlA2/XWJ6zHA/zvoYIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220091

This series fixes some remaining issues and corner-cases in the shared
GPIO management. In order to address multiple shared GPIOs per consumer
as well as the reset-gpio interaction, we need to support multiple
lookup tables per consumer device.

This is targetting v6.19 as it effectively fixes the code that went
upstream during the v6.19 merge window.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      gpiolib: allow multiple lookup tables per consumer
      gpio: shared: verify con_id when adding proxy lookup
      gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib

 drivers/gpio/gpiolib-shared.c | 187 ++++++++++++++++++++++++++++++------------
 drivers/gpio/gpiolib-shared.h |   4 +-
 drivers/gpio/gpiolib.c        |  94 +++++++++++++--------
 3 files changed, 195 insertions(+), 90 deletions(-)
---
base-commit: d97963ce4531fd378752953fdf076d12bcf98837
change-id: 20251203-gpio-shared-reset-gpio-proxy-ee3b722891db

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


