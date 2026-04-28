Return-Path: <linux-gpio+bounces-35704-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEB/ByXB8GloYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35704-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:16:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 740DA486BBC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E5EB30F57A1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3DE370D55;
	Tue, 28 Apr 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncZDLqV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcNByDit"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762763F660F
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384106; cv=none; b=R1G5lvoeqwADTsE8DM0COu79tAU4Nn5nXYPSkvRvIMa8tX1Z0wzatXrGfAsGnP81sGmflis5X90KxCGsuBeyRi1P20GGodiQW2fXH2bdzy65itS6snx8QqSOEAQVmCWipY60RupYgpFAuSXuH/vcCZqRO/6cw0ksr7lOqZQ+Gug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384106; c=relaxed/simple;
	bh=C5FDPD6f2OXne66IVN/1iH0kWQsf4YJvDQC9yny6nXo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tj7qcKUXOx4H9w/ZSvPNnSnxG7t77Ocf4kle3pEXePeeoWIPMg0IvKKPmPAKfB00ClyNEiIizmppfDraeRjceMxR6M22wsKERD1c/Gpa3p9AYRAbeOsqzqNkXRFSBM/Be0rriEa83orWYwGoTM1GwkDokVf9Hj0SRmZyA/wX6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncZDLqV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcNByDit; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAKNHR1329060
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hilDGNWJGqDZQXlMCABLha
	YlO7/cHwV3sAMZOk4qae8=; b=ncZDLqV+w0gpw6djmwrXXwyAxafQMOlchlaenj
	Ky4TgDn2tyDIemrLNU30LGOB9S2CSwc756Z0A7ombkq/I5mHLTdYLZgV+DBSLgxn
	Xr2T1wdL3QUJwGWW8NpgiQPA+t7OzYSdGZB2TL2e3uiM2/KvRt3BHhmNbmlnAfzD
	AxJDw7ARNR+4KXAJfLErV3m4BinqtjFhbO7sLWiJuoCQwd/D9kZw9+3XVzJMYSHI
	Oy8POCjTjm/S0rhWcJ8URfL9HI5t8MdLWGO3uKdrOsArLPPxY1hXf8acB3+YJQHo
	I9UfsnAUxpV+BrUJbbRNaVCOPtH761VWOIL/9IPixtiETNvg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhaj50k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:48:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-610478c6ba8so6741510137.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777384102; x=1777988902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hilDGNWJGqDZQXlMCABLhaYlO7/cHwV3sAMZOk4qae8=;
        b=PcNByDit0A3xEX8jChjBWX/NHUfKBtWT2Zae6SJiSFH7rf6qE1DKSRvOqGlqiJi6zu
         j044nbcHOZcPUF5i23CQT7+yJ+RG68tj6L71e6GmJ223NbPD2KL8RZZ45TmTT3ccchiY
         uis9QBZFmgCh7J9Jd3wSduf6QM/vMTX7m5xCbSXLv+awDplzEZO0vmZIyjtreqAxtWxl
         PNPQ4qXb+/P2igBDENJ8l2cMNnuXKsaZReDddTR55aP1/NjB9RDfEmWmHvVh9mhSU2zR
         hG3MTVHLaG+Ed57EVFwpNTd/CaKhb/gcQhG5lvs1GWT6gHQ5rlPOaL+uVU2b4gU43bSS
         oKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384102; x=1777988902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hilDGNWJGqDZQXlMCABLhaYlO7/cHwV3sAMZOk4qae8=;
        b=hnpiNCRgvg0ZxdDaJDmuicKxt++ZAvOj7jM8OpFAUWvUJNBQGOUnDJ+utU3qipa+k4
         i6HRco1KkwvlUYKJU38rJIB1pB+DcOaZDGOzlHS6DLWZFrTHWCTtGo4vpFn/tyIceb0S
         cr9KaK2x6U0AiYwuIhrsp3OWBTH/yMbtDC4k9WVMeZj8/otBiq2/JFF9x+yovIaxFAgj
         00p8OIK3ZfoxrG1VTT0mCicfF5mMC8LIVPRwV8YwRknu+ySn0RdA/hfrWV6+rPFbacEP
         LGgtOfDsAaAhSEPogfaisMfbrTKCBqArBHoVGn73XGCASb2lWpJUA+ea3KIwSxpdz7FF
         prmA==
X-Forwarded-Encrypted: i=1; AFNElJ8PruOEIlNh+JfyxJ9zrUEz0NV6pkiAJo1zYZkaBJz9XxbKnmsJg6BR/gb8fns7iNT2PgBD9rK3y+Qm@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ05F0JF2T8ZmFEqRKs0ir8rHHrsUBY+hxNIXdQDIyQx96obfT
	uocqS4CXEiolOCDij4WvYm6MQtKAgxJRXrkj3CiOvEvATn56DujtecdGsN/YM2m6STCw5ZT3Qty
	tm+2jXYescSAa3Jn63xT6eLY1i/AoncC/okBnVvLR8UvMhaoang9Cci29Ry0FPRZBe+4QalYD
X-Gm-Gg: AeBDievwTmeVS54GlML1JDmZPyW7fsedUNklM0LCljZmxUPSz4nWl0ZZJrwlC/PC2xu
	scTDeLxq6YJLb8fNRSHZoPfhx+Gf1sYWP4ocT90zlceU0+0DXjAc5HDNw0ITIPU/OzJw0nbi4pU
	AZ7/sFRFWG490dHFxph0AUWtpWj9p2y+x5z5KVpEtD2mcq+NT/ebCWwg94nuNuQHrquPfZ+B+Hp
	LJMAaw2AQVbhHc6LuGCE8n/CmC0jlbNjVZYbgqiyqsiPy1UKn0Rn5rCV+ykd+d0gj7U6AnQYxvV
	Jh73dlFXJBHbsMs4CY6JEtSGtMVkdQ0ovzXTwbs1pfOmWsW5dGxQh0pHRcTchWhFbR/AD50rRL9
	xXFF/gRS2gB7qWJK0DK0rJhsRiHd33rDExOoEfFJQ+DwkCI3JzhnPIu6SaeDUIA==
X-Received: by 2002:a05:6102:548b:b0:605:7a45:c7c5 with SMTP id ada2fe7eead31-6280a3ae4abmr1181837137.14.1777384101556;
        Tue, 28 Apr 2026 06:48:21 -0700 (PDT)
X-Received: by 2002:a05:6102:548b:b0:605:7a45:c7c5 with SMTP id ada2fe7eead31-6280a3ae4abmr1181823137.14.1777384100914;
        Tue, 28 Apr 2026 06:48:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9092:2841:2b44:da7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f2a2sm6716518f8f.10.2026.04.28.06.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:48:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: add support for the TLMM controller
 on Nord platforms
Date: Tue, 28 Apr 2026 15:48:09 +0200
Message-Id: <20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJm68GkC/23MQQ6DIBCF4asY1sWMQJF21Xs0XVgYK4mIBUvaG
 O9edOXCzST/5OWbScRgMZJrMZOAyUbrhxz8VBDdNcMLqTW5CQMmQQCngw+GTr1z9HlWtbpI0Kg
 lyfsxYGu/m3V/5O5snHz4bXSq1u+RkioKVCgpWgGga4Cbj7F8f5pee+fKfMiKJbYDWL0HWAYag
 wqh5UYBPwCWZfkDsC2hoOoAAAA=
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C5FDPD6f2OXne66IVN/1iH0kWQsf4YJvDQC9yny6nXo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8Lqc7tcwUHPjjXe0YB92HgLpA/gIkB3COLo98
 OItwJtcZfqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafC6nAAKCRAFnS7L/zaE
 wwZOEAC6IeL4ASxTumC667sYwvl8Chy0/0QFxo1czKbiyMUPtXPbNsqtX1eTTUF303vKnK6YPo2
 uKoIlTiqZD0AZ6wax6dBYM+a6x1dMEfZkterqTDSY9btBWHDTBzst5urqaKHkTkzHtl3x61iDg7
 rdFWKFxDToh986/Z1bNA/QrW51mtUaN39vyoUR56PtnAJ1UfkQISwq5rc7qYTKoMaB0QvX2LIP7
 I4yUo2Fr8xDX3YJqKVeBtAfBbuFJbHOwtfcAj3PEK/5iImDPl4Iy9cP1ZRDDTmZC0Hh44rUZ57V
 GsXmeYeHRD1tmt5oEM865CImb+uSZb8V7A7skfV/fk310wJIix3Mm4zNIRdhP5oytwCtLYBUbtQ
 jvq0qayLOHabSa4+07+ig2yn41qoKjsQB9M/Jap0hkTASLtVzf/hdtS0/2aVtkauPjLrLFJdsge
 rZV7o8PBKYH7rkBlK1Zj7lPmKdH5UmPWNlU/pQf+Gh9ZxWyRsFAeQHzTq5NSH2sfTHOS7iZwccV
 Cpp51HO3bPEZCsKjKisiOBigocpPNwbL3kq8wQoJf0+rgn2ffpJDry3FZZ7/ewHQcC/l8Swub7o
 A2SQoxlZ5IZb+05gm8/Q3u8HCDj6/xb3b90UKY58TDAKWbIn1snFvcrjgYK8UyGpF228ny1c5eE
 lKsD/eN6d9FULPw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzMCBTYWx0ZWRfX2OnXJ7Vw9f/6
 dMKXUEdBZwyQVqRgGNH4PASax3+jECAZuhJCGQg11J5jKTO+89PcW2QGjtn8/nL+4cHfsuiIA44
 pA/SCtMWvNu/2lWceQD0qmlha+mboPPXaLt0KQfWwvmvRE8OqzXt0ZJFy0RyuaXQwYBLraK62Ng
 3SP+iZtVwISzVEklA3dv94xppXRt36sHo6N3kSH7hRHkUS1DwduHnlRYE7DqkMM1p6yQrmyF13Q
 BzSXwtzf9zOhSvcX1rjs1OZP9wBqUiCYiKyc3e+oHk7qd0YedrueyjmBSzkoW1/gtaEhslPpHur
 97V/lvmNR2VC4e32um5CU6hqyIL47BTyGXqO9LVCz4PJaR36QDhZevO6mGURXiIkO1XSLGAmGZI
 CrPnXJMZ0FkcpgGAOtrOYctGAlHGTnhXPvQZn8hkCbrb/HVuyI22J4Rf4Wb8dg2WMPkH4Gp+LLw
 Jku5xw7isNpgd9idyrw==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0baa6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=ZvWsTRz0IDEt6W-zfRsA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: r1ua3gJzTyX6-9N9rFFPcPVWT_nPorS6
X-Proofpoint-ORIG-GUID: r1ua3gJzTyX6-9N9rFFPcPVWT_nPorS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280130
X-Rspamd-Queue-Id: 740DA486BBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35704-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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


