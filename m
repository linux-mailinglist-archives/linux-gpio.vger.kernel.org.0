Return-Path: <linux-gpio+bounces-34811-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJWPHOoI1WnMzgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34811-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:38:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDA3AF48F
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E57A430E3642
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 13:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F2F3B7B61;
	Tue,  7 Apr 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLfpq7QY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Om5AgSl7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D23B775E
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568496; cv=none; b=eMoHC4cgZgj+/ja1BlAkYF4WIZFb2xpKhnWGc5CZq5xZnj/o1RFkI0Hz6MTxSrbKsHo0Z6R/AHWZHakj1zFCy+jLQzlH1blTK4Bio+wHs/wqB8Zye/tWxB/p8n3OWdcDjiGj5/v6RqYitOs+kuhTbnoITHaGn6M24f5VbL+iPNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568496; c=relaxed/simple;
	bh=hmYdGZ8QpnFOuKeBACyvFyEsCOerFDJssZtlQSsutkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWercYwSbS6T517Xcr9zmfayH5BUhvNXfQ04V/Rf7yoIWmU7n6IzrLGWyr1vH0AmZ4b3r1CAuIiLHn409vcZN2H0pnATWh+2kAptakYv/t0nv74F0nu/qouyOGA10oxU1SbQbFCcliMecLfp4LU9TgvtcuoeYBwnCmfM4YRFDKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLfpq7QY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Om5AgSl7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D3Gg02328163
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 13:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9liLF/qYXrQRfW076cbmGme0YBi1d5hYrDISi+SmGbg=; b=MLfpq7QYllDjY0ZM
	SIHS3wCWLtMZ7+OxG/CJTumykAa7Elpe7PryoJzPlCseiK/akd7reagxujTUjjyo
	pg6OSFmOLvJ80W3P2u3QXZQSBGwbmlYwgk0na1lSvGYpARWgtnEQtLl361LZNO2h
	qUm7TjaOL3cR9W2qZsQORvc1ydWVrIUnq8VPghh8JnjDN4qIPJDfhnTisZLgNFFr
	B+sNe48l1552wvMr4nHy4jMEY/4gGNWcgMRnSsRAtdQXyUDvMX5ezODVR+dd6Rt2
	cmOMJjPROf1NQDZj+Jmw7PBKAtJ9nSarSYnbislIYqvR4OwS8PDWqaoYcRtZJ+Jb
	VHC2Mw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tvd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 13:28:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d76f460b2so43034961cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568493; x=1776173293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9liLF/qYXrQRfW076cbmGme0YBi1d5hYrDISi+SmGbg=;
        b=Om5AgSl7h9Dd7eIMHpAImatDLqPlFRHoKiVawirrbRgo3xp8LwObL+veJaimJsxvtK
         i9AHSl/Vu5dSjnojd0QothnLtZ+mwDpztWK8bGfu1FrSKmdDYNykcRFsfA1gW9mObqOf
         98lNIPv6wvNza7goeQwt6Ev0Hwbdo71y6zkJGCde3RfdRpfk+TYLDwcWcv86XWDrp2fw
         we+GwttbHbpbcSmdK+YRS7xnzRN81c1+vmg8Bh5Awwdub2p6XGkSE038X6fIK/4tm5S+
         u5i+itiCEb+yK2hG9dptRBl9nXCaE9vPMv7/BUFnsMBo2O07P2b+ND4EIikAd7jlkCmb
         od+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568493; x=1776173293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9liLF/qYXrQRfW076cbmGme0YBi1d5hYrDISi+SmGbg=;
        b=s56l2cTEMAFAsAzQE2UHAy4duko79XZbfnB3Gs3WSW2a7hz8zVxzt6q/D/xR+THSrK
         7vlmw1PNzw1OckBafrMSoCYu7x00bbP3ZnqlegwsKfmIeXgzfju/SWUDUphhRzzDocHO
         FD2ELEFx8pEQmgRKSrTohdQuZ9ALBrQM7w/iUDDw5YTXHHAUlUaFFLQ8O259uD4jhfGo
         Y4hBJy3awJnc3OJVb8G7LIRnMhGqScLS460OV3Bpcxd/uGn+fqOkzpE3izyoDWTrq76I
         WH7UI4AC4MCmBnfBgryiP72FgRLByje/JRpBkTrZ7IO5nE3bKvP3Jr+ZK646/HUfk443
         oJlw==
X-Forwarded-Encrypted: i=1; AJvYcCVKuQgJllBiqM7RQwi41rb7Zlo+NnbPhLk68nuqq6k2WPnelSaYSFIZz759Xvzrtmx99zWxxq+1mrNb@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1V1Ff8BAOldDnbqqR/01hsuHOFEtAjtT6lX8akg2LKTGF9nT
	LU+aQTCRevp2Z9iCYgvEjCs/yCjYkIzHIO+8EXP4ZrVlWTO3DDPmMNr+QFqtL0h5T5yvyoihbpD
	Dsj3rY1DX87aAL+3KfAuznjwU2sAHNnc0aUXo89Jxi2SWl/Z4I0ELGwwcUyajDOLf
X-Gm-Gg: AeBDiev1zD3VBune/GXZRoa3eewfUeYgL+OUFW9k8uviylBeoZgIf1TW+RcQfdXKS5H
	G5AYTzFFXZsXEfks0UwwH0V/+zrhGAHao7+oyY/fGxU/yKjfrO5Eu5tviZJ+h+NcGv4Gn1knwI8
	kTg923MN+uSIlIYfNz8ZCKvMsLoENhTRvVQiWxMMb7Y7Lo79RiIuhXrLInlj987L67xiBGFVOsv
	fSmaMdAPXoGCOEjz2exOL5QLXoXtDnf3zNwL9FnRg/gs0DSBLtT+4OMr5GfUkYKdy/dvu32TgJq
	PKvynKzhXY3ufvSkth67lDsJ0oFpom1by501XLkkQ0pwOGdXNdO1Vcyz5R4e9PyWMTKGL2O0R0p
	4HDKizyAOr31itTSBKAM+XslDvuHxdaVofxRTA33gdSrUb+/U/9E=
X-Received: by 2002:a05:622a:4106:b0:50d:7a6c:7d4a with SMTP id d75a77b69052e-50d7a6c8951mr191328151cf.31.1775568493522;
        Tue, 07 Apr 2026 06:28:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4106:b0:50d:7a6c:7d4a with SMTP id d75a77b69052e-50d7a6c8951mr191327611cf.31.1775568492894;
        Tue, 07 Apr 2026 06:28:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccd2dsm4073807e87.67.2026.04.07.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:28:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:27:57 +0200
Subject: [PATCH v4 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
In-Reply-To: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hmYdGZ8QpnFOuKeBACyvFyEsCOerFDJssZtlQSsutkA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1QZkjA7X1+jc27SHeZAK7S1NEcKZXxUiPVu0U
 wtyyi+csk2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadUGZAAKCRAFnS7L/zaE
 w+leEACnZABJzFjgUe801nNvDd9J625XE4Ufxm6zNPtDSZPwoBpkoqY+sXqtHY9NWff2zOKp2gF
 WdCK5Q/REfC+Ha7bdGdeWeJ3yS/+Gj1IIOJCJIpMAsbZm2TIz13/l54D2Y8ihOQl65rBxRsEBwT
 A93IuL2OzHhqj/KS+DFfBhHsLy0WoJWw00e4hT/dA8eLNmVrA25vOEnGqfMFsiDS8U+zqYeKsBK
 UIAXYmjsJytLXtJguzC1JDWUf7qeGbFFmNwLEXQRY3KadwzqwISCItcIclLbuUB1DaKrCTA3FM8
 6Yz5/OixAHYD6G/oGVL+PkAAw3KVIYc9fbNwR1JVaWOhRH4VbyBMK4bavqvPSoOUyAVwiydO6xZ
 icwm21qpZcx9GGu6l9A03Gy5xp4wt/LqMlWX+JB3qf5mZUYb5O9tS+xwWedQhxdxiwEPQ8WmhMf
 ejrRaRqxfFBrcUCZS7R1lp+n+BDPn7/6szRNq2uuia9j1+0IfbpRC2i+jc97MrHONK0ANMSydLT
 +MrMWPBfCOb5aSru7GnPiWST88G9KMhQ7gTezWVW4zPTCbXOGSGkar76Eg3kndXy/HL6QzgdTOT
 A/Yn8KiP2N/CeRwWJEJB73rzB80CytsMI4BCmCcoNZaIL43b2y19by6MejUBafCVCZikLuIA1H7
 0I6tA1MR3U3qZPQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX+3s6Iq8f7g6p
 aiws63RePV1tVruqFLThsvUNZoN/eVy1fSdVGTLkU8SdRwnNcanr7iUs4//wiqzwBFLnE7iM4m2
 MrhVIaPKS6F9cH2VmhV6PxfyO6yqBrzNfT7K54cj7biOfc3fAOzouEskPwAQ2oP9QSGmjNmF08W
 VJbOLGKip06hTeJ5DBsIL5GZUn5osWiZbhvjgTPQQDu+iGRQv2nqaC9Y/kRWzi09xRb4V1YzBFb
 Lgf7I7AExk5kiO7zt9eMZsVdYYwqzlPgAgKMSjThtbfLsfFqKzrMtqsfDLK3DPv0qaSkBSV1n3L
 cIiXGvj2fPZ+wDqBRMrdVA7UrIIsKinM1yTpOSKq1hDRN4xSJoCiKg2K6YeFo3NZuXqnY6rW99S
 6VL7jnx8I4db4Z2QTPbd1L6C0trUtpd7FWLeeqVIHEjJ4PJPjHNtpHLUuRkAJRSCqRIMu861qv4
 au//1i+xwCfqr7Ei/tA==
X-Proofpoint-ORIG-GUID: vftpKH5c3LN4DhDVP_Ld9K3GZWF9Og2D
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d5066e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=75m2fMeJeqiFL9RjkDoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: vftpKH5c3LN4DhDVP_Ld9K3GZWF9Og2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34811-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFFDA3AF48F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's possible that at the time of resolving a reference to a remote
software node, the node we know exists is not yet registered as a full
firmware node. We currently return -ENOENT in this case but the same
error code is also returned in some other cases, like the reference
property with given name not existing in the property list of the local
software node.

It makes sense to let users know that we're dealing with an unregistered
software node so that they can defer probe - the situation is somewhat
similar to there existing a firmware node to which no device is bound
yet - which is valid grounds for probe deferral. To that end: use
-ENOTCONN to indicate the software node is "not connected".

Acked-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c | 2 ++
 drivers/base/swnode.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 8d9a34be57fbf185e639c70cc4baae4510ba70ee..51394b7d44e31d0453e9c0084bb7ddb25b14a429 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -594,6 +594,8 @@ EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
  *	    %-ENOENT when the index is out of bounds, the index has an empty
  *		     reference or the property was not found
  *	    %-EINVAL on parse error
+ *	    %-ENOTCONN when the remote firmware node is a software node that
+ *		       has not been registered as a firmware node yet
  */
 int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       const char *prop, const char *nargs_prop,
diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9f1bf4f65aa161d9b941affc74936..61e73417aee89feb855b0f429e112ca0af78a003 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -554,7 +554,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -EINVAL;
 
 	if (!refnode)
-		return -ENOENT;
+		return -ENOTCONN;
 
 	if (nargs_prop) {
 		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);

-- 
2.47.3


