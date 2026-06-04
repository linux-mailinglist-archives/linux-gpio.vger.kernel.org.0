Return-Path: <linux-gpio+bounces-37918-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bsmGAcsuIWoCAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37918-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02F63DC3B
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ShMhu7gQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MZmjjPUG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37918-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37918-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AF1C30941F3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48A837D137;
	Thu,  4 Jun 2026 07:48:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC26316197
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559293; cv=none; b=EUd6B2dAMFAQqh3dMCsh0RsURoP3xgbPtlVJggTi1vNkbad/dZGxxgnLTAWXSEX98cLRjCRPGuPs2sKp2gzLlqok7sNmFsChoej2UCZqB5IYqfzl2hnjpCVwo7OwnTJ7QK9J/nyFVScCw73+Sej7E5XBjxS7D67J8HEiAgfBKt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559293; c=relaxed/simple;
	bh=FSflrhjAeW8P8P0eiYbfUls4aneun8OPk2jDgSEFMnY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YJcQn71JDYTe/LCbxVfq9FXm5wMLxRfcdp/EZQqGvwq37bfZXGo4gLkkbmf65RBx14+wt+w3H6uuMpEG2Aus5yjwxmft0oOihCDSSPWTnBVUf0e8528pvL2NPrmwemLe2/LNkhfvI9GPsbVjOLNgU/64twhuhPychVtmD2NZijk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShMhu7gQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZmjjPUG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543xm791993560
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CicJEAaBjnyKjPrIhgufCA
	ZWhApGrklIzKd1ddCNHPc=; b=ShMhu7gQJAr+KeCdlmc/n6qo+uxLPYsBUXZcso
	7sCf9HWXaReIi8kf34XYk7dsP09f8T5lXp/NpM8gUidL1CqF6HUHiIC2EHQCli4i
	K5fBsFJzkO4/ua7huYP90wh9O0fElNDRwtCv+KV/Dx5DVoxu14eDwnHzOc/P5x+a
	FABhjOXpE29v8ObiMAmkxJMNyihdasQcgRmzGNYzazhRp1XGsZ7NiO7gss/A3Xed
	jwMGbAamchHGGE1q5Wi+m8DXZqVA6w+S5Y/C5x3/TKLzueMrJ5SlgfWlG5m7kwC0
	CLTiqzZ1yMo7sNIqBO2+8lDvJ4ij0pHrFObfkLFTJ6VzZ75A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8ptj9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51758177935so10745371cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559290; x=1781164090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CicJEAaBjnyKjPrIhgufCAZWhApGrklIzKd1ddCNHPc=;
        b=MZmjjPUGL1ocRDXq4MRlaD2WquXhnI7Dgd861+kxLniL0zTxogAbt3qvHzIdrcVN9e
         HMXzWLxe3slGj3AGcpo06Eu58c7zIGsQB6S3E0/zRJIxmQX9K1JSP1bEIRFjRajY90Eu
         Ahx44iR4ttoMRXd/X7xaxn5YUYlI4CbyXNyRst6ewnTEKAcdGm0ILDXCNT8x824RvL+n
         Gz/v44xd4uWywNRIaPgDfNs9eYaRy/I9Wa1Y2pFalvhw49pA5x1RCeHAgIrWvoy8cC3L
         vbhkabTuDofImTSwIvYWHMuyEUa8cy7G3mnVTBbDXoUfGxNDDHcNKA4KHg1PpB1RpD9O
         CQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559290; x=1781164090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CicJEAaBjnyKjPrIhgufCAZWhApGrklIzKd1ddCNHPc=;
        b=kvqvM8wPkXVEVQJGu12FVVAiUauGN0vV7wJWuTIRas+Co1XZHAIN9B4LXuMLVvgljL
         XT7rRpzJhrs2bCelOvzQH8FPBzlgleaXeHyVykc/1hHEHVAL+40ndH7sIxt751EW0e4N
         /y20iIv5agd0LZwp7RgKmlxL7PywxNvhzoEH89n0/cZVWWhjt+tk3Mf+moBzrVvQau8l
         wc1Z9VThTmb5rj3bcNihObLgW0aIyP6/H6l7sAFAIXeNy29bpVQ9e/y5KCPQk/B3LZke
         rCGeK58JXOQK0xNohPFhjWORldQS0VlJj5pxrg3IoAzpoccvi1pYFC1zUfv+BXvglIQD
         NLeA==
X-Forwarded-Encrypted: i=1; AFNElJ/y9F9arPynSgoIgbfbTvg0TJE3VFFvEAjnNlplcmZmqitoYvodxgHMv+N4l1CVHcfj/d8uU/6kbq7a@vger.kernel.org
X-Gm-Message-State: AOJu0YwC/dAkP4I7wpXR4ywnbAOvNbaHzNg8079irTLbcL+tavofNU9F
	KQ0ZKW4p7aWEAaJeOB38MeFpoeZ3qAkNUBmI5CVz84hK0vIQ2t2zcKoGrGIzL7BIctS8SeCSx9Y
	w2UnvI1hBlq9Ly6Z5H2WkA5pt5HXGgvZaSrWwd/YE9WdAWkYZ0JWdtG84href7X5h
X-Gm-Gg: Acq92OEju8QMWkCZf9g93hBK37Krwe9daviAiCDxNoIb0qtqRonPuBwqtMEyFS7y5WV
	+rUXRTny9lliCxivz8Ao4sB4+cJGSKtLPdmlq8z6QbAQUBXyAl4j1qCiTdC9SjBqsf5t/Tw3qo4
	Fjmik6Y8YTZM9WnkTeLkz1eD3/0QnxAHczILwxCcXZVYQAyZjOPSk+ZPYlTBUH5io8g3dXtfsyh
	7itwQbjin5jVczK8a289QEc+jc+xBzpg+Wz8fXyWTv2tizSKU7RTMd0DqlnyEHjOMDm4odWK34A
	Mqh5pC21caTMsECS0bcSScXOqnd39b5N9+ZtZN+4ZGWUQAzqr7qRqBSJ00gQrFBLAn7mRbebSvd
	sb3Xjvn/YOB/9b5m5bIuYtXohj8ilesKP/ojpEukKQDV6VpfPsdc8tntERVUuXAi78Uo/W7UIYV
	wAl/cV1uM=
X-Received: by 2002:ac8:5dd0:0:b0:517:6665:2a9a with SMTP id d75a77b69052e-517787bf3d1mr97471381cf.50.1780559290442;
        Thu, 04 Jun 2026 00:48:10 -0700 (PDT)
X-Received: by 2002:ac8:5dd0:0:b0:517:6665:2a9a with SMTP id d75a77b69052e-517787bf3d1mr97471181cf.50.1780559289978;
        Thu, 04 Jun 2026 00:48:09 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH libgpiod v2 00/15] treewide: an assortment of pre-2.3
 release fixes
Date: Thu, 04 Jun 2026 09:47:43 +0200
Message-Id: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAtIWoC/12NwQqDQAxEf0VybmSNItpT/6N4cNeoAXXtppUW8
 d+7SE+9DAyPN7ODchBWuCY7BN5ExS+x0CUBN7bLwChd7ECGSlOaDNfASJhjL29WdGxdn7uuqGw
 N0Yn0BFG5wyR2WMV30EQyij59+JxHW3by3yb9bW4ZGqyLnIwh67jim1dNH692cn6e0xjQHMfxB
 fXIROm7AAAA
X-Change-ID: 20260601-pre-2-3-fixes-cebcf3cd48b9
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FSflrhjAeW8P8P0eiYbfUls4aneun8OPk2jDgSEFMnY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2leLc0NBCmigHij+SEC4o8He8g2Xu/SVbZp
 klPEJ+kMTiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtpQAKCRAFnS7L/zaE
 w3ltD/4+IXshefnZw0YsjbZLWBU1Ij0WnK0OWTRgFEPz6XmnhcMWtU89qDBfeAlHgkWgw/fU25S
 7Kdyhz9TyPLmdEaCqEpyKwjMdioa8BddREIVjNxhcNr48H2FAn/nsKpRvH3oa75R/nbWOqmpB8u
 mVh/vtuxNw+hjD16Py3Qw0+XLA+U+kHruU644AKI1pAzQA+WnrcHNt5z+RmRz0qbrl1WHmpfQu0
 s8Pv4Lwro81m65WuNld0F0GMk/0gQ6AQnaMo8dl9/rACIniU/pOI6YNP8c3txn1ifXpp5S0YGtU
 cCSWh6xvxinW6TnWHqFC6lCBaqac1+K07Yi6Ps3H8ce9a1CQrYiNv27AOUrhpJbWf3ryjE2J4Do
 pllcTFlYvbmd/ZIWThA3RKN6n0i0nnqmAQ2c/1A6/nquTtMfQfrGIT5rNBr2ZXs0z2xBfzApglX
 sG+MxkSrtbEBxNSzQfZyUWQo/ujTc3cjtyJFvB/xE6X30ISHkwVMjJDESEnSP6JwL1lveM+GsGD
 nc4OK+OJFPmtibgXk1kfnPMYa8Ahwlf1cw4zLNTOniytP7f8v4Zi6pwRg8/jP3i+q62OJJlsV7z
 7w9iHzv1UWrsMMcRC7Gd6yqlPVCYzuqrqF5kSNSH+mlw335nKpR5OFV6vgXS+EV4VInEZbU1cUD
 0Mk/JVjztOpZYXQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5y0FDjmi5qs9MuTw-loS9Gksbpq5TxiO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfXzShQIryzDMoU
 9oPZL5Vhru6mRlysU+hLgbukQz5KBnzcu0snHA7VRRtH7Z5XPFK3QAZTN9A6ArTkd1WebQLtPef
 3oTYvadJuSrlQ4SiXemt0v9Mc5DPuVsnPyKmZME1/DPrQzht3Tr64GirutJijIj8DScQytUfOhH
 g26sQ5geZrp0h0qI3Rbq24n9WCGOIlUTmUHd0PyRbV4sbHFVmXaaEQiNULx0cxq1O0qUuzCL5Eq
 WnoYWFEDWe3wf/Z13WkKoJYrSfz4r9wYci5k+YFdVm46+kYi9EbcaUG1lGt6aCYmMGbXvAJFF8N
 SqD383F45p4JGezsGgNXiJ5WQMFzsqMEJ+Y6ytMDk8hQxTn/67lC5NVadQM3GeC0YWSWZO87Vy1
 fapVqbJiinpy2TtQvC26sBHnkHkPrIkf8A+s5x5DwhTIqDwtu27xuKSpoHSljyqt2GNmNO0TB8m
 9mG1KoqdEcISlkGbr5w==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a212dbb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=SNjjrTGsRKWBqO1QlPwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 5y0FDjmi5qs9MuTw-loS9Gksbpq5TxiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37918-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D02F63DC3B

Vincent: I also used the stronger Opus model and it found some minor
issues in python bindings too, so please take a look.

Viresh, Erik: can you please look at the rust changes and Ack them if
they make sense?

--

I'm preparing to do the v2.3 release and decided to let Claude to look
for issues. It found some interesting ones so I also let it fix them.
Here's an assortment of AI-assisted fixes with my oversight of course.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- I previously used the Sonnet model. I know also had Opus look at the
  codebase and it found even more issues
- Link to v1: https://patch.msgid.link/20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com

---
Bartosz Golaszewski (15):
      core: fix signed/unsigned type mismatch in gpiod_line_request_get_value()
      core: replace strcpy() with strncpy() in gpiod_request_config_to_uapi()
      core: add explicit NUL-termination after strncpy() calls
      tools: gpionotify: use the parse_config() return value to advance argv
      tests: gpiosim: remove dead container_of() assignment in gpiosim_dev_enable()
      bindings: cxx: fix consumer string in line_info stream operator
      bindings: cxx: drop redundant class qualifier in line_request::set_value
      bindings: cxx: use get_mapped_value() for all enum mappings in line_info
      bindings: rust: avoid potential panic in gpiochip_devices()
      bindings: rust: implement Eq and Ord for chip::Info
      bindings: rust: use repr(transparent) on edge Event and simplify casts
      bindings: python: check for errors after PyIter_Next() in request_get_values
      bindings: python: check for errors after PyIter_Next() in set_output_values
      bindings: python: release the GIL in chip_get_info()
      dbus: manager: move g_tree_remove() out of g_assert() in gpiodbus_id_free()

 bindings/cxx/line-info.cpp               | 10 +++++-----
 bindings/cxx/line-request.cpp            |  2 +-
 bindings/cxx/tests/tests-info-event.cpp  |  2 +-
 bindings/cxx/tests/tests-line-info.cpp   |  2 +-
 bindings/python/gpiod/ext/chip.c         |  2 ++
 bindings/python/gpiod/ext/line-config.c  |  4 ++++
 bindings/python/gpiod/ext/request.c      |  2 ++
 bindings/rust/libgpiod/src/chip.rs       |  6 ++++++
 bindings/rust/libgpiod/src/edge_event.rs |  9 +++------
 bindings/rust/libgpiod/src/lib.rs        |  2 +-
 dbus/manager/helpers.c                   |  5 ++++-
 lib/chip-info.c                          |  2 ++
 lib/line-info.c                          |  2 ++
 lib/line-request.c                       |  2 +-
 lib/request-config.c                     |  2 +-
 tests/gpiosim/gpiosim.c                  |  2 --
 tools/gpionotify.c                       |  4 ++--
 17 files changed, 38 insertions(+), 22 deletions(-)
---
base-commit: f0f56bbba3fa5f31ae20cee49095884d609a77e5
change-id: 20260601-pre-2-3-fixes-cebcf3cd48b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


