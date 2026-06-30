Return-Path: <linux-gpio+bounces-39228-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q34kOYHOQ2oiiwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39228-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:11:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236E6E5424
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:11:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FGvGLwrY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CDu7tQSG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39228-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39228-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4F043122BEC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2144D419305;
	Tue, 30 Jun 2026 14:04:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAE41325B
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:04:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828243; cv=none; b=rPBLhP9xQC2FS8F+TpnexGQy33x96f6+tqd4Hr9gY3/OqB3CIEArqdNkTGzFJyRsAiuEbkEzuHF+cUPbgn6CThPc4UON0JWld4dEXplw+33mP3QXAT7DEPdSgQ1UYAy0vyO7AJIHzloT8bW629+kNavXcvJTtY2Lt1vRT0wfvfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828243; c=relaxed/simple;
	bh=CGbDgjzoLBUhO5kTwYuy949JFhwzphj3T+tSCFkSWzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+Hyh2+1FzseLCxbGNtcaygsrK2qONO31GnD6ALVty/kJd4IncPISjGv72DU0AGzNbDgcOzX8dhPQill47Qf4uArm3p3JudEWW56yAYQHbFg3RoMvOZJii8dCQDRt1gPsC6z1sO3DeHyY8lmn5ZlzcMwhgZoD2WIsCNZ+MVYW4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGvGLwrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDu7tQSG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nNtn1590876
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=; b=FGvGLwrYQwb0wTLS
	Z7JvOlsgO0GP294YGQUWXMPOV9SQTnVhfYHluhNk0Wwz718qWtwD+LbPR3RIaO2Z
	/DrgzXqnZykuY5S8OWJFpE69CkxQq7SgXnWGaACmV4WHiQPuy0KG5aWs89ijZem8
	qvDbZOAPwmAZGRnS1frDotFS5V8JnSKUJzbQWMTXJCV64YeK11g7mm5Xm8e/B2ST
	j9mcDfqKR9Q7dlUe0BEM73bHP5yaxw6+2JniS8nDIi7cBbi0tYSLhBjtWqMZ0urO
	/cgqY4TTo88BLrAlPrSt/fpatRnNfo7TJyxpFYHsSUFoPWdZ0omiRALqpBQuhG7a
	TZny1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3w77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:04:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fef645b85so1777567a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828240; x=1783433040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=;
        b=CDu7tQSGPqOmDv7PzvVhSlo53qg6ABlspNaUELxzI4LtZU9dw1v6HYvIWbYaYTrwGM
         ZVxL/k3WZaAzWSad5d5ocu3lTl/jTXUVtsXswzafWZkCwplwXdZRQNUBuMLYrXOoxLYf
         e/l+/gWVFXIJ3nXoN/bvoMFvLCuiZhgsnazblz7+jp6FWR3xYyYi4oqlYmYIMKE7w7No
         dnQmV8KPkeP9jawH5QAEDGrll85kiiGqNiUsvChHyRlBj+VSwe0qn2qXF4bZLhtmdFZq
         /iOId4/RU3c7V6zSaArYam7uAv5iXWU+juuW0SIBeUhNNBlLvtMZ2KklCtVxRqDs0KBI
         HM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828240; x=1783433040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=;
        b=iMWwvaNjyilLrE2VIDYlshXu/HfTnQMUY70pMlnhQfdPuNKIuuIv1+XDfLDWNi+rXT
         eW+qsYNQf5/iMf10jBnlJ4oid48Ygcb94+1JlnWnPPgUQf10So33/Kwvo1Mw+kWwLh+w
         wCdPcFBt3wj/j6295RSD4vgvyoYUhptXGT4e1wdk+H/l01v7W7+R0FmoOOiAoYLNkMOO
         gIgESck9tP8lCV9yFrE+PU9aCoAJXJOMicDbq068rfkLndHPWGd8FiBO1P4aN5oN419e
         gchPL5j/DQUx1r8PVWNkk0NuZPwsWrLUAzO/n1OzWyCe6eK3xln1tyMThF+YIHVdhkbZ
         NfyA==
X-Forwarded-Encrypted: i=1; AHgh+Rrilki2oJfvJFqujxRKbcp5tBTalE2AAp8j1cPmlEQgbHOVjZEiibnF+CHtBDbqDAC04V5trn1yK+Iv@vger.kernel.org
X-Gm-Message-State: AOJu0YzhqCm5cQN4md8riXOCpQfoQ3F5RcdOhiJnYptzexehUcpdPDiv
	JcGnsSXep6yrAGIaGukhP+MEQGj1GGvTD6bgLljolCKsgNv2JvsdsDuLEZ9BR5czxjv3Zpk1jnT
	i6mL7dQUQzXIT113eN5DtgW3148SeaZ3b6o9IESVbiZJrq9d/y/hhLTovlHj9yNDk
X-Gm-Gg: AfdE7cn/EOyRJberka7Hk8O5ZNdO4YVHo2S85XT6I1pnPIDzIDo2gz3J6ZdleiDJtGR
	TVXZ0s2jiJESmiqbnpBDDrrNsj4+khxw/b+OF2nmfKsZIHhBP2LCzQ+Z203SJkG6MNlcpuE9uGu
	ZdK1gvSaIwR2+QG9HcSFyJ5v0218ubQeJ9VtfVWxeH9+/8vfhXl/pTQCPt0RWd5yO9HlJ0CsFn6
	L8CWF9pv/MXGr2Q1lFPFbav8OG4bIrr//7JokK7BZ+jVQBgEa6dTvEWtskS97AW8+6qqealKAKn
	iISVwmJHCacdEmLGFa6NR9/ojJLV9kmFv6YAzqNx/DMOE5njHJlR5zefyMQSxpC2dHWE1KYh0Kw
	+yaijX1EkBKVLmWOyBQqZJFA3DU8GSv8ygqQtDR0=
X-Received: by 2002:a17:90b:4a51:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38052733442mr2797959a91.16.1782828238892;
        Tue, 30 Jun 2026 07:03:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a51:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38052733442mr2797918a91.16.1782828238391;
        Tue, 30 Jun 2026 07:03:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be171501sm1600495e9.15.2026.06.30.07.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:03:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Viacheslav Bocharov <v@baodeep.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore meson non-sleeping
Date: Tue, 30 Jun 2026 16:03:52 +0200
Message-ID: <178282813039.20935.7644113033947538749.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630101545.800625-1-v@baodeep.com>
References: <20260630101545.800625-1-v@baodeep.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfXxcDmyUUSLCuh
 3Y1SzVlAR/RsMW/+UyGEopknEuIMPDD6QmObmeNoIYuaA1aILiezN0xqadfEcKBSTQcDaq+4O2G
 nCqc7bGisrgJTlq/3FohOEaRJqVSfJw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfXwZ3jk+pDTq7S
 uNCdHtVrvvCFg4Q/Up7c4pgFFu2x3XkOhOVu2NF+UxFIT0m/2+A+vqadcD2CSIk9Qiu/3ALH8K+
 P2dDCAqADAS35icIKY+lBKpmYePJ+w49TBjXBetTDBvbCq0eX1uDVuzqAI64fJamhEgnMzWrHjg
 iT5JmFijaPvrZeVU/IkkvKkCTpwdeFbZYwsVTbgCvciNsaQ/LJ3XQdTlX8MYf6rucfP9FhxYTQv
 PB5sSvnK+QCiG2ktl8+ceZShuktMHmKxE8Ob+kKq1ZAqNPRIzDYPdWfrukSBj6XvZMSN5lslYQ/
 Uy+poprdguEwULQSMrw5RshMS8dmhuXlXBdWmbJq19vooDQ+TLKWnUtmMC0xPDBWy/+OjfAlPDN
 NhepYclHOuvaZzBpk3BzDhFk5M4LgY6d242NZU3xQ1Qc726VbfLruUE4p1EPBTxiT+hOSu5t4h8
 rTuX6JpuasCeHjwM6nA==
X-Proofpoint-ORIG-GUID: 84LgkwvRPfSEjNJ0XRYGbiP-bU_7KoZM
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43ccd1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W7lOHgCGKF-i3LWV3W4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 84LgkwvRPfSEjNJ0XRYGbiP-bU_7KoZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-39228-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:v@baodeep.com,m:bartosz.golaszewski@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5236E6E5424


On Tue, 30 Jun 2026 13:15:43 +0300, Viacheslav Bocharov wrote:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
> 
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
> 
> [...]

There are no build-time dependencies between this and 2/2 so let me queue this
for fixes on its own and Linus W can take 2/2.

[1/2] gpio: shared-proxy: always serialize with a sleeping mutex
      https://git.kernel.org/brgl/c/efecde8a254d1f207b75c5ebcfba2c51f4c771d9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

