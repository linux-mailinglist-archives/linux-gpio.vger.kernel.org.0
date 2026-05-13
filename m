Return-Path: <linux-gpio+bounces-36739-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO2JCOJkBGq6HgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36739-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:47:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78D532801
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C64633010D85
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5092238D6AD;
	Wed, 13 May 2026 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WT6fd/L1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j35qJ378"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA262349CED
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672852; cv=none; b=Aw9erJxTawo8OAzelc4x7t+1ylD1JOUlr6FpA9dkwDn8YB7stXTWqg5eePowDSwn9E0yJ+JyBHuNOnrfIuzzUflmpbd9BVfj8kAtRIEIExDWcURq7LurcCS44/cSJ6/RqkeBczso9P+fr4oJwuucOaHFHoEu8J0aOKQa7C1yQVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672852; c=relaxed/simple;
	bh=/xjmmJrV+IL4ZtYpQ4KnpmX6puIxZFjVg+tIPYKv2do=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L9TR4dKzpLcxK5HkNsIGTibW2ZxXfmKssLl5Bk8GEC/a8yKnA798JjdtFjNmlDpxxfozYM9nqx6sjf9TvcAsMFXgyObWp+ickuksIV77smttb3c6y4kxrc6knevgp8PERKqzeI7tCgwFA4s3YGg8p0nxuV0ZE3AiFF33+ZvTQws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WT6fd/L1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j35qJ378; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVIEE3430126
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gys/mjf5fdDyzGa8VVqeyN
	hyFUag065p0SMigo0AnHg=; b=WT6fd/L1OhdXg9vD+tf3G2v5CYVe1aUOa6lZ4x
	5iWdcXWrD8ctNnYbimbPQHDK5QkPkXnwjUlbVg+yED5Cm3uF6QwFAegB4Z1fpBZP
	zpFxipFYxRfOeA69uvATLZWzytitEwcoytlEsWTJudUziJK+gXfeQig66rSyQRwp
	7KHFJSMBbYCHKvV2UeAqP4RoMzusG3Ojg9ictlQ/xpJLRQlUkuEkZF+SZtDUtJay
	VFxQDF7XnU62DlS1TZNziYeTNcyG0fxGcB7QrxQEL6x9uOSKDNpIqnz7UJmeceG1
	v2wFM1fCKNZqVfT/kcqNoLMMLKMuXztU/XW3/GsWGo43kOMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcg8ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:47:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5156c85538cso33398761cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 04:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778672849; x=1779277649; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gys/mjf5fdDyzGa8VVqeyNhyFUag065p0SMigo0AnHg=;
        b=j35qJ378IBh1I+jG/YDDOrifJMJnaQS9vg1AQgKszhq4dYxQPxeyPgJq19Vnpb6mj1
         MbjTwih20ZSYGNZ7iqd8vp4LyLpCZCMEVVZ78PtTRJZ06hCAFlz5NFxfNwesuAhcDR2J
         VT1bz+EhLnKcIRzQ5yxZOPesScrPUwoBvgpbqrAhfzfLanKvmEP61ERq8ENgLs0MNM+H
         IZbq+VJpKG69lHQ4nLbAVhqvgJFA0v378l9ni8nrVNgqIOfapPRtg3Wc56vua0D8VRs7
         sap9UfP5mUSNsL1774ApB8KY9XNrUH6/8MMbE33RnaC3GoGCk+TBB6pNZKZdDdcJAOs8
         7Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672849; x=1779277649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gys/mjf5fdDyzGa8VVqeyNhyFUag065p0SMigo0AnHg=;
        b=JCDXVcZSAiEML40WPC20Wg1W2YzU6X/PtbHwVaNoYzLxnMUdrWq3os7nyIe2OSCYK6
         kTMA7LuLfX+Q0kulPjqa9m197ZuY0MJ8maVwn4XpFOLEDOONs9XIpl9i5nQPMN18HGkO
         rQ8jRcd9TstYZ7JeeXRzzkpkjwordMdxat/nCBbkMQ8I4lqIXa8bKlfhKKBa92Ij2Nta
         9TFlTudW0oyT2Q7P+3TjOyuMtrHRF9pE24slnQDaipU+7adXOLAUz1JvW/zYBMN2LHSv
         gMp4qr+QKkfMWwCTPgcIP2jhR0ky1RH58zIKt0ktVVwkofEIOojljfr5EbsGvm/hjW5o
         tbyw==
X-Forwarded-Encrypted: i=1; AFNElJ9t2MBSnB15/O7Dzo24rTdb48K/oqeWE+qml09YKaGiJsVptL3Y1hrMWN5Tt2tYcEeB6lNmKqEQBZNU@vger.kernel.org
X-Gm-Message-State: AOJu0YzXvolmo/OkyUWdRvye9JbbA2/PpkANAbJdqwHeW30hjTp4vUvN
	L+ylvNrIWk8XqXqEgf+utj+4dTXOFAWW4r4el3mXekTEoplkU7bJYpEWl4rgWsV+d23+2PRmJJg
	NDyXlQN8a313eOY1S2VVKPhfXC+9L/i+2qYF6QldzQCVvd7uR76E4I9tsdlgQ5022+MqM9LmD
X-Gm-Gg: Acq92OFAm0TkCdmy9GiUShLMdp1LFmrXMU/JXdqitXIW/JiYP5OpoGpywwjytitUTfK
	UG30CsKWpyh0kKvv+EGF911mjnVeavIk49yc180RtdAb4SHdgJsVraKI6eKOKdNpEDu02tUccL5
	uIW7IUAJFTB6S2kQsHPt8OY7oL8WtnpN7/Uek5DESXCK+WWxCIWaGpPIFDmB3OdE+lUIaEEkH+k
	W89khuSI4Tls2RfOSyXdg8xRcXFUEz+us2+sndPs90uHmAZ7wzLwwNF3pMd/BZBUMNqkbKjZT/q
	//9YSLcmfiLKjAT1X1QcJ/rrRwEqHivH91dqK4EbUUlPZsQASdQ5F/vDnWq32UzrDRLZHdFuk63
	ZmepwTbBkahCAmsS82c9I2lhPjMUTWT/u1YLw8hWIvwtBX7UeUA==
X-Received: by 2002:a05:622a:4d93:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-5162f2a2743mr36745091cf.0.1778672848885;
        Wed, 13 May 2026 04:47:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4d93:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-5162f2a2743mr36744501cf.0.1778672848217;
        Wed, 13 May 2026 04:47:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e5f00e8sm41615855e9.2.2026.05.13.04.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:47:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] tools: provide a shared library with high-level
 functions used by gpio-tools
Date: Wed, 13 May 2026 13:47:11 +0200
Message-Id: <20260513-tools-common-shared-lib-v1-0-58ac28a9f1d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9kBGoC/x3MQQqDMBBA0avIrB1IUqJtryIuohl1QDMlI1KQ3
 L2hy7f4/walzKTwbm7IdLGypArbNjBvIa2EHKvBGdeZh7V4iuyKsxyHJNQtZIq484SvfvLPSMY
 bclDrT6aFv//zMJbyA8wNjA5pAAAA
X-Change-ID: 20260311-tools-common-shared-lib-97b58de050e2
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Alexander Dahl <post@lespocky.de>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/xjmmJrV+IL4ZtYpQ4KnpmX6puIxZFjVg+tIPYKv2do=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBGTHzpPGSx50DK1rvLFWcoan1Q9qEyZGfwkSY
 pTKKE1RRjCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagRkxwAKCRAFnS7L/zaE
 w1iuD/94qdytdDioCFvxUn38bbwQLh8hamflO59NZzuV4/hWzpbQ3cekfyanS+kANWLsio6DH1p
 7tjcQrd1D8br9vzr5goMjNJ9k/C2c9TpgUy8nJWygbTjAPhCqSKfBvsVTD/xlY4Y5JWs4EQbAss
 wMwfmvA5TJsOrdmWVn1REwor54z3aLUHfs4mPCnvViwmeVvXgHQ53wF1kDW9e/5yQuY3WL/djZZ
 K5pCz0FI8N2RtEpI8idWpFndpOIX2ehUG9FX5p9NaC5rcXumx5rq1/oy4kMHNZnRfdNJVGDDE0f
 LJpMLjpWE3j6l0zOVn5ZvVEc3eQdsRy8OjebNM2h4nkKhnK2OSpPXcQbYDfduQFEYWLJBJzayJD
 81Wo4tbIP8Dt/x4WhtpGkre2FSjas1buuCITtfDhgYtjYio2RQmenOrO3mYB2pU1OCPvTwpbnkE
 mVmVZq3efzq1QKbUMMH2a8vXnbcWuDB3w5iWCYiPGghN2cxZC0VXJlul1DnlONw15QrTCt3jFQy
 dAcmWVE35+xIq8gda+CpqqWCFMUl7y6wpxcyVIYB/i2b273FNGsFDzk25cUd/LQOdxb+vRLD/jG
 hIBGjSoG+QMzII7TpNhEMiIw6SwgBlKeuy8jRsSUPILsJPgDLjKVGHdkRaH26cmHucMXKNZ1V/V
 QEMuQt4cnIUcNmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 7KBUdGmdsC0J2kaeF_Tth7UqLzW7e-e-
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a0464d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Bt_jH4nrRmJ2EPbj:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=38pqVnEtW-F7OryfD7gA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyMyBTYWx0ZWRfXw5ItSmoxbN/R
 FXp7SrvDpH1xgmJrnkjTwpdzxgMTuqctHrDImsptupj1u7wJjHgsFo2JujFa4EO1KaB0oS4a9yN
 mVgjLL6lsqENRosg3b1gzUwRlVWqejvn3i058t5oomdHJJMfoUm3fTeh8lPWPRRQ6LM/wk7EGdL
 PlNXFF1X1BycsbBSx9Pa8hqSzFTYDJosRShk+Fsxw7vfz3paKBSXpu7LfHRimkTq/O3ef/vyGs8
 hXjwhGefds8aac0bpAuZ1wxeoYm6m9ulFtTSlJkYVPK20Vf+PFy2VJ6fpNzn3w8bJeLIbDGDmjJ
 g1Z+MhLX8hS5Y2trFEvY/1PdArnwtaIsXFAJ5sQzcw8U6Fs349cLFGCQEhAjtlb4bkMMvF39cWf
 hW3M5ZHLB5ky44C/AiQkiSCac2P/PRJYOf53xWDMBDfh5xC2PSd93BKCE10n9/u8IP6kZg8aKrq
 4wrJzkQQQyhIpcyrlTg==
X-Proofpoint-ORIG-GUID: 7KBUdGmdsC0J2kaeF_Tth7UqLzW7e-e-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130123
X-Rspamd-Queue-Id: 7D78D532801
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36739-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,xes-inc.com,lespocky.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The API of libgpiod v2 is a bit more limited than that of v1. Notably:
the whole category of high-level helpers as well as functions allowing
to look up lines and chips by names/labels have been removed and replaced
by low-level interfaces which require users to implement the look-up
logic locally.

It's been requested several times that equivalents of these functions
should be provided in some form. I don't want to expose more
functionality in libgpiod core API than what the linux kernel uAPI
provides. However, the gpio-tools already contain a shared library -
tools-common - which implements the bulk of the desired functions in a
new form.

This series splits out parts of tools-common into a new shared library:
libgpiotools, and reuses it in tools-common while keeping the existing
interface facing the gpio-tools in order to not have to adapt them to
the new API.

Kent: I allowed myself to change the license of the factored out code to
LGPL-v2.1-or-later to enable linking against libgpiotools in line with
libgpiod and other shared libraries from this project. Your Ack would be
appreciated.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      tools: provide the libgpiotools shared library
      tools: reuse libgpiotools

 docs/Doxyfile           |   1 +
 docs/gpio_tools.rst     |  16 ++
 docs/gpio_tools_lib.rst |  12 ++
 meson.build             |   3 +
 tools/gpiotools.c       | 437 ++++++++++++++++++++++++++++++++++++++++++++++++
 tools/gpiotools.h       | 236 ++++++++++++++++++++++++++
 tools/meson.build       |  28 +++-
 tools/tools-common.c    | 316 ++++------------------------------
 tools/tools-common.h    |  63 +------
 9 files changed, 772 insertions(+), 340 deletions(-)
---
base-commit: 5eed939e0d544afa311a4dd6dac90833d38d7d29
change-id: 20260311-tools-common-shared-lib-97b58de050e2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


