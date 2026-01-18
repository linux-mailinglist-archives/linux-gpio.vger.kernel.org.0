Return-Path: <linux-gpio+bounces-30703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581BD398D6
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 19:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E42193009486
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 18:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A01302149;
	Sun, 18 Jan 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXHpX1m8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/g0n5jd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0642F301486
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759816; cv=none; b=tw7PGkuUn3jxYZAMZmXODUWrA9Ejhyl37U/hTV4k1aN9BK6126sHrCAhwiFj1ZEbI1NJaKi5g3mbJ+v8DOY3cuG4p5IKxv59wvE2nw8wjfzbmI4d08andOT0YFXBLGImI/8sQHQOSQX0IWy4PQ/3287hsWpHHV4wfRtzbnwtGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759816; c=relaxed/simple;
	bh=Y+FQmd4rABqYPyTPKLcnkK9CTadziXSgsQ+69hWhimA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scMO6rWkRka19wb604GrJ/kNgB4i4vToRY+1SSnu+HTQ6Ba5b0zZ/exKVJVkXh8eSzirYJVBwvcZJVVA6m/QOGHhyFIJjc56A3vl8k4tqz6gkdHIcte9qpmD6Ru4M1OtKYRg+sYKFG9YRG6VfaSevub0NealF8agg9NsDzun7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXHpX1m8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/g0n5jd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IAT3Ds2999637
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=; b=KXHpX1m8m3rn36Jg
	XAOXwYt+u9K3TjPostd/Ga+OJGx79TdYs516hJ7Uuj1DP0pic1AGnEgszDSbZwne
	PlDfhwKpRxALzLVi9/aOTpk6UditMnDm/26xLFGDtbrHEDQ8D8GdH0lLQR4Svsqo
	pnP7iEh9mMwx8zLBM9tlTFKD5OpkE0j97kbRdyVpYBq944m/m/NN6wbfgx+b0Do/
	6FHtL3IJp+oK9lZqxZHck0q7vU3B3O9QpoRqSvP9CfcaD0RXSV07ytsg3tCUjcGe
	ow5J9jBBcx1u5RbtkPZs81+1yN/7xDoG6TjVaRHXngafujCzRFemL8NSl76wwWQ1
	/MK8Jw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36darrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b4058909so290608285a.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 10:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759813; x=1769364613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=J/g0n5jdcQUE+owZWh8f0ixZsjjcFKEsrEthDALT4qXVuN3bincC2HIMpfkrZMTh4E
         F6ZYpHGe8gTtE/Cz+ruiDswdlq+5LK3WnfP+hzz7bRWsorLUt5BT3iQCyXJ46zkhv9xR
         44DcoFGfia5Gbof1i9J+JR/iTxyV2InAXy+73yzc86wjbRK5R41uIJctk4qPjWs22G3Q
         Udn+GfIxXvN173Dphws/rnHA/rRqw0T6IpPSVMHKMrTXKvf1bi7QWfnHP7neIp2spl4E
         QQt446WxZ6eANJt4nSwfHqX+Bi6axkGjvO9yYm7zMat3mJT4McKQOCnzrVbXA8cfJBT5
         E5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759813; x=1769364613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=WnJgcnH3Fysx/+X1Z7bhUkz3V0qUR7CXAieF0IqMS4eA7hnLbgC5CXdtKq7ia1yQkA
         A/0Vuq+5Crw5aJQa58mHrXbtlFEaDqBR2bc2tCtXWYipPO5A6ndvdwZyKkC0Tg2c/i/o
         Jf9Z3Oc1ya9Ttc+cM/tpbrHELTmAoQSfDwWS9nfB5MlVkDYrkqY/yj3iX4+G3lli2ydB
         roqM8AhRMOir0bs70UjMIK4P513i+eN+4/CaysRDxmbLXCEKGDWV6x7m7PQWymbyilNB
         aofuX1PH12ADJQBYCelCruWRJnX2jqNaVJIPCbl/gyyWabrGGnzp/wiBtWpcBLwh23Jn
         C94A==
X-Forwarded-Encrypted: i=1; AJvYcCUNSOI6ag9qLpp+51XfdcayOwpkom9ShJss1r7ChX6DjJx4S19UvrWb4liKdv/WvNUNdtYpSZEcHamV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+AYErcaf8da4aMvcX7D/I8Z3Omwf1U9eFceVAU5C1hN5vkpQy
	J9VdhCvN9nvjq7UtFv/7Nd7ALkzN8HioUa2ooL8PRz447gasqEWLQ+sg6wm9ssf9sG443TI3peK
	d0ykNkhLeUs46LN2SwDorK2S2EgEneRpIWppp/9BViLaBCWSAIshbIonwO6J2qvy6
X-Gm-Gg: AY/fxX4FjyqartIKhDvM0+DlRT8SDaRTEGy4ejWRVCKrtyCfNXM2gdYckephd9ZPAdh
	mfqo6A5cSw8/BVuddF23JJT5Geqhonj96MKgLBjliXf3vfkNvlkqepSB07UKtR7N+8IApzPl3J0
	KC7LIFLJxOAyb3c5qs3YGSAa3VCwpdDBAaFsOOsTnf5pwMMeVO91NUOs2id8R1raJLoytoSZRhN
	xUuctYQqBCP2fBuopSw/xWM4ZXSSnwmH8Vj/fJ5Yda4OK+WCNme4tbnzhivuN51HjzaDUR8CTqD
	T3wlcNuuOb2Gz16syD/aAtVS+ODJXbnmh4dlVElgMbkazUNui5vwEHTEIPDqYgGL82AtVjtx6bT
	O/5FNaMA6FEXYb6FnvQFUbp3tgbrYPbiCkg==
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1223536685a.66.1768759813353;
        Sun, 18 Jan 2026 10:10:13 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1223533585a.66.1768759812755;
        Sun, 18 Jan 2026 10:10:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:28 +0100
Subject: [PATCH v2 05/11] pinctrl: aw9523: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-5-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4481;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y+FQmd4rABqYPyTPKLcnkK9CTadziXSgsQ+69hWhimA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHyayuoBeIp9CFs/To0KGzg5wtCKMQchY4rd
 ZTVsgBVTRyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8gAKCRDBN2bmhouD
 18jKD/0Q73dFNHHnrM5068MUNMPnIOmN7objobVATcjCxeNYoQiN8W7ivD4SWKVqA/DdX1R5St3
 0/tCDBGqXO12+uj40UIZE4ljdgKCD+fsn+WSOyeGFeJIxnFDyd8A6kCV+M957Av09NHGOuZzCz1
 n84LPH3ZRBC3uEP8gG7lVsIgTJ7Wd71Udx4I6Tf07bk7F2r+44NHCHKRtu55X8WAjRvLmynm86Z
 YOKnbZ2UCIUPJ62n3gMymM0/Ir+JkYjini6adzG92nXecsMf8J7ulbe3ZCqT5uJ5jTnZRR3KKGb
 psXi0oNg+Osb0wrW5nqR6O2Im3Oqs44dXVV3i/kbow6pNJeKSmmU5W+l68bvNbT281ghjvLIslY
 vvnRwxod3eZUawpDeP6T//3MNuKK2Gg8x9Lq9ey+ddE7nCFUTBA3ypX1ErFjwFg0DHDk12c8WII
 gi08BdhYaU8LtIxZzranwWhmvK3EgkrmYF+5lIoiIaY0e8XcmSW8WsiZCwrGUt/cBly3O7IY92Y
 FNoDXLaqmlFiFgTiMN2tVA1DpqquhFr/7fQp130j1BwOiRjF1OVqoVodqNKRPARHoBOIEmZMpIC
 PcI+/h6wyzJPyYXnC1UAQaCuoEGdkdUU7RcbXCWBfUmrFfqNlwHm1DgkCLMLdyMmi3GmnFcSM1m
 fHjfP614CxYOwQA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE2MCBTYWx0ZWRfX1Bxyuj2Q9fcg
 xuLFaNbGdzVxqKDcdaH3GLcHJ++SkWbJcn1+1i/PJtI2xw7FNfB366YwopygDHVoXUnKBYMxDVz
 HlEsahg1wJbs5/JDbGmqBv1ikBrrim+Y1VBley7MRWm4i6Sg6loOrPPCHnzTg8Yify7DgVrsXkV
 mQp3xsqRK96w0Bpxi+4y9MDM9XzDwPMJhbefEQ3ZQz15z4mureASbosatBPgduPT4DoDlAm12JJ
 wELB41STzwuS4cYl2jArNN026sL4DNKs6vdevkq33kDbvpgLyusTt9cg8iOpI30wZ/FI1S0vF4m
 hlgErxd2RDaBPFgJrLHzbczlPjA2excWV+D6p8dxY+UCK3GYiWXv7Yrp3GFTok15OkV6TKdd9xq
 /h0N81Z/5OCM/yu0OnYNuF21GMIp0LEHMIdw1lFbHC59Ggqcm5BacjbRPHb3BQ4FuTZz+5zUkhZ
 ey9V5VpqtwM90HeLEzQ==
X-Proofpoint-GUID: SJOXuydd4JnZ0g5G0SHtXWRytoL7osoZ
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696d2206 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sJPWbbE6un6nfY-uGV8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: SJOXuydd4JnZ0g5G0SHtXWRytoL7osoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180160

Simplify error handling (less gotos) over locks with guard() which also
removes possibility (at least by reading the code) of returning
uninitialized rc/ret value in aw9523_pconf_set() and
aw9523_gpio_get_multiple() functions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 53 +++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 479553a79216..02a24ac87ea4 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -291,14 +291,14 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned int mask, val;
 	int i, rc;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
 
 		rc = aw9523_pcfg_param_to_reg(param, pin, &reg);
 		if (rc)
-			goto end;
+			return rc;
 
 		switch (param) {
 		case PIN_CONFIG_LEVEL:
@@ -307,7 +307,7 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 						AW9523_REG_CONF_STATE(pin),
 						BIT(regbit), 0);
 			if (rc)
-				goto end;
+				return rc;
 
 			/* Then, fall through to config output level */
 			fallthrough;
@@ -323,10 +323,9 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 			/* Open-Drain is supported only on port 0 */
-			if (pin >= AW9523_PINS_PER_PORT) {
-				rc = -ENOTSUPP;
-				goto end;
-			}
+			if (pin >= AW9523_PINS_PER_PORT)
+				return -ENOTSUPP;
+
 			mask = AW9523_GCR_GPOMD_MASK;
 			val = 0;
 			break;
@@ -341,17 +340,15 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			val = AW9523_GCR_GPOMD_MASK;
 			break;
 		default:
-			rc = -ENOTSUPP;
-			goto end;
+			return -ENOTSUPP;
 		}
 
 		rc = regmap_update_bits(awi->regmap, reg, mask, val);
 		if (rc)
-			goto end;
+			return rc;
 	}
-end:
-	mutex_unlock(&awi->i2c_lock);
-	return rc;
+
+	return 0;
 }
 
 static const struct pinconf_ops aw9523_pinconf_ops = {
@@ -599,14 +596,14 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 	u8 m, state = 0;
 	int ret;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 
 	/* Port 0 (gpio 0-7) */
 	m = *mask;
 	if (m) {
 		ret = _aw9523_gpio_get_multiple(awi, 0, &state, m);
 		if (ret)
-			goto out;
+			return ret;
 	}
 	*bits = state;
 
@@ -616,13 +613,12 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 		ret = _aw9523_gpio_get_multiple(awi, AW9523_PINS_PER_PORT,
 						&state, m);
 		if (ret)
-			goto out;
+			return ret;
 
 		*bits |= (state << 8);
 	}
-out:
-	mutex_unlock(&awi->i2c_lock);
-	return ret;
+
+	return 0;
 }
 
 static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
@@ -632,30 +628,28 @@ static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
 	struct aw9523 *awi = gpiochip_get_data(chip);
 	u8 mask_lo, mask_hi, bits_lo, bits_hi;
 	unsigned int reg;
-	int ret = 0;
+	int ret;
 
 	mask_lo = *mask;
 	mask_hi = *mask >> 8;
 	bits_lo = *bits;
 	bits_hi = *bits >> 8;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	if (mask_hi) {
 		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
 		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
 		if (ret)
-			goto out;
+			return ret;
 	}
 	if (mask_lo) {
 		reg = AW9523_REG_OUT_STATE(0);
 		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
-out:
-	mutex_unlock(&awi->i2c_lock);
-	return ret;
+	return 0;
 }
 
 static int aw9523_gpio_set(struct gpio_chip *chip, unsigned int offset,
@@ -695,16 +689,15 @@ static int aw9523_direction_output(struct gpio_chip *chip,
 	u8 regbit = offset % AW9523_PINS_PER_PORT;
 	int ret;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	ret = regmap_update_bits(awi->regmap, AW9523_REG_OUT_STATE(offset),
 				 BIT(regbit), value ? BIT(regbit) : 0);
 	if (ret)
-		goto end;
+		return ret;
 
 	ret = regmap_update_bits(awi->regmap, AW9523_REG_CONF_STATE(offset),
 				 BIT(regbit), 0);
-end:
-	mutex_unlock(&awi->i2c_lock);
+
 	return ret;
 }
 

-- 
2.51.0


