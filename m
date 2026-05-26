Return-Path: <linux-gpio+bounces-37503-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2u+yHQ1jFWprUwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37503-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:08:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 720285D300F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7238530414E1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DE03CAE63;
	Tue, 26 May 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nM1EM2iw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jn5gXmDk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFA93B6376
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786028; cv=none; b=ssJppoY2j8KIndYdH0ejbACBknbEmsXxnGthj9iQsEak/uzynm93MTUvhvc+WhhHBWQZbPysgIvXlroU/MVrFJo8aUDusESmqwlpOEtDR82pB/vQX5sILSojCOOLBS22g4KxJ74kA7N7F3nwt1/H/lgqgDrrMteCtOo3gAq4BxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786028; c=relaxed/simple;
	bh=cvBOKZ7EzFP4VkYHDEQx/KmguBWro+OufPhd+EC7aFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P3z49MQEyI+ku1eW/8h+PIWn0en7wDDbfFpFm/bZIEtQ7WJNZWvWdSk9bpeL8kkgNhCyBLPz0uDUrObuBNcaofSKN+gbQwRCG/tMr28JMJRsS75EpezqfUkpjiJQrNIWek3gA5yPFJn52TqPW/Hj5n2wBtdvUWv9WYatZMNwwKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nM1EM2iw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jn5gXmDk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6sCSo3582711
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPBtDgs5x1pgyYzIgWGNDLdrLOK54Mkaomhj1QoDHNw=; b=nM1EM2iwk/m+RA7a
	eMKaIkvtMJFgXHOzdI2ihd6V5+ocZXpKXd8pd0yepn/ZhthLiYaxqJTcbwdcZeX1
	PfUGaEEtWUjztXz4IzYo8SKVa00Tb4J++Fdnqu4R5YQcL+/4bRlRD1PAj1BKmaYB
	RQMQ8M+Y1YTVlPFFBewrVSPDd+oRS85vhGCUVdxhSs2bWw/n5BvI4tYy1a3cbw8/
	dUxmiBZNcLUEmTrMmhDakr4qOmiCQrBycKP40QmgferTJxol3ZOJBG07n+6vMd1I
	1r9YOpSTP5F6d1SMaP32IZ4r2j0HRpkLlljUIVW5zGyqwVSoOYXUOkChmtSC8StV
	CEYBhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqkxdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:00:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so38908061cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 02:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779786025; x=1780390825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPBtDgs5x1pgyYzIgWGNDLdrLOK54Mkaomhj1QoDHNw=;
        b=Jn5gXmDkh6CynLV/vX2lS6ewVFJIpSfWZGvFuR/+gwhNsasFont6p0EJuoxAsxRI/H
         6k4VsmFW/A6wc4moGxh9uP/bBDEJGldr74FrW0lHWNPIAIbNQw2fFB0emsKjAV0MffWc
         Wxm4IJb4MUm+xWQF+wlSF5TdoPZEAlzAAncL4g/txkzFao6FqLVSwl+8r5A947vUbgCC
         yDDbKHsfuoTQ7eyx7nnXvhVBKyXDLzIM0KoPuoR6LQ/E3lfuYH0tASBfe4+orBVWfT8E
         HYxiAyzE8r2Ze8vxI24iKGuY02SELtCVLpS+2QsUCCmQYxoc+SlDSTVpLdmJunRBM6GV
         R56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786025; x=1780390825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IPBtDgs5x1pgyYzIgWGNDLdrLOK54Mkaomhj1QoDHNw=;
        b=AyuygyKUTmZGwLY3gw6nBnbKa9T5gOjgKRpEQ9h19dcRSwdusAdoBUTnYakT5KDPEJ
         8rP7GJSMquJich+DtkClbfJJEFY6AorwFo6LvUTidrl++5cdc0aFMvUuB4EqYfLlDNvf
         gpgFon047hgXb16ugx3cggEPW3liYkllKPIsmjlyIqUM343fp6lj5N/V2nydDm3nHW42
         Bl0hEqryo/H8xBJ/eiOFNp/mBvAMbmnatu/hmUjNf++NsLxtkTJeyrjjTqG/idwqoAhE
         snrVOVgu+RP12g+nm6eTx1ktsKtle+gT0Jo2GJIqN8Y5jxMuxKFI8ZH3FWk34Gq08fVY
         zldQ==
X-Forwarded-Encrypted: i=1; AFNElJ95DetuJzM3XIiohmNJB1DtnVtfdCCCrLTJ1uktFIuAtL28KvY6eBTtRur1UTsCtv6LUf4zH6MIr3wX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx48ZPo5U08IwzadauMObUYoUHnSpDTpj+9slb3Svydwrprccgd
	ekyK64+4F6CA0iqdwwornZ+wqwn144kePdVcY78PNUH83epFW36o/ltWt0OMBvpWL5u5YO83xMq
	YAdHa53L7een3c7uukmeTnfG1ePsZiplio82MOXYd1q+fmUAEh/fcyl7gelVyozMa
X-Gm-Gg: Acq92OE8+IXNJpRPwz0uY7NuD/V7LOQmc9KbHEAs334rVul5osJmmmTK5bYnIEnjPAA
	jtM3vOuv9zLEzUZtvTf3bdEMey8NwEQ318QoA8tgdYHXwA2Obp3hZNIoL6w2f0pCWdcF/AcX678
	ZVUwcn4oWchqPT6eHmfW2Dz3VQuLii3BaH+G2BacDr2plDCKZaUFLHgIZlVIsD0cS0La6ysy1vS
	SN9Jf+7x/ZgQnqjDdvW72hLk9j6cC+1+OGD3dUtCTg/2vIuh5wVM6pg/HQPbp6iuekop5YrYL/X
	u9ztew2pH/eQmyHgNmkz1bxJZfLDhD7/N2Ximo7J1GSwUcyamEf8nuatE9UgCBO4aO8XjKZSpCq
	NCQG0IakUj/c4HBzBA6Q8Qx9c9VozO9GO2Rf2nO+aaQV3bGVn4os4xowL+hKY
X-Received: by 2002:ac8:5ac1:0:b0:516:4f3f:d742 with SMTP id d75a77b69052e-516d440343cmr253046321cf.13.1779786025167;
        Tue, 26 May 2026 02:00:25 -0700 (PDT)
X-Received: by 2002:ac8:5ac1:0:b0:516:4f3f:d742 with SMTP id d75a77b69052e-516d440343cmr253045361cf.13.1779786024533;
        Tue, 26 May 2026 02:00:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm305223095e9.11.2026.05.26.02.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:00:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] core: allow modifying settings for existing offsets in a full line-config
Date: Tue, 26 May 2026 11:00:21 +0200
Message-ID: <177978601862.3681.13398210776325327512.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-line-config-full-config-bug-v1-1-b138958bf05d@oss.qualcomm.com>
References: <20260522-line-config-full-config-bug-v1-1-b138958bf05d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a15612a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7kWWO6Hj3luQa3nDrwcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: a1ETdlwsW_QfnTKaI33xRBXgDd-rEKiI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3OCBTYWx0ZWRfX90MlIAb5NKrv
 vLBZariXzMp6sDE4UHfCDTlUe0cKQKeZBneOUwo+ZTty1ojlQ5Cy393aOe6jSn/8Q3uQMY2K9+A
 pLvdwye+bdPTBMzc6CQzCzkLcrSNGteJPGQYAbv/N1pzsciZgiTRATjX6QqZOVaIoLpf+ShpwXy
 5MXA3AlXO3NK18BW3ksJtfpJuzRjVvNR2+S5LApi38ogYqtwBvxPoHB5s6U9uh6iaZEx8ShMmfI
 3pQnRRlpV+pqXv8FBFA2EEC5ithEK04gQu2R2DOkiKbOkkCSXxF14bbQnAmb5LfVyIUtQOXM/GO
 Xqnc/EBILzQ1vtqxJ+7mWFpoEw6wjb0wFd0Ak0JLFXrForVjvKvbzJaEE4U6XJhvGF2jZ1Hbsk7
 Z+IExpEbngaDtoxMjTJHUrAoSl3jBiB/MuzsVuP90lcTrnN8g8Uk5+Sa49JvI+zcASTuXsECCbi
 qHuwB6btjt/t4AN3cBg==
X-Proofpoint-GUID: a1ETdlwsW_QfnTKaI33xRBXgDd-rEKiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37503-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,xes-inc.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 720285D300F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 22 May 2026 12:01:28 +0200, Bartosz Golaszewski wrote:
> gpiod_line_config_add_line_settings() checks the remaining capacity
> using the raw num_offsets from the caller. If the config is already at
> the 64-line limit, any call - even one that would only update settings
> for already configured offsets - would fail with E2BIG making it
> impossible to reconfigure a line once the config is full.
> 
> Extend gpiod_line_config_add_line_settings() to only count offsets that
> would require a new config slot and use this number to check if the
> line-config object still has capacity.
> 
> [...]

Applied, thanks!

[1/1] core: allow modifying settings for existing offsets in a full line-config
      https://git.kernel.org/brgl/c/ec46215f7b8f4481e6c68ae3c34d55cc77b56d40

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

