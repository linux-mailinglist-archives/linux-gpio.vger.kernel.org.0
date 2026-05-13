Return-Path: <linux-gpio+bounces-36777-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKDrDimyBGoQNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36777-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:17:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF59E537DD9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6FC53003407
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8B348C8A5;
	Wed, 13 May 2026 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQxQq+og";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxSTIzqY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30D63FFAB9
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692630; cv=none; b=XBZdJsFTmCNOXqlYxri2E+klvBKUzPjxoxFSiNLatUNCXitsVpSWoOSFE9HRA5ghVrQYq0YpgMJbya/UbBFx9hL1IvYvPAVmpZXb35l1wYDzrB5U4Q875XPDU4dYPNLU9mD2+hxAQeJpoWXutxNCS8n2uKM7BRcFT/6f7LHw7iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692630; c=relaxed/simple;
	bh=IWeomyOh1Ae5xTrTn3KT0pUIoKGaJ6fwTgGzVci0FIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrU9croDYzC/oWIVKPe/aPOp/115lQdReXm+rq8oS806d2PjoJE57EsE3R8wOcbxfyI7TCV2mpDOUyXsciVfEY6z48bTPQ1wZKwVcckjbdz3DzxB+UpmigV6WA4e7m+yebCdpmzZUSsDT44G7woL2sv1ge5QP5f4Z75rBRAEZFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQxQq+og; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxSTIzqY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF9EGx4159821
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=; b=fQxQq+ogkG0kthGh
	83i0eWPeE8JdizI4q8NsjOSv25cMCXMfjG9C8NIJem68Z34SEDrIgMZ+AGG6OSjl
	DgFFyOYmxWP1JJDx/TXLFlXQDc58BkOsHdeIMoNnhWGkrkNz/IAS8RzCsELMMq0J
	jGoKWs6nCVaamf6Aj4YKX0puFEnbGpLmeI8cbdg9meGFixdKckeOnBm4/YRpNGjW
	3XSyf98t4OIxbgi3D1B0/8psNXix6XDNN7w7Eo3nYiKwGu1ZM0GtNB00r/KYGYOg
	NW903jrcHRD95MEMQCcBK2GoA1BKk/xtzxDFVYp4GQFp7pxOgL0xZpHlkblMopRi
	jlIS1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91t08q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so1240598eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692622; x=1779297422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=;
        b=CxSTIzqYAker85rLxqf/ZJJtEBkCrNVKcu1A/mojRmrK5mGJ9wcW2DW1avTQzgni+t
         J7GOX/DNsPbO+i7Vggj9Z1BShTQqNLN/UQZXq+Tr5S4MSY1XtkieDOEj5qm0BUE5+jI1
         b7mqW9lcOWk9n8N4W+o7TUxvR/Y9vyswnxREYdc+UY2wsfALW55V3tYk4ADGeZWf2STY
         +3224PI+f7+viekHt8v2xJh8xbBPa+eYA0qk/CtGm4ANCu/0r2GY9jnf22gR/Bjd4D3g
         BDWlcYrsRl8mH8kG8bmCV80wLAr5wqUda0X2KwdcIkb7kdiaK2lPFDcQUEY2o2k3PMhx
         bH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692622; x=1779297422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=;
        b=UKDSGcQe4C0jl/hzOOHayFOM9+jpA8wIyB2yFVLv5M6oCoC7CirHNJEMNP15Z7GUKK
         7JuIC6EvLQ8gjsP9ldqPbSKocvNRR03cluQNfpqPCzIMpmqwnhwpPxX3Wd4ppcDmKm/W
         ozIrtkJ29yAg3+U31q/Zt4kU+yW5wAcmxEe/7DxfkzTeEY3+nHEY0NnvlH2tLcbM4ifk
         m+eQbA790Io/e6pjtxRj0NRnTf+KsN5UMiC/fP41fdTvucoAXj33/80D8wBcOKrEfBWn
         QS1B5cEcrL+eaUudGPZpkq0G4/7AIqRs0PvlpSxYDZax/txsPnhw0Xa92Sn4ELraBs60
         kcvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eMM/qHWQp2SpiXYE9u+6vfpE5xVCNXpqriAAd08HJ0xd5IGWyDQ7duAMzkFUhKibcn8nRLUBVUQao@vger.kernel.org
X-Gm-Message-State: AOJu0Yx02aU1Xl01rjs+50fRp0488KV6edLLergBOzsoirmHGW8d6DS2
	OGNylWMmZwfDg9i2rqNfAE4GESWUkooQL3HpzwUUY0fTq1byxTKBPMNFQaDkPFPyNCY7DP/8vQL
	662eUU7OQr2Y6kw5VhTPIEDEl+IQSDKrIjj/u/eVOkZQXdXxdiZkpnrkr/c0xB6vl
X-Gm-Gg: Acq92OGK4BEEpEYAYv3oryHV9rn/RUqCDknXSo9x/QcAES19AmzpNqkyXX5mhZMA8OR
	YCTCOhbDPH0gwcqBcRjva7RA1jJu7VPvStIhxJwaO3aKyOMMOfYHD+kfbLhZmWfKlZbXPK+qKta
	GD7onQX/t5tC2eRMyxc7HRvwbZLTrhtxuIevKFqnKTHTnkMMlouNwunSG7XeH6bDdoe/zHhktIE
	hzs5SrUnyw552SkoaLmhvmtQ9uanuJyjgIHTTjVuxWlgbfr+DuwiOKADB+Vltd5IePO/YI7nQ+2
	Ij8cJG5+CZWPjedqVLN7ecpNPHdBzfJH46OHkks56wBSnOlFAZwDKX5VRuAFQvlwGzLWyCaluq9
	6LJb+CsUhKXnopDN4wH9hmStDFc30C+oZ5jxjIzZIJA1afjGyOtdZiTqfQZkUK5xioAnqNII=
X-Received: by 2002:a05:7300:a146:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3011708531cmr2740292eec.3.1778692621970;
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
X-Received: by 2002:a05:7300:a146:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3011708531cmr2740240eec.3.1778692621289;
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:54 -0700
Subject: [PATCH v2 1/5] powercap: arm_scmi_powercap: Log number of powercap
 domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-1-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=941;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=IWeomyOh1Ae5xTrTn3KT0pUIoKGaJ6fwTgGzVci0FIE=;
 b=eYcVU7i936b/87IEJANq3Fe77/zHJ+AvzRNx5TeCA/mVoSm099367r2A/+6SswcY3A1YG+/rf
 uHQ/wReFD31CuchIdzYXXVih9AwybSWgz42qZ6LDlL0I/3GrPN1/A04
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-ORIG-GUID: hV_AgJdZ_ndk_2GZAeHhnscSFaBrneIx
X-Proofpoint-GUID: hV_AgJdZ_ndk_2GZAeHhnscSFaBrneIx
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04b20e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Bjf1dfg4zo7KOAcPRCoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX6I4iQeJIgpwu
 YRKGoTi8mTuNKGfzdNtXQAk20/3qT65rF6fwscyXVkS/xF17/DYpHQf845szdRyrdUrKrOYJgny
 zKUGE3QnFx+v1E+wWDjlVpv1spoJqVmPzT7G0a0miK7jxdOrKhsjai1qyS1sQKJ5jcvgN9kzjqx
 MM7IlLXvXFysI+Gj8U6CBXAxX+KcYLmyJ5KmP9UMJlQSeXctFHG+Wmb5TsE36iptf7gIfWWDLFK
 Y7MWU7bYij4Klxg7cJ6Btvx2W9WtCW1arl8d4nm7BbwIbrWOZW0p8WcbZ2S74l0l5m5d7IN32vw
 0tdJ86iuClOv2/JQJNB0obkhOwo59gYI7B9pCoTJQPblg6OvJoOerZ0pwXIslQsfBQ/piL0Z+Bv
 kQYfuS5QSrxE5Ak9gZA4i2zJvCHwZgVup36VrMxJjZM15imHtZ9BRQ/gm2Bi2usursTsYbZT56f
 gDGFUbH1D1/3wOpSrcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130174
X-Rspamd-Queue-Id: DF59E537DD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36777-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SCMI powercap driver does not currently report how many powercap
domains were discovered from firmware during probe. This makes it harder
to confirm the firmware exposed powercap resources during debugging.

Log the powercap domain count after a successful probe, aligning the
driver with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..3efe3743cce0 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -496,6 +496,7 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		return ret;
 
 	dev_set_drvdata(dev, pr);
+	dev_dbg(dev, "Initialized %d powercap domains\n", pr->num_zones);
 
 	return ret;
 }

-- 
2.43.0


