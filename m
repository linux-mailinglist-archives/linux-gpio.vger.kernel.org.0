Return-Path: <linux-gpio+bounces-39112-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 38atIHRPQmpW4gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39112-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:56:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDBC6D91CC
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:56:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hSDzMcyf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C5qjcd8D;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39112-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39112-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 921E5300A652
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1AF36DA1D;
	Mon, 29 Jun 2026 10:55:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00FB369D70
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:55:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730522; cv=none; b=jz7kMWcHR7Ia3n6D25D0O+NcsTTrESB1Tkm71ARV/zRjF2DbWulWrr2ziN2PpSsMZJk5doNwOvfQS+FcHQEbrW36qo3dUg33bH0YGJWPXTs4E775z4hUsxQGJ2IdKn0DuIg9dPbd1zY3dzmrEOJ+hTVks4a9moeH36jbJi3iygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730522; c=relaxed/simple;
	bh=1zngejGYrWpPQ8aefOODCF6Q6q8sbSJP6R5Vhr2DPCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LzPCROR6eGcVKqChwtNHZM2Yifjbuz+sr78muvI/xFd+4GWBj1FCloryG2cueWbepRPEOOxKivJvMXpJVLngCIgBmMMId7HPJnyHybn5WikEUp4C4Ne/woFEB+IsKfZAbE4QBEqlcXd963Is83eyvPMF3ImIzWt6Tn7FTk7L50Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSDzMcyf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5qjcd8D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATpBg2656706
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2NadUuQ86TPdwjZX65O9oN
	q1Trxeo8V8R58PoE+C4C8=; b=hSDzMcyfO7v8OxfSEb1XMasE678A6XI4Bs69re
	dxZCgkb4gCnrU8tl9roZixAVa9mlMKrj+H69oiTDuvmS+CpWrg6j+I7nK8pPkMhc
	EfGgtUA10KGsazV9BXg46KrGlk9Lnbz7sWSMYnx0NCL33C/zGjrE/diBrE4XTnI8
	UsxZ3q0+hV/w03EPZPsW10aS6UbAJ0fQ6rDEenn3bYa0iIKiIWsSWNyLEpRZXpg4
	eeMeUuntPCIc7bEEUWCvLjEvIEVe7g67q2gEr+EnK08cnQPBLcFzawAiprw8Xwtw
	DGpbQmOGkd/cTYYS6OFny9QsB51Q5m82SKWINqcXLvW/pWNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gef9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:55:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92aea0d801dso455289585a.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730507; x=1783335307; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2NadUuQ86TPdwjZX65O9oNq1Trxeo8V8R58PoE+C4C8=;
        b=C5qjcd8DNzwjaqcfbMgt0Yz+iZFGqGiwlrf0u4G+4y7n9IkRnNgoHlpw0+B4D6j26O
         a1HlHhCfWhQWTXWXgmWxeBJgls4fUhEoSDo30hS8iiPv1A8xIxwH0qh9T0eAn2gq+0DN
         ch3tV9UUk4wz8GM73VYX8C716XdjQTv9ME7yaEe74wcinwqVRZ6O5ugaP7RqQWTKx6OA
         t/Yoo8/ZgwbMhR9iEe/s7UJ6YW0UHFnZOxVeSuVxUJlnGxLFwAq61wS52HTxTBbcxrBT
         eotIIz4raoY228R/VIZ9rGVRIO3/3Htl84PqiSWXC1m7BkpCk0nRjjMptde2Nnz76zHu
         CduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730507; x=1783335307;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NadUuQ86TPdwjZX65O9oNq1Trxeo8V8R58PoE+C4C8=;
        b=Cy18F6/3COaFcL3Xm0c8QxeJdO3BQdCpRvYqit+vSoLFdo9CYCrhg8xWaCdlD5IVG5
         90tiL9JrTvdomyFtALBH9J0B4O2bPe1REhS2MnbwYPaN873lzqGj9DavMRi/vPl6d+Gn
         +0rtYuBWkjTvt/lJuB81yAr4f8Iuup0MpRUCr6bsJdmG7/6syPJwp9ZDfBQ7W2XCJTiv
         RRivel11vOKZLLxy6xnEhTkCMiXhHoZ8Xk5ET1ykRXXQ0ANbP67vkmyYueRWqrZ4Q5aO
         0iPllV47r1/ueMZgT1enN+oSjdbFAIc7jxuS7Iig27DnYslThM8At/v2YVfJRDzREI1y
         Lg8w==
X-Gm-Message-State: AOJu0Yy0tCs6G9l7YnUX0LPNgXL7JhQU8rLH5QwjWWcRLI0OgmVLbyvD
	m7j23g+35z6fCJOi2V5iiHWJ3LIjXzNXgRV1AgzqzfMRj1YVGpFgFPcIpI+2VTo6rP4y+pck/Yo
	MJWV3jUjvdo+cdvVO3sfR3JgPI94e3fup+Lq8IeyY6qfrEvT3Mqjn5VlziBJ5yOsn
X-Gm-Gg: AfdE7clid0SYuKzf8Zingok3dtYfq2Zm89wRvr6b+UBXX4LvgR0ZJswRj6iwV1I1Pd7
	rGpTfhRQ9/VLwAEp0hKC0dQbRBSrR8B78LtJEaSIPENHBI0l/kz33ip4cVytH9tPFpcBkvIoNzy
	8cv2/H1SW/tyUMRLENpdYjPezX0OCodAj4X6dhf9d3Xxb/fqj1bUHS4Puvdogt8MwNakNVHwQCY
	aSt+iGqoc4bBQL/lMWqS81o3JoX2yzwsPDUWCD1tmJflUohTYcQ6SnCoLgyHbwh/6F7S1FSEFFY
	kp0i5OOWhziDLtNP3/JBmcmC6M92EmwkjdNpLKLRxfh5vKLpFeBs4eF5euTvkEkEOZC74aS/00M
	I/TYs+xrXrS58bFmVWVngbE5G8FwDWwRvU9L7xGbq
X-Received: by 2002:a05:620a:2689:b0:915:68dd:1eff with SMTP id af79cd13be357-9293dfb723fmr2140453385a.50.1782730506828;
        Mon, 29 Jun 2026 03:55:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2689:b0:915:68dd:1eff with SMTP id af79cd13be357-9293dfb723fmr2140450585a.50.1782730506345;
        Mon, 29 Jun 2026 03:55:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b5e39fccsm20422095e9.1.2026.06.29.03.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:55:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:54:58 +0200
Subject: [PATCH] gpio: swnode: remove deprecated lookup mechanism
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAFPQmoC/x3NQQqDMBBA0avIrDsQQ6PoVaSLqZkkA5qEpFRBv
 HtDl2/z/wWVi3CFubug8FeqpNjQPzpYA0XPKLYZtNKDGrRBnyVhPWKyjLakjBu9ecOdPmuQ6JG
 m0ZA1TvFTQavkwk7O/2F53fcPHZLO+XEAAAA=
X-Change-ID: 20260625-gpio-swnode-drop-label-matching-a975ad5f0e40
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2923;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1zngejGYrWpPQ8aefOODCF6Q6q8sbSJP6R5Vhr2DPCA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk8HeR20ZYZNa4Nc0MsQZErgfYN82yUm1ZEr2
 1RcZdcCHXqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJPBwAKCRAFnS7L/zaE
 w9MaD/wIMhWRtrwolAawHZwHqx81ldaxPo3GJi4opzLUEyeYF+dNcTawpsSz3PkBpuqS63b4CFz
 6vwU/Mm6GLLw8up9S0CBrQZPkmfSFmEC5PGIX23VszDKYf9RSLhvVwwdv4B/r9yPIj0qpM6zks4
 z+2Xaya5nKP9FU/trQ00//hyxUCeLO5Gof7PFvXeo0gZkOzHoZ80XHm1PyQQIfZ6dED4I57t5jo
 bOirfj4WHA6O1WeXgJ8NX/5BF1kd98rBlmjyXohYoUyKHxgUtnuKFKRmqzFZttKcBlmQhH6vzds
 qw5HAUHZ5YDkAutHO+s+2Lo+ZP890LpqzGVAItorO2Psy7P/eXBWyAN0IB5XDutcJnRBM1sjtWf
 AUI+HOOGmQV+vB15c9ceKpv4vNeP+s6JvGHSf+9YBU9SwK3+WiofOZPOB5HbqempOV9vdOCNctI
 vbY+bKDmq3LGuoq8BwwR9CMToEBxM5SvAxuQ11AomGOfg7GhdjljpY4o3N8/uF0UaWUmJOq+tzR
 fifJQkRx88EZ7/nHihZ2xUWKuflAWPKT61CeR9mGVB5r5sUcrGzvigarGRnv4w8ShLHcCcyO1PG
 XZgbc/8C0ac9+X0KaiuRznRqNt+/amN2XCo8mGg48aRhecZqk45cDeYEHxM9iFUzpgWTOJbmEH2
 7zsaulmJJGDu2mw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX0n9ATIzjQKLB
 AbjiUz2vAXFmA91DfXQ7x+v1T41n/k2HqxT6cURKj6xp+tIgRpwE9JTbuKlK0evi9vuSZJeSp3M
 Usi17CTGAliT6cqLwer8PHHivhDu2aFNiHMSuE9xU42RRHGSxDELK/e8oLqAHpF6GveGlODvBLS
 nsUM/cZqkJOuG7S48KnFuD7BKrH7gINIDQVSl+bqdrrJ3ZmCSQMVI8hRw0YIQlELoYzMlOlfDi1
 0oGzWTu27ZyCyi8PTZdPZjcbErdPR7jlyvbJWuLs7iru9pWWph8NV/PMWllAXbosd1Q5hsEcrBH
 eZWghJyh0tNsATaJmV7hTutVoJmOWqGK9dRjeFGevE9YjHQ5bs3WdQTTTAtpPojvUUGSWN98uLo
 ZLySIZVoxNAGOYMmaMELdNNmd33CL+TPri9EftBgWLPrTkJEhchqQz58wkIJhAOuf37nLUkKi/J
 RUN9/UI9o0beYLmheMA==
X-Proofpoint-GUID: Kaf_oTZ4ASMsNZfr7DeVnc5qTrtPs-C_
X-Proofpoint-ORIG-GUID: Kaf_oTZ4ASMsNZfr7DeVnc5qTrtPs-C_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX2Dmxr8gZC0/j
 q5pWSOWzc+BViSV9UxrnKNF1hxC2i592MqBvXzvzHcId0mNwOk97LvU69VkLUoxlupRqtYVazJQ
 BhXiBrJHeyV7Tg8kqQFFDQqoVhqC/VE=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a424f0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=m3T4BOsz7KQXbYvNyo8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39112-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:andy@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DDBC6D91CC

GPIO software node lookup should rely exclusively on matching the
addresses of the referenced firmware nodes. Commit e5d527be7e69 ("gpio:
swnode: don't use the swnode's name as the key for GPIO lookup") tried to
enforce this but had to be reverted: it broke existing users who abused
the software node mechanism by creating "dummy" software nodes named
after the device they want to get GPIOs from, without ever attaching them
to the actual GPIO devices. Those users relied on GPIOLIB matching the
label of the GPIO controller against the name of the software node rather
than on a real firmware node link.

All such users have now been coverted to using attached software nodes
via the fwnode address lookup path and the kernel documentation has been
updated to recommend it as the correct approach. This allows us to remove
the old behavior.

This will allow us to leverage the upcoming support for fw_devlink for
software nodes in GPIO core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 8d9591aa9304d1eac931d1cb19597ae4b99c40a2..4aa3f3406caaf7e049aa1da153d790e65de3008c 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -41,27 +41,7 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 		return ERR_PTR(-ENOENT);
 
 fwnode_lookup:
-	gdev = gpio_device_find_by_fwnode(fwnode);
-	if (!gdev && gdev_node && gdev_node->name)
-		/*
-		 * FIXME: We shouldn't need to compare the GPIO controller's
-		 * label against the software node that is supposedly attached
-		 * to it. However there are currently GPIO users that - knowing
-		 * the expected label of the GPIO chip whose pins they want to
-		 * control - set up dummy software nodes named after those GPIO
-		 * controllers, which aren't actually attached to them. In this
-		 * case gpio_device_find_by_fwnode() will fail as no device on
-		 * the GPIO bus is actually associated with the fwnode we're
-		 * looking for.
-		 *
-		 * As a fallback: continue checking the label if we have no
-		 * match. However, the situation described above is an abuse
-		 * of the software node API and should be phased out and the
-		 * following line - eventually removed.
-		 */
-		gdev = gpio_device_find_by_label(gdev_node->name);
-
-	return gdev ?: ERR_PTR(-EPROBE_DEFER);
+	return gpio_device_find_by_fwnode(fwnode) ?: ERR_PTR(-EPROBE_DEFER);
 }
 
 static int swnode_gpio_get_reference(const struct fwnode_handle *fwnode,

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260625-gpio-swnode-drop-label-matching-a975ad5f0e40

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


