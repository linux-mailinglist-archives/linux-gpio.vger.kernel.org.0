Return-Path: <linux-gpio+bounces-28952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D66C78F1E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 13:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0CB0634F6A1
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCA734C155;
	Fri, 21 Nov 2025 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="f54CLiM6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9931345CBE;
	Fri, 21 Nov 2025 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763726939; cv=none; b=mkJ9BpbA6G5W4aqyP912IrVneQaD53w0l2CVm/Z4Xsv/VLswOfNOxToeQj/V6R4PoeCYR6Fb3hpHZaBKWoKE1RGTwC2/bi6eLyOMrrtR2vm5/NCr8AVxVxodRXbR3DFWcFFPeMTfqDQpOGcQJ1A4s62w0UAKavfy4ZYsgjo/Ej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763726939; c=relaxed/simple;
	bh=rMdxlFdwhxUiWoBEuHJmDjkN+Nnm/3lMpnZDL0p3pzk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RjdBaREvZCAina12sY1nRAeV5zg72hLIVamgMgJQlU3bqAm+ZTRlawnW+3f/ZzBiF3dN/Go0KtImJgZXqZg+nS1sZJFTJlyjtuDe2nEmFWjVx7Du76ucOqEoD/PjpXMId5F85/sL4uv9NZrGyP0HC95YKlDe1THDC+jGTGse3Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=f54CLiM6; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8RjM63386539;
	Fri, 21 Nov 2025 07:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=9pveV
	SK70A6T3VWCvPsIEAUzUIAWvrxcBA5E70tSrIw=; b=f54CLiM6S2RaKRGROjhSn
	m/+pwk1Dire/xzulEo7uJ0FVCq4/P6HO+eLwSIFxmNH2TYbi+raYENeexMrnIW5a
	7wKuTYowuzErAzGeeMjYnlInS2GL498phQRTF7Gr8UQs2XXUu6UpxqVIPG01RFgs
	u+6O3xbL5+c+n6vNrko6JSmCFo4xB6cAVuMMgnptDuapbGQcKypy44lTyVqbaXke
	Vh7PXFtItdmsAMHunWUP7ZvnUEte/HjWEWkQpAkRxp9mD7H58T1fxsKOw9X96rls
	2jk9UtdivDXT84jU9ckczrCrbRbGc+H0yqmGK89alLUqG/PhW88a1O75lsA9DwQ6
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4ajmkf8uec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 07:08:48 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5ALC8l93022193
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Nov 2025 07:08:47 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 21 Nov
 2025 07:08:46 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 21 Nov 2025 07:08:46 -0500
Received: from Ubuntu.ad.analog.com (AMICLAUS-L01.ad.analog.com [10.48.65.187])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5ALC8G75001559;
	Fri, 21 Nov 2025 07:08:41 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Srinivas Kandagatla <srini@kernel.org>,
        Antoniu Miclaus
	<antoniu.miclaus@analog.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 2/2] mux: gpio: add support for ADG1712 quad SPST switch
Date: Fri, 21 Nov 2025 11:57:32 +0000
Message-ID: <20251121115750.20119-3-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121115750.20119-1-antoniu.miclaus@analog.com>
References: <20251121115750.20119-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=69205650 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gAnH3GRIAAAA:8
 a=_9JmMCc7Zck6k1b01VcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MSBTYWx0ZWRfX2meMkip9F9uV
 opGi3zHTKZfPWvqk5pwzH5NrippGznFVVQgHnzX6EYe653AVgSvm5KCtMr4nCkKSoDbPyCPXrnd
 qgrAbn2+k2qXhWYBc1kwX2hIo0yN5AT5XkuKgTnpMFOLIkaAt8C2e7U21u85HkCjchqvbDyBa+A
 ufMmhNX+e1cwQQ/IcRQYocSTmmT12qodJ+qFMxxzWyZ+6zMd6aR3rmz7rMrzHGNT8MssQvQn23G
 h5mbqmiWA3HxX0DgMUHqRKlbB2la3S8Ht5efaTh/hGCCt+EyC0zGJZzNJkWVLJ0mwoFmTnPHotK
 kpBWRiSSa+tiMjwYq0DzLRclGQAvWlSz39f4M9MKOKKshM7cCLhkyBgWRA8hGruTqhGbtlQn1Tr
 zx2nR3ogMM6dKy5Xe/+9aHMdL46M+A==
X-Proofpoint-ORIG-GUID: uLGDQA8w6vBVi6t6RROigVcwRpwTdMCk
X-Proofpoint-GUID: uLGDQA8w6vBVi6t6RROigVcwRpwTdMCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210091

Add support for the Analog Devices ADG1712 quad single-pole/
single-throw (SPST) switch to the existing GPIO multiplexer driver.

The existing gpio-mux driver architecture handles this properly.
The mux state (0-15) represents all possible combinations of the four
independent switches.

State mapping examples:
- State 0 (0000): All switches OFF
- State 5 (0101): SW1=ON, SW2=OFF, SW3=ON, SW4=OFF
- State 15 (1111): All switches ON

This integration allows ADG1712 to leverage the existing mux framework
for switch control while reusing all existing gpio-mux infrastructure
without any code changes beyond adding the compatible string.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
 drivers/mux/gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index 4cc3202c58f3..b363ad5a605b 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -40,6 +40,7 @@ static const struct mux_control_ops mux_gpio_ops = {
 
 static const struct of_device_id mux_gpio_dt_ids[] = {
 	{ .compatible = "gpio-mux", },
+	{ .compatible = "adi,adg1712", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mux_gpio_dt_ids);
-- 
2.43.0


