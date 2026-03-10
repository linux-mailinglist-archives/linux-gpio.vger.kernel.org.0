Return-Path: <linux-gpio+bounces-32896-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJwVFpDhr2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32896-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:17:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0F4248237
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53AB03035F61
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AD243D4F6;
	Tue, 10 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oIrOA7u5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNHQhUgE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CA343C049
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133859; cv=none; b=YzJy2LUN83MfjMMtdZGz2u8g3O1LMbXu+gb42pwFetHCAXb9zoL4BQRqbOE3b25wDlOfdLXqJWUlARIbI7RywovIIf3bqKETqUniuD7EVJGSZ0TlQCRKxuakZ8fwz5FXkzwoQxvm5xwbHjv4AgJ1Z73pp2/K0NFBWXtppUZM/cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133859; c=relaxed/simple;
	bh=iNZ/Hvg6kNomyJ/AnRPnOSqTaL0BnqgYzf62LJiPknw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZv4+ZbRy3Gvx7seTASm8JHZG0sKRixD7U3uYjYxcebA3bltaXZndMaXTryVE74mxO+Z3qLQIZO/z+bKjCnEscMcWOBnFS2/9UDozoVMMY6xEY2LMITjr4/yKaXU8SQuft82+atTjDBpYUoVHr0T2m6z1+VwmORvCz1ZO1uPe5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oIrOA7u5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNHQhUgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8qGRU3693056
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8htl7qpsjJQZfsq7CD+YXOG9QlNQpgsiH3AG2qg9LgU=; b=oIrOA7u5bVMJ85JZ
	XkCp5Wycv2FltOSCIvVKOz9l8f9gGDRG2HaO8OMci7QV31xdGTEKhYozgz0TInoi
	+cbwVFHV407cOAHrIjPcfryXQY6+d6NYezSdqMXs40wYlf/hMFhO21o7kq31wt9L
	f/e4bBqr0HkUuo9oCTO7ZGpaOCzyBSBOiZzO5SU8tYo/Scws2z8LMhR92b8Roytg
	jXyf+sjPrQC70QBnCh13E0XqCsak+DfLAK6lka1egimkkoupNEiNHBli2Lgf5lHP
	jnLFlJ/J3OmiKXtEhlsoS5X4KmP0OIYpemCdV4luE5XV5uN5HuPtDlbm2Acf/6xR
	kvkBHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ng2p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:10:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50920055f0aso95734341cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773133855; x=1773738655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8htl7qpsjJQZfsq7CD+YXOG9QlNQpgsiH3AG2qg9LgU=;
        b=hNHQhUgEGlfFOt2D7CtkVItHq5ilBpJTJSISQLld2Pf/JTvgnATwgkEJXyn83bYswN
         YaBDRlS12HTzj+Y6AHEm888axFz8Mm3Jvzz7Iycxx+zTrNuJhWg2nU41SFQroOnvOXK9
         dveTSJ2Br+VGUhvJ5BporhI8xwKmtE7SjiftOhjASro2OZZWKO0GA2bp8Mpw2z7l1zSY
         AHAyzeH9R2Pr3u9i0+8o7kAMZFVx3Yf0mAsaVJ8jI9Y0eiQ8ii/H9vQva+rchGDjGs6c
         gmBc+M6PSXBoNcT1ICYDscUWh/HYpVaMsnUsmrquVHSJ5srMdZFr5h4/uMl1+XO0IE+8
         pmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773133855; x=1773738655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8htl7qpsjJQZfsq7CD+YXOG9QlNQpgsiH3AG2qg9LgU=;
        b=xKlGjgnFDFBm8TcsYXm4qDkjwBT7teMtJMvcLoqKtuiKw+XSwGPUfIMQaYyX+jvhyd
         K2NBMiHG46+LilEPXU3tZVEkpBhbH1xcE629/m48Y4vbisNPiFKKo6A15KUyRhqYhHJm
         G1N6gLRZI1VSzlXmHwFylW/MgTWzP+qmkWtEgOFAUEvWsa/9bpaY9UOt2TMrR559Zx6D
         GLbCteHD0WXbpCRP/yz2L6jxUOsMEn0Rm3mXTRhV/tHCGrKaWZ92ty7vbSixNdv9Dujf
         CEtjp1gAlznMbJmYzRlfulQBxfC03Uw3+bp6e3pQsOF32lTE+uoOW2zThlOJqMlAJVYk
         TKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxof9fbJH2FOsqh7Yr4RMUQd5qGGN68Isiq6RMLLD1ZHJYA99u+hwbc3mNV/3cMKpvIQuncL+Cut5I@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7toevjLuoY7LD9w9tNLbawy0bWdf1aSppq58wG2Y5Eq4dvdDt
	X2nyEMfainxT9HcWP0lI8WtEI6lZLktEivv8RdGP9lgXB0dTkjKGgmo3ct/YLX4UgCKo4Yp1qle
	zKMBw6V6VaIDmJMKZvmZSXqboGcX3USNO6hDrZUjkw2nkOsfK7tgOonOH6CTcJyUS
X-Gm-Gg: ATEYQzxaAqdrlgACpclUmHN1BFnZtW0uO8kZ5JOdZ4N3egqDBZgwyUJlXrKTP1cupP2
	dw15DXrxkUNhBJFWjic9z9TaGTxxqHKr1oNuZAj2kgwYYwUIp1X4NTVXhRgsTX09DYDovYWKE2q
	KVE+knWGsybyjUI5fAxF1sdlLarqjtJf1IMx8npv19/kS6Mwm/unVssXDlv/pcnLBW3zrVez9vr
	vK2lO4nJjwQH8Ygej3/+G8lKLxYuQlmTjSBHZgGg/o2aW+jcS2cha6FsVzel+wUDxkwGRrapxy9
	nxyjeRvMryuHlTTdWihHDSXylpvzgJmQ7ngQjCXTVSrzoBMG0YGobLbkZ+U8KydtntcGnDXWWxZ
	HyG469/cgbFoBd7B5w10JR30rvLDXsq+FNB5VoRXDzQkk401AFZQ=
X-Received: by 2002:a05:620a:258d:b0:8cb:b062:c2ec with SMTP id af79cd13be357-8cd6d44b020mr1883780885a.29.1773133854553;
        Tue, 10 Mar 2026 02:10:54 -0700 (PDT)
X-Received: by 2002:a05:620a:258d:b0:8cb:b062:c2ec with SMTP id af79cd13be357-8cd6d44b020mr1883779085a.29.1773133854122;
        Tue, 10 Mar 2026 02:10:54 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:c419:a350:1e47:af0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485419b8526sm65155455e9.0.2026.03.10.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:10:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Jialu Xu <xujialu@vimux.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org, kees@kernel.org, krzk@kernel.org, linusw@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Remove <linux/of_gpio.h>
Date: Tue, 10 Mar 2026 10:10:49 +0100
Message-ID: <177313382930.5248.1395703981822013627.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7131965EF4C8E8BD+20260307030255.3490715-1-xujialu@vimux.org>
References: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org> <7131965EF4C8E8BD+20260307030255.3490715-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GSYEY0fijluJR4HL3FWLaED2do4VWB9A
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69afe01f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-0JcDJgEzJC3EdZAtYMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: GSYEY0fijluJR4HL3FWLaED2do4VWB9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA3NyBTYWx0ZWRfXyLSBxbwi1IFl
 U7vUJVmvMgA3b4B2GNMavtAAvoBYg55P+T0q2kUOLax5UcPVS5PxSIzcFb7WamtsrJDqLENbxNd
 KH2ycwYC74zYe6RJoR4Fnsdua5ZwU9uzhpwTMvLW4PvJ7k5ET8GxDNb/Nm5ak3OJQeS1JJ22dCv
 e31b7g64aJDuVAVtbFD8kqrEs7ijFC7smTjVoEYne29n+9sGPthlMWJoDop5/yFgmY/5Tazkv4T
 WpMT+Pm6YW5xvD97Gci0mVnUiAhwBfSbt+t39kKmUG1hRP+muhVVmajtqMNwSRh02iLWd4/yoyj
 RLMcaqDGcfXmKOTzc00jgoDO6qq4+6tYw/oJqtwevydL+ea4GyyskxbofOlQYrdtPD/g7wXSrM1
 Jn9WoHqWv7FomDUps8fKDGq4ZhSUyRMrRqebuU6eXsCH7WszFpZ22zFSaEpTZWAj/Dqel1S92Ve
 M/21EG0X8gmMhv9XILQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100077
X-Rspamd-Queue-Id: EA0F4248237
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32896-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Sat, 07 Mar 2026 11:00:56 +0800, Jialu Xu wrote:
> Convert the last three NFC consumers of <linux/of_gpio.h> to the
> GPIO descriptor API, then remove the deprecated header entirely.
> 
> Changes in v4:
> - Fix uninitialized reset_gpio in I2C/SPI paths by initializing it
>   to NULL in nfcmrvl_parse_dt(). (Jakub Kicinski)
> - Fix GPIO polarity for nfcmrvl: use GPIOD_OUT_HIGH and invert
>   gpiod_set_value() arguments to match active-low reset line
>   documented in marvell,nci.yaml. (Jakub Kicinski)
> - Fix continuation line alignment in s3fwrn5. (Jakub Kicinski)
> 
> [...]

Applied, thanks!

[1/3] nfc: s3fwrn5: convert to gpio descriptors
      https://git.kernel.org/brgl/c/b544927d75574330b0a8a33c113556b67df56f39
[2/3] nfc: nfcmrvl: convert to gpio descriptors
      https://git.kernel.org/brgl/c/253350dbf3e7fbd136905c98bd9f800fddb4fead
[3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
      https://git.kernel.org/brgl/c/b6420bd5aa0c374331bad6c0fa2eb5f0f87cf5a0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

