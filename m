Return-Path: <linux-gpio+bounces-39967-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FccSA1jJVGoBTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39967-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:17:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8442A74A418
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:17:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bsRP2EMC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HiT3dGn6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39967-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39967-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B10FA306C204
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 11:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3990E387371;
	Mon, 13 Jul 2026 11:15:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD88386C13
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941307; cv=none; b=qdk/yDNMwRwUWctoeb0qdcAvVRwLmr18pSlceCMLhyBLpMxNiHt5SXoBYA6jY5G5XVGcRU8YZKVw77At9U9nTSZbAOLAl0NvHBv0J/oizG2Rqqhpi9r03Vza4Yo9xB0KPwWAg1SdfrXYbeybEh299NG3R8xXiavHcXh8VerRShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941307; c=relaxed/simple;
	bh=YLnhAMXI4o2AsIjbEgigSwyf7yABdblIj2hdQJTPptk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JbOrGcbm6mHiV0jfdNajyN/maBbdZ/XfJ3lY7I0VCHAQ+vA/MZEZhld31r6fSizajiQAamgoYUJbo85bHuRmy6nuZg6acfdF9+ko4Y7kmm/MXS5GWgiSD+oTeFUabbQG7OdeZu9eYq++uOM+FRmffbG/Otr++2Eovd91mK0bQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsRP2EMC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiT3dGn6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9uc0G1089707
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rgj1qOKaATbq5epILLAkJg
	dwBV26F560LVvJkeM2a58=; b=bsRP2EMCA4+XJvyt/WY5sTqOSLb/c/UmTSIzSL
	MRenKVOsnibbffNT+1Ig6yxXelfWmAPyQ1F3qodEOusMe9Wh7BggOYBj2IDBeUEW
	m5gGnGqRcgyyWk4IVruaRTp/Wjk2WfOujpm/QBI9ojsVPb+07tbvYPfVnQCv6jxY
	82P22FFS5XJKireQEzMS68u22QoljJX6v0i9ho1zThi4o0y01dOCi+A1H3wQN8m5
	8azQuLiTVylh3DcopDxLlUm7dlTse5hn1mKvx9RoUt/cSU62HDFudIiFju/L/vlc
	om0BVfHESuEgCAMK81cvANwc5FknN+8rrFMQqNpaZxxQZuOw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4r8tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:15:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso42203771cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941303; x=1784546103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rgj1qOKaATbq5epILLAkJgdwBV26F560LVvJkeM2a58=;
        b=HiT3dGn6CocnnUrv2EQHuFehYkJjnr63MHFcaqPTEgOp2rEAMWrzr3uiVtOpt+nMos
         6j+te8x0KrfgPQLGO9NUmf39VmfIUhocxe+gm3OAjN7CY4cgnSS4K6Bl/cyp9SmjV/nf
         LhSNeZuuLHRI8Uok5bqRbYy5M4Bybxl51t3AsBtmXhElouAlkpmZPU+IJ1nhKKQOA6SM
         eVHGu0RJoklvtyXQykd9nKlHK0j3xYrYWX1yBX5V2RjjGLPO+Bwk+v9HZb37YRyR81Kl
         m3+JgaH/L8uTwmpIQbVDWCm+LPiJIqpc1l5V6XVTbNzAht/C8Drr4s5Is8NCkTLcG3Yu
         Ztmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941303; x=1784546103;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rgj1qOKaATbq5epILLAkJgdwBV26F560LVvJkeM2a58=;
        b=apGLE7jcDNzdhXw8gRMbRxy4cGqUy92zvY9FvKjvFh7P4NxhxnWEeLWlnA/CjdS37y
         9gEqEMCT+Wrx2MLVq88DCwt29DtDktXD2l8vlSPdshLAfnsJ1QB6QOxVkeOoFdXDYKqB
         fEoWzX8ljSrxIWZqn5/WzmKIoAbfghbLStzVLpHsZ3j8xGtQ6xEwuLCwffmIFZgaGrZK
         SLF88zKnEM1o9FDRDdBm3S2Y4gBRos+uyvT3Ac7BphGQ3BTWr+YzCMg/sznf3mJGup1b
         dME8omx9UQOj1OHnLEkDQ74lu81q/lSqGgzpvO5xw9JoLn12p6mo7SREHbkmLezUO7gS
         /NUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiW/qbTPjZmwGr2hJocPHsM46h5itE5rbhgkSGRGiVPLCTEtV8l6qg2Bp7lXKyo4tcfDb6CmhH91QC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv12VcEKQdThvRGG+at1vW9ziWCMfMGCJlEPty+OluYrpd2ZTb
	5ugmilc+qjoKggQEVrRMk04NwJqIfGEIKEupprjFa9glu96j7PcoQFTeM1gFVbw0eQQ6eREj4yi
	6ILJh9CxwX/eM9pLHxQjkUQCaLW/UUR73CZCTrlgERxJsuaMkHXBowzz7Md+nmHQ9
X-Gm-Gg: AfdE7ck1Gj5t8sdroN7N/Ah9EWOoQEh/sJNnlSGCnIua7V1vl/IJeBzN8S3yggzf5e2
	Ku9NPX8tdmsA8xIi1d0zTdFZsg9Chjw7OrZXb1PF3cuklGy8CHwm5TJrFrLSFjkDmfWSX3s6K6X
	sNKA5Dij0FcPQmYCnXgdpSEFGvs8UT4V627WGK6tHjhlV3ywNVRk+PV9nQ9NfuheSx9RbpYZbwg
	YYkbF9e7+qwF4luQbNa5rzuGoElvYd11xmC8ZmDV8y8mqR9q1bJD65lo2kYEjuqV3LbQdkkk33P
	bzQya2MX1AR/unHaaxnaWZABAZN2apraIg5IVwjwBD8Fh+9u7n5XdY8iA0HGwRHcxxwhe4DZD8I
	Pp5ynKc1buxXX09nHfMx2Wp+Zf8qJbpyIxPlrUEMk
X-Received: by 2002:a05:622a:104:b0:51c:7b12:6006 with SMTP id d75a77b69052e-51cbf30e6camr75201051cf.82.1783941303176;
        Mon, 13 Jul 2026 04:15:03 -0700 (PDT)
X-Received: by 2002:a05:622a:104:b0:51c:7b12:6006 with SMTP id d75a77b69052e-51cbf30e6camr75200691cf.82.1783941302732;
        Mon, 13 Jul 2026 04:15:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82323160f8f.33.2026.07.13.04.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/5] software node: provide support for fw_devlink
Date: Mon, 13 Jul 2026 13:14:43 +0200
Message-Id: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPIVGoC/3XNSw6CMBCA4auQri2ZPnjUlfcwLqAdtBGoUi0aw
 t0txkQXuJnkn2S+mYjHwaIn22QiAwbrretjyE1C9Knqj0itiU048BxyUNSPvTNIm5EaDK3tz1Q
 bXRotMdO1JPHuMmBjH29zf4h9sv7mhuf7RWDL9qPxNS0wCrRWAFlZS1YKtXPep9d71WrXdWkcZ
 EED/0IF5GsQj1AjVA3KZMAY/wOJH4jBGiQipJRoBCsLiRJWoHmeXwt6wtlLAQAA
X-Change-ID: 20260609-swnode-fw-devlink-cdc8dc4e5cb4
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4372;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YLnhAMXI4o2AsIjbEgigSwyf7yABdblIj2hdQJTPptk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVMiqQid0Q77ftt1lnoC6AM0NHBQVBZBRas2nb
 kbjd9hnRGyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTIqgAKCRAFnS7L/zaE
 w8/9EACFncG4910BjZ31n/U8MxKfQwUv+GZn7nwtooUkAcwEPTFPdD/bwKBS5i81q2UWPuk4tIX
 56LdGr431fUNNlFuX7qcFZk/HnUI6ppxkURqLuX3RLVkyT9zxFxHU+rIFk+A/HeRF+Cla3HXqeU
 8N6ZaL3Wa/LSS2oQKsq2EsygnuN7E3i748qv73XVCGXul/pyCXW/lC++Wm7F1GnKcx4Wj5KCm2U
 syY7amtwjdPnMb1kmCbD6VuRS1pODWnjamBmedP/FNdrVy/DKxWE12JFQoTsYunsiw4SPHoU6kI
 FvazB3sFh2O8mfr+V83v60GAKZr7N3I7rIXZ4K7kYj6zi7lB/cosNlat6MZR/JwbAxKVLfs8x25
 6BvMaXMjqtQYPKYkN+WjdS4BMewdSpIwrwm2Di1vMUuAbpsizSG6TdUNw/b/reOwFbP9s/1z+vu
 2qabxUx0ihiV16OyGagUBcOX+eQf6qwFzBvslWqOgc/Kkj9zAM7A16y1UfE48YeuMPJh4SsIoIz
 zKNBZX70gwt3NRqYTH8XVh0hIvFi//oupq00M0L/MsxBiQbSDbmde1FKdlgqP9aMIjmsCxqEApL
 lqKiM3YBT0smgDhi61VPttJ3gnjwlRU2BcuMTfNc9rScViwpcnSLCyJOn0as59XEY+MXBLxpSw9
 TcP8ezoyYFLe0uQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54c8b7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=391ekyBddxe_bKEp6ckA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX3Z66QWGh9M2D
 TpYh79FTdmgfswcOv272u82r3JShdkb/7h3n2ip3ItSvVmdixLcd1dUstOiGUb6ZeQMRUYBdscz
 Ccf+zVS8gpxEKvnfMbKm1DMRMb+9his=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfXytP5SjGtbI2S
 YUoEjUbWJv/BzULH01Rb0iEs91xjDvb4EAT7U5DBI7f7y2nVi4YpetoBQ/ypyY7bkcwJQ28/V0s
 ysnvQ5P76Z4f2PrFkneszRHsdHkQcj3W2WU9F7Z56DtN1oryZSjckqnnrbJwOUSt1bV05ILMSCq
 rOj59TUjwgGsAXCxyfE/n9K1iHi/vZJSDbsEQf3ILeAx+fNJAnjZ3O04wyPjhKZU3GGw9Pb5na6
 etK1ZcIwvFZ1Pw1f14t8K7hmxMRXZ6ssUb41nTNlJn4cgu+gbuS8MfAKssHyePABxso8BzqJnrL
 EtsZARZNfIb+QymI45AcXtj46Mpgy4lWbvbX9mDpaeyI5ay6KVfZNQzBXep3umHUd3S10EC+eti
 1s9nj6iu6ZzadaI/LoOyDOpEP1IkLYduO81zdShiOSjhkpXNukZA5PtvzuNWjpxsEgSFlWzGiHF
 KSEpnQhvDV3zZ7IYBrQ==
X-Proofpoint-ORIG-GUID: tpG7oNZuijepa2S_r67nQ2or6C-w0_0m
X-Proofpoint-GUID: tpG7oNZuijepa2S_r67nQ2or6C-w0_0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39967-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8442A74A418

Currently only devicetree systems have their devices' probe ordered
against their suppliers automatically by fw_devlink. Software nodes have
lately been used extensively treewide to describe references to resource
suppliers: most notably, the GPIO subsystem uses it in many places. Now
that the conversion of "dangling" GPIO chip software nodes to using real
links is almost done, it makes sense to ensure no needless probe
deferrals by implementing the add_links() callback from the fwnode
interface.

This series extends software node support to use fw_devlink and adds test
coverage for the new behaviour.

Patch 1 adds new kunit helpers that will be used later on for test
cases.

Patch 2 implements software_node_add_links() modelled on
of_fwnode_add_links(): for every reference property it resolves the
supplier and links to it. There's no allowlist like in DT - a software
node only carries a reference when its author explicitly wants one, so
every reference is an intentional supplier dependency. Graph
"remote-endpoint" references, unregistered supplier software nodes and
self-references are skipped. It also mirrors the device pointer onto a
secondary software node so fw_devlink can find the supplier device, and
purges the fwnode links on release.

Patches 3 and 5 add the tests: a kunit suite for the add_links() op
itself and GPIO tests for a real-life use-case: a GPIO consumer
referencing its provider via a software node.

Patch 4 proposes to add myself as a reviewer of software nodes.

Caveats: a supplier software node must be registered before the consumer
device is added, If the swnode is registered after the consumer was added,
add_links() has already run and set FWNODE_FLAG_LINKS_ADDED, so the late
supplier is missed. Graph/remote- endpoint ordering is left out for now as
well as there are no known users.

Merging strategy: with an Ack from Kunit maintainers, the entire series
can go through the driver core tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Extend patch 1 with an additional kunit helper:
  kunit_device_add_software_node() and use it in patch 3/5 to fix the
  release ordering
- Fix a memory leak in GPIO test cases pointed out by Danilo
- Fix more possible device_link_mq races: extend the coverage of
  device_link_wait_removal()
- Link to v3: https://patch.msgid.link/20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com

Changes in v3:
- Use device_match_fwnode() where applicable
- Fix a race between the actions on the device_link_mq and the GPIO
  test cases' swnode management
- Link to v2: https://patch.msgid.link/20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com

Changes in v2:
- Use loop-local variables where applicable
- Reformat a long comment
- Keep trailing commas on array initializations which may potentially be
  extended in the future
- Add missing headers
- Update MAINTAINERS in commit adding a new file
- Initialize arrays at declaration
- Fix signedness of ints where needed
- Remove unneeded DISABLE_STRUCTLEAK_PLUGIN switch for swnode tests
- Link to v1: https://patch.msgid.link/20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      kunit: provide a set of fwnode-oriented helpers
      software node: add fw_devlink support
      software node: add kunit tests for fw_devlink support
      MAINTAINERS: add myself as reviewer of software node support
      gpio: kunit: add test cases verifying swnode devlink support

 MAINTAINERS                             |   2 +
 drivers/base/swnode.c                   |  79 ++++++++
 drivers/base/test/Kconfig               |   5 +
 drivers/base/test/Makefile              |   2 +
 drivers/base/test/swnode-devlink-test.c | 337 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 291 ++++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  29 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 146 ++++++++++++++
 9 files changed, 885 insertions(+), 7 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


