Return-Path: <linux-gpio+bounces-33325-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MADDjXis2ktcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33325-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:08:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D80EC28120A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEF5830FA89A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B338938C2B8;
	Fri, 13 Mar 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWzgrRHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLIG4Z8w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4336E38C2B0
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396306; cv=none; b=rDeLlSxI9LHGhLv0WsJhn7/xehNDZs8gdckhcxY2EpnXd1HjGW4ocFIatATi7a7mlDdq1jDrzJnCpsKIS2pBHjRX581hoIqfUpJdvxhhTgITA0dSQdHnMMGNtTgXY36Q+85YDd7xx05C7lnquyL+Py5eDd1kROZKHB7n+yVhKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396306; c=relaxed/simple;
	bh=plaGHYSGneHafzrcORRj5cbIEqusB8ovO+DJ9FFBZjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bSwpTSiJW/IW9hDEUUvpNgArBsDLrkT7jzIcTf2HcY1J6C/6XRzl1UBJ3xeOQeypxRUs8wir7cktNZo9PFSMtZ1r2aIf6PM2cxZtnsU5VKjZKc5gAijH2OaRpP2Ie5zp806cfGBwGj8ntfFeRfu54a2MoKI57U7jkV7t/9s8Oks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWzgrRHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLIG4Z8w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oS9Q793157
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+uH6MwUlKKV54kjZU1yW3q
	D/D7rBDvtFatAlx0NyPKY=; b=JWzgrRHZeAzkYY+wrCZzhgDGUDwjSmpKchClqJ
	XIPhp4oXTO9PWYD2xSi3kIiTC2IAYWEA2tlXbJDnZNkMDd1jKj2/ObNlyM3I9RJS
	5hhdleHugLlzLZydYir+L6Y8TE85ItwRdkf/MG4kUEROONZOF1fsdhUUaA+tQaXI
	QVCoz12GDHUXhpjbdESx2IgMloGgEt0E3uZHYpjWFs32yX5/VRwGQW5F+MmL9qCC
	OODtDlH6EorqeHMLATvYwdSTl8nP1gK5PsgrBFsje5o1wp3q99ubN6s3itfi3a5q
	ZB/dJ7LOwIqAcd0H8Sx5wHYHq5ZWPem6Kk53U/9bH9q7CT1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt0qbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:05:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd83cfb36cso1393665785a.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396302; x=1774001102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+uH6MwUlKKV54kjZU1yW3qD/D7rBDvtFatAlx0NyPKY=;
        b=FLIG4Z8wC9IFp4AZrm4U9mKBnmN7TVWcHpFMq39vfCz928m6N+PpRKuQDq/da3FgDg
         IKvGOtOtHQE4r9GWvkxTUfaFMbB0E0CbLqH58qKXCEwcJ8VDENDReUFOMVzBsQDc1Mn7
         lfv2JSWT5tCXg6PZ1SH3NP3voHspF8+RhvKafu10E/q1TAMJDbqZUsfB+mjqL5FtpvzO
         SSyGXKrJAFwnNzqjbLryZFvq0cPgOGw7ODfjpZmJ5b/i7ZpZ4zRrpb+7Aw0leZ2EoaH0
         ZX4B6NmFSAmQ2YIZweQWx6KFr6NoCiVPNSZe8bFEeumBgNPV/BITsuEryziUWDZwn7Hs
         wBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396302; x=1774001102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uH6MwUlKKV54kjZU1yW3qD/D7rBDvtFatAlx0NyPKY=;
        b=ZpJJdqXdvE1zK/2d0VIovIlP/RqzlAxRyR7NLCXQotvTQKOXyqYfQkorv3l59jAh0X
         C/C12aRibwga6/rwzes4TSkEFfwi3Yqy2YGUEzEooS145CB5wR4f/HxaGGRCzTS0lCb+
         V0nCLETAqSHFEf3xi/sPftgFgIzRODFIR3DKziMWd86bPh29HA8qaIX4zm7uUUW5qPvK
         YXtrhSR2W90tCTCmloICUgrXiQJK45ujoUqKV7E8TnjWE6Vql3Xgrb5rTtvicR4Rw7kf
         u+e9usYGxlOVScmaOYMWWyJ2e0XPANv8WYVbPpb8S8uNbRFn9QS1gcMRvJ/qVmEB5ubp
         kWNg==
X-Forwarded-Encrypted: i=1; AJvYcCUV65hfiWUMC+uz+rMYkKOrKLHuIJkOx6CKR0946n4V2dFu4HF/wL6m4D372zL46813kCyxtXCriQPt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/IsqOaMcacF+m6e0tXLfZwCsrKnUZiRg2Ioh44CCDsjYfEF2z
	jVcx0q9wuZTI/LnfII2QTBiPznb/59HIJMMntw0kF6BAksjS5M4hQZC1tNewaK8F/LoI2vAz/PY
	vhEN1+tRH57wFYf1XAqdbmox2jUWvDS4YUrKqQxWbytOKeJ28Vhxw1xHShkEWYrvj
X-Gm-Gg: ATEYQzwACWjSzsVhvQbk6W8qYLIvbrVWcFAs7JIk/43aGQ8OUrJk31b8qQ9IlhhqPXr
	ZfvMi+2KasLTWMpkFo3vugaBQ16RPRWLwmNLq5uzzMakuQpAMqeboLKazo3/Z8Rc5RpYWSErdU+
	h6BLKt7WGw4CwCcRrTq6lZdTzQ1qzLiL1XzFTuFDt31lPQLCHa9QAZgpGdibvajLZ3g19QE2cCo
	yABRu194nj3fLhM+r6RrbKLz0YtlLX+9XWa5BLkvaZpqLQEd0HZSuWM9Z3w83L6U2KYEq+MgiiU
	CTZ7Jur5G8P9zciXsj7yysGeQgyyr47OFSbj9DD/D1iXsOJFVhR6uxiovsggUkNO3bwLefhqcbA
	T34O97az74N/OJb3i/E1VqCWH4XYMpfRT/9Xs52tqjbljrUsSypv4
X-Received: by 2002:a05:620a:44ce:b0:8cd:95b4:c530 with SMTP id af79cd13be357-8cdb5b4d2e7mr344909585a.52.1773396302261;
        Fri, 13 Mar 2026 03:05:02 -0700 (PDT)
X-Received: by 2002:a05:620a:44ce:b0:8cd:95b4:c530 with SMTP id af79cd13be357-8cdb5b4d2e7mr344906085a.52.1773396301765;
        Fri, 13 Mar 2026 03:05:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:840f:d4e5:5fc0:62f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm194215785e9.3.2026.03.13.03.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:05:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] gpio: timberdale: remove platform data header
Date: Fri, 13 Mar 2026 11:04:47 +0100
Message-Id: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/hs2kC/x3MQQqAIBBA0avErBvQzKCuEi0spxooDY0KwrsnL
 d/i/xciBaYIXfFCoIsje5chywKm1biFkG02VKJqhJIKl4M9nryPFKzZCOPtvCUUapRGtLVWuoU
 cH4Fmfv5xP6T0Adf9hlpoAAAA
X-Change-ID: 20260313-gpio-timberdale-swnode-03b1a0945359
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=plaGHYSGneHafzrcORRj5cbIEqusB8ovO+DJ9FFBZjE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBps+FE2U8TMU6TkUUmY2hDVXCZplC2Sk9+oeyNy
 4LtMpQeC+KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabPhRAAKCRAFnS7L/zaE
 w+raD/9/ZFQM/V+skpgjtgSMJsPoSq0Ok0eozSbd3BGfSrgetlvrzTff/6y+vMYW/vIN8TL3YvU
 98gDLwOZCzSBhWHugFxUNNQXTq5cSYnGUoNMUAyB2TYe/zAbhpZ60uSggm1YJB1hexpw8XcsIm3
 IMWBHtxVPpWb+GNKA4oOdbN7f5IM0oqMMGPXFPZxB/RX4/pPh7DNuzAhcSeRO2K4fzrsco5Bbzn
 3DQejM4FrVTApXwTYwEDCEI2j6QymY/9EYjHK/8KBCjAEY10zGrmucix9MFC9BPsuNPLHyFD6NW
 hkweeTHc6rikNZtvXr9AvM81IV0WkdjzelVbKpSlikDQpqeLVZjUToCyE1xEVx3hapBDajA2L3s
 tElt8eJzSuv1y5zByE2pl1I6FCoCKf+o78u9cJmWEqVxIm5rYPwXDfmLHmRn75owalsddfPk0y8
 d8hjFeNedWJ0AUboQP+TAU3AoI2sztoJ41F8QQdmNkXFY7v6sAdGX3ZMBIWprmUVbm5AmxdQ+ST
 P5CUXPz0kI2vT+d1wTbVyFp3NESx7H8Xgw/VkcbFWq9Nwtb9pN95OO8SjUtmjUKc9qb9u4TBdXp
 oNZ429Wuzwawx74vj8uca8irkyP/+h3aaTRQTXsJ5IIIoKCY2ERxNY6/eyr22S5GGYtcFfGkvY7
 BQfcQfk5fUdLNvw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3e14f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=p6-fBqgG8KB4fA7HuiEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Gj45vCFGvH96kla0GGVjoHRJ1gsm8u44
X-Proofpoint-ORIG-GUID: Gj45vCFGvH96kla0GGVjoHRJ1gsm8u44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX2MZ8SBjWCgOJ
 xQyOmtHwTCZHkPVL6t454HhE74kh+2hqjj52wTj7DcyDdi9iy5gEvdpVlsqd6DiE5ST5nwZWC/4
 2WHmula0YBVD6FNbpq788SO1MBUGd4t1yPZNhPt86N5rU4eIQl3QeEw/JeVNzZUw9QlUP8iSkr0
 /6oQcHYXUakcv01OVXNnzacXA69uQNYEy8RRU2A/Vj/vveXS+7Aklp8vpEtgNwdRQZlIPMBAwXO
 OvDYMbOTNtzGVA3O0OC9pYEHngx5Y54vd2AI0/jRw5GSPXNoD2jEdBTNIgRBTSby83XzCXA0Z4l
 dyr1cRWGPscodnFBjgCT/cDROscBWXzWqNuawDZQa1u69ibVSN5IN//JvjLbl/wEmayBsGJmLGz
 US/JwnGtAQiLen8HwLTTx5Bl6yXu5p7+oPETWyYnM/1xVB4jpELA8AX7GQhW1ITbrgLp/NpLkgj
 2rVLlGJlzD5jGqgXnBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33325-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D80EC28120A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are several GPIO driver header scattered directly under
include/linux/. I'd like to either remove them or move then under
include/linux/gpio/. In case of gpio-timberdale, the platform data
struct can be replaced with generic device properties. This series does
that. It can go either though the MFD tree or GPIO with an Ack from Lee.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      mfd: timberdale: set up a software node for the GPIO cell
      gpio: timberdale: use device properties
      gpio: timberdale: remove platform data header

 drivers/gpio/gpio-timberdale.c | 26 +++++++++++++-------------
 drivers/mfd/timberdale.c       | 29 ++++++++++++++---------------
 include/linux/timb_gpio.h      | 25 -------------------------
 3 files changed, 27 insertions(+), 53 deletions(-)
---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260313-gpio-timberdale-swnode-03b1a0945359

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


