Return-Path: <linux-gpio+bounces-31123-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFPJIKqCeGmqqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31123-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:17:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA90C91969
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5272330060BC
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32E82D8398;
	Tue, 27 Jan 2026 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flmxMu2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmsapEgW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D702D8793
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505444; cv=none; b=W697kaPOMf+5pobT8IXd2kuSXaZucy0I0UpSPsr037EtJQymdp4MCGL0C+4+9iX40ULUhwJmEnBRzKzlO/NgBeUUeE9lmMkfz14weOuJkVnxdvfUiFURe/GYpJxOg/qYaZAH/PH8f9Zo+burTT2QEEae9+84NXqW0seXJyOnKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505444; c=relaxed/simple;
	bh=I7HmcCOfhDA7Ggbc7OW/uB0dKdfvsaX2kShIqCcVFnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fg6EBkp1vSNuYx7eAzjDlw5/NOs8j+AJuAOTWH9+xbIbECZCbj0DB5pBB96UCTvT+ANoscCgf1qzW3OwQbXg+AXGip8hMGBup1VXwWYxy3akbEeA+hmiGK51zqiijOjKLc/5gJKBvAtyd40ak1NeqW5l+Wog6XCEew/7e92pCV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flmxMu2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmsapEgW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U0j73857577
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBJV6/rQw5zRwN8iXhs+j9J7ann2poliUZKRClFHaqw=; b=flmxMu2K6nuAfF8d
	+C3Wc+4l9mGQzgKjzjScmfjkGE+pUbZ97MIuj+Uhvp2ynV9vxL8tBBuSNnda7j8L
	EauNQer1KZwCa0Wl/KXIEFDT0/aDyLi0UjFDDNp4GGEOxEadmDPfpYuJEGG9/v7P
	786PWzZZL3sZcyB6sqvmsQAhmMCMelYcBiz0rhOK7QIzoahgBp514K1Y3TDVOVIV
	jrtVXtAM4Q4YRltHycamJ5ChN+ymw+zDb8piDOLll7tk4ksFJjb24Azb6yPK4JiT
	jDzQPVOXas7Z4Meb7Z4rgDchWqq7WgoCed1aJFaZ0W8+nUCK5qiGt2dWmDDSvf0b
	Oxw96g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs233f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:17:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5296c7e57so609630385a.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769505440; x=1770110240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBJV6/rQw5zRwN8iXhs+j9J7ann2poliUZKRClFHaqw=;
        b=VmsapEgWLXFk47sQw1SuhtIRpsA8lV/4iSOuKlzREN9VdWxLmFaQv4IRd0i8tR9jvn
         ki40DkStFxgc7ZspTV/pJ8VDOsYSZOARWbK4tMo///p1MSYC2IoGPv36LZTMf+SHmQNm
         dgA21L62gEDIRN5Bz9H1LnBJuHUBHieMT8yJTPigFdvPrbJi2g55JmbO64K86sXTHODZ
         sxYabOYuM5hKpx7R4187gOxzthMovuwYIgfn9oG6yKzDPwTFA54jxSEMFQkxvTQ3Ob7W
         vWggapmSrPH3Q0fjh40e92u0OOI08Z0Do5PRBcu9bL6VBv7he+eJveBH/2C7aIRzuFoL
         S7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505440; x=1770110240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eBJV6/rQw5zRwN8iXhs+j9J7ann2poliUZKRClFHaqw=;
        b=DVi6didmYsB8TwDTh2/N7eIawyAp6Mwx824S9GZJ1v0FwRI9vqV7aT/jDtKM0MQcNW
         v2ZjKc6hEQdqIjZRCe1dpmXYZ8Zt6omrjAAYuExWYUv2GCpy8UxOjZ5bV924ri1q/4fk
         1l5vYm9Nt6OXnKMmvnh/CXSOkvitt9YlbHYsyIbU9MlAD0hkabPgmyH61F2A0iVhVYkp
         JkfKles4ZsjlSRhIo/LunNlb0FmAf69cWw6DrqbbWju98AHxsraKHF7RcP2wVgXzZJnG
         LaQKAm5av9RSSqa60b0kO10GkMZd3J7SuVcgi364QQ633L7vOU2vQhXrOj/fbx4Z5wXU
         RTFg==
X-Forwarded-Encrypted: i=1; AJvYcCU43KfqUW5sVHxpw3C8z9qkC7s/YhIHaEM/asYzXOo7zXHPhefLEJOgyt6UKLAibmHhtu8J0N8g9f4h@vger.kernel.org
X-Gm-Message-State: AOJu0YxpwUEm3pUlomN7RkFVF6Ca5GtqZnZGrust/DrqMa0tPm3tfYlU
	BwjUdy8UHU7RLUBc85dLZP0OnQ/GCm/WJQ1rJK2/E/D3bz9SRKCYp+30EF7oMccrx3B4A2jAXci
	oDgiQZO5natZbF1dUUXxr3nR03cYh5z6/mTShXclDBlmfNqfBPcvg+NhzY4gmfVGH
X-Gm-Gg: AZuq6aK9yQ+tELg64yXgGVajtAPhU2uGcAMuImBG3rkYCL2MUNQ/ztNzgA9xgLbCJB4
	NQsKUCS292KGS1shTjLTBfWK6FInrpDO22T0TPL0OZTGj796WkAmSvjQ/BfIbvvGXo+aGZiUVrP
	+zRZqCS8cRSRc2WirOf5MkuvPG5tVTqCNA5p7b45+W2MmKgv2pQ7TkwQAS0QmAVpdCf/BrHszsu
	EgrN6K4cz+nkm5sylrNV2RuM0rjwwMuhqxfSLv6lJp3sUnxZmUNeHxi7ufKKXY1kSAvYBu4goUk
	rm2J1Fo5kU3BXwgPau7cYZP8HriG+z5hFPRCpWt12NepBM0KCS5UWzLaq1ZkFHLKr6WdCzPe4Tq
	aYajlO3e0NlvNm7QR25FlySAwC6gRk/afeMZrvQ==
X-Received: by 2002:a05:620a:298e:b0:8b2:6eba:c42a with SMTP id af79cd13be357-8c70b90fa35mr101797085a.61.1769505440330;
        Tue, 27 Jan 2026 01:17:20 -0800 (PST)
X-Received: by 2002:a05:620a:298e:b0:8b2:6eba:c42a with SMTP id af79cd13be357-8c70b90fa35mr101795285a.61.1769505439936;
        Tue, 27 Jan 2026 01:17:19 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:262e:d32a:e347:8b74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f73855sm35856591f8f.29.2026.01.27.01.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:17:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        Stefan Kerkmann <s.kerkmann@pengutronix.de>
Subject: Re: [PATCH v2 0/2] gpiolib: introduce devm_fwnode_gpiod_get_optional
Date: Tue, 27 Jan 2026 10:17:15 +0100
Message-ID: <176950538636.14023.4774229904244044929.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-0-ec34f8e35077@pengutronix.de>
References: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-0-ec34f8e35077@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vFhgaTKX8NZqZfqlZQfv6QWVVqwkloIn
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=697882a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNZe0_cqUffCUUVoAS4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vFhgaTKX8NZqZfqlZQfv6QWVVqwkloIn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3NSBTYWx0ZWRfX5P3/6sLQYCYq
 4oFinwQSHFfA9rA+6eU4DfqV400oBbI6E2tf0sihwF1gw8ApCvV7CY1UPObN6S36n0iIOG5oVcH
 ECtdnCg9fJ3JGLFXbOj8CcXyzyYWcelHOto+OKEdSLcVqEihpL2grvPADFSf/mgrcYNvBd7o24s
 6bKxS0pq5XG9lLVGcjdNQaNq4Xp2zbfNwgz8eA4yck7qT7u4ClogXajOQZ/od+JuukN+MOAWwec
 sx7EvRqJJ88QZd6k7zkB2qBG67FGuwP6t0MVB1Rw5KBM/S+tmd0Ik7GQYC5QpSkWeUJ4lENabyi
 2mB2cR4ZY+PM/vpHJ4eG0kwGvA08xzNpJ+iip/8kLeYKvY5j7lPyvKuBPkPVtmpT1Ko4PysFrve
 mGxHMZ90RR/okoKe9S/BiFOSrFOqmLBZg58pS4w85QK1lohBnWUep6cBp0qlBClP2GA83fquW5L
 0toHPnjqzWafoGWtWJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-31123-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA90C91969
X-Rspamd-Action: no action


On Mon, 26 Jan 2026 15:27:46 +0100, Michael Tretter wrote:
> There are various helpers to simplify the handling of optional gpios.
> The devm_fwnode_gpiod_get() lacks the _optional variant, and drivers
> have to explicitly handle the error for optional gpios.
> 
> Introduce a devm_fwnode_gpiod_get_optional helper and simplify the
> BD71815 voltage regulator driver by using this helper.
> 
> [...]

Applied, thanks!

[1/2] gpiolib: introduce devm_fwnode_gpiod_get_optional() wrapper
      364713741ca19b8f6a506d073af1deff5b2d124a
[2/2] regulator: bd71815: switch to devm_fwnode_gpiod_get_optional
      09b174f1a554d69b9f69f3c6c115db12c1f6d29d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

