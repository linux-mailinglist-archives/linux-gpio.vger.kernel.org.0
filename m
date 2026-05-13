Return-Path: <linux-gpio+bounces-36738-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKDUIuJFBGowGgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36738-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:35:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1435530B7E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E85530C68DA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D043D47A0;
	Wed, 13 May 2026 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mt7mD6OB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBvfgS4j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4E3C4546
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663650; cv=none; b=LoNcqznfoRdPm9594BexA0tCZYCiqJmI3bHyihH5ReNvwGCEPm7Sp7fQfg/ln/EuYXC8zECh/UFfCTnoDq8SNzBw8VwQF/RSVshZ1nD6IaXexqXowdAFnH2TLd3ukHPXGRoHzdFPiltf/pd3EbO1bGMhbpnM5qpI3ydpqUd3EnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663650; c=relaxed/simple;
	bh=bWdgP3f1IgL38m7Eqo6D/m1Z3Utd8samPzwet/LmvPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TlP3NTy0Ox2HnmhuORUBuz30LXfLM816lfLu/62cukfTrkZU8Mw+9jpITQdEMBE4oVFGDj91FGXehY6GnfF8JJP1brhdn0gJQQbeDLc4j6AX2puEqRGW9KCVrOLJ1TRh9xEjxkb5eFg/6Xwul4vcuhPI4gXfOObRXoxqqa7wJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mt7mD6OB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBvfgS4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6idah2965186
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O38d3FXUnteC8VLhdat0t4
	3w50c4ffGZ77kqATynEvo=; b=Mt7mD6OBm55zRvMJXjMVcfyfnbIPCOimCahcLK
	cDm8GsElM0ZjcNV9xeX0Ftf2MQI0szQK1EUwlQax/uaVcqlgge71XFLu42LdbFGx
	wI5lHUlk7bwmscvur+IiDJmu1tBIXCYab5pL3q/hC/gq8RINolcG8cqmwJP0Bh/K
	q5HJEsKXI2OejgVGTsECXrQuNwiQw+TqFBQuQXFv62fr/kTK7wySkUO+Gzi8PkdD
	aD/9ea2iZo8gKVov2J+RyfTBVhEPc7PJeJd0oEXtXsH4a7PpGUkdOzrVT1tM1hOb
	7cUZ06tuIQdIu4Ney1y2oaAu4jF4Ewy+lNiSucK6zGCMWLNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma58k0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 09:14:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so58523091cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778663647; x=1779268447; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O38d3FXUnteC8VLhdat0t43w50c4ffGZ77kqATynEvo=;
        b=SBvfgS4jAmoIcySUDcFYdeDZ7D2RPFG3L9uokZEjIKHaqdoQOXHMAnQqmxd68xtzDL
         Tn7EndtZQ+B12BpQPllQ0451QpMK3+BjBvr98UgRGof1cwcbpGDs1Mg1QETpv95dH8M3
         5b/55QEDSpPzHHKQU1y/bxyiOSO37OHNKz51tiLVSOySx/gLhPTIUUiALTbzkvn4vn1T
         8oMTK1EzOdocDoiQsDlONdMMSomMEGApqb7+dBjjyCOkfA7kXO5s20LNEB7vkWE5e/ZH
         SbbN1uoGosz4XAafyWHkROy/SSEtYdI8OJuhDsNZvGNCsV68nFT3883Kk4gU7RIzNP8U
         bg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663647; x=1779268447;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38d3FXUnteC8VLhdat0t43w50c4ffGZ77kqATynEvo=;
        b=IsqIxxDuTdcuvIi+QFrpb0JtnnJo4+E6XNlLXoL7SzryTivvlHon94m4iRnLqqENDg
         +aCZE+C+JBpz+9woEJo0P3V6o2QcK1y912wyXOsxfwHvJaxZHy2RgW4LLhiYx5X5LRQD
         C1+0jqv4nDFwtht24njGRH4ww+XqKa4aXae8RsaZ1xqO9Ylbra6niF2+EAEgocU+BCpf
         HzRcblKbwu49no3o9cohTaDy2uQffqTYPZ7ghBX19pv/ke3MR9JlcCCGe2rTf+3NMYtl
         m8q4PDl1Z2C4n0KjwkpbAh/PZeKAazwGBt9z8SRZ2wJgbAaTdmoLYDIqvOFw8xnqOROC
         nzTA==
X-Forwarded-Encrypted: i=1; AFNElJ9p6X7NM6QTTbbvp0KgdlGrfrTOObJwnt/bIHeblF8WnWQmUQbJfNZOyLwdEjdSbLfKkZRjw8Ua8jil@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZb7sjYGcnfVTN2pPoU1Tfdc3dGgHFLQNNjlFCiDp1tKlSEkN
	+9KePZnTLVpGK2ea4NWHNaQUA2kJIyUCiQBgqS0t116RbyYf6OIfaYmhvQG7+COK8b+hR/LviQt
	Z+PTxm+xyLlPrQZIk9X0Xt5MwpAaJG80yKsVyUc5NOyeFxSo3RccAAgwQIe4LTYrw
X-Gm-Gg: Acq92OH5ic+eEoDewYA7Vc5pK3X+WqDtdSC9ZHk8+puHtibK8nBtKfx5TAPWh2XvQrv
	Xx48ANbkwpNFCEuHuznyUoqyd2v4LVGIo0MG+f1/MwVd1Ab9Ui1qmpU8Q3Ui8HrcbOYwmeO5acw
	6Jf44TfioRm5P/1MpGclPFeDzp/JiGCZJypLG7rvWh0SHbWZW9L15zyrwqaFjwJGZG//KZW0XIY
	m0cWUEmHlfJrQ34fQ5evpsU/lKLK7MnwYw/6Armnoc6bASEgQ2xwe6weGM9lb4zQbParSpk+kG2
	NbeyffNcFSt/MfmS0V+zcBG5wbqJshaYFk9dXRTHWtU9aRfkfcToVraEzbgpTOD55rMZyw8jRzW
	tx9YgNDYdwmTPX9qk/6CU1Tr2hvbBAAoxTnFF8RmBkzL5miMc7g==
X-Received: by 2002:ac8:5c92:0:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5162f5c99e3mr30779641cf.43.1778663646615;
        Wed, 13 May 2026 02:14:06 -0700 (PDT)
X-Received: by 2002:ac8:5c92:0:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5162f5c99e3mr30779201cf.43.1778663646039;
        Wed, 13 May 2026 02:14:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b071sm39372371f8f.14.2026.05.13.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 11:13:53 +0200
Subject: [PATCH] gpio: shared: make the voting mechanism adaptable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANFABGoC/x3MQQ5AMBAAwK/Inm1Cg6iviMPSVXvQSisNEX/XO
 M5lHogchCMMxQOBk0TxLqMuC1g2cpZRTDaoSnVVWyu0h3iMGwU2aG5HuyyY/CnOoiaam67Xa8s
 acnAEXuX683F63w81WjoDbAAAAA==
X-Change-ID: 20260512-gpio-shared-dynamic-voting-9aab4689f5e9
To: Marek Vasut <marex@nabladev.com>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5828;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bWdgP3f1IgL38m7Eqo6D/m1Z3Utd8samPzwet/LmvPE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBEDXMETSel7bvGt8Ic9QqsZyPlVrKiZlaWBXV
 l3uXGUZYJaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagRA1wAKCRAFnS7L/zaE
 w2/uEACR2jiVriiTnjubpagog7arfGZV+T6vfITabF7rFWXrvQEyRnccC+ZK3Gz2coxr+s7OM7h
 C3Vjgy+nGnH6Vz4z3/DZZWj3wwrl/I43iORADcXuIsGa3h4v6pQUvOLabEqjIjduF1J66ogzlbT
 vVO86kuiEcEXPE0AvqsrTwIjkmEtZeYqx1yi/JdhgMxFHPygn1cfNBjvBJbpYNG1Y/K5vGAjphG
 o4vnwlFtJ/eiHrLYKujjWxsW3iCDS0teamDDZBLbsBNSO7ZBhBh5csnGN7MQqzs8Va7uhpfMMzm
 4G0xMPKQBmQxFjLSnzZjHdQlrOQxNB1ukkIXeTFjek5hZzTha12lFd4ppHZZDVjNzCKwHQ/C+P1
 uz+tZ0GlVrK8LKi+HQx5tmHtERKJY9OOQaFehaT/89uTOipIYL4vcNBN63FybHHnsb1CB9aAzKU
 wKapbYxW6oOTT6tXq7xGFw1lfv3rqsCq48ZLA6e3vIm63/MGyU85WtBd55x+9/DakyoF9qBoT9o
 LHPEO7nFSbIADdhIwih75ihPIkBE0IVCgNIZo43vGwm+yfctYSsCuEIDf3oLpbsG1EVHi8/hkef
 BEPxYp8ksVfyE3jU7sagD9IJjxTTzaCuEHvvXxOzuvEJPWzQ5/m9pWWvcM1+uJDY+CJ1yRYA+Cf
 o59l+N9o243VztQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA5NSBTYWx0ZWRfX+gVVgSI2fOwg
 IeTXphT0mA8a2t6TTI6taHLGZDT1BrMSlCI4GeBv5sp+mzmCIZcFcWOmduKAw2a+MnnHEa5f96q
 wzOfjfl8ZLT9x943p14IACsfJCwNaLw9g5jqEEksY5s8V3pA9rGomPRcC/JxdqX8hH9UqET5mM3
 vNWTd6Gbtk+VuTIzzHe3uVieDWjACeftzB0jVHewjp9IoCT/FkoTWK+5Rnvb8LCU4s6ZRoeec/P
 yR2Q/TqvRwlj+EUKQ1fhXVMS3wfQ6/Xj4/K/uMLle+gkCCvFk21EGnUQp3qNSHyFGoDZjPNubsI
 kW7rFT9abD4/CV28IN0XuxYbn4sC9v9cqtkz8rfUATJwgP2q9eq74xKnJb+81ljhYgIN9BKQ37J
 SCVJHNF4X6HPWnk/O+jjHoHsC2h4DlbJ7yuh/f8SeifudTJtERZjZzF87cEy4cb5gS9JP2/inXM
 bzeGtNN2/i69Xbn4UjA==
X-Proofpoint-ORIG-GUID: 0ad55uGC_Q_qGaXstnMR4T1laUeUXL0S
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a0440df cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=p-LfKV-GAAAA:8 a=EUspDBNiAAAA:8 a=Zu01ZlIDKDuNyYJ2ucgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=97BuGM4RKn6GwmfqMd6i:22
X-Proofpoint-GUID: 0ad55uGC_Q_qGaXstnMR4T1laUeUXL0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130095
X-Rspamd-Queue-Id: D1435530B7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36738-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The current voting mechanism in GPIO shared proxy assumes that "low" is
always the default value and users can only vote for driving the GPIO
"high" in which case it will remain high as long as there's at least one
user voting.

This makes it impossible to use the automatic sharing management for
certain use-cases such as the write-protect GPIOs of EEPROMs which are
requested "high" and driven "low" to enable writing. In this case, if
the WP GPIO is shared by multiple EEPROMs, and at least one of them
wants to enable writing, the pin must be set to "low".

Modify the voting heuristic to assume the value set by the first user on
request to be the "default" and subseqent calls to gpiod_set_value()
will constitute votes for a change of the value to the opposite. In the
wp-gpios case it will mean that the nvmem core requests the GPIO as
"out-high" for all EEPROMs sharing the pin, and when one of them wants
to write, the pin will be driven low, enabling it.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Reported-by: Marek Vasut <marex@nabladev.com>
Closes: https://lore.kernel.org/all/20260511163518.51104-1-marex@nabladev.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Hi Marek!

Please see if you can make your setup work with shared GPIOs with this
patch. You need to enable CONFIG_HAVE_SHARED_GPIOS on your platform. I
indend to slowly enable it on all platforms and eventually make it
default to 'y'. Currently it's enabled in arm64 defconfig via the
Qualcomm platforms.

Thanks,
Bartosz
---
 drivers/gpio/gpio-shared-proxy.c | 62 +++++++++++++++++++---------------------
 drivers/gpio/gpiolib-shared.h    |  3 +-
 2 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 29d7d2e4dfc02c34fb3f2abc343ee30b61579b66..4fb4bb6b712ee2f349182aa61d0aa46703ace3bb 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -20,7 +20,7 @@ struct gpio_shared_proxy_data {
 	struct gpio_chip gc;
 	struct gpio_shared_desc *shared_desc;
 	struct device *dev;
-	bool voted_high;
+	bool voted_change;
 };
 
 static int
@@ -34,52 +34,54 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
 
 	gpio_shared_lockdep_assert(shared_desc);
 
-	if (value) {
-	       /* User wants to set value to high. */
-		if (proxy->voted_high)
-			/* Already voted for high, nothing to do. */
+	if (value != shared_desc->def_val) {
+	       /* User wants to vote for a value change. */
+		if (proxy->voted_change)
+			/* Already voted for a change, nothing to do. */
 			goto out;
 
-		/* Haven't voted for high yet. */
-		if (!shared_desc->highcnt) {
+		/* Haven't voted for a value change yet. */
+		if (!shared_desc->votecnt) {
 			/*
-			 * Current value is low, need to actually set value
-			 * to high.
+			 * Current value is default, need to actually set value
+			 * to the opposite.
 			 */
-			ret = set_func(desc, 1);
+			ret = set_func(desc, value);
 			if (ret)
 				goto out;
 		}
 
-		shared_desc->highcnt++;
-		proxy->voted_high = true;
+		shared_desc->votecnt++;
+		proxy->voted_change = true;
 
 		goto out;
 	}
 
-	/* Desired value is low. */
-	if (!proxy->voted_high)
-		/* We didn't vote for high, nothing to do. */
+	/* Desired value is the default. */
+	if (!proxy->voted_change)
+		/* We didn't vote for change previously, nothing to do. */
 		goto out;
 
-	/* We previously voted for high. */
-	if (shared_desc->highcnt == 1) {
-		/* This is the last remaining vote for high, set value  to low. */
-		ret = set_func(desc, 0);
+	/* We previously voted for change. */
+	if (shared_desc->votecnt == 1) {
+		/* This is the last remaining vote for change, set value to default. */
+		ret = set_func(desc, shared_desc->def_val);
 		if (ret)
 			goto out;
 	}
 
-	shared_desc->highcnt--;
-	proxy->voted_high = false;
+	shared_desc->votecnt--;
+	proxy->voted_change = false;
 
 out:
-	if (shared_desc->highcnt)
+	if (shared_desc->votecnt)
 		dev_dbg(proxy->dev,
-			"Voted for value '%s', effective value is 'high', number of votes for 'high': %u\n",
-			str_high_low(value), shared_desc->highcnt);
+			"Voted for value '%s', effective value is '%s', number of votes: %u\n",
+			str_high_low(value), str_high_low(!shared_desc->def_val),
+			shared_desc->votecnt);
 	else
-		dev_dbg(proxy->dev, "Voted for value 'low', effective value is 'low'\n");
+		dev_dbg(proxy->dev, "Voted for value '%s', effective value is '%s'\n",
+			str_high_low(value), str_high_low(shared_desc->def_val));
 
 	return ret;
 }
@@ -189,13 +191,9 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 		if (ret)
 			return ret;
 
-		if (value) {
-			proxy->voted_high = true;
-			shared_desc->highcnt = 1;
-		} else {
-			proxy->voted_high = false;
-			shared_desc->highcnt = 0;
-		}
+		shared_desc->def_val = value;
+		shared_desc->votecnt = 0;
+		proxy->voted_change = false;
 
 		return 0;
 	}
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 15e72a8dcdb138f19ce000a33d3f53cb8f140bce..f6cbab85c65fc979e2891d19b799baaf91fd6dca 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -45,7 +45,8 @@ struct gpio_shared_desc {
 	bool can_sleep;
 	unsigned long cfg;
 	unsigned int usecnt;
-	unsigned int highcnt;
+	unsigned int votecnt;
+	int def_val;
 	union {
 		struct mutex mutex;
 		spinlock_t spinlock;

---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260512-gpio-shared-dynamic-voting-9aab4689f5e9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


