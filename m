Return-Path: <linux-gpio+bounces-34775-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EXXKVDh1GmZyQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34775-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:49:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 460773AD366
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44FD330D119F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9A63A9DAE;
	Tue,  7 Apr 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1NDe8s/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPc5Uk89"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3ED3AA51B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558660; cv=none; b=SDDIM84iYupn+u887rXWSCG7DuhBI1XNLk6E8Grge5TT51Vhzu012NK/CEvUJxPTFsVp3T2ghEnKnZ6BbSAGHQv0p3SMSDuPtvoGrEsm6EmMQImEl5H6UjtNQOsImHq518L6zr0ojLobap2ZJADLEyajttEhrL+ziM38bFm2Dao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558660; c=relaxed/simple;
	bh=HE4fykMuDxttOXhdU30xHYZXTiuqohgtUo27tDoV+zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=enVmxxRgUKObl2yqSEuuITG9kTDwsghouxpsHLMU4sCza/u6LBAyBKxZ6rn3WRNIDTGw/ezEZopwuS3FG9tk19KFdE8R3xbRqdBiENNYQhco+YsoNxfBgaIFYa/5WNw9u2MSws2AePF/8IuGa5O8PgZ3KUORqPxEIllI2s227U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1NDe8s/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPc5Uk89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376ZGQO2009903
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 10:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eS4N6TgfHY9JIA+dLNnZEfvbVbEFjB8JDDLUZGURX/U=; b=p1NDe8s/lXqYcmz+
	xUlY166SHSNP4lZqujGffxN14B02RnCbVA7GzCL9Nt6AsN2e+AQ3A5VtMIQcOYcV
	jCVdJPIDlFpCQg8xcUggbDXcFUKmqgRI5eRTIFrfNUPz6XrFufa8ZHz5FbeleSrh
	0c19pWvmu5TE+/4DlyXxZBcN8qltChqPFZ6/4SbFjyWaK4yU5k9qBUQQr6SQbcWj
	hkBcsikSW+7rH3+NfZBwsx071z7SKUO5Cm0pG+N80fyAyUB7+Im2WczkEA23N9Pw
	3dVb18Aj8Gd8CDU26TeDhtF3oHr1XLulKTCl8+9AvFLSNgETLU+iaV8E6NAJCUPj
	pgIhcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrtbfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 10:44:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso133291591cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558657; x=1776163457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS4N6TgfHY9JIA+dLNnZEfvbVbEFjB8JDDLUZGURX/U=;
        b=DPc5Uk89IbhtoVfjAVnOZGaca0AdFasx25aW5kYlj19JHwtGxJhJvM/y4tJyo9apVd
         XGM0MUXEGYrnsh9keN9ZdWFEazH+YyCnELq2FDPFyY7nDRx3BwpBVDu8M8j1GtRFzZzV
         +Uk/vADMGKyZyyndSebUBLKGSWGAnVtVZBeGbS8iPUAMOUcK6OzjyypMmscxBEsML3e7
         vbZ+us1FUN23SPYDIjVjQOJcoDKN1Be6j/Egjlb1KmSb86fYgA0SWiqxhAwZd0Qd/hH0
         0qMZYa+L8r6vHJ1xWoOgGXpFyB8Th5DzbL3dVOELcHMZvQAIga5756+0UUg8kc9SUinA
         MGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558657; x=1776163457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eS4N6TgfHY9JIA+dLNnZEfvbVbEFjB8JDDLUZGURX/U=;
        b=kaz/OIIgpqAJB/Dihjx4E1y1sXdjrn417k31BHoVuYXZ5YABfZBzu604vJATHEfPSJ
         KE06Lbjq9p8+LNjdROjiD1qLN4WcVjDf6tNZ7RdZFSYsBYwDVjtJ/BnOC1KpyCxyy4NB
         wGlIXqzS4zpYvMIwl0uMf6XC2ku4oviVUCoAP7FlVh4KGerNMZJAH4+jF/LzxSZ6lZ1s
         L/5dD9uQfbWFtMjpgI+MU1TwJ6GFZBtJwha7kb9qeK9dLvq9Ev9a/CAML1L51FrzgDlY
         vKJDN659mTQOvime/enss7/EfK//RqpUJCvWdLG9XF2kmOB6ld4T3W/3ghpcUazGLvt2
         sj0w==
X-Forwarded-Encrypted: i=1; AJvYcCXCkCKHPL4hEf4L8CyxeLpMKxNhkrg/Nr3KYHDuCbf3qkCPutPpIAXwcP6xBSUkQy6nltabHvdMDc+O@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLKucjwOL5mLMYVt/155+fS3lbK2PSLojOh2ljdjHRYAjw71j
	OLOnhPOuW/TtWdqWXE94leF+yQ8GCfmDxP9xpv7u7mpTfkp7N56qitlpNhveP7BBrM32zgkrghs
	c9qN1oSb4BM8H05aO8GESDwhUQ3eCKdCdEblskLDeasgdr2ZIYRJjXBdCr5JbjR2v
X-Gm-Gg: AeBDies1TWRuTK8iakHvxCQ4mWBn30bh4R8zYS/HepbtzIN+Bmx+kkb+h2IGe4o1YYc
	tkfCSejrudP7sis8jahqNlH4dyS0sNCZ2CYAK+KBnajerVrG14HVnJ9ntnpu+PkawyS02vrb7uW
	kTsnTp43eIC8OjJJ5j+bhHgPJAEs0Z3iCZDxoMRET+f/iWm1YrB0c93FQ4X2L2pEhWNHCkEcPXE
	vr8Hx45D3N391qU/bl7vlGzgio6634Zw2+gXKz7l0LJW3jYpnbHd5hLj4jyRMdYNk289MRF8SyN
	SD2nPOlFdw/MS2lb8k2nxr2paDX4bJkRqQVKrLGQECBsnz8J2vZVhim+ifZqsa1PZeiR5WAzq/b
	xIpFRnDSsAjKzXnG1A4fbclFulk6BkijgIYGo9qwnrzkM0vPtcg==
X-Received: by 2002:a05:622a:148e:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-50d4fa6ef2cmr242427551cf.11.1775558657472;
        Tue, 07 Apr 2026 03:44:17 -0700 (PDT)
X-Received: by 2002:a05:622a:148e:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-50d4fa6ef2cmr242427321cf.11.1775558657001;
        Tue, 07 Apr 2026 03:44:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488bfc31418sm64902885e9.3.2026.04.07.03.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:44:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        ye.zhang@rock-chips.com
Subject: Re: [PATCH] gpio: rockchip: convert to dynamic GPIO base allocation
Date: Tue,  7 Apr 2026 12:44:06 +0200
Message-ID: <177555863867.54615.16332353553973697862.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
References: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfXyJsRfgBkIrVL
 zl+up6n642DXbkxU/7gbyrLlbNZrFxaY5hVXYmEKXK+SJ7FzOzv+U6z6AZOXK0qAOBLIU3mXtvi
 GKd8jLx2ZjTHO6AMxZjWI3OLrwjLxGi4m7hw1bF3v5EvHJx7YdkP8OYEEgCMrC8uvguOE5I83VG
 qr3oePxRAroXNtFPBsayz5VHFESLKACFiBecumiZfeijUqPjQUNn/DiQiuhfoQEyK7FpmwE+8ZG
 DBR/hUY9KZiu2vNA4OawXyp69htDgtg/LLTViRWVNV38RSr/RBMnNdrDPKZuKEyOnQUPOv5F9Ed
 aGNNY9M/hAh1GnEbdu6ed8/NYS/izzbXHwSZpfYcY6//CvMLOA/XZp8jKrNc1f5hH0Nzm/RBGmE
 WonukFByXgTowH9QgiSURaOsujIoM+4Ketqi6UHuWdOxGgCrvITmrnFJgbGDZTpoalcBsXjupz4
 PgsfYMXLyJ9ppSkKKVg==
X-Proofpoint-GUID: ja_-RcQehZSHZpbsnXeyECl_g7b7D8VV
X-Proofpoint-ORIG-GUID: ja_-RcQehZSHZpbsnXeyECl_g7b7D8VV
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4e002 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QVjJd4C4N858rfVIHLwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070099
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34775-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 460773AD366
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 17:53:21 +0800, Shawn Lin wrote:
> This driver is used on device tree based platform. Use dynamic
> GPIO numberspace base to suppress the warning:
> 
> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
> gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
> gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
> gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
> 
> [...]

Applied, thanks!

[1/1] gpio: rockchip: convert to dynamic GPIO base allocation
      https://git.kernel.org/brgl/c/c8079f83e0bf312645050c17d9c87deb707369c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

