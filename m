Return-Path: <linux-gpio+bounces-38165-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kc/lF3v3J2rJ6QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38165-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:22:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2C265F715
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:22:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TehoesCk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JdqvNNZG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38165-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38165-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1832C3055935
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 11:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55273FE66F;
	Tue,  9 Jun 2026 11:20:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6505E3F9F20
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 11:20:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781004014; cv=none; b=e9XfTebPGHUVng1aF4/ucKH0ScFvxNduosWxmfr8XXl/0OEnZOOEGhrxdTQiqPCtrH9BvGbllNJMm03oX8fGAla5BXGbMT7tJlaWaVgvbkC5FDCaQjpNyeRY6ztKL4xfXgCZsSOhCAUJCeVR6G0mx2NWQU08fvnRvOEe88wY3OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781004014; c=relaxed/simple;
	bh=xSQPvuwxTIgjKdUtGmHrZUE4jfRZQ+CkqCaWgAjgWqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YuiB4Uyd0FdjIFnD4y15wNpCIoZWDsK8MA+WLI8EEWuP014FalqLtLbEVxsrGThVLfmRWHiaNmjLJBI+jAJIt/cE5hfm90kXS9Rs3ynfJNiyv2ZMa1JEsQXw6bhg1tCwqAFF5RQanHsp7EBRCbZNOX8oltxmqwSss7O9Qpbe0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TehoesCk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdqvNNZG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xgTE2245474
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 11:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	No6LVFTQhwTNToKcyzXAamEXRv6Jk3oVE37T0V2RmtU=; b=TehoesCkzSpOkHNH
	xpREjEQZp1QWY/puv9DtEeDWecf7IrTQVGDu3SUqbUYR2n6gmPBYIaTqnqHe4PuE
	hJdH1TtyDE0B78Ue6teIO8CTgTCz/n/YiEtnmLhMb4uQjS9Ezs4zgMKLsHOs8b4T
	UkLAB6+AdW2b7L7Zx7jM+zpdonRK7SEOPgfM65nc/WVi2qApSRYcenQ0EJQ0WLbO
	jY3vd6EVKmbU48sc0SIvAYMASIQmydKWY0FvYPvuaYPPZNAlA4XmQLpPDSyl0fob
	e0H77NMUdOhv6k/brMpomIfhU5RNeJcIItRzetkjdr8pHo/zUhdUvOOclG/epFEc
	hSRNAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds97f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 11:20:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177f07eb05so105970161cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 04:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781004011; x=1781608811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No6LVFTQhwTNToKcyzXAamEXRv6Jk3oVE37T0V2RmtU=;
        b=JdqvNNZGwhZsB+GNgaw/7l4r/2iSjkn3WpwYVJstSXUqBXsJ4D4ZxGzjkMVWGtT65f
         PrvznkofvqaCRZ/XNKut5cODfCSLveyeJ3lau1DJlXr3eSbRcRVDCvGgQWzRIdU9q0XW
         +vWAPMUjr6f5EExFxbRwswMhSQGn+u/ShT5T+a7dd8k+lZIatu39g7obu/faHttuj+qU
         G/AgfB1xzEnqiQ3SkeRASNKR3ob0lkQXsxTcsbzVTZsebfDwQUvHSaAMkEEmGwZPcUUv
         WKFhpCHsAIF+gIq8kMxzKjMVaT3Ows2+9cHmcudlv2gMtzMcCGmhaAICQFo0H6XrEC5M
         iN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781004011; x=1781608811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=No6LVFTQhwTNToKcyzXAamEXRv6Jk3oVE37T0V2RmtU=;
        b=qr4g8dkLeDb7FAeeN5T1RLmDzvh40gadWRH9fkDxYFlTUfY7wphYNPAsiHqS8qxkoz
         KIpSCuUxFZTrGa/Ji8QkVtEOccVhpzbpRtX9jbMe1FZTZw+BUzldyIV5bhwfCfpbwqdS
         ZAPb1aT/wV5EJcK7Y7pnU7NOkGC3Wt4z/qaV8/2uf3C1KC7/WJ2AZvxA8IQbIu8+4+QR
         rojCzFe4G0jmFLPMETBWSD39OafPjqgXiBuBLgEMQ8IFmglgps+kDokVW7hgw1l7kkI6
         fLD9McYwNXoDyoNA5/RlQmCMymAvW/ixr3ghvzLaqojZdsj7MoX4nw75vYQBjLyt/Ihi
         w6aA==
X-Forwarded-Encrypted: i=1; AFNElJ8H/14fe362sd0rSqvcNzWmmCCULOeAd9aXP1qnTt8H4t85QKNwt6Xqb2SQL0FWm8lQ/JzWZVko6RF3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4UcG/57sFe48Ud2cSl/zqtRwk9sGuPpVQELUHZpCFxyWXN3ZV
	h+YxCYq6ERNF82poGlrbuTeTTpt7V/A0IisGjk+esTVXJ2RwBtxh0OeC2TqIVZjcm1DrkwDltyB
	SR1d4itlXSYTXCFtLQvZBDE3Bhee8M5hrERMAHNHbKrrBWXPaJe05WSDezUCBl+I9
X-Gm-Gg: Acq92OHFC/jQG6M+fLxxam8Mt9kKlTQT7TuaVFtKkgW2DJo939JB5sezwbvHj4TkKFo
	0pWRY/EUWBhj637PvusG4/+MWOj8w5CaCzsi3KCdJCo1N94PMs/ljbqedin0Y4M8vOHQymekrfq
	wG7hHEwzIvzsR19qiRbHQbBSxuVHSOLIn9/X/t+TQnb0FTkb1m78K8SGKEKovfSGCXxDTeE4MhN
	PRYh7+rXCKU+2XBBSkaNjWHvwHe7P38cchlE2yvfp2PvyIqK3pAkGRp5+w0SYSe6q/bNX32LnOB
	TlC3QRA+gQ/r4bzc+nn//pwGdx3jxjNcCeTc3eRuz6k4pZVl3djLnTtLAuA9KHD0Wil0vZhMmnq
	UzAWvxrao5Oh39g2yN7p7Uokrm0Gt2cE66ttDUpxn8cH2cpz+B8SjiFsofggx
X-Received: by 2002:a05:622a:11c3:b0:517:5b22:f4ac with SMTP id d75a77b69052e-51795a48330mr276407321cf.5.1781004010511;
        Tue, 09 Jun 2026 04:20:10 -0700 (PDT)
X-Received: by 2002:a05:622a:11c3:b0:517:5b22:f4ac with SMTP id d75a77b69052e-51795a48330mr276406931cf.5.1781004010084;
        Tue, 09 Jun 2026 04:20:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7c63:2aa1:b7ca:7546])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d52e5esm230157325e9.2.2026.06.09.04.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:20:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bamvor Jian Zhang <bamv2005@gmail.com>,
        Samuel Moelius <sam.moelius@trailofbits.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mockup: reject invalid gpio_mockup_ranges widths
Date: Tue,  9 Jun 2026 13:20:07 +0200
Message-ID: <178100400392.129779.6829377874761205143.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609004538.1240091.3fba33a20b88.gpio-mockup-ngpio-u16-truncation@trailofbits.com>
References: <20260609004538.1240091.3fba33a20b88.gpio-mockup-ngpio-u16-truncation@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pJQoFf0tu-h7fKY7hgQR7K6lEWwqXZ54
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27f6eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=a08-lH3XYqRyic--Nw4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: pJQoFf0tu-h7fKY7hgQR7K6lEWwqXZ54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNiBTYWx0ZWRfX2YdoH+ZDFMBv
 XAspEX9WrHxiy5hW3eMb+YhP3Ty1lDbWbg8h9ikJIm4MYYLoYCNb4FDQjN6LqBfgr4T3YzoWgYu
 q9htoFEUoN7GtovVpP45T7mpJiQn3PsAPApH89Bh0a3Lw1DK8L1AiLP2kTvZ0W80zruEpiqyafv
 Nz2UDe+AUfpfwf8GJnrLNL83pXWnE/dkfbftTpHL3mK6cjK2P0ciiMyTsh9168uwUu9UmteW030
 MnZ8lr+12ZRkFSv0XSKlonnnJGp4bltxUDj9yvNqg7mNb/mNpGamijpnQMj//xIWBn+Z2sOvZoF
 a+JK3kQqQSvtjRwmRLCQIJvffIQ8LhdlzwKwMK6vrjv271V4yM3TrTi48J9U24wJE37d073NAGH
 gtKy1e2UBnCsIRTM7x5lrUm3PnxJG7IcsxfBWE7rf/gv/7AaG4K8YcaQEn9SilmuC+uKyHxHgYt
 gtvy0dO4yeReje13u9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38165-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bamv2005@gmail.com,m:sam.moelius@trailofbits.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,trailofbits.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC2C265F715


On Tue, 09 Jun 2026 00:45:38 +0000, Samuel Moelius wrote:
> gpio-mockup validates only that each second gpio_mockup_ranges value is
> non-negative before creating the mock chips.  The fixed-base form uses
> the second value as the first GPIO number after the range, while the
> dynamic-base form uses it as the number of GPIOs.
> 
> gpio_mockup_register_chip() stores the resulting number of GPIOs in a
> u16 and passes it through a PROPERTY_ENTRY_U16("nr-gpios", ...).  Values
> greater than U16_MAX therefore truncate silently.  For example,
> gpio_mockup_ranges=-1,65537 creates a one-line mock GPIO chip instead of
> rejecting the invalid request.
> 
> [...]

Applied, thanks!

[1/1] gpio: mockup: reject invalid gpio_mockup_ranges widths
      https://git.kernel.org/brgl/c/446e8c31d0fc7f1d92c06c2d2f7e7ed27f55f0c6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

