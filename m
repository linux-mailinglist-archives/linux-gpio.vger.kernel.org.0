Return-Path: <linux-gpio+bounces-31423-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHnoEd8bg2l/hwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31423-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:13:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C636E4534
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F3E1301907C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 10:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA953D6679;
	Wed,  4 Feb 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOOwuMYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2+4yvK7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DE3D6671
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770199995; cv=none; b=fcmcTVDbI+QpLEBl3LNFvBz+Y55QYWwL46zRTuB4GLYqVKp8m5GasQiJs5S60T4JM0vX4pOJyq56RgqaIJhplX5Ddq6x/JYYQVNPK4f0uZi7HfEvVb7o6vrQnSXtOTf+K7hkcq48KIEMPQmcDWjXqz7SXDzyy0DrWqmCofsBtcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770199995; c=relaxed/simple;
	bh=hSr+3DkhuTBLC1ZfqOWGzt2/OnptmSjLzpO3fr14naQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s3XXSul6nFoupIQqTEl2xrzc44pcBDtbSmIOI5uC5BH9f0lPRFCyMm1Hl2raD8QrM4XKcAtRkh4nwJd1c3Um/Eel6wlGYJZMya++8s+BLYMUies+bUvnsc/yDp5Axdpwi3NEYEK56wprXOWekbkWaozUJ0eha6ti5AMod6XSy7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOOwuMYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2+4yvK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6147EkTg1505095
	for <linux-gpio@vger.kernel.org>; Wed, 4 Feb 2026 10:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/6g19zllu1CyIYxIc77Lzd8D+AGpB8pGSv9LnXDuYk=; b=aOOwuMYV/1/46lOw
	GQawbMvilp5VR/6MtoI4Wx/s321mybbUro8tybOtgBfWhRD/6GYUo5cHq4buEnAM
	gGarvBYOWsPlzewaEhvhCsM9QslWokn40VxCE9eWJ9WGDkrkDIjETfGEPtj/0wMS
	ObmFlxXuUm3RYP9Y7trlnVHtQx0G4ns4oUh02YOLtSNWNNC75y2G6rgCL1wMqBjy
	tD+m4w2JkfhTw0JWLcKjysIqf1W2zuw5B8/lzMeDYf9tvTvStLaQlCo07E2DtK7M
	KuQDTZCCrshexvheDHoOT4yE57uSG/g4QdYVPI+FtTYBkk2oqpWRjkRRuTzZ2Nur
	jk61Sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3kbkkfu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 10:13:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70fadd9a3so2383100785a.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 02:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770199994; x=1770804794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/6g19zllu1CyIYxIc77Lzd8D+AGpB8pGSv9LnXDuYk=;
        b=G2+4yvK76fLeruHloPrkZgEb7S9i+vbtP3N4N88XklKlhZk9FORAc9wtorfAlffnKK
         12GNo9/xRtQ3CYFzNgdWK+jTyGnsqCK/4Fy+MhePyntAMWTZ35hq5i6KWc6Ndw4oj12y
         HyXxJU2U4u3063mXodr86vF4rJK8Ozxlf2bGS4j873BXSotvA3O9dkmljlQwXLJjFjK6
         xF/a3u+jd/woqcZcEx/fYNVVZpqnA8yW7llQ3WkVHlNYwJj4ngdLEV4a1Uzsjn843H3+
         uZLLjaIcnPIBJZX5pYqI5xZuhO1TzU5kT4CxDcUEmL7IAcV0eYKICmJ9zeBBDk6MWc0y
         p9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770199994; x=1770804794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/6g19zllu1CyIYxIc77Lzd8D+AGpB8pGSv9LnXDuYk=;
        b=xE1CgDJMcXQjGsKznwY0G9tmcv9PXzOyHNNRk51Djm+EJK7svzYSP1kTRbbr0IymJE
         wh587KYTLECydBDldIeHFqletPQ78pbMvqKsIM5OKQW2tVsZpYhRXMssKFR1+KzzlfOP
         NSl2BHFucMyn98axrwcLtbuSOc8em4E3FC5IYPJlmRs0eJr47yyALOW7L9rkvOKZDjcC
         IwXZ1zCfniLlcechapnICo/F5QFEauHf9kAdPjngXCwS8E8q3TiML3chk24zQc2mLhpc
         +0x1DNnN71HCLKf/AGFT7bkgYk0ymQUgF6AUDXC6cdeIjMlwhZZXe1JxXoSb8b5rdOCw
         H+ZQ==
X-Gm-Message-State: AOJu0YxJv9xMrGuCxvPe0XV9DKsYhnBZ3VV2tIB5PT0BO4IUrh40Z4E3
	tgDAg2Bl30ZvJDrjd02VoSMWN7ocFkq3qshwil2sYAfMsw3DAeKiGMZUjhvdVlNnKBc6QHWNsWm
	pTU+40IGO0senhO13ELEy7CJcoREiSmJJQ+yirrud9BxKeAtjkfFOjkXLlmnqdBLyj8pqZd2P
X-Gm-Gg: AZuq6aLIa3BoKaVe0th+cw6IK3o4Yq/WTC3kCj1SmfLEemkUluJobH4XMMvPgjh/KzN
	+1fB605cylo9k3TZQJNu4Xrh/a6aXK4GCSjUo4a3Mgdf6HSnS8aE4Kku9LF3+Fm+iSophixuAry
	NI5ak2i7xsZOjTTvfnAapcTTzeXNy4BmJ6xvaLzn1+W/6UVDxw4V/OhWao/he5t0w0dU20DCJnN
	6kOHFyPNQAro7q+t1U35HJU0GXO+nvgrNzWqj1sKsia8nSjMSlRnVAJgRzNPOtDm4Z5XbY6zi2S
	z/CyaTsMtaXQ+yewMQoWKjn6M1zdnOxVpLWq5jUCy8yuEw81tFs2CzVQ1wwZUq/nY7LK0rIz/bx
	6dZDmyhS7U/B5K0hgjk4TNnp5ImT6w5jVdlMo
X-Received: by 2002:a05:620a:4506:b0:8bb:1a5b:5a47 with SMTP id af79cd13be357-8ca2f807305mr315918385a.17.1770199993741;
        Wed, 04 Feb 2026 02:13:13 -0800 (PST)
X-Received: by 2002:a05:620a:4506:b0:8bb:1a5b:5a47 with SMTP id af79cd13be357-8ca2f807305mr315915785a.17.1770199993209;
        Wed, 04 Feb 2026 02:13:13 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fcc2:cae:2a7f:59c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805f25dsm5575037f8f.29.2026.02.04.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:13:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Fix gpio count with string references
Date: Wed,  4 Feb 2026 11:13:11 +0100
Message-ID: <177019998811.9840.13337538910664862668.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260129145944.3372777-1-alban.bedel@lht.dlh.de>
References: <20260129145944.3372777-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uFj4I5CwaEYVIZMD3s7CD-fwvgHMFzKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA3NyBTYWx0ZWRfXzDR6+YALC92Y
 1RhzU9U/L+A8rA2fyiIXDJLK3yWGRhowNjUcXzzOcMYr+fYvK4hvscy/eYpOTeXc2/OitMIlCZA
 57Ew9fqJukJgYdPnIo0Kk4WSffzGq4AC8a3WLvRoeTq9lepz5DIVLaLQtunN2A4UohzNNu+xKwT
 bNa1ob5/z6vMH29p4ehA/mCTaIBkPb4cFjcDs3X6fw2Q9RuyCZ90zekNE5A253Ohd0IKM4TVCNm
 4uK2m2ng82VTLOFFKD5yKAUCfHBxtpO+CKePOMJ4jMbt+tpiDt6XmUj6NATgrx2EbP3vRO7plBP
 bMSruFY/5kq4FQ9Ob7Ndqwtk+7Nrcvu7eIDscofcd0JdpRDnPCPPGVA9ZxMU1HsXoFNkXdn3wm5
 34YPvb+dg5qppHtqgHOaXoNHXSAYMeLvIAA0/5JBtoIIxbBGdi1mj4EF9dO3cjS3+Sshxr1dEk3
 QmSlLXjeBUrzZ2bvYhg==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=69831bba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NvIUnWIGczD_N1uvXP4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uFj4I5CwaEYVIZMD3s7CD-fwvgHMFzKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_02,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31423-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C636E4534
X-Rspamd-Action: no action


On Thu, 29 Jan 2026 15:59:44 +0100, Alban Bedel wrote:
> Since commit 9880702d123f2 ("ACPI: property: Support using strings in
> reference properties") it is possible to use strings instead of local
> references. This work fine with single GPIO but not with arrays as
> acpi_gpio_package_count() didn't handle this case. Update it to handle
> strings like local references to cover this case as well.
> 
> 
> [...]

Applied, thanks!

[1/1] gpiolib: acpi: Fix gpio count with string references
      https://git.kernel.org/brgl/c/c62e0658d458d8f100445445c3ddb106f3824a45

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

