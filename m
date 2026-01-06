Return-Path: <linux-gpio+bounces-30187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DBCCF7932
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 10:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4733630D690E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 09:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8812DCF46;
	Tue,  6 Jan 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0ZvB7OH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgBWeRHE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639592D94B5
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692078; cv=none; b=Px7fbNz+DTa678kQ3NyHU4G0O8Pp6otAhUnmOt21J+jlZoVcKPxhqClTLRVk5L4frnAmftXfXsrd8Ve8qV4XnsctENAd2U/r80Qy0OVOTABr48gm/DDapW7AfejCCJ7PMkVFfEtWT6YmO2TJxq9lTGZHTHahHup3zD9WVmO6zbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692078; c=relaxed/simple;
	bh=Rh7mu8J8z9rJVTpa684PVjaTBzhtgnsH3idBfHLdqHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AgxIV7pO+EFuZFHkdIqBvNfUDTvYzF9Xf4VDn5B07VdYgaDSgHW9swsy5Vcde9fztzCLwtHedNaF9whuMIRJUIAsXwpviEwzZhxXa1DaV9ZODDVmeYjR+N0fXz5c/HHYnGnBq/OhuuzgSdCevlr6nGZoi14/C4gHH8M2dcKmjAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0ZvB7OH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgBWeRHE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q8Su3442292
	for <linux-gpio@vger.kernel.org>; Tue, 6 Jan 2026 09:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ha1Nm8aDLc9bFMKyxAbowu
	Drf5vy4H+KjP9XeMfJ/gM=; b=d0ZvB7OHrO5iBe/LEn+BQwdoG2jV1mKLF3Vgpp
	LSYkbu5sZgF1TxGq73vZCJhh24w+CpxjcvXyUU0+BQOarQlmi5wxHxq0vbdoVPn6
	aiXF6Oev8qf8VEDeCr/N2yMR8aYOirc7+84IckqzFHohDeVmiJXHkfOdi3OkTfvv
	/MaVt1mbc55/ei1QPVh8LlDQFW2yKTiQmG2sLm90SisRBmFBez0s1DVfQh8AaBlB
	NsIgCuecQd3liCyZOTm0TyeP4fKzKgPk6lxNGnF1mlx6aqUu3smwsMZ0wHZNWKxf
	cT21jCjQ+e6FGiWTgWOu/gaLSiz2nfkccNKkqJ7jKzUzKhrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh9vup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 09:34:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d60f037bso17412591cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 01:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692075; x=1768296875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha1Nm8aDLc9bFMKyxAbowuDrf5vy4H+KjP9XeMfJ/gM=;
        b=MgBWeRHE0jAW+mdTkrJDFIvVPeMT5D4M2Etwo1AsfBnhnxCe3r0gXO1pTPwQ9iNoPk
         Beqxwfp6NjpNst3lHejK9rhgikjzi+rsz0sytJL6aDo0TCMEoSIthO6xW9/9JO0v3+vk
         qTO5F4K4ozuaKUYBtpB2OO4uHKhVKetbLA8o+13zYcMIBiTmwJzO1E4kg3Tw98+ttkVu
         FUhYDPiC1YJFAT3dEQEh+F8p6Is2h/vCd3UPH/o3Yy41IlDCts1vs8B+tTxZdobeZsFh
         lyNS/bpvS+UiO/oH1jQAsOMJTRMFGkDH+eZ1AQRlvqnvwBNJ5jUXFr7VIk2fe7chdXid
         Jwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692075; x=1768296875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ha1Nm8aDLc9bFMKyxAbowuDrf5vy4H+KjP9XeMfJ/gM=;
        b=XPjARTkQ8o0189qvfpbTxJErhpBgkOSTqiE3MUrprxTNfe3CZJdhKAw3wEZkEBV3tZ
         XD07dQqeTp2tTwX7c0eIeVPM3X961OaOt0/DhJ1QVMPd4j+WaRREDri4C6n/vQ6ZIWHz
         40vlNTKkJ3SJyivlmbnctoPJqg9YOiSrwNBqM0htYppKr/wr+51zCv940YESaZTqgOUr
         oNjz8Voq5RlcaYGRqqY/xZGY0WTohk5kBNIxgcAmtRWMKQSXtaFsbUxavPyVDSOJR9ks
         Mgdpu378SdJJ+BBm4CkP3qAJ2KpoDvjb/vy7oPfjopuR+22g62yG0mvcN2JDWdAkIDmr
         DUtQ==
X-Gm-Message-State: AOJu0YzdkBq0u72V/CPbCOhP9M7L0PRIsFxqeCklWcqqPA7TsTBUi7+/
	P2pkDiunFWGpl7lDgh9FYTSqSVP9yrd6ec/5+ZbTaj0C4fut6QLq/qfQAsCAh/tAeOfqPdcmak5
	yBaBINXQPgIlLTwT4qBO/liQVJ7Q82zxseeiqBItozwKRXYfxnymwGtHChsEIkVdNqFZO+8lc
X-Gm-Gg: AY/fxX4k1l3H+HOOgze1wXZ5kbjAZvgbnMEfS8G0b5DO8H8dsFl6dtyHuzy9EA2PwYN
	54257BetMvLoIjeVyCyIFpxovAKhzRoXDBXIVQ5WHUPqWVJ+AgIIUUYG37wcPd+N9IgBvRtfRit
	mQJKCZ4UnONpP3R9enSikeTybV8FAZeQc4vY2qTZjiKQpWhWafp1FWAIPC6GaUtjv9ynr7ZIKBE
	xgIDlRP0T5GUIPysiE1Zxq4mpG9HF+mgcTJ/K1YDIr7X1vnGNCw3qZDQ/9TEcSyjFCLCmXkC53N
	SJPtq8yF7OXn4Yk4q/L14t+6ECffBhNCA5jys+Xz/zIwfNc6MZQ27sGtrE6V9w4YmpLcWDwK93y
	mO6qDoX0hvcUUDPzACKz9/Dc01ZTNZhtGZMVCbXh9
X-Received: by 2002:ac8:594b:0:b0:4ed:680e:29d2 with SMTP id d75a77b69052e-4ffa77a89e7mr28560721cf.44.1767692075600;
        Tue, 06 Jan 2026 01:34:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaxic8a/QJFQNrEoyqv6+J6ascbsYQKzcCYg3SKspUxjJdzUHoX9wjPBsin1Y29UVTCV1LJA==
X-Received: by 2002:ac8:594b:0:b0:4ed:680e:29d2 with SMTP id d75a77b69052e-4ffa77a89e7mr28560491cf.44.1767692075223;
        Tue, 06 Jan 2026 01:34:35 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f66cd6bsm32013275e9.15.2026.01.06.01.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:34:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] gpio: shared: another set of small fixes
Date: Tue, 06 Jan 2026 10:34:20 +0100
Message-Id: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzXXGkC/32NwQ6CMBBEf4Xs2SWlSiWe/A/DobRb2EQodpVoC
 P9u5QO8TPJmMjMrCCUmgUuxQqKFheOUQR8KcIOdekL2mUErbVSlauxnjiiDTeQx8JsET8o25I6
 d6XQNuTcn2oNcu7WZB5ZnTJ/9Yql+7r+1pUKFZ+NNCMoG55trFCkfL3t3cRzLLNBu2/YFPjHkY
 LkAAAA=
X-Change-ID: 20260105-gpio-shared-fixes-40a8ec3b6b25
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rh7mu8J8z9rJVTpa684PVjaTBzhtgnsH3idBfHLdqHs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpXNchIjGIORhZpcbwRzNJsyz7SHXCsDzSvgNDF
 pVmxv8yQvCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaVzXIQAKCRAFnS7L/zaE
 wxwpD/0e2I7PYBoI/Mw63un6yl+ac3lsz2e7EBKBf5nRZrknGBDa8aJ8u22akXOccTWcV8LSBnp
 oPzAGBqQMhgL6/BRET7Q+/YYQ7JSowPC0MIrmqVu9pPZLHQSOQsMQ5J7cdwtAI4lqng4KWTCunl
 z4ENs0+ThNyXC0wTkxAJT45hW4MBc4I9HFoOZpCiaPkGqf+8NY+4XXIDcnikGnIe1TaSLQlAZKB
 5n4REQP5J21a5wJ3XxvnNSgTYR5UaLjSTjEcFnDlUTstndLp1u8ha9hxk7FimLb7f9AvM/Qqr+y
 xLqewf850Fq9vRKs0ud8JL+PrvTEOqSypHn1H+9wuwfiXLAIKeGx3sAsIWf8DR3cvpRoYiB8xcV
 D6stVZCxxeKg97RMhyRHYMXcgYjsly+q7y55kPxFAFninRzVgwW0tQzTkdYjGVl2gDEGoIVT89Q
 BbpdcoFZJBrZix3FKLHDwcCqcT2Dnx//97LSkLRcV8sm7IElmHa9DOqNehfxBKO/c9Y/jKxTM4p
 auQBRmWBQI20B8MNHrY0/lhh8iLaai7sYQ/ftrAoMpwh76TxORIDvc3QLT1tC7Ya0vElErK1bdA
 ITcwuYErJgFNtsUadEt7mgaj8d4OYHFi5/iF0q/8m9K//rtT7SuSCW7aJH+nhln6vrHl1zgdvUV
 RJ+XSCQgiblo7NA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: U4uQZfc5db36qwuhVV2JnaHembneZnMh
X-Proofpoint-ORIG-GUID: U4uQZfc5db36qwuhVV2JnaHembneZnMh
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695cd72c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K50FUVcppveADEeWPA8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MCBTYWx0ZWRfX6tE0GOAM4NXL
 dJil1rkfvr6BzZ1JTaeZq4rFxFcFpDAq56yNqW3nDHyI+rhh4AfNEhodHza7UPcJuTQOyWdarne
 Q1+XmzJvYEOFPKmsbAconw6NQ9NErmSuGUxLnfB3HxchIXyPdjQH9IgtbQOQoSDTn1P3bzNEQyz
 I0KVOQw3ddQb229KxjHDTGXLR8M7heP/5Lr7PCoxECY0OpipxLF4EBlnoXMEYa5mIVGQOP5BouT
 sHGZjBUOYRt8E+WIOrq4UB7Eh9/CqRxx/rE1Q69mTtpLKeUI+sWRdxBTOUbcaJoeL2k764dDYY4
 uv8Nsgbm5bEI+Nu66mDV7/vsdjdZtbzqaOC21c30BedaSSdJdFJzJivz9iUvX8zMdLx+YH2XWr9
 F5aLbvyeTnEw43v5YVwAArBnH8nsxFi850FVkg5oBoMtEPTSnrcqPVGeRQ0KJ1NgYHTgBnuNne+
 lahSil9OajpsSuhZgOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060080

Here are three more patches fixing issues reported with shared GPIO
management.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix mutex deadlock
- Fix lockdep false-positives
- Add a patch reducing the number of memory allocations
- Link to v1: https://lore.kernel.org/r/20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com

---
Bartosz Golaszewski (3):
      gpio: shared: assign the correct firmware node for reset-gpio use-case
      gpio: shared: fix a race condition
      gpio: shared: don't allocate the lookup table until we really need it

 drivers/gpio/gpiolib-shared.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)
---
base-commit: 19fb766a1e5ed5943a62fc671c09d45352a81b1d
change-id: 20260105-gpio-shared-fixes-40a8ec3b6b25

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


