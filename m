Return-Path: <linux-gpio+bounces-37782-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO+6AFmKHmr0kgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37782-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:46:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61695629E04
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDEEB313C9D5
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D60C359A8B;
	Tue,  2 Jun 2026 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEcSudWG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJzHJSYs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42C3812EF
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385864; cv=none; b=A9YI+cEBVDp2QURAkTpv2xcfTdwf+82Cf22gLmLoPzni5pBvgMxpVkh6ugG6pj9MKwpOdpdbo4nPARhOMtz+ubJqRyWEbo/Qtz/oL41jgU5Uibm7PowY1fhJDXFbZ/SPDjStQ+evlLCXB/s+ZtQmGmhXl8c0Ka+a8Ab96HLunuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385864; c=relaxed/simple;
	bh=5tHG1FlwrsJ+IHxw8sBjDbukLxgFU0Jjxwn/XHoDkPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ghTDTIMIdxZi6pLbEu3QMxA1RmAaQBzY3g2ikmlSzKBOZ4c6HoSAJrg1gyRzrQiMEzLVBXlGZTEgNowBR3clXpEHkw4e3gpAjqhWsn06ebAazy9zUJcPGgd5ubEl6H1pqiznD5Nx/n57ByqT0G4qswqWL03bHXJzbU4TyP+tFs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEcSudWG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJzHJSYs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6521jTKP623025
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uV2Tz6tB72+D5Th0ivsUu5uoqlSvSamTCwDI2/DyL/Y=; b=BEcSudWG0YyQkBqy
	zbCDLcQaa0S8T38Z5r7dMy1dzf7jYOrm6xKCJG0l6GSgbSHdlfaGMfuayK0HYv9P
	cS4rpUJcDbB1HJIEkuZ8onZiz73pAFrdA/v6Jt2U8NZhrUIWUfjwGckFQWg/Ptfp
	29RW6kQ+wnqDVcYB/97+JNEaO7/q3OnEEDhJRO4EC2g5NgpfscZIC/76PRUrFWMC
	owyUYVeRZ5WE9Hvqzj+IlPx+Uo+CsC5JW/xpifHTKVFhx7ZWZWnVAg2AXC3o0YZz
	3Zsk8SvbLEoAXiBEytCebSNIGyday5KnBsziPlHQlanhisMEMXUQzWqL6Aorb6tJ
	vngHmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954mnva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso214891401cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385859; x=1780990659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uV2Tz6tB72+D5Th0ivsUu5uoqlSvSamTCwDI2/DyL/Y=;
        b=BJzHJSYsOhbc39p4ONwkIZKyg13OTrJ6TxkSewtaAnHhRTCHBC0GsA1nIcZOark+iy
         sGpt5n3NjgUU8WuYOOLUayzhonvpL8Z0DJwdNqVKJbvu3ecx7JuikK++9dkpTc8gZ5I9
         a9nF4/8uqzHzZnDEyHO6WzpNAnoG5YDDffob4hcS+G0/jlWlWdiesJtNIhKpWyVYnWI/
         jV0UYWVnltg4VAACDmaY4h6m8MEI8xxQptF7Nsu+o+cWo5JbXL+NuJVBg4SX7aXKOqrc
         RijVpNY5v7zZEkbG5jxiDwxU9zxNQqInvxXjRkfirppoD8tXOU/QeoL+cWqDLEqy6ztI
         7OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385859; x=1780990659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uV2Tz6tB72+D5Th0ivsUu5uoqlSvSamTCwDI2/DyL/Y=;
        b=eCK2OfnkaWUmB33stevN7JPZ3gdtZxf3MSOcj/e5SDYc71P4/mtZQ/RKWxKcd5iBAf
         jUX64XNEAAbcd5A123Dx1ktEzxNWWKtlyY/A9f2oQmgOSALCBwMShsGrVc5cM0X6YiZB
         hZoO+If5YW3BBL3d7SZvvyX94vpG9/200/vI5is7FbHrugG/cdP97Xdrg1VFtFD7RmHY
         psp9q2Zxl0+FlZpcxCqJIeMWn/1YFKgDIWi2aDAY5jHzB2c503FCxeN1P9NpgbIIEndV
         gLJqV6HnsWoe4W7/kKP0KIAVdS8TUHzjeoHtlAIjlRRu3p0kyUIG3dlVBuLB3XOHr60v
         5uXA==
X-Forwarded-Encrypted: i=1; AFNElJ+avnXIb0KO2qpEcTwlKEhEel4CI/ZgAY0m0jxhFVaGQLSqVePuVf9C0KWlw2ol1m5/tfsPG/UP2nr1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw441s/i1oo/w2Sb49oAD4Q+fnLvOY07WBGJ3RjIAlSEjurYvef
	L7OUhv4jdvJAXh7I2gXKJDLEpkD1aZBTYYPBfdiO572hAPLZpijlxLa6CCQLa2ugZgnrWiVh6XE
	ueKPWR5ki7ZZzAHv7IRFMms9syo1Zbzd7HkIqs1efRqY2vfNtGhMI3v15xigx77fc04HGrR+J
X-Gm-Gg: Acq92OFOI8cn0D0aIg+A9lKmuNHk8P1sNWiwB5iqjeDTi6AOqw9IgK2BpKyZiaJ+F60
	ow7S+4kuo6vihnW7hhxYtyE+c4+jPpJv0smyZpfO9A1KNK0TC01/15aed0vtDqhIEWTqszvY1Vj
	QbQrXIAkzjDZsowkSGJDd0vmh27C6/aAKkNXb1Tvt3ahcJKvarT+kE3lRiWNOAjlK6cjW2tfD4s
	6xV8OkaIT7Wz9rF6SLTDw5KCAK7f2pH6rzupX6fAw1aQSou2J4seQIwd121KCmTZRxZelhF2H+5
	YtDSuxpAMtAbY87T2gxC9I8axaXTQ4Aa4kY9gNeDfc3i3i3a6Mg94bbRbZDSH79VGgJwh6Psled
	AKDYM5hQ5PUobkC1IBaYPvPNnwnc8B003w0obf6FgJPzMUoyrIYyp4ze2OjP5moiRZ9yQhSEGs8
	/STstaYHbageC5rg==
X-Received: by 2002:a05:622a:558c:b0:516:dede:209e with SMTP id d75a77b69052e-517642c7ce3mr51370291cf.60.1780385859363;
        Tue, 02 Jun 2026 00:37:39 -0700 (PDT)
X-Received: by 2002:a05:622a:558c:b0:516:dede:209e with SMTP id d75a77b69052e-517642c7ce3mr51370051cf.60.1780385858992;
        Tue, 02 Jun 2026 00:37:38 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:37:12 +0200
Subject: [PATCH 1/9] core: fix signed/unsigned type mismatch in
 gpiod_line_request_get_value()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pre-2-3-fixes-v1-1-9432002bce8e@oss.qualcomm.com>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5tHG1FlwrsJ+IHxw8sBjDbukLxgFU0Jjxwn/XHoDkPY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHog2Xw06Tbvz1hUGZfeUeead/KLQs2V6n2g27
 0iPSWO5WHuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6INgAKCRAFnS7L/zaE
 wxQ5D/9bsWVDb+eSxaB8ZVLRV6hKbZZkgdRI8Zlyom9ERxJeuWQVbB7tRUrl/whwGzzCcnm+QUI
 ebG0gONLniuV90NoaEBGzqHfjL+VhFSlfpQvRw2rBtHc9tQ8925JltsfrLT+XbVFcB7ODunLfUT
 XOAJf37TBo4KEMyBTW4NhT++FlZNUUxbSLY6ERLdRvxbyM/ORt6WZd1bs8hP7UJBO71prJOiZkL
 lUoeKduCaig5W+Alegqmtu+Ku8Bjkwd3myLyCZYoiNNSEFIEY3UWjpcSrqFT89RfWCC2lkHp0bm
 bRjs5kGcR8ZfywraFFhYVLYUzQ5whwCZ8PispUIX3hojMWhumzUEOK8HcUy3T9j8lM+1O67Bi/+
 5IVIIVODjZMMJ0XfG+xuNMmdrQgqHuq42qa6dQEnwcHz60i1PizB9yC+YE+KrSwVwjtPVUfLxL5
 ThxqRMmMp6xoCXPfuaLbdbMpxP/UvhIuW7WK99xQTcZLTIistyFrSmfWhECWy9EoLETHzkeTbuW
 7Er+k5YCX8z3vfzFBoZtnR//esZLIXfSy939lQnP13ays+d10nMUlIgqvm8LARPoENgPfM1sJlR
 ZsUSt0oDLJqUwv49QCIaQP/8hJxK7Tys7eaSd3NQbv6W67TGgulQVGsnyWE8xgon52BxGa31yNF
 fj81vZHLDBjdC7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: SN9o1yt5seuEQJkUMiq13dA_GERHqtml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX6hvt8L5M5rxr
 Jozb4iFDM6B3cRzcbav6yGC6rEUQL4XYetyDY2CyfZEByZhK+cNoF2C3RDIqtF3hZUZ41HKFy/j
 U0SwMA4JhjZxnsg30s8SkpK1zSuUVkkvhP4oXGX606LcDUuitr+XqYYjBBcHojoDqbTAS2AGOe8
 wsC/gP3LzBOseo/pExF8XprLo3PDpE1SVKcTdXGj6XcL8nossmmqQDkuZOVeGPixuwHoNLXnTvj
 Moj6XwGgahtEPY99pE6CNo76Dm5dV7eJ83XWNvLkh9PavPcq0g01UYRaBZVn44NlAtgviDKhV9/
 QBRl5bE5bg3xFbNCEghJJRavXuR1mZjjgZq4YGkcbYuTYxHQ5QYfjs1drNFqTt6yKxDNCyrFFnb
 8cCoWGLL8CmnomBPezkMK28ql7F0DCNzZUxyea6/bOV7BDboRq6nwLaRxL21KDTyQJUohdzqlpI
 Bi6CZbi9D0CxpYJ3FCw==
X-Proofpoint-GUID: SN9o1yt5seuEQJkUMiq13dA_GERHqtml
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1e8843 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AkmSCQ0dM_fKXMyayTEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37782-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61695629E04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The local variable used to store the return value of
gpiod_line_request_get_values_subset() was declared as unsigned int
while the function returns int (-1 on error). The check for the error
condition worked by accident because assigning -1 to an unsigned type
produces UINT_MAX, which is non-zero, but using the wrong type is
misleading and technically invoking implementation-defined behaviour.
Use int throughout.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Assisted-by: Claude Sonnet 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/line-request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/line-request.c b/lib/line-request.c
index 2d41d96aeffed731b5039565672ebf894317a2a7..32ab9aec1f38f387a6624ed61246e58d6f162cf0 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -99,7 +99,7 @@ gpiod_line_request_get_value(struct gpiod_line_request *request,
 			     unsigned int offset)
 {
 	enum gpiod_line_value val;
-	unsigned int ret;
+	int ret;
 
 	assert(request);
 

-- 
2.47.3


