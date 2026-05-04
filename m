Return-Path: <linux-gpio+bounces-36034-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEgXDz5w+GkYuwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36034-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:09:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE5F4BB729
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCA1D302926D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 10:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939D8392C36;
	Mon,  4 May 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiPsu5J/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yk6xVz68"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBAE391E51
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889266; cv=none; b=CKjFVwCwvrvytY55d23+VipB+O9FMKaJJzh69LuZhdF0edWy2af8vlE031dF4rONthgC5afgMUHD5SfXGwhjDmhrB0ElYHnG2g3f32F68rZgpBpyaRuGQvh2xc26R8C35GLCLMNgeaxv6NkWAEEoO7F1iJzj6KFf3zI/Ia3tTZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889266; c=relaxed/simple;
	bh=Hva+7Cg1fc/998zfCEeQlMLQ4HwKhWH7TQGTfhprwB0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t4Y38NzPLtQlHFLCJ1vP0MzLke0eVDuiHGxejeD6W1u5Nay+qjIc9W9R013EhFyugYL9w3dEXcI63JUDskZYzrXX1ZorZyiIgtcTW+T706kv/QH4Ae/j0uIVMHdsHHHXNBQ4HLiFfkj2Rc50jX+rlSL6orukU2IKBd77KMSnqZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiPsu5J/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yk6xVz68; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fQ7r3894126
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 10:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/UmldWu0FiqL/mzzoJDrah
	2WxwzYgTU4xVfslGD01Mw=; b=GiPsu5J/NEbJ1oJSKYoH3+jxVbtdmcmiE/XnoF
	ArQ7CeYH7pCfBGIOdZnJQBAEAn/OMyTPdRBYCQoDgzBS5jOOvpYK10kfz/ZyRraT
	yeSn8L/VQp8d3sVEh7MwFSZ/FjR+ZSHCgXxqXiPNlvFn3PScMAd8Bl8eQAdHQ8M+
	DY2HJnMJgtMoZIMG+W52rn5IkwUqbLnoeXizEAg7GocqsmBDXm+wic7xCPdqnGiP
	NN0y6FL+dNH035g5Eur+8suPtHAyxRazcepdWkl8qWm6/IymsIPxq3VELMb3kDr2
	Ixajtz4xGSeSjgbuQhqI0S+lEHVclwpNjXG1xgg2eLvoE/iw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpdfx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 10:07:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc49bef6so71510981cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889258; x=1778494058; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UmldWu0FiqL/mzzoJDrah2WxwzYgTU4xVfslGD01Mw=;
        b=Yk6xVz683D5P85Ry4/xR0bjtiO4l80zW0Flqm55mH1F47micf7Laa5CcIv9hNIIOHO
         5gf5AY4+oCDFjcQ65VnfYMZZtiITWzZTuLoegijxsv4qAOz7Qg3KDr0vqre2n2VKKrJP
         kcqcr5fSuj8g8uMlMpd3JQ0WlXmxkQtVAElhr4+QZtG/1V1Mwqr2rNlqYc6C3wc2Stmc
         gCAqYeF/D44i2+cPjUfD+X9nMWEbXc/J6wlG45BUpllM69lYEPbXp8y9K2RVxOhsbtf9
         YrnKPU40GeN6P+8o4iRrZFlQJftsPvvOZyrcuisDc5Y/WCWkK/1RnKkyEfYTY4vQW2gN
         3atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889258; x=1778494058;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UmldWu0FiqL/mzzoJDrah2WxwzYgTU4xVfslGD01Mw=;
        b=swmfNjLuC1HWMpS9iw3V7peYCE1COQGhELTfOCKJpRdZIhWTP9zkr16BnDggCuzoYr
         CjAlyenVzSecQqqKPgwXSBQvImKPVxBSloGUMSSBubUypO/uuyeZ36sw3o4Oxu77MnNG
         A6PAwQT8tbg5Jm2QOgfu6joZupxTPPCmTOA67TO+RWhy6EvCfOcAqlyrO0ktJ9uo7Sb0
         +VFnSQk6VSb/QYqFlCjfMz5uYZckuaccUSMDznIvcZb0L3VUDLwodu0O2q8FrE+Ag5xr
         YNnuBLatFeO+txqBc6WxlPNS5n+CFQkAdZAq4yjPaWVLiEXqm36VkED9QWIHJvqMxIqc
         N3oA==
X-Forwarded-Encrypted: i=1; AFNElJ9vspJPNSDN2JcROSWfhef8VrMmybbcSv5zOnMv8BA/P4j+E9YEUGxdmHA5wF9HMAnlU+gLWwaByHwE@vger.kernel.org
X-Gm-Message-State: AOJu0YxDWwzo84DZ2uXjI6aYLTcijSGyWL+aRd71l94KmYLdN18PZ3nY
	vdZTTl/D67ODED9g7axUOACnjEJrK0BsWWM17Ji3m1IkVKmlPewwMTWPjthldT2X66XHxaCOnGw
	xYfUbydaUHBTp8dMfMMLC3kemgGOGaFd5DdpIXoG9FKFu5PTBzLkMdR5WQXgr0gix
X-Gm-Gg: AeBDies9vsxNEGQyGNVTTwAOtsKmcoiAjPaCJPbl76S4ArbXyb/J8p3ebNX26i8uLAi
	5FvZ0YC6JJwnHzvpTcBzSV7GO8fm2ZzeI8+EB4VTENQd2xmjFB2Ojc5kiy98GnihCTUtPfGQnM/
	vKVzbeMcdfhoJYRNDW5Bfwn3EeTWZIOC+qii+ztPgcutMs/3vJgqQoiOBZATdYWDH0VFTMmBd/G
	8gY0lASVjF0QyN/c2q2g+/DgS7XqsCnS5TSJsnRtv/GyifOQgfoKG3D3a+k3TcDcAwff3F00rOx
	oisvpydbaHRyCvyCd89hgLURDhtjCAtrPBSjPkEih9wyGrYI6vILKgO16FK2dHh1K+fD4kLu4QT
	VP1XJecN5ksy9Phn7nBuQYms+T/nsyfagG8OcYkJUxV1Mg1PuAw3cVxfOj5OhVQ==
X-Received: by 2002:ac8:58cc:0:b0:50d:7b0c:35e7 with SMTP id d75a77b69052e-5104bfec394mr136038431cf.43.1777889258205;
        Mon, 04 May 2026 03:07:38 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:50d:7b0c:35e7 with SMTP id d75a77b69052e-5104bfec394mr136037901cf.43.1777889257768;
        Mon, 04 May 2026 03:07:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:56cb:50e1:b507:63d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm23400860f8f.31.2026.05.04.03.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:07:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] pinctrl: qcom: add support for the TLMM controller
 on Nord platforms
Date: Mon, 04 May 2026 12:07:24 +0200
Message-Id: <20260504-nord-tlmm-v4-0-ccaa731ee8b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANxv+GkC/3XMTQ7CIBCG4as0rKWZAlJ05T2Mi8qPJSlFoRJN0
 7tLu2JRN5O8ky/PjKIOVkd0rmYUdLLR+jEHO1RI9t340Niq3IgA4cCA4tEHhafBOXw/ilacOEg
 tOcr7Z9DGfjbresvd2zj58N3o1KzfPSU1GDATnBkGIFuAi4+xfr27QXrn6nzQiiVSAKQtAZKBT
 mmhwVAlgP4BaAmIEqAZMA03IBQIJuUOsCzLD7uORE8rAQAA
X-Change-ID: 20260403-nord-tlmm-b5878960cec6
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hva+7Cg1fc/998zfCEeQlMLQ4HwKhWH7TQGTfhprwB0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+G/gp9GuuiSkMj/n2UMJ00YT4MifB7kY1xScH
 t6SF4VZPGOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafhv4AAKCRAFnS7L/zaE
 wzfhD/9tiL37VxGV8H3lfIisluikeoBtugNjYT+Q9QI5gxlHBk9QXS4mBLayiHYaeeCckncpkIK
 G7Qtw4SSWPG3fpUBTYZ3bS97aanY4I/0pu/ylNluGX4Wr/bu1XRDY2GmmB7GIcz3hz5q5HvJ6en
 DuHzlHqEiNEeFNztVROIkaBJ0sPXAR1+E8GSvwrCZED/f2iKD6glp0/T5pFx2Ujs7A8LJa1Jcry
 ysa4/aTa6OdweGiZHUHmtITn5X7ZrrsMglaIUMp4X028NhC1y1X825leqXO6FVTUuA9hqB7y93c
 /BrOWCxyb2NBLqWvj5x17TvK7UU+K4kLzlGIriPFk5CPxipkELLl+QYEqqVZAF9GI6RPdV9tRjC
 APGRab7wGnHtH1hdYkICUBgPvgFnFQsEk7RbWOnF35E5XArbQvJ3AF57gIcqMFohkrI+n+8psHM
 3sobhedXKSvvcr1iHHy5n17X938T2ooegmZJiskxWNurFU2/KmzfwHfnkcyaIFkeugglAbQjbyn
 oQSFeMu1m6ZJhymTaZyPGQBrVQGR0OMWN35qua3elj5zlRgzN3EqwEKjobfuRvpJjayFRqXvFCu
 e+kcSE2R3qR307aD7uwZcaJJ2OuZLOTeBspYMbteeMWfUYc6PwSlAQq9aYaITBzk7rQM5zHVRQS
 o0HDMaAIONhRaYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f86fea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=zAXgdMWITY6MfEXZmzYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNyBTYWx0ZWRfXy0ZtsYrcrKnF
 5L1pB3bHZ+R2c3tsrLTMGbOAaqMQeCC3hSQ2XYjDbwUzBJshbttaDU+pHN4/PrFdSiORuRkBMPP
 PZlCq6HSjZLVyYaXiIxoGL9EWzJ702cEGpLdEnk0BrOQ3Qx6fIpilFvssfGN1P0O6rmP54540nM
 8xBJmHEBrITfFRi5vU2R8+WVj7OcXlDm5N2hZv4FR01Kp2/i2zalWdZLdqCHwNW6W+olmI9ljj3
 EnRA2A+iWtfqYn5snqyIserEAZmbBOqeUOQCPn+fE3NlW5E7E07X1VSRtkH4dgPY60Dht0/O+Ny
 2AEKYETORFmEG9rRPfz7D38SFNDE1R+K0Myl16/HRHpJGUz8st0zbrMIXYto/Es3B700nP7Uhjl
 DzCZmIHfw5BR8LvGRMz3nEWjpRyF+7fnRsIp+eZ4ZFfuvdRlN2fVPpMl5EFPLn3hwfcfjpxhhHr
 hvJ4PS60uXHNxQHVfdA==
X-Proofpoint-GUID: qmEBT2W-iIVsJHE8UnSOFYKTcFRboa6P
X-Proofpoint-ORIG-GUID: qmEBT2W-iIVsJHE8UnSOFYKTcFRboa6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040107
X-Rspamd-Queue-Id: CFE5F4BB729
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36034-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This adds DT bindings describing the TLMM controller on Qualcomm Nord
platforms and implements the pinctrl driver.

More info on the platform here:
    https://lore.kernel.org/all/20260427003531.229671-1-shengchao.guo@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Move MODULE_DEVICE_TABLE() to the bottom of the file for consistency
  with the rest of the Qualcomm drivers
- Make the module description uniform with other Qualcomm drivers
- Collected tags
- Link to v3: https://patch.msgid.link/20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com

Changes in v3:
- Unify even more fine-grained pin functions into larger groups
- Fix the UFS_RESET() implementation and use correct offset for the IO
  register
- Don't use uppercase hex numbers
- Make usage of the vendor name consistent with recent changes
- Make the driver default to ARCH_QCOM
- Link to v2: https://patch.msgid.link/20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com

Changes in v2:
- Order Kconfig entries alphabetically
- Fix the regex for the pin state pattern
- Fix maxItems for gpio-line-names
- Drop unneeded line break from bindings
- Rework the pin function naming to make resulting state entries in
  devicetree more concise (drop the line number suffix)
- drop .intr_target_reg from PINGROUP()
- fix values for interrupt entries in PINGROUP()
- drop unused SDC_QDSD_PINGROUP() and QUP_I3C()
- drop the arm64 defconfig updates from series
- rebased on top of v7.1-rc1
- Link to v1: https://patch.msgid.link/20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      dt-bindings: pinctrl: describe the Qualcomm nord-tlmm
      pinctrl: qcom: add the TLMM driver for the Nord platforms

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  141 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 1771 ++++++++++++++++++++
 4 files changed, 1921 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260403-nord-tlmm-b5878960cec6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


