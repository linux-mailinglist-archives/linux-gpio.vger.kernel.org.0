Return-Path: <linux-gpio+bounces-34192-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC73Ng/yxGnv5AQAu9opvQ
	(envelope-from <linux-gpio+bounces-34192-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 09:45:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F12B33191C
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 09:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D0DC3032DDE
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 08:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35343B47C6;
	Thu, 26 Mar 2026 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0oQCCC5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nj2WiseL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A432135CB6F
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514524; cv=none; b=iV20G50BBhZW6PMHTR9LYeoXfiOR0CDBed7xLZRSL3b8lAIWzigr0964qNtZRG8tyyCmsqrSDgnTyGUvwgC/j5fa9P6VAVkhta7vvIHRn73VSon/vBV2Le8ciItRwwSx2OyEdlTZQaDgnhG9oQVRgQszTvU9Fp6+I2Lt96eLDQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514524; c=relaxed/simple;
	bh=ecBR40z1aoCIIzU/2X4t8qNUh8d9lJnEAJt9Cnz2Xmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzlmY2u0Y8sose7Gnc7/RMhm1YEA183saPbMpGNCF4lqcownfXxxAoW1wj4Xvur1MA3ogSnbvHo0qERCS2BHKimQgW9B9k022c71WPStj5F52+rlltOwx7ve7oUYbSDM4mQsompPkCuXDjGsott2cNctltgKZeZp2CohnSOFg2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0oQCCC5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nj2WiseL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8AlCn1554519
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 08:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=; b=D0oQCCC5qOunMwot
	bzaBpAr1XNfPzBxU+TvkusaL2beTw07OGIwGhQCyMTMZNOZ6EDKXZ5EkluB4DKiQ
	xiN9EMfW8LScTgUsEJFUmEgtnIra4oG/phons6curyp9I32MY2x2lAa9dBWKZ1/I
	GEfHoHt2eivXUGrDr8/YiMeC4DE3fiVjLFdrs9HkaINQrU3/aLZNhzObAsOgDxMS
	7LhM/o1idsSW56FcGOJjPuwUhHLqRCteccatVMNXtT89HzWWnh6zerCdKa5U9gYn
	4I235rGk7ludDEQZn17RahvQEij2cVSyA4XpuIKmKLGRd2aFD0sWLMlkrwGmCyv4
	BY2w7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7bmth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 08:42:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso38982041cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774514522; x=1775119322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=;
        b=Nj2WiseL/uuvP50ZXntTKL7VppJG0BtxcAi9j23cPdpr2rDguHEVFze69LfPqJbdJf
         IpMI9myKyjoMjepl9UnJrNrsSH8A93/zEXbd/t2EvjCMXJ+0/dkbX+piy5Ea10Jt7Pug
         l5c6L1tqchVL2jdCRF91IJc8d/R0v0TeS1L2uk1NlTDedoBufEPlutG3fimdkTXghVQl
         TV7rHxTREhsr6J3BnJGFljR/XyOR921sUJfW8FV6qAktW5nQNP7UKtcLTTcWnEtF5nRj
         B+hZMLT3szgA+y/FXVA0Zdgksfc0L3tHd93bGQKMsRpuo8bh3nN2/ENcOZKbLruMCjP1
         0Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514522; x=1775119322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=;
        b=jVjFcbR44SOhzifo2xY+MitEWMVlXHNkEaIJLprR22oPVhvrsYonN4SFGHA4soZCgp
         3zyOP3SIrgpjIBdCwGyk0TE+cYeYBTNaH9Ut0m6SBkFhpv9B/8kiAAad421TnrgTNep1
         vrCxEAszIHLz5i8jMO07EZ2nmCTboeRNRVBZIfbxh6mkzYCQPNpfUcbuDkkioy6M9AvI
         PItQsvC/bO8BUJopMPektcDl+3OXqnpY5LUwVsbmrMNHhq035Xszh+desC2egHNvW/55
         E0FG5dMmb9qzdnNfcNzNRP4oeL5Ptu0PGQ8co4mttTZFQ+KIN2bAz+XCTl1CVrd3U6s4
         XOIA==
X-Forwarded-Encrypted: i=1; AJvYcCW+cUHC0DWubspy7+fH0+ZpJKEvO8pYeb+QDYjDNuE3MVftfcn+J2PGj9pxazI/c0wWFJlgmeGfkAK5@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCaFSrt3SPZMeiOVMw1T+OWAzdPgzelmcqgaQoGXIlbQa5wpe
	Q/nxo/DkqooCR6WLdrqpTpte29ldGD5ikJVWdj00ViCZTBShvr2Ciifa7wdiHK9r5U6OBgp5xtm
	h/4fD1Fyvsu3uBnqs2bgQMnSxPpWeQhygOTEUOhVxf4E5Yg8Tw7CCsba3KjiYaNhb
X-Gm-Gg: ATEYQzyR0rshEDw02f1e+RAdxl08zVjH5JLAoRPLdexnlboIFQL5muFwg6dmNJ1IQqi
	Temwef2rg1HxsCe8tGAR9vVrJ02CZ3d/rJnvWWdhjhtQ2KTbLrJE2Wk/IKEyvmK0ipAEOYQbYqp
	cM82ub3zQjAoXEJvqdXxwqIYwQuf3RCZV6NB7n5WQSmjBp656zxmUFYTac58kef35L799ZqTcYN
	AvefoauJTO02uE7vSDCl42QuXUz8LunFKjHqoTQNcu0tbG3p7BwppVBhcQNBcPPh0NJq4iv2non
	9zP2qgdKquK2vwRcwt+LrrlIL+nR4FaCLHtwKFqLoNC4V3JOagM5OejLtyFOMMkYjDToWDXzA3j
	SnxwHIV6X66pJCJ6UFvcycF9jcmnS7osVGKUcaD37dugxlAI/+7A=
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr93965251cf.1.1774514521983;
        Thu, 26 Mar 2026 01:42:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr93965131cf.1.1774514521573;
        Thu, 26 Mar 2026 01:42:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:92a5:ac13:cd81:9625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487208b206dsm26138865e9.1.2026.03.26.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:42:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Date: Thu, 26 Mar 2026 09:41:59 +0100
Message-ID: <177451451521.5307.13788251151955242661.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324192129.2797237-1-shenwei.wang@nxp.com>
References: <20260324192129.2797237-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4f15a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lldR5Mej2F9az_PsPLoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MiBTYWx0ZWRfXzUnbZc4ePI2X
 bJ9ECWdsA70zTPYAoOJUzHwGwYyW/KHUcflKQ/TkuppsS+O9KuS/Iuv/ZPOAAUjztk774jO82fd
 jyvQlT7+xKSHFytZeOEX1/Zae7GFGkplgmgpuihRS1HYGeIwX1BIUZv/j6GkpfQfwuGCwCItrZc
 oVTI4cdaF83h36e4MRGumiiGzEkR2GzBttsUrNyQdjq1G1ekAxOliyZ9mlQKjP6OJygPtmEjaSk
 F9gkjn/PDMeA+M2ymhRtonRUBfPL1vbmxS7F1mv8lKB66BubdIvE9PeNZ6RVVrF3ZEnNknIcGwd
 y/TMvqCerpbQG7jZ8XmDo1FYogo0BPUrEi69/cpu4V7ygVPVWWDG/Nmp2uCFuFY71KgSrSv8RtW
 BJEQViEw01pOGiYPrLn2oDv4NO1DhTBTgRYgttLn8Er4MVf/R0+N/do+EQ67kjVe2oiEaQ4S1U+
 +NYwpqTAml0U84Ow+Uw==
X-Proofpoint-GUID: M0MrXUp1CY17ndnfVUFr0c6tcDbjWDcK
X-Proofpoint-ORIG-GUID: M0MrXUp1CY17ndnfVUFr0c6tcDbjWDcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260062
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34192-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F12B33191C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Mar 2026 14:21:29 -0500, Shenwei Wang wrote:
> Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
> trigger due to a hardware bug in the detection logic. Since the hardware
> does not support Both Edge wakeup, remap requests for Both Edge to Rising
> Edge by default to avoid hitting this issue.
> 
> A warning is emitted when Falling Edge is selected on i.MX8QM.
> 
> [...]

Applied, thanks!

[1/1] gpio: mxc: map Both Edge pad wakeup to Rising Edge
      https://git.kernel.org/brgl/c/c720fb57d56274213d027b3c5ab99080cf62a306

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

