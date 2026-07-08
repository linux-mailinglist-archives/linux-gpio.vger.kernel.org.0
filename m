Return-Path: <linux-gpio+bounces-39623-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +pjGJnwBTmoyBgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39623-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 09:51:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A1D722D5B
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 09:51:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=en4b0veg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dV0rhN0K;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39623-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39623-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD6783048F6F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 07:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3343A9014;
	Wed,  8 Jul 2026 07:46:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD1A37A487
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 07:46:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496772; cv=none; b=ejxvTagdn97Kj8V81fu3shDiQpIfbg7+eRN+dg8yHbOs4SNQ9TxTXgguyaIlIzK6s6J23DyN1cncXDHHb9kB+tYwCe/ueoHDpH50BJMDPhbJahTCVcQ7mkQJiIEzYqGx9/g+V4Zn3DIeQ9ft7M63B5WttHaifB9OvU2ScGNkjTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496772; c=relaxed/simple;
	bh=VImDP7yvX4cjKuVDl7PwWUTHbpr+bQEFR66LJVX8tC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZG77g7CfnfAZVG+xV6yzzBh9Nx2sDlZK2VaX6HUK12VK7ifxG4BpE6/2hh/aqabnOKzQwDtJy6o0hRd2/8S+oDyApfDxMo8cw6LZQmEIH1TkKytfbeXhPC7YSff/tRjDIL71m8+y76bnybJcvmPatJ2fR+iDcgEybP4tATm1YcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=en4b0veg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dV0rhN0K; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6685DjmP1817851
	for <linux-gpio@vger.kernel.org>; Wed, 8 Jul 2026 07:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ms80Nx4uNUP6/6LdRJl/Ke38PLjN2iBp215HZExUgfw=; b=en4b0veg/HgMMi3o
	hTXBJ4iypPUpDf0PlS6lMzwE9RrANa0r7+6Qj0K2KpjEP1nDhpDxrNaYULO2qlK2
	wTxzGy4FibKpPykGzULVNDQ9kmAQaKkR6wd39x/5JqfxHIyZayVvI2jCYC8EcYQp
	smyJ7+ippFbN21BCJQA3UtfLNMtJSTRQ2fg3aDN6P5ltxvSK9XKYnZ8nLHzZCrFx
	tRX1FwHP4LQimLBJP/zRv85Dd/ro/KpfcEymtolHOPIJsgBj6sSnCYBiBZJkGA7c
	uvIVmSdG4J98ZOdTqiHTueWFgOMJETGCtV4W7tfC+gAZecYjqzrPAEi5+FQl9bE8
	Siqc2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hgj4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 07:46:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso4811151cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 00:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783496763; x=1784101563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ms80Nx4uNUP6/6LdRJl/Ke38PLjN2iBp215HZExUgfw=;
        b=dV0rhN0KW7oV3EnthNU3a+o9DYVJcVpBwwFSA8HdKFmE7s1BKc+nDNbVZs1E+BCXtH
         YxZZwY72EEWuG3if19j/WsydIySZfpPPxiwJCxf86TV6uuzIhM9pIlUVvSM+8Isgk/8Y
         RYMYxdZN6DBLcCEFem3ePLnZOKRwipFILeWIZ7Xv4jhjSbdJF85dHZXTrdAtW1sEnFMi
         qmSGBRE8GPcyYXx3+nU88LPtwUxVYdcsmyYbg2kmm+jc2bTgJsEbBsiA5by8U1M1SvcW
         UzJT9zLosAQp/MbK/uxvI8B+pujal3a+8Ze1FXTcFwfrBq/e0quwZxAQaYDGWfidcyxu
         eVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496763; x=1784101563;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ms80Nx4uNUP6/6LdRJl/Ke38PLjN2iBp215HZExUgfw=;
        b=Wl5XgGZjLBTZUyimH8gKRne24DXKZ541gUOflp4CcVkbJd6scX4UxzLgGjoILu4Dr2
         lc5tzW8Fi08rz6Pbk1bpNgIuTQ8Fx0NJRRPTwgjPGW3w7f7QcnZHVssQuKJtQGIaMzwH
         904G3tjwr1g0tzUMg4Ew2oLIIpnWerBlSIyGObLU9IrzRgAHxq04JnvBl4VyvkVnjTWd
         luY/Tlgibs5vnzVv1wxuJjK59NkCa94i9MoKTJ7LCkT5KBhNOEMj0t+t/YTBVUT2tD5j
         QLCpQInpNwh/FD1mjsH4iNhgacEQzDZFvBn//NV3/MpJPP+RrVfh9wGxcrtcFDFPrCy9
         d/2A==
X-Forwarded-Encrypted: i=1; AHgh+RoOM20AJrKZBXH/TS4/qJjG2ICGzjLDN9plRkW/q7sCKkxK6HMOUIAlbNpVs/MjesMIvSwn5YqGMsTc@vger.kernel.org
X-Gm-Message-State: AOJu0YwxEATKtYDn6nxUzQ2KWpZqkRjhhvrtHLGELCyxkkH5yeup4MPt
	JUg38LEza+bLKIExRSoZRTi7V16f5QJNGD5z9qDfTTf+gasLcJvmnFmLOB+0tGByAmbNqDmuMyW
	7Yh8JXCddk2nWGuiWgQKV+Xzp9vg9dDGQGSafqb3BK1yfi88o7MSEPeEHddBPP9EyshhSCKv2
X-Gm-Gg: AfdE7ckLKnyY+IU+hreMlmEFvHlke4HxNng7dDBazKJpag+VjZBkMj0xDsOmzmpoNcx
	CBXGEcTlPbHvoFWsk7zcLu8shJFV87ITOJSny7vb6MzV/dDO+EvCZlwgF1z0fP2+sFxvyp4WaHk
	wqRC/Uc5L67kROo/fY21h94bu8d67uRRyqQjl2nNwYDXLqsmRKkynlmOlqH7sWOsrE0FLlwFGN8
	wYe5/cvY+ks8Xd9asKsJ03mGS373BXc1Z5PRtj5IyjFJPXDO9o1Vf3N+N7mg62BdSlM0Q3juvyR
	TVB85KpzOqujfoeejPXRUH/JE4zi4GYGSSkNJ7gn4so0qUKsX5QJRg4XdyUTxW7zC/7aX2hCvH8
	6eVn87ny9TgRHwrOKNQmF8e8xnTn4E6cN2nWo+A==
X-Received: by 2002:a05:622a:1819:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-51c8b4d60a6mr14014101cf.42.1783496762953;
        Wed, 08 Jul 2026 00:46:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1819:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-51c8b4d60a6mr14013971cf.42.1783496762505;
        Wed, 08 Jul 2026 00:46:02 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6d02:5f1c:554:8e46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm106596135e9.4.2026.07.08.00.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:46:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Cihan Karadag <cihan.cihan@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shuah Khan <shuah@kernel.org>, Bamvor Jian Zhang <bamv2005@gmail.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: gpio: add gpio-cdev-uaf to .gitignore
Date: Wed,  8 Jul 2026 09:46:00 +0200
Message-ID: <178349675024.4592.9940096887390171016.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707235707.1349969-1-cihan.cihan@gmail.com>
References: <20260707235707.1349969-1-cihan.cihan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MyBTYWx0ZWRfX1+g/FoSoyyiJ
 MQ1ycPgRD4vyKxwCje/isR47By9Y2iJB2W1y74xM7KVvvCYaPIoHVn3ifGM2t+BR3BLHtXA2StJ
 yLwDX6f0r6DkoGSWFJM00TK9FYW5D859dKUHvR0mfc5E+rSttUmp4Sh/qlDDpFn9rlitaN6z/ED
 ZPFaEBzvlnGasl6Nl7h2gHWNpEOxH2CvzO36jTQTzeW+674sZqHhJyhh9qQVHng9ZQr/eiRa8Xd
 Eecsw6vPC58eGa5smKNJiaQCnQhHfZz8DJwP4djUGtMvvxbJ3oc6Z1vF9rOkswh6vd8JBhyo54P
 cROTCvctfxmC87vSUjMCj6H3PlifNDbaKj64EO4V3PjDy8oZTngO6Y1wExPTFIWSqGD1q3WoE0l
 82OiMCuwAlRgdykokFoUNEjBslcWhwDsWbTW6a09GzJI87+YxDfo7sC3amZ6A0K5J4xD655UsYj
 dh7jJrpZADeGvgLniTQ==
X-Proofpoint-GUID: 1-ZgoL-3mEPw419xYxenJVsA_UikQluA
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e003b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ULS_bruEoBdKV6tKf0IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MyBTYWx0ZWRfX3mlWCClXhU/o
 Yi416nN76nd+5CmkZUJmHDjFRgrogx8dj6+9ey7jLwAdwNIZLDjiK+WfJX6t9jISdLUjOSUjgBa
 v4TnQ7wPFuj8ih9JFEefBr6sn2RRakE=
X-Proofpoint-ORIG-GUID: 1-ZgoL-3mEPw419xYxenJVsA_UikQluA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39623-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:cihan.cihan@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:shuah@kernel.org,m:bamv2005@gmail.com,m:tzungbi@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cihancihan@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6A1D722D5B


On Tue, 07 Jul 2026 17:57:05 -0600, Cihan Karadag wrote:
> Commit c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests") added
> the gpio-cdev-uaf binary to TEST_GEN_PROGS_EXTENDED but never added it
> to .gitignore. Building it with:
> 
>     make -C tools/testing/selftests/gpio TARGETS=gpio
> 
> leaves gpio-cdev-uaf as an untracked file.
> 
> [...]

Applied, thanks!

[1/1] selftests: gpio: add gpio-cdev-uaf to .gitignore
      https://git.kernel.org/brgl/c/4ad805f0e41acf56ac54855c666d34c59ad66fe7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

