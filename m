Return-Path: <linux-gpio+bounces-1520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AAB8142F4
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 08:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22C31C21827
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 07:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D0B10963;
	Fri, 15 Dec 2023 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="n/io9ss3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572DD134A2
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=f0S3+gjDf210PNei+pB/kOTCouPVBbOjEiMOHdWqoL8=;
	b=n/io9ss3e///AaBRDhyr6JUbcL2GhxRwHNsnHxKk3NU677FEn3tjxH9FgkG2oi
	z2GRG5nRW+WPvV100tzlZY1+l5X7Usa1jxHCvNI0NSMoorWPxD835fZWYML2Ed1I
	JRyRwAh0SI1H4G7WrlAJgsAQFWWjPKt9zohaRl4T59btg=
Received: from TYZPR01MB4626.apcprd01.prod.exchangelabs.com (unknown [40.99.31.213])
	by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wCXAOgBBXxlZC+gFg--.28781S2;
	Fri, 15 Dec 2023 15:49:22 +0800 (CST)
From: "18711529674@163.com" <18711529674@163.com>
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: How to gets gpio status but does not change it
Thread-Topic: How to gets gpio status but does not change it
Thread-Index: AQHaLyrdxAkbQsyC7EeG7as7HUju5A==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 15 Dec 2023 07:49:19 +0000
Message-ID:
	<TYZPR01MB462621CF5B056907A3340C1FF193A@TYZPR01MB4626.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:_____wCXAOgBBXxlZC+gFg--.28781S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU54SrUUUUU
X-CM-SenderInfo: xjxd0wxkxdiliru6il2tof0z/xtbBlBVHnlgi48YFxQAAsH

SGVsbG8uCgrCoCDCoCBBY2NvcmRpbmcgdG8gdGhlIGV4YW1wbGXCoGdldF9saW5lX3ZhbHVlLsKg
SSB0cnkgdG8gcmVxdWVzdCB0aGUgc3RhdHVzIG9mIHRoZSBncGlvLCBidXQgdGhlIHJldHVybiBp
cyBhbHdheXMgbG93LgrCoCDCoCB0cnnCoArigILigILigILigILigILigIJncGlvZF9saW5lX3Nl
dHRpbmdzX3NldF9kaXJlY3Rpb24oc2V0dGluZ3MswqBHUElPRF9MSU5FX0RJUkVDVElPTl9BU19J
Uyk7CuKAguKAgm9yCuKAguKAguKAguKAguKAguKAgmdwaW9kX2xpbmVfc2V0dGluZ3Nfc2V0X2Rp
cmVjdGlvbihzZXR0aW5ncyzCoEdQSU9EX0xJTkVfRElSRUNUSU9OX0lOUFVUKTsK4oCC4oCCVGhl
aXIgcmVzdWx0IGlzIGFsd2F5cyBsb3cKCuKAguKAgklzIHRoZXJlIGFueSB3YXkgdG8gZ2V0IHRo
ZSBjb3JyZWN0IHZhbHVlIHdpdGhvdXQgY2hhbmdpbmcgdGhlIG9yaWdpbmFsIHN0YXRlPwoK4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCCVGhhbmsgeW91IGluIGFkdmFuY2UgZm9yIHlvdXIgdGltZS4=


