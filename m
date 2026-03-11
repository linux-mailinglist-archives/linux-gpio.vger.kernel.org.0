Return-Path: <linux-gpio+bounces-33086-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A+AOcQwsWm0rwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33086-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:07:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9225FFCF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AACA321F3C8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484C43B6C06;
	Wed, 11 Mar 2026 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gs0d/uix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOy8recS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6479F2DAFBB
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218866; cv=none; b=fyC4GLeCX3vdS/TgTQvm5lw6s7nP1D4/hcVIoF4NVSoej2JItkCZL9mwWzEHQjLhmIFT29VDxCGzn+lWaGDIjWJKuCqS2VXVsWLsatNZSZotwpRAr8vPS6mYt/8rYGCcKTD9RIlFm3QMyZSSBGUtfyLxbxln3dNZRuc3G9KYUDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218866; c=relaxed/simple;
	bh=cvQ5T3+2wTfnSq06+h/IR1ZvYYi4yHYUeA8xrjodRQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6a8xz8rfgpT2oZd+AgGIntO2otx18iBnJooq7x9IZtRyusNtQcj8cwxMVMvehy5u5Moed3WLsghk/cjNZbE3dm1Er4a57k2CTtoF3lrbMvS7nTtQ3YTDYOT8R2XUbUMiGxlWZ52BkRnnHAeV9k7f0Aeaa4OlaSNj/L4DWp9pKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gs0d/uix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOy8recS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7Q9rL2030923
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtF4Mfb0F7x4PLcg6I9RzGmn/9e+thYE6Y867zWiDQI=; b=Gs0d/uixNpc7TGeG
	lEluPZjvqVkefx0vXFlaHN9v5ZUu8nmpRFy3HEwYgC6rIGPQRvMimdOa2c+CIuD7
	xrHZaQ0780XwxNIdwFEdA7CdwLZvZacfC2KHxyBCnDzDfM+o+5sMOcThdnPVWGFN
	PGElShP5vMJn8N0aTjZF0gDOM96oAUtIhPBE5akTkzIaeF9ma/uFawl2BOsF0mTC
	Bt5CuDMz8nFtY0msTz/hNUPnXZFGpn1BF3hSD+HqONSIEKMraxF74COjdHACvO92
	5y4ouQo7aDkmCpUdTDgu5mbiL4YFKTzfa2A2Z8OcGeLAL7ssHm094+ZeCH12bJn4
	iK9Oew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h09fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:47:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb6291d95aso5701998685a.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218857; x=1773823657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtF4Mfb0F7x4PLcg6I9RzGmn/9e+thYE6Y867zWiDQI=;
        b=NOy8recS7ZxASuJTjB56+096g5EJybHfVjMGeUf6H0kTr64pjo746054AWUCH5PGwi
         EpvUqA4/fOwFmuXg/uhiFvhr+SMG61hA8+G93Je+sBzDw3t2WQDHqbL9ZrIvNm3bRqpk
         WKE43HexHyubhov1dietplAjKx8Qw6UP1mClk8IZGdqWlceor99Rq9y17GJ/cBjf8gJp
         keF9ClPVtN9cw7Wrc4k0f2SXz7y5/kWlZvAFUzvkuaTteVyZ3TRgNDZP/j/lr+/Zr6ut
         6X/8wEoHBjgPShhxdYGSuAWZiiWzfr7frD877wMhnWCV8QG8Yf+asL35fFhkYSIYWGyn
         FMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218857; x=1773823657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtF4Mfb0F7x4PLcg6I9RzGmn/9e+thYE6Y867zWiDQI=;
        b=eC5oOIZqkhuBhmMnbdxMHAwG9rhriIC6pb/nl4g4D5MGhvb2uWetN+n/liJIDNK7F/
         BUlIU38rKdARZFXOeVCwbJpfoTUPDrWdEqS1i5FkGp2CESTAgNnvwO6XcOVUeTSRrsxs
         JN3D+72z98g/1p8Gt1dDtRwH3tT9JCIyI88bH1KiI8xwU9YmPbzXWrbzHmbg+to1nrBi
         AfHqCjXRdFyTecMYvak06+lcnibQbE393pOKKhBtDcI3rAJIe9gC7HZ8/25FRuxTdlza
         7OXBhGt94ovx8trhbmj564jYaorPGJdo+wZwoXUUOCjV6lEnJRy+OelQVG8K3vZHLAEC
         NaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQgYTP5MsKLiQdNJD7ZBar5ymTEnIPZR5SFrIMUqKI288nET2ocIVTREBwE9xZ1BOKG4JH8tI2ozNm@vger.kernel.org
X-Gm-Message-State: AOJu0YzMztfd/lyv2D1+F17VtGMASTCjLDRsdx0KXME3oXk5Cf0a7eNA
	swoTQeRrjg+JBPUdGbt7hXI1yZ+ab6gqj0nXkEe6UH2Jh93rc6KynU4ndjtGKjPPhuZHu93rnid
	CcoMRi4BLv+1jQGQqc18FZxD1TvaWnvyAaPaf7x08ZXWIWh9TmslAA/HZxZWC5bw6
X-Gm-Gg: ATEYQzzcAfOMVVNRTAjQWH19amKkgUZP3ndly9dkwtt7j5UTaQYbnx9PPNOcNSHF1Il
	V0o6Slx55ah5gZQMN7VyMibjJRdzqr31j4Umlqo7Ma4zij6Oo9kxUC3oDtHwwfL/COqmmAOXNJo
	Ca3RuKWQ7XV1dKrZoQV2BZhhdryjgcSeLYbN6n6+wJiCI1hN7xCPZ3eJeVwN+R4rF58ZcaphXi6
	F5n3dTS9OOGRwxWnG6EKrIJdh+Zoy9vNp/Seagma5xFpH8gXHTR1NeowlbmEC9kYW+gTyD3P/H6
	KcDoTyFSWZ7n3rprHLThnylZD+0HL8VAGqlkNJCTN8AjRnRhQ113UgLTaXIWnZb50x+R5ECyGms
	RLV3s2MQ8+SFTLXT7xUVlHXq/XrN9Xd4rYHH91bwezOxP0lGE/MU=
X-Received: by 2002:a05:620a:1aa4:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cda1a002eemr192880485a.30.1773218857378;
        Wed, 11 Mar 2026 01:47:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1aa4:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cda1a002eemr192878685a.30.1773218857008;
        Wed, 11 Mar 2026 01:47:37 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1f4c:200b:aaaf:c666])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f821e32csm4695881f8f.35.2026.03.11.01.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:47:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v1] gpiolib: clear requested flag if line is invalid
Date: Wed, 11 Mar 2026 09:47:32 +0100
Message-ID: <177321885040.7051.16593773301143018668.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310204359.1202451-1-pobrn@protonmail.com>
References: <20260310204359.1202451-1-pobrn@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NCBTYWx0ZWRfX7NzjAahrK6vT
 BsY2OR+xYEzj9lyrAxQNmH2E/3IrTw/LbqkV5zvfW7CoXJw65IJA+W4FIvrFt997TJDWKRpz29Q
 NRbdzib7xeyY7UCaLlI13Iyjr1UUpshvW3XAFcnWaM9c723tMXxQPkPXEd/Ymj0KXPCLC7qIXzn
 U3QnWZBN9M9pM9/pV0Nok23ShlJBU9Ou569qjFJ78QIWWiJRREiamT4OHLSH+V7iwIaKUxdbrSA
 maKJ5Im0OGpNusvuXsu9ZHN/j7+WFX6Qj0+rLivgZ3B2+9jOvHvRHm38T/09omj3pJOACQWLp9f
 4AKKpMTkPx8QHdCRxYFiJVc7APWKMXQqqxNnK/JmnlWaIuuMscZqiOfwS8vIwDJekiDACwzms9q
 lMg6hrioXORYqvTnrYWJi2AZ4RbN4DBKST0hfdm/G9jl3KqwRQB3HjOlu0VL0rn41/fc44uv6VG
 ugO3jznfUz9OJ4EvN5A==
X-Proofpoint-ORIG-GUID: GW2XyziP156Y5uSF67sibdd59RJFxw1a
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b12c2a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2ciBQeYZ9U1VSMm8pLwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: GW2XyziP156Y5uSF67sibdd59RJFxw1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110074
X-Rspamd-Queue-Id: 4AD9225FFCF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33086-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Tue, 10 Mar 2026 20:44:03 +0000, Barnabás Pőcze wrote:
> If `gpiochip_line_is_valid()` fails, then `-EINVAL` is returned, but
> `desc->flags` will have `GPIOD_FLAG_REQUESTED` set, which will result
> in subsequent calls misleadingly returning `-EBUSY`.
> 
> Fix that by clearing the flag in case of failure.
> 
> 
> [...]

Applied, thanks!

[1/1] gpiolib: clear requested flag if line is invalid
      https://git.kernel.org/brgl/c/6df6ea4b3d1567dbe6442f308735c23b63007c7f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

