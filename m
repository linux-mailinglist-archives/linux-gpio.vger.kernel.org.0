Return-Path: <linux-gpio+bounces-34399-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI0xHrY5ymkv6wUAu9opvQ
	(envelope-from <linux-gpio+bounces-34399-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:52:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2B7357861
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA5E930CFB6A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307E33B19C9;
	Mon, 30 Mar 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8VVM2xq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFwEm9Gz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103783AEF24
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859780; cv=none; b=jGBLBgfCEWB2sw8uUyw2VW+9h0k2R8/SNE+MiBVsdri4gjbgsrtZGy5moLbUO2R3uhQgrgcJoSE4wzv3fl+umGcXRb5KlO1mdtBs4gCn0y6WiU5W/MUvicZz4tavdsFyVQmsteTIw/NiNUdus3g7ysveavvLpSOUXJWfDzfYLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859780; c=relaxed/simple;
	bh=anCW4E0ZIGfXhJLFTLzLNgLyYjg6VA1+mUORsy7w8AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fCnoevIIlld1g4OJMeaBYyNTzyJOYlG2PNVLAwzpt6MrLa/1+cJYPfE3L0WVGR1TDMS7E3hZI9afIOht8K2kExejsGw77Kq0cQN8kbYpNKMeoyPpzJ+5d/YYk1QUgA1QrW7vCEgRGVYDqMIfB9k3sdrpk+CMR52dzE0NbHCdqmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8VVM2xq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFwEm9Gz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7Cf6w1534831
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WiitO0Rwk/4O9hM9vTx4GO
	7pPaNREZlLqZTvSluTHQM=; b=h8VVM2xqAetF9KqOCTl9h4nR3tT9UqQdxe5pre
	YCb8OL81JokRlvqldUQyMctN0UzjYTbc6R+uw2lGNY5+Ev3eZy37cuI9euNc/bcD
	vKz3Ym+8gCawEuQkhXIRsDGM6bqBcANiFqYjNncCOlz6aDyg7lrImQmrmKZBQbHL
	FaKWzXL3J8S5iYqc7BahG0wcuhimnIJ11KedPvqkGwtEaVLHSFEKZR64hR9fzyN6
	obWc80SxdWTeYSL0MsTby/jRWfOrU1bl+69NB4EIujU4G7gc80ADBatek/Kb4LRE
	5Zeoyhl8jhBVPvlyPyFU57INlVeOIp2JmCXDLvc/Q1EvR0fA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwnage-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:36:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso125010401cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774859775; x=1775464575; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WiitO0Rwk/4O9hM9vTx4GO7pPaNREZlLqZTvSluTHQM=;
        b=JFwEm9Gz/dupmCIBV7fTltYz0kdRj8Mih4uta5vFKVw9ahsFBj7GVkeXeobiXVcYc5
         VHtHWZPrYdAvHxtdRcyTADoA88R8stoFXr3ZZewl4fFhp5WuBUbQPkUvrnj4p6GdjEsV
         uGP2z7NpretgZiSsAbpT6cRsnIA1mVFz2sIZyXBSQxziLPggbFyzqCL+pMEOUAu68uZZ
         HCA38oblyEDbEglN7JV7dPr+mPWvi/9ZI1flcKd8hpzJgQpJfVU0jCqIEMazm45s4KXU
         +wsh/vim4Oe8DDjMGZyS+qQBYemRRns3cyva61l2n30yLFdo+1WI+licyIQDji3UsLJA
         LGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859775; x=1775464575;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiitO0Rwk/4O9hM9vTx4GO7pPaNREZlLqZTvSluTHQM=;
        b=K7gtdgyju0p9Uv5g20TFao6AxqZbhKKZh6TgwwuRP/s+E/f8C8wqU/Citr2kiGdC4d
         QcsttxlnW2BTMuDhxv6WTEgbaCUe4F0BjKt5cJQ/ICijrB2YJ2d+ZBqOJKxbHxIwha7H
         I5R4JNN7ibXk2vO4k+MwJ4n/7JN6lxEngTHk2rIpXMYE7HkhhmxbOnQAEgUHSFs1iDdz
         TPECKei6sPUcoNY7UB7LSKEhR7zA5G0jc2NBhKaURK2tJZ8MmXcXQLCPkBNr9hnHSi6P
         YHwzuhIkhnZ6c5Wz8P75xzFuzbz5mREpBvJtcYrugxJowe36XZbZvurRxLgUBXzzofZe
         braw==
X-Gm-Message-State: AOJu0Yx7gRsqswsdxx1HIc0CRwxW+oyITCx5/bZ44t3KcZ23VF0fl4bw
	Ko/FxP7d6mIEOESPTVxNNsFvY5Zj2akg9rvoeYpXFJ1i1XhTVlBLrnwKRXfIpBtxWm00jOTDkBT
	4PyswRDlcaXgXW5yEzKJRuDwlw2G/qEqWTnJPWRbSRvnNfPef/Y3MsyzZkw4QivwFIeWRsRmJ
X-Gm-Gg: ATEYQzyv0SBs/xTBVLsTYUgfIMPPeK4f/2KWBlsZy07dIf69h4dhOa0Efir3JZ8MsMX
	ORdpWA4nlGUmWDLf8XrlI2CEoOFm2EfxnJZjNw5rpDeMYuXBI+CWX81NM2Xo61Z0USY6FOOVqds
	sskh0OO7O32wG44JVPxF2Bjo1vBdZz50QxaiZxf56MiYdxAKv7s8fRLI+QBaS5W2xSP//IKLz8H
	xlABlQvyrmvfapJrISaM6GzPMBk8J/LHUCpIkDrm+AihTitJ63xQxTZ/bMr6gQ2Z9zUxACBQBLU
	3h9R57FqDyITgmsZi/Pmq7qJ95Slt5rX9qj4g6RJO7dg+Yy87TNdwH6J54dyqHAJ38soJZtgueD
	EAeqmVuTZxKsIrZxqCMqJATox9rffXFG+6SaDJmjGFPW9NgyWBuGl
X-Received: by 2002:a05:622a:1ba0:b0:509:34b8:a373 with SMTP id d75a77b69052e-50ba38c25e3mr160915261cf.32.1774859775241;
        Mon, 30 Mar 2026 01:36:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba0:b0:509:34b8:a373 with SMTP id d75a77b69052e-50ba38c25e3mr160915061cf.32.1774859774779;
        Mon, 30 Mar 2026 01:36:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1143:869f:e06c:4587])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245f8a3sm18652219f8f.24.2026.03.30.01.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:36:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:36:03 +0200
Subject: [PATCH v3] gpiolib: fix hogs with multiple lines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-gpio-hogs-multiple-v3-1-175c3839ad9f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPI1ymkC/33NSwqDMBCA4atI1o3koYl01XuULmyc6IAam2hoE
 e/e6KoL6WbgH5hvVhLAIwRyzVbiIWJAN6aQl4yYrh5boNikJoIJxaQoaTuho51rAx2WfsapB8o
 1rxpZGW7LJ0mHkweL7wO9P1J3GGbnP8ePyPftXy5yyqkGWWtZaMsadXMh5K+l7o0bhjwNsqtR/
 ErqVBK7ZGTFZaEYFPZE2rbtC+0WtBoFAQAA
X-Change-ID: 20260325-gpio-hogs-multiple-1718d38c1f5b
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5349;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=anCW4E0ZIGfXhJLFTLzLNgLyYjg6VA1+mUORsy7w8AY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpyjXzh89dCum1hpwJ7f0nmCEc24p187AIo2Ig1
 M16Y+fblV2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaco18wAKCRAFnS7L/zaE
 w9IBD/9suGgwYLvz/LLQjUPtm435iWTwE9NX/kurJLjoo0RvMRPEtC6MN+HQJR1gZhyBpY6Iqvt
 Xn4SJE/MkUtPnVcmRGBelBpGvOE4E3SKvK9+o8MY+8SWbV7YWaSDlSzamFRDuoS0C4QrQSn/3vW
 Hhkbl//oLuvJJCF+tR7vcZtOu5VHJ5imsQysEbWalsU5XbLkn/Hzehzlen0CD6dz3U0DXEYXh2o
 TDb3NT4aoANY939bLUOt/ZMhYeriix8lFGd8ngYsBWuiomB3ZBMbr3rFGTVnypTYosYmzz9pOI5
 8Asikiv8YwrBXqgWA/PWv9GSR/IAWm+FEQ8FVaKlkTA3Av23+gd4xTjWmzhVyVz4Ce3BEEi+EJj
 rKrdciVVThhNIYim0HMIe5kBB+R5LWHE/r4x2JE+I4r6qyzQbj6Q1hSARDLeqZfiRFGWKwntRwI
 8SVTX9Q+gXkSoTC57lPtzO1Zl4Q5Vme1uGjiyu8zFJOxruRhdOjJ4FEwM4XqelsnfpNbAR0X7N3
 yKoVAK84rhEhdkFf6MKJ+BHKjZXdxH+4o0pOP49mbNw3A1zksRoalqsIPohuriH0pENCX8KgfAL
 mFrNBJ/tcG0Jq/XcCBOvjdmkzgsRUaoHWsha8apn1qq+n4Tum2F8+a5XzAspn76F7ZhKh9ONtDQ
 aTAPEhl8n59UN/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69ca3600 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=tBb2bbeoAAAA:8
 a=1mqqY-Va1JI0pYqkum4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-GUID: kHVH8LomLMfQQaSLop9OhXeQ2VcAiXK_
X-Proofpoint-ORIG-GUID: kHVH8LomLMfQQaSLop9OhXeQ2VcAiXK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NyBTYWx0ZWRfX/R8mKZNfS9xH
 ryZoVNfV/yCZcjLcLz9/C3fQMsX5QBfkIeyUHAHjSC6Ump92oFqDKlMh4zbux37cyTCLABt1cVO
 qgiHCGbEtdrGBB/ECOKOGVa2SQLRbHpfmZ0H0cGRzKDKZ4tN/ZHvH5degHZrjSXw92umjNRf+4l
 bbf47ZfppKunqIUY0PqL8ZqCZ/NNZAaUmRk+fDIlPEBnFypAOIJyUdYo4t5pGpTHPYbzoIMFM4N
 70DmxqmTy11LNMJEIJp3JZKi/6GH5g+pEklzXYrwVY+5XSRjObMrS5fI9/r47rkTVORIH7/WvG7
 YptLYOb9lzxsEJshe0rweGG8ueLN7d3AOnWW5VSIk6bY+xMdTLCMYpb9+ayp01xp2Mao7+0fSrc
 M/3R0a0/kiaGSWI4UbSvn87NGxzFi3k2w3mEu8AzH7ahZH6WQi2D7uRBIoW0e+CRgtLvzFgwKGD
 krYad9E1k0K8bBB6NtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300067
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linux-m68k.org:email,glider.be:email,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34399-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB2B7357861
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After moving GPIO hog handling into GPIOLIB core, we accidentally stopped
supporting devicetree hog definitions with multiple lines like so:

	hog {
		gpio-hog;
		gpios = <3 0>, <4 GPIO_ACTIVE_LOW>;
		output-high;
		line-name = "foo";
	};

Restore this functionality to fix reported regressions.

Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKczSk12MedWvoejw@mail.gmail.com/
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Fix types for some variables
- Make the return value check for "#gpio-cells" property stricter
- Link to v2: https://patch.msgid.link/20260326-gpio-hogs-multiple-v2-1-7c3813460e4f@oss.qualcomm.com

Changes in v2:
- Use a default value of 2 for the number of GPIO cells
- Use kzalloc_objs() instead of kcalloc()
- Propagate the error number from fwnode_property_read_u32()
- Remove special cases forced by the lack of default cells value
- Link to v1: https://patch.msgid.link/20260325-gpio-hogs-multiple-v1-1-7e3a7347f0d6@oss.qualcomm.com
---
 drivers/gpio/gpiolib.c | 92 +++++++++++++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 38 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7ee45ccdf1265e94b68fe8fa0d10dbc6adccd93a..96c776ff2669ed2404048360297cf706bfe38251 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -938,12 +938,18 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
 	struct fwnode_reference_args gpiospec;
 	enum gpiod_flags dflags;
+	const char *name = NULL;
 	struct gpio_desc *desc;
+	unsigned int num_hogs;
 	unsigned long lflags;
-	const char *name;
 	int ret, argc;
-	u32 gpios[3]; /* We support up to three-cell bindings. */
-	u32 cells;
+	/*
+	 * For devicetree-based systems, this needs to be defined in bindings
+	 * and there's no real default value. For other firmware descriptions
+	 * it makes the most sense to use 2 cells for the GPIO offset and
+	 * request flags.
+	 */
+	u32 cells = 2;
 
 	lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	dflags = GPIOD_ASIS;
@@ -952,42 +958,22 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	argc = fwnode_property_count_u32(fwnode, "gpios");
 	if (argc < 0)
 		return argc;
-	if (argc > 3)
-		return -EINVAL;
 
-	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
-	if (ret < 0)
+	ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
+	if (ret && is_of_node(fwnode))
 		return ret;
+	if (argc % cells)
+		return -EINVAL;
 
-	if (is_of_node(fwnode)) {
-		/*
-		 * OF-nodes need some additional special handling for
-		 * translating of devicetree flags.
-		 */
-		ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
-		if (ret)
-			return ret;
-		if (!ret && argc != cells)
-			return -EINVAL;
-
-		memset(&gpiospec, 0, sizeof(gpiospec));
-		gpiospec.fwnode = fwnode;
-		gpiospec.nargs = argc;
+	num_hogs = argc / cells;
 
-		for (int i = 0; i < argc; i++)
-			gpiospec.args[i] = gpios[i];
+	u32 *gpios __free(kfree) = kzalloc_objs(*gpios, argc);
+	if (!gpios)
+		return -ENOMEM;
 
-		ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
-		if (ret)
-			return ret;
-	} else {
-		/*
-		 * GPIO_ACTIVE_LOW is currently the only lookup flag
-		 * supported for non-OF firmware nodes.
-		 */
-		if (gpios[1])
-			lflags |= GPIO_ACTIVE_LOW;
-	}
+	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
+	if (ret < 0)
+		return ret;
 
 	if (fwnode_property_present(fwnode, "input"))
 		dflags |= GPIOD_IN;
@@ -1000,11 +986,41 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
-	desc = gpiochip_get_desc(gc, gpios[0]);
-	if (IS_ERR(desc))
-		return PTR_ERR(desc);
+	for (unsigned int i = 0; i < num_hogs; i++) {
+		if (is_of_node(fwnode)) {
+			/*
+			 * OF-nodes need some additional special handling for
+			 * translating of devicetree flags.
+			 */
+			memset(&gpiospec, 0, sizeof(gpiospec));
+			gpiospec.fwnode = fwnode;
+			gpiospec.nargs = cells;
+
+			for (unsigned int j = 0; j < cells; j++)
+				gpiospec.args[j] = gpios[i * cells + j];
+
+			ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
+			if (ret)
+				return ret;
+		} else {
+			/*
+			 * GPIO_ACTIVE_LOW is currently the only lookup flag
+			 * supported for non-OF firmware nodes.
+			 */
+			if (gpios[i * cells + 1])
+				lflags |= GPIO_ACTIVE_LOW;
+		}
+
+		desc = gpiochip_get_desc(gc, gpios[i * cells]);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
 
-	return gpiod_hog(desc, name, lflags, dflags);
+		ret = gpiod_hog(desc, name, lflags, dflags);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int gpiochip_hog_lines(struct gpio_chip *gc)

---
base-commit: b99f90909bdc937914fd6017d67b66d445273650
change-id: 20260325-gpio-hogs-multiple-1718d38c1f5b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


