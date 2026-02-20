Return-Path: <linux-gpio+bounces-31956-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBcZEaJImGnYFAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31956-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:42:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1483316755A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06A20300B544
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 11:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5519733F8A0;
	Fri, 20 Feb 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nn3peZzI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9WzuP6j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A34337BB3
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771587741; cv=none; b=GGQrtCtHl+PtOWalF/EQUZcOBB18bIfecwF2spay7TWQkI485giGMHgxLqmLFZi0nNJ1jfwZ+LPdQLE8E++lM0XLF94iLEPmG+WlfLqVZDyNwGcHMJlcq808N3bAhH4w/GJ/HqcgtFc9DMS6yiamRFRmEmIIQzTwUpluUFL87YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771587741; c=relaxed/simple;
	bh=DpJf8VHsidM5VmsnMZbYSuJjI5PqQZ7AobB81NOsVtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAeatiBk7FIaRRsJlxvxy66NSxof/5KZ7Rl+a3yOPhye/VFwEzMChyUodRTWcAjKowthVUG9ry6G7JUdnMeGlxS5Y+nmvSRi966x8DiA3l8jDrZ31v/SV+aJF21Uvd4f1qfPBKVRbqDZfqB7LFii+wt0WtmelxAGOLolvW6Yw/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nn3peZzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9WzuP6j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RnUU2431099
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ke+QoH3Wc4sT3kzzTDA4O6YqBotxBWH99Ib8EdvO5w=; b=Nn3peZzISdoeNPgs
	4C8oTDMb+ThxRTXfNbq5Sow59w/rlFhuoqyI1Aiy/NPhbZt4k68OlFAtU9LqREPm
	FjTWXGQW+p3uqQbKtIwg8PefcLrdJw9wHhlvFEl7Q33wLLR4nF875waD3BK8dY++
	svjigrPQeKUt1FaiWRTRuhdejaoLj+ORr90a9p2lIuuCPpX1DUAVe6CD6q1e3zN/
	J6/mS3powF0C4EJ0elt/KxSv68nyHerJXRvVCewYwPdkFXB9LIJoIAzriXe8a1dw
	LVqsZFxlbL+/tfklAniTwqtZOxYHxWomtzewXk/gu53q9nzNThq4kLRkytGHzvBO
	VbUkzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh4j0wpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:42:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4b8e9112so157446485a.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771587738; x=1772192538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ke+QoH3Wc4sT3kzzTDA4O6YqBotxBWH99Ib8EdvO5w=;
        b=P9WzuP6jzutn9TB1ziM+jOfRpTosBxbNV8b8+3crwvLDIx5P8pVb1irNoYniLS9XEv
         5XGRMhfcf4Y4iB/1qOe4PrQIdPJ6FZNvi28fqfG7PaKdGLe+6czRsnpzkCL31/c0NB5C
         J53igeh32U117hH3DN+6DypANYldYAkQK5Wxrp5/tapjMXgPCcaJHJIuttGk/OBU5D/j
         TRpUeNLA3jRCSSYkM7F4T0/8Vi7gRbB8k4uTDez/Mqrgqv9C77Cep6fYftzh03PtuIgq
         atj5fmwlsOINVIPM4pZpGTa3ibmRWtrZCbWBXe1rC0zkQukPjyRdb41XP9cFZH3uVJts
         DK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771587738; x=1772192538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ke+QoH3Wc4sT3kzzTDA4O6YqBotxBWH99Ib8EdvO5w=;
        b=E5QPooLkzifT7a86yz8QOsqfEJ7StRx5tgYMMQpXsjDc6WWtxhw1Si7rLLn74LGib1
         WpXujEGqxZszWp1yEwokuFSE8CWdzA/LGXsAWNYS1z6RxQljO/vFVDKwmBrmG+sLToDc
         JECf4PKyJlQah9L8eYcr3Iv7xLr2Y//kvIC9QB8pgz5PmHRJvcuoXJf5GQFyX3UCyohs
         yHtVfYedTJ0fOpJhrWparlF3a/qTgm2Eke4vWcARf0ygq3dFfpXIvXGN0yc/tmkIODT6
         WgLnIhspcV1SkF6saaZ4ZIpPKz6r2l8nZx57TDMquoUfhZyAvq+nVEXhQ+R+YwMpQnQb
         tVBA==
X-Gm-Message-State: AOJu0Yz0rhjhugpVl3KO1qe1MeZatpJ7pUjR9rg9IXUvCtHnpNUl7CSP
	kSTa54cHAahp80Mw90PtzS7fR4TEL1zUMff+5Mv+P2U6ioezPML+4BTY/i1bD2vSxgLrJC5Iorw
	H7P3tHDF4hq+BaIXTxpVs9Pg9jliVI0i8GbYNEzJCz56qr9IH+Zmet8Ve1tcZ2KWC
X-Gm-Gg: AZuq6aIIzOL/El8XRwtZ/+PJZpdS72SOx6dBpKI5CJB+1azttModv00fpH6gPiI1a23
	osMU8PaBRsHafrj1q6f0HSUzVNFW7mUV2jDqt1t4KeHHg8uSfFCgAKNFCjYIfS8i5qGStRvBQ0E
	coMseJMI6pStbtm3eRQgkzu2ZvwaJ2WJqOB6mrpt0euEiWPocANG8q6F6QxLnPjp2ApDis9QH2r
	yr9hRAeHn+a9HixpvwB1G8GkyK6rslFUnyLbMGViJuIbIHm4lKpP+dZRYrG8eYiw0MypGBYZ5Px
	wZeT/H01iF13baNgjXHVFZrGlAz1HxWvfB2QI9nwknQxdCGWhCVYSQM7trpNLjvI45ZtJ0AfC7u
	pCQPZZ/EP7J9iZFqTMUFXtGooKp/JqvMI0q+QktCoPFtF7ctd638=
X-Received: by 2002:a05:620a:2807:b0:8b9:cf85:40a0 with SMTP id af79cd13be357-8cb740a682emr990084685a.57.1771587738010;
        Fri, 20 Feb 2026 03:42:18 -0800 (PST)
X-Received: by 2002:a05:620a:2807:b0:8b9:cf85:40a0 with SMTP id af79cd13be357-8cb740a682emr990080785a.57.1771587737544;
        Fri, 20 Feb 2026 03:42:17 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6b8b:e905:1219:c668])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abd793sm54309461f8f.25.2026.02.20.03.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 03:42:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: David Lechner <dlechner@baylibre.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] dbus: daemon: watch for "add"/"remove" uevents instead of "bind"/"unbind"
Date: Fri, 20 Feb 2026 12:42:14 +0100
Message-ID: <177158771758.8514.5894563647144625392.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218-gpio-manager-bind-vs-add-v1-1-0fb22c448de3@oss.qualcomm.com>
References: <20260218-gpio-manager-bind-vs-add-v1-1-0fb22c448de3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDEwMiBTYWx0ZWRfX1DxPxv+VYg7A
 O35TSlj6BK/pUD/1TW2aQk9Z5oA0S0U+0jpIo4gphGd1bY3CAV12+BOjyMSWH6crMplaICRTaIc
 skY13yaBFbNjD7wP3XxITkv8OSsAMM+xadhamZ65Qo0HV9RhblJm7AANM47g5C/D7FrulUjor18
 bPuJGqZQXBjPuOFWkxsYIJg/Tiha2faBkLqiUNVzTx7HLs3NOMoF6A+1v4s4cFn0AUFwIMIWQ7w
 O+U3NCu7S39oEdIeB5FLj4z6KXsXC3xct50pDQDDFqiVCQH1j5yN+J9TvqjhxVFDFhIIpuLuknA
 iAmylOJKxfW9uFpNB841jYcX/iJjkAB8dohiLs4WqD7CJrVr/4x9qKYK7dt77k2BaYTH4zhoRks
 K6vssIZiOusKBf6j41/7hQlXYH9bqXLncyvzmeoacTCHGYrrZ9gk+vml5tjVu5a2KwShs7eGjXK
 mrjoOuawoeZ1D79zrIg==
X-Authority-Analysis: v=2.4 cv=R/0O2NRX c=1 sm=1 tr=0 ts=6998489a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dbhCAHqVBIOzxrNKzlYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JNL47QDLZRFfcqelFFIr_sQo42pKW_qk
X-Proofpoint-ORIG-GUID: JNL47QDLZRFfcqelFFIr_sQo42pKW_qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31956-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1483316755A
X-Rspamd-Action: no action


On Wed, 18 Feb 2026 09:50:44 +0100, Bartosz Golaszewski wrote:
> Linux has a stub driver for GPIO devices (the ones on the GPIO bus, not
> their parent devices!) but it only actually *binds* to it those devices
> that don't have a firmware node attached. This means that in some cases,
> a "dynamic" GPIO controller can remain unnoticed by gpio-manager.
> 
> This behavior is related to fw_devlink handling and - even if we changed
> the kernel to bind all GPIO devices to the stub driver - a fix in
> gpio-manager is easier to distribute than a kernel fix.
> 
> [...]

Applied, thanks!

[1/1] dbus: daemon: watch for "add"/"remove" uevents instead of "bind"/"unbind"
      https://git.kernel.org/brgl/c/80352a30a0271ff1485ff3b8fb3f00c6c26cc412

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

