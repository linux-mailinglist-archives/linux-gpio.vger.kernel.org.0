Return-Path: <linux-gpio+bounces-39347-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L/4LIU8cRmqUKAsAu9opvQ
	(envelope-from <linux-gpio+bounces-39347-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:07:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAF6F4940
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:07:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X8DtuXuF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gcgzCL46;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39347-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39347-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35ED23145EFC
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 07:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192F93CD8B0;
	Thu,  2 Jul 2026 07:51:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE67A3C9886
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:51:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978683; cv=none; b=s5uFiY2VMxRHQWWjQxGC1/bixbol7s2q51Wohk5mQP8Ef6ch0pzR3eyPDO1WwJFx5XOnc1XlUz6W5NC24XqOmGVuH3TuD8L8okXhQypyiYPnkl5xMKtr33cWHWsDC7ETr0N1aqWExEPo2rfLCjSe0OExQbmm3Bj8tOFmSPBsHhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978683; c=relaxed/simple;
	bh=TMxknwJadB6D/1zsXvPaoBdmmSnuGG+j+T5Kk50duKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PN4SuwHanSmG9NqZRUlEEBWW4zQAgSzo7Rx1T7dI7G5SntGcb556UyO3vYGyOs27fgjleFy95GucOB7q5W6dYMp0Ifl0beW7rAPqraEho0OsQeHlyYDuZTiPR3EN2HASIT2FYFTtXf0OJjEo1//oB/ah6FAfj7XFIgVrgveWja4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8DtuXuF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcgzCL46; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KQcR3049496
	for <linux-gpio@vger.kernel.org>; Thu, 2 Jul 2026 07:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=59oJEqeBp9+BVliiy2pY4P
	n4shQ5BYMAYEJ3UJ3nEiM=; b=X8DtuXuFlfbD6kuxKxqvJEqNoiDo5v3BTlejpS
	lbMhDOiq++5eEQqhbrpzy7kOsUjPVij4xee+33Xn4Pg9NczweNhwD54/JZj9V1S+
	S3PLt7kniYq3jjzXV54eGEYEWZkePv/ktyvtdMFq09Yghk5KhrK6U46PaSaSzwfB
	gYXcEoaEHYegENbt6J+E57k9c7VtTwCZuFfVlbNff7kMTOcnJ/OEF4OvP5/eYeTc
	j5qQmLFisWYCN7Jgsq+x4wXg97XfeQUvTBe+ZqY6h5BmtYrL5T1CE7DJp+6DENA6
	nG+623beAOxaLSIXVhVe2UYcuVaDxVvWUellEJqB9CJbo1Yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541uk36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 07:51:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92da6f3cc81so178700085a.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 00:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782978670; x=1783583470; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59oJEqeBp9+BVliiy2pY4Pn4shQ5BYMAYEJ3UJ3nEiM=;
        b=gcgzCL46Kx8vwo0hI3o33iOT9YydZSBIY7PLSQLhY2SX3rk0Tmpt0nA20e0x8GLNGS
         Rbs9fHmG/LvAxQxQjnIw34Yx5tbofpIcWVYkOp0/SB2xtVFKqKo8A3Ow8DrO1lui+FEk
         4/vxLFIfxK5FEls1B0+l1MJLjzn/ShrTIP1Rs8hpoYn03lw50yWBN6uHkSdiRl1dZg4D
         7CXa+l4hCHYf7/qeOmKlu7HZndDhY6fksUcC+C1iPfRnZVVRIsZ1XqEb3X5cmXucT5/J
         F/xbjFJgvFvGDMzMDWnTK3eBsEuMYtsLtE/2GxFDz1POdHNjhKCwcorUV3F3JbCZ5T8O
         hZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782978670; x=1783583470;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59oJEqeBp9+BVliiy2pY4Pn4shQ5BYMAYEJ3UJ3nEiM=;
        b=ZK2LT+tpABtQtaZVM6ZhIccaGyM2H1d5X3zmCwjXT8zqVyZdL59HMCw8AgREzL+5eO
         yo97hUrMUsDl0iX/uB2OaiWDNXoAmswNSx3rxD4Bd7gvAwfcN0IkmXmpqpn2nPkr3JTJ
         M7fxcxJB1qOkOCKSiKPE5i768LsIz3KbCHkop+EY6PWNu5WodfAw2x4dePvM0DFETOf6
         TgoogyTZfOKhguiz8vIMby792gFDFmBM034uFZg1Sz7TTJ4NcG7uJTMfCyyaQGviiWny
         9tW9fNY8iYnaFb+QQAXclsWShNAtFELPSi6Nn9OpIU1og3z38XGd77hIcGrVq2fDECkH
         ijNA==
X-Gm-Message-State: AOJu0YzIM2gjWZYqgBDQyeBdjpOjByC+O1LwklLhUY9AQkehWjvHvYAs
	IA+D4DY33reVBq+HndX1VSnPrni8USpvwFJSJhHHojWWlzUcrmTzqjEwIMPRR2U3P6cbzmJso/N
	3IXvAS6GhsgBG0wymWwrcCfav2SvDvmYEnJb9fS6tO5ArNpS6B4Vahgle9k8fMFh7
X-Gm-Gg: AfdE7cmBDeo0LFze4mr48dPbvQMEJHN9wPYrPLtzaAWX63YV7HSgd7jcjZKNmL0uOUl
	LrUAqO2zO5ibiKY9RVp+fIGFRreAjEW8oplTyKFPwnpXCIfftuoiXFv/E0t6hOJBRyvrTWMei06
	8+WzD3MGfFPDVyR34iVOBfmuADaDvi3ptFs7VnNvWaTi/SSDdXgqLW2DMyr0bgfkecXfzs+BDyY
	zpz6MXfRZgozo4t/Xy9MktoX0tve0Pt7ZnUMV7EUWAeLm5iRBob34iw+DXkVWrPGv+y0EMCUqqu
	NdUW4ksilgelgpFG6Lftob9pJoVrpOy1PuLiZlYssZEMKy229ZtjTc8ziALwgTJkKZuVYTnxldA
	ZDcehujOXp8v7jQdjkgDWUR3DcQ27R78dUW3kMNR1
X-Received: by 2002:a05:620a:4614:b0:92e:57ae:3a53 with SMTP id af79cd13be357-92e7b013345mr552797985a.9.1782978669744;
        Thu, 02 Jul 2026 00:51:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4614:b0:92e:57ae:3a53 with SMTP id af79cd13be357-92e7b013345mr552794985a.9.1782978669263;
        Thu, 02 Jul 2026 00:51:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5165:910e:4e74:80ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63b6f1bsm24454355e9.10.2026.07.02.00.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:51:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 09:51:00 +0200
Subject: [PATCH v2] gpio: swnode: remove deprecated lookup mechanism
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-gpio-swnode-drop-label-matching-v2-1-0838349eb644@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGMYRmoC/4WNwQ6CMBAFf4X07JK2CKIn/8NwKO0WNoEWW0QN4
 d+tJJ69vGTeYWZlEQNhZJdsZQEXiuRdAnnImO6V6xDIJGaSy4pXsoRuIg/x6bxBMMFPMKgWBxj
 VrHtyHajzqVSmtByPnCXLFNDSay/cmsQ9xdmH9x5cxPf9uc9/3YsAAaYVyhaVtnVdXH2M+f2hB
 u3HMU/Dmm3bPrQiB3fVAAAA
X-Change-ID: 20260625-gpio-swnode-drop-label-matching-a975ad5f0e40
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3452;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TMxknwJadB6D/1zsXvPaoBdmmSnuGG+j+T5Kk50duKw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqRhhmLYF2l8GSXmtGQS7CVq4fW+b7KrGDD5TqP
 lRXsZRbZSaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakYYZgAKCRAFnS7L/zaE
 w/J8D/sEWGNrc9npeHSsCDIC+Qn3H0O1ANMNCDNJrVq8T4JDXPP+c1YDWjdtFJREfU9qoO8VH6B
 f935rhuD5RFTQwcYxK3iZQQKwWuooq2CRRs7Ffh93VovXvQjT8Xyv1bf9RdemfJ5HyLPvnyW2PU
 dOSQS2htQOOiLQ+XioCQOsDImy1CQtC9Olj9tYdoOHhclOeJxBxCjC+SIvGO9wsI/Ky+Sb6pb9o
 GrnSNvrrbFpCrjW0bC5yoWDrHInqV3+OU0rot/yt8PJ/mfewiCFXl0ZBwnz8otzdqPd16gmWa1j
 mth4W3+VM4aDi2xmExQU4PjXypjh4W8CtDMPY69ra5u0UearJScRbrgd2Aqaoa/kmp/swxKvnBb
 iE9QVEf6wDhVF3z3sIDPddNY3T6p91xMYLym9o0qNeC54xIPQoxvmwB2+8jufsrKJqkGdwoo9JI
 xOY76OfisDos01OIULGqFnZfUsiQQHoP0fuW7/g0L3YKA1Q9MwdXK7eIDnqxPT04/87wA73JlVU
 L/Rx4AVYbxc0dDO7MNCfvXk8eo2jm+DbkYcSVorPF92VK+LPic71VzUPQTq+qv/sL8xYSRgwAzt
 DrcEw5kUiJS07SiW2xdN0UmbBPYVdOZPFCb7+D/70cp2pYk9d2X+iP+91nwOMW2Bl7UYRGzB/xP
 wAkgB8GkA3XqPZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: FFxpNS7B_myH4bJptN7_zPbpk-3Re7da
X-Proofpoint-ORIG-GUID: FFxpNS7B_myH4bJptN7_zPbpk-3Re7da
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a46186e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=HdVrfmQACTAQqbTn2O4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3OCBTYWx0ZWRfX3ZLrGmODL5yo
 jhkkXLAUmQXCzkhDjqb6VsIrl3s8uhUmaWM5MQtTjo9P0K8fqgLnT/ahOQHVaCTYfbRZpGb0XX8
 L+DDm8P9TqOK880ijfNbm7jlD7qu2ak5nv5YvvKLCD1nDj+HjHs8ncvqrm65B2Hak2OZxp/AMMK
 XOaiEGZ0uxWoEohn/gfvEO8AfjdFP6VTd48dV68qqPYz73Lg8DwgNR52eZ4CwifemtqYUfqBCyX
 RZm2Rn9fKdGLtYTOrogewaHy/a/20iCzxMS/mXtp3JQc4vA2rO02xqQxwA610PgK2+6n5XoetHj
 V+5sQ/I/F155eKycvbQYiz4DNJQdyZ/YfB0AFaJ/Xxcfv/zCOGK6VHo5tOu/R+AculNOmQYTZHO
 F8Km08Nmnu0+rfJVTuP2OHY27ZXHKPoSnsHMzR2cKUbx5H4gUHH6zQ0edts/rgfZWR53IHWOpN6
 dPMofSA1azv+gEpwe7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3OCBTYWx0ZWRfX755W10I9cU6y
 SHgrdma0Vm5nxY/XQygiSKkcIK0vc6gY7snMqNoSiBpi3EATd7o+Z/zrnx4tiTUFofgcRkeeAj+
 lXpxyGvQWEV6i5h7HimVL6dYf8myktM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020078
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
	TAGGED_FROM(0.00)[bounces-39347-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:andy@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andriy.shevchenko@intel.com,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CEAF6F4940

GPIO software node lookup should rely exclusively on matching the
addresses of the referenced firmware nodes. Commit e5d527be7e69 ("gpio:
swnode: don't use the swnode's name as the key for GPIO lookup") tried to
enforce this but had to be reverted: it broke existing users who abused
the software node mechanism by creating "dummy" software nodes named
after the device they want to get GPIOs from, without ever attaching them
to the actual GPIO devices. Those users relied on GPIOLIB matching the
label of the GPIO controller against the name of the software node rather
than on a real firmware node link.

All such users have now been coverted to using attached software nodes
via the fwnode address lookup path and the kernel documentation has been
updated to recommend it as the correct approach. This allows us to remove
the old behavior.

This will allow us to leverage the upcoming support for fw_devlink for
software nodes in GPIO core.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Remove unused gdev variable (kernel bot)
- Link to v1: https://patch.msgid.link/20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com
---
 drivers/gpio/gpiolib-swnode.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 8d9591aa9304d1eac931d1cb19597ae4b99c40a2..304994c5c7d02d5e366becf02ad99ff6f1c9028f 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -26,7 +26,6 @@
 static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 {
 	const struct software_node *gdev_node;
-	struct gpio_device *gdev;
 
 	gdev_node = to_software_node(fwnode);
 	if (!gdev_node)
@@ -41,27 +40,7 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 		return ERR_PTR(-ENOENT);
 
 fwnode_lookup:
-	gdev = gpio_device_find_by_fwnode(fwnode);
-	if (!gdev && gdev_node && gdev_node->name)
-		/*
-		 * FIXME: We shouldn't need to compare the GPIO controller's
-		 * label against the software node that is supposedly attached
-		 * to it. However there are currently GPIO users that - knowing
-		 * the expected label of the GPIO chip whose pins they want to
-		 * control - set up dummy software nodes named after those GPIO
-		 * controllers, which aren't actually attached to them. In this
-		 * case gpio_device_find_by_fwnode() will fail as no device on
-		 * the GPIO bus is actually associated with the fwnode we're
-		 * looking for.
-		 *
-		 * As a fallback: continue checking the label if we have no
-		 * match. However, the situation described above is an abuse
-		 * of the software node API and should be phased out and the
-		 * following line - eventually removed.
-		 */
-		gdev = gpio_device_find_by_label(gdev_node->name);
-
-	return gdev ?: ERR_PTR(-EPROBE_DEFER);
+	return gpio_device_find_by_fwnode(fwnode) ?: ERR_PTR(-EPROBE_DEFER);
 }
 
 static int swnode_gpio_get_reference(const struct fwnode_handle *fwnode,

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260625-gpio-swnode-drop-label-matching-a975ad5f0e40

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


