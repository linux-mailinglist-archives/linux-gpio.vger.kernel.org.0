Return-Path: <linux-gpio+bounces-33749-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKXxMYeuumlXagIAu9opvQ
	(envelope-from <linux-gpio+bounces-33749-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:54:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4912F2BC67A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8CE9312CD1C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5D13D9DC5;
	Wed, 18 Mar 2026 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Np81AzKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvHHa/2y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4093D904D
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841730; cv=none; b=pPA+1zmIdDxoQSqvPb+Q9bz7WT5KRsKrKsJo929DvSfjjlyJdT2Ae95Y0uJRGOYSMMx0jCld1zQl9WFKUwHIKTbSalpI60mwFm6U3FkyUj+Y2MD2RPtK9aukXoMjBsbNXv1vF+jdLAiX2I4oZXlWmS77nj6PxVuQNpojUoZZ2OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841730; c=relaxed/simple;
	bh=Wid9t57qwIhMNBIIiomKW3beJSZRD2cavtCPr6YLQzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gBGkC2oA3P8yXw8Ks/1KhmUUReTMe2Z3RJJxcSJzGhRQaku9wTA06XqEvunauNFTtmba7Yk9Wb6xUlBdqFH8gL3vujdWwHFBpuWhHj8pulfwQpFIzZvAUE3HSAFTL6tEAz+ThhDrNGPRtpK8lt5ThmgkH8Ytln/4VHp9Sg9M5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Np81AzKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvHHa/2y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I956uZ084728
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 13:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z6cl8l0stifaYjPjc9/F26
	oKIablMm7vqrGkzxdbO14=; b=Np81AzKAl7wi+4cbLfh0w3JDLC3yIbJjaF3vqk
	S5gcXGET2EfYVWdQdGroZ+myydvkLch/6js6CTPb9ZCkEjk+1uDWCstTUm+nEC6V
	wQ4ioY2iUN5YQDrhKlDkNsgr6wKoVrCXWkw+qls3qlEL8BVzTvpPvpBpK871hhZo
	3UaocYAi/14TNkqHEJWnBJ0nR27kK7Y7/ahnRVdIZzPuyOG0durPOf9Vs7ht4u/C
	xc4aVcIAeyNbDf302xC/2Izhl7z5Z5EJ57QuXcDny95dsMFdiVYyoppPEt4T9VSg
	Q9GNo7zTG7G7ZJ6Aau1Ad/gbUAlNzCnr/zPMrlN/f6vasdEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqetffx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 13:48:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509177a915aso75973291cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841726; x=1774446526; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6cl8l0stifaYjPjc9/F26oKIablMm7vqrGkzxdbO14=;
        b=OvHHa/2yb6LHXioeEan0Oodhpbqvh8RNVFlTjxfT7StbNhGx+4oikR1JmOMYSbArVk
         EQAE1kWrv33WLAqYS/KWpIMfZP4Mrbm1XbZ0iezWBsSLsrj+fy8VnQfI9J1GJC7cWsm+
         PoWlFKQzlBB//OnkqFPkcl1LhsU5s4qbY3jH5FlRlxLM+SHvkolAsP30uHvcjOBldx7z
         8gBqAvPvy2Zv0JMAPhHm7J/pWHGSbkoa7gZm9zGK0pFJMRQwbEDB7nehWPLX/jaNX4YY
         jqmWr3X7ZwpF+FG0dkNvjwSglnCwPoE5j2xqc7paJzZ7IO5UBZN4SGfIdwaj0n4M4aJ0
         qK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841726; x=1774446526;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6cl8l0stifaYjPjc9/F26oKIablMm7vqrGkzxdbO14=;
        b=SeJScRtl807Z91RuBPtfMR34ejzPgF98Pyy//U8dU1Xfz44gljqP3mpUNm5PTsznMo
         yejPOY8O08iOUBt7hDKROCMSiaGfukrj9ib4AupVrGAuyVe7UUTuaMi9cpQMEH/o+zz/
         KwK4dPUhgD6QH9/efFVTNttljzxLIZyQx95+KRWmoym42IQG19uZbvPqCEsiObQzgMK+
         8GrlCRqGx38wlcR4ZoE3qUICtHzCaBQhdjio3nPcsJBQQGT9n4S4nHfdEfd0Bwugn9J7
         bfVeTOdO+fboCMdfq+yNC3NoHzqImqgz7ZV1XOh0aw1uXJcEpRc6LQanjrkvebdZciwo
         4VzA==
X-Forwarded-Encrypted: i=1; AJvYcCXOTsrwhynstoenCW76Y9Og1Q2SBVxGnkLLvOZvK+U69Jr+D4PFnedbgeH1ubyZQXJej0SG2fTg/iYR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw96MCcMMHf5vtaSbNg1Aq7hzHPiDyP4fWBvzMBxExCP0N0p3J9
	Z/FLVDREuT7FAScIgmNXO3jY0E6YFuUIK772cS4DHdFj8hT5xBvfQ/AKaV7R03wSR2IMcRTgVnr
	o/BbhblAj/AafJOzi0ssUOlyq6IuaGwua6XvwKwGTiZ5KG1cpkhn6WRiyyQeMGvjf
X-Gm-Gg: ATEYQzwLrKm85F6GURmwsmfOkkGzeyBsWKOq6R8SEGPidBJjcY5kgNqbGHbbJkJVk3g
	WuCc9WEBjGYjRce6ilI5ZG9y8XfLeXJWwWsf33k9w5b+otcreFOFVDIUH3ljNO99cadWiOLzjm8
	f3gVFtk9NN+5yLhO+w4zvWLKUETAYKj+6RmqYO928oKxo6xVU46WR5JEADBP/2vymcws0ZE18NG
	yAP57WYZmemio7bYQvvwadfGCFZ/5pitQlPOqUozpjoi3E1r91bthRpzT6sVz+4skegOEbtq2Q5
	mUUUPNhhBGG+7hVQ2nQZDB/SihdafMvL8JgFbWSmCEm+U4kx8rPsVFkwuro84InhMr2vDFv7MnF
	rjPlwWrxIO9I5HXIUgEzoGiiqILVRKTdZsXEt8Fy/JKFdu5uYuiv7
X-Received: by 2002:a05:622a:1208:b0:509:aa1:71eb with SMTP id d75a77b69052e-509980381b2mr83060041cf.13.1773841726256;
        Wed, 18 Mar 2026 06:48:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1208:b0:509:aa1:71eb with SMTP id d75a77b69052e-509980381b2mr83059761cf.13.1773841725846;
        Wed, 18 Mar 2026 06:48:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b8ec:50c4:23a0:2505])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b7f7sm7886213f8f.4.2026.03.18.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:48:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:48:38 +0100
Subject: [PATCH] gpio: scx200: move the header under linux/gpio/
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-gpio-scx200-header-v1-1-626688284f17@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADWtumkC/x3MQQqAIBBA0avErBtwLLS6SrQQnXQ2FQoRSHdPW
 r7F/xUKZ+ECS1ch8y1FzqOB+g58ckdklNAMWmmjBpowXnJi8Y9WChO7wBkpzHYiS+PgDLTwyrz
 L80/X7X0/98t9FGQAAAA=
X-Change-ID: 20260318-gpio-scx200-header-1d97817143a6
To: Jim Cromie <jim.cromie@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chris Boot <bootc@bootc.net>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3510;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wid9t57qwIhMNBIIiomKW3beJSZRD2cavtCPr6YLQzk=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGm6rTehkGha8GYBqgPSDj02bg7oMtFTrm9JGvNMgo09WLWJl
 YkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpuq03AAoJEAWdLsv/NoTDXuwP+gPI
 IqaQO7n4NDuYZGUiS1KUh4byIvB1N7M9LOYDL4dv31oYvyd77ECOGNPSdMJaGfhX8dmfPtCp1YI
 dEngkpj0D5B7Y2mPDW9dRVjL+9FvPi6ezJR6mH1U47488+cunzJrjKCFtISRhXVLC/Gy8Iv56p0
 5NKB7cF4XC81I/LpCpTFovijI0pHHNMYu2jcyADaqRRBOe3y8t4lmmrtv//+aUFAPxud2Xn+MI9
 /M9lnLEUYzRDEHhE2spBKnRoD6InSvUf92AqEp8TernLasN/2H0XdOqNe+UV5Do/nKqqa/ZpUzh
 7dmKUu+dY4HOvIZGmcknJiKkP0f5pCcjWQmokCWtb4xyK3PnuwqgxChMXTydZ3LZREcUAXbpbrx
 4NkQoCJBSuTkU5JYlj0DtE4B/sHHt1lT1S9SOVvQBJV5yFFdac2ojE5zcJu0lNdZMuO67dRgFGI
 /nt7NyjCaRrcHgSnqmQL+TewwiAGRy11FgnJHMEBrPC5AYLHqV3p8VEAUHcWARtVRy3uaQVg45l
 1JWQiEPMAKM7Vmyd6pqnqTv3WPndxkKM7Q2VOiQ/wKOkJfRCbUEH8u9bxOwcwvkVIW3rVA3Wl2C
 NWcPrELg3fqFJTaGQKjZUndsOc0ZUSQuW5mWVEX4NOoD0A5bsUFoSHwr5liQsakx2dJ90L/wcnR
 gqiz+
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfXzU2BzFJNP/P9
 JAAZ3JK37GGcP13Vyn534TiOTgBaGf+x/QXD7KVhiZOeSMkdp7Mqty7XwYRt4jWh0g4FE5pVZkj
 eMcPMqXCiuXkT34AIhOFOEjFXfkPR7yzsanu410mcZibGZfMQHH9FPEsaVxMUBwEsjEm833MH0j
 UwSzRkDggYTGeJWOomTCE/q+ljSgEIbYzpPm4pl0hY/qVmvnklXJynV/5kNgZNRIY9R/+Uq0HUx
 vmezx3lRSdY6cFAGYwgKyfmaGJ6bgGSKrkYl8puzM0JR2G+cEJxKsAiX7BuxjR1OjMsObPEyC1O
 1kl4z9Zb6cdvjQYQi8Evwy6YthUkook3ZsqgKbrWbfeJsx8/hhbnll0A2QYbdUJwg4lENvTA/WU
 U/YXFdcFXN5suD1pUq0JuO9fXb7NRlhWiHz1pKXvpTdpKfa7P4uZrFPZLAgRzNMs1NYL1M65hep
 TiXQ7oOQpWcZXhbyN6w==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69baad3f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=4NrjV6elCf8Ue9G9bcEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: K0mEwFFAgdV6dMa7K3pQ4OeIe2T76r92
X-Proofpoint-GUID: K0mEwFFAgdV6dMa7K3pQ4OeIe2T76r92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180117
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33749-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,linuxfoundation.org,bootc.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 4912F2BC67A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Headers exposing symbols specific to individual GPIO drivers should all
live under linux/gpio/ for consistency. scx200_gpio.h is currently a
top-level header directly under linux/. Move it and update all users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
With Acks from relevant maintainers, I can take it through the GPIO
tree.
---
 MAINTAINERS                                    | 2 +-
 arch/x86/platform/scx200/scx200_32.c           | 2 +-
 drivers/char/scx200_gpio.c                     | 2 +-
 drivers/leds/leds-net48xx.c                    | 2 +-
 drivers/leds/leds-wrap.c                       | 2 +-
 include/linux/{scx200_gpio.h => gpio/scx200.h} | 0
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d768ddae1173a1a3470b9306a8c791d0efe6127..a733f362446dac2bfce628bf198cfad1b1a170bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23885,7 +23885,7 @@ SCx200 GPIO DRIVER
 M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
 F:	drivers/char/scx200_gpio.c
-F:	include/linux/scx200_gpio.h
+F:	include/linux/gpio/scx200.h
 
 SCx200 HRT CLOCKSOURCE DRIVER
 M:	Jim Cromie <jim.cromie@gmail.com>
diff --git a/arch/x86/platform/scx200/scx200_32.c b/arch/x86/platform/scx200/scx200_32.c
index 80662b72035d24b209b17272a816066422d44693..c4fe707065a412ccd7fa9dfd0c9c03b690cf9d33 100644
--- a/arch/x86/platform/scx200/scx200_32.c
+++ b/arch/x86/platform/scx200/scx200_32.c
@@ -12,8 +12,8 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 
+#include <linux/gpio/scx200.h>
 #include <linux/scx200.h>
-#include <linux/scx200_gpio.h>
 
 /* Verify that the configuration block really is there */
 #define scx200_cb_probe(base) (inw((base) + SCx200_CBA) == (base))
diff --git a/drivers/char/scx200_gpio.c b/drivers/char/scx200_gpio.c
index 700e6affea6f78734f58f7b392e858272f0edb72..933eed306c5f9bdd61876dfc67e19a3f1b29cb84 100644
--- a/drivers/char/scx200_gpio.c
+++ b/drivers/char/scx200_gpio.c
@@ -19,7 +19,7 @@
 #include <linux/types.h>
 #include <linux/cdev.h>
 
-#include <linux/scx200_gpio.h>
+#include <linux/gpio/scx200.h>
 #include <linux/nsc_gpio.h>
 
 #define DRVNAME "scx200_gpio"
diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
index a93468c13772f878e1b0ca76fa37b53dc1bf70cf..aec49cd56f532896868d398f005ca2796e91049f 100644
--- a/drivers/leds/leds-net48xx.c
+++ b/drivers/leds/leds-net48xx.c
@@ -14,7 +14,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/nsc_gpio.h>
-#include <linux/scx200_gpio.h>
+#include <linux/gpio/scx200.h>
 #include <linux/module.h>
 
 #define DRVNAME "net48xx-led"
diff --git a/drivers/leds/leds-wrap.c b/drivers/leds/leds-wrap.c
index 794697e160685cbfd8ccb381f9e814880f62965d..ea133de2537b4df9f3ab8c5ce510c5894db47baa 100644
--- a/drivers/leds/leds-wrap.c
+++ b/drivers/leds/leds-wrap.c
@@ -13,7 +13,7 @@
 #include <linux/leds.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/scx200_gpio.h>
+#include <linux/gpio/scx200.h>
 #include <linux/module.h>
 
 #define DRVNAME "wrap-led"
diff --git a/include/linux/scx200_gpio.h b/include/linux/gpio/scx200.h
similarity index 100%
rename from include/linux/scx200_gpio.h
rename to include/linux/gpio/scx200.h

---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260318-gpio-scx200-header-1d97817143a6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


