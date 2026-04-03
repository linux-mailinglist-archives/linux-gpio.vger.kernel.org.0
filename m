Return-Path: <linux-gpio+bounces-34652-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wET7BAT6z2nM2AYAu9opvQ
	(envelope-from <linux-gpio+bounces-34652-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 19:33:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 00924397053
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 19:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0110300C38B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 17:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1772192F4;
	Fri,  3 Apr 2026 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="at2SJ6nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KN1j6/XE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F332C322A1C
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237630; cv=none; b=KSFCDnoTYdi8Ifm8HjGIW6EZ9+a0d1i+ePeI/O3nPq3o8WnlNrBIo3NDipEKdQkDow3jaZTrLj3G4tiHs1+LnJnkcCTRCVCm9IxyARe8HjP468k/jKCMUMLfoAElZD7GWBzGZClmvi5YT7giW5ZUGfYFVcBInEgIF5InFk5Yw5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237630; c=relaxed/simple;
	bh=lquwIt3pxmUHrqV0hylBWdUZ9FzuojFhb4iwrjx2pmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IQwPEzjVqWPRS/cuh85aMWRSO1Ruaza6LUW8ISEGsOrC+kQ0GaAtPD208Tm9SopnH+5OgQfxRpdCznlY/r8YIMiwzP87iZ5/d1xcmYT7V3WpIXFD4YE3J3SQy7CmHN3RKB597JiwUKInv3F8O7mAAzwDbLrX2FKQRFENEPbCARc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=at2SJ6nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KN1j6/XE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1eBD1453490
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 17:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WhdmUQMs0c12v3Jvg9TgqF
	jhlSe7hCaVqUcHAfWSqgE=; b=at2SJ6nbgXLGzolnsKGvZCjdDEWefMJ7i4Dpv3
	bybqmytK2vg4v876pkVJOa2bZrGAv4MKclN4uMMtGxwh91oQzbsxDNGRa58/VhS4
	BbrQHyLuDD9yXqWFj5febnt7YArMUMX0/xI284Dp380kkwM03/Qf6kPZTK/WGJ2Q
	jSGPB6O8ahVFfm7/WUaV+PCtjGKPAbeRc3BSnNMxGkVIFs7T61AaXwjxsJuWs3oF
	C9QFkl+QYZqn68jv6wXoGn5AfPAl3t/8q62uhJbuusZHA56HyP/moH+g0UJB7Me4
	EZOlYrvN5KRap8GkrICEUQ0KYSb2ghDrdOPvBRjLpVfRQw3A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam92xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 17:33:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so3522216a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775237626; x=1775842426; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WhdmUQMs0c12v3Jvg9TgqFjhlSe7hCaVqUcHAfWSqgE=;
        b=KN1j6/XE1watPmnFdhIuCmoFOhKdohe25WGM1tDxg//XYHDecClRdit5b0u9rFrlRP
         NYykJn771DmpLWZFkmfHejlv0At6dmtrJqFcnA5vUju9aoSjKXcW3oRonMWQ1uVxBPzD
         1PKN69ZD5MqZSCH+Xcjo8b7rGH7/a7b60mFMXO6nig0g00BvS8kIf1Z5ChLWOx847htM
         mf3h/DV2KSg0yvN2/RanrydVsU/4Yu03VwEPGxgyo+RA0LWVZXbFu0zqOV5mUROLQy1N
         pf79aJ+TzT5o9/JhqLk2dM1KPOUb7aW/QeKswZCdj1yk++LRfoVrheZxlRg4dJY8hGGJ
         /g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775237626; x=1775842426;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhdmUQMs0c12v3Jvg9TgqFjhlSe7hCaVqUcHAfWSqgE=;
        b=pmYqFB1uh+llW60ELN06wXNS3F/cOlZCvN5MDZNgnKiIpE/uNQCaaVF47ZUCUhE6vv
         rwMgY0ppyG95d+fp/sqtDMWrt1zsdk3LAgWI/90ov2xUGK1X3CojYwU1NduX2PN9sw0x
         aW9AYnisrrePo9XpwcAFBGzYfR8zT2zs6ZanksvdL/kc6DVpseLqF5tYX6c1V6qnnuH9
         pv5P+VqIQ0fT7OZKghQykzDKRg2b8TWjuY8zb/BgJphLDkICn4W+Do2jsWMye2GohAFr
         Eh+K8RL0hcXlJDr0ZkbyYp+IJpdwVO5NjxyHwOOMKjPc6RCCu9qkUnSXKj8gVzcmeSyd
         ozkg==
X-Forwarded-Encrypted: i=1; AJvYcCVVmEUZQkXQEetmHJ0/3VxmhZWY/2l70yIELQmCnDi91mZzKd0OUKmQ6Gx79wT00IW8zRl/3JtOIJUM@vger.kernel.org
X-Gm-Message-State: AOJu0YxNUYltJ3LkNiEn+rT4VS6n2gezBTHno8fBGl4Y43n0T4XdhhwS
	eFGwsH237u1YACqteSjQ2gb6VigeJ5/Pw8L/Hc526t+n86BedE1A80HIzut4xuLRSYsjWZGEAnD
	XDMAD4ZsQOT5koNiCUjzcf3Zd+0lo+Mvjp4pb5vSBQ3DdVGP+vQwo+vxnkFvUCIMGHFVG8rxg
X-Gm-Gg: AeBDies21NUKvStXwfFR8bqgwr2DS+DbtgvdyqqWYyb7can5QYARBoFRumpho+G+pST
	PNKUdF5oTOYZEvRcgC97n9NoWk4RfgRtnYrj7O2VEQaR2KOUoDpl6GkPZN89CZSU2bkwKYGhNaT
	jPGnfL5HPnBJhX/iBOorgXG097O36JVlVjqGyUwcd/L2p2yALo0aP8QJMgRfHQmAfVi0zv0/KbH
	E41CyIO8vyypM7zyyYvfAHQqB1svLvo0RQYPjJTVjdAM5sGIX7YALV3iD83NsMXN2+kJpUzInif
	36JNgz5EATwdcUsU+c7fpbAQCu93Uiy3nAcCJCZLlXY5bApWH41JP+YMvKfhzjycxExehbvEINf
	dYVoTy25mQI3HiRiLpdafNsQFjEgs/vGnvRgF/nP5yIkX+wqddg6cpM9P
X-Received: by 2002:aa7:88d1:0:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-82d0d743763mr3740160b3a.0.1775237626175;
        Fri, 03 Apr 2026 10:33:46 -0700 (PDT)
X-Received: by 2002:aa7:88d1:0:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-82d0d743763mr3740120b3a.0.1775237625642;
        Fri, 03 Apr 2026 10:33:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3e169sm6359125b3a.18.2026.04.03.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:33:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v9 0/3] PCI: Add support for PCIe WAKE# interrupt
Date: Fri, 03 Apr 2026 23:03:32 +0530
Message-Id: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOz5z2kC/3XP2wrCMAwG4FeRXltJux4yr3wPEam11eKhs9Wpy
 N7dThCF6U3gD+RL8iDZpeAymY4eJLk25BCPJdTjEbFbc9w4GtYlEw5cMgaCXs3OhXRa5kvTxHS
 mXgorVsYwtJKUqSY5H24vcb4oeRvyOab7a0Er++7b0gOrlRSoUMIx7bnlYGcx58npYvY2Hg6TU
 khPtuqL4T8YVRgFXiLzteAg/zD6zSjgDIeMLgyshcIaK+Cg/zD4YSpWDRnsn0IDRvcHo/nBdF3
 3BIk/+A+KAQAA
X-Change-ID: 20251104-wakeirq_support-f54c4baa18c5
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775237619; l=4614;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=lquwIt3pxmUHrqV0hylBWdUZ9FzuojFhb4iwrjx2pmw=;
 b=QXHiJZg8wKuUbnPRDefxKLKofMd2Hk//kpYpGCOguqCazl1tI4dSFeEgjPx3SLlmZYoib9O7B
 pJsk97SePNcD5M71XJY7KBn/d/1IUOfBLASlz2yrkMzmJKqUWandkNL
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: VbuGNi5lgtEKyQFVlFfVzm-S6Wr28a0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1NiBTYWx0ZWRfX0vL2BcC2qU49
 KPpL0SVdvgRmO82vvLQz1Gv4mDRFYTUi0RCyx09gVN6f2yVCqnUKdNFkECzNoP3MAykS+gQUHo+
 bTEbxZoYEu/X5Ff7bZ3+Q8RgEJ0c2KLTRZ2v3kVwBEjpmOJsJBdB3y3DPh+FvfBgQalOW1/5J93
 AtoCywxNbK8+bYIrN3BK98Za46H6kD4xB6gtrweRr1zfGBA2EuFis7tb5D0VKQxy1CTXFwUMcpD
 hAiaGNmZ+Zk42XgU0h3gffRqbUCWqlnDOxaVVvbjFMNUfqqzEHctF6e34AgWm3i1xufzVvBXMej
 DLDpKghj0vNB1G+IxCtqcqLdZ7as228V8dhOZ40h0FsPkUBpGJOinl1BF3gMXljQnI9HOEVvAlv
 Samco02cPAaTB4A2RzroXiHE7k8YfAqFeEVqGuRxuIm4/nTXVhuVjVLkT8zOXrbYa8Vo7Gs+nDK
 lL0OAfR1RaDz0Pt+wTw==
X-Proofpoint-ORIG-GUID: VbuGNi5lgtEKyQFVlFfVzm-S6Wr28a0R
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69cff9fb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8
 a=bBQ1TlrZeL130n7Dx0UA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030156
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-34652-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00924397053
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PCIe WAKE# interrupt is needed for bringing back PCIe device state from
D3cold to D0.

This is pending from long time, there was two attempts done previously to
add WAKE# support[1], [2]. Those series tried to add support for legacy
interrupts along with WAKE#. Legacy interrupts are already available in
the latest kernel and we can ignore them. For the wake IRQ the series is
trying to use interrupts property define in the device tree.

This series is using gpio property instead of interrupts, from
gpio desc driver will allocate the dedicate IRQ.

Bjorn,
Can you take this series through PCI branch, once other subsystem
maintainers give us ACK. 

WAKE# is added in dts schema and merged based on this patch.
https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
[2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v9:
- Call device_init_wakeup() only if
  dev_pm_set_dedicated_shared_wake_irq() succeeds (Mani).
- Change the IRQ_TYPE from IRQ_TYPE_EDGE_FALLING to IRQ_TYPE_LEVEL_LOW (Mani).
- Link to v8: https://lore.kernel.org/r/20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com

Changes in v8:
- Moved the stub functions under CONFIG_OF_IRQ(mani).
- Added the description of how dev_pm_set_dedicated_shared_wake_irq()
  works.
- Link to v7: https://lore.kernel.org/r/20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com

Changes in v7:
- Updated the commit text (Mani).
- Couple of nits like using pci_err instead of dev_err,
  use platform_pci_configure_wake(), platform_pci_remove_wake() instead
  of calling directly calling pci_configure_of_wake_gpio() & pci_remove_of_wake_gpio() etc (Mani).
- Add a new fwnode_gpiod_get() API that wraps fwnode_gpiod_get_index(..0..), similar to
  devm_fwnode_gpiod_get() (Mani).
- Link to v6: https://lore.kernel.org/r/20251127-wakeirq_support-v6-0-60f581f94205@oss.qualcomm.com

Changes in v6:
- Change the name to dev_pm_set_dedicated_shared_wake_irq() and make the
  changes pointed by (Rafael). 
- Link to v5: https://lore.kernel.org/r/20251107-wakeirq_support-v5-0-464e17f2c20c@oss.qualcomm.com

Changes in v5:
- Enable WAKE# irq only when there is wake -gpios defined in its device
  tree node (Bjorn).
- For legacy bindings for direct atach check in root port if we haven't
  find the wake in the endpoint node.
- Instead of hooking wake in driver bound case, do it in the framework
  irrespective of the driver state (Bjorn).
- Link to v4: https://lore.kernel.org/r/20250801-wake_irq_support-v4-0-6b6639013a1a@oss.qualcomm.com

Changes in v4:
- Move wake from portdrv to core framework to endpoint (Bjorn).
- Added support for multiple WAKE# case (Bjorn). But traverse from
  endpoint upstream port to root port till you get WAKE#. And use
  IRQF_SHARED flag for requesting interrupts.
- Link to v3: https://lore.kernel.org/r/20250605-wake_irq_support-v3-0-7ba56dc909a5@oss.qualcomm.com

Changes in v3:
- Update the commit messages, function names etc as suggested by Mani.
- return wake_irq if returns error (Neil).
- Link to v2: https://lore.kernel.org/r/20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com

Changes in v2:
- Move the wake irq teardown after pcie_port_device_remove
  and move of_pci_setup_wake_irq before pcie_link_rcec (Lukas)
- teardown wake irq in shutdown also.
- Link to v1: https://lore.kernel.org/r/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      PM: sleep: wakeirq: Add support for dedicated shared wake IRQ setup
      gpio: Add fwnode_gpiod_get() helper
      PCI: Add support for PCIe WAKE# interrupt

 drivers/base/power/wakeirq.c  | 39 ++++++++++++++++++++---
 drivers/pci/of.c              | 74 +++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.c             | 10 ++++++
 drivers/pci/pci.h             |  2 ++
 drivers/pci/probe.c           |  2 ++
 drivers/pci/remove.c          |  1 +
 include/linux/gpio/consumer.h |  9 ++++++
 include/linux/of_pci.h        |  4 +++
 include/linux/pci.h           |  2 ++
 include/linux/pm_wakeirq.h    |  6 ++++
 10 files changed, 144 insertions(+), 5 deletions(-)
---
base-commit: d8a9a4b11a137909e306e50346148fc5c3b63f9d
change-id: 20251104-wakeirq_support-f54c4baa18c5

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


