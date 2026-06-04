Return-Path: <linux-gpio+bounces-37997-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mJdfNSYmImqiTAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37997-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:28:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA16644697
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:28:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xes-inc.com header.s=selector1 header.b=KKuAjkvQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37997-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37997-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=xes-inc.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B71533085EBB
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 01:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871973B7768;
	Fri,  5 Jun 2026 01:25:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0053.outbound.protection.office365.us [23.103.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E35A38AC85
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:25:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622744; cv=fail; b=HoUylgi00+MGbTdNl/mDAlYMVkEw4tSHRv6mx4aF1iB912OYlJ7z0AzaDe3yRwYEompvELkz/38W+JwIoFixtEfwvwQlM0Jul40f1m4QEP2t4fVtvx8yq7Zfq7ZaeJCO6gHmTjU33pQOiXjzGOZH7L1p7z03LZBniURtb/RRs/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622744; c=relaxed/simple;
	bh=v/699KRo+sOYmPLEG3HgnLVGPkuqlJ4naMfz+PBlGTo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qlGpEfuD7D+wqd8B9KI1aZ8NFTrXuAAkOHF6vqqn9W+tStVbhO0/26koICw0icst+tBd2yqbDrZ7u0yhlQl3gpNN0qFVDja1kjI2JFv8AILh7NqYjREEuUTrc7hHP2ZO3M0V1GkRjn/HmcnKpIT+Hv45pbBDkRw2d5k+FJQGow0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=KKuAjkvQ; arc=fail smtp.client-ip=23.103.208.53
Received: from PH3P110MB1940.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1b5::8)
 by BN0P110MB1561.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 01:11:21 +0000
Received: from PH3P110MB2216.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1b1::19)
 by PH3P110MB1940.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 23:16:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=C3Du1SF5CsTRuo6fNWTXqOxjPuid4sPRwypCub3hUeiS4sw4nwK50sGgL10vFFHqEojHMe5BZ7UMwK8A8NU/sTvpAC9LujXU2/oDwR9e3R0SA/pHS23wFSEHVaH8t8oveUPeJEU69UTHuXEoiXw8ToiC72vL/zT2zbbNemu17Yy9fU+9EkHE+bzTuJKWn47rU+uTTCU2rxxTbsuj0PMpmirXzeqJjTW6LpLPVALvMz7qwaVcQRZ66qMvRz9mbVC/e0Wv0YU5HwPuIh57tAfcmvqDUNRgKlKxvLvCF2pAmQ8MXvU3kAOFOveJDjijLDo4SHKEu7S4fXk9JvpF8SKXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/699KRo+sOYmPLEG3HgnLVGPkuqlJ4naMfz+PBlGTo=;
 b=sYBcytd8uRDyKToib9XPwpm4aeVo/SrbhPybezJxKdxXGPKlbNRoEddhEWLutPOv6+YkJYAte+NaBRrYetKU1iRSVZ7nyER3tMHvqEizQKVOuCIDmT7rug9xuYI2usH5S9JMnKNm3LFiu5R1VAjECm0xTppIBrrxO+pxIkXVmWDdyzL5No8H2zo3UkrA69RJ0ktEeqrBDWC24PX2UUF8jFOj1msW0BEbv+u27sb5MTu3vpvHe6fMROWQUUfADb+gRwlVj1b9HNUts9KaC8xPPFolNiKpbFDO8C8XoSuBjESzFt3gVwwh52pl7LuRvyHljOBnUYOxg+NqV/1Wtgdiwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/699KRo+sOYmPLEG3HgnLVGPkuqlJ4naMfz+PBlGTo=;
 b=KKuAjkvQMrL2Qr+LMZzC/6JKxFaruL8F3vPr011iGjFe8ToP+LNza2+cs213XPaL7l+7NrKslgfCSURBOpXh+dZNGz9d/cOgclO5vMYYFXTXFH/3BH/OrUxqt6hoQpNdT2qEJA1+8YH/b8nxdNTtJghfwVtZ7Nulfm6/pV1seCkZEOd4ob42szFgZYW0eX67ZCv0AybAA9+r5Obnbd1sJdAzcg8bGtQMYFMe0MzMZYQBdiK6DRLcJr7sq4JFzPGPQZ4hG6J5lNTM8m/cuPKKi2cPGiHTw10zJG2L7W0AciMXc+HOrIl226CXnFLM4LneeYxBoQM0bgEyxK+W3H4Jmw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH3P110MB2216.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 12:26:15 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 12:26:15 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Kent Gibson
	<warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: "brgl@kernel.org" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH libgpiod v2 00/15] treewide: an assortment of pre-2.3
 release fixes
Thread-Topic: [PATCH libgpiod v2 00/15] treewide: an assortment of pre-2.3
 release fixes
Thread-Index: AQHc9B1WoE71P1JUz02qqfg0it8xyQ==
Date: Thu, 4 Jun 2026 12:26:15 +0000
Message-ID:
 <PH1P110MB16037791FCC9F233357459B69F10A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
	PH1P110MB1603:EE_|PH3P110MB2216:EE_|PH3P110MB1940:EE_|BN0P110MB1561:EE_
x-ms-office365-filtering-correlation-id: a05dce3b-70fb-43de-d4fa-08dec23478cb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|41320700013|38070700021|56012099006|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info:
 KIVCYMuaxWdCwAChJ909w4IkQSQRk4LzlTSo8pUyVsS0o6eLAwvTHWFtJ+lPFDBUmWahqeNTS5VGCRc1men5VcwGZ1+PUvgpd8y1cXX7lrdCGR/XhiBRF2QNoT+3LwjK5Q65QsEIJdsWNucjUTm7HvDrOJ9nbYY01dhMXTL5OnebjpciDdEbe+Ta4874OU12zzJwQohojbuYJYD/WjrjHSO3ejWiUXDPDnwqFPru5d0Sz3Vu1GAp6yLgoMQ324PK8Gud7szGlA9CFCAueX+won90VxfLdqkW+EXXD+8w+7qYMqB4a2myBHxPnpgIlUTy1HxfSCvyoc9usWgfS/YlNGoO0XzwXhheI1RJ3gt85pgsnLnGOvTxCuVwNAgI77XuFrkGhbA3sVAkukUtkzLmxrXTWINVXb7f4HadG4UGhWcvwGhaRbnjUN0SGUMOtXRzUq0NxbiMwxIddBuU8Mk4TAC9GHDufoKGMULnTj7wbCBSRSmAmYOFWQYI8QNl79jTrSkirQcoN3EbV9q5twTvdj8xtSfkhqvVZg0Tv3BF6SsPZdkc1DqENaaESJsr5cOOa20iL7NuX6iG1Ylcx4/HxyCGwyTmLDbNJ6QlSb5Dy9U87zG4pXI9TFVPLQqwj1ZJmSYOW1FDTDx+Nz5VhYttkGbb4tWYYxZgnlkzvHjKAkOuzNs6QIhN+h09ni/zl00qaDpVytq7EOZEr2+IAZrwYeuszh257O5pnrYluq93zdlsic+XUeBkkC4QOJAH+tSF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(41320700013)(38070700021)(56012099006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUxzRENOaTd2SWRuN2NySko5MVBQeEpNRmZjVjFOQUVhd3NqWC9LRTVtalVn?=
 =?utf-8?B?L1B6a0FTdWFFNm9VY25PZTJwZ0lURGtCb1VvT2F4YWs4QlVmYkJVZHAwR1du?=
 =?utf-8?B?REgrOXduQUZJa0dlVHFXQmZvMlJJbFpjQXo3NnFnMUpKTm9BYW9XcFpKMWZk?=
 =?utf-8?B?NGdMeHZweEFtZDkxR2JjZ3R1VXJ6M2loSjJrL1d0WXJYbi9yeWkwQXdNV0Np?=
 =?utf-8?B?OGJTRU95dGppeVVOZ1V3c2UyTmh3bzQvWW5FdUNCSkN6Y0xweWhlZ1NuNGZ6?=
 =?utf-8?B?MEV0dWs4eDNjMUI5NkpzeEY3VGl3TXh1d2lidXZaR05BZ3F2WEdCeC93dmF1?=
 =?utf-8?B?ZGJMRE9mSG1XaU5vNVIvOG9HNzdPSFNLRjhpcU50UUJOcDNxRW12MStRT0FL?=
 =?utf-8?B?ZFBpOGk4aFFVVk9MNTdKWThzcmFWa3ZYNWVmODlvZEdHaERJTHNyRUtLbFpo?=
 =?utf-8?B?ZlBydFIvR2dTbkVXc25HZC9QSTU3VzFMWnFaZmwzRnRaNkdUc2xuMUNaUFR4?=
 =?utf-8?B?OHJudjdtcTUxMTBkbjRldlNBSXJycWNoaVNSTUx4Unl2QnJWWFNSb1JEbjFl?=
 =?utf-8?B?eXFLcmZXbDJibTBBOTQ0UHNBK0tObEI2MDZhdDkxNmlKR0FrUWlUQXl2ekdJ?=
 =?utf-8?B?eDJKUUpSUmNKSTltRWNFc0JldXNRcE9DNTFpSTdnQ05oZHFOUEs1aUhEMUVH?=
 =?utf-8?B?dDBVaitCMlErUnN5OWREMlpPUkZJME5vcnR2eVArbHRiVzhuUlB4NEpPRk0x?=
 =?utf-8?B?WVYwZUdsVkZxTXAyZXBzb2ZSd1RtaW02ZUhHc0V3dFRCQVIrTHVmcmdOUWhV?=
 =?utf-8?B?dmRDSjZ0ZFhsTGRJcFFlTlFBSmZaamc2ZjVJUDlScTl4eSt0NExPeUMyTWZM?=
 =?utf-8?B?QXVFWGFZY2wxSmtJNDhMQ1EzdXRjVDJZeGgxN0FjQUFYenY4aFRJakJuem14?=
 =?utf-8?B?UXFFMmN0WURjeVVLUURXQzB4dVhsaGlEMXlrWXM1K2QrYXlva043UERTc0Vr?=
 =?utf-8?B?WmlzMFYvWHpFREJPWkthMWxtNzJOTlRubitmZHE0OVBwbzB5N3hic0w5NUh1?=
 =?utf-8?B?dm5nQml4SVRHSzRCWWxEUVk2bDRhNU9LTjdSb3Uyc3A0OWhhQ0lUZmNWMHhw?=
 =?utf-8?B?d2NGdjBkTzNabndzQ21vOWZETmMvSVdETG9xU2RHVzVGVFgyVCswckdOME0w?=
 =?utf-8?B?b2xqRXdrQ1JnTmVOQ0s0ZGNlL0p4ejljeW5sbUZUUTFQcGJqOFFsbFQvRnV5?=
 =?utf-8?B?SlZNRXo3dWJkOGxHQS9Dc2dDSnZpb1lla0lDWlJwY2ZqTEd5aUNkSnZ1R1NF?=
 =?utf-8?B?TElvSHB0WGoxZ040bVlRWE4wYWJwSGl2SWVIOUlHU2dOOUpJaS9HcnU1MDNo?=
 =?utf-8?B?QzBmWDVMNE1vaHhON0FIL3k1MkcrQTNrODY2UmcxdjNxZ1JhMjMxRHBYV2w0?=
 =?utf-8?B?eXpHOWtPT3VVQ1JITDdGWWJxMEVRZm1vUC82K0lRYk44NER6TlkzRFVVL3Yx?=
 =?utf-8?B?Z2NDb2VzZlNiTWIzSHhqSS9sYXdycDRONmtYZW1TbVpRYWFFOGpzd3lybjFH?=
 =?utf-8?B?Ri8yVFA5dm80NlVuR2RKeUQrY3J5T29aVlZwZHo3NlJJRlZ5bytxcFV2eDVo?=
 =?utf-8?B?dGFBVHpRRiszV25XdU1kaXJRWEZ0d0tYTkhNSWdYTkRLc1h3dDRSZVV1L0Iv?=
 =?utf-8?B?QnJVczh3RjY3VmRiVUNTSFQyUU8vWWJxZEJDTHZnTTQxdDVwd0NTTkVOcm9X?=
 =?utf-8?B?aFdDNHFuM1BTbmcrVzdCcVQzWHU0RVYrU3JJOTY3SitQY1JZM2FyQzlhcFlX?=
 =?utf-8?B?UWJDN0w1WEoyNG5GOVB5NjFSSFh6M3JXS0F3TjlyWmgrWkxwSXFMRzc0YTkz?=
 =?utf-8?B?TnRuZHpDdmhoNHEwZWhDbnYrZDc1SElYNEhzbU16c1BjUUVwVmIyeVpQSzAr?=
 =?utf-8?B?dEZaSmxpQ1hMbjdkbTBHZWh1VXBhWTRLaC9xcG9abXVVK3R1VVRvbEkwU2kv?=
 =?utf-8?B?K3BVVlI1QkZjc3Y3N1h2bjZuTlRJaXhDM29ra3pCeHhrY3AvaGwzOHVKV0k5?=
 =?utf-8?B?ckFzZXdoK0hmWXBvSGJmTzRQK3JqQXFzR2h6ajJMNFdsdytDUG14b1FtdzVz?=
 =?utf-8?B?WjZZKzlMMmd3YmpjQUhTTENBNHMvS2tyUVMyRWw2dXA4cWM1ak1VdTZLNWx4?=
 =?utf-8?Q?CKIkgdkocC/yyo9MolvQ2nt+wBLuy/BDVyuDKdpW/E41?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a05dce3b-70fb-43de-d4fa-08dec23478cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 12:26:15.3681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB2216
X-OriginatorOrg: xes-inc.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,riscstar.com,linaro.org,kernel.org];
	FORGED_SENDER(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37997-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DA16644697

DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBKdW5lIDQsIDIwMjYgMjo0OCBBTQ0KPiBUbzogS2VudCBHaWJzb24gPHdhcnRob2c2
MThAZ21haWwuY29tPjsgRXJpayBXaWVyaWNoIDxlcmlrQHJpc2NzdGFyLmNvbT47DQo+IFZpcmVz
aCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+OyBWaW5jZW50IEZhemlvIDx2ZmF6aW9A
eGVzLQ0KPiBpbmMuY29tPjsgTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+DQo+IENj
OiBicmdsQGtlcm5lbC5vcmc7IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBCYXJ0b3N6IEdv
bGFzemV3c2tpDQo+IDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSCBsaWJncGlvZCB2MiAwMC8xNV0gdHJlZXdpZGU6IGFuIGFzc29ydG1lbnQg
b2YNCj4gcHJlLTIuMyByZWxlYXNlIGZpeGVzDQo+IA0KPiBWaW5jZW50OiBJIGFsc28gdXNlZCB0
aGUgc3Ryb25nZXIgT3B1cyBtb2RlbCBhbmQgaXQgZm91bmQgc29tZSBtaW5vcg0KPiBpc3N1ZXMg
aW4gcHl0aG9uIGJpbmRpbmdzIHRvbywgc28gcGxlYXNlIHRha2UgYSBsb29rLg0KPiANCg0KUHl0
aG9uIGNoYW5nZXMgbG9vayBnb29kIGFuZCB0aGUgdGVzdCBtYXRyaXggcGFzc2VzIFswXS4JDQoN
ClllYXJzIGZyb20gbm93ICgzLjE0IG1pbmltdW0pLCB3ZSBjYW4gbWlncmF0ZSB0byBQeUl0ZXJf
TmV4dEl0ZW0gWzFdLg0KDQpSZXZpZXdlZC1ieTogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1p
bmMuY29tPg0KVGVzdGVkLWJ5OiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+DQoN
ClswXTogaHR0cHM6Ly9naXRodWIuY29tL3ZmYXppby9saWJncGlvZC9hY3Rpb25zL3J1bnMvMjY5
NTEyMzA0MDkNClsxXTogaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy4xNC9jLWFwaS9pdGVyLmh0
bWwjYy5QeUl0ZXJfTmV4dEl0ZW0NCg==

