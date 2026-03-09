Return-Path: <linux-gpio+bounces-32804-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKA9Jp+QrmnVGAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32804-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:19:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F823607C
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4A1A3012E4B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 09:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0809378803;
	Mon,  9 Mar 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjW34IiU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5B8PAaj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278953783D4
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047964; cv=none; b=P93rNDQ5jxPIKsrLfPV3M+TPVDHNVMG3GSL8FVaydhRiw6e5JyI5rcbNK0U2gV6rVxhSHXDJhXDeDyUpgPE+PiO9SC0GbaaaB2rrZy00TWSNkSL76+d6U1tNi+XTPIZY5ibhnQpstNYncMVTKFjIfqrRGztr0fB4SsjkX0RPeBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047964; c=relaxed/simple;
	bh=1wozwKDKAuBEZUHWw7kCPMS2+x/xRGq99hEYl/njey0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HuyQoxAZm/doqXFr8nL0fV8QbsYPXHg8ZudELdAM9VpYRrLpVPaCFARk3ktGMJPqiNh+dukByyursUVBqzJxd4gCKJCCWu+RN3HHUAlGOVUoJ9W8IJ0SqOkmj4TotWbUyxF5X3SiFZjJvJM8uXhdhtrk0NAc3UK3HgmLkQMFEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjW34IiU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5B8PAaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62946l1K895140
	for <linux-gpio@vger.kernel.org>; Mon, 9 Mar 2026 09:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdVPn5sDvV0XBr5YcNG1wlwgtSTbhchf2xN7kOaCe7Q=; b=KjW34IiUNe0hqkJ2
	Ey/BQdJ4mHsGekukc5OFDSQ88yaY6lbGH7WGL2c669BaPUf3/c5OTupcqRk6N/yt
	BYMF7flQ3DfmEyuz6PwkZeJE1s4+QIntDKHGLLdtzgUxSHbWLgIoTE1/hKtAhcpk
	R445ITkesf0Gi1jHCVaj7CbMkqt5OhodS3Is6GxeS3jFiY89koV8OqMRAJCWUPGh
	j0wmMybx93T/MGbt4tbYSacBOvbPV8/xssp+wCzAvpX8DBBHZ59ik7diifGkijVr
	pYoY+B0IZ05/4oPfBew8AMwzbUcHrRu2J5zr+ZSaPZ/+BIohlQe7nfgj+sb75vj4
	9BXZ7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxvrme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 09:19:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77502295so1070158285a.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773047960; x=1773652760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdVPn5sDvV0XBr5YcNG1wlwgtSTbhchf2xN7kOaCe7Q=;
        b=T5B8PAajh+RudNbKRo2P/IW9QUdtm93msZv1Rta+sctOfdy7X8nLcJi5lGPjwjURFX
         ipmLbUXOjtB6OH69nLPJusHyvDf2ioE/4W9zRbnFI9lTT8+ko2YkGD3za/uFKiAbZ+Zu
         NuNjuCbVqLQAc0Fq8yIXrR35FK36eojiRTXwX5mnZfrgg9jNWTPVW+7HHB+SEoTPWvqL
         86qdm5OUu0nhD7j6fWDKRnC6Y0QPO5wNnxmmfGHmaJWzukfu10xiMUnZRcZl8wytXHcL
         uywomw9GtHd6+g9JA9v9+ZNslt0udKMMuca9v1vUCQSZRoLn5BFbnDd9ktRmT6o57GB8
         fqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047960; x=1773652760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zdVPn5sDvV0XBr5YcNG1wlwgtSTbhchf2xN7kOaCe7Q=;
        b=aTjgWYV8D/UqGSsGzd1K0rh2DcOV8rD/SEvIfm2paYL8OtL58Dxbc9qUmnsakffJb+
         pDG3ci0BYg43nXXQ+N01+kIMC6EziU1hyxMuxO89y+0cyr+mJ2KPATyFdJzBI63qXcPN
         P7vfmzPqb2pOGIsrwxYx/Ksvpa++Tt5blT5JUPRuAo7oYNPKoH9xsgnGXO4Yn26fDmAJ
         7+Ebq87oM3zwbdiUET44AU3hP60T+DGtetmEVjxFUayjlPa2T0oEQrYhvHr8b0wy6oAA
         ol6HAT+VM6ALF3ZrjM+GyiHAFJiPVvWphJ6KkvhdukUYUnBzuS9uS4JkOZoZ5GuQcNs0
         vLrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXftiXe2d9qsQFcCQ1saLhtgpOOrsBBc35mxKVBM5bGL4ODlsS62fB1DjrqlGeDmmxvICZoIc9o5IbU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8C8tWPV6ZP6R/3eTaDaRF/xPr9BlsJAzKi+3BgPwUxwzZUgmp
	YG96OprnKK+NnTCtQmWj31mb0zHa7scLS/SBZpuKMlYkafSnUa5Rb5Yqj5gDUB39C9wyJX3wABH
	BqqeIlZ321C98HLDa7dokHJwV8bGdThxH7gltGBdvBbdMfC/vB7SC6PmHoOnOmYTR
X-Gm-Gg: ATEYQzyPDRdbSqYeUXSAjuQm2hDkzwtIplEB/OXYOZl6pC8Eh09pKw19iG0SOsoAIbC
	0+x9Oxh9kHawoGroFt7SBfKJDQNWja6dYtlxUpFh1wVDidL5k/zHvjiAQmrTX+ZfU2otg11g1+n
	SmnuOv59fg1en9lHWKRoGZETG8jBdHi+qkAB31rKIUViALdwT6+EeKDgLAkDJsqQFR49FXtqZR4
	NcCBj0ZP3z6X8Jm4uXi/zFTI4LwrAkiSz1NtDAFojsAZsbW3dOsn/3sHeH7V4wThMukGS4PWzqH
	PRJSSBvX8Wl1cQsmbwhDdxESbCMkZ0WeDt4VO7UvBkaoutAXTzo19cxfY5HwlTUWbERoy5qKvUO
	CO340PnWQcaE4Gdqtd/h3UMPtypeG3tb9fm+G4So+Z9L9AOIU
X-Received: by 2002:a05:620a:c4d:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cd6d4d4ddcmr1296880085a.59.1773047960561;
        Mon, 09 Mar 2026 02:19:20 -0700 (PDT)
X-Received: by 2002:a05:620a:c4d:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cd6d4d4ddcmr1296879085a.59.1773047960151;
        Mon, 09 Mar 2026 02:19:20 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba90:b1dc:5545:17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853252cae1sm150954195e9.3.2026.03.09.02.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:19:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-delay: Use Alexander's email
Date: Mon,  9 Mar 2026 10:19:12 +0100
Message-ID: <177304793363.9428.6145100386120245131.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212110905.52842-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260212110905.52842-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4NiBTYWx0ZWRfX922sj5s5MgSl
 MRTb5xqL7j4r0tQqc9bcVbnUfTaw+q0Wgu1QurGM0JncJjizpQPY4COhzrV8Z3ODRE78GxOoaIc
 +F5qwQbhNBsmhCTQxNhkqvoYl+vYbNsb6uvoJGDWIybD+yprtTbVGiBYVrW6XxX59iGVb91iSK2
 7nxgSMjjfoFzpeUvrH7CHkpMvjIi5bzp0KFsgoKon0dqKKvUmuZS7CtVw9FOYQCbDHsUGasDqmp
 akl0VhAPIRN+6EzMXtOeUvqQPkqvhIBOyVr1XxioEhGwZNgWYzG8x7jLKu9hoYD38MWcS8CORYC
 3jijtpoYDMaS5mQ8k0jpwRuOiTg5me3YY1FVqTXh2a6zhL+EuhjbeqO3OGv9LGUZwDOCWCVdh9v
 zS40eitcsmOb7m4UoduZILbjwvI18+KdocsqbfPhPIqcEzTMR2bGkKPfJ1w6cghawRUO/JEZl1c
 Dnm2hj298E8Ag584/bQ==
X-Proofpoint-ORIG-GUID: QkhPzHwD5xr8fh-HnteAvDmngZ2XpXCE
X-Proofpoint-GUID: QkhPzHwD5xr8fh-HnteAvDmngZ2XpXCE
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae9099 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yZGuy3aSNbk93IE3wHsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090086
X-Rspamd-Queue-Id: 424F823607C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32804-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Thu, 12 Feb 2026 12:09:06 +0100, Krzysztof Kozlowski wrote:
> Group/anonymous mailboxes are not accepted for bindings maintainers, so
> switch from such linux @TQ mailbox to Alexander's email.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: gpio-delay: Use Alexander's email
      https://git.kernel.org/brgl/c/c452588f3cb6b5c2bb6448fc347465aa2174cd7a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

