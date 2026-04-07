Return-Path: <linux-gpio+bounces-34787-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJqSJvH91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34787-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEAD3AEAB6
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EE7D302C5ED
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA853B38A5;
	Tue,  7 Apr 2026 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbMfHKWi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHK4BIyC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A03314D2
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566276; cv=none; b=fu1Lsigjpy4ACkv9BVRZWqmM8AloaAqbOKoK42sospEDaQ9EzekoB2TW11n5ywIPa7UplqMMkpupIk+jmliag7sgNjjR76/Cp/Co7cXuPSwC7IoQARhyTC3rxsphfDIWLA72vt0d4Th7sZOqLRgU1TjeWcsBgPKE7PWEaOWFM7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566276; c=relaxed/simple;
	bh=ttm7JSjNe5kF8yS5am7pw1hKPe204sZeEAmVfi+6O78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IospxUAJrZZfO+Hb7xfoqIGPH95AK/OCrtd7Cwz/NEsHbJ8TRkMoTQp94ARQ1Z0povhjmNSM8n4fBxWKa7qltd6nKNz12UrlQHM1SgUNkcg+fARA78HMnvgykR49lW6woCCz/uhi1KY/TGawpCQLdpnm5V1eVIstFP0clyHYugA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbMfHKWi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHK4BIyC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376vWji1403540
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r3zfo0LdOIkLezJVOoU/Jv
	Ymj9frVjTnEiOuL2gaEYw=; b=gbMfHKWi7MLnWOgDvFddg3qkaqu2vdWki+2ukr
	ZjWOo3+y7aq3br5PSHEwmpq5IJhYJAWOQbRupBZUK9vN+UO5RXHmrvcOFo+gcMJH
	3rYJa+0vN5yaHmFNpr0EGxtNqELFIH1IBC+sNpZAo8WJSH7/m8AdD0A86oBNiXqu
	m5sLYYvF1DnY+VCbiRb99CR2EohhI3qp9gdkAFYEP/nhlwEVFBw0gUeyNM+XoTYi
	4JmJ03eViKVX768pbsh/DvS691Q1ypyA8u3voivboiQyojMrG/4+tZbyB4xlBX7z
	GiRIX6sR7ydO1Ba66FXumAfmVAXRTvxD09gL+b9HIhMaswvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8as9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4031b86dso157686931cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566273; x=1776171073; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3zfo0LdOIkLezJVOoU/JvYmj9frVjTnEiOuL2gaEYw=;
        b=FHK4BIyCX+a2lfbgvnetCvBURwcEQc2j7CP8m9C0QMaiFkxltvhdlYwcexnmNvAMVY
         3c8cty/O28aByf5K5ypp9Z+CQbTOIsMqQkyIk7bJ7mliwszFKLNsEeXxB8rbfnz3q9Z0
         8oJO0soHbSvMkdxRthYmsb3JsBgByLl7fQ5csGelTdjKKWb8qGhXIN57tScChJ7OWyzy
         dsDuDQ430Z5KzeJ97VWU3eTZicuPI4HG54GLSv6+btFc07EFEfT62mv0uXRYXt///QqZ
         LyvYUFSeNP4eaI1vIOPl57uFVKgREjc4B1U0YSRUbPWPcHaRuH6apwjzq6254vTxLSQF
         4nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566273; x=1776171073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3zfo0LdOIkLezJVOoU/JvYmj9frVjTnEiOuL2gaEYw=;
        b=n5F+u7wx5lLDwgEoJKv7Vp69kT0Lf97/EXCo+2TB/amP6gbFiscdSL/xJAs5Ih/W8H
         Sh9jO0I3f78MYBqA/aBc7dCh2338Ye7bW4hKYZXgwW2E7+Zge84nqF8Pl+1OLnB3xGfU
         hhftJWWuZALtj4SH/0UAbvMO1oDvJyYNyx3vOfgPCstkgGPkoHslpQAOjKT6K3Im/vq7
         3we5/sfZMw38jd24XTxMJRNi2CuWgOvMulBzGzYdVRqZ6uA3HwHPwHLTl0NAq/VVNn68
         aaiXZDvbY2KWoeneAZDbzvRMPap7uww7jSRbW/80SRKBmTqjdUq6Kdt2Z+oVUCjpgbQG
         8maQ==
X-Gm-Message-State: AOJu0YwHGAUis6R1dtYsMLDnPK9H1U3I728fcJrPINF723nwHEwr3ntF
	lSO5s03JgYTZ875dPyqpDX4nGUJDqyBNzfJV4lPJ5sb8xraNl/LSwTutkkCa3ZnyayI50KV0fEA
	SAJiISEU8dlW5xMbtILLhSGdV2PhwH5o2qwlpUQS8PXes1TVv/Mn95oBbAfdDer+l
X-Gm-Gg: AeBDiet983lUjldnMrjXBUf8ln2YD2cem3Gf3Eeq3GiV/DYlU6IasOrq9KodXBREqNn
	m7OhGfNh9J0jgnr8cfgXNqvxeEXU425yBSas6a+DmA9SSagwgpfNMB78fmRP3Q5+zHfqy9E38LD
	nJ+htolsTTeN2uN1i92jOtXhPENwgSv8zfVryM2bEVBNdWZ1C3ZMYx33tOZIbGxoflZL/I3fSEt
	aYck7td8et2z69onZXPPVJlttdcOEmJCkq0aiOwGFD3hcYaHLnklN68bW8K3yeo70slvKgQNe08
	jfMX24BJ5Ywl8ftLOsMsHkXOwDUSd3AWB+uMu+kC1jsrhY/H1zkrNTQVSwhGmuvVMW5b9GL93wG
	9Db3u1P+t4wMHOQtP5j6HqSGfN5shSae4EhgywkXcDP0DL9Tfkc4=
X-Received: by 2002:a05:622a:181d:b0:50d:770f:ad23 with SMTP id d75a77b69052e-50d770faff6mr187778571cf.26.1775566273267;
        Tue, 07 Apr 2026 05:51:13 -0700 (PDT)
X-Received: by 2002:a05:622a:181d:b0:50d:770f:ad23 with SMTP id d75a77b69052e-50d770faff6mr187778251cf.26.1775566272784;
        Tue, 07 Apr 2026 05:51:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH libgpiod 00/14] libgpiod: assortment of fixes
Date: Tue, 07 Apr 2026 14:49:51 +0200
Message-Id: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHD91GkC/x3L0QpAQBBG4VfRXNsaGpRXkQvsb00J7Qq1eXeby
 6/TiRTgFYHaLJLHpUH3LaHIM5qWYXMwapOp5LJm4cacHrjVwsz6IBgI8zhUUksllKbD4w/p6Wj
 V0R26W+rf9wNaI7B8agAAAA==
X-Change-ID: 20260407-treewide-fixes-e400ba546454
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ttm7JSjNe5kF8yS5am7pw1hKPe204sZeEAmVfi+6O78=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P2sswB60hjw7hRNFXCqvPUmYaM6i7XydB4Rx
 ALFg2pTreiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9rAAKCRAFnS7L/zaE
 w5jyD/4/GAB8s7w2aAfGDOAwibUzyyObkk5henh7NU8Dt1N3IEc49xv0/MiTO5PykkyIUFM3djQ
 /kB+K0kmqzmwj1ibmH5rH2BW9gmu4OnsO2jeQd+bGcVAnLByL8gXPNXk9JhVvcIsw69YRJ8eIEE
 k8JfMU2Y2OLs01VFSFdEgRup9kcVhI4BFQJvDvRjCRDh4lWopX2Zyfo3qBvq3YyIgt5l1Ha5n/4
 XJZFedElDCxX1+Zh4kl/JGdwpIKV8hyG6McPcDVSisUZNwdKFK+ZFs5DDLQPdZRRYr8duWSR3A1
 9Ff73ZnXVpzdJxpvL+V/lYgBTp81l0Wptl1U0dRSmRsrjg/TQw05AeRMt4z4Bvl1n0V+FX1rjMI
 DlUklUGjxGYsGcXfK+sKm37bEUDROHrJimjbxc0o74i8s6T99z8LQmHU33CTsFMcju20peWxXcl
 0+/zjJChei7YRh936OeNElFlxSO01wQ25u1zAU8YvTpJruyELBLct64TfUPVeIDkG6QU2YU364s
 WKQiy83rALUMXgmSvZTp8q6Em4sPuWS8ZVQUEcD45j/M4NQtqjODOk0nSuRiVDD1WdtNGgAgmoS
 HvxNPjSRzbmEofOFXyO43fDpzp9A1E2o/7UkugL/LCx1iFbff5P82Z33Ei3ZtB79VsnlebWFWsc
 RPEpW3N8hMEU8Dg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: BMRoOyqpcDbic_LRv3ud3FOXCRuNzYoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX8NLcBS26gm1X
 b1nxKuNsC4IeR0ptRzs/Si5Sh0N1+PrZ8iqcAjdNtk6JZNfIiMkB1TLyk63eFwLwbYT+oOmccga
 dl4D3PCUKRGVBi0Hd9MrHZdBIm09fZ4S+8dbYGfvMxNk4v94gjaoETYcsk6MJtiti7KJ0/4D5E3
 cjncEg9VcyJFf7m/bGplBzvGsQHh+7GUIxWEQneFoFETqvLsZHxb1bKhC5AcV2NuC6KOc2XYUJ0
 opwi2uvkPQlUZMpt3j/l/vA33i16XETqhLGngRbcs2b8dlCpJxTEm4sQnh8vIgSJDcHZjQnAh1e
 NSTG7LV/4qF19t2XBIDF+F7g4emiWYw2P4LhJPOezgSoTQumBHZwFLMNacQ7EJ5J22LzwmbaiND
 A876zRgugAnbevuS8ELQYOnAmnpRR/nV7zrKb/TS5nDXowOg77KVQW9gYNCdeW3GFdFU07sLXR0
 VMuQyy5oYnGrSHz+ZcA==
X-Proofpoint-GUID: BMRoOyqpcDbic_LRv3ud3FOXCRuNzYoU
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4fdc1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WUWnMY9dXIwv9f4ED60A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34787-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,proton.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,proton.me,xes-inc.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAEAD3AEAB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a number of bugs reported to my by a person going by
4fqr <4fqr@proton.me>. The report seems to have been generated at least
in part with the help from some kind of an AI agent, however the person
behind it is almost certainly a human (these are indeed weird times if
I need to say things like that...).

This includes some urgent security fixes in python bindings and a slew of
changes addressing less severe bugs.

While fixing the reported bugs, I also uncovered several other issues
and included them here.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (14):
      bindings: python: fix heap-buffer overflow bugs on setting/getting values
      bindings: python: remove duplicated edge detection setting
      core: fix 1-byte buffer over-read bugs in gpiod_chip_info_from_uapi()
      core: fix parameter type in gpiod_line_mask_test_bit()
      core: store debounce_period_us with correct type
      core: check the value of num_lines returned by the kernel
      tools: reject "u" as period unit specifier
      tools: fix an integer overflow bug in parse_period()
      tools: gpionotify: fix memory leak on every event read
      tools: gpionotify: add the missing return value check for calloc()
      tools: gpionotify: free pollfds on exit()
      tools: gpionotify: don't leak info returned by gpiod_chip_watch_line_info()
      tools: gpioinfo: use correct function to free the resolver
      dbus: manager: use the correct loop counter in error path

 bindings/python/gpiod/ext/line-settings.c   |  4 ----
 bindings/python/gpiod/ext/request.c         | 12 ++++++++++++
 bindings/python/tests/tests_line_request.py | 22 ++++++++++++++++++++++
 dbus/manager/daemon.c                       |  2 +-
 lib/chip-info.c                             |  6 +++---
 lib/internal.c                              |  2 +-
 lib/internal.h                              |  2 +-
 lib/line-request.c                          |  5 +++++
 lib/line-settings.c                         |  2 +-
 tools/gpio-tools-test.bash                  | 11 +++++++++++
 tools/gpioinfo.c                            |  2 +-
 tools/gpionotify.c                          | 20 ++++++++++++++------
 tools/tools-common.c                        |  6 ++++--
 13 files changed, 76 insertions(+), 20 deletions(-)
---
base-commit: 530fa7823b12f91cf64bc1a9b755857049d5c2e5
change-id: 20260407-treewide-fixes-e400ba546454

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


