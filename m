Return-Path: <linux-gpio+bounces-30699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C648D398C7
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 19:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44D83300A2A2
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 18:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826A5246782;
	Sun, 18 Jan 2026 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4oQQsBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7KSc/Dj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2498423315A
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759808; cv=none; b=ptNgH4Mde3HU6hL0s9U+5Thl/LJKQF3yAFeTf121pkzWshcu9iNLcjgvrpaGDC+NLLk8K7Sg5stVKaUk6nOa6azFGl0J37eRIhW39Ic3vTSw1r946FTqfC4ODixNK8v3GNheen45XocnWrkgboW+hxn9XkzxzruTmA7a5DT5BmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759808; c=relaxed/simple;
	bh=baKkcqSJ65hc0ts9jVcHMZU7FH4i9Uox6/iD2KuATX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ru+RcxrVJhnGg9UpAN0DiJbAD4ppphxhe9Br5MRn6YnT4vtGr75Tt0Z0eEONOOBvC7+hotr81przNZUmd1r4XHDXXJ5l24BH+oTx7mprYhtZhNO1tST9Fvk+O12FJod7DwOqydChevdG4XnLnf5SV25gXks8gumz9eXwSOaLx+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4oQQsBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7KSc/Dj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ICRhs52124364
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=; b=K4oQQsBNqYVZw4QH
	PjC93dzL+Hz3LWNfTQn9Viz2RAWjfWaMdQn+XQT1jUJQ1eVTll4XbPiZYIT+fVmi
	x3jDEAb3C1dOVGQjURrLEAeFU8nBZnO9SpeOqanXZAbvzSZge+gZufuN9ZeyAeUt
	VTjwhd8Lcu6dok0QAc6B8iEhMhncREgFSCjkTR1s5IkSFJpOF19qirc4gu2x20/U
	O2ZBSKiSBzFkmb0qaoaO299bc02LShw2HQovLbVbnGpCKtuxd2fbUYTRAF2El+rS
	Ox8De3k7GnXYCb/Sv2uTpimVD4QuaJ32BAyW4oXQvIexvZJU1c/dARph3HFIPOb0
	risUjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqysjb50h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 18:10:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so917746585a.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759805; x=1769364605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=;
        b=b7KSc/DjKkPaRcLEsFnGPIQwEB92twoGd6dgxOR12Rv2mR9u8X+NTY8V5pdzwyh7Z1
         2yfqZdqUAa9Y5JpgWXLCCfr05dzXS0eEV6BB0e5D7O1U8x+YEFcV8cfznccU4VURuEtu
         ecWckcVSl5vpCwzwFslHb+bfzV9dRhL1+7oz+w6GH9hDkIf/XvlmXgMrQyN6T0ocy3TR
         5t94A+78+DAnEj7jkEMWUtgsp60E3LvcbD+AthUc8ORc9yITqqLRuoXW+KASJ8gt4LfH
         XahuequuhOsUpLdPv8uNM628USWB0u0ECyatqVdC8T8GSuZogO90PUwMVL58Kz7cQ32g
         Qxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759805; x=1769364605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=;
        b=G9oyqIIM6FF645+mbungvQKxjrxVwOAHyMMYBBwcxxYshF9cE8NnRnXckoRvwHLtJp
         u0m2QXcI5HCEjr0NfBC/wV8ZdawaUvWjgyRaXct14uEZ2ovtTSJaE+nPbGYg24WmGY7b
         dLFnGrmDtD4+chI2p3YYTxZJNHjFkdx3DgMh66oiW7KZsXvaDIw97DYWrdn4aVcufQoT
         qyFW1lXvR1PvmPA70zEyzJ1Ip87u8sX9Ti4CR+C0qK5XjxGab+UkCPOKwC7WM7QFjVkK
         g8E4xx9Ce7bc0G6vlCI0kGT03ptDnAc2pbX7zPeigoC/NRp/n7SdfayYwFVjmTD80CSy
         0YaA==
X-Forwarded-Encrypted: i=1; AJvYcCW1V5fkOPOO3jT5S1m4xfDhnU/mv6SY5dhx2OlUNjoXeOYv6iZNp7cpuZXc17tGaRcme1+u91BlWieg@vger.kernel.org
X-Gm-Message-State: AOJu0YxP1YmnKgKV9VQKF3qNlj82YBEbG+D3C5wYRLjv99pM3x7Ycv2P
	EiuoCGmUsgg9mP62kO1tz11+0jS9CC86F0W8UxHpDsNEDkH0zyEe56kWzJD8TS1UMPkTgPZFJCz
	Ray+RWc6f3R78aAs4AacZu1BK3L9ImZOXFoM6oXLqv8ht+8Wyjmr7YfdJmWA8yxd1
X-Gm-Gg: AY/fxX6LmWgcHCLEDn1qXa25M7bBTnmWe3QR+kUxErwH6tXxJlnfsGfiigC4mZSINFh
	F9NYzyGNq1aAQJ1EnQmYlN9bHP0c8DB/nTX+IfBTgBbGi2NHM7ixf1+NRrBeb6BRh2uMVbHR32W
	Wy+OKSIb0c1ogp6RjSY+dX2qVsrZ08uEUCxT6EVxCLWHD8p2s08hrbbt/Uf5HSsk6/9Nl4sPUPf
	5LlfUBwzhZ+o/rMNPTtTV6LRCHyAgjDZxcMpdXWJnTaT8wm2/BGBQCNPsyswISH/zroTlb0ZcdX
	Sq8dMnlc1LUa41MKRuVreB/BIiZnfxWs1BaaawsKXz/AbiXWOet9R/J9I3ImsSuqdekFSujoe6W
	1BuqWqCl5rk/N3g7S7uMElKBPSSF/ddWtFA==
X-Received: by 2002:a05:620a:2592:b0:8c3:7016:1d8c with SMTP id af79cd13be357-8c6a67bf39bmr1240340485a.88.1768759805395;
        Sun, 18 Jan 2026 10:10:05 -0800 (PST)
X-Received: by 2002:a05:620a:2592:b0:8c3:7016:1d8c with SMTP id af79cd13be357-8c6a67bf39bmr1240334885a.88.1768759804930;
        Sun, 18 Jan 2026 10:10:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:24 +0100
Subject: [PATCH v2 01/11] pinctrl: aspeed: Cleanup header includes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-1-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=baKkcqSJ65hc0ts9jVcHMZU7FH4i9Uox6/iD2KuATX8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHuEhmtjxve35yyh5CVKYE/OjzBr9jYAtTm2
 cuacE/vqP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h7gAKCRDBN2bmhouD
 1+Z+D/9vnrXlH3u/GiXeOxQWIyZXbZQDkyEdActKpj2rvX7bL507HlztUm4KVnLg35wNcK5pjlI
 AB27rCgLeJSaUUY/Z1tYqFhPj5AMpwXMcHuMxxSsOZw4TZaGs8C74Tux+ZKoLxIjPHKBuGxhVTG
 xRvrIRns0lwCv3l1Vt61RY2eQWZ3cRzuTG70D1VNUCafSZyqBMfrseeOIJTQUka5DMx6p0OSCNh
 Pbide0KGADmwPF108KMVzyfXXSC7q3IhmoeLbX7y7tiru/iIGv623GQl0c3JCGE7E8wjQ+M8lDB
 CvSyDGn7tL9cDEbOm+G0FPZ9RXouXBE6EckA0eRvoQJGjFjdDAIc1Qai40rB+bydAmeDpHes8FD
 b9gsxIQnnhRFlHMwVSUB4QQ6Ue+xko4RD9aEy62jqjnnGbobSLUbADUwz+9ljllkjUsJo3MAwG6
 fwyIWtfhX9Hm0aMzMd3+d52ZQvzknxii2yMiTgrMsN/mDi0PAy647DljHlE2xCa85qCqU47Tff4
 V7uA0WcXPa4O0fVCDzDd4Eq5NRHKTtMDSMyx95WwGIp3uxnub4mphQkFe+0KnI/aXUX4PRJXLz3
 RiAGGtePI2G/UzMvmMhFoRFIFDBUBZVOoiZB1ZQ+re/oz01WEe6LXPUmCBORP+EAN2EtF3Ah6kL
 TBkAdeCK1+yugAg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=CaAFJbrl c=1 sm=1 tr=0 ts=696d21fe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7KBfExy5AAAA:8 a=EUspDBNiAAAA:8
 a=GlqkQvVaQCEososwM9MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=eL7OMsOqQ-6kYQPn45L1:22
X-Proofpoint-ORIG-GUID: COFojxf1JMe0qsj8NYbaRTnLLweBAp4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX4luYMsJHJ9q9
 F7epu9QbAMMtHDv/gNaLtXVdwuGyvR6Da/MOgtJAj939wehw9fUmvNrm+SGEfCMao3nN0VK/2vR
 EamHr81yr4jUg6CS8nZpHk939O+NexKh4nYjUTjGcfPaRiRU4KqMl83UFFW9kk3WM9WflFIW+OC
 Sz4ydnClCOh18yM5DHMJozHovbnztCM5TS6BSZ5KeYHW8jFp1YSVaHqQrra/7ik8rIQZcfhK5UN
 awCO4t8s4byJVQRfhflXbbibkeRLQtf5UWEdNg8EDoK6QB3FYSRfig2bgGpePj9vN+M1bRf3cu+
 RUnyH/CDaPWszABN4B0rcnzqA52Ukd6X/hqq+g2Tmx2Q3LUF+LQjbyYONC9H1YxA6ZDqbCD9RlX
 SG5EgRE7ELJQ2XUqaiKGi3RUep7wwJubgiHCWxIagsXrerqh2PHWBhGzIS4QDxI18wt8yB7p9aa
 FRtBSPptPO/a41bu0vg==
X-Proofpoint-GUID: COFojxf1JMe0qsj8NYbaRTnLLweBAp4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159

Remove unused includes (no mutexes, string functions, no OF functions)
and bring directly used mod_devicetable.h (previously pulled via of.h).

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 4 +---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 3 +--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 5 +----
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index cb295856dda1..f9d8fb1ab1ec 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -6,14 +6,12 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 792089628362..9934ef6205d6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -7,14 +7,13 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index b0c7e4f6df9c..8cf61aab81b1 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -4,13 +4,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"

-- 
2.51.0


