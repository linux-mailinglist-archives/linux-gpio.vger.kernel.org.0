Return-Path: <linux-gpio+bounces-34954-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO/6Le+w12kORggAu9opvQ
	(envelope-from <linux-gpio+bounces-34954-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 16:00:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 298333CBB0D
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 16:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D74013005142
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 14:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FD43DA5C5;
	Thu,  9 Apr 2026 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erBFKGmE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0m47IL2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70643DA7D5
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743209; cv=none; b=G3/hgizyHb/5X8Hst6xCSwAQZpV8wNi3N/ZJ9MTOhzDe5+lCa7xvsGuu0smTirgnShA8rLYhMppwjAh7wduEMWgnFZobgIUJJTdChC1KFi3kwPGaGkSMAe8WEwD00AHrCn2gI0S2/nbUyHIGDUtG/OPf+KFH/cYNZHUIw9WyMqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743209; c=relaxed/simple;
	bh=SZcr7dFFx/HqG0JBLpYgsFWXkSiAbQ2w8LnHJcDf3+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BCEGtsFljlNyxmluULXryiieyev9nmxpEDyD9X73rT16JG93tsNrbnFjXWyGanql4Y+8UZjvo5c+e8d9iZ5ptnGQnRKmnWZkkbezaPMy6mi7cNOt0hp0JP6UJ3acOMSgT3S5lfTSBBYnZpNoZZQijww0tIvSfE1b3XrLkdXdxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erBFKGmE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0m47IL2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CKp6V3352631
	for <linux-gpio@vger.kernel.org>; Thu, 9 Apr 2026 14:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r31whLi7CQ0J1EL5aLItfX5SVplnR48JHc5fhjXLdz8=; b=erBFKGmEWFstHqVH
	W+0mQ9qVcsShfVKoVuUM2/XIIDXjGEZGaq1wseDsDNhqYDAWOoYTspdcZGmakeMc
	p4/jOnQiCMvqBQroyjl2ackELhwpZm7sauHLFo0v6qnsUTBlD9ReWbRbCYODKQsD
	5uJ5sGG0MRBi6IUhFR5bzJ32zA4Ce/WCTE/REqjikMFIFNxi80j96QR3ewbRTpky
	QGtLHuMyY/A6e/UFu5LtLZqH0WVrP7M9GMjRkQhT7XIdscqPGmUgSMBrv2jsO0Zf
	yuMUfyM9C3sn5jUXgrwThkfy+PHQbnXwM4Rdmz4eRnjAxG8uGfWthAs7lph6DAGt
	XPMYIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qre5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 14:00:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso4159451cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 07:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775743200; x=1776348000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r31whLi7CQ0J1EL5aLItfX5SVplnR48JHc5fhjXLdz8=;
        b=K0m47IL2ETGQ1CQtSDwgo/ARu7y10FzVOQfiyxKUjiUhreIM0tBKUrN4xXJ25KkJvy
         GxXh4oUXd08pZ1dLVXL91yhi7q/7jNXrkBy/L9aA9PIsh37kkuNk7RW7YRZOBfuBN4Z/
         ahhCsCAlRnwEdP7k3o4IDM1O1SA7UFPsGwumkNXYuIps3v8CGKhKLectiZP5h0ssV2X4
         v0qInsngvIn1yErc+RIZkUdUQyomz+LBuZo2m+XjRrYafY8GOHChYnfU6VgfwYRFmYEn
         ULkTyIaRgVHtl8OVnhlTezYlcydF5a/hoDiv1StIokx217xx8QCSpCZagWbV6SV8yPcI
         j6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775743200; x=1776348000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r31whLi7CQ0J1EL5aLItfX5SVplnR48JHc5fhjXLdz8=;
        b=fvIOBVGoJ8nsLu7VuPZEMoe0tIjfsfkUvaUB3909Mor+QmYoEhjo4oG6XET5JsgZck
         kmKwktEopo+cPNN0uWOI9L0QWAzAJDODH0X4B4ztHpar8N3mqjHLNuPGsJdRsIteO3N0
         YSQGkf5o3u+hJzJ3ActkSyvd3sYqSoEhMq1rSOVrdHM1o0Wh9XOEGdb7WDf8lW1I5qL1
         dgSwN1R0u0QXb/SlPcELKNFXXtS7AV/X1ocgW/mM6MIEIkxOq8MY4tvYGzAUJCOSMo8U
         t+h2gO9OY2HNH7LXSecniqr9a1OJu0+j/ae3EkWVqb4buBfYHXM/etkj2fMw8qVEcnBw
         i/WA==
X-Forwarded-Encrypted: i=1; AJvYcCW5AYQjFTFZyMVmVWTlWT9u7LdZOc0KuAEUazmoOrIBNuDtg4FMDsJrWvMFondKA/V8Ul+owi3/FSRV@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWQ2Q/Y+5EcHb98NK+GCIopZXWpWX/t03txU7cSRYr1Iy8PaQ
	/PPl+qL9/EAuZSNTXDqVmc+zgA5e8NKkbxrizYOz8MZ70pvufCO1McCtzmiiSoozyXV4RhnZQ/1
	vReQsO8mJJItnLqIZNIqRL6ZJTC9qJh2HezdBF7HIerXqEccaUTSHzJ+EdbWdlpiU
X-Gm-Gg: AeBDieuh4I7IaeVk5lf4F4yc4gbol25vSaK67skicEQkrof/L77rVIX7hM7M9KLOkHP
	pIHT0hFEW7LlJ+IiGzHghNsi0Xc/XiV7TFcySPGO6PGiis7M5VqHWgvYYPF586ggIMsqX1eORxJ
	7BebCtIvpz7pfDtP+E9QZJPwPhWLyO+vtOYObXo/1zqCtiDyni67+t83cNOtcEgLM4IAJmhuE08
	J/+/FoaF1yY1HpdKX34KuiPFVd0b9Z343epadWbyIn1P6Uz1zRQWeOJxiXGS0+K65Yz9CmCjVYW
	k7UjgqNiAIUuu5/QWpUXn4FsEzuz8pYPsPSipLAqFMhhN8OLnE1Ga07qb4PGVQclgW+LV69TDo6
	hYCiyh4bpkJ7AB8H0GQJxM4PppIOqYhefp9qAkHlFGNcmBnx7IA==
X-Received: by 2002:a05:622a:558b:b0:509:3098:819a with SMTP id d75a77b69052e-50dc22dd2a7mr55274401cf.44.1775743200023;
        Thu, 09 Apr 2026 07:00:00 -0700 (PDT)
X-Received: by 2002:a05:622a:558b:b0:509:3098:819a with SMTP id d75a77b69052e-50dc22dd2a7mr55273731cf.44.1775743199450;
        Thu, 09 Apr 2026 06:59:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2346:762:14f4:8b01])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3ba180ffsm117373666b.35.2026.04.09.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:59:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org
Subject: Re: (subset) [PATCH v4 0/2] driver core: make references to unregistered software nodes a special case
Date: Thu,  9 Apr 2026 15:59:55 +0200
Message-ID: <177574318973.111981.5466026181315933610.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyNyBTYWx0ZWRfX5DNDcAVj8kuw
 Gnsl+noNfvrfiN4qeyX4/bXBuukzZmLqG+OQ3F6zpWx/tZgx4nrlKkzvDd2OR6BJa7rP/NQrZU3
 S3kRzb3c9fFNkQ99eiiacO8VeCqoGgIYTNiISzpDCqYTBIna62QhwwGEKCLzE/3Q3ggGbcZUxcT
 B0O8b+dp37tegDHUL6kXZQrJQUyAxQ8U7fSZ8hZx9tgBCAM02KMUX7XcxnF2PNHCKT6nWOMAXGR
 ZvZNRa8wMlVY2kcQQDsK8glDiXnliLn0qHCoh6SLVxrr8rTyHR2JP7CSVy4w15C2BMyooyk6EcF
 LVOI4IyfckX63w/gfmsTorfLgYrVmHlBKxdKT5mU/Dd/dLFucdP66KaMHTHxlectm0hU7YbtmZL
 pgfrl0ClODymNOaqgmdjGgC7lGD9fpmN+BuYqBWWwYtNuzquBXrgex4eq/V2JPbimJb3IpSq7iu
 au5ElR38S5OmhIgtSGQ==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d7b0e0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-2faNgSI12pgEayDPOwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: wPhr4nqtyIa-zESLoc1R6YmLnRh5FnQR
X-Proofpoint-ORIG-GUID: wPhr4nqtyIa-zESLoc1R6YmLnRh5FnQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090127
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34954-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 298333CBB0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 07 Apr 2026 15:27:56 +0200, Bartosz Golaszewski wrote:
> I spun this out of the bigger series (see: link to v2) in hopes that we
> can get it in for v7.1 and make follow-up development easier next cycle.
> 
> This series proposes to make unregistered software nodes (ones that have
> an address but which have not been passed to software_node_register()
> yet) a special case with its dedicated error number. This will allow
> subsystems to defer probe as if it was a firmware node not backed by
> a device yet.
> 
> [...]

Applied, thanks!

[2/2] gpio: swnode: defer probe on references to unregistered software nodes
      https://git.kernel.org/brgl/c/ca13ab654064fee86d6e7c9e87d0af7789561509

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

