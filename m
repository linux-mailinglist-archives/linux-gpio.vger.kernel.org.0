Return-Path: <linux-gpio+bounces-35560-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLdRCGdU72maAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35560-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:19:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E84725E6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77F42302DA2D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C503B8920;
	Mon, 27 Apr 2026 12:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKDI1OgG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIWO0emL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961993B5850
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292366; cv=none; b=utNMospXCK890+A7GcrRTPhlDpEPMhf1lk4Tu3rINRSvFPEfKFdTjN/AQg03DklQg6aaMjzxjL4e1YN+4vOU1Jqkyy/s+fttWZLvKTYlS993sri4kgUjfHcuPRwVEEI9A4zOSkeOYc9PvP0++J4Z7AbTyPDNhAi+OkX8eC+yFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292366; c=relaxed/simple;
	bh=mlZurhMjnNadP6KDAy67g1xVZeEONxV++y8bOiCYR0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSzG8+5oXJqoYH5d2RR6jJ6Gk95grs8U3V4u5XF/GUETeeYNApyipzSE3YELS3kh296ibTBYgHyib5FJr304Y5mC3Zfx7Qd8DOT3PcJAZkH4dy8ilbBq7bGb4gANSqaYMS4AzwEIMRVftQtPFK0PHim8h+GlSmDjJWc+fcvX7GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKDI1OgG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIWO0emL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TA2M2793106
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 12:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLLQEt/bxULlBw9ELKCkgAUAtDDl4p/o2jmjEXGFfa4=; b=MKDI1OgGUxhoAZEp
	xSiGU0T008x3CA2vC/fGgdqJdek2m+zzksBk0Z6cjY9fr7quR3rQyFH2tLde3iZ8
	kZi8Ior9ulqUv2EPTJVP1HZyVyRHzfMpKgJSP+IxEOW6Juhd35q6Z6rEs+oGwh1L
	7v3B6Vx7c9M3LGQrvYrmEpyS/BGHhtBFQI2LsX6hXFl9QpG8pr4W0dFRdPa4TKhR
	zMhfrWJNQTigREp0gQDtIEhfxw54ge8YuFhzuxHs0/HZ6GXP828/HkTsfxCv6Zl2
	bLOfHfww456+ozWcAYiuIIhGnHIneRFBe+516g98ndMclOirtg4MygwHnCM5Xk5C
	W8tEcg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv3yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 12:19:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f4a1cc334so7290553e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777292364; x=1777897164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLLQEt/bxULlBw9ELKCkgAUAtDDl4p/o2jmjEXGFfa4=;
        b=VIWO0emLDJGPbE8MQuQiAgp+praohetvCsl6E/KLlvzIhhI/fbZwqcYuvmXG+0CPse
         wjY/LR99/XnjHDI1SbtDz9haTxsEQrQrvy87AvdNpbfDv1VlQFupV4OFlC6jvuf8Gf1X
         mYXkRyG/1l+a8pH5ueoGaty66r1mIWAOxE/Hh4/hvXPVUCQ6Wv7KL58VuKkrHur28nY1
         nvuiYOO1fXB4TTO8se/NCRB1yLLT0iXO0JQkCKIwhBW2TOexoUkivapzxfQ22rMQHm+c
         0jrMTsskN8F8XbhiWZvvX3W1JujuVGnoSr00RQXZ5D/gVrBDrRIFVo4OUdC3/7Zxr5tM
         9/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777292364; x=1777897164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WLLQEt/bxULlBw9ELKCkgAUAtDDl4p/o2jmjEXGFfa4=;
        b=lRYl8U/cGhXcwfMDyhzcs6g8O3mJ1MLJF2agJUX9wMKqKnxXXtm1f3dr8Dsrgzns6X
         hZN7Mjuai5OU0CAdGYTpoiollO+I0JEdE0PmFxOxA+9JehDQA9HoE6So9aS1nIvGH39b
         T8yn5QAN9zGarBFDkIlN0aISqVfPZ8mgQWxcaBfwg9FEcnpMdwhGSmpKHin2jyJZiBBF
         /9+HngXgz3HIRtX3IDil3VsLS2lrP9vPFFhc8t7lBp8sMRQRiQCUuMoEIh6CCEXELVBI
         UTLA+Y2gIH1/45PGfZx0SPirHokjpZU9zDUOCKXI5bu8xdpvwtgIBwkrfvcfig0nyrAT
         zf3A==
X-Forwarded-Encrypted: i=1; AFNElJ8h0S9Q6VceT1EaCFOdN+xTSNEXe24e6jGz1mQNJvI6WFRq2FZXcGKrwQko9vpVP5szLw07+/8ShdQg@vger.kernel.org
X-Gm-Message-State: AOJu0YxPagZR+eijAWAVnlZ9SKInDcV8eP90SK3xN4BgM9sRyd3KoLR+
	7Ue8D3ncB16OUc5I/QwmW3KYbmFrKyJLSYmTBp83yFvCI9+7vhWnzdkpSHJ6klFF47m10ap8k7M
	Cocu0WfZRzHyepgIoiHo3ywqTsfHfwR/26v/HOV3N0RYvPYwZ6c6DUI7770lfQ0U2
X-Gm-Gg: AeBDiesSsQ8t8Ogk6KkdwVEpvOqrYiVinBYruSKsfr0PAV0B4BfemNVqYcTkG/NKACr
	oAvYCSHTpJ1dF4JeM4nUaCqLcKqq9cWOLmSrsG9bAo2JOzxHRmu0Cq2oK5L+ubcRnQk2WJEfT56
	47h5NQDmJd/KOjBjrjE5dtR+ROzkFihtJP4FG+HYll50wPxF/L+eIPR19VNzWeOpUvRredHIv1Q
	9eiuE3j0NYZc0RnF7qYV6aRFwLhUDA2AsAI+d6v9cG2HT9t650Z1BYIZyjjsjk0yFOpbgxFxFBm
	LpGCPVtkV+NM/30biaBiNiUzgwYJb1F7z+HnfnvEKLkh6wDKhA4tEqG/WIMfE5coFyAvpSQbjBZ
	u+9weTIFShvwY+ZuRqUTsZg7dBJq4Q46t47/XydOVi65T4WdlXs80/mQEtOHXBA==
X-Received: by 2002:a05:6122:2981:b0:56c:d623:896e with SMTP id 71dfb90a1353d-56fa59fea24mr19124247e0c.14.1777292363930;
        Mon, 27 Apr 2026 05:19:23 -0700 (PDT)
X-Received: by 2002:a05:6122:2981:b0:56c:d623:896e with SMTP id 71dfb90a1353d-56fa59fea24mr19124209e0c.14.1777292363488;
        Mon, 27 Apr 2026 05:19:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:83be:e944:7b0e:ef3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bb3d121sm882844295e9.14.2026.04.27.05.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:19:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:19:10 +0200
Subject: [PATCH v3 1/2] ACPI: bus: export the acpi_bus_type symbol
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-baytrail-real-swnode-v3-1-0003e4c1708c@oss.qualcomm.com>
References: <20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com>
In-Reply-To: <20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=718;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mlZurhMjnNadP6KDAy67g1xVZeEONxV++y8bOiCYR0E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp71REE5uD0uAH/n0mbsFwcp0KOqvzDrjC45xqX
 GA3q9K4sfiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae9URAAKCRAFnS7L/zaE
 w0PVD/sFBO6hJ/tLl9BKh34iHj3Ty4V20O0AWUgokfdr54NyJLgKDSZqpE2DSA7bRQNh+aOWrzu
 +vHW61J7VJoJM9tsiwWr99abQmlI1JSLu9RKbLSPufTbMfoA/Ytyd5UuVy2EIlQvI2XcstgFEkO
 3i1BkerwcHCFRzn53lk4A+J8nxP/EfYLnhrWzg+p1rHsPdIiFZT0ND96dI9b1X8K+IUMjFJdd6b
 9iSe0MRFmfVe3cnwKFxGq8yG7qOUcULpuREM99N4WouQrd4U9cYnqfdUGJ70++STefidq3dQ712
 3AeTalJCmeEC+Cpnz21bQr/WFxVN+m0bYItvlja6O6xvWLDrM5mUCqZw6JTeAEC1gGC5JxXohfT
 ouYTL1zD0ABj0MoL8zmDsey5mGLvv8Wc6Mu5gNJMEK5bYPf2YXyCSxctoIyPNcLizuwFnEv+0Zs
 P/ycgU8toyvLdzcGxdj4sCILKy4rRKnzfXsEkQg+3pcmkMiB1ST9mCU1BiFbtqJJL7mTIfIH9nG
 ebnEG1uPV4futj0X5KI18d/bLT9RdE9OmahE26Nmn03Ztg9VTOd+1Uj9G080hVfp34ThOvgiDIO
 MXMRUANI4grOHLrB17lkM3gL8Kyq2ldPjBteT0s6dPiQGSJNfPHY3q/cvp6JnkRkoOeCw+7rV68
 /YhwObupr0jITPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: C_k6ssgx8rmez7f7G7fFpG-xehMyzzNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzMCBTYWx0ZWRfX2TyDDyaTk5AO
 bpR3oD3D39GTzc39nZAg1GCfyzHSTtjgPp269fTTXTdug1EpggZ6/xbIUEd/ZIlgeEY02OkCZA2
 P9/1ixYPPd4mWtUU8GI9Hii4+h3h/wC65K8Hu6EXQ3luo7AqgSIYagSOAAdVajtW44NGvNTKc53
 syoEP7CWgfZLlwullm6/BrJuBTmiM9AVGyiK9I7Q+vDuvrAJBwXDUWMU4Zk3cY301eS+kFHIi7e
 VR0YsFN7guVOLPhl5Hd2hsup31MR7EmBkjWKqPxjliIBRdghZMI0s9XRueDdc0KlhPG/B+8CP52
 4Nq0myvlPUcsGKnJVKG319Iv40yXoJXyT5nI5uT0bYmLF3InboHEaBnJndkaoaSVy/ghsk8mxNa
 HsG3p0cW4n23zH4CTJp07GLEDLJV6iAjpJLofqhBH0MO+GhHutXWD9+TJy7SIcsToUXBE9j9m7l
 W/y4tND8EYEqoY+7aog==
X-Proofpoint-ORIG-GUID: C_k6ssgx8rmez7f7G7fFpG-xehMyzzNL
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef544c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKT4v_QfTO29Hm7g8h4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270130
X-Rspamd-Queue-Id: A07E84725E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35560-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

In order to allow loadable modules to access the ACPI bus type struct,
export the relevant symbol.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/acpi/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2ec095e2009e40b0645f654fb051429e5679dc7c..d4da76607905473de2e25e50352450c10f598784 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1174,6 +1174,7 @@ const struct bus_type acpi_bus_type = {
 	.remove		= acpi_device_remove,
 	.uevent		= acpi_device_uevent,
 };
+EXPORT_SYMBOL_GPL(acpi_bus_type);
 
 int acpi_bus_for_each_dev(int (*fn)(struct device *, void *), void *data)
 {

-- 
2.47.3


