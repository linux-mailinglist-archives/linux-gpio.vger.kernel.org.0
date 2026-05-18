Return-Path: <linux-gpio+bounces-37044-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLSKG8ziCmo29AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37044-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:58:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C269456A2E4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAAD930534D9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A250E33D6EA;
	Mon, 18 May 2026 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsRHDmNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvH7H96j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D13322C77
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098012; cv=none; b=IspIG+ykbuanz4C2OZDIJgDKGv2CxeZUnKImq2bQGzvzhGUODvTmXhAyoihWGg4jUMGacDYF9xMlSEtCKgHiayea505CJYHz2rX1YNr95Mi4GpjtNwWOc1+mj5irfUHnv+VZNZt+u21Z78H3IraVguScbBgRVWWC6sY/SFYIuio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098012; c=relaxed/simple;
	bh=kxKZ1nqTzkFz62724iS7w+blu1QL0gcppOYYoNdthKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5d5I82CMuW0TqvioGuxWrtnNr1rHd6/KvmxHWhUWkTBEzFT8jogmc2DmYmh8rU0q7jVBkbikyp7zW7XGgiEN3s/tHuknO9TESFYfJyAJMvoDUTvdFg1ktitGNvScNfjysBykx/jQpr6Zs8C/9miWBzowEk9WW1manOYlhN3RGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsRHDmNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvH7H96j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6xwhW642875
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvAhhh1Sto2U6bAQPALADkhZDFoCS6gm9L1yUcrT0tk=; b=GsRHDmNb3OGo/nTr
	9aD+pjo0liwfn8EMcvSX1/6pAMcKDaikOwIsozwLEHbyftUQf0rBkz1rBocW4vj/
	fl1bR8UVZYLXKMelE3OcS4/hRTA+Qrexe106eyryuzDGwOjnIWWtl8y3w3Gp6VgP
	XEFYdmInCwShZ7Qjd4HOjp58N7uYaiKSCmwSTgIE8Z7tMiNFTdejfGLqK/dOvhjy
	Vt/nuQk7h4nCwKIHkUQXaSS80hI2YJxe6N15M3ki57TCq1fkjgYJfkZcjboEqKrG
	q5/3EjBiE+308Dxm0W2K4PZJj6bqZS4cyefmoQXDFZrxDZ0bJYm7Ph8Q5IPxq3Q3
	ZCotgw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw5uan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf575af4so61358231cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 02:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779098009; x=1779702809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvAhhh1Sto2U6bAQPALADkhZDFoCS6gm9L1yUcrT0tk=;
        b=KvH7H96jkJeFqsQaI8QHyU2KOU8Q54wf7/RFnuRSlYVxwvqcAB6EF27RvdUtPfWMsV
         ZEEbEtD2DLeqZgQUeS7p1t06FSvMvYNJd0RNhKQ8pq5lD2igjsazHsmf7EKsAiJclhpT
         EGboNjoCR9IuzaLDQrXgzaAvKlsb+3qKBKrBUVdY44KBBIPsqbJQoGIq8O1+njjoY/KB
         XbgdzozsY6Mt1xuYiQBYqfyCUGbovt+KyMPco+pQF4lzYLJH6M90D2yDPnimztPBMUlL
         /RuCo3iPxYLnRST/Aw2/SDxHXT3x35/JPTCH4KnU+gkmjSlXaVVQp+9tTH4x192TF2m3
         CzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779098009; x=1779702809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SvAhhh1Sto2U6bAQPALADkhZDFoCS6gm9L1yUcrT0tk=;
        b=O9u6Og3dC3g//gOSwbL1U1VPPXjC8z76C6sGB9rNLPN143KFDXMYA2hKNpgvXEozbu
         FX3oNFNuHzckp1zksackin/poSt+xfzhMplRTljN52XdzAQlIx40fJvLpFNptpIYyGeH
         M8MrIbaAd8KWNbQq7t8GobsaRVJBQmwnp0DvMcqLTDIBqZdeIYfxSJlDiFXh4JPTtv3e
         048U8TBQmi5EkBUzlt7527V8mh/CWCdnBcVv2w+4bTV+jPOXcGZKsrGff0TXBszDwnJw
         y+Tfd91gLvGYxh7x86bW2Opnhvgdu+7lA+HsFWLzQqs8xsJM4Zlz3vT5qG9C5pe2k+fN
         fm+g==
X-Gm-Message-State: AOJu0YzSGLuq7L3HAgs2uSkRdFXvVfJwAmcBx8XKEi6ZhG7Rp40XzMR/
	+qLzlA3NkIbfsLfkxbo648KUvKosFjcrBOj0f7E2xzD6Sy8uBG7MvG/Rp9ZciSXwueDol9Imm55
	2+5P9Yus1DBqsoxr5mN7xqLkKqrhgaWlEPT/eT96RLXjJJGS5KqxQo19P2S6O2tek
X-Gm-Gg: Acq92OHn/SEoZy+/6qMZ8J4kx+jjmKzt10TljD0ulQx32kKWZbc1mp6PYQVtJjbDBzT
	6WA8g0UMyGA7xhu+3AeFdifjMEc1SnSZV2LhPOAJIM3dySP9/j+jIa9i2nJDeem570pszgd4WxZ
	bKN5Xff8mphojsFYgxniK8uAl67FYQGn04vrNTLhAd3+XDIDikWd0uxqkTKLw4YwWNXOKhIOkLj
	rEza207rcAmf1R7luEhVJxSCogm/DlJWiAKqoEtPzG1eTmqnYENyslEZMJKofVkUYawpJkxOEIf
	Xtk9+tXTYNgNltowxM4GiLitiasuf0Ylb3XJc4SRiX5MwWERPYdYBVE/hlgKSlBMSG2R3z2cmpH
	egoz+ALMAUCaxo2g6uq+N2Q+zFXhOzlm0WT7EXaaGnKHMZIgSITWZSdQrbFng
X-Received: by 2002:a05:622a:1b24:b0:50e:6054:b4 with SMTP id d75a77b69052e-5165a001a00mr190882521cf.7.1779098009509;
        Mon, 18 May 2026 02:53:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1b24:b0:50e:6054:b4 with SMTP id d75a77b69052e-5165a001a00mr190882351cf.7.1779098009090;
        Mon, 18 May 2026 02:53:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm35199301f8f.9.2026.05.18.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:53:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 11:53:17 +0200
Subject: [PATCH 1/3] gpio: sim: lock device when calling device_is_bound()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-gpio-dev-lock-v1-1-cc4736f3ff0b@oss.qualcomm.com>
References: <20260518-gpio-dev-lock-v1-0-cc4736f3ff0b@oss.qualcomm.com>
In-Reply-To: <20260518-gpio-dev-lock-v1-0-cc4736f3ff0b@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kxKZ1nqTzkFz62724iS7w+blu1QL0gcppOYYoNdthKE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCuGTJW95PpFF8Xhc7UgaJmCrH3D779PhgLu4t
 weLyaUVuGyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrhkwAKCRAFnS7L/zaE
 w5S5EACzFxPzqbXt+DaMuFnnshg1HD6mifBo2mHA66XUPu3dFKx57DK6WJ3LMTlVbEOpAnnZ8ai
 vfTOG4dEVHw0jwllREw58TsJ2LxJppl/gZeflEtHvfncC1X4YpCkhDwkrnAiODdhO/MKGy056FD
 VdBz86rdVdBLdKFnOGkHHt97GaRgwjISchb4PkJ5BBlzLsgJ6BohYyiIooZxLBw17pKNs6oxxfB
 4s5uUIMbAIZlS9Pp8lqjWC2mGaNa2n8AM+J1xtW0h9+esoyvMcKt4NYcA9qD222o4rWey1FnMVm
 +xLyw2R1kbb6sbK9M9FMTRIk3dqbh/Uj4STuWteCJDHCJxFsAx87D8HRduJFcgqsT3jJrLC3aXZ
 iCKJRZrtyqDjlRUaoQwaTLti6/pv499tLrJu1ZpgnKgHzmhXe/IH/JDKmEe9gVBd/ksHKSC9544
 CantQbjTF13NNuTofVE9ASxKYop3jBbu0AVe3CdFEdCK7xGWNcMQM49F2pH4X7DuG0N/qKecq+z
 aR0fepkjyLydgQZjuBCYHGC7/UnvfRvu/JNu2XdcnBYpGqDCeBrHnXQOgRoiHeUbueAxRLIMzCV
 EjsQRWLrmRVeq0VliSr5lyWzhoHQS/kVT6vdq/moQaVReoDNLl6DEahoSqKrWbDiGB2qBo2PFh/
 IJZZ0owmpExXG9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5NSBTYWx0ZWRfXyzu3/7ZF20oT
 u7zPdhKwt5tZGUaAHNR8g0TTyrkWzcF6ziYsNa1haj+tYA2rHKlLNMIzzLRDLS8Nn5NbZinyQon
 9NA/5TlVHmpfcWkg0cT/t6eKg6S3ZvcUCugv6ZEwViLnNsl3Krwa109fjqgGnjONAVMdmmSfKBR
 Q0N+IBvYq3t1fDOiemTGoRYjzdWoCDzk55MeW2XDD0/OSYoCUfZKJhmn10C28WpKUZGtCgjX6a3
 lvyuSCTPBd3QeUtrKoA0/w5YPeUqNbOntTZOta7hjy7QDnUuUIXLQOWGjsKlMtikc+hNDnsa0+H
 YKXdHyz7blHNM5h2ReYe6GfZK4tkT5w1Y7Kt4n+vr9SnODrF+ZYnH5ohZKjKb3WUyp/Fichwdh9
 jLcS7BHI6GyHLHZ2efhpdbTLl1f4tAQFdA/pQhMi5gb5PIY+r4IslpyzwfAT2pehZXm9mfwWBJr
 7BUFX6qXbUpq4ap6eqA==
X-Proofpoint-GUID: 9sjIi-VT8v4KrWo4f6HX7Cf9cZW4AAgD
X-Proofpoint-ORIG-GUID: 9sjIi-VT8v4KrWo4f6HX7Cf9cZW4AAgD
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0ae19a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3S6BXxk7OjTRUVh9dawA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180095
X-Rspamd-Queue-Id: C269456A2E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37044-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The kerneldoc for device_is_bound() says it must be called with the
device lock taken. Add missing synchronization to this driver.

Fixes: 7fb3287946f9 ("gpio: sim: stop using dev-sync-probe")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-sim.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index e19701c2ed673f8ec5a2475e632388197a78339c..0da2c5a45843ea22ef39273c2e39dc128664f0b2 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -901,7 +901,7 @@ static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 	struct platform_device *pdev;
 	struct fwnode_handle *swnode;
 	struct gpio_sim_bank *bank;
-	int ret;
+	int ret = 0;
 
 	lockdep_assert_held(&dev->lock);
 
@@ -945,9 +945,12 @@ static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 	}
 
 	wait_for_device_probe();
-	if (!device_is_bound(&pdev->dev)) {
-		ret = -ENXIO;
-		goto err_unregister_pdev;
+
+	scoped_guard(device, &pdev->dev) {
+		if (!device_is_bound(&pdev->dev)) {
+			ret = -ENXIO;
+			goto err_unregister_pdev;
+		}
 	}
 
 	dev->pdev = pdev;

-- 
2.47.3


