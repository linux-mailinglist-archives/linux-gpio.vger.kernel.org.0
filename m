Return-Path: <linux-gpio+bounces-34990-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKYWDKe42GnnhAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34990-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 10:45:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 849B33D4486
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 10:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1C8D3029257
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 08:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19783306B1B;
	Fri, 10 Apr 2026 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQzCNqOL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9Kgnw/G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22963ACEF2
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810544; cv=none; b=axbHnGVww5yoLVrlVXKaTrSYPI2KbQYV518HT3Sc7rFYf+NO1ZZAC+HaVoEwzbywmxrNjiGjTDCaQv3h+tUFYSvm/nWGqFRvmsRQy3ZevRFp4rdgahAVCdMxxffga7ECptla8CUCzY/PZRKJKH9a1+yNeXi9Bk1iNG/fl2YDXyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810544; c=relaxed/simple;
	bh=4seiesAKou2NftzrCd2i6MSuzkCAgVX1zRsi7nHxC/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rfMNS6CSZ2D/ehuehFDiiZi7lQl37fEcAM83Q7uDZDoS4yoEPcCjnhuPgHSDiObPzNzkJSLwgIehMqiM51G5z2F+MpGpB78EkERLIWaI21Ts81N4mEIifTIoCQ90ujuRGPqlP5veCF1rfyY4czwEPLQ8y3jHlxNwtLNBUX5pLls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQzCNqOL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9Kgnw/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A7EJPp2626845
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 08:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9+UHaYCYaGu/ZAP+Vol8IgkCZNdaiLNShA9
	dh0amrGA=; b=HQzCNqOLkInvqM7ZWhj89BvMca6ah9RXwXWszFAhdvE5AOC0+yd
	zuJfzBJm7W0cZinnI2aa0kazbLGnRVHULDBYAT0OGGKb/GV4XruTGUlzcW7H5Uzl
	np0swd5yyb+HbtuLVKpSP65QcyQG9xLF3jJEHJh1l8fGIm1zzUKwsd9JbWFi7ghy
	7vstSzND4fLGW09q6+b2Ub+P8tFAF3vrQ8F0SaGVwG4O36YKqZhLdlofEE79of+X
	BNp5kqc6qCv2AfxdyaJhOkYtF5S7bcayOhHOcXF1Nyx2goLi2cEHATtobnm2lX4G
	PXC0bxA1fFht0dTcZVpcxxglmS3iCp0xHkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu3eat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 08:42:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d84b5f73bso37476261cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 01:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810538; x=1776415338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+UHaYCYaGu/ZAP+Vol8IgkCZNdaiLNShA9dh0amrGA=;
        b=g9Kgnw/GHGEAUfiuZUOqTdVXzqcaogcYg9AF0sK56/ieBfTD8zH/Ghxldin9LqtIZ7
         WBze19uC9EmTvO5q4z+TbxXW9s4fDGq0oljQZ8L1YdmHJQ81P0KaQnzMn6SlJ7xQEOCw
         oBoAmnClGYrknzz5P4bR3WPECWSBQ+AjDLC+WK0G46x4q6okDhxkbyQ2TcyQtZYZkiTD
         9dhlhpFBq5FBr5Y8qvBdyB15FrY9q++CmA8ux1Ub4gLpdDO39eH2/GgiDoluwBJcIM7W
         aJZreUokqR0uObpZSWvDylazqI/fcZHR4EClbrWPughI/xNUSRoE/ph0foXg9XU8eD38
         pIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810538; x=1776415338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+UHaYCYaGu/ZAP+Vol8IgkCZNdaiLNShA9dh0amrGA=;
        b=fJAlVffpv/yricJmt8Hs0C9Cbw10C/As9rHp5RVJm4tFvbdi/MCsby1z+QGIOffita
         1UkF/UlJG81E7sJ+uXoegoa7JkhKKGOyJCAA2kJYfV/nJ4h5os83wteNiltswA8Tu7VG
         gnW3TMZs8mc0J5uefZaWVTAPPJRCy/rABTUAy53KbIuSZlIaztzxINiERnw5p/Tu7p4m
         NlQrnCJKeHfPwaNjlDc7Hru27r6Fuiimf52kJy5EWOBU3Hvh/sqIM0CJc892G6DnBsx1
         9DY74ynt6L+yqK760SpMirGBkkuTEymHE6owVhlMTgXX+37gwfwx2rmtIwdZdA6E/Zgr
         oV/w==
X-Forwarded-Encrypted: i=1; AJvYcCWxfFTFdrfzfZloSgQZ2vUCFfbNf3bXk9rQYxOKtnIoPyGREJEOP1GPoNZyJedum8Vig8yCr6dCxcEA@vger.kernel.org
X-Gm-Message-State: AOJu0YzoBc/rVAso6mP52oXqnsQsSEHscy83D6NIAgCfka7ei7aY8VuO
	Ft1yhrjwi+t4LBq2khC3K/ptfbFUaEf4r5YFnZfxaSdc1tqR41/xQv/iwF2yfQFVayIXUdcCzoA
	66ArZP/hKfgCrawgxw78qnUs5QPHDbnTNY6I4auZwLTerqVkPPAcBtYIaRndhbiNNQbTYtjNK
X-Gm-Gg: AeBDietbiagqS4veh4O644hk7WeCFdzRWBrDSdf/Krcprp1kK3XUJ/Y7/DTvCZ6Kx9O
	jN6rWfcYWwAQ3x4GraajYJJsd7SqArXKN8yo1bD+hSOC5s6oKYd/ZteOvnE/NTfEdecvJ34HzN5
	STFgLCp1ej2wYM7bOjfl9funr/zlM/ri88Ky5QQ59HdL/dbJWas9IF8jfvrX555PYXC5lyfU72T
	iaKNE8zANhqo8tumYTOZrvEFw/86Uq79t4f5oNBiwJHZ+A5KAffNU8Kj+W7JuM+B4NM9Nv1ccBq
	KK328+d+hrKqZTfHUIExwieXoVdWHv4iZkt9ex/G4rB/juMT/ZFsM7VS8z9MnmX23ZoAhTjuAyS
	iKKA7KEHRWIdQKjNpEYIzDsYniaRi90UnsskOxHJfKL3+EE4zUXk=
X-Received: by 2002:a05:622a:53c9:b0:509:2527:d789 with SMTP id d75a77b69052e-50dd5b18f4fmr38684921cf.6.1775810537746;
        Fri, 10 Apr 2026 01:42:17 -0700 (PDT)
X-Received: by 2002:a05:622a:53c9:b0:509:2527:d789 with SMTP id d75a77b69052e-50dd5b18f4fmr38684671cf.6.1775810537309;
        Fri, 10 Apr 2026 01:42:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7d6c:c663:fa06:9ee8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5df260bsm16542405e9.13.2026.04.10.01.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:42:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.0
Date: Fri, 10 Apr 2026 10:42:10 +0200
Message-ID: <20260410084210.14239-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oSp1SGN3iYdguDiGm-HbArpI_GARZgFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MCBTYWx0ZWRfXzF2tXSzULWKP
 00mdepEqIe2+ujvGNt8qY+qxX2olJwFtwMj1bCFkwDm6YQESmpDIJCuMJnIAo2sHLZW6BH5LAz4
 ok4D7LkKUqpMti568jkftgDXsqHFDQNhheTU/zbwjd9Vt25MTL4TxOtrC+sN/zS5K0l/aRNeGJF
 e2ndMuRrAhFptmJYwqdqb6Ylzwi7zw/uuDVATxw31HSm5h4DucOBlY/YoxkGPShWdxHHf3F03DW
 rjpinKxj4yukoynWwUKCIKogHhpn3X2z5Ry0v1qt8rMjOujYDIN9Vk6ifXCzW4czcGz7NPdSegI
 CSW34mP1DkCi5kl4d7Jq8eHhY4kjtg1SBaNviz6lbubz+neKBMGiyTXl1nWAI59Yi+fkM0H6SsL
 maSGbRoUMyQHfkZZzfZ1bUXfBoBsQ4SBE7GRJTeorfPciINx9nEa96iqa4nmnSBuM7Lgkv+X/D0
 vdI68KbmhD+nz5lPgjQ==
X-Proofpoint-ORIG-GUID: oSp1SGN3iYdguDiGm-HbArpI_GARZgFC
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d8b7eb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=P3s1DHXM-nzZkiW2KIsA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100080
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34990-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 849B33D4486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linus,

Please pull the following set of tiny GPIO driver fixes for v7.0. This is
the final GPIO PR for this release.

Thanks,
Bartosz

The following changes since commit 591cd656a1bf5ea94a222af5ef2ee76df029c1d2:

  Linux 7.0-rc7 (2026-04-05 15:26:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0

for you to fetch changes up to 57df6923ca53b524d06d2347b896d9de74b3bc86:

  gpio: tegra: return -ENOMEM on allocation failure in probe (2026-04-10 09:01:24 +0200)

----------------------------------------------------------------
gpio fixes for v7.0

- gracefully handle missing regmap in gpio-bd72720
- fix IRQ resource release in gpio-tegra
- return -ENOMEM on devm_kzalloc() failure instead of -ENODEV in
  gpio-tegra

----------------------------------------------------------------
Matti Vaittinen (1):
      gpio: bd72720: handle missing regmap

Samasth Norway Ananda (2):
      gpio: tegra: fix irq_release_resources calling enable instead of disable
      gpio: tegra: return -ENOMEM on allocation failure in probe

 drivers/gpio/gpio-bd72720.c | 2 ++
 drivers/gpio/gpio-tegra.c   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

