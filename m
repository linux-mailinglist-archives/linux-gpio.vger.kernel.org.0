Return-Path: <linux-gpio+bounces-34477-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLVwOv+9y2kiLgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34477-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 14:28:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22B36977B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 14:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AA42301BEDA
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 12:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3B33E0C7C;
	Tue, 31 Mar 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCLuRbpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AodhZJVb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F771DF72C
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 12:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774960123; cv=none; b=AHMuGxgj+bevNrAZHoJ6kg7LSTHoAgybx9x7tNg6b2L75+zUOG4I2ppJdwIMXiF6uEVKmVKgfAEvmJ5Em0IPgjIOMet494VQtjqSIrZhnv0njxrPcOSDTD9GC1mKUYULmuduy+2i+Q1oNhJXJb21hvfvLX+uIkQe60sdKMGiS+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774960123; c=relaxed/simple;
	bh=mi7memNQJCzeEutC0WFVeI6fKKTMYzxTIJkiFRVVWSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iCO2mBDttVyD8pqOmXqsFVpOQBkjJX5NWo6MYmxIpSNxuftAkMZp8ZnP+SW50Z2rWFxhdovsu2eN3/KVCzcJp3TdDdEb3CW6J6M7UCSMqYHJhdZLsYTH0cjw0QEseN6NyG0oMdQiVaH+lleQbeqkM+EsS8DN1T59hcApLy2mqN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCLuRbpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AodhZJVb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBTahw2408178
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 12:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k8hUEnYut0k71ljUpIpx01
	nVp9CKF2EbzDfYFhXRuzY=; b=JCLuRbpIqzs57buzkCa/31s/O4DrRqOy3aKwmy
	rbQIfmSefPdkBpHaWzCQtDTc/ZYrNCBss46H8Eim8aPGWql5JYreeVKMZj4Za+nb
	po3uGRfhYiqp0tKR0GB68/wSQrhh8qrYVASWopT0cxf6ffpBSJQpGueh7fSPydzs
	aQA+fA5tTV80Rff7qQMlEcd6fcEsGzKTqfWdmIxjf9NMJ1BTuscEjVBbrj5saPPq
	UM5UDyth52AstheFvgIgWQEsFpjGJ3rE3uQRG/r9b2wR4QMKA7D4MFosSRNKeSxL
	UckoNXPtxO2faG0Ue+TtuNWbhIAdIaLEIDe5ulJ5vkpmGLAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80heu1qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 12:28:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b92f327so168802481cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774960120; x=1775564920; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k8hUEnYut0k71ljUpIpx01nVp9CKF2EbzDfYFhXRuzY=;
        b=AodhZJVbRWGNasnENFR4SANnNZWqkLxQ9fDU/8ougZEE9ACxYLicPUXQzWFNJlKmaU
         tGHH+0ps0Iec3CJqEn89fsWLWHHk4S9nkTh9FX2FbGBgDZw6dy6bxRtuOOFLoQUfbxNn
         TU48DGBmRdsk+ipLwt0MebolpL73lIDDf/Xmjq3Bm+NPo+bBIpy1SW/9pdcdZKjIsxf6
         kG8x/KDN3I/xs0Zm5acwn1QuVEogh/xKVTDmajxekNIWZjZQNYhGrlHOLioR/145Z3pf
         gygllTE/je9zSbKnisF46ZsNwT+4ii6VBqt+FysDlVnLHK/JHfUf8rOdjnQHJ4Gdy8aQ
         jdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774960120; x=1775564920;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8hUEnYut0k71ljUpIpx01nVp9CKF2EbzDfYFhXRuzY=;
        b=jKD+msT1SgAHhlHQKFUxrx8DGSY3IkSPEleJhLoxOjt1Mo818JRKBn97yZoldxTWyz
         AdXhUbRhmfFb0uYSG86AxhfC2Gvvi/zHaDnpXUjANKgZwcjet9yiyySQeIBtWHWOlUUC
         Rf7LyE/GCIEDlpjm6Aa7LrIseKUlhGFdoFxkuNEyo1MvWGKJJDA3T1OBIvR9Z84fM9jR
         Baw+VpFberLxZUp8r+PsYo8toKU4p3uw1d8lxil9U2W5jVD9jPIlPs27V20snEFlvU6B
         /PB21QqbsuV7W+ILEwcPkD/2sXKJUpuyYtzASPexSqhN5phddwoIsUublZLdufYAPPG6
         KXDw==
X-Gm-Message-State: AOJu0YxcEoftZTOt94Tvw0gzIVuBG5mdd18iawV29rIh3msWfN+CL4dX
	AzZDfiozZ39H3GIfMPMr5yNMHUtJReBPjN5+pDfn1UJl4Ip/0iaTxb2j7JEvLrkZaTqYtP8XTPO
	M2JDuZM8fjW9QB4/6V6LWfJsXSYPtg+bc2S2fK1F9B76gdCFwRvHNOiHf7yow8zBucLTb5U0n
X-Gm-Gg: ATEYQzx7YprCLsSFT8B6rLxVWHbTJmwvabL+q5JFGYTngnD7UcZQF/w6iR97v/g83q3
	vEk5X48wa/01p1Z3LtzCoNFdAxzIu/nsNTBdxF7m6HstoLq0nQcHlR3kxeL0CcKSlZbgjBQ02z+
	T970jRJxgNtkRmo0INwPrvB4ftfRh0JBrJR2D4YRyYqoe9RUhwhEiLz4Knuf1/4wKcIe96H8IeO
	LYFdIcPbHqJpmaqD/6CjggoHiQfimJr0DWnVfSlWvDkZNYdm+PY5TfR/K/er6Bpp62sT082TVMS
	td8DqwrWmxqZ/GD+Nc1OFucaOn37UVAvKdtXBwOSett+Ef186a6h1JNM4rFVpCYjyYJLrUikZme
	UdVfcxFlkN2mFg2cgAm5ArjRbRYMTXg1lGCqRQF6fO0CjRXmK9JMu
X-Received: by 2002:ac8:7d0f:0:b0:509:2fa5:741 with SMTP id d75a77b69052e-50ba3818bfamr208064661cf.4.1774960120407;
        Tue, 31 Mar 2026 05:28:40 -0700 (PDT)
X-Received: by 2002:ac8:7d0f:0:b0:509:2fa5:741 with SMTP id d75a77b69052e-50ba3818bfamr208064301cf.4.1774960119921;
        Tue, 31 Mar 2026 05:28:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:977e:e16b:6244:a86f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c77df84sm23343405e9.4.2026.03.31.05.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 05:28:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:28:29 +0200
Subject: [PATCH] Documentation: gpio: update the preferred method for using
 software node lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-doc-gpio-swnodes-v1-1-3f84c268999b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOy9y2kC/x3MMQqAMAxA0atIZgPVoqhXEQdt0pqllQZUEO9uc
 XzD/w8oZ2GFqXog8ykqKRY0dQVuX2NgFCqG1rS9sbZBSg7DIQn1iolY0TtL5LtxG8hByY7MXu5
 /OS/v+wEVGQ6BYgAAAA==
X-Change-ID: 20260331-doc-gpio-swnodes-fc3ddf59b8dc
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7215;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mi7memNQJCzeEutC0WFVeI6fKKTMYzxTIJkiFRVVWSA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpy73xKHeRRU1aQQdygxLpzMfekpEucmYmPOgkS
 VL7hWz7EzmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacu98QAKCRAFnS7L/zaE
 wwF+D/46dCxYO+SuyTketuhK+O+1wRtn5kdjnz/jPuKg2DdWYAdfvcAvjlec9tnVc+FMP4Bc5db
 LXJ9qYXVcAiJzCJOicc14u55mS3sTUulgSnVrY+0omciBww8Hj1t7CqFd4qkEQsK3qQNm1FaLqt
 JWftGhUjOnYmg7c3ARUtElVjJ80jBNvncFMZCyR59OpPeC30GrjGrRV+vfXZkZe2bb4Wmnn5qIT
 HbmfyA+fR/TZwjEvRipfEex0HsmAyWH2GxMgU9UsiKf6BwBEC4aFh8WYE4si+s62VAnoaXXU/6j
 X9fuFtBa24T0PfTCWn+6PC75AGwy77EJqJiE2jl/U91X5bPzZ2JHPk2m9n2EE1aU4YBjFQ6yq8Q
 fw3iYfMWB7ahvmRLDIS/6zLIoYEWve+wUnEkBry5D7O6udDWn1VeGgSCvaTjOsWbOR2pbcUXySC
 goBRamUVuQD7BaRlMKRPZ8aLAXQ3kF7Gwe3WzCVEHJ1JE6wpBG3HZObXM+AiNYSwvW7N/V/eZ3n
 6k5zuZLdu+qmoR5RQAZckbVI2BU67Nf0FnT/OORSgPTR5GV0sB67t6BkQuy0sVWx5/XXRJ+12rj
 FonNTl2SFGBf/Eu3itJDPpq/pZY7GSwOrqpi0s/VmZitGLYpSB2BopxL5DbZaLnHYZqu+nFLUHm
 2OBkzahr32qKiww==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cbbdf9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VHV1bxSRZQlKidfD:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KH8R8Eao7PwcOq8sAqYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kUoBjmO9mhsnI20ZFBgG-N6Qtf0Eccsz
X-Proofpoint-ORIG-GUID: kUoBjmO9mhsnI20ZFBgG-N6Qtf0Eccsz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEyMCBTYWx0ZWRfX3NXWOE7JFLAz
 s3TmEn9hJlqophyrHbxRT+jEXAqFyomSEnx39JGRet5mQd0foCzQZNnmjCuw+Bpymi4Q58O2oOX
 J4r33afxEl8WwdJ7RgKdj7fOx5JyiIOcBk8oUkCsBAD0WyBfbtYC/09P6/qN+5vCkDQroryo00o
 fJt3iiASo+d6iIr0iMOwM5ewhhDc0iQKWr4Fx5RAxmIsxv49OvgF/S3aa0p/5eFcZWnoZ4UtZWr
 BvtGGstwjtZAyIEjeAxx/5bw2c05OKCE6EEt4ZGz84mIsVL3dTylWh1VwcCTcNOeOxjmFCTA3HJ
 q7+uODvrhNLXHLd2waRPnlAonB1yf26kdHrLMw6qjuSfvb2nO1GrKIpcjWQ0v7YwHRqbIGJgTZy
 fC0gF+xoQJ1h/uNTFK0JnERIyGS18s7Iyn6HuGeHzdU/XQt4S8KH8KKM5OT0I6XjuTlnQ9q0Rbt
 1f0Np4AsbVqpaZytXyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34477-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pdev_info.name:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F22B36977B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In its current version, the manual for converting of board files from
using GPIO lookup tables to software nodes recommends leaving the
software nodes representing GPIO controllers as "free-floating", not
attached objects and relying on the matching of their names against the
GPIO controller's name. This is an abuse of the software node API and
makes it impossible to create fw_devlinks between GPIO suppliers and
consumers in this case. We want to remove this behavior from GPIOLIB and
to this end, work on converting all existing drivers to using "attached"
software nodes.

Except for a few corner-cases where board files define consumers
depending on GPIO controllers described in firmware - where we need to
reference a real firmware node from a software node - which requires a
more complex approach, most board files can easily be converted to using
propert firmware node lookup.

Update the documentation to recommend attaching the GPIO chip's software
nodes to the actual platform devices and show how to do it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/driver-api/gpio/board.rst         | 15 +++++++++---
 Documentation/driver-api/gpio/legacy-boards.rst | 32 ++++++++++++++++++-------
 2 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index 0993cac891fb5e4887a1aee6deae273197c6aae1..c2880533742b1b55108f28853a3903cb273fe791 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -108,9 +108,8 @@ macro, which ties a software node representing the GPIO controller with
 consumer device. It allows consumers to use regular gpiolib APIs, such as
 gpiod_get(), gpiod_get_optional().
 
-The software node representing a GPIO controller need not be attached to the
-GPIO controller device. The only requirement is that the node must be
-registered and its name must match the GPIO controller's label.
+The software node representing a GPIO controller must be attached to the
+GPIO controller device - either as the primary or the secondary firmware node.
 
 For example, here is how to describe a single GPIO-connected LED. This is an
 alternative to using platform_data on legacy systems.
@@ -153,6 +152,16 @@ alternative to using platform_data on legacy systems.
 	};
 	software_node_register_node_group(swnodes);
 
+	/*
+	 * 5. Attach the GPIO controller's software node to the device and
+	 *    register it.
+	 */
+	 static void gpio_foo_register(void)
+	 {
+		gpio_foo_pdev.dev.fwnode = software_node_fwnode(&gpio_controller_node);
+		platform_device_register(&gpio_foo_pdev);
+	 }
+
 	// Then register a platform_device for "leds-gpio" and associate
 	// it with &led_device_swnode via .fwnode.
 
diff --git a/Documentation/driver-api/gpio/legacy-boards.rst b/Documentation/driver-api/gpio/legacy-boards.rst
index 46e3a26dba772e5e5117866b5d202e76c8e2adf2..fac63dd38d5b71c3bf43b5286a432f6449f422d0 100644
--- a/Documentation/driver-api/gpio/legacy-boards.rst
+++ b/Documentation/driver-api/gpio/legacy-boards.rst
@@ -36,12 +36,10 @@ Requirements for GPIO Properties
 When using software nodes to describe GPIO connections, the following
 requirements must be met for the GPIO core to correctly resolve the reference:
 
-1.  **The GPIO controller's software node "name" must match the controller's
-    "label".** The gpiolib core uses this name to find the corresponding
-    struct gpio_chip at runtime.
-    This software node has to be registered, but need not be attached to the
-    device representing the GPIO controller that is providing the GPIO in
-    question. It may be left as a "free floating" node.
+1.  **The GPIO controller's software node must be registered and attached to
+    the controller's ``struct device`` either as its primary or secondary
+    firmware node.** The gpiolib core uses the address of the firmware node to
+    find the corresponding ``struct gpio_chip`` at runtime.
 
 2.  **The GPIO property must be a reference.** The ``PROPERTY_ENTRY_GPIO()``
     macro handles this as it is an alias for ``PROPERTY_ENTRY_REF()``.
@@ -75,6 +73,11 @@ A typical legacy board file might look like this:
 
   #define MYBOARD_GPIO_CONTROLLER "gpio-foo"
 
+  static struct platform_device myboard_gpio = {
+        .name = MYBOARD_GPIO_CONTROLLER,
+        .id = PLATFORM_DEVID_NONE,
+  };
+
   /* LED setup */
   static const struct gpio_led myboard_leds[] = {
   	{
@@ -124,6 +127,7 @@ A typical legacy board file might look like this:
   	gpiod_add_lookup_table(&myboard_leds_gpios);
   	gpiod_add_lookup_table(&myboard_buttons_gpios);
 
+        platform_device_register(&myboard_gpio);
   	platform_device_register_data(NULL, "leds-gpio", -1,
   				      &myboard_leds_pdata, sizeof(myboard_leds_pdata));
   	platform_device_register_data(NULL, "gpio-keys", -1,
@@ -141,8 +145,7 @@ Step 1: Define the GPIO Controller Node
 ***************************************
 
 First, define a software node that represents the GPIO controller that the
-LEDs and buttons are connected to. The ``name`` of this node must match the
-name of the driver for the GPIO controller (e.g., "gpio-foo").
+LEDs and buttons are connected to. The ``name`` of this node is optional.
 
 .. code-block:: c
 
@@ -257,6 +260,16 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   	if (error)
   		return error;
 
+  	memset(&pdev_info, 0, sizeof(pdev_info));
+  	pdev_info.name = MYBOARD_GPIO_CONTROLLER;
+  	pdev_info.id = PLATFORM_DEVID_NONE;
+  	pdev_info.fwnode = software_node_fwnode(&myboard_gpio_controller_node);
+  	gpio_pdev = platform_device_register_full(&pdev_info);
+  	if (IS_ERR(gpio_pdev)) {
+  		error = PTR_ERR(gpio_pdev);
+  		goto err_unregister_nodes;
+  	}
+
   	memset(&pdev_info, 0, sizeof(pdev_info));
   	pdev_info.name = "leds-gpio";
   	pdev_info.id = PLATFORM_DEVID_NONE;
@@ -264,6 +277,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   	leds_pdev = platform_device_register_full(&pdev_info);
   	if (IS_ERR(leds_pdev)) {
   		error = PTR_ERR(leds_pdev);
+  		platform_device_unregister(gpio_pdev);
   		goto err_unregister_nodes;
   	}
 
@@ -274,6 +288,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   	keys_pdev = platform_device_register_full(&pdev_info);
   	if (IS_ERR(keys_pdev)) {
   		error = PTR_ERR(keys_pdev);
+  		platform_device_unregister(gpio_pdev);
   		platform_device_unregister(leds_pdev);
   		goto err_unregister_nodes;
   	}
@@ -289,6 +304,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   {
   	platform_device_unregister(keys_pdev);
   	platform_device_unregister(leds_pdev);
+	platform_device_unregister(gpio_pdev);
   	software_node_unregister_node_group(myboard_swnodes);
   }
 

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260331-doc-gpio-swnodes-fc3ddf59b8dc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


