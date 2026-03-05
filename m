Return-Path: <linux-gpio+bounces-32547-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGLBOVhTqWkj4wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32547-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:56:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A057920F1D8
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E93730707B3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 09:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E972037BE7E;
	Thu,  5 Mar 2026 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IjwycJoz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apqdJKb6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE9F37AA63
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704307; cv=none; b=YeQy8dCIKbbak26LUE7Gu9B7R0w1AivJoQznqt/L/gOQF9GAO6Eh+8DDLE7IoEqJz07kz4dZn8/NzYa/o2O5Q8sk1ZBBvtcOP00zCdakFuwPqHfhFONM8xlZs7VDBXuZt24vuRpjyYlTsumEmQ5K+Z0uh1hgFnoZBVW4qc/11l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704307; c=relaxed/simple;
	bh=rQwmOJb4O8I8mlsbHO9IDxXCoYF1W2cwc11R5kOlHIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/vIVzqNWD8GzDyOK5n8oVN6vFnN4S9YHuBiUdndfhZU5R15TUKNJL8MoU/GQsL0G1WPlE5x4pwLiJyXIyfFQo79HzZfYT3qxcgszFnd3jGP8I6IJGtnwaZvoIGYshK1H5zGQ2XWcRbSoNLQcbN7+jjSGciKlDIHYcitOMJXWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjwycJoz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apqdJKb6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258paZ41193182
	for <linux-gpio@vger.kernel.org>; Thu, 5 Mar 2026 09:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l4dDUc9FKxci0scJ6kHbvI
	vVEUKnC5+r57TdAfo6P2A=; b=IjwycJozHkc4TDTOvjpyY1NZOr1UOQIcuqh7UR
	ozgyF9oYbYgSLELweLxgJ83V6jlkNpW2PDyNXVdNB/Wy7CKR55XEv2n4xINUbVyn
	nz9e32mOVSGSSQeIfZaV+RBzVgWDMiCHoLCEJHPxswmUqMNa/t7tgqaqW7v8/dNR
	Yg+KdNnUN/w3eo3Mwlg/hLt9FKJzl9jWC3O0DUTKrKbynjEW4/drwiLw2iADjrDI
	cd416GVaYbXH8os33v5xXOtZBGt6Ty9LVo+K/hj1v8BCCuZDBS1kgypTrPTi5Rio
	4ORMDo8c3R6R8kluva3E4bhznqiZiZNEOxdGUGQxywIQBn1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwgb0xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 09:51:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a2eb984so5481190085a.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 01:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704305; x=1773309105; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4dDUc9FKxci0scJ6kHbvIvVEUKnC5+r57TdAfo6P2A=;
        b=apqdJKb6B4o+2y5o7+HdUkkNCLe33wfi9q+d38a1KOYvjjStlsk2VLAsZGgjYXwUq+
         PCqr5xHHBwTCxCwoit/KsuwdpQOXtrpUZFI6aXoPQNhwBe5UeEalFtBOwNA14OnWFpwj
         INyMgAD7d+ygX6V0VuGZ10evhJ9ik3D2SXzZEAYNTZTEJLSrOS6ixlSf5RVKrke+Pmek
         qrPud/MeDrkOEiYTK3I2bo4IRSSHozGhQT08URuL4gkIV/D71fAMKTFiIAdynFLo+jyW
         YervH7tVg+00it+v1RfBc7sISmfVoiOsKidpNtBc4kWOINqKKn4xbVRcRTLP03L9yvtc
         F7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704305; x=1773309105;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4dDUc9FKxci0scJ6kHbvIvVEUKnC5+r57TdAfo6P2A=;
        b=Da3W71JzqBxDx4pQCRNxSau+h3tQ6P7FVaa6bT+LBui5Ivduu5Gyht8+No0kdSbGnt
         /qnhh+ShRWONmuhG/u4KLl9syHnnNC9uY+HNK4yeCxb6In4rqOOX12MVCYAkGIQ2Lqf6
         kzeSwiUdYtMXccSqTYaq736gcsvzGsPDLnZ8wHt94rBXnVH6EPWZB/Smiu7W5RSAZzik
         QMzlcBRcPk0pgLK4fXIxNZDo1VINCgCyIpIkCpbCRGtPmMQMfgLgqrYL3h5mMvR3oNwk
         o9M755/n6rL3ZtUPViaHJODZ8IzYQu9ZbbUzxPDtVvzsD7sUp728WxwQhbvv14blF/uC
         iRCA==
X-Gm-Message-State: AOJu0YwAwYFpRwxlX6DfWjRa2liPdARytiSYSaMjma6JwL/+0EnG+DdA
	kXD05cZY5dcuH90kIMt57F/AEclldVxFevOUPyDTBboRRdJPmxCt7LeFGMoF4riTCtEbIvox1iY
	1RGSIKJR4doxj1mZHwyw8iy5dB2y2v8kvzVf2Hzp7KBhUjw9eKT1x/bXSoWmF6763
X-Gm-Gg: ATEYQzwYpUfQ7CfRlIgM3XSucr9Qk21bdq1z6ddzvGWQCjBj6LskcTMIAEQ1N90ZbVD
	NF/KI4jckuAAtCZb2BaW2jaSxRDnMcRP4s+OdUDrRpiD97L1UuvlAjNoinqZfgDkyBPeNx6IkCr
	5lVJsDoWA4LsOPDfU5TWZkxaSZqfZkr1pSXx70n/cUzpXsN2bbFUgk9Z2DDpBeYEbG1oHMX0aVA
	WIpbAdGmZ/u0p1Riz2xSDi22uijfjWiS2h1ZuI/+wv9I7hWRPumBvu8x5kNgiP6L/xtCmZLRuKo
	ldhvqUrvJVWTuDVQ5CddGYHIN42YyqDvawIfryJcLGe/Q68TxMqfVOaXOxKugwMTI7Oe1kxpfzf
	jkChCYIrcHnsnQJAJC082dYK4v9EcbpP88CIPZ4RNS16ZLdXa2rwd
X-Received: by 2002:a05:620a:25cf:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cd5af7a53fmr647677885a.49.1772704304904;
        Thu, 05 Mar 2026 01:51:44 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cd5af7a53fmr647675885a.49.1772704304504;
        Thu, 05 Mar 2026 01:51:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/6] gpiolib: unify gpio-hog code
Date: Thu, 05 Mar 2026 10:51:25 +0100
Message-Id: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5SqWkC/x3MTQqAIBBA4avIrBuoMYW6SrToZ9LZaChUIN09a
 fkt3iuQOQlnGFWBxJdkiaGiaxRsfgmOUfZqoJZsS9SjOyWijw6PO8Sdce3tYnQ3WDIaanUmPuT
 5j9P8vh9JWtyHYQAAAA==
X-Change-ID: 20260224-gpio-hog-fwnode-b46a53196253
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rQwmOJb4O8I8mlsbHO9IDxXCoYF1W2cwc11R5kOlHIw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIkgjKn8wsYQdnDa6vZ12Pc+Y6pTgCNa4C74
 pXtrDKcXs2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSJAAKCRAFnS7L/zaE
 wx1OEACIl6fRdGiMY6XiNPs+wPhYwJCCC7ygnK5SKbf4ZfA4QVw8jZtlPnuxDGPTKGWKzh2ce5u
 jKyxn6s5tTcytgFl+vlLG0t4ZEOgTOFdedlbN26Dlo02avU3BY7FmBTypt6FpiZyuu3dnpn711e
 WgS3NiiasnpGAl8MD5zfxqkij2t78hkzrRc+pXuOP48atyJwOYOKjDvFMU+ZJXWb15l+pmQfj+0
 XZaL/Jkarq2qOuFXiNuhsIsxm7jo03Ts7M8bBnKtcdKr9e0ksbQLT6ethIDmPkfvEVoffAwpewO
 zKl9v4bWIrVtI1cyo9Mq1CbRlff4myd/gVRMrJUm5r+sM+iXds8zKGEqp+8k+kftNcnwYJD7wIP
 1ADDJ9fbvXRo8pSjHTihqBpfSo8Uc7zodC09ywWi+sIWxWRjTUv4yYVVA9BS/GhzJAw+TXmDWMU
 7E+s7qApuBQvA0l8XrzKuU2L8Z8C9+voBZ8B3qhg9+d3qy8aWM7RHiaLJpifmImH6yXYTl6l9I+
 zb5YHUnjLJ/0Xg45FWfXIe7sghEiO7LIbbsbaF7jlFDe0VmtCcaJEwYE1VRU8RXTLZuMIpaYY8w
 rDNN20awgzHH+CM0JhjXqdSoOlq2PL2PMgghzfyE4eCOqVstL6oJEwCVwrnRMs8d2skyU8m/EZX
 1rXdW7DFDhYPaeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a95231 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KhiCW88sooxdVpxl3PQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OH7Fs8y6Lv1-BNE6FKw0g3Zqijdr2KHn
X-Proofpoint-ORIG-GUID: OH7Fs8y6Lv1-BNE6FKw0g3Zqijdr2KHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX+GFodV375Z5O
 yzAnpIuiq84VhYVcN03Ci2KQgQeGk5hX9fGpYr76NYh7dOHVFUmuBeYgBricLi319C4v2MqpSdq
 O4oQdIqrRtzABEEiupP0QR4pAvw1HRyE0lGGsW/0Ps2GKlT6XyjgDrlh9BdV0XIiNYj7M5dgdXh
 7c9Z5A06Hx2L+YBnqJpcQvom8W0vNhp4bGVNuQ/KSfoq9JUrQNAfpl3BtUOlHLbNSAWcJl7JBQF
 xVVooAuIPJq3UxyFOKYDNNWoANQTeRyKJkHK9ofxoksrWHbmWtvFip8MxHQXko7y+nP2Kpqxr5m
 T2PsQ311Nhxbd5+6Pjuh0ATPI7EZVto51Anz0aD1mb5aNEbNNhZRiPQ4ZLu6HfNaE0P4xqKjGNT
 7xk8nQ+dYNP27epplAS/3OTbN+RLBzpNcwvSCBzCkPuuR5fW+xoGEbHQyGSXsVdrPovgbacWBIM
 fmew0JDDWG1gbX0tTIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-Rspamd-Queue-Id: A057920F1D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32547-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

GPIO hogs are handled separately in three places: for OF, ACPI and
machine lookup. In addition hogs cannot be set up using software nodes.
A lot of that code is actually redundant and - except for some special
handling of OF nodes - can be unified in one place.

This series moves hogging into GPIO core and bases it on fwnode API
(with a single helper from OF to translate devicetree properties into
lookup flags), converts the two remaining users of machine hogs to using
software node approach and removes machine hog support entirely. In
addition, there's a patch extending the configurability of gpio-sim now
that it uses software nodes for hogs.

For merging: I think this should go through the GPIO tree with an Ack
from OMAP1 maintainers.

Even with the new feature for gpio-sim, this series still removes twice
the number of lines, it adds.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (6):
      gpio: of: clear OF_POPULATED on hog nodes in remove path
      gpio: move hogs into GPIO core
      gpio: sim: use fwnode-based GPIO hogs
      ARM: omap1: ams-delta: convert GPIO hogs to using firmware nodes
      gpio: remove machine hogs
      gpio: sim: allow to define the active-low setting of a simulated hog

 Documentation/driver-api/gpio/board.rst |  16 ---
 arch/arm/mach-omap1/board-ams-delta.c   |  32 ++++-
 drivers/gpio/gpio-sim.c                 | 200 +++++++++++++++-----------------
 drivers/gpio/gpiolib-acpi-core.c        |  70 -----------
 drivers/gpio/gpiolib-of.c               | 148 +++--------------------
 drivers/gpio/gpiolib-of.h               |   9 ++
 drivers/gpio/gpiolib.c                  | 139 +++++++++++++---------
 drivers/gpio/gpiolib.h                  |   3 +
 include/linux/gpio/machine.h            |  33 ------
 9 files changed, 233 insertions(+), 417 deletions(-)
---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260224-gpio-hog-fwnode-b46a53196253

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


