Return-Path: <linux-gpio+bounces-34886-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP9bG/Zf1mmEEwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34886-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 16:02:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6153BD59D
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 16:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA23A30BDA9B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 13:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71273D16E9;
	Wed,  8 Apr 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrIHEK6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKPICxya"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6DB2F39B4
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656536; cv=none; b=Z98kGMe6G4/UVZR7CPUmsr4R2/xgyx7juJULyDizEAkh929JdfPee12OJ4hdHg88DoTCy5pZjOhC0o2IVmcdd3aCkrmzy4p1DFo0kqB0KVPJVmykEPgrzrQQY/zsQrkBVxnodwq6ZXGWmZ17PzBIfdEQN+lOlWCPLsU/MAkrmaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656536; c=relaxed/simple;
	bh=T2FqrpE1nQ5/IBWZNdhUXYsltV4L0V+EI0OVS5NLa80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jr1Pz4A7X9Xhx2mTAZqgWdYq1hv5HZ3A53qHr7MFh1CJJEjH10b6iRktLj51r7BoCR2sLHWvzsuGJs/EYL5VHMPRwilmUVhO2IWNHjuR7sKXubHh6pg0ZsEdYhyGXTWU4/2oZlX/ZRupe3kr+wi0Q+DiTQpolVRHwR8KKojUMnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrIHEK6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKPICxya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638Bq5uP2450568
	for <linux-gpio@vger.kernel.org>; Wed, 8 Apr 2026 13:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O4xLokYbX78NsG9Sr6J5EhKpNbCDr3s6HqJZoGPlkm0=; b=IrIHEK6M/Lj/wsV5
	v7von32Eu6RWU9/pEBe5rBg/pn2QvAM6BwRBcz1mAZvLXBsuyOP6EYlzRXJ3VTkP
	fxIZr7EEJX0vFj53fWcxoUUqK4wh9cSW5KVVwMGrG6QggsUlsIl8DBA2Ridy9RQI
	wz5UtCDMdiRnm8ZYUzQxf2hWsryD/m/Kd6GwJSCU1N0xuj/zmwQsFkgv6OwJnSu6
	PkJnFquq3EyKUxBcuADj4lDZlLa9thDrHB6yDgnOgcoscRZbm6G8rrH23+XoeBkY
	Lw+ADq+pV206x13c9uMimHkRaAu7QSZyHh7zyJ7cjKqTjxJOiXmKPXts5WZFpLCj
	xxBpHg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae6b1f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 13:55:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5aa81907so62269011cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 06:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775656533; x=1776261333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4xLokYbX78NsG9Sr6J5EhKpNbCDr3s6HqJZoGPlkm0=;
        b=VKPICxyamnCsIQ5cGYM4QlrD0LuPV63Cv7JjfMBsZTTwA357bwd/0zCMiJVxePrXeB
         cIuV1EYon3IG6/UvCzm4VogAdfkQ9ED6vuXj83DTkxZkgOrLuIcJw2SnFo9SI0gZh9fh
         KV59NKZ4u+O1ildp/e7mKZO4foTNbdJoAT8IG4XvMdeKsURtULyiQlbcSAghE1Q8HpVy
         UgdUUVY50FfsIwrCEO0YaMEBrF798m2MsMYhL0Yotj3xGH+Iz7INi6Bn0KgwkdFCBfdk
         17J+D0kGpSezzdCYDb6xRt3WCTgW0K0TUHR7nSBdGJujdmA0cTsSSekzAwbqIKW6C9Wg
         ntUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656533; x=1776261333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O4xLokYbX78NsG9Sr6J5EhKpNbCDr3s6HqJZoGPlkm0=;
        b=ZAhYgZ31AyVro7jwBgF4OOdZ4l2f3r8tWTlRBFnVo40EUbeoNRPyMumketi2t7GRwI
         d3CHuR+MKM/YRHxyA5858w0czct6RebybdLXSo710IdTwgi44GFx6s+BKPRNs1rtLisC
         mYddNrJUjiws1JL1iVfhsjESVDZ4xPJMuhlMxZRufuXM93nkmGmT6pTaHEOuEFXZpSb6
         dWOIYWSivVyBRvED5rc8sT81fJgJsMS0jFcYsTwL4bmUy4dBOr6iSwP/LH8ArQWvueNN
         lRjZ3wn6TxMwlZq4G5hh3mvQvIfIYaxHt8YrvqB2pyLxZZo7/I4VXraXxxKb3RbFe18/
         SSvQ==
X-Gm-Message-State: AOJu0YynOZuFI9TXVmsY6Pnq8/BogHcEP+eFumetF07z6DA92lBNACsK
	EAmD3eLcNOBZr5KkiNNHLD657Z+8Fd91olmJ0QEDdowbOVPohe+tCsTAxXpHnzzJ/Wez90fzX1f
	eo6t3jgfBt2WRgwtVOMXu9iqc3AitIM2l6KtVHyBUvH0+bdcI2d0Je9Wk+8qyiR15lBLFvVx6
X-Gm-Gg: AeBDieuWorSltQjL8z/hCZb3qQz94pvDBkzWTPiwKHFGJvEWUeHKwrMD09JcOyyosDZ
	4iC8KIWhpyn6LXqMGTA63M0kW6fU59zCQM6IXH5FPAdFwhRQd+yOnQh4sU5+tII0urrwSN7OHiW
	KbB2mw30Tk8yPS7J4Fuis1Jv0i0xBOvmoyltjpb5/mr9Hk6h+dnbHYzeucBbM8mjgXlSDhsw/Nh
	9GDcduboGjKLiaL/5G2MP9ekb5dsz7fwBLLj66yA9yXnrpcwcFnp52lS0YuOO4+Lc7nmkMZc3f1
	Sx17HEeXAdDaUJrfM5ho1qs1zkFOLFNWCMYKd9mJ1HJIoCdHfKc7q3OaCKMqkFTLxSudUQXnyWF
	ZfdEkUpQ55csqEmPWU50AkmKGMsliDJdcD64VP8Is99uoA3cVau8=
X-Received: by 2002:a05:622a:588b:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d62afdac2mr281194291cf.48.1775656533557;
        Wed, 08 Apr 2026 06:55:33 -0700 (PDT)
X-Received: by 2002:a05:622a:588b:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d62afdac2mr281193621cf.48.1775656532915;
        Wed, 08 Apr 2026 06:55:32 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8384:d958:4b9c:49d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a71f7sm60653168f8f.1.2026.04.08.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:55:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: gpio: update the preferred method for using software node lookup
Date: Wed,  8 Apr 2026 15:55:29 +0200
Message-ID: <177565652533.25403.6279647182023858359.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
References: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyOSBTYWx0ZWRfX3VUkwRfzux8w
 D+ee0nTul473nibBCNtefgq8Kdg85FJQ4ymnm/8gKdv/CO/NgOc5FGH9kQiLnt1I+6Jm15LFGep
 n5FkMUNiYBRZ95eRs7DT0bpxMbVcVfeJKfXPTPLbQfOlJZRMbRqQ3hQXwGYC4rl1V+dlsQg4iYe
 Nbcw6/sq/KsXzTWn7h0gjeg0A5W3W3B3Bmhu00SwCeVf00Xitg2doFPUVPspkeNY7i/BPjEYOKb
 8nZVfufYQH+q8oZiOLue3HQMi1ANlp43O4FUK2XdtcmYxACVWq4XDwPNpsql5n/CtXBWQ0dtZF2
 K8dHwgXaqYrqowsDWV+LkQmZYk3PgHBOox1re9I8DY58fgjamHHFN13Ct/5oCuNB3tNAv3Vjsbc
 LtjqhP3mNr1VHMalDTyu68l6mFayzmA5pc5MdU9JSCkbfVIgyhtCe5b8WUyGcxzlKSyVu/WISoQ
 RPrcX/DLbMagzRoNiUA==
X-Proofpoint-GUID: F6w-w36LUb794qYtU3Mz7HDnN79SNq8t
X-Proofpoint-ORIG-GUID: F6w-w36LUb794qYtU3Mz7HDnN79SNq8t
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d65e56 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VHV1bxSRZQlKidfD:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOWvFa88cN_o-J8PfnkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-34886-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B6153BD59D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 03 Apr 2026 15:04:55 +0200, Bartosz Golaszewski wrote:
> In its current version, the manual for converting of board files from
> using GPIO lookup tables to software nodes recommends leaving the
> software nodes representing GPIO controllers as "free-floating", not
> attached objects and relying on the matching of their names against the
> GPIO controller's name. This is an abuse of the software node API and
> makes it impossible to create fw_devlinks between GPIO suppliers and
> consumers in this case. We want to remove this behavior from GPIOLIB and
> to this end, work on converting all existing drivers to using "attached"
> software nodes.
> 
> [...]

Applied, thanks!

[1/1] Documentation: gpio: update the preferred method for using software node lookup
      https://git.kernel.org/brgl/c/d129779da5e3f8878e105fb3ca8519d9ff759a91

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

