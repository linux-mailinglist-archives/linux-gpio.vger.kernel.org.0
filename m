Return-Path: <linux-gpio+bounces-32034-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEQNHsUynGkKAgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32034-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:58:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AE617533A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 420D53026434
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A493612D6;
	Mon, 23 Feb 2026 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvfWpcdM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSlK/qKW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31053612F4
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771844247; cv=none; b=IWPygd3pMnSxtXBVSIwonAM7DWBeVzxyjtVSMBGT1Zw0T+kb8H/4ifW5W2gwaMV3r5omcApDs6Ps52xHpx5M3Uh8+blVmLC6XX4huyQbmZU4glBI+S1Gj60g3KnKWiczxbRLcZKKydxLK8CbbgALS8x6b5eae7F9G0fauczcLgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771844247; c=relaxed/simple;
	bh=G3uoQqzwbhwMv3rHo8CzAGVUUhUj+DhmlQdTwenR1nU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rHjPTwvP0cnDmRXUc2QSg+cBAmsXjp0VlEfMy8KGRXuuM3GKyaUnDRaUIs6RTJKkPk7WHYm+pLHGOp9ouj2AyZ8lhfLTHhOYmRiXLn/Zn+WVUz4fdHUcqJsg0P9hAtw0w+cU27kDDlRrqjFcf3h+BZ+wX1SyUf5v1PeZKvKlPyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvfWpcdM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSlK/qKW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYBSd561293
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jUC9TlWmv0obtpzoHHcT8WkjssvqQiRshIt
	uq7Tbwls=; b=LvfWpcdMprHhI2Bo7zpuR5/qRf4NuIUS7FpexbRdIVN4kuNvcm0
	Sl2rzjY/5uPjs0u1+suzqyjkPYx8Ure+n61lQXGb2WDPswxNwKNZ2Z+U4qM9iou/
	Lc0u0tw3TvZMpHCxabxgEArC08BIpTV8RhW/qzmtLEpzfqkRGgZxAmd2czhbHcNA
	xaCbyWIDYLlcDVxT5pr+IAbkIJHj8Wbb7bkGpiON7D4PG2hIge0lc+Roz1ZBvGaY
	VPusb3G94vP45nqmzSaOO/RxusYA+EGfT38G2Nm4v++nZoRFgOov2KYO08vu2kGN
	REUIv1001T26ZJVTAJ6GQzmAFC1XALJcZQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r827a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:57:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ab7f67fso2810368885a.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 02:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771844244; x=1772449044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jUC9TlWmv0obtpzoHHcT8WkjssvqQiRshItuq7Tbwls=;
        b=aSlK/qKWJ15JFRsGFaTW/kqfWtunZhnE4Ks/75a0BWY0l5Nj9QDaBO1+b7SI99ikzw
         VvWisijBW3zom2izhO57SrDaBAELkcnzNz1YUv6Qa3nCcLEyOaDweaI22Dvg5CdEU2EB
         u41WepnNVYmmoTFVZXSQ22YUM1KizkugxeqcolycW+0wNeG3LIwr7DYABolU4rS6DTi4
         pLMUa2e9t+SKftrquvc9wnHex+E3kkayjsO1VxMJHMg95/YYXIXITH3cfgyE1wk9DHh5
         +S/ErhO2flOkpjcGiGLGPmz3eIGvJNgBYOzzhs9o7zhqadHarYyJuk1DI/cPRNWMx68V
         yQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771844244; x=1772449044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUC9TlWmv0obtpzoHHcT8WkjssvqQiRshItuq7Tbwls=;
        b=J/aijgd2Lht+UcLGpmA+HTCwLx4E1o9lsKH9NA1TIKD6ObMR9wiKZDZBRrFI62GVSj
         5cp/GSC0STlSKgz5xczp6Pj+jye5Q+Gt4+SpdNl/IdaOGRSg+JTYvSuDGkj46C0rWx4z
         D+4IhaAxtOpssEqOsPCAwO/7gloKqfGDlgNJ67iygA6BAY9eO5aRnPs97BcbgmFZEfM3
         pAQbf5owswdfEYQyhHfpdk/pwYWk0L9oJUXu271AYy0r3hQXQQAhk8BLq316L14ms4u7
         XaA0i8lCwkG1A7k557cLNC5cFyyqXHU9B39LoN+LzqVGMyV8RaTF41bpYAqS5URP/Qzu
         Fqzg==
X-Forwarded-Encrypted: i=1; AJvYcCUUxfdnmaSAQcPB6vRCSa+zQad9t2QkRntnMG+JGUjG8S2+iiHzal2GQzfwguNoo9u0IPp5a6EYGw37@vger.kernel.org
X-Gm-Message-State: AOJu0Yy37RG4/TLgohwKZoWPHUNCBrAWwCJ3rvBDmp+7NDiFotjPyuKg
	LhYuo9AB/EIqfQ8LpOwWwbbyB24u8FNhwMJoQU9iXQlAFoZWvq/XTnM/9AnL6oIWAZR3BIyvIZM
	M4tniZMC281WQlKZWwVQ2eqgNQHO5eq01sA7sZN8z/bj0Lqibb+Hb4xXcu4DBVYea
X-Gm-Gg: AZuq6aIiml9Gy2V19PPIUv7xxd2kIGKcY5WbpeaEylCdjLGKuEn4QMZF78+BijTLE0i
	10SV8LPoPcmYOGRsz6iow6Hi77TIv4iMg0xkYkdzoYNiBNohJshzfJySwiqG5KIRr5477JOPmVI
	HBU6SzgzJsKOx0awKfWcLdsIS/DN/KKSkL3pY3o0hjQVwC8H9Z4x8wxZsytzpiTRXHrcvcu8b14
	TYwgHPbI9yoo5SXiYIsajSobiEcoPuuBKdP7MYOGvN32h4os/TA7TtNkTm+cPNsZOmEuw5oRHfg
	036MCMrpsczCGn5rMpCio13P19M18eRZao1PYpTuzeIbRvDBITx/AJ4uyI9A/qH/OHlU20tOFwF
	/kmCuNIZAFX5TFHCGPP11OlB/US1FwAp/kLRG2w==
X-Received: by 2002:a05:620a:d8d:b0:8c9:f4eb:ac71 with SMTP id af79cd13be357-8cb8c9e00a7mr906244685a.10.1771844244225;
        Mon, 23 Feb 2026 02:57:24 -0800 (PST)
X-Received: by 2002:a05:620a:d8d:b0:8c9:f4eb:ac71 with SMTP id af79cd13be357-8cb8c9e00a7mr906242785a.10.1771844243651;
        Mon, 23 Feb 2026 02:57:23 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c60bsm18140215f8f.27.2026.02.23.02.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:57:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>
Subject: [PATCH] pinctrl: rockchip: Fix configuring a deferred pin
Date: Mon, 23 Feb 2026 11:57:18 +0100
Message-ID: <20260223105717.48779-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=G3uoQqzwbhwMv3rHo8CzAGVUUhUj+DhmlQdTwenR1nU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnDKNtoQe5GdE1EfxYH3cWP7j5g7W2fBZbQJ1f
 M1XdzvUygGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwyjQAKCRDBN2bmhouD
 1wHGD/9gOeDdNWNQGaIjTJ1BjcIplUgUa679M6zz4l7YF/MEDewvDNgHyTbQGKfp9FuPF87jP9W
 yY1adjL4z9CMML1N1Q3darmmdoeiKkKlbmM3Pn5Qh825I/eQ6J9JJ5WREUrwhp9wPuLb5MOkWxd
 +IL+6P72pYU5pVecdI0qkS6KPyashiEHVmK7Z6h8K0BaavFKp6w57iCEF9AF5PCIt78C3lyNcZW
 fNRAaeXk3RF/2Zw0i+o0Br1M2MCPjQGWQS1kvm8fLGvUOLvOmM+1S+7fu59X5htauWtaITthriJ
 NJh/1UfVosuobC5H3FrzvzyYtQIipzbkc6Ply3pjEMCEruUaghTSvOudTw96+VRJzQANOLQjj4l
 RDzrz+Mlc6BUhT03htNS7oxyZ4k3iH7J7HQ6EXe/HWomB/GeBOIHpssgdQlOxDVs33SnTFnplX9
 yVqtd928i7HgQJPhggJ5x3GhHBUe4huxIcx0MthHSC/Dkq6q6XWXwas6SDsP23kElujRqAfvXDg
 NdYu4cqiD0no1pSWCitq3IeL0jLCGKWid7SILla8eJ+sR5ufRobefLmWht/Kzi6lf3Ls3rpAoia
 eNZRZ6Sn1auRE1Df8+bAqrbUHfLkTs+XVzU9Nhek3Wm8bUEFgI/uv8D+My+84RwH1SVrz4eO1fZ 6GXs2LZxL2pQE/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7t9OiGHgjltZR-BplKBsuSA03EdmMEDE
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c3295 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=wq2r3B8GeWDWek6aAFgA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NCBTYWx0ZWRfX9s+4GsEhlYcf
 GR57a8T/XxhiSiWC8FqAIRexKUZTgzgqkVq0v2mIJ2dBvnF+yRFOx48sOi8A8H7TP7iyqKhcaMX
 yz8mLHo1Ffm5rPl2KJofYHAeWCMFuFJcKYr8131eoO9X5+vYYBFfJ+DCqNpmymbod0HT6PE51+e
 WEUelmCYGu0oVzjZm3NB7Q+tnLY3mEkpmz31VUlasUpk7KPyb/pMie7zKEB34/xfRgwUPawFbSD
 Fui/Lzmq0KEcnnA5iAmZom8XloXEpsZlgyto0GYHuuYRGMm9UMaOjoDu2ApFZBL17qpROIIV6fE
 sY0HSmt25s/hfi+vtzYUG6g49Es5KWm9/GKbzRHUh6wWQytn7FQaoaS0hPlEsRnAFs6G8poIK2Z
 qQvUyORAPu7btoASuCp9MCJxT7LSNY4HvBaOKappYYWsVj3LJBNtAwlEIhj67GtliPIqXAI73Od
 vAmkMSCbfyw/FT2QBKw==
X-Proofpoint-GUID: 7t9OiGHgjltZR-BplKBsuSA03EdmMEDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32034-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,baylibre.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0AE617533A
X-Rspamd-Action: no action

Commit e2c58cbe3aff ("pinctrl: rockchip: Simplify locking with
scoped_guard()") added a scoped_guard() over existing code containing a
"break" instruction.  That "break" was for the outer (existing)
for-loop, which now exits inner, scoped_guard() loop.  If GPIO driver
did not probe, then driver will not bail out, but instead continue to
configure the pin.

Fix the issue by simplifying the code - the break in original code was
leading directly to end of the function returning 0, thus we can simply
return here rockchip_pinconf_defer_pin status.

Reported-by: David Lechner <dlechner@baylibre.com>
Closes: https://lore.kernel.org/r/f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com/
Fixes: e2c58cbe3aff ("pinctrl: rockchip: Simplify locking with scoped_guard()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Offending commit was introduced in v7.0-rc1

I also checked few other of my commits for similar error.
---
 drivers/pinctrl/pinctrl-rockchip.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 816823403e97..4f2e02322508 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3640,14 +3640,10 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			 * or the gpio driver hasn't probed yet.
 			 */
 			scoped_guard(mutex, &bank->deferred_lock) {
-				if (!gpio || !gpio->direction_output) {
-					rc = rockchip_pinconf_defer_pin(bank,
-									pin - bank->pin_base,
-									param, arg);
-					if (rc)
-						return rc;
-					break;
-				}
+				if (!gpio || !gpio->direction_output)
+					return rockchip_pinconf_defer_pin(bank,
+									  pin - bank->pin_base,
+									  param, arg);
 			}
 		}
 
-- 
2.51.0


