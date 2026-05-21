Return-Path: <linux-gpio+bounces-37269-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zzZGD8j+DmpLEAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37269-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:47:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E15A5110
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D13430F8159
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 12:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931AF1A238F;
	Thu, 21 May 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCGB+nbj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYIzD5iE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139473D524A
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367136; cv=none; b=eKcKJ4NdAPcar1ewZm9KdII2uu2N4wvooQLZsMGdfSRWZTXcZZJhAUV3PnMdK0UXFv2Q+PVXCQNuciLz/rQ5YiI+AvX0p3Q2ESARjWgs7ZMmkAYGwO0L2MHXJI7YRYJQNd+QmLdPXDMSLwIACiWAjzhGY+xYSdJ6mPyHV3Lengs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367136; c=relaxed/simple;
	bh=29LvJ6n5BG/FhZoN24HBFLGVY8+IuW7N2nJzCmCZ7Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PX3Koi1fVZUWc+kukI0ZLmUFs48qpeIAun8tOgVtkkX6pZQYUrkPjCUaXyS6ZO68C2DF/n6Ax8Gg1lDmCrDJm0yRoBPT00C1AvjZeAnP1+ZfKtMH5tXoNFrajs/s8kAmcM+BXLpoQy5hWb/YOaQAO59zwAHmQ0VgJXgnpr36/Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCGB+nbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYIzD5iE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AM3P3556071
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQUbITDs08gMXlK4UIHEDWLLRqw6VLpGShWOzTPV1UE=; b=GCGB+nbjEHrLtQzK
	/WHpr1g2I0K4BoDSHNf+im2jdfO6YToC2oqrLgLGInOP4kugMLFp7XgaAyZZGaRv
	VI8zRaVfAdSWLIL+OM1Y81EaA45xMt15PoZ2Qc5GAoLNcSuwD6SIqCtbubg0r5Nc
	IY3YjwrPa0lTgH4YnCDAjxqqlUBy4wkG9eDenk4f05L+88b9W/8U40H2FxUTv/iQ
	Y5lvRZOld/vpLiTPR3hIANJlOspgyji9dOHZjNVnRjEhZVPLa4rjAgXIoIbEpNFI
	OGUEKy0OT0STPB2FaFd6o1yzYtygrReXcoUWhdR2RF0/E/AJQvnvP587XwQp0Rv4
	rel0hA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6mgvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso167808821cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779367132; x=1779971932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQUbITDs08gMXlK4UIHEDWLLRqw6VLpGShWOzTPV1UE=;
        b=CYIzD5iEK2mIY2f0ZYRmnqbdTTrC5IrOSMAeDoDBSwbrgLwyxlIgIkXFzZBPnptKto
         fcM7ErksmJikHL/fUCvN1D2PYxrR0zJqufZzwZCn6DemlJ0HKNYxTYfNC7Vf1nLWE+ir
         dKQXLJJzHPAWPBZ6v+hE/IzQBhFt6abjIYqianmKNkzrh1NEV4VI5Ps0rdv6YgEld+si
         ajnPKaM5CBBoXGrYkFIhq+4RywQjKCjVXcHq892bl657mDFjuECziqDRPBglfI8Qjb7r
         QPAUsbHWZygscQqVgPzMypEewaLugszk5IXQHkvGi1l1BY7YVzIbDeJ70C9YL87i8ud5
         GW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367132; x=1779971932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lQUbITDs08gMXlK4UIHEDWLLRqw6VLpGShWOzTPV1UE=;
        b=X4rwGLTSqmyC3ZJTBBAEogR48+ZCvcPhKt3rAKjQH4WaaPWoymeQL7VZw37QUKO7jv
         s1RnTI63lPLVcWk5VqFlbvmAhDtOI0QL/GTuDZPQtRHZYojNDhLMImXePuyBveksAwLO
         gGwmJbtNToK1/dbwD8olbmeSCyguMJjnlwYl30QZfbbk6fpjhlQVJNXZxL17DZw7+X6r
         ytAf/G3dsSlRZgph12ra0ftBOnhQNkPsIirxzCf70t10m/tjCWFMJifcP77im48gn4A+
         pfoZHH8BakIP7mcUjBjElh7xrjKqHCgmBbUNVtknK/zYLfMVaxdM2Kc657z6NXvT9jlv
         juCg==
X-Gm-Message-State: AOJu0YzExBzxS4sRcuAS2RoPWpcdUPlO+n01rcer8rjGvXlJEpWUaXT7
	PyWIzcySe1IKjSq4t8LLIxFom1g+80JWaHLm8Tafm4RPFggVRrT5+KNOBedf6hFjIJP/JI1YLBo
	Lh3HCFMeHjD3BS9NzWjBwxSW+pj1aZ/A8MfB5U4yqWnqqPUzVUK0eiM1c3+9+ZuOa
X-Gm-Gg: Acq92OE7AEuZsm219kWBSPiMh1MYSabb9YIDLwmxyn9rNZ/AojeCcDPE052Zk0gT98E
	8bEq6Dfz7XYOCZDU58YSJs4+D87vism1wJ27bp1JRVyrM/hlswCH1urmF5N/W2InGlNFQPqRde5
	U+a4nl8wGxogLC5Q7mIbyQSOnM+H6yWD2WC8biz16X3DzPPqNrvCoSlomhTUPgBhbHC4xPYOheu
	MLrMBGk8fdmae46I2WLdSR0rwnIaKkZACaDa+8svF90c3ykKncYPHb3mgU3EBhbXnGWyK6amHm9
	LasLCag7Dr1qtc4+T42Y5E20s87ONNSvKNBUxKsxmSixlqLdgyKy9h1XboTbShbYt9QCWeJtWQl
	ZNEZK5TcICoeBYz6c/zEIMJt7ORmhuP57D1S/eO4mQ1lRKQcdV2KhT5PBMo+c
X-Received: by 2002:a05:622a:389:b0:50f:b13e:b738 with SMTP id d75a77b69052e-516c555a2b8mr33364111cf.29.1779367132147;
        Thu, 21 May 2026 05:38:52 -0700 (PDT)
X-Received: by 2002:a05:622a:389:b0:50f:b13e:b738 with SMTP id d75a77b69052e-516c555a2b8mr33363431cf.29.1779367131558;
        Thu, 21 May 2026 05:38:51 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c4f9e0sm20508815e9.2.2026.05.21.05.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:38:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] gpio: lock device when calling device_is_bound()
Date: Thu, 21 May 2026 14:38:43 +0200
Message-ID: <177936712379.27233.5392398621946303479.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518-gpio-dev-lock-v1-0-cc4736f3ff0b@oss.qualcomm.com>
References: <20260518-gpio-dev-lock-v1-0-cc4736f3ff0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0efcdd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=smS-ECQKe25ayoRpPjYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: EejPpEkpBwGULgpn3oo3Sd3nazdWfI7Q
X-Proofpoint-GUID: EejPpEkpBwGULgpn3oo3Sd3nazdWfI7Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNiBTYWx0ZWRfX681F/sGpqqxK
 IR4aDQYLuqD0BNozjnEyXpI2GTYDNz/nZAiy0b8C3Zvhrr/UpK87ouLOHVmugQkdCbgcV7EhwKn
 yl3VLzUF+zkkAO5Ox/+Kgp+pjzvodCspn6Xpr/kCQJkeNPIzyuWD7T0fQsQbnPh06NTiCnoUlm3
 sgtqYU34Q/kXmP7mh0LYv+82yt6+plml77n2BFbr0lxY+UGJ5syBrGluijmKTK73XqJKOKyeiFn
 3kqqAwDHt/UNBVUNFlJ+oycnxnmawPL8gGrdpmisKCsfltgitOus8SY+Aq1SdHvH6DoBquPpCst
 9Mcoq4FjA6G7NxyaTazYdorw+wGjw4TtgApkzcHY77fOL01FDWhz2SQ8pLky7FhDTZ/TdUaaV8C
 SyZVKwYbze1EHubDev39tSE2nwoyydF+WHYhUY3Kc6T35Ek7s+buYEPB3KSibywEyLT+tWT2UAe
 BxLXFp0H62qS7FveSww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37269-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 825E15A5110
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 18 May 2026 11:53:16 +0200, Bartosz Golaszewski wrote:
> The kerneldoc for device_is_bound() says it must be called with the
> device lock taken. Add missing synchronization to GPIO modules using it.
> 
> 

Applied, thanks!

[1/3] gpio: sim: lock device when calling device_is_bound()
      https://git.kernel.org/brgl/c/e70ae40d6660c5428c790c329318c570b4d038ab
[2/3] gpio: aggregator: lock device when calling device_is_bound()
      https://git.kernel.org/brgl/c/598a2b3e2e0e6aa2e9f7843c96c45b5ea11e0411
[3/3] gpio: virtuser: lock device when calling device_is_bound()
      https://git.kernel.org/brgl/c/a4fa45c1d980bc2b9837f469119af24a9304a1fc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

