Return-Path: <linux-gpio+bounces-31782-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJLaH8R7lWl8RwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31782-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:43:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0271543B0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B861A3022577
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC3C31ED9D;
	Wed, 18 Feb 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmhncAiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KoXjuQbh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C102F49F6
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404225; cv=none; b=LYrZNL2KzX0SX6uYuxbsxZF1eoh5xgYU7POSA2/brZy9dXAiAGlcKffo9K3r5Kaw3kD2R3Oerlr9++pmw0Q0EACA7YH54EgPSzua56LRm9QgFNhyjorOzJm/hsEYu84ULpMwB1f3OoB3VDzlhUbh5pNy+GEGR4rFwavYI1l/Yko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404225; c=relaxed/simple;
	bh=5y0xVMIMT9HfSlhbCXdsp3bHQnGHM96nutlna3Uset4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJzUjgP3QjPLRgrfv1RoSPxoIbGR4kDAbUKYoQnGZ3qH3GrR95MLtl9a84nebcN135YzMRsp3URmCV4m2Pt7x00cIaghy4yKN69DUq8Plls5hLmaYKxvNI//J+3vtQ9tfCLfLz1rkj78fk30Sugs+pEFUrf6YGjUtn4tTAFTYVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmhncAiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KoXjuQbh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8XIiN1942880
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ub1tfzU3N86F1qibvHPoQmxODdOBXatDnbOgh8w6Pxw=; b=YmhncAiQe+ScTnyk
	E0EPQRkloXTobGaW1CjJq2rDbinGSXvvx8Vpv7d90EDPRfheHv1v1w1OLvwp4L6h
	a9ou32ugkBbRtrHU1vv4L6xa49QM6KRuaU4TuHz0Ks7wcqa4hsBTiFnlolat4ZP+
	0Su5FcQAG3OVpKPglrFUsh+fcrZdP69RiCcq6E/bebHiDMfdEWpR0SbNyHzsVoDh
	Zzug1cKk25GD6JgdgDHif4+pDFmAeEXYUcvU0YSQANXAiIq4vCjRTXZXRzN98uBE
	WJ/+02Qc3dLA6jUDyuXPwBAz8wgKBarIeBG5ho81vdc4s4F4XQVuXjC+yR0j3ZA+
	2vRduA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g3eg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:43:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so540384285a.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 00:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771404223; x=1772009023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub1tfzU3N86F1qibvHPoQmxODdOBXatDnbOgh8w6Pxw=;
        b=KoXjuQbhf6g+xLR29zqqwyi2KNU0r+4NZHxbY/ob/sfSy1MWtVVniFNS+jiXEyt5x7
         podb+R5G0KhA+5u/UZkDpGZ4bfCgPyLZjhwrLlxGgb0Er/9XaswQIK4Urd3ynO/xc4M0
         Q6GnDPIDMiGhwS4+PvyHOjAuZj70MX141ZBGo14ERY/2Uu9t9/XhyL54BMA+PfM9nLBQ
         1iQyRe+3vrZ0RH8dqTTVtODfHdXA5LI72aYnmEd4cQKpaA+78HaNxAHJ5PSeGP2gKXP1
         slCCfARA1G3TGNKGfUrm4l/Fsyq1SPy6D/vTia532o/043DuOMTICDnjkv6+UaihQyp3
         Sn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404223; x=1772009023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ub1tfzU3N86F1qibvHPoQmxODdOBXatDnbOgh8w6Pxw=;
        b=AcoHb9SuK7634vzfOzU+oYWSA1AiKNNI7OqOi6S1VjaYh1xxE+0a2IMpDSBDjGKlQq
         PcxJ/xz3EGmOtYr7rNNOdGzWTRhk27EPcHLxbHgiqLH2Zs8wIK6AnMn77uNguh3ekzpJ
         PfqnVUoRUrYGZ/zm3L1f3V4747w986iHIwYI6nyYu4psgzWY04sQtDD0alE1q4p/goPK
         05akPXeHWT9yw/j71OsemIo9aW5QNhI/2Zh7UGsYRfZQ7ZM5bbF5hKBc9dTrF7UzSWVj
         /BnpsT4Bfqg78TC9sIeVzSJvONZ86bZmhFcIiHy8HZROFdxz7NSrLdT4Ta175/gBtNu5
         ZsRA==
X-Gm-Message-State: AOJu0Ywfsnhs+y2uMWwWH7hFDolJRYSfssShtq9W/hHQLclXN64P/RCo
	ZHFoVEiEj6KPDHXuwdJTgT63Usyydnboy88ybe4zqCKaU5Vb0lCQKuAF9hhICETtwBPQ4Ufet4s
	dOIdkh9fBr4l0cVzoNeIgmw6FlgadLg9u3/CuSwBhh8qzVFa1q8eEaIE5s8Lo13f4
X-Gm-Gg: AZuq6aLNyQRYtDF7VQfJh5lb276zVIaIGT0Qt83swJ6zoJmgA5O8Zj1XAH1qNvTxNNZ
	XV3Pn1l/YGNEescelEO0EO8zqNC9hpBboT61tt4st3s9emVpM64skioAU8dsvg1nyI51pPTyuPE
	pXg8CnaEBFseA1zPKURRBp1sRoDAlAFGLongpB7hxdla4go2ixXWX0seaUkReoQGWcZhM+zscPE
	lNGmogPB6eNlkQYu1883Bq7++kdQ4S1xJDCPyT8psp02TLyoMJ/A1HL2qBYcs+Pt9HWOv9Wk7mO
	r4vcyMRQtbsZYd3Ki8zXV31U6a/B3NV7IaLgSPipXaRJFZ0TqKTNi6FV9WJJZVu+0Un6sZYGvvb
	tXrUdDft4Z7o1Cp4mdbuqGfqoMZrHyesMekkBPK8hRSdkEi6OtfY=
X-Received: by 2002:a05:620a:28d3:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb7415414cmr109542885a.15.1771404222798;
        Wed, 18 Feb 2026 00:43:42 -0800 (PST)
X-Received: by 2002:a05:620a:28d3:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb7415414cmr109541785a.15.1771404222416;
        Wed, 18 Feb 2026 00:43:42 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e11f5sm583750455e9.4.2026.02.18.00.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:43:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: fix chip removal with GPIOs exported over sysfs
Date: Wed, 18 Feb 2026 09:43:37 +0100
Message-ID: <177140420874.51570.17406774311179844096.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212133505.81516-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260212133505.81516-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3NiBTYWx0ZWRfX82p2ZeeK0Mdu
 SuF/m5J1SZURGSGSgShz02HD79j/SaJiJ2vaGe5BGZLSsJOfjeW/MU9ETKRCxwgUJ9XcQfSMrLA
 OYV/mIjyd/SGrqFrmUE/72jwGIcyAUpCie3FN1mp/tDYXVvrpeWpLYEVWzIGDD11yGunriGQztR
 ierHNyFhlQOuwM7Z1ZuO9Qb1KUQbE0tdShnta8bqK4ooIYjYkw44W8BZt1CcdVAmIE7+W6Sxcho
 usJUFMooS2n5Bukc7KznKvyUV4R+1k1bwouk8AfOJpp6zw6+0LFUV7gsUI0q/mV1JrEPqlcgoj7
 Qelj78zMa3DxlxLdWJoREjg8uKIunC5u/RttoFLBY5iXautEeRP+JraGwjw+VdTY2leQUuoKkcy
 nfpDjpwA20hCfj9A1QJe/DKgfGdjPkcTyf+97Vw/ITcR+K3/RfyLMKKsFhLIFyw1tGhCojgjMtW
 DZDciftIuN23GFg4+mA==
X-Proofpoint-ORIG-GUID: 8rcLn6bF2qI4Zy_NpTSoib6L2yUm-2k0
X-Proofpoint-GUID: 8rcLn6bF2qI4Zy_NpTSoib6L2yUm-2k0
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69957bbf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YdtJtDKzcB4V-AEGbQ8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31782-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB0271543B0
X-Rspamd-Action: no action


On Thu, 12 Feb 2026 14:35:05 +0100, Bartosz Golaszewski wrote:
> Currently if we export a GPIO over sysfs and unbind the parent GPIO
> controller, the exported attribute will remain under /sys/class/gpio
> because once we remove the parent device, we can no longer associate the
> descriptor with it in gpiod_unexport() and never drop the final
> reference.
> 
> Rework the teardown code: provide an unlocked variant of
> gpiod_unexport() and remove all exported GPIOs with the sysfs_lock taken
> before unregistering the parent device itself. This is done to prevent
> any new exports happening before we unregister the device completely.
> 
> [...]

Applied, thanks!

[1/1] gpio: sysfs: fix chip removal with GPIOs exported over sysfs
      https://git.kernel.org/brgl/c/6766f59012301f1bf3f46c6e7149caca45d92309

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

