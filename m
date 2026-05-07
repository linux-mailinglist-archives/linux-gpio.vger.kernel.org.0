Return-Path: <linux-gpio+bounces-36339-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE2lH4JJ/GmBNwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36339-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:12:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB434E492B
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 119463047BC8
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15693321C2;
	Thu,  7 May 2026 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVHOgeTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tsq4bk0R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7786D31E841
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141244; cv=none; b=JQ21qoUcVdMjengA7iyCr2twvFlY2B0kOZYr7tM7xtmVzm+FJXNPEaId/ct7S+yQgshVfH19dT6smmXXkw91DVFRYQWgTOc9k1CqBrz93QtCPZwk4chP1hUTfEISYenU3tpEt+GWMDZUWWONjTKnqlL9zg8vNllTWSEptEXH0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141244; c=relaxed/simple;
	bh=6C8XikaJlDp6CHNZrncJCWsmgcltGFzoYZ95Flp7PaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mdenxaPocTTgMLkJLF+l9YM5HLerg9p1i5fYQFDUkttFIPCzxx0q/4jMxM4cE3Kac/S5G4+kJVMIiwPeSb4SAP5HORiFP9sMiMpmS7tdvbJ8Sl05LrGJW6H1doZFyqGihvGzTmQhIlVArMDop3YLn3nGHuBfFbDxi/HjPa4aS+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVHOgeTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tsq4bk0R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475Lt7K682810
	for <linux-gpio@vger.kernel.org>; Thu, 7 May 2026 08:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Avtg1Qqn78+HcL3RpTDjRfpGqM0zIl7uSKmzx85+5E=; b=UVHOgeTVRT0od3Pp
	H+tSMlkG/XKVgHId4kxn1tgOSmW7AF7IJPzxwDi7942o8p43B3y7ODgxG5PLmPay
	SKOrmxhEVkAzygjHrnPnT6WzrBnlu7zglGtHPt+MePY9k5LIiqFTf5tDCHXrv5aI
	2ZOT7eyd4WFw8aQCb6D6pan1J5au/IsNqTjdoknMCXX4aAeUUHaZEVe8lLRG0V3k
	fwdBUTDLhW6HqquioOdXPNaW7x6A9NJbFpakWNYNyY6qdeQ8EL2ZqlHaE7sSaAxK
	0Str1wjsXKqkFbWsRLboUzO8Bbk1PtjrLsoKwORlOtwLpLaeEjFiAA65SrFB55DO
	+dKNsw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhark71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 08:07:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so12048691cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141242; x=1778746042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Avtg1Qqn78+HcL3RpTDjRfpGqM0zIl7uSKmzx85+5E=;
        b=Tsq4bk0Rg++cwN+pGWFgfQElIPZnf5xkuFa+/WkWU6suBi0oE0tluNG9Oj/yXITyjp
         Zb98C3mZBwBLwnEXsynySOydmSmKsoXl1eRHlNPC5Hz6j1/UA5LZFcgb0TuX2jAMpfPh
         lzY57zsnavBJ2M9k0hO8khm9Z7kzvVWK6c0kLotBu2d9GGtM1Hd99Zh+eQV7nllWNEMz
         S1RbTwLBzsStvX4qEaaJkCDe4XddFs8+LGKslhWcQ0t3r4INKDl97/XgvA8G6ixYsBL7
         QrivGJmJ2ZBhRCLGqwkaygQ/jg2lZ8/ehAOtNwr/RMWQkot1TOCQzaVxWG1FHaAe1ZX6
         hj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141242; x=1778746042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Avtg1Qqn78+HcL3RpTDjRfpGqM0zIl7uSKmzx85+5E=;
        b=eEymCJ6W/OexVMdPEFzNy8ehC673FS3ro862uDFIEx88XBdLRFPIzZSg3i6D+H6lAm
         s3QCTPr8aEpwnzJQXjEU1kHUJSW5Ptu+fVOTkUdg8xn3P8pQNuEAQRxeKtaOhQQze8dx
         fL4eK0JkP7uGwdOvyem+Pp+Zwtydj3bp6GEz33BFIV4l9dPTVMN28w68EvWifvoSFwiX
         7bH3BGQGi8zPaV8tdiXghkSasUVeWRbmk097NmZ5SwgWbLzLPyfIbIlZToq6W3HiiNHJ
         pANHr9zGQ/jqw9NvtKFJ9hNrxGcBbqTzAwZtBF2tdlOv+eDpPVo1RHyTeYhl8Kt/vNrW
         lcEA==
X-Forwarded-Encrypted: i=1; AFNElJ9l7cS+Gr/S3HU81RQYgR2V+wkjs5r5FQyBhjapELMUxE2JOUe6KaH2ytLn9Gs6vHVCPcLAD/+z8vgk@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZjO6CQHzJQKw98LhvI6N7bYbJXlll8/OaSJXKuFKizJAh0ns
	YpNiQwKL/xeJ0YUtEn/mtT+sIyK1LxwCDiXZEuz5ajDR7853T/SsXu638LTP3yJ1mDLt+eSdauv
	WXdHXqt5jOcp9ieOqdHc5nU312d8rCwZLqSt72TglPvgrVEIqZVal39yBT8XA5ODs
X-Gm-Gg: AeBDievhji9KymAo+3zTY3PpqlZ6S3oWsX2F4Y2kfFCp3DqyQHBjHU75MEFOgJs5Y7v
	uWEny7uC+lRXo83WXfXI5lsQE7sGkJsCuXBgeqA6IRv8oHjovzLhzyU4239/OwtaGIGNbFuq4ek
	Rd1oS0MkHdVqqncE21D8VTwbKKCZy93aTsXs38lzD10Uo0Oi/kX0Lh8RLC/xvo2Y+2xR/dAkvcw
	SEctiXrWUZXamywDkZnOeMcuygvIxNr7zMsBxP6ygL6JBsGGpG8sqnEpQzz8Kn/TXU5Qlhfqdg3
	AyRyzezVayTmQTxl2TBf3ECv2GDpcqPi5DACnhvoaKHyvd+adI/leezDru+Vtjt8QFWALo3yFYG
	MUpfZ6XEzdvkCoUmO9ylPefm5yZK8TuDXZVBwIZg0DEvszfEXA891eiTMQYKu
X-Received: by 2002:a05:622a:1189:b0:50f:b978:82e9 with SMTP id d75a77b69052e-51461c28e5fmr100461601cf.14.1778141241676;
        Thu, 07 May 2026 01:07:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50f:b978:82e9 with SMTP id d75a77b69052e-51461c28e5fmr100461191cf.14.1778141241088;
        Thu, 07 May 2026 01:07:21 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:39a3:d4e0:173b:131c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312de76sm33978815e9.21.2026.05.07.01.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] gpio: amd8111: Drop useless zeros in array initialisation
Date: Thu,  7 May 2026 10:07:14 +0200
Message-ID: <177814123228.21682.18023677427642918700.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506144918.2445358-2-u.kleine-koenig@baylibre.com>
References: <20260506144918.2445358-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfX7NmbxpOu9o5p
 kjenHFO43SpToIw8SGpOD4ea1BQENYldJkZItHqeHyqblDRSaO0uporZfIUuhOo81u4A838sf49
 sEEn9JeAn6J5hRU4wB4iPxOPvz2T+4wqiJzCn1wk2f5fctBJfqgyHqAPSzYf5wjmuz5vIbinc26
 alTHJeLg0na4hwV5yQxe1m6xsgzQsWqpcGZPKoVih0yHbZX9cS9Bz6/5OiOUmft69izvwcUjO2C
 s3o3YySV+V+YtJGDhD1RZzVvopnF6tayypYMFJ2B5nc32EIiQzgyJ5O994pTZRZFAa5HOVnXi6d
 ZzcHAlkdpRSJK7c3v8FsewJBRC3nUq39JVFSvwYQTqG/lgkocmk2H2OoPSOxJGaZZHUUXRo8208
 zKeKYECIyBJeH1dTaaJ9SIgvEGSixHwFh/ASvjuQxnpDUFOkb5f2pEVGebmdhvozYYfdN0ZbUrV
 RVs6wVak5R337m6ChmQ==
X-Proofpoint-ORIG-GUID: mlf9YL1c59WSKkKbGzzSixTrS4x1gtic
X-Proofpoint-GUID: mlf9YL1c59WSKkKbGzzSixTrS4x1gtic
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc483a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H0NzLYAgb8JB7AXv7tsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070079
X-Rspamd-Queue-Id: CBB434E492B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36339-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Wed, 06 May 2026 16:49:18 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The compiler fills in zeros as needed, so there is no technical reason
> to add explicit zeros at the end of a list initializer. Drop them.
> 
> 

Applied, thanks!

[1/1] gpio: amd8111: Drop useless zeros in array initialisation
      https://git.kernel.org/brgl/c/87e4643ab19cdfa152b7d10b3418cfff19724109

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

