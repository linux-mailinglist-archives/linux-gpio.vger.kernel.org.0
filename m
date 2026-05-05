Return-Path: <linux-gpio+bounces-36134-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCgUBBy8+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36134-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:45:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 662234CA08C
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 573CE300BD8E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0D3313534;
	Tue,  5 May 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFS576FX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5YOAjt2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98640DFB4
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974217; cv=none; b=O34PiIjeSYZJBICjBOzTqu9j9RNGoR45WWzEpSYvru4z+5jesVlJr5nRbns0jcq3XcSA2Ww10HMtc/nlQFXjoEdyobpcUDCDgFnF9qV5ojWLsvpcEEy9NUpIjbgkbDmGyEEPeyjrygSs/TWoS0Xp63BhuRgMjwNuPRVUmxk25B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974217; c=relaxed/simple;
	bh=kTPdwnhKuNvHpmfP9POcSBXwBjHDEIhQtQKaGHQH30k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lvGVe3aOa7p87vi9sdcKMRRC9IBYiaThpvr8zxrr3kVrPEeRytNrq1TT0l7nec5KMVYrJbFhBrWomCMU/H+bLhUcQkqABbisN76ZW43vyjlPLLRkp+JVUvJLYlrBX34B3rHMxw4PHD2/LlnlGxCWZzSCknYkLvzzWN9rzvGBTFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFS576FX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5YOAjt2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456T0c11186892
	for <linux-gpio@vger.kernel.org>; Tue, 5 May 2026 09:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SGD/HFe4mTKpac5JeH1c3n
	7+8zeZTKcLWhIAx/Ud8FE=; b=DFS576FXC3eYrl3DkypTZ87BSmW1W8nkSxGZiJ
	xoRfIKP8xQdULtctbkE/zWeSzQP5JnmrHagBE0/FKUt56cnN6xlURe3Um7FAARxJ
	1okDm7zZYa0dIlD0B/DPovsvEldeMMt/EMsyvSdUc1UQQ91yzhhFShFDpMrOZ6Ay
	oHEZ5dM++KftWBoSA95em8DsbXv7N/pIB2/rbJiSSif0sUNsFn0WpxP7jHVSZ1yK
	pzUerXWDav88/qtW9IBzcIPyDuR40vNoWRMCPutg+FLXZlUN05AVyoggSLdVrS1u
	FFTD9fLZgt5T8Y5SVz5d6jfuejjxTeywKD8RNvAEiTqca+ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgbpa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 09:43:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so123703041cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777974215; x=1778579015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGD/HFe4mTKpac5JeH1c3n7+8zeZTKcLWhIAx/Ud8FE=;
        b=E5YOAjt2gjygDCgLLDh2GLjQ8VE+Nxxh0dPuv2QVAj66bn8xmrya5vCdoZlRRL0i/i
         qD+7jhELWjSejsBFTMi8kacicqa++kHNjZuGTwWKuNalfrn1Dauq352yD8yAU9VHTJo9
         e+UcUgUzdvamd92eMtlhvKbdZuHYcH8To8Dw4LlwIl6dfETEF9yjoXGYqRbZK63+Mip+
         Qh9zNzVZ0CPPeVaCwqcnPIiMii4U1g89cyWMsYVbPkMGhO6VIy+/do4X9ADCqGTVMZsn
         ORphzWhYFM/C3rpRxYM/AV/YD7Z+7lX5/kTMBFwNxluUp8LhdBruUpMQgXw7mwjjnFe2
         9aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974215; x=1778579015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGD/HFe4mTKpac5JeH1c3n7+8zeZTKcLWhIAx/Ud8FE=;
        b=T73hzC5iWk5IhF0rEnl85/CTeWtEu7mmHPOEJIfWN/ZBYBz/OeMm+87JT6qrtrQuO5
         JFoNAvEs+dfGVvRYZJzyohxBlXsHYIgclIFqIQ1daxuAcEJQWLM+M13L2H/YaH/I/ZNH
         bX5xqf/4k+LhxCjiB/alra9PcLztnGB826RZBNUcZ3ZLe7qfFbPwgywYFhEtlpu4mie0
         9QvOpLB6xQkyOu4TEgUu2a5o8fCZjiri2CT0j8olgeuWel4pkAj4NGYgnYcjOYDghJhO
         wbsvF/QN2EYOiy7XEI96eI/0nQPLaKV5dw1QD+2J9EZFEL34OgwCj7Fgx0tHwM9VgIkM
         1rXA==
X-Forwarded-Encrypted: i=1; AFNElJ95p20HfJ+ULloGdEt5XhFJgs19H5kLMgKuEQp/WLh7fb1q3/FMom+By4PT4ea/SwoUnyGW+ySg+eRe@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLF/E55hOYqgmJBtSzrGs6gZujCxZC8GF18m9KI3VMRp/TsQZ
	FKu6gum+kmfQ2G+qEMNyXduLzGS27DTychfMoO6F0GQSBC7cn1MgU71ykpj7J919k7hWlKfmxsk
	VKVXRs2IqFS+LptyIccTZAumD/xEGy2VJFQ0knkNS+2rvYHylo7egKtj38j87aBDx
X-Gm-Gg: AeBDiesJqB+KEps7dAwEyZJGjSAEg+CFnWKntiCI9OIelF1WOD08q4HxqOPxu12lTeR
	4UNQ3Wm3XlWcjsj4hSq9XuVBnG8tglBWyonkzCusZ/JEEJlyNDVz5fvVHTUBwjE44DPpkmGSchq
	+2HxHGOQ5y7JJU7re+MA7BsmfhtaqOa5bEocf7zOaHWsmAewvCorTDXcJUuFwt7zQ3bmmOt/KGJ
	BJiWlf2y6+hoIBlXWusD4L4sxblg+vnKwS0/Mcbxm1OPuwRzowUYjroEmGzCMZlo0cqALc4CIzC
	9bMivVFcbJNwk63mQPyQyRmX4nwAzol+A7b2WHODC+RSVsCH136fcD/ntLtpxhQgEL4bi5I+SXg
	NK+T64G7L5xzI1Gi4nMQQyrxu9oPO8s3jqyTFZ/ZiehewUiA=
X-Received: by 2002:ac8:7d01:0:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-5104bf6d329mr191358211cf.50.1777974214768;
        Tue, 05 May 2026 02:43:34 -0700 (PDT)
X-Received: by 2002:ac8:7d01:0:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-5104bf6d329mr191358021cf.50.1777974214330;
        Tue, 05 May 2026 02:43:34 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm603858135e9.1.2026.05.05.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:43:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] pinctrl: bcm: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 11:43:17 +0200
Message-ID: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kTPdwnhKuNvHpmfP9POcSBXwBjHDEIhQtQKaGHQH30k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+bu5fs2LviISk/bfFVysKywPwafP6tJYWzBkA
 vRImsN8bsSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafm7uQAKCRDBN2bmhouD
 15wAD/9JHy/+Uo95Bt46jXbX3rueLq4cQYwnEWLU/koZn4xZ/CU2IFQhvbZ9jpeiTpB4vCoHzyC
 PeTgGi7nL2mX6YXaHqPriK1iMl0kxvF4QxCToTXPKcgShyKm/rC/ySSMh5ANl5iL5+4g61o0ew/
 /ZVk4EIigHjBaPmcLtlR+mvnuH/fEvumaN9dWrQGtADGjtxQ8TfVj3oGS9pZ/T3HcXUSQmc9AmP
 84zMrR9ooc2LPLFG62kwfx27anwp863O5cXPXpMs88rnGTHwvvcxdayckZJCPBJnmrioCLBsSKC
 NrjEapO83TwLJF45MYHjLvJz2E4u9fjwAYhq9T2Aw7dlnNpk7GflhePGju273tCSzgQv739O8vd
 6WoJumVyOg1PwRe83m2+htLjo8L829UZYkv8IuSxMheVVKeh8V6Bf6cJBsHr9wZtDsGbt/myOZj
 ocGLW3gQZ3ZV0GOkU3UabNW0wYwWX0jYHaMZYYJl3Npik09MNkAPYUPdGnbUnm3oDd5J79cjdO2
 Tj/gNCPr9kW5nA4n0HjEl4ag68o5p6JFLPKRkuPSWO2kYCMgPXK8AvRWzPQCT9mMTFCFixPTMF/
 a2xYuPBi1E5z+7usWvMqhlexiGWdoBt65MZndTjG8uPzWAYbr2BKpa1TD0J6elRyPfYQXg44b5O pm0peE90HU+IomA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fSb--g62J7EVQw4ja-H5SKlFpiooHo8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5MCBTYWx0ZWRfX9HcGLjAUI5HI
 /s4B7PltXFJYIPD+BLwEbSlfitLKiOn9fgFPrlnDFsjxucrIXiDqVIiPb31/TeoE2wkCI5ayNvM
 44FfmVvn857P5omfDIZQOPDy1pEtari0RxsxHvExMeTNS/NQu3VaHHZ0yG4HeR/Cdm8MfwQyjSl
 eWb02XsoUE0jH9YsE1YB1ZzuG01I86Fu8OR8H4QxOKiEUVUymtZpvvw95nPJlFTy3yle6JRPc6T
 b2sh1Z7Xz6E3MDroB1Q4nKg5JPZ5965UOeC5JSPCZrzfmBqQs0p5MDqPZDNNYBUqGB0/q70wC6C
 dLc4niXSZkNROnaCsWnXGq/612MyxTclE49RNYkuMPFYG9axiuCmRnCah6Xxsvzzt5j0lpz8+0Y
 jo4lR+VOaPtxZC7+k1HiJ9VfGr0U9yGzyH5nOG79g+DTLfsUcsab4OzTJEu2gOgSqDM6y/BD/CA
 JdsHOhkEArbXXR/H++g==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9bbc7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UPwjdVLwzqKTMXskr54A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: fSb--g62J7EVQw4ja-H5SKlFpiooHo8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050090
X-Rspamd-Queue-Id: 662234CA08C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36134-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the pin controller drivers already have this correctly placed,
so adjust the other drivers.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Apologies for sending it immediately after previous Qualcomm patch
without grouping as patchset. Initially I fixed only Qualcomm but then
figure out that poor patterns like to spread and I can also investigate
other files.
---
 drivers/pinctrl/bcm/pinctrl-bcm4908.c | 2 +-
 drivers/pinctrl/bcm/pinctrl-ns.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
index 12f7a253ea4d..57969cdbc635 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
@@ -466,6 +466,7 @@ static const struct of_device_id bcm4908_pinctrl_of_match_table[] = {
 	{ .compatible = "brcm,bcm4908-pinctrl", },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, bcm4908_pinctrl_of_match_table);
 
 static int bcm4908_pinctrl_probe(struct platform_device *pdev)
 {
@@ -561,4 +562,3 @@ module_platform_driver(bcm4908_pinctrl_driver);
 MODULE_AUTHOR("Rafał Miłecki");
 MODULE_DESCRIPTION("Broadcom BCM4908 pinmux driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, bcm4908_pinctrl_of_match_table);
diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index 03bd01b4a945..e134c9c73450 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -204,6 +204,7 @@ static const struct of_device_id ns_pinctrl_of_match_table[] = {
 	{ .compatible = "brcm,bcm53012-pinmux", .data = (void *)FLAG_BCM53012, },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, ns_pinctrl_of_match_table);
 
 static int ns_pinctrl_probe(struct platform_device *pdev)
 {
@@ -295,4 +296,3 @@ static struct platform_driver ns_pinctrl_driver = {
 module_platform_driver(ns_pinctrl_driver);
 
 MODULE_AUTHOR("Rafał Miłecki");
-MODULE_DEVICE_TABLE(of, ns_pinctrl_of_match_table);
-- 
2.51.0


