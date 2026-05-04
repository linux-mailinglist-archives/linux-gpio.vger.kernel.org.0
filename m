Return-Path: <linux-gpio+bounces-36026-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHJHNglS+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36026-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:00:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D522F4B9C88
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69CA7300531E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB22D311975;
	Mon,  4 May 2026 07:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ph9K28Ve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSbbU6ol"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2082AD16
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881591; cv=none; b=rPojfL40kkON1WMxK8j0BFwdTkTEJwC29dsotbJh3ZovQ0n1uxHdvGvZNj4rsg7qnNNzeMQ7htJxw9ocvIDUKwxkkYpJI+7FlmVlhZih6H8R8UvHUIa/FahVcuBlqHtPH+QiBlaxZcN5bgw5WFBC1jvCjngKFyo+zqy2ViYyVto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881591; c=relaxed/simple;
	bh=fopqg+cm4TXpQbiTEniDT2392vc/3+/1p58QDtQVpeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rSnc+iRhjLsO4cb1iE4S8tz32Pq2md6HCY88HbvKDncl7u3ySo7douuFjVw9UXYRCgJPTtjkaddYNrwyp+lAwEu9HBcf2KEk6x7rW0oxZ2iClf3bJ+oP4uOmtYmOJ8lPG9ZF0Yfv3RkBkR3yKz+3delqmz6KF4LPrR1xDsQH0bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ph9K28Ve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSbbU6ol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D7M7147016
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 07:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y44lpHALGHLtV8R9e8ikr9qpm5MyCNoyVqvUNN1RCyw=; b=Ph9K28VeKzyxJbPj
	kD1as3XptkV2qCdWukCDwxDrGSG0OuMSttpLklC4ORWxLjGCnXuAh4wTs3G9SF1O
	xTGaNKW0hWAX4rCY2j1ez0hYSzZYj2OifGvdNLigbYpNuO4aRf+5lL9DEiJAkhnQ
	ZMxLkhUhqOtzRrI+7S24txZ+2tQl6UxXmTActm2ReGL9V8dH98dljPxDmqSLLtma
	3C0MCS+Oczs27mmb7QhJH8EyKKGL4rerGkL+SIuMgOfh5wi9D4Ce19qsegreWpE8
	MNod7u119Y9GWbKPXnfY0QZDjt/CvR79dr2L3etwJ89g/toNP60vVIFzQ1E5FjjY
	vcLHtw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxmum8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:59:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da31af14cso99913121cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881589; x=1778486389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y44lpHALGHLtV8R9e8ikr9qpm5MyCNoyVqvUNN1RCyw=;
        b=KSbbU6ol7krjahDZDNve86LKLPaOViuktVG2wUyEhhY+1612J3GLhAR5LMbG3swAy+
         Dlg6o7AAjTXut+QqKJTZoKx+GI1l1P+hYvAE7Lm0K1wvUkdCCAv2sRqVfixNb59WwBwT
         JZrU1/quCC0jfL9Pg1+afoT9GOXDnhYRGBYGmIH6xsAsprfdh7f5G4rjQf8w12lwfBCw
         e/EEpAfl++sd5vtfimDf6KepLL6XtMGyW5Cv6MfUUOcGS4c9BuLx+bPUiYg3NulWDYoV
         fPqhqwpeQa3mzz3Tg2n167ame71I1MfMsgN4eE0hkQT8A0yNx4uOafLWIepF74YeOHzT
         J0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881589; x=1778486389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y44lpHALGHLtV8R9e8ikr9qpm5MyCNoyVqvUNN1RCyw=;
        b=fm1U3STHGjstD6kidZnQs2yus6VTOrMgRRIC5zm0srvgM+COj/brmMJBuUdcl5crHI
         yJzfxigtOfn3SEqDLHwmV/oQTrJY47IJdV8PqNvln17QbMq7aBoPTgPVVUDTH4Dzu6L1
         Mc0Cp8C831/uy3tTZXMymH1XaBzoOfOTdRmEBkYnh8zYwgkfAkG9JMh/HIQuOWCf/NhM
         7PEiibGWd9nG5cN2ZxUAz2XvnS4Tq2/h+FBlB22+yRmb1vdKGpYAFc/ZcCEvK0ukun7B
         hl3TaFSBgBNWI7xC5LkmnjmimICMyJbEkB+wTmTwSU28YwAcHpo3P0pPe0zBD2rKgHmZ
         Pe8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+unROPwdWH9PffiKDxmp62wZv0Ppkvb8g3e6wghKMiePs5rX4+ZAf7N1QBedVamvdhUcoFf9Ehlu85@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvpni4o39F8N3TJluRglgfOqSjVde6UvucNllmurQYcZ8l1nLB
	3aa4QiDgvBGNf1eBYSWkcWhSmU1ctAcuDNRM6qGxKOLuP7Anwhe/jmb96GjMPWFYj/rUmLqp27j
	exrC+xd8LR+ZASPjHeijN/Cuf3iQ9hsiROUnhLl9N9vqA7Kxuu4z4DvRGZbWojuBv
X-Gm-Gg: AeBDiesQF3pb1wzlP6u3RjO4PfXBpZGnTNXmCkzQOyBphqzMVSf45xNds/rzJDmRDWC
	EZwxu083/sunR9poDt3L+Io4g8kO3tdOl4fCgUEefNYpqcyY/+DCnmDRILGgv2HMuGvenyvm9eM
	wl01l6ZRs/+DCaXdl/ip5pskcwOS9evBKhxSgTPC3SaitjnjX+AWonaAHL8ZVn7dKwpAZOZVAaK
	AWxssyTgLemGnyn7qWWSV9/d3bsLNo2Z5JKsqEdsQP/xQ8fWiSdNHYWsFlRHFPgkLmibFE3bD/I
	jqWCVWSuB+u2XJQ89XcjjEVKw9TLIzn/FlutSx3/fqxfbBT35g0xdh/5pZiIqJuT4zzoPRTCk2l
	sxqjwnjSFh5v4ZjG83aGDMatTZ0XYwhKseZhwgb7vEe6+vBzBdWRyL4eGZIfF
X-Received: by 2002:ac8:58cc:0:b0:50d:e1c8:5ed with SMTP id d75a77b69052e-5104bfc6fdbmr130083951cf.52.1777881588868;
        Mon, 04 May 2026 00:59:48 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:50d:e1c8:5ed with SMTP id d75a77b69052e-5104bfc6fdbmr130083741cf.52.1777881588466;
        Mon, 04 May 2026 00:59:48 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a516:9647:7dcc:c214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe93266sm83252375e9.3.2026.05.04.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 00:59:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: move legacy interface into linux/gpio/legacy.h
Date: Mon,  4 May 2026 09:59:42 +0200
Message-ID: <177788157987.14431.2575253920229263809.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428154522.2861492-1-arnd@kernel.org>
References: <20260428154522.2861492-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E5d78_Afv4r49P7r_tSfgQgCqvVIe-A-
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f851f5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c09oPxaIdF6Ks4xaKwAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: E5d78_Afv4r49P7r_tSfgQgCqvVIe-A-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NSBTYWx0ZWRfX+89xOZeunPxT
 /dLBeD+KODoumPo+T5ECGl5nMEkcd5jkNZlKlNJyQDaz5YO6j/DkLf1nOT13Zz+29s8ptHDjlTQ
 FMql1iVhmAwnUxhcxm45fSa5qLQn/HJI607FciEjyhr3kvQQY21BLyPOuXOEC19LJu5LHmCyNxI
 b/S+/Uc0x66tGyxiFEDuFJp979n2Y9bObP/T614tB1fDvz+fRdPU1gcwAQ24P/o0b6zI2Xe4xt1
 c6m9rHECJ/m73NCCanobqhXrSlCvYMRtgZSvdJEjQtJ59kdc07MSEHtW07sMurraSLyM6MbGWPi
 c9tseBZs2vlURVoqafQ7XKmoUFU7cVbgKnN3tHPHIByVwwGXx6i+p9DkOjhQNoowoioMbW+2BKE
 akWyrYicT/0IDuUbmOnUQ1jrF3ssezTZhjIhW4Tw8V1MH0ac1kKID6mSvSP02J6aaB/E4NxxZDW
 mR28MrAtjuu4HUEIzZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040085
X-Rspamd-Queue-Id: D522F4B9C88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arndb.de,linux.intel.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36026-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]


On Tue, 28 Apr 2026 17:45:07 +0200, Arnd Bergmann wrote:
> Split the old contents from gpio.h for clarity. Ideally any driver
> that still includes linux/gpio.h can now be ported over to use
> either linux/gpio/legacy.h or linux/gpio/consumer.h, with the
> original file getting removed once that is complete.
> 
> No functional changes intended for now.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: move legacy interface into linux/gpio/legacy.h
      https://git.kernel.org/brgl/c/bfdc854ba63bc815cf710701f889544a9d27df83

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

