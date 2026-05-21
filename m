Return-Path: <linux-gpio+bounces-37272-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI+KKzz9DmrrDwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37272-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:40:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0735A4F5A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C6F5300B9F1
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 12:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AC43D091A;
	Thu, 21 May 2026 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp3xkUW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9at+yoX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487DC3D6CD9
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367141; cv=none; b=bT5lG4bFGc9owIQzcDO0YnBi3oCzC+r4SE0IqWH/eyLkCoJ5RjZnXAFydU6O7UkeCaDqkf65xHaaEy4ulC+8GYdsFDs1jc7JxJs+utNuUMPqaykrdHVIpyTcZCTZ9v4lB/0RHwg+i3jREuHZyo1yBaXcYBk+5qlhEGF1szft8EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367141; c=relaxed/simple;
	bh=KwdI2/6/35j9SEYPy3r5kEWkMfy70mSc06gmD4f3rM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZSNG9BnpIe1dkrp8WfqgNZof5xLcMCogiYgwfUscE8OodtXbrOc9xr1jiqnjR0cEX93ZzzcyYTvvjcEBeihRGtxTT0pMzZr7DWc1O8kkPO9n/0YaiXZsmBf8g9nimyBOFDfTz9/QxeexQr5Y5vx9Nz3JVjI5PHmnrkcXYUTf+TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp3xkUW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9at+yoX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99x9t517985
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QXV/4gh+cVu8ZKqM6vonk+5wuL4TSKim/bHkM2Bk7Ew=; b=Fp3xkUW4/MPz1Jqg
	lNPMK6SvXFvSStrruC9+Ceos8K73C4tG3LFTrfNLPt6oT+OyELDv0hWFgke5/tER
	wULgUtORQY5ml206FAz2llkaEkbtqgv0mJH7PcJ0IzIelkYggA/6x2NNmEIOsYHB
	aephDpAW9Pv0lJr8iqdRScXOMVt4Izn0mVyH3YxDVPPE1oco4ePbY8/shxAfXwM0
	j7kA+/9rs+dKnwH9ixmEuz5VIFoVdBzxNzfNJwo0u0EIAzGwCkNLaB22NHNx9HCf
	xr+5P11Rv/he+fQ0yW4TxQLRsUJwwXR1htNF1fqWs+8lobTjDwxxbUjlAmsogGac
	WCk2lg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa282y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51009190feeso187970871cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779367137; x=1779971937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXV/4gh+cVu8ZKqM6vonk+5wuL4TSKim/bHkM2Bk7Ew=;
        b=B9at+yoX2oMGZtSzp66KNUk6lhm1kaEFm6XzuCD5sijqj8jJU7jkIXeG8F0IZeSGkd
         9scTb4MAqiyZyCMiGtkeLNgtVcfTG+V5kKFKPXV6rQuLEBKFvpghDbi9Ia6Q3np4bF0p
         PeY4wETl307WxTJ2m6l6FLwGNfLjgCxzx7V/YiYbRILAOmmMD/e2sHGWSTt5hhKMQu2T
         Eatrn+TYgJs2IgymE+OX2Z+eriZte5Ve/isg1k+HN8SLbVr5DhhxjJC7YWO+IkgyYVe3
         dhZR6xJy3sLVKXhNx8plUVUz7Yk5Lx3uu8wqMUwdCi06NVUnPC3+MbH805YCkPYuVZoH
         W8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367137; x=1779971937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXV/4gh+cVu8ZKqM6vonk+5wuL4TSKim/bHkM2Bk7Ew=;
        b=d17SzQy96x+oUL3515DPYiotFMHZ4Eu9/kGsnccyHdzOpETDbUAAYkCK3sL/5eVM0a
         b+FJlE5JGsTwha2E7/cp2xTVQhnKTbjMXL700ckGz9spR3hIr2t9NQ4gM3HwNZ2f0fto
         pKL1ZvI8A3PUKlKQ5CTR4ueohSknYcD/WvyNKrksUCO0j4drEJL5gmEdZUKBXrE+QfLc
         fKuhFFiPWK9aEn3OS8y2F/dA+f1V6l4LGu1pBfiM/1L3a1U+VLlG8WKW7JBkc3/FVecy
         nxyjkiTCgK5WJIJwe8WbSMd2SrkkNPUTW3DRLym5So7AGeoBQMMKBQ7MDO9Yrx4ckKd0
         jt2g==
X-Gm-Message-State: AOJu0YwC+BBKV3n5yhr2C/wsAouvrH0vv/NiFWDfbaQWJtO1nnSPUP9z
	e2qmNH0Ffsz1r++NZtOxw5eWLaG2EXHDXczwFuHX6BhOWI5UZKZuIqrKYSWCARKjuUykFqjBaOT
	u8jnAgVmxKMU1qio77cN+G/oeoztvGFY5UlbLh6w31v3HNN698/Qw8pVm22wBjIi4G8eAO9q1
X-Gm-Gg: Acq92OHdQmJYhwOAIXT3KpGL+xdcBO7oIpJxb/sBdk0OJo7E+Fj4/H0Gk+nESXgKEr8
	bpGI02Yvq4l96TYhmpCL6NpO2J93WRe52FWypWcYdnNIS3NbuhMxA57ykE0uUahOaw6w3oVkB6e
	ImsEky5wKmRQ4/xZOXWNRR/nj5wl76Ytb2G7Nn48/ghl+shJDTk96q5D78nbTcP6X0Q2o8QpEos
	9MMvcAGhzD4uIhPzbQ13xWaDzJFvO7j3eLS3bX/UP/FKF8hoS7uF7Wixlq6OwXZ103di9zmtIkc
	0VgQvfp6wW9wOoJyPWIhTwtB8RXpkXcCEXc9vBDDylVHrxXtbhgGSofyholBr1G9Ree0mgVhfaP
	htkwCKcUkszejwIaj91CDSlnNtwH66D0Ud5Mx5bPZxl867ha3J3C9KdvuYvXA
X-Received: by 2002:ac8:5f47:0:b0:50e:5c31:5d56 with SMTP id d75a77b69052e-516c5410521mr36711871cf.6.1779367137301;
        Thu, 21 May 2026 05:38:57 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:50e:5c31:5d56 with SMTP id d75a77b69052e-516c5410521mr36711371cf.6.1779367136858;
        Thu, 21 May 2026 05:38:56 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c4f9e0sm20508815e9.2.2026.05.21.05.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:38:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: cdev: check if uAPI v2 config attributes are correctly zeroed
Date: Thu, 21 May 2026 14:38:46 +0200
Message-ID: <177936712376.27233.13543791513005861545.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521-gpio-cdev-attr-padding-check-v3-1-ec3bcbe2e358@oss.qualcomm.com>
References: <20260521-gpio-cdev-attr-padding-check-v3-1-ec3bcbe2e358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNiBTYWx0ZWRfXwG+PEdIy94UR
 AVgX6jJMsBI22gs6tlBTAzHQaLoyxR6DKsPp1nVqnBAA0+USLLwYLa5zWieb+A78GF/gQ5/SqFT
 aqiOe8HpRwoCW9osgteiACJEVoKaNQpyKwucts2gEDnWOFyhuQ9xab59aJ5qt7+VWX4qltcwCPA
 80gzJfFtEhoSE/yPGU/ZoovVdDDbmuDCr7n6qHhL3XkQG1iL51beyqsshtBfZRfDO0VCioOSxHi
 0inb1Mi7pe8M3Xzvnt+CN8p5HCjIA1p8DuQIRSSvWTXlTgQnw/cQ+0ZJAqOXl7kPyMRcxAAApCr
 Xhqz3IqW6QAzWFZ4taPxEk6jdczNh+msES0LERg4RbJqb+sU8rHwKXHpxUrRIHjHhNIvvtRdmmJ
 LjjOLt4K7IiWV5G5kR2+Ui7CF/DoqnvtjGqlcMpv/VElLsNbfivVCfiNYBesVmb7Ott+6SdMPQQ
 IYWzbSWGA9N48vUthiQ==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0efce2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IuvVgHzGsJ3C2CQBcpoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: CdH1mWTWe9jB6cwDadUHWxnyhB6UQtdL
X-Proofpoint-GUID: CdH1mWTWe9jB6cwDadUHWxnyhB6UQtdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37272-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F0735A4F5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 21 May 2026 10:42:16 +0200, Bartosz Golaszewski wrote:
> We check the padding of other uAPI v2 structures but not that of line
> config attributes. For used attributes: check if their padding is
> zeroed, for unused: check if the entire structure is zeroed.
> 
> 

Applied, thanks!

[1/1] gpio: cdev: check if uAPI v2 config attributes are correctly zeroed
      https://git.kernel.org/brgl/c/3e6ccd790ed69bedd3d9626d01dd35cf9821c121

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

