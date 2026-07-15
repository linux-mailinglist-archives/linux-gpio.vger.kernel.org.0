Return-Path: <linux-gpio+bounces-40128-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id smw3JcOJV2osWgAAu9opvQ
	(envelope-from <linux-gpio+bounces-40128-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:23:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8D775EA29
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:23:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bLFRTs1z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iHONRA0P;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40128-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40128-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 422813022DAF
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36A1436BC0;
	Wed, 15 Jul 2026 13:22:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E26744C645
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:22:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121741; cv=none; b=J+CkkEk37bD+zQwHTp20Bg++r4dFHN046GM36BcXcdCwIugkVbsMBpatFvtknwNFlWoUReJndmVFb3/cn01S80G8o3rxmkF/NGt3o0+HJzYCDBeGT31l4xluR4K7+wRneuvrgej0rFaBj+ns8QJpUSGkHXaepwWJPrIlwaxiqpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121741; c=relaxed/simple;
	bh=qs6ppqp0UOUiNfmIFg/KcxO7swqckHjrNOVvOglkL5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BRd+h6im2/MCtruH9DcL5L2bgpKUoHGDOAJ8jot8MjdgsPBmC2UNmVfrazAcE6xdObndtP8Dr4ih5QvbyByDbfBxLA6wxrYX7dq5w1jXyb73ezO41W8UwfAWa7kA+ib/gr+hc6HSWRLnyP3Ryl8fi6iPCXiZ8nqHPvJJ1A9PzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLFRTs1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHONRA0P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdRAp3697847
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=42z1nSf/EWm
	6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=; b=bLFRTs1zQH9xjqgSGE03JBCRFNH
	pw4jEVYdz7yeLbmp5LuuSX5u42fusQ153cuAV1DkIcGNRbizRlmuRXSoQIeS19vl
	DqLL/C0k2jx37gfWirJEr0HtarSqqc8s4YkCTlfy+A1rPgQFYZgC3S7HCLb/yamq
	jikR1DVaF64iO7/KmUUFPTDk7Lsn0CUMi4gvUTYwWkHpT7Htk5xlpOzsMnksmO73
	V6uMyYmzhb7DAr2uyJ/Ej/f3/5SfkYIOJRxAs9j9/Cr1OK3xCo2V/vDiUeq3gQOM
	qhAq9wJTcUbpjqDwiaZJbgKhxf1ZeBvZ0WGMRjD/krNzPnbXddsWxsKCAyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vjfcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:22:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso40824091cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 06:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121738; x=1784726538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42z1nSf/EWm6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=;
        b=iHONRA0PUmrnLLNHhiZ5kp4Lm/b2+ZVO8CVVH5C32nVZUljUOTJm04uv4nPkDVZvTM
         gJ3s3XAgECZPKxEV/J6DjoY6+Q61kdWwln2MQ9zcrIylpw/bnvv20Z+0YWn6myw1IEcd
         lk/7JREyWyszSNOSvO2Fkb7npcqJ9LBKai2/PNFOjLUYpDmBbskOVXqSzxMg553XqUy/
         g5tcJiMA3ozSCF3NqEZiwXbUSEfv6gDVmQf4n8/GbFLEY3OhQOBzNE+Z8wy8KxisEay1
         HE5Q9fs+F+ZnfBeaWkRxi9pSol2CcYGeyxjonS9uYDT2eVTnglXUvq48NZPtTc+ZZvu6
         mpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121738; x=1784726538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=42z1nSf/EWm6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=;
        b=gyPPqmp8TGfHbBFY5nGpMghBiVNN4v2BLfSDRCFYoySnhWvHwK/bxpCBX3UXrla5pN
         sP8zUg7UiN+g37d5b/KtLNz96/qIYyCmHbVFX73szEeTPRybkTV2rD3ER00ZVrOhbW4o
         gSuFQyVfjFUjju/HirKDi625NdK8IfCiWOSk80BENveaZIK1/EsSg7+sDFxdmBEE/arJ
         0kX2r5Q0U0Xza5Qe5A+RkN4Zv5LbuImSj5vDkiDBcum1WWQzTePwPKPYQyYdjcvIm+t+
         AUTc+4ASvzNXbCcqLscKlrO7Lw85KmQ8JO68I+5YbY9VqhDgcBAnh46O26kDfWPjL7K9
         1oig==
X-Forwarded-Encrypted: i=1; AHgh+Rof+BiYZcVbAPRN03EnThH8KYak9RNDOwz/BK2Tk5bO+Xh/pF5feWIpb7Tb6maWqEiL3qZMciAHGIZb@vger.kernel.org
X-Gm-Message-State: AOJu0YzxsUxeKaaIOqZdFrI9uPeFah7S67vWPrvPE7SmbUrWrAOv4Iie
	SDyja//bnYcgrpSOkFELhlGW8lAzNDUkXCQuXDeuUbbxV/ZyaPQFEDqxjZPvdl/Acnrp7NKg0Up
	UfnNFV2bVIS7Go19+jjei0vYdNHB5ABhEChZcCS/VPsOSop2q+CMMf++EspLZjCG4
X-Gm-Gg: AfdE7cm/RyuHacnpJw3XG/kS5XsoPIZmqUz2KpJEnZcdQiHpayFwhwrA0KQVf86fpD5
	GXiwvZakKFd4jM9te5d3xiO15rIDv0/rxDWtt8HyhdG2beS7wvoqaXzTZzmE9mOfbqFiLOrkZDS
	+Lk7GqX+QZPeH/W3pb8wrItPljwCw7s/dWvJqjoZlTP4u/M2CkHbYvdqVuxJJ7HjoxpzHrdRWif
	hbkNlcc5JBmOtEPyzGQu0IY8RX8iw8QWX3VZ3T6ybbZrKMFjcBq6ThBUATvicTqdaTBq9+fiGdT
	otIz2ot5ndZB7PVlqA+hh9PebX8aYS+W7VzloyQ4X6TgFV7E01lwhnX8/TbHQhorjpERsfdBZ2e
	Aq72hJqdmXU71M/WUoR7KpoKXHaLTxq+9CLPqraa3
X-Received: by 2002:ac8:5f4d:0:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51cbf2ee7a4mr187163701cf.61.1784121738152;
        Wed, 15 Jul 2026 06:22:18 -0700 (PDT)
X-Received: by 2002:ac8:5f4d:0:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51cbf2ee7a4mr187163051cf.61.1784121737458;
        Wed, 15 Jul 2026 06:22:17 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm192874866d6.16.2026.07.15.06.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:16 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
Date: Wed, 15 Jul 2026 18:51:50 +0530
Message-Id: <20260715132150.1322663-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
References: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a57898a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=a4EVYJI0Z6-OStE7xvQA:9 a=O8hF6Hzn-FEA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 83TLgUMpO-QLD_-K27fHvk8gWJNSQAku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX+b0t1Rpavr6a
 fsVFhxstSZk1SaQM+oE05sEX9dD70z9yvNnR7Rm7k3VV+4zwWv1PD/7iWHGQ+g6m/OF6abO1GSn
 xe796Dld8lPs4WHYFBIAPrAI2AirQSQuqk/mOUKzKpDu9kus5DDDpUEPeHm8RS7FzbilemZqUh4
 2DseWv/R5bEPx7fpTJSoQl2dPWLeiVZ8HfGsu27K3D6qQ26GXFHXFqVfWcIWJTzF248ANeKDl4/
 Ypskyjx7uGeviU41yP0EiXmpRxhNfYeBZsgub3lEQOx6nU4ru+An8oy1BH3qo9Y44qNzypQ+AW3
 etqoqcg8eJmlCuHtA4v/1+3+dLenmV8ZXDT1/GUPr3ml5AiFhP9l4WbDbFQZyl8CQby8Wa7Nxl1
 NumJfYbH3Zzqr9uwAy2VbbcsfFGMzjsoTaWI4xUaiBU4KW2Gj4l0XWYN6fAwqDLLHJgCfBMracp
 blviwEY7NnIw7HPk4Gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX+NIinBoIKYOy
 sdAnfia4a5ZaI7wwmSQZqfXjpdVpjIvX7qTccxsarATjQ4SvhaA04is5/f8O5yRwJrwGchzpmDU
 Z4WrOK2aRfyt99dxA54X10O/Xm3PDGs=
X-Proofpoint-GUID: 83TLgUMpO-QLD_-K27fHvk8gWJNSQAku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150132
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40128-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B8D775EA29
X-Rspamd-Action: no action

Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
slew rate control is in the same GPIO config register rather than a
separate register. Add a new variant data struct with updated slew
offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
pin descriptors and function table from Milos.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index 72b8ffd97860..cb4934cd6f75 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -148,6 +148,33 @@ static const struct lpi_pingroup milos_groups[] = {
 	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
 };
 
+static const struct lpi_pingroup eliza_groups[] = {
+	LPI_PINGROUP(0, 11, swr_tx_clk, i2s0_clk, _, _),
+	LPI_PINGROUP(1, 11, swr_tx_data, i2s0_ws, _, _),
+	LPI_PINGROUP(2, 11, swr_tx_data, i2s0_data, _, _),
+	LPI_PINGROUP(3, 11, swr_rx_clk, i2s0_data, _, _),
+	LPI_PINGROUP(4, 11, swr_rx_data, i2s0_data, _, _),
+	LPI_PINGROUP(5, 11, swr_rx_data, ext_mclk1_c, i2s0_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 11, wsa_swr_clk, i2s2_clk, _, _),
+	LPI_PINGROUP(11, 11, wsa_swr_data, i2s2_ws, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, ext_mclk1_a, _),
+	LPI_PINGROUP(14, 11, swr_tx_data, ext_mclk1_d, _, _),
+	/* gpio15 - gpio18 do not really exist */
+	LPI_PINGROUP(15, 11, _, _, _, _),
+	LPI_PINGROUP(16, 11, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, i2s3_clk, slimbus_clk, qca_swr_clk, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, i2s3_ws, slimbus_data, qca_swr_data, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, i2s3_data, dmic4_clk, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
+};
+
 static const struct lpi_function milos_functions[] = {
 	LPI_FUNCTION(gpio),
 	LPI_FUNCTION(dmic1_clk),
@@ -196,8 +223,21 @@ static const struct lpi_pinctrl_variant_data milos_lpi_data = {
 	.nfunctions = ARRAY_SIZE(milos_functions),
 };
 
+static const struct lpi_pinctrl_variant_data eliza_lpi_data = {
+	.pins = milos_lpi_pins,
+	.npins = ARRAY_SIZE(milos_lpi_pins),
+	.groups = eliza_groups,
+	.ngroups = ARRAY_SIZE(eliza_groups),
+	.functions = milos_functions,
+	.nfunctions = ARRAY_SIZE(milos_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+};
+
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
+		.compatible = "qcom,eliza-lpass-lpi-pinctrl",
+		.data = &eliza_lpi_data,
+	}, {
 		.compatible = "qcom,milos-lpass-lpi-pinctrl",
 		.data = &milos_lpi_data,
 	},
-- 
2.34.1


