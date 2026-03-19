Return-Path: <linux-gpio+bounces-33836-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODddM2EjvGkptQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33836-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:25:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F562CEC24
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D47FF32D7A03
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 16:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437E73ECBCE;
	Thu, 19 Mar 2026 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ae5QsglD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duiKaGc2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1F3E9F73
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936681; cv=none; b=TKChhZv8xPt4U9IzjiK6DBWwMxw2ZDZ811ZMdrhVYK6A2eofp3reakfa3waHzzTGlBEa3f6CxgB/9teQQAwknREN1kOrLe7exdVgtaN+hyVrLjjniY0NfVHnjln5eOXjwpkAPfMe1LbyCMC/W6Guk+jh06ftcfGgts55r/7gtW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936681; c=relaxed/simple;
	bh=I67SAyES6GkHk6EVmG3C77aUXjElzOIeuDKZj/y0SCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skTjCNNM2MagXBx1fh6ZVRiRhm514zEuOrE2f+494UF3aP5ST3dlUdC5tJp8A4MXvz6iEKNSPHNDTNr7R5Q5RJa0G2uKVNfRDuv6pawlT7cbPC4ETZJhzkuoNY4eGnfNNvvG+iGWT1y+GjfDkuOqDHltHQDeTSagtypGwafNFwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ae5QsglD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duiKaGc2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEW4E62981410
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Q2GuadJ1cZYo7UfUMdzhOmnFdwm/5ltCsFBL4t2bdA=; b=ae5QsglDralovOmD
	W5BRrJob800EW4J5Bt5TPADNJHwm8d2oyEvwFqJxsT9PUob2yE0sKM9XBR9pwVgr
	IfBWroO0UjmT9RkVroOoXZh4CUeHNYycPWa1dFhld3gKgp/a9UYOlRan2duw+sQx
	qW+ITL3H+6bMORwRf6H36U54tJGyW8TqfGjxZzTidAP6ffk+K71pRicZfDl+WsZr
	9rEINrGjWTKYVVLilGUDZ+7G9/kQOscZskXHGvqg7AwFh+iaJRfLQDPwgp+A86KB
	OGVfWyaCuYBlyfa1HIWa2LdKXCZrKKVdbD63RhUoOFEfv84AwN6e17mKuWksiocj
	TYULhQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k080bn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:11:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffa389eba3so1730302137.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773936676; x=1774541476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q2GuadJ1cZYo7UfUMdzhOmnFdwm/5ltCsFBL4t2bdA=;
        b=duiKaGc2jqJKJsguBVKGerzYGwgpe0IbfJK8UwyjnpBifwaBJVGv9WwhfND3XMwI9G
         47WYThcUtU1111sbCSXXL8vVGE6/xvayPOTR6w4Fn+FHMMbcKQmuuFeQ3p50hL0sQ2wY
         MFLjpErHTIbmXnbGibg2ayF5RFmH36+Iz/JfCK+CeI55pdNTZiYEjvC99YYqpFdx+h7Z
         mrnNELN1l9A5ykNvc+1ZDVbFsJQAYbyfjC42tUCqAStA+Stc67OoMZXNa2DTYY1Vdi/z
         ZIu0PUri/Cwj0u7JCSCsUbupk61tE7TGFC+88lFL2CgFI8lktcc4RLo97lz7JViM93Do
         7Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936676; x=1774541476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Q2GuadJ1cZYo7UfUMdzhOmnFdwm/5ltCsFBL4t2bdA=;
        b=YSLc03H38O3ke+48LeaEKMTABNd78ZsTveBL3Uz96HNcxe/3/FK1IUkd1Zf32ts+b9
         m99VnA63rS2QWFk2d1NCF3Hbgq35TgQBUtHFFZPRtq8OpcoR2Lm2tgduCMU6ifykwf2P
         2a2IvlEXQyFLMrNTysRp7n1Axr76zDVoom8Ej+9Wq+irYTHO0aCqPPw7VrSdzilFlCCx
         WkKts3r5H3iMG6TmtwLSo+MDxDHJ9nhYPX/d6Mwd+xY9QX7qpXAlen8SDN4UnKUVDAsE
         QzGvKlZUs0aT/9+3P2X9T747jme5510gdVZgV0JblXSVdB+zxPo2lrDNWw5RCDL+8tWq
         tP+A==
X-Forwarded-Encrypted: i=1; AJvYcCXtvKB3TeESIV11xoeWrikcMYqHh/2LZJujuknrOrq2UFhBT2PXqI/E4mUvpfQhW6WLfr8yVqGcD43e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Ghu5G7sSY95EfVdBU7+Pt8qOI4kmxbLmtu3oFfitM4U3PY4p
	YAxJnTd60EUMYNJjHBt0kx+Ti+3LFouKEpREvxYBxBKq/B3AuEzvgJ+knTwvGwhJywzmD1wSSkl
	tUQL7Av1b7M+cphoVmrrIMiuxOn9uLHZ1Q9dXeLOdmFmrZLc8IPrv1SLCnq8rhKbm
X-Gm-Gg: ATEYQzyz+Hwra61PDLI63N6M2URUw8MN8+arm2q8EfE2jD3od1WnUEMinqa8XolP7bB
	yKSy/YOOs8YSHO0248sM8FQ1FJOSSSqlbGomED0EU3tXo6Dru+cfg7+mAk2wiWmLkUYL2cqZs1w
	QIrt/xdxKnWYt/BuIlALvzDRWBufNlAAFRWiDZxY1t+yqqBhTkw2EZkEoZVkQTl5gLLYJaN4Vu5
	w8COIoGJXvh+5v5/IIdAG+i9tjH8w0XnrsQaYxXsVIAA8C63hG5+eHIqTKSrR/xZDmQz6FCikF4
	eHlX7/dmuvMNhlHNtlMrpJTdW/MgA+DbdEinIcgXifNfoS2bssYEFquvcUynBw9vfet3hzGDwVZ
	Fh4WZ8rC8BZNeneml4XKIB3qc27qGg3m1WAxwTCOJoMmqBsfotwLk
X-Received: by 2002:a05:6102:578c:b0:5f9:3aaf:fa27 with SMTP id ada2fe7eead31-602aeac9366mr64407137.6.1773936675943;
        Thu, 19 Mar 2026 09:11:15 -0700 (PDT)
X-Received: by 2002:a05:6102:578c:b0:5f9:3aaf:fa27 with SMTP id ada2fe7eead31-602aeac9366mr64347137.6.1773936675430;
        Thu, 19 Mar 2026 09:11:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9d74:8015:408c:d719])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4e5495csm83756915e9.2.2026.03.19.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:11:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:10:56 +0100
Subject: [PATCH 3/4] pinctrl: intel: expose software nodes for cherryiew
 GPIO devices
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-baytrail-real-swnode-v1-3-75f2264ae49f@oss.qualcomm.com>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
In-Reply-To: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
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
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3561;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=I67SAyES6GkHk6EVmG3C77aUXjElzOIeuDKZj/y0SCw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpvCAXEnJzDyeXAAVMRIOFLd0zwqHan4F1WlNDA
 lZleC9Bf/OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabwgFwAKCRAFnS7L/zaE
 w7rKD/9ebc0m2OnjoRJCvYcI3h+8uUAgw8SmyXwbhEMtyuB22rwIi+20Uvm2hQC81KqwRrOLzFl
 nOhDRzRajq9qFORRtv4ZfkqGx5Rpushh9f4Rs766oexYU92ifOlerWTAjmVlrrCes3mR4qRHvoH
 JA9pz2ihldbfUK4rpJELslC3DWsnQOPc1ePChrZmjpxHmQqvkAsifhrRpAWZFoQx/v+H8ALtPr8
 I6nb6gg6gCADVrjIAOn1IUlH5BWubBZQvq5WoDtRlVRfAxGNcRXumvhWIKYUNL0Vtl5O0pS2G/W
 ZvBLUY2VkUuVjeoCNXVED2wUcfQx+ujYK+RCZ8NGVdvdkcyF7moB+Bc63mlvBoccTlMuWC/lmUY
 mv52A8XCMB3WBibL3H20AznahHrp7uiIeTL3u/bSJ04+lABriXB1B9tGDQyGbRfsnq3hHHRcEDw
 R4dl/iwlA6RUWMp6TDdgUQJJsqQfELHD/zfn7RMGiPHoMGznoxUkz/TmuA/W9L0SsFBZuk8S8eT
 aKQa63Tp+J4WCZFZnP5QdQI9nPvacHN3xJ4Apgf1/Y15kCVx8eo+wzR8P4zw/jVOrIc7jdf8K+w
 wSUR9ikK6ednoWiCSEAZzmSVkIDceM3m1Vtd/NK7QRfTvt9AYbtDWJaewQjMwLFPs8xgnylW9dW
 rG2r49dLtIW8VEQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=MYhhep/f c=1 sm=1 tr=0 ts=69bc2024 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nG9bRbd_0SKyiAKh2pMA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: sZyb88om45Kq3FpjT5iLjCKgLVE4k_zF
X-Proofpoint-GUID: sZyb88om45Kq3FpjT5iLjCKgLVE4k_zF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyOSBTYWx0ZWRfX1jVtHs4LgL6K
 tbJftddHQ8Drlfs5oueDQ7zfiaQQW98ycTCs5xD+aqyWMLr2A3Y/bjOzCFs2YEBT57jhnngr2OP
 95GzkcQXSfbTFyO0aeoxLhpOzYFU6sbUDNeMqkYJBHEdh7vqpvRtVzwoEBfQu4Pybe3zALi2yEc
 n5lpuoQBf8wun5rEFoxb1kD7acmqgKDiCuiw4Pwotaq+eIVr8hBJfRyIxjKWwbgldU4aJg6ds4M
 etjQBNGuCKgYKfVHblXaWy+GRBck8OvVOj7Jbs8y8vs7TUYkRytdH7EE1KZGKyltRd2dFYbF818
 klTBUrehAIM9P4o2SzQdTTYu73fvN4lTJ9TibkX3FAk7lcxwtDtowXTSR2Ioh8IgzQHQPBxDZFB
 lQTf4Um6bmzF9hrn/OmknMK8sm5U0t4DLDDO6keCPXmdFl365A030n0q7btOKWSp2kg1dqwm0pK
 GV36nhnKov3/xqLP8dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33836-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55F562CEC24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the new automatic secondary fwnode API to ensure that when the
cherryview pinctrl device is added to the platform bus, the static
software node provided for drivers not able to use ACPI will get
automatically assigned as the secondary fwnode of the primary ACPI node.

Update the existing intel.h header with new symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 47 +++++++++++++++++++++++++++++-
 include/linux/pinctrl/intel.h              |  5 ++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index a33eca5eafc44ee3337c4665967682404cb6ece0..45e52a796c8201c844127dbab497b4b3002930dc 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -21,6 +21,7 @@
 #include <linux/types.h>
 
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/intel.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -1769,15 +1770,59 @@ static struct platform_driver chv_pinctrl_driver = {
 	},
 };
 
+const struct software_node cherryview_gpio_node_00 = {
+	.name = "INT33FF:00",
+};
+EXPORT_SYMBOL_NS_GPL(cherryview_gpio_node_00, "PINCTRL_INTEL");
+
+const struct software_node cherryview_gpio_node_01 = {
+	.name = "INT33FF:01",
+};
+EXPORT_SYMBOL_NS_GPL(cherryview_gpio_node_01, "PINCTRL_INTEL");
+
+const struct software_node cherryview_gpio_node_02 = {
+	.name = "INT33FF:02",
+};
+EXPORT_SYMBOL_NS_GPL(cherryview_gpio_node_02, "PINCTRL_INTEL");
+
+const struct software_node cherryview_gpio_node_03 = {
+	.name = "INT33FF:03",
+};
+EXPORT_SYMBOL_NS_GPL(cherryview_gpio_node_03, "PINCTRL_INTEL");
+
+static const struct software_node *chv_gpio_node_group[] = {
+	&cherryview_gpio_node_00,
+	&cherryview_gpio_node_01,
+	&cherryview_gpio_node_02,
+	&cherryview_gpio_node_03,
+	NULL
+};
+
+static struct software_node_auto_secondary chv_auto_secondary = {
+	.node_group = chv_gpio_node_group,
+	.bus = &platform_bus_type,
+};
+
 static int __init chv_pinctrl_init(void)
 {
-	return platform_driver_register(&chv_pinctrl_driver);
+	int ret;
+
+	ret = software_node_register_auto_secondary(&chv_auto_secondary);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&chv_pinctrl_driver);
+	if (ret)
+		software_node_unregister_auto_secondary(&chv_auto_secondary);
+
+	return ret;
 }
 subsys_initcall(chv_pinctrl_init);
 
 static void __exit chv_pinctrl_exit(void)
 {
 	platform_driver_unregister(&chv_pinctrl_driver);
+	software_node_unregister_auto_secondary(&chv_auto_secondary);
 }
 module_exit(chv_pinctrl_exit);
 
diff --git a/include/linux/pinctrl/intel.h b/include/linux/pinctrl/intel.h
index d45f090adc1f532f866c98aeca144a4d83fa28f4..bd3e6ee8b15ebc492275a14ae6d53827b701f783 100644
--- a/include/linux/pinctrl/intel.h
+++ b/include/linux/pinctrl/intel.h
@@ -9,4 +9,9 @@ extern const struct software_node baytrail_gpio_node_00;
 extern const struct software_node baytrail_gpio_node_01;
 extern const struct software_node baytrail_gpio_node_02;
 
+extern const struct software_node cherryview_gpio_node_00;
+extern const struct software_node cherryview_gpio_node_01;
+extern const struct software_node cherryview_gpio_node_02;
+extern const struct software_node cherryview_gpio_node_03;
+
 #endif /* __LINUX_PINCTRL_INTEL_H */

-- 
2.47.3


