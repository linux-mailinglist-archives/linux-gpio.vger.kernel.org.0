Return-Path: <linux-gpio+bounces-32025-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFXVF+UknGkeAAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32025-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:59:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C049A17468E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C04830467F3
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E227355026;
	Mon, 23 Feb 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQ+fu/Tc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtdK7ETA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2EA3563D2
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840653; cv=none; b=TCguyYs3CAV+rZVftwJ/L6pUp5KHDtxbwHzloGrEKrC3cemAoTjXSPHUj7FUnlKhyMpn0ZMjPfGgSGiuhgHjhed1Jf2QTdREwN5q47XNOcpq/DQOFp7xQZuBEYQOdDdgTZ7qTqebiZkT/a/ayrVfLtiYTdKaJb5Ar1QpU9Jwe9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840653; c=relaxed/simple;
	bh=Tndfc3wJdGmzxvMibn6GgX0xz83LjiQ5q6RHOvNjt8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T5TKEFJIWh8iWF7RZX//O1Qm5g5FvbAZYaNaY3NPd4aoMH/eOrn2/SWkVXHdEccCJnYKCzfvbZRxbMrpKqlzD/b2pl+Pr7LweQKwDJ/SGaMyMKmSRmiyQd+KjhxO1sN6Em21pxFumEI2qJ8DS92xFAz9Qv20N9O09EAOitC7uFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQ+fu/Tc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtdK7ETA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9jlco1953696
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvg1XiO2kFpCIl5/51S4HrNhMoZX6SHWX0qjQSabSU4=; b=aQ+fu/TcZhShHRc6
	YWU51ERJLaX3fcLZMGVLdQ5BlR1dbtBOO20KtmqqG+3k02kpr5CiBj3Bf5a7P2Br
	uETbUHkswCKwQ5qHV4etskRNt0shyXvIPyea0cXGPNiehmRXwV0Vtf0LXOvTp07K
	haLzdOimhp/okxAYw8EwAM7rKuOVn4XaN4Km5hDFWWp/PiFlAeGLF6rqqCFStXhN
	hRH3ZOKepdYYdb1Uu5FeA2hth+9LNf6MLJin2ctT/GeyZPAiW0hi/GQMmHA7yRE1
	wsW7NxWS5ZqvxFxTrKTSMgqJoh/8vmbaoo93ffFEDw9wUwFLcWNad2rEPgCRkAq6
	Ja+RUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc90r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71500f274so463495385a.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840650; x=1772445450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvg1XiO2kFpCIl5/51S4HrNhMoZX6SHWX0qjQSabSU4=;
        b=jtdK7ETAH5Gcuc0pw1dn2ojdxnB8nYXdzCg7fNKhaFWR6EUWJISZM727GV4BdDdjFS
         IF5tURQLmRlOld6F+bRlM/MxJBGPj/x2BC9o4Ci751wNXjhwJ/QqUjrSU4Hx4hLNeOdY
         oqwc+ltJF7qBJ91qzU3pXwtwnwPud81o7QyAX9Od9EKgtPedIA+KIk5g0ag3IV2DCdh+
         1kZ/B3UR/EOt2LtbX6ntFMVTf1AqcUfxICK7fqp/o74nMhgJDWDxxmQFHOz/08leSUwp
         QeDrYS8mktqERIcwP8vSMAcZSph7sogZjNb8Wx+S7EyfqVpBrQ0Zi+fCmoCgO0IsoUtJ
         neZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840650; x=1772445450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dvg1XiO2kFpCIl5/51S4HrNhMoZX6SHWX0qjQSabSU4=;
        b=AS1zSTYEImpYdVsrjy8umSVx0dp57ASm0HfTA3DMzvcXsWejbk228IFLF+ASeaZaYE
         sSMDzEHeo6hldoopx9BdwkTstidhqmUY+q5RE0w2Vsda0otvDLbmbAGuD8vbxphq+p4E
         MixIumMW9YFIcof05ZtEjX1+KHpNGkUPNGpJ76OFclWSj73bgDEQtIWaLBvsCE114YMk
         EeOMzFeI+mf+YZBQeJUqV2u6r59cEKXvL9RhNjhdup/zJh5qnid9D096QTCrpP5KHJb3
         zPwKDcxHQluLvvdubMkn3F9LXwvWn1RkLfDYjtbCEqZKWn1SWd6wIdoCzr95MQJFYmaa
         e6SA==
X-Forwarded-Encrypted: i=1; AJvYcCXiG1thjT05mwiuvt1GdHVvuUVa+RVy0Qrz5Gbqnmm+nzAwynd7oV3UQw3en0IoGlSIsI6pDWBAh3xR@vger.kernel.org
X-Gm-Message-State: AOJu0YzoJGjaQp0DHBMs8WD93ny5WeYVrE9cAvmTT2zxL9QLZlzPFPGY
	fcYS9OFyoC87C5lcdlG1zzjlPDREQdNs879q5CL541j19XwPlom6Maxo3IbhjkV64vM/Ht8Cv39
	sbw1/MQptncWNCRNUheWDU+39M1j9GjVNmHQdMc1LI6RgsVxzr/7AK4ZZxshZMRjF
X-Gm-Gg: AZuq6aLrau50plnrPUw/3rzerSk/CdUilF6ExAAfZuOt/+wXHcugEF4t30UzwNribWa
	Ro7gD+pkvDtw/EnUgO3jCvF/m6oxC6z/svg8Kk8PrQGBcG/6KtzIpcSjUvEKq4Wpe0WO7EQiyjS
	GTMOpfGwBrdSMhVAKt6SlR+cMyxgRkCFILbEkcyw/Jodz7O9rGSWZoKGY+aBj8Dt1S9ztjd0RvY
	wI94q5cnEwtAZ70pBsEs9vipIBHaaWztqisFdJxSLv+DVjmFtt+U2goWtYsCo2+qRe5Gc1V1hz+
	npzpD+uIK/7ZsjUXP/dE3YhRezk8WhbxI8oesSUSxwVmdd2jxDUkC98ijpolf9lbCGxUM2CNGjM
	aGcDO4wxWbYRQwwu4DMgb5L3RNrD6Q106XOJF5l6yU/41+6q5LRc=
X-Received: by 2002:a05:620a:1994:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cb8c93e6f9mr1023316285a.0.1771840650356;
        Mon, 23 Feb 2026 01:57:30 -0800 (PST)
X-Received: by 2002:a05:620a:1994:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cb8c93e6f9mr1023314285a.0.1771840649862;
        Mon, 23 Feb 2026 01:57:29 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm275752805e9.3.2026.02.23.01.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:57:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix handling
Date: Mon, 23 Feb 2026 10:57:16 +0100
Message-ID: <177184063426.89486.6234449273578156163.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217081431.1208351-1-pshete@nvidia.com>
References: <20260217081431.1208351-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5g0V1H21jFzrPT_NDVkAakogDzP2KU1c
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c248b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wUYQds1HYIAdow92arIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5g0V1H21jFzrPT_NDVkAakogDzP2KU1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX9cRP2DlD80sG
 neF0E/N7+WTEw6mkIZKt2Cgssq2GrVsFoDu3aziOHf/bPwHBVyqbFoFQSoqGzPmSmuNt05lUgCz
 LDeZ416uovPm9t4sYHJyw3k49PGWUJZVuADnkKh9+JbPdrDXwUEAbv5O4UbTQ474sf1h/jzgM1x
 tCOnjJAU7TcfbqIyg8HSpc+kCyW0hbq3CGdCgodMoYYQi+nigUK1GPGMhyHBO4s51Ej8KCDb/BY
 +wsOvfPKNkhhsCJS7f4tkobswKSo0JPPVeqImiy4oHZcJXF3MoX/h4b0ldBIKwBrFrUc7mONTZK
 Qfm0CkAFatJy48adlzdea617Dmw+BU3QBksIF/psSUUyh0jMCIdBrGGCqYATaRR6Sgr3S8fJSlM
 JYYtyztFc1ISd4M9v/1PFOxP3GFlXaI2FlmNC5xjfrzwHKK3/xQ77SN9Tu5NuKQZGlmA1PJfrOp
 RPFZFTiHpG/UxrNbnDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-32025-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C049A17468E
X-Rspamd-Action: no action


On Tue, 17 Feb 2026 08:14:30 +0000, Prathamesh Shete wrote:
> Introduce TEGRA_GPIO_PREFIX() to define the Tegra SoC GPIO name
> prefix in one place. Use it for the Tegra410 COMPUTE and SYSTEM
> controllers so the prefix is "COMPUTE-" and "SYSTEM-" respectively.
> 
> 

Applied, thanks!

[1/2] gpio: tegra186: Simplify GPIO line name prefix handling
      https://git.kernel.org/brgl/c/2423e336d94868f0d2fcd81a87b90c5ea59736e0
[2/2] gpio: tegra186: Support multi-socket devices
      https://git.kernel.org/brgl/c/2c299030c6813eaa9ef95773c64d65c50fa706ac

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

