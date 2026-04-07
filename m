Return-Path: <linux-gpio+bounces-34799-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKlqBNn91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34799-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF133AEA9F
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F25CB30046B3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9793B52E3;
	Tue,  7 Apr 2026 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHI6WDvc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djjTnr5f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAC23B47D8
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566292; cv=none; b=K1tJDHOoQTiHGH0xQ3VPoTuMHQA0LTC8trR/FOEcDl+Q61Vpw1hYaZX17v7gLIdyMrMPPEg3d3QW6FoOEo2tIKwew17w8Nlq/XZIvhtstt3VGePuuX3b+MGIh0UIss5CxXK/YP9JrOWXEfltk5lU9BMGsad1NktqyNXBFGFPLdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566292; c=relaxed/simple;
	bh=3sQe9mi1R84kn1S5P6eAQTRJjHrtTegMGZWpWubejoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkGkgtnJ8bHApG7BOgxY/ErfTZzhjVsrKnVcqEBbPacA46oT3KX2TKGsQ+un6/b7n2FsWiIZPtE+BpS6qFBojXlDV9PznYy8oEa/NkxoUzbZQWgE9pg1DBFSFxc6HkShvlPh1OEWesvv/v8n5ujAauHA7LMBWNljppBvImACDow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHI6WDvc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djjTnr5f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376enOb1403541
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhK/MXTizOmi0hghhO++7qsAi2bAkG5EBUY5fe6dVRM=; b=OHI6WDvc7Y0Mdt1p
	9lWjfI6jN8uSOuEMqz/I2bzqbLGAbZMrwpjLB+WHTivBwcyM74lnW1UD5O3HxZCO
	TTC7u8zF+rv3qKydvP/MmbDrS75XbWzv0jfolPeNi9rWLdbnYQ+SkPTupcq497jC
	p0PHrjJMrMjp+wBDCgxE0CqV5vT0v/yktq0YdEOA+glCdgpI3qTNBuzywviMBMF9
	TGlu7rZbHIY0itCxRJJUKUZqqW24O40djDipDlvFNfqb3E2SjG8VrsvLVxJwYHaq
	Pt6X/Pne+HkHEqKYUy+Tb+YZ+uGf4taVrzQ0B8yE6BTel03oKvnw1G9eIUbhGj4G
	2sLC2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8asaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so225304181cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566289; x=1776171089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhK/MXTizOmi0hghhO++7qsAi2bAkG5EBUY5fe6dVRM=;
        b=djjTnr5f+coroCxqfSOkfGZ2nflfFjA3TdquU6E+8Bpk1i7s8RsIJia3mJgO8jZdR8
         0VCGobppfS47YFSHh78VtI0Gq2mSmjyKnnsSDdJepLHDl0hkMAEHqqFMS6DUbTGam9WZ
         4noYM8ltrgPKy1N6vgQtSD0PtbQacqqsFnprSddW+5YOk12r2Yi0Q4YHuK5H87DSo+YN
         gjin63rhKLux7EKeKzV1w2HlFYPzhoFlbywrhVancWyXSA7dPQX13ReQRwSuqbD90Jwq
         FLtNBF4xucMPiOgZ+73K3NwLHnBw5qh5RWqRkGN7w78tLh4OmV7SMGLAd8bp8PBDiLDH
         v/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566289; x=1776171089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XhK/MXTizOmi0hghhO++7qsAi2bAkG5EBUY5fe6dVRM=;
        b=YIAlfQx+t9UmYf9EUABzg7n7VO+H+iBCpPovhiD7FHPu8G1BoekKWJNnGSdDOb1KoB
         64cDR6n0K+Fgcqa1P1c1YfW+sE4sFGiYBOaTDG1rUJ4MGLD9Ng1c4PFYTYuzmOd0O0Ra
         2ImUzpf/AL77Yj12GsQ75T38z9UrRDIfv8AcHUBBBKiRnVCiFzBu+4J4xSilzkrQyLrt
         4VTQ8FYVmLnWpNJtg55eHKid2EErsOAVEUC6t18vyvGSREtEbmW7VJ/jBkZbyg2XMj9Y
         fyhMGdVnUr71r7y1EbSs22RRlo7vm83742PcB053DsdWiU27R81g/lSfpJZwPLSAW1Go
         kn7Q==
X-Gm-Message-State: AOJu0Yzwij67z22YjExf8h29ITrR8Ck5F65hhMBnjdxdcNF4tz6U9qb8
	4hopx6pHtJ9wSEaUK2WCy9NdcfTueYglOIavBVHPHp5mGwdo2BN+kkOnoHerCgYtJfzTGfbJrCc
	ztXBJ5AvKwg3HoKohix9DPgsqsn215SX/1UeNzLmRLFSwET3nZ23mAKUqSxH/yPj6
X-Gm-Gg: AeBDiesDYJ9hV3YkhbCjkYhrzLXCqgwtg7/S2nVJb107fDFKa/49+pYkY9DPRgfvTL0
	QXtRvb692rYXszQ4V99B61hp4EHpHU8Q3qLfaFH3yS8GdmSbcnwiahSb1cmEYOtyCLW0TPNd+l+
	uBv7QcYV24CkS9IRh0gZys/+BFt8Bki+C2RC64s1gEQwVg4N5Bjm1rrapu8wXzWIOZjWRjIofYS
	iiWRaTzZW8fo3Kh/SwRB2ibi5O50Ao7kRmYK/pbs9jOq3zf/oRyEABZGcTtfedAPBvDYuYeuHkb
	9bzTe8PU9dPnOiNlxtgBdZbf3gEuCgH6lSGKLtkZsRXYjWK3Em7zKTib1NoLdeIMlI2a+r68ptK
	z2QlrtyrVujrCxWq6GHbqLZuMvfXGFquM58vQcQUER8dxThTQK50=
X-Received: by 2002:ac8:7d15:0:b0:50b:3a6d:db64 with SMTP id d75a77b69052e-50d62ae96camr255017081cf.48.1775566289189;
        Tue, 07 Apr 2026 05:51:29 -0700 (PDT)
X-Received: by 2002:ac8:7d15:0:b0:50b:3a6d:db64 with SMTP id d75a77b69052e-50d62ae96camr255016781cf.48.1775566288809;
        Tue, 07 Apr 2026 05:51:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:50:03 +0200
Subject: [PATCH libgpiod 12/14] tools: gpionotify: don't leak info returned
 by gpiod_chip_watch_line_info()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-12-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3sQe9mi1R84kn1S5P6eAQTRJjHrtTegMGZWpWubejoo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P29yf1xtXW8SQqAKDKjEoegEfrdmAQk09oDL
 Tz9BNxAHgGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9vQAKCRAFnS7L/zaE
 ww8nEACiAueYh2MkLe7r4zV0vzNLrZA0kvDROmj9y/g1409Ntm/tQoRzDfz6jCyCDppRoc4bY28
 QtO5UsieU6b6tg1+ZZjgB1104hoiFKdWQZW4AuwzYZH16FEIynGKHuwTzzfSavUylsxtOZHNmhE
 oM+525LZsfZOs8Sjznj8CNc822ppFEXHfhKUl2NtfZ7Nqw03MXZ1RbOtWZdV0TnPuqwQyLNzwyw
 DjJ3m4y/2k5f5T01L1pcZJVDmjKeK2Xfd0ZN+5pLuJPC5pH+JEYGNojZl3Eqofh70HUfac3Zmke
 8dAxrI8drhTaBORRvtvn/U+dsyDO91lgRKjxlnt24iudzNW/I6xUfWBvX0rG30XM/Z1nGDragrp
 Y2SxSO+uWFs7zTCHWN7sPWTFEayWpfPD4wdK9DINwyHHhc+s0Qsl0KWD4Ao3kFs72vN725wNMld
 bXQhm0esdABViOHdD0gN3cEz0jUYtr6MPTgoBUFHWyyyj8YxXckhOWNH8umChXAG05fjzF4JZpZ
 VhmH/MLnZPQEI4BsnDi2EJyyUziLdnMgtO9Gxue1v8zG2J+1wjGWusENvp7AaIDyhShgonueJKP
 QhvNIG4O35ZZ3bQ01UYSwFxJmUX/EDIb72T4QO0t3ui8a3HHQbvfs34Z6FWdIU6UDeB+v+gGKvx
 +Y6wWPKz0SadeuQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: gKVKBDGawzeDp697bww_3biDtWnmttDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX2gRn5e5e00xa
 nst4KT9x9Ag6N/QEse+7BNHKBMs98EvtZUTQ1XOqyuL/W3UdJUe/XiRwhNsyunga0zYcpRxseCK
 afhshgKpVTrQ0SSDtznz2pE9DCTZ2KtXHw/fCJCh/fQeBodDOs5dL1FD9jU2NApc3iygqbbe/tB
 4vwCVX3iuV5mJ9xviGBX60+MQ3ZGD1k/C7RL+gejzT8H1vHmgtTyiH7rUMoUSP6XLLCkezahtgg
 VcmwDP/5zh9Dgs7j9XT8QuZ9NlrmE1+YDueAKrw5KHfakKSxi9QwbXGmKSjnLaEdANZtiTfGAsV
 bzAR2p8/62kuaXEQB0Sb3x8fjuxLSBuoRRhyCz4QoVGUNfmwLiHKHuV9TxKRpInTLP0dREcjBrm
 B0KHznwEoISqJAUqO4JARqI2epkHCYWhmlNNphWjuQKz+VhdR1Gtaysg5y1jVJKihAlKH0bPZiX
 gWUHTXdk1Mq0wgP6aMw==
X-Proofpoint-GUID: gKVKBDGawzeDp697bww_3biDtWnmttDs
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4fdd1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=uyFL3qho-AoO4IrnY-wA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34799-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DF133AEA9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gpiod_chip_watch_line_info() returns a gpiod_line_info object that must
be freed by the caller. Add the missing call to gpiod_line_info_free().

Fixes: 5f194b001ae6 ("tools: add gpionotify")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpionotify.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index a6f82fbee0ed94b73635b724fa53216f4155101d..cb3a3de875a7b7b3abcfcd4ab7bc909183854b73 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -374,6 +374,7 @@ int main(int argc, char **argv)
 	int i, j, ret, events_done = 0, evtype;
 	struct line_resolver *resolver;
 	struct gpiod_info_event *event;
+	struct gpiod_line_info *info;
 	struct timespec idle_timeout;
 	struct gpiod_chip **chips;
 	struct gpiod_chip *chip;
@@ -405,13 +406,16 @@ int main(int argc, char **argv)
 			die_perror("unable to open chip '%s'",
 				   resolver->chips[i].path);
 
-		for (j = 0; j < resolver->num_lines; j++)
-			if ((resolver->lines[j].chip_num == i) &&
-			    !gpiod_chip_watch_line_info(
-				    chip, resolver->lines[j].offset))
+		for (j = 0; j < resolver->num_lines; j++) {
+			info = gpiod_chip_watch_line_info(chip,
+						resolver->lines[j].offset);
+			if ((resolver->lines[j].chip_num == i) && !info)
 				die_perror("unable to watch line on chip '%s'",
 					   resolver->chips[i].path);
 
+			gpiod_line_info_free(info);
+		}
+
 		chips[i] = chip;
 		pollfds[i].fd = gpiod_chip_get_fd(chip);
 		pollfds[i].events = POLLIN;

-- 
2.47.3


