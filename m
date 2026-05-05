Return-Path: <linux-gpio+bounces-36135-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEWVBi28+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36135-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:45:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 701A54CA0A1
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCC0B304F2F5
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD9340DFB4;
	Tue,  5 May 2026 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHI1EGIS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQrpVsJQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1050C32D0CF
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974220; cv=none; b=gs8+ROwaINrCJ7+xTffnuEbnXtPLIe3tT4Zvs4mTf7HXEWP37oTuqhm9RHncfMiDsCarM2j+WbBOUZYIH5kofqIeBGP6hCjQQuArNsTJzz9wXoTO5x6v3BsrRAyPMSnTKVb0ZOFNlDrC5g7oLEZN9mUu5wBPBIHMON1jiUMWgHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974220; c=relaxed/simple;
	bh=V+HB4nqsZW8oIMtgAz9ozlJPzMJo4aEb1PAAhjZ/erA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPE0TD+cbA7fILlrHExgUXzRg9F7K/lPzMI5hYbIemTpgt06W8p+oNT8ZP/bnnc5uUPVUuKE/TQtDd8kqMsECkrRHlCo9vUJQMG/hlxxLcFkUxh7oWpTHtrQOVysv2LQEeVE3PWwBQMKVymmnl9yKR4NKKlpqRUxf87qibkbEB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHI1EGIS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQrpVsJQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459VRip2859173
	for <linux-gpio@vger.kernel.org>; Tue, 5 May 2026 09:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6KS2SQLRduV
	fwpc3NGf5lfKiSMPz8UqWMH8LhNcjEEs=; b=IHI1EGISjXRgcr2goKmywHG64qA
	WOY1a9Jo1R4VUPIFq4PDJZC6RwiN8CBJI8DYRp1vNOSIvT0sO188clS2U5dk92KX
	pVSCJzQuMeSIk306daJCPVeO2zoBMRlfajRddakne0AUxPbf3Por/CmdGlDEoaBi
	Q5wyIrmaJ6IjUKtesgQ7biqEZQ6DDRmd0MGGE5T3bhohwgoUSgodqcL8R0tPD9Uf
	WsfJ4/dG3TONZaNhRZ+6dYJxGptRMqSnPbcQGdBqiQmWJFoTuUSS+70oqhXr8BQ3
	JiwSuv3TUrj+mBLwbzN9QmAY7XBKYekmGycmby5m8WPqjfktws0Yb8wvtvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ag1jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 09:43:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so173479521cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777974217; x=1778579017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KS2SQLRduVfwpc3NGf5lfKiSMPz8UqWMH8LhNcjEEs=;
        b=TQrpVsJQpPNAcpwund/soY77kt3+evF5tAjt5jUl6+GGwdR3VZzZ+0KlplevEf/v2l
         4YNkva7UiH7f4gbv3TykDBUDU7iZMv/2hfa3ZP79QFI9gBjt9Frje30y35V+sZ8m4Fcg
         B/acfFl9AWmz9JVRSEQFnY8HLxCkxJxfeFNx9vSX/IMg3smnF2w+W0CuMwKx7Bf26qZs
         gqswajohh9o6Hzs/E0KGXQEhsntCG4nri2ybfqVfZFiO4pIbdzc5hJ717XYjz1PwRKv7
         TONk8ZhdPdPs31EyxmF/Ig25r0V0Tg1yjyjCzBSGJFqpXiqDWyayj9ZgH6kon7nIMGIY
         TfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974217; x=1778579017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6KS2SQLRduVfwpc3NGf5lfKiSMPz8UqWMH8LhNcjEEs=;
        b=dATVci3bB8KwUYAPaY/OXoz7ZDfWo2dIRp9VvJZ45oAncvK8INA2Me70bJwz2OkEHa
         4hLgYNH139Bjuz/x8qXfA1Kl3q1GCaSB++vgrGMap5St6OE9jSmeXFRLEBktO5vB8pM2
         kcXQmlJyxcfMJVhUm2tg10RnMNp9ghQwlX7ncHdc9BT0onEoN03Gtp6rrLRIXvFkJttD
         AEaXFsvWW56f0RhLDU0yTEMedprdAjHy/TKkbw/sPqFZlnhpPtNV2hxoN31jn0jP3d2J
         u/61YqvcRzgboY9fspU/fsZZTrUj18UpzBcadYAad3mW/OMOLgyJw59DWGE0ecNd47dJ
         JyDQ==
X-Forwarded-Encrypted: i=1; AFNElJ98lGteF3pA7Nrv1+nbvs0vAU37EaiXVCY2Am+oNyM5CPz1rjmyZxHEbxOkFkxdNw0I4Q+a20BrQsXH@vger.kernel.org
X-Gm-Message-State: AOJu0YyTP01i3r0wFOH4IqKjscrdMP1F9rrIQt9YYNIC/n5R9p+AswMr
	9O2zaF8fcR78vPCIPQNLSj4IUZViwZsLCgmf4gvy7oXIdGOF8SGcVqm20q8uSYDE0JpMsawwTDC
	jBP5LvMNW/clKtR/n7rZ0SktV24csaYIWKHF9xm3jdONaIyiuzLt5QC8iikhUNDHY
X-Gm-Gg: AeBDiev94BDfGM0ych8Xk9LwKSaIxlFhIcABbCjyl45FO4G/G/jYaugJ6jUFhtChKVJ
	MieSf7+OIYZTsmH8ZFjjiPQr8LhJn1UgkC1rA0uUTANrkCZX9r4FSH9xDIk/sZbxHIkvAuxPDVV
	3j3JnM29JfQZ3n7Anq6nVvfBxIEbsd7EV0qXdWatm5t+oF3ogjeiQf4D3bxYbjAMC+LKi663MVr
	/xwEcu2qJrZxwWTO/TY35lJ+omP/MqfHvJs8uP0NxLXWqxNyjfUxDhxosPaxup0bAHG85phOhU2
	nLyjDqzlmOvv2NfVkks4dhbNu8OSguTXIzs8o8Zy9lQuFYNLFB6gncs9CFpFGIYKAJLLi8kZKaq
	SY9ARrAdEbimr6aSZ/Eux9aO2YRsiWlxHOpGEVUizMbU4o2U=
X-Received: by 2002:a05:622a:4892:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51306a06ea3mr31211771cf.24.1777974217612;
        Tue, 05 May 2026 02:43:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4892:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51306a06ea3mr31211441cf.24.1777974217169;
        Tue, 05 May 2026 02:43:37 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm603858135e9.1.2026.05.05.02.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:43:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: rockchip: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 11:43:18 +0200
Message-ID: <20260505094321.75040-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=V+HB4nqsZW8oIMtgAz9ozlJPzMJo4aEb1PAAhjZ/erA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+bu6tKfCRTw00N7V6Ex6xmKEBORVM/gT90aMY
 QaFkiqT5LWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafm7ugAKCRDBN2bmhouD
 1xVXD/4qT2/aF1eWFpGlNTG1434igw4HqiB6LG9AXy9rrBTK6sy96WeHheBxdWG/z6V3qxXt77Y
 zyjqfRLpyiDO1CTaCaZk7XglihreTE8wc9mk+2ZCtEy6fVZ4ReNhkrDZPRP73gPAaP4IbzNlloc
 ph2bElfkfgUAX32ePl6LgSPsXXHqvxpagB8Sz6MK4KROH3N+/WhoWGtuVXLR8OSieKhsG6eldRL
 rD1umZ0lLdEeSAujIXmKzKbZV5cQB6cFLq2mQ7qNiQ3HAKnzMo9BmNajU7ILGapKpxlEvbsIyBw
 iedzMp3sWyDa5MmZKY7Gy22rOQny3ZIm7fFXuxrOQDG0/NI75WxQC1BNTS2+iFOfKv1a1j0kdib
 2ncKuKDa5vmYUQPAtFOuiik1O/5eHDf0BQIwB1TEGR8VBaen+8GViofu5Oy/Tbhi/I87OdLvGZ9
 fuMV+UAtSUAUfJVxke76/2MCqhUZO/uD8sUK6Lr2s+Cb5WAS12NqGJ6uh0YD0ijBSJreUZ5j41W
 F7DS9DTDPbfsBE51PqSeWa4xBPma8V1/g1zC3jS3/1sy+OJ4R2KUJ67LKEgHYHKkeyJ4JyzuNh5
 WXpwdY0ozPx9GingdlHErbqeAOLc/WnEmoISWlea7G7n8r/OGTok/X2nFFr9vo4RGUfBK/y6cXU yKxNTyNfjiPfnPw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5MCBTYWx0ZWRfX+H45O10arQ64
 SJnW3EuxN9s0m6p2ZfJdgQFtq7qQTZUmI+AM3GEaRMZnOsvHhpPVDj2Qyi4m4eXLQTZtT3htoIy
 AQJ17pA8bpGt7utLbdcLK4XF54UXXI+6X2CEP9N1jsYts9drYm9ZnCdwd1pFySwbjc1hALO9R8S
 71GkeVTj0cwmo+c/7ecfeh3AUbTMyYsVJSMKqECGh5Ec/U9jSO07MWFKDLLHeZ92BQ2e7yKb7Hf
 SSj75AQO2RIkoR/Hb1JaujieDd4IPVvCTJRjLR+bIuK+dPTLBKTIbkSoyZlTGPd9yl7E3o3oCWG
 S95ckSF+lod7SZpa9USzIVFceDeF+tCunRq7xAmg2tlv0ppWzLVJh0ovBQhvk0DsPd6BC+FWyFm
 YjLSqGEuoI6h0OjdYeIlwdoDraXD4cU1HnPJ3tJ1dhLifqndPDiP7AsOMOi786KPtuCDABT2aRn
 QTFmonk6fzcyK/+K//w==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69f9bbca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BzP98TPolLMEYMmIy-QA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZOVxDa2V-sgtj-U3mBQEVtuCtvGUItJo
X-Proofpoint-ORIG-GUID: ZOVxDa2V-sgtj-U3mBQEVtuCtvGUItJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050090
X-Rspamd-Queue-Id: 701A54CA0A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36135-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the pin controller drivers already have this correctly placed,
so adjust the other drivers.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 2f14c7f9c95a..7e0fcd45fd26 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -5303,6 +5303,7 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3588_pin_ctrl },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
 
 static struct platform_driver rockchip_pinctrl_driver = {
 	.probe		= rockchip_pinctrl_probe,
@@ -5329,4 +5330,3 @@ module_exit(rockchip_pinctrl_drv_unregister);
 MODULE_DESCRIPTION("ROCKCHIP Pin Controller Driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:pinctrl-rockchip");
-MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
-- 
2.51.0


