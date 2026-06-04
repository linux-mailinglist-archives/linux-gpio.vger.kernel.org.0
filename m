Return-Path: <linux-gpio+bounces-37921-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id awf2KkEuIWrPAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37921-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9463DBD6
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gF49IPKP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PvexEYtj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37921-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37921-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 567A7307C6D8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770063C277C;
	Thu,  4 Jun 2026 07:48:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1309F38911F
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559303; cv=none; b=uuB1EzYxAEi9vmv48C5w3Js9yzpvclW0r6+I65h9jhlBQqTrT5LVO22S3gbN1DDZOlVSeAM+X+ivK3FnudHTkObMyeYgKYNL2QPH5Wjn/pqXys3nqxEyN04BvlO5syrfLB1CJ0Z8SBQzfzy2QHSBnAYjIW9QkWEGiWbtC3RoMxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559303; c=relaxed/simple;
	bh=zKWzsT3JxV0aw1kaosPpJlN5p8EFqGOcLALb1l+CNr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pv8SGp6xzzXTu7L2uZ23DpsG5uC8CJF3+4gDj3WXPRQZjaCM7w5i/5VxZ0c4gs8VZZiTEFYWLtcnFFBUQMa3jm1xFnS0kzgyQ8RZWqAqfJLT3OebiogrnA8dhjLuoqfWh7PzCNA3F5OjtGgT+2aiLXYt7dXBxm5GoMl88r2Rsvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gF49IPKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvexEYtj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65418iMa140473
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDBNW+MXdJBxIUwK9ijHWprpL72DTkBfTOgBS2p2vrw=; b=gF49IPKPumeSNKeb
	ysLKPy9W2pugXWVJCCeiUbQy+ZVS+7TnqnVQWltsSCw+M9cchQXK8/i211NTKHj6
	uUc0ht1OqxenV0CCJKJT+1mtG3hktAdoiY8CXUqMp36VLkjNuNHKcc/Iml7tLbvk
	g908MuMJF5r8hvxmFhMpo9xvaXHuwCP4I5T1jD7eLBII96C1FS9Vni1qZXvAuz1j
	oYmwesKW5WrXl22ODCrTv7jey+SmB0YsyweePwuYXyGyxhLNpM81gufsd5juZDZR
	enMAtipuqfjSW+ZnzdTnvscLjr3/pJR3m+1t86xA1kshnw4gOHh2WRDB/uJXKI73
	RbvfsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen97cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51787404d3eso11560641cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559300; x=1781164100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDBNW+MXdJBxIUwK9ijHWprpL72DTkBfTOgBS2p2vrw=;
        b=PvexEYtjEd1YaR1LwbrdQpn+c2kGCQnpnCCAtoA6I/34ODAiy4VKtCVMn2u0Ltm645
         Q72gM07mleJKCw+Q/PnYBIzGJY6ZlBNxZrGB+7RBy5lE3DH/WD6wQrQD6I5ikpJxHtXx
         QWzfmZXhR8HgsGuj5kP1n4gWkzCYdMLiSh+RkGXcZwhQfgA1oj2XjI3vjb4bsdhFfpOb
         VS7//xY2SIlvh8MTs0c0EtTtYSDN2OS4Ud3wtRU80oCZGEExq0kxjcvE5AHpXP8MAbsu
         DDyQ2qaKEGhgmm2BOqlYwlIfCoXpg1x+TgJbuvV6N/QB0RyxqS3AXKyjPLqlmD24fXGv
         8NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559300; x=1781164100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JDBNW+MXdJBxIUwK9ijHWprpL72DTkBfTOgBS2p2vrw=;
        b=da3/JPEtWxsfZjZ0cVWEWrKSGTyegSjkFJveL9bGP7pm1HSMHh5XJSOayrMg4249mt
         YsTI3TjniGut0pukslRRZ/adtRSIdJY+Bkq7U1ffIbQuH2VWzWv81TKoLkf69iUmRiLg
         BLhDdLAkfTQR5RNOpnzYm709hPCMqtFx5V3EcXYfW+84+ukX7Bg5Ro1FJu9o9OJkzDOw
         y76uMkAARG+xJ1+18oQoLb8SQ+hQ6AgQ7EY6HJAIAbZe2CjhKwE3Jd+6IzTMckGyiT07
         6pO/3w3jXz1YLUAuMyjk6DVtxlB9GG4evIZjksNc2eOJVpfqu64Osod2DG6ACdsdwI82
         O2vg==
X-Forwarded-Encrypted: i=1; AFNElJ+JmdYrO/zB+Xp/t+rjOn0aczmD+/qyuFL369grG9UCeb18w1QnW4E99YWKiqmYL8h+5pB+jzjo7fR/@vger.kernel.org
X-Gm-Message-State: AOJu0YxqV0K47NOi/hBgmU9YDalvFjCj95UwZ8IprUEBMT3KousEAlBa
	hRlaIo1QCpHmmkXTOCTd2S4tntiZNustyakm3D9tdil+zwzAyhIuLDasMNymfVdzTqJSYFHOM0r
	HCnyej+7gy5/4j3gexRqOiuiDFRDOfLUUxbDstw7zRjvb0s33KROo4BEjkF/gq/+e
X-Gm-Gg: Acq92OF42jg7qBAZz2YHvAW/RW41FSSaxhgE0t2n8oVrE/xPsghmzi6rvb6uz5DiTPW
	3B/CSrglTZFdUWemajWx2UUnktlQmBcJnoTqkoN7p3uh02KETXFxlHV8leLCg+W3jMdibUWGnmB
	JtTtK9VfTGkudl4Xi4dj8rU4HrJ38uQMQxydne43LccsLKcD5yLg8FrFjOnGcBtUnA7EUI/GhtL
	1yWSCsndcg3Lx5Xhw6S0i2dVmG+D2u+NyDucQdO+cHVjElDQWhpa6omzLXiMgiogPDRyIV1+Zzu
	YScClclKur2YsWHwGq07hTHk1Ice41rNmpEHt3r2QW0oJ+6cpR1hllEvKW+oO1zQpNNiJ4z9Ocq
	pJHRWE8KlizyL6f1u/5fk4sRapArNUJI6w3X6aEP38R+EEB2BCLDxmVoJHKYsRgwpJjvU5JpcTt
	etL8mS8Ng=
X-Received: by 2002:ac8:5745:0:b0:50f:817c:5d45 with SMTP id d75a77b69052e-5177979eaaemr95317411cf.23.1780559300412;
        Thu, 04 Jun 2026 00:48:20 -0700 (PDT)
X-Received: by 2002:ac8:5745:0:b0:50f:817c:5d45 with SMTP id d75a77b69052e-5177979eaaemr95317161cf.23.1780559299939;
        Thu, 04 Jun 2026 00:48:19 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:46 +0200
Subject: [PATCH libgpiod v2 03/15] core: add explicit NUL-termination after
 strncpy() calls
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-3-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zKWzsT3JxV0aw1kaosPpJlN5p8EFqGOcLALb1l+CNr0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2sVFt1F46eU0Nhr6Yv7kYBy5uFMslda6Ysb
 Cs+duTORuuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtrAAKCRAFnS7L/zaE
 w/AnD/9j6tO+h2umgGHgDlGtAPlJ96yJBWnh30P647FRv34Yj5E+onQiOfv80wrnvBxYZcrlA6q
 hJAUwy4AgfcfUXDXM4uBdSA1r/PKU+6Ug4a6eD8dLQx5ThmfT3OQiOV9RIq6fLkXNEHyery3SMp
 Jmwpl3cQO47JMq31en1EPiTHPfFcrZyS7yfCBMV4FeFH7orfS67UH5NlI8+WqcKgn5oEsAVzNQw
 1Vqf+4SbbX7Yo/PdetEo2DF8CLx8oAToqhuPK0inqAmELYgdYzurUkDGG3gETCp8eKnMHs82nvf
 kDEncCayhj0bItr67l5sbNFxyKgGTEHgRYTq3jRj7Tt6X18WjMeiwfmXN7a+NGByyiQgJtnGBVP
 1w02itRQOh7s4s4M7w9dmAc0/yaxmdFeJdK+QqNVFK0ZY9bjfdmhKmFXv+xeYxdbSRoChZ7CMgD
 ibLFNtTWrPJVxqenUK0+gB0Lfm2rk6Cr6OpWh4wa8dlkA3eyPNKqmzXCUVTLg9ZqL9jqetZ0f/S
 Ivsx8WaJQP5Kox3vAd+SFpsBhsCxxm9qBgwbn4knTqr+vo9DZN59aC3ccEAL0yU7+AgCRtUA0bv
 JAnM+K9r/YFtF4f/mn3R+Z+FH0DjBOilNWaXU6YmcUd7oejHmPsboauDPBEOWtziBqPc/iLT+IG
 u9o/vc1WdXUMCgA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a212dc4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=3W9sBVhNAAAA:8 a=EUspDBNiAAAA:8 a=dUT4seM1aVMALyF6Z_IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=38sOm0jhF1M2KuwyeTFR:22
X-Proofpoint-ORIG-GUID: KVN91k7gSMHL6nIjpFa6ENvpccyaSXEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX5RfNJVe2Ly3J
 X3V55ee9StKSI7htSTGuXM4PKLkOBamki/K3A7zuoITiIQiTl8k2kWcmQC4ZgiemtckQhAH6nV6
 LeQ8yiy+HGuSpu3GaPUFnmDNO6g//Nvkxjd62nOgVlfSC9A7z81D4v4uv1E7rtrPimIVtDNT6qa
 c/nvkuajTV9ZHtsv2PbDXuxZBChhOuKkqWv5/Ng3HbD/x9HtEIKaBiTi2IGjZzizvQ6V42z3GTH
 WmYbX+U5x7QCEQS0oe/aX2rrUfApY6bzwO9k3cK+xIy+sU+AbgqirL15dgYI9k4EzOFGf2fZi0b
 nbXLjt2uPEDeQq8XSX6MU2liPyDYnBOB2uFHUBJnEKoZhYjLoPD1RR6mjlZG1jgfd39GxHHshLZ
 Sly6UPXPJKpgCEc/Gi4L6j2M1xc4mTUX24d95KBh6AmdKEOmVXAIq2Gi+iLgtYlxojaVkabmtts
 IPpucqXTJxwYIJE5EAw==
X-Proofpoint-GUID: KVN91k7gSMHL6nIjpFa6ENvpccyaSXEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37921-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,xes-inc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8FB9463DBD6

Both gpiod_chip_info_from_uapi() and gpiod_line_info_from_uapi() copy
kernel UAPI name strings with strncpy() into buffers that are one byte
larger than GPIO_MAX_NAME_SIZE. If the source string is exactly
GPIO_MAX_NAME_SIZE bytes long strncpy() will not append a NUL, so the
strings are only guaranteed to be terminated because the structs are
zeroed with memset() beforehand.

Make the termination unconditional and independent of the zeroing by
writing the NUL byte explicitly after each strncpy() call.

Fixes: c040d4e15e5d ("core: fix 1-byte buffer over-read bugs in gpiod_chip_info_from_uapi()")
Fixes: 5533f277aa28 ("core: fix line-info strings termination")
Assisted-by: Claude Sonnet 4.6
Acked-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/chip-info.c | 2 ++
 lib/line-info.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/chip-info.c b/lib/chip-info.c
index 6b55197f96b78ea66559394e4e788c4263ede5a0..972b2a82a8034c4b66850b246d412a442a836285 100644
--- a/lib/chip-info.c
+++ b/lib/chip-info.c
@@ -58,6 +58,7 @@ gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 	 * the worst case (would have to be a weird kernel bug) it'll be empty.
 	 */
 	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE);
+	info->name[GPIO_MAX_NAME_SIZE] = '\0';
 
 	/*
 	 * The kernel sets the label of a GPIO device to "unknown" if it
@@ -68,6 +69,7 @@ gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 		strncpy(info->label, "unknown", GPIO_MAX_NAME_SIZE);
 	else
 		strncpy(info->label, uapi_info->label, GPIO_MAX_NAME_SIZE);
+	info->label[GPIO_MAX_NAME_SIZE] = '\0';
 
 	return info;
 }
diff --git a/lib/line-info.c b/lib/line-info.c
index c61b78907c946a1e4f6718ae9e7f0dbf354bb0d7..1613c9242d8749159334b124ce911452ccdc8a7f 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -149,9 +149,11 @@ gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info)
 
 	info->offset = uapi_info->offset;
 	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE);
+	info->name[GPIO_MAX_NAME_SIZE] = '\0';
 
 	info->used = !!(uapi_info->flags & GPIO_V2_LINE_FLAG_USED);
 	strncpy(info->consumer, uapi_info->consumer, GPIO_MAX_NAME_SIZE);
+	info->consumer[GPIO_MAX_NAME_SIZE] = '\0';
 
 	if (uapi_info->flags & GPIO_V2_LINE_FLAG_OUTPUT)
 		info->direction = GPIOD_LINE_DIRECTION_OUTPUT;

-- 
2.47.3


