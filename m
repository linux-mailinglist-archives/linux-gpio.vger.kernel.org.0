Return-Path: <linux-gpio+bounces-39498-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8HK5Or98S2r0SAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39498-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:00:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E270ED9E
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:00:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nl1v6zBy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L4TMAPLR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39498-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39498-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE06D369A2B5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 09:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7317041F7C3;
	Mon,  6 Jul 2026 09:03:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E74DD6DC
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:03:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328625; cv=none; b=u7SGPQO0SmmjYehw3eezl9cogYPMD5wYkE0PDn3YvJp74+56vktVp1Hh0cNlmuleyZWteEaXcO4C93bAauLmAN1dPB/g/Se6uTwAMBy6ePop93QEdfcudhHVSHoBKkz4XFZ6tJyMvIbJ8K1A8rYZmaoVOdmhXT+dFMRQZ+wINoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328625; c=relaxed/simple;
	bh=klvQOgAtljMtVjWy8qF4a6TJtFT7M6YfrjVAiyQwwnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MzxjO+upYRGfhWS3qTvtnr2RUs2DU2hytVj33ze1buM8d4VHXi6oaJN1CLuYm+TTs/NgSh8iFnNjfnFGB1filx9F01OcrbqZsSAQyxetHLwwFaV6d2jc/Zgq5a0fX7O7D/JqEC7creTOTPMUoFedcnF12d8GeIJxGvtvRAVIZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nl1v6zBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4TMAPLR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641nuN3614699
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 09:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YdE3ihiImEvpnsnxDd0JAGP3wIV9I5utOIQwVGrTwY=; b=Nl1v6zByB4ofM0i5
	XZpXiJWbZ99X+//HlbqD9sd6EroBI2aNeQtwZXmnmCxkxWSVOZi2PwZOFuBAxeuq
	Y7F6n0vv6UmTyh+aLcIrlHBHyvgChlKT6ImklHmSh0sYNacOw6srgBjdjcg9ROul
	Jq2/D8+gZDm1xpyJ0N1CaHN0oPv2FCGdscIpVkAzp58TKIV8qZMb6KktiYfxv5kH
	lsLSo3lSs0U53cYBSNUsEBeNsDKAeEd9WCQP0te40yj2GXPu3wKFBBJTZjYx/s1i
	iXssfX52bLJ2v5FbQXzq4/s+YlH3qrYwzGp2tZgjRMLne5PxGUYawbJOOfawHLSm
	GEgD5w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvngjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 09:03:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ec3314f65fso29144016d6.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328616; x=1783933416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YdE3ihiImEvpnsnxDd0JAGP3wIV9I5utOIQwVGrTwY=;
        b=L4TMAPLRYpLd/HSXCkwMg6ihlYMSpB3xmwdncy1A09aRdhZW5FFTcvZwLJIMlN43C/
         6CTs+PqI4KjGn4UE+/fbwyWc/tCycpRG93k9y5h4aFYJuYkHBEMs2uIPM2LKYyB6PWTH
         sttWAZWSDK5NdCjH7LhDomnGK9oDPOInQCCo59HLEDKJ0/kRXSHWSJBJrAD0jX+cj8zU
         j1Fbqj7ciDPXaqRj6OvhY6vMJmoDYLkvvaQ+w7yVkGGax88v6kl9Zi2J4kRrkIFpHcMZ
         XHDH0KaZd3LJbFGwJbz+d9HuvCwPigWrmXn0kqI1pfSGxwPnVakdAJh13g8qjrpgNzs3
         zudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328616; x=1783933416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7YdE3ihiImEvpnsnxDd0JAGP3wIV9I5utOIQwVGrTwY=;
        b=gQGCJcfgqEIcFEFOfBN/JWsMYKcQ3XErz2+WaMhDVWll9cvevBrJq/7h3NlC0fLNDh
         mlFuOrSils2yeav4PoUQtyH/jlbIXkvHOsoQOaBTEYxVOoVVC1itQpQS5ZwQMumBv9yo
         1XWLmUCT602ivxoKlAnKFSYbwkkALY3Norn2UwPe6q7K3IC1zghQtRq7hZvlfqen7HOt
         DFpnk6XRtzmFWLDrzVvWPnfSxQBDCTxjcjEPqfkTVXp23Nt+o7qGLX5RZl0I8TIxcbRw
         Pz0v+dxFk7AXWmjoZGqj9E0XOux/BGHMHSxZwuEIt7EUvU8nujpypEKtHHI38h5zH+FI
         lLpw==
X-Gm-Message-State: AOJu0YzbXRjDsLJOgiqNqwtQjxSyfJyIAEyX9WsfuCjQTeVgt3DyDZCj
	kTXp6slVfYq76RGzkuBbYglbN4vjlvF+GRd9N/j6aCY2ho6ziws5l+LUKI8itQRy1nLY+Fcedvc
	MfbQ5OLdLrCLFOWe3yZcZGcX5ba/LuLaxu8gejJ0a0+QKK82hLDVDwObGFqLsp9t2WY+QQMqu
X-Gm-Gg: AfdE7cl1Vv+iIGKyxP2eaCQdM4t6yucme1SVFAK3UQEtXp0NIluBU7flAQtgRKWVi9M
	U0tPTPSzxN3LTg4+NnhvgrZE+0xUyMsaOyGfMEfWlNHHdQHqFA6jxgVpQkTvXqMX4mw23Gv9nQB
	QyJvKGNOFBRgcN/8o8MK/GMteTnlHfJz1CNsNYkKLTcJeptimh5eYSYoksUzoHtq+xIX9yVGPCL
	T3k00SvRk6QwC6s1gQXFRoinZx3ls7dJb2//ZhrenBAtQU8txWD2hzLTV4eNbj779DUz4T+/OOP
	ie+ZM5rI/6B88Zgt9dlqI+bIWljUHzqPPSZK7VsZhqdWZCClDjW+yMogBzkSTOm6kAF/cNdgHh0
	B8ATq6C6XO6HrkGs0bfgK1+Iv9zT33rpBlWB0yFY=
X-Received: by 2002:a05:620a:19a1:b0:915:9984:5781 with SMTP id af79cd13be357-92e9a4b6df4mr1211439985a.51.1783328616170;
        Mon, 06 Jul 2026 02:03:36 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:915:9984:5781 with SMTP id af79cd13be357-92e9a4b6df4mr1211436785a.51.1783328615580;
        Mon, 06 Jul 2026 02:03:35 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef23feasm326998025e9.2.2026.07.06.02.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:03:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Drop unused FILONOFF macro
Date: Mon,  6 Jul 2026 11:03:29 +0200
Message-ID: <178332860257.18708.3358405978756555451.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704151055.211082-1-marek.vasut+renesas@mailbox.org>
References: <20260704151055.211082-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b6f68 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IyeIIUWUMHWuZ8Y4CW0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: sIjTxrGxIA-nGCMnWVgRW8tI_BjL4sel
X-Proofpoint-GUID: sIjTxrGxIA-nGCMnWVgRW8tI_BjL4sel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXwOTv6Hd5soeh
 wKvmjSUjeQ1oP1EnBIly+JJKH9XCnELXeCjDbHG+O5T/OxFBNDBkmbwHLlMBY6Um094jGUM7ekc
 zleXNTW5/jariNCqiIQM5sHSpr1FC5HwA4dt4YQvE+3ieJikKpJwAcNi7b7TPlen0IOSZqlQHul
 UNvQ67GARepIZQJGWKmcpDbGJoVkMauuTwOWSj57aW7XRZ77FR+kimp1pl9Qpdzs12588BM7XhM
 I6KwDhvwhojxMLIc6TrMoX1VQ/+64KuQIQVkUBXvtwciN2AZxcehO3EYlhDXFQXIGW8Cbw8pZrf
 K3rtkNKLphvChbyzRSSfTWADkxdoIuZY3zxU0+4K0vKQRSo2TwOUyP/59z13dNjJ1SGy0+jrGR4
 PxnJlDTnx9b8BWl3baG/jqMuJMtdThKKGL4QJu3brCxs0S4brx3XX/IOolJyV/REipyTZu3WJ14
 V32NvrgUfCIn2v3tmnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX4QjLgVFNpo0Z
 kzGJ5EdGSXT+bTV+TOH2J+cyyDBD4O3kXbvtzjI11D3k5vj6oNPD+er+FNiZOarWR0pXSZbGnmD
 DhUaHk3GutjTWBO/KIQvXya9tJ9AHxM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39498-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 588E270ED9E


On Sat, 04 Jul 2026 17:10:39 +0200, Marek Vasut wrote:
> The FILONOFF macro is never used in the driver, drop it.
> No functional change.
> 
> 

Applied, thanks!

[1/1] gpio: rcar: Drop unused FILONOFF macro
      https://git.kernel.org/brgl/c/1048d391664a5b56dc5db4a1944cde47d749c9a6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

