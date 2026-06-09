Return-Path: <linux-gpio+bounces-38172-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F3e3FJ8EKGqI7QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38172-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:18:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B72065FF7B
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:18:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n7mvS+36;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AlgXOM3N;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38172-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38172-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73C7E303126F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 12:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D02413639;
	Tue,  9 Jun 2026 12:18:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94007416CE2
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 12:18:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007484; cv=none; b=gPeP36b7DXCz0wNxK+OmldXll4CMiJXQbcoEbypiarhE0OekSiH+0wD7QA5rYZlwz7hS6p+79pvVlr8LQciCa7+9Bb0L6uh2JEESNQgA4v1WhfW7x+wp3iweuHJZHWJvgnvgyJZ+D2vzOD/hXX8fC/xrldnxZafKL6+yioAsuYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007484; c=relaxed/simple;
	bh=lZRnYZhuzqXrtTPmeY80cx4Vkti1Ul46ZRxXKJJPrIY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a4FagEAFdZZyrBLA0tMh18CCb5DlKPoWablqj3ytBr5mUuyVXrtFBuP7LmEWOr5RT2qAVXrc525XIFP9JECOQ5AcFRBKEmLuwOJsP0yBq57A+jW6jm25EouVUmlT+ms30lBaTH2AzpYw7dR3YA999ZEOn/Dpbr7sQQtCaHw12hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7mvS+36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlgXOM3N; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnMcc2051738
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 12:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qJyaln4FuJN75LEWa2FrJJ
	mCFc0857F/jiqNKWUskAM=; b=n7mvS+367Me0hA1PehVhuragZXGGirl5txcgYw
	LgqHZtyoRv9Une/Oiuk0iCw6fo79Za5GR3h0XKc25sxKECEsy4+YyK3O55tYfHi/
	i2KVtTXetUJ9GQbWKmwbVZ5LdZd4DTcljE9T//FWVRStJhib/slDruKjp2EjAFqz
	c0Yh0l2Yr4xcOuLzRHYFvyybT/+eHocpqG8uAvHI++DX/rSsxXRh09RCrFzHW37n
	hOUlKIMb4J54dKo7eFToZWt/k3giEiuF4paAetDt6qjt+F6iaEsKVK4DELUZRehH
	Pys2i9/zAlyyfCty8MrHX+zFR9y7vtksNmrcLPsXL4nJV1PQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr93w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 12:18:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c89de84f33so5886563137.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007481; x=1781612281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJyaln4FuJN75LEWa2FrJJmCFc0857F/jiqNKWUskAM=;
        b=AlgXOM3Nkpcy60YmgzOjKAzUFu0pIdH77GXLP+0Hsv/4OVtaYTXO8uIqR7+Dx1RrX2
         RLNS+/O3U3YilOudyv0sepAkeEsg1gTmke7+vN25gIB60CeFGxgsYwGRtnwqOgmC0RMo
         qjX7txeYFXOrQqovXKYHOAFnz/MDnUPwws6UM89MZd0m/vE6w/I2hi5x3Tc8IUSkWW+B
         peV6VjXcunqq9g9a3qwPy1YtAL06WM1QAxKuKVfAOIt3AVcvvMZTi6DvVWHMWNI+DiDq
         H7WXEWTYKH13n1jjVX7eep847c9izcZmL3/FdnSQ3QJA46oxIPWh1K9cw0rhT8fK67qu
         A49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007481; x=1781612281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJyaln4FuJN75LEWa2FrJJmCFc0857F/jiqNKWUskAM=;
        b=UjU+exn20wnR5uSHeCNjbZFOpTHhU0CSb/igDcl+K+8gamI/1/+XP3rKq5vulIuyT4
         yhcUtGq6YBhdeNxWUzFuiQkE7VWlCAge3ieZns1cXj5kHOluPNwLwfZRrf99eUnXj+WI
         2rpzStGuj+8B60ExU18ofjVoP2PpEtq/V/ABfdyp871GlSKZETAvET0R58wtlngjtiXE
         SGiTTkR/vutjGvuyazRQ1xVDNZx79hPj/u4DK/H8KatethX5L2YG11JlQPjLHkd7N/+y
         HC2RLwXr2te+wFbEiwYzKhGJgiM89noZABj0+BzKoHHY648DtrkL+yV3V1fVOFLE6Jbv
         C6vw==
X-Gm-Message-State: AOJu0YzUxulK3gIlbXnlHE9LfD1IhCT16+O8XORqLlY3cPSWJr6V1/b3
	raud8WAcQQf5xcmWxwo1N/1+zYUegOS3fpQeq0eUo8r2KN9i+8QuFLtP7zhMle5XF21fAFeeHgh
	5zp5WqBeFJW7Tclcyqp4nDYANwMlzCc1d/2G4d+9xGgHtU0R6yYQgd1lfS/vLE+fA
X-Gm-Gg: Acq92OEqEJ3Wz3hKcwz827KzeJtis5pDxtzDkp/rhR8dvK9RnB8fS72EHG3aPkC7rK3
	xyvmh8b5LdeSCZ51rIrNZFQqiDzzQyAaCTCTkUeWQDlFP/5396kEyRJkWo3TqFZTrSJ9S7g2tAt
	3YJVTzrncAfDLPkWxsq6SnMfJSDlx/9GBNTwbb9bSXC8i+Bov5Z7dcAz3ZzNPjcBagt/OKFSQ83
	iIjdsP49C21Ii85iRqb5mmu3wXBQllcYPTGA2zm0oSjOwFBXceOIzpN8STqBkxKAhLBezGEuxHg
	mjwl61DF0b/eiyAmuvcw1FOJIS4oUz+pI6pNOVKQWWWoXYSDFGNdm5Tz73oPc+Z1QCuGZSo9ge7
	Psoi9hShgisCZAhuV0FRD8DuRN8TqzkNEvRdIancz0mvXlK9IYPNpwfB4/FFRtQ==
X-Received: by 2002:a05:6102:41ab:b0:632:73ad:6c8 with SMTP id ada2fe7eead31-6feef09b1b6mr10463449137.7.1781007480702;
        Tue, 09 Jun 2026 05:18:00 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:632:73ad:6c8 with SMTP id ada2fe7eead31-6feef09b1b6mr10463442137.7.1781007480343;
        Tue, 09 Jun 2026 05:18:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7c63:2aa1:b7ca:7546])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm64099018f8f.4.2026.06.09.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:17:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] gpio: fix regressions in GPIO hogs after the code
 refactoring
Date: Tue, 09 Jun 2026 14:17:48 +0200
Message-Id: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwEKGoC/x3LQQqAIBBA0avIrBvQFuF0lWgRNelsVByIQLx70
 vLx+Q2Uq7DCahpUfkQlpwE3GTjjkQKjXMMw23mxiyUMRTLGHBRveVnRk7PuJKLDE4yrVP7DmLa
 99w+sqiXfYQAAAA==
X-Change-ID: 20260609-gpio-hogs-fixes-89101c999a89
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=518;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lZRnYZhuzqXrtTPmeY80cx4Vkti1Ul46ZRxXKJJPrIY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqKARuE6MlI9RyLAexzkF+01cPvB4IA/V/Lq3H4
 sNEU+JFTvWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaigEbgAKCRAFnS7L/zaE
 wzHdD/9Z1RqlGYZFcoIjEbPozXOxA1fU1maKroIja+5dgOIR/PMSttIkaVWiBTcJC/G0qMiG8we
 H0nA3w9gP4Uipxx8xUKDa3v9BTr1Rwopo5MdwnBWODcF3SwaPsC5xM0/CKq+PMMP/wUtjlJ9iha
 TMzx0IxzBpnsDYCbyS0PT/iq/xNtPJquCHYRf8WZdrHa6RXduzVcvLdxHa07hIIkQftnLbBW3Ev
 qb9cUyyMVjDKgSmv4WussQzEwt4HfWj+0ahJcKQnWJGgU1NpNW9JbQ6ITWscJ/wgRVH6BDAusvF
 LqJbreomFE2CEfGM1hkIe/z5OSXSl9aesbZR+roJNAyXgTcVqtZ3a8Yjn4kVVyihr4tMGeW4HYG
 LZOSglH0mlk4zPNibsDaqnZsClFsIeNVWIBSh8QF3g4qb/j0qCZh8sczVf3CPHGeoiJ1ImyRqaS
 0ytEg+2KQJ6HLSstIIRP34PFh0sI5GM0YIVucwAc5zU005RIm8w2jNtCtwHzEO/qgxdDpQ5TTIk
 1M1rCg5D9b5JctQqXejmTCp1cNrOjtg0KnBlypxJFL/0hRT397nKNVPdEMsAGIKoQBu/EYlq0xo
 vrHg0hxHqboAtGeRo12434Txw7peSckLLyzFF4A/k7fhl7zB8DN+UG6BNuXXWeRXiHbJFvjZtmM
 yMZ8ia+ovOzJ7TA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 7sNQ3Oq5qd1_sfxoRbbDLOPy-QW9xARY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfX4jtjUS5VCYKv
 ksxuMyJNuhxq5cMko6nfbmTi5H1zyHPprELhuAFJbOMYsE+Aev4RfxUgzltKnJtkxPBpUZ12Br8
 qbGFwcJ9Fc9q5och30vE2ui62AEyiVpbr/DiHIA8kmp+UwKnAKFSdmr97f6JLSGD2h3XmbdPnsR
 UAZWlXxeBSe02i7yTtw+e3ZAeQj1mY3eFRNuOx9u51P1L4lARkuNF7r+dGhhDAQN9258fxybnQS
 bJGuWqyU1ooTUqKxDFrtZv8YueA7aGyWXLag/URwnHGDvr+OoCv8ctxJNBJePUkSJ8WEgkviIyy
 JFf0TO9oaNJIRIhXEuPOkmufyFWQ8gS+a/lI6bzwkUa6V7WM/yaRCZAa/j8Xbq1b0CUP+SRh9gy
 9k9beyQb/z74BBS3k9kDjUzp8NdrDykIugmFm54Mln7GrTIqM9t1G8vfh9pODXT+rrsUaHC6prh
 c11TJvkmpE5lskM7yYQ==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a280479 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=hRla_vGHry1h9Qcb5n0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 7sNQ3Oq5qd1_sfxoRbbDLOPy-QW9xARY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38172-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:mika.westerberg@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B72065FF7B

Fix issues pointed out by sashiko.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      gpio: don't process hogs on disabled nodes
      gpio: fix cleanup path on hog failure

 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-gpio-hogs-fixes-89101c999a89

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


