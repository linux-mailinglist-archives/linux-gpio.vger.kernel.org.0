Return-Path: <linux-gpio+bounces-37785-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME5VJzWJHmr0kgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37785-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:41:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E062629D42
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A369E3024E38
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B028831327A;
	Tue,  2 Jun 2026 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvUOwWaw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFwcACbJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC43B531D
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385869; cv=none; b=MxwcXBBdDUpS452yBD4nyf2xptspV7rAvdVqazEAlbOUp2gjkThRaNP7wqvDCNtnAZenhOTiMtZKOwDWgRA38dnu+2TLLaz+3mKevAPhTnEDraVETII146YVwTiRxoN9ZESfyUPIMjHhC7Oq7nMNmkmXHCONrsp9CZV0SLiSTgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385869; c=relaxed/simple;
	bh=rTMtiUsVGafOOADmMTIGkan4MldnkC6WhWHfchI589M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p17m4sdVY4cy1xyPuhowFMVjfnM7+DYz/RFi5Eq8iR+j/OTTMyejSXMkaN6Ym9tO1Lv9SvAX785+WKKqXB2PF8X6VMO964/UHy5vreyIWIszKme/RKQ5mr0E7i9xHtk3e+TuDNEE8PzBVBhQvaQd5Y4z1f9/lNHMEabX6vbte4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvUOwWaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFwcACbJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6523VjFv599934
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjnlaPWpl5mAyJkZqtqb+5VLY8zNZ2U0OOCtv/cS19g=; b=mvUOwWawCLaUyGky
	QaVZQZa5dL+L5KBiNURUUcyZE0GVkm5n4yz6uW7k+St9vVBiqFw7LV2/r3NgbSQx
	lSbF5fL/P4aQFq8vJrGRSikNTMwwE46NzokUknvRNMhKuX458RbYPXKZk+WZcITe
	/2920Hu3XjB8KCcIZ2VIe4hrtASn46iSB7aGISd9ZvyErBTu8R3fDNbnq8FPVej6
	Vq+t/bZ8QR9poEhxt3+ymoKW4/KPHwPU9mejyMy6q0Hfkul9LZYpS5C+moLJWs0q
	KpbkGHp8B8M/V+ra04An7dwRM4uLFbQ3/D+hiAxECEJvlw0fdC8ygKOnKxteYpXH
	0xWqKw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8rccwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174d1b326eso54789631cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385864; x=1780990664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjnlaPWpl5mAyJkZqtqb+5VLY8zNZ2U0OOCtv/cS19g=;
        b=hFwcACbJBhi5l5HnbSEzLy9l2Mwis5Ga71XhFqZL9X+Sn+a58/ASn7+H2D/0Vnw7vs
         TE1yAA3yw+rs2YbjU9/7xI46Ri3Mf5Evjb3fzimK/qH6p4o6xNPKhuIA3IYnoZvSpd/J
         5n+ro+SOuCRLC9OOEm9IHc1DlK+3Dzu+5tutWpWNyT1vWeoCCdKqvUwhf9kRMpSlCT6x
         Q9ErT8VHCVKh9rId451f/Zv6ZsJ90+AA2OAVwRtrIMfilc/mYMPhJ7/u+3oi/R6NUze2
         VatMEE+HZKGJ0Ux6WdLDRJe7QVUWAHjefiZMj5fxFBBOAJmFAiUxZjZFDgzFlMvnszFg
         urxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385864; x=1780990664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjnlaPWpl5mAyJkZqtqb+5VLY8zNZ2U0OOCtv/cS19g=;
        b=GFxL7O1wgz/Xg/QrQr0tXTOwV3LUqVkGuOvFNhzwabG6wBopM7JVQWeMQEwnMu2mDK
         1/VcXdDtQZjqK0N8lZjvGEeUJjl9+XupYQIXiO2X1ChLtZhE4FyXeObEqjNTFsyXPX6N
         FuLxcU8FVYl/uknKkjN4R1cRgM6oiTyhdmvh3eeetFhr6Mi4MpBqWjddapBcPG5KQnbI
         bOqbQDvHx4aM5RhJYMyFQ2oKJXfcLKTFJ0w4vfQuTUjGS63W9CwIznhmPHQRe5e+ondJ
         dKH/+xPV59lHvIJ/rXPc9+D4PbugnmcGgt9skpGiQv3PGi+NCZiU50UHeyv5a1w/N24X
         qmew==
X-Forwarded-Encrypted: i=1; AFNElJ8GRGeSxvXjGkeWycTihyvvjzNcThMRMXtmDfWnVy+cHAhAKwr5DLo8hgGuWIhrS8x4xA3GVOEYPPke@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ07ZGrx5wjPWrJH+GGiOdItCc8h/wlwLag2Y+2UbftEc4bqea
	4P4GRHGqjZl+J24X6moCD8QHnGkMzLPBGJKEHO7cH5xsyf1wmlusOhieFklwnykX05Up13YEmzd
	UgBGxmdTMSB33oe4x1dZlk0RjH7g6MXMQLXFfefIY9KIysF04Zq5bznlnaFY+QifxTDNbMiV+
X-Gm-Gg: Acq92OHqFYcWS/7cJHBgyjMluH3gqZ0jCWbVifzUe6woCXy8jQnXDaXSMbkXj2obpmJ
	H/N5tddd0G9ByHbnU5TOAzLc9TWuGvagv9xAlKWYQUYwTYti8KvyVdvg/FP7k3YpUfBNOgJdpKO
	dg+M1BTVReyanuldlPphL0QHa3k+YAF3BJYj22kvTK80z22RtkGQfkIAuUKOW2C0+siH9k/0gp8
	F7oRPtY8xvFwRmj9H35Iy5TjY7HvX4px09qgNI9P5YdtEH7re7kkGX5ZbS9gZm5JPMXgActTBrS
	JbMSX7vOmO+HI/ko4pzBMULA6RkWNR4qO2tpsMhzpl2OtOgbkXaV6DcVNUWBxH3KbyNQstZANgd
	QzBAfu7wYuXUs8lj9LYDN8HP5ylpNrekCg3ApsIJ0PfO54vr7CzF1dUZSXrqkE/aoC01HLn2fer
	lVkdGUB60TsgahLg==
X-Received: by 2002:ac8:5fc9:0:b0:517:5f04:f24c with SMTP id d75a77b69052e-5175f04f4b1mr65450501cf.39.1780385864448;
        Tue, 02 Jun 2026 00:37:44 -0700 (PDT)
X-Received: by 2002:ac8:5fc9:0:b0:517:5f04:f24c with SMTP id d75a77b69052e-5175f04f4b1mr65450311cf.39.1780385864115;
        Tue, 02 Jun 2026 00:37:44 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:37:15 +0200
Subject: [PATCH 4/9] tools: gpionotify: use the parse_config() return value
 to advance argv
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-pre-2-3-fixes-v1-4-9432002bce8e@oss.qualcomm.com>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rTMtiUsVGafOOADmMTIGkan4MldnkC6WhWHfchI589M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHog6NULw6nHT4rIEUykAsYcP8OZerTh40OHKi
 jKZpmb7352JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6IOgAKCRAFnS7L/zaE
 wy5pD/0foiTFmv8q9OUUPScXfFoDlM3gDNdW/3CP0bD6D52xi6u2RytEa4NCY9ZtHvPk5p5pszK
 gKk62g5oMySj5sTktenbkYB1/y6p8znnKLHrTcUzDajnD/Ci1I9+c9udgrcUGChlawXNIujY0io
 Ew3Dih+Lgsy7P64CXx2edSJEITW03Aizq+xgW7UQcQqu7+hoxJz0R7N/GfUY3eac5kECzDQU6Hf
 i4a4p3zDxcy3dJuhBTZF2yJS+OdyxUXmC15PnSsGUG9GqgdByfv3eteNUtrchQdbxMypuhjy8Bv
 fRRO32AyWemc0XTG1qjT66fRASlDRV7VfPEyGFBiYrvsFUg/p5CnMr1GVdp8agzCtgAnBoNFGmY
 3dQ+FTbZMS+uEnAapzxtC+WGX9UJIqi6KvoHwIMRztQTOEAzmXCMVAXdbesvhS0O83zB86Hef1a
 0/jdOEeiVEi4DVOocwzfhizHeUk3TEKTPqzjgGSRQGZLul9+U7g9LO755ikBVyzd7bdHKywbLMS
 dO3/2nzy/dJDW1jdqPRxTNbG9QVcaEzBijc4077grFJYYWXlRVeDWcfZHNOCr+dVwrmDVjjNjf9
 BinilPE0WEKr0zx4kNjkdgn/YXRmsPYQM9ukICQ17Nv5gslw6peU8gurSSe1W2VHcfsZQ5ztN8F
 SXxwFW2v3DpDZNw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1e8849 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ou9Cb6IWRw3oyDx7vFEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: SThtqUt5JIeGOegEZdW-rBWut40_bWM7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX3V7sUIVJprVv
 Zq3Ozt4xxJfysGPDyf4eE76t6PHyAhKU4z8dmEg6vdBxnD93NrCrN7jX7IObjZM4vMvndqgwKuW
 vq5nftRGZerYUr9OFUO173iYNWA7O0AFEeHyf7Rgj+1n1LvtcswFNRVvyvO1XcUNX0bMfW1Jz0H
 FOyBgdvwudoLMUpha8wPZKdAemqPR05NUHyWO9j+q13krJedGtE8zM2TKFHZ+vESED9jbv2F2Bk
 P06WQqdFIzX4KfTVwQQXvN+blg7LpLLZGRsgPWQ1NrW+kTyi7RntTvvDHuRP5UpRMRIeKrlFc0y
 rzfmNdTLPrGiEGVwS7A7ITbwVVGkFfy3k/Y7KmdUmuRM1xl/oR6dOZ5/uic80O5xtqOgD7tnc5I
 wBGodrFNdtL9yX3r4XY+vSBerSXPkecXYw3RvukaJ5YfcWgAtLYnpXOJ/J4nfy2GyApF0Ax6xSR
 Pr7BKb1zIZ0IywNI11A==
X-Proofpoint-ORIG-GUID: SThtqUt5JIeGOegEZdW-rBWut40_bWM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37785-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E062629D42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Every other tool (gpioinfo, gpiomon, gpioset …) uses the value returned
by parse_config() to advance argc/argv past the parsed options:

    i = parse_config(argc, argv, &cfg);
    argc -= i;
    argv += i;

gpionotify was directly using the global optind variable instead of i,
which is equivalent today because parse_config() returns optind, but is
inconsistent and would silently break if the function were ever changed
to return something else.

Assisted-by: Claude Sonnet 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpionotify.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index c45daf1e5f0ffbf24e331eb2633d3a54048af0f1..a45685f22ff73b1e138ddcd662f35fc8df5c0755 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -383,8 +383,8 @@ int main(int argc, char **argv)
 
 	set_prog_name(argv[0]);
 	i = parse_config(argc, argv, &cfg);
-	argc -= optind;
-	argv += optind;
+	argc -= i;
+	argv += i;
 
 	if (argc < 1)
 		die("at least one GPIO line must be specified");

-- 
2.47.3


