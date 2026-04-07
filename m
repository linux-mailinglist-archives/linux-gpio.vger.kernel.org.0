Return-Path: <linux-gpio+bounces-34812-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KTwL+oG1WnbzgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34812-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:30:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC43AF236
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D051B302C5EC
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 13:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3CC3B895F;
	Tue,  7 Apr 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNC+pgOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2w3wvpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605F43B8937
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568499; cv=none; b=Je2SvQLIjleBIzHucoo3uavYJAdJowJ+tUBPzyGBbmym3mGOxaMnb68NA2v7L0D6oao5KcBe89u8mXYZ+zXjtGf2neitQUw90TQzMdfMhxnNUTIb6/Vy1cIu/FmlyKB3OuMcJ5EKDSp65opAbXzFVbr4UktsI2W80u9iyD1cKLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568499; c=relaxed/simple;
	bh=OEfrFqY10EtQxTVjSrDWnxKhZ0dRAZ0uYSNJWN47ZEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OL9d+B7fYuYhOyaq65wYkusq4b+iggxXEw/aICCoL7lLxhNWndh5xX+Vcu9KfJune3r06g86iMEfzRBv8YsHyyNL/+e+2dep/BG1f/OaUZ2rV2SguZHXBoOCdu/+h6khGpvA3X8UTndsW7okgD3nZ6GkJ0lG5bwIFjNqUUONFic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNC+pgOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2w3wvpm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637ConAe3402629
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 13:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5c8MEzhdr4cVa+dIv0sfjNJqngruD2IfC4W4N4aSpw=; b=eNC+pgODrXDdH9Nx
	6RcG9TXWfqCBBPfRmXbLWe6K50yACYkK83ngffbftT1gbltBVuaqcCK62uNdKOnq
	lnCoy8W81mSLY10LxTEBCoZupcilNsSmOb4yUf1iAMikF4mQpAcpAGjL8Vyoj7ak
	TDz+LOjlXEIrcWi6dYaxQDZN9dC616vistiEWhQBaw0ca+z4Q0kzh0PxSF/g9Nj1
	LgY0hoYH2ancptfm9mBkj6NSTXQ827XG1kGX6gLWDwWqveZV7tln1+L17DGUEw4R
	L62F/NjISBK/H/RMVZQ419XCWK4Zc+PZMX/EOkdtiheogulxgPTPVXlbwNoW9rnW
	YooYuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhtvaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 13:28:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da31af14cso20155451cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568496; x=1776173296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5c8MEzhdr4cVa+dIv0sfjNJqngruD2IfC4W4N4aSpw=;
        b=K2w3wvpmeV8hzKi5sTUWoRfJuSTdCiydlRzFkqj/mb+XBF2S1woecmUxK4DKGYx1s8
         R3qz46fHRPxEqXKTOD8yzHWxB2jXRlZZhugdd1wIFKpeO/wnqsCuRxnX0mhz03YDzv3I
         Qk3S2zHK0up2oGWV0UkfLIE0oFIXAefpao00oI93Ob/pIhUdVpAHeNhv2cTZO4RD479g
         Svo7nM9HkV2NlfK5ZBQC+iOsNsj0D5m97MRnByscKZ/7X7dB/brjDNKhVut7X94JpiR8
         rXDUpvNyyiRTSMinm5XrE8+qckPdbQ2WgW3s/g7zTMZREUmVtzUgBELWuQNYunU+hNoE
         Hw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568496; x=1776173296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w5c8MEzhdr4cVa+dIv0sfjNJqngruD2IfC4W4N4aSpw=;
        b=DJ6BCwqMM7wSb0lLjO/y9xkqH1E4INXvhcTZYt+MS0P4QjPS4LyW2aauvjAkn91Lht
         aeA1u7ey9v2B3cER1Z7QLJeOeCe7VnGTF2DGAbcW+4ZRHejR8lqi3BSv8ousGypTgU3Y
         UEkrbaAaBqrtuKEPbTrlFjshf394roNftLKZwXFOJ86o9ayTX810DlvzlAIDtasekP2b
         1HhlC6dPo11qvAnZwQf/BIw0UozeXZmZL9/4/yLXpfbQEk5IA9wclg6XijFI9xWFoif/
         QL0QbEiL4bATIVWlNu61Ndc4wmODA2S6Y5wXRzx02B5RFUhbyX47z7OWwZB0OCswgu6g
         soQg==
X-Forwarded-Encrypted: i=1; AJvYcCUX3FYbJYku/I8wyKdrIJjFpgYnbprqu/TY2eyGvz/OfqCAv2i/fnwyChlaMM3mcalJDQFtUr7IO+3n@vger.kernel.org
X-Gm-Message-State: AOJu0YxrHPQDU/yJtr3qlhSWf4fX2c3chpJsfe/2xcxfP5K/MNGZe1Gs
	WumJEDHEFLtWlDaIJqzSkbH3819BYBrEcgWIV1Zd2zPMEI2cpWs0VoL+RVwdAF0LQ+9QtyL3CEP
	N5AC06PtamN8HkRO8LyGBci7tFAmgADbGZhV8COuj/LFlFiQduxyhOtxGEBz11ZTN
X-Gm-Gg: AeBDievqtl2zkTLRiEkFG4WqbINdWNQJ70bU9jhj3U6XzH8jSNsD+2RGH2IowRc/vMA
	4qah0RN36Qp4EzziBOmkUoDE+19c8FcqmjWaznaQulst/sC6r/ZQSCCDaJXvzm/OfNKaEjx8mOe
	Ce/3FY7ptGJt6l6xgSSgIxudrBIxbj5kMfufGAp4sRkRxMOIBBVd3Wjx5H5oGsD4yxq2tEHoalz
	Yau+tdnTv+1jPflFxkXMa5adV5jL6BWY3ArG5LWjaB5LN/4pPPWD7ufBEX3XjRjsRyadUSmgvPO
	qm8StTlQADWbEBAOEXiaSAWHPFxtz69JNfsPZ8nkBMEqqInRG+ZveGSL76VaU+XiY9/v0DRP6Lc
	Hb+Zt9b6aNTz9vWVDsJf1gNXYN+n8ATjXBd90C9J6Ju7rsLH41ZM=
X-Received: by 2002:a05:622a:4c8c:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50d82bcd411mr164477331cf.25.1775568496507;
        Tue, 07 Apr 2026 06:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8c:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50d82bcd411mr164476841cf.25.1775568496031;
        Tue, 07 Apr 2026 06:28:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccd2dsm4073807e87.67.2026.04.07.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:28:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:27:58 +0200
Subject: [PATCH v4 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-swnode-unreg-retcode-v4-2-1b2f0725eb9c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OEfrFqY10EtQxTVjSrDWnxKhZ0dRAZ0uYSNJWN47ZEI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1QZlY5tTT9u7707SEUVxT4SUMKUdcSw8KweqE
 EqfOSvq9SOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadUGZQAKCRAFnS7L/zaE
 w86YD/0bskC9HEQp6u4n9iE5eHUdzj88nnBi8+E7bXgshffGQMjUkgQdC9LsraAR7ZsNIUUGMfv
 mvyn6HMSeU33eudv9g5ep7QGJlH7QPQKNgjTfhoJ55Ii/WHa+PVdzVESRDAGN7O7t58rW6SQDCy
 VngmqBnhvIg7oYlJPcbvJBqKJJNSidTDhk+DfHNvZnq2/mCsJGUDkUyglz5Q1WfT/CW3155Fz1U
 YBb0S+u+QMxbWG0Eh3MGovvhyGq3+0DpdQ6/i4N7f9jKcpyVLh1IhJvlyesswqzUH5S2wSpb859
 dcsgdTChI0yPEbV6K/lamQ1iC5MjvUZFciAYeApzYOwOzb8z0OT3RbFZDoWcFkUve/oJRYqpMaz
 nDSV/KCKDiH6Vq3EeO+2X47tjMrodSWhRAa/QTN3/hcl3ib3krTHyKhxIg9XdYq7ZI91ZRrSiio
 ra7IEuNGp9Pjhkc1RZlvf4UrRpoj5zX8uQ/R/OxTPro3H8m66SB1XJKtoCx8vdIfeYUEhvm3Vhj
 iqGRkBiquItARHAjuCPajV2OLCh7QSlf/fwQjwwxR0P3a5K/NX1rkEiDE8gwYX1WHVXbQLUHas9
 xO/ORkmqRvMAefGJztED0ifhQ420kzAkia2kShoCRRAFD9ukWUc3cJTzD4Ut3lrpfAlhES5bHA8
 3tPRAH2wrClAw4A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX7xdv6WUuUiEH
 yQF9If5BGe3fA2/XF1GR0C4DX7Ds7QfGGQvtLWik54cm0FV3tJdSF0UyXB9/RGAy22G4OQ/PfBW
 N21E0OWOC/8pNYEvykMTsBdbuVLLsBhQERLGiyf/s/m+LmNCUcwIvCstYIpTlXLcFW+5ntqtu7p
 8Qwn24ndUoX1y2uRYpkPAdQQxvpLbzRQ3wXpKL6Hg1N4/gPo+edAr9zMwmDGJvBqzMh6gGZluGE
 A4h8orlNyyQOjtH5kYLJSa8rXqaqJjZ4g4ETVj7Gs+Zu3xQGwfJKKWh6N1o+YKjhp45OEpV83xC
 TNdZFnlZZtCcQWluAz2UG/MRC+9H0Tyeg1H9h4WvxhJlTnYmirOQBqDqosfTMrkrV3q3j7Rw6eM
 Tp3lPqKSTepio/2/C9hVb1jSjgAsYT1LveCDdP0n4Rsvo649LG5Y0LQ0ZPYDuySaHJP48GP+K9C
 b1Y6UEdGZQFG8QVgsIw==
X-Proofpoint-GUID: AHQKsuWCQJtZwtcEdumMiSd570yg3qs2
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d50671 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=H5P8rdbTNIBZEmRUth0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: AHQKsuWCQJtZwtcEdumMiSd570yg3qs2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34812-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: A3EC43AF236
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fwnode_property_get_reference_args() now returns -ENOTCONN when called
on a software node referencing another software node which has not yet
been registered as a firmware node. It makes sense to defer probe in this
situation as the node will most likely be registered later on and we'll
be able to resolve the reference eventually. Change the behavior of
swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
resolution returns -ENOTCONN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4bee0cf1bbdaa8b7b8ae4cd5de581..4374067f621ed782a7e1549f7b0b7e44eac04930 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -93,6 +93,14 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 		ret = swnode_gpio_get_reference(fwnode, propname, idx, &args);
 		if (ret == 0)
 			break;
+		if (ret == -ENOTCONN)
+			/*
+			 * -ENOTCONN for a software node reference lookup means
+			 *  that a remote struct software_node exists but has
+			 *  not yet been registered as a firmware node. Defer
+			 *  until this happens.
+			 */
+			return ERR_PTR(-EPROBE_DEFER);
 	}
 	if (ret) {
 		pr_debug("%s: can't parse '%s' property of node '%pfwP[%d]'\n",

-- 
2.47.3


