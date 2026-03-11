Return-Path: <linux-gpio+bounces-33084-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JYJIw0ssWkBrgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33084-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:47:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0025FA25
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7BA330160DB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C21C36920D;
	Wed, 11 Mar 2026 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSRIRMhP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFKwL+Ia"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAEF3BBA12
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218785; cv=none; b=BnGSMOmh6ZXFxN9JsTHgcm4EsvIky/dZv/PsYtdAFjg7olWqHX0S8Ak5XVLa5ufCHwKdbAy1RjtYZ9NzlhCM+P2x2KTye1DjwXwpG8wqmIvNRG702wHWG146YnjcZ9/9fzRkfbgi8vvDE7MBJeNgkvpHcsXS9wYqI1bwwLlTOkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218785; c=relaxed/simple;
	bh=P8Z3aRg8c5RsXqdsgyV6sJ8PSh4dn0GTrc1mkFTKoDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GO4hqq4T4dCdTGSnbeRipA4F7aCp1M5ITWI6nVrKAzgMXn1mUK9g47KimA+kUqB8M2oT8u7yKXj3bg6Gnf55CU676xYWGXpew+dU26ZfFH6rcvvYnBv6qh3nVICWsOgP4ZBmZkM3vnBbPGRjez/R09u2bwp4+vYw7zvsHY/QvOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSRIRMhP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFKwL+Ia; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3VB1j614045
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnt3yTSJaxJO/yAVJ9uGDS14wEhUsP8e8yGzBYhzhoo=; b=YSRIRMhPtyFl7lFR
	VyyCRIuCqstKgZBF70TvJENc4P6m+nIChJz0L+4T35S7rBjoJIktarPxggqPtdMD
	FRmj5+rDB0cQCHscJYkEfYnThp5A1O/G1iVUhNjR4WKGWAk7Etze1nUFKkYMxo+f
	eq/dCn6YOguaDGqgyVasksvBbJMpe//1PVvYfPqPZx68FScvkNIDvW37YYjcCV4c
	uf3kHZn0pmO9axIChw6AEEn68Ilr5L79DFD5k79FiJBc934KvI6mWrwd1anX2OWj
	2QB7C9VLAWnbAtic0Xz9KPGR9fT37nS9M87dU0GSdPDMwtZSoY7WXAjB4Q6gsiYr
	a1zBBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu0jf10fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:46:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd722c1a69so2484850685a.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218776; x=1773823576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnt3yTSJaxJO/yAVJ9uGDS14wEhUsP8e8yGzBYhzhoo=;
        b=AFKwL+IagXUAA2DYBIlrKTNlWrR6ReLn8HbGfccjZ9sNuAuTCXad0ErwsKYqd2P+Dc
         KzlMEkgXkhX+Cn8lScQKDhyFTJwPDtF0AekIFPbN73ymhFcZpDocghhqvxyrVEyQNoMa
         ADs4CmuMKALNq4R3eea7T2XB9vRwAU126zFD7/vEgplIniW5ulD9f7/j3H1ZmNTZCwh5
         EgNGtTVFxpJh338qhM0RIO0tLXT6onfnRz+O4mSTJDK/5qKIuiEIXXROduN4hFV8VV1u
         SQPjAUC4Cq/FK3SRz+WTyGxazcLDPg0j11bDhMdXrl8vwMLAtcrC80eePuYH/3AxBpyr
         P92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218776; x=1773823576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jnt3yTSJaxJO/yAVJ9uGDS14wEhUsP8e8yGzBYhzhoo=;
        b=fOlLjcE9ntcZY5dVCMZEwN0NSZ3rOZyNUCPkMTZSDlVfF3qOUCSCIsQ3YIxgZt5zqV
         sr+BiaZmjEJhpWJMwTmm9RZw7ztGsZajtvRb7dz/IyuHx3gYQIpEVBUP0Fs6wScFsL31
         pshNZnWxXjt3dV5wZBWsa05YWJyDSiIIk0+fhqnh1rH5+61TG9RE1LNxcx8raqV+0eoU
         5UChDPxFmQXFGaw0kl3W2S8UnyuuZOmosI0yfKObTBR42o808gJGOKQIZT/DN01/N5LW
         /S3WmuqyN4fiMoygH5kKWP9SPVJv4+H9p78Qxjj79jykLDDIzeHfi3s//9j+jS3JLCv3
         oefA==
X-Gm-Message-State: AOJu0YwszEcVQ/CTNb8xosnfVMuWHKA3qZcArugrPnQGlxBWQLPQe23y
	8W8pmDnmgL7Qn4l7mV03PMvKsimlae8X3rOdxxjBvLleA4HMOtGT7nBobHT5zrjZQ+vYZYOc0JI
	8iUXWwAMYPLhYPUM19KRltMA9wdJkw/3K5MaR90Jt5+CiOkBsl7w8fujaJURQtAxXlmJgwfsS
X-Gm-Gg: ATEYQzxFyh+vFps60/CcsU05rc7MHdQxG0zO4sCRe5wI1njBTcTpFc3sT0S1l/HxtvI
	moC/Qe4CGNtoJq8zisWFPa0Jb/fPE5VP8HcDABFJFebl83STzg9SQ/GGehXAXG4UVDBX24nm4sx
	ak0MlMP1L/DasVQDGDjOsNG0dURgyPIarn2xtSOAMhBXIQbzXYw2+BpdfDRMlapv0nptrJvgwpk
	nix98w4DkH7fK0P0CBmWUSZHyO4XkCmTTADFxNIn6S6abDeY8jNhZe3Tm7SyrdH1N6YxzXCXPXz
	BD/+A9XWxeLrgYQQuBHyZC5ccl+H3K+UYn9bWAS2/4ZKzvpFKRywG3acQO66qmLYyIe5nflg//H
	iembygNDpj9asUbBnqMhuMs84btt5e0PL7oamaw7c39JX8fcwZE0=
X-Received: by 2002:a05:620a:2989:b0:8cd:8ddd:26a3 with SMTP id af79cd13be357-8cda1aa41a3mr206247885a.48.1773218775980;
        Wed, 11 Mar 2026 01:46:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2989:b0:8cd:8ddd:26a3 with SMTP id af79cd13be357-8cda1aa41a3mr206245685a.48.1773218775555;
        Wed, 11 Mar 2026 01:46:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1f4c:200b:aaaf:c666])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81fcd65sm5503816f8f.26.2026.03.11.01.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:46:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, linux-hardening@vger.kernel.org,
        gustavoars@kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: htc-egpio: allocate irq with the main struct
Date: Wed, 11 Mar 2026 09:46:08 +0100
Message-ID: <177321876119.6763.9079303881840248589.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309225204.44789-1-rosenp@gmail.com>
References: <20260309225204.44789-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LeXlZMzg-XjMslltdS0PEBBxKolHA6Du
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MyBTYWx0ZWRfX1SB9uGUUvKaA
 YsemRc06CJ3V3xTrJWORtBy0ZP4vlVj0CLVqI4IPVQmVKvGQn3X3ftGuCOe7C/CtU7MeTavLx8n
 TiBEFxPYGhMVGKlTmtr4Q3EuWmQD0zOqViTqtfTLpN4afdm120C0L/iScsV0sMqLB+jQNFCaP43
 ANLYQDH3xiJ5KrU8bQr8vDzGBi6vcnIxTikdHsm7+++Nl0fT0nCazaSTYSrRRwhvvLp9FwrVpqK
 Y5+jLFbemWH3/1RX140IgV4IOgtRs4jUUBWJzrKyaJYTDbdrl4pmqKZWrBKyOjpSaRErhQSjFy9
 WGbQ2Byhub8kkiFjS4jgBGAmjYdYFRpFijqRGoopHy1Sak9D9EN53d8ZKpZK5+jWeVLs6Esoy9Z
 7eZ/hXI3bhIQaZECFVwjEcg4H2Hbpz4yyv+EVvVvdr8VGSFLv+8LbspahQ/dv6+l1JTkVeZWrom
 QhhvMMJeSzwBGRXlMJQ==
X-Authority-Analysis: v=2.4 cv=FMMWBuos c=1 sm=1 tr=0 ts=69b12bd9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1JiJqiyCQh_NQNgg8OIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LeXlZMzg-XjMslltdS0PEBBxKolHA6Du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110073
X-Rspamd-Queue-Id: 40E0025FA25
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-33084-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Mon, 09 Mar 2026 15:52:04 -0700, Rosen Penev wrote:
> Use a flexible array member to combinwe allocations.
> 
> Add __counted_by for extra runtime analysis.
> 
> 

Applied, thanks!

[1/1] gpio: htc-egpio: allocate irq with the main struct
      https://git.kernel.org/brgl/c/223d9a310c7bd785f08320de8d2b66a5af6a25e6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

