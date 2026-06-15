Return-Path: <linux-gpio+bounces-38433-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +jcMJd+CL2rnBgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38433-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 06:43:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C1683517
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 06:43:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AyLEMwkG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38433-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38433-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE8003009526
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 04:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B063E305693;
	Mon, 15 Jun 2026 04:43:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4225B098
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 04:43:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781498584; cv=none; b=PKpcYp/2KQaoMVVYsOYRzRha4TmnM1doorWQwmBFUJDOJyMnnU85lxpK7Zwx46zGcuHXbbz2AwS4vRQHFLNjQPc7DCDcYwPH9avqYdzPsuMWVra+sGcaIAHTG69gNJsXyxrmLyGE/awTGw1FtxP1xALMa6YTpa6PGnph4efK6cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781498584; c=relaxed/simple;
	bh=FdzmA9cNqe8kCysYCqcBOJeAapnnHealTPUZxbjYDTU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=nVxE0HwrnTbZLe+jN0J1QuC1MTQdwQ/idqPVCBJ9J6E7NPnNKjXBhS6jxTCOnLs6dHdCfZk5fdf3HK7+R+/Lxc9IYf+spKq0OZMs8owN6pPZpmPWP5FHjUl7gVdHYWitq7FBdbbzwHpi4bn/Nq4wARhS9HlALAWDVL3Yf2EF8XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyLEMwkG; arc=none smtp.client-ip=209.85.222.52
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-966aa0f3df4so329626241.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 21:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781498582; x=1782103382; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/0zATgZkedxxJFW8wtHE/FC+bydOMretvCllv2EasY=;
        b=AyLEMwkGNYVTjVg7PGXKEDWRALnxpwuukJRK0nT1NR0c8NHtaCRy3RGNmrUAicTn+Q
         oPVEwbHXpGxfbXbSELUIpWEkCd7V3WejIWP10A3pAyva+osPq3AHLEA4OgTtrbs0dwdH
         ay28MVzNH+qMr8aEpV94zsHUlWd65vowhEEB2Lot6i/C0KxBNldW3juBuVdQw/dzBr7T
         J1NGIF3UK+wPLZMQ5ORXRrO7YMUL5bcT1xVMIajXOx1rqnVKrflNddfs8iM5i6QWvnhO
         bQ7wWXQqK5lXULbKGgmpvRQmoq+Yf4dWH9SiUywmpIW7OiVR0F8mno3w2jHVrK7dPjXn
         28mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781498582; x=1782103382;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/0zATgZkedxxJFW8wtHE/FC+bydOMretvCllv2EasY=;
        b=JwruwVrDetzLSBsWT6CoEG/Az0/1g7woutJ+RS52q8N39PzvSnZyUn0yNBndQU2V7W
         tKGTa5NzPYd65g3ApVmbRVf8KTm8RTLl7pCgzSwKVQfClzl0fwXaFyLmV7cKt/EQ+POC
         rZonx1DfcP+yq/ngk+spV/zY/uFtKJ16oDQDUvUeZ8Dpa0+GxtpSo+rymig6Lym2uY0o
         +5B0nX1DYfwokIkmmwGKjUrXGdRa/8j2TKY+OXsEkoHZObPu9pfKn60yKp3lUEWZuvJQ
         4wuvuqmfd2ldTvT0+YKjbcNbbwS8iuOtII9enweiz2MUOPGagKCKBBUG1LTJnAQNzuht
         MKWA==
X-Forwarded-Encrypted: i=1; AFNElJ+H1oCgYNbtIIFErut1qdCvgitO/uOwpIS81gFDVsi4E5o/zCYgA9X7KN0uCkXcwJpv7e8fiEt9guCI@vger.kernel.org
X-Gm-Message-State: AOJu0YxgWwq6CA7UoMu6zdEwRo/vHZmq9JbSrbNIhOlZKo95dFVhIdkc
	uzhZiTm93SAhsBsUrCUOtmqGt4wdofoWB3X4hH6rCDidiXw25a4xWxqE
X-Gm-Gg: Acq92OG+R6QhEixlqFxth4IhPce/Wxh3iddlplbMh5eV36bJ0Is/+gIV3gRZ9pfCB4j
	nCxjAC+jyAhmLzZCNwh2xhGuw9IGFvImBHDZIhwfrUTqZl1ArK0d1vVSfhQaN3fBfZ4kz6D+tAl
	MGKDq+G/XaUOUUR6BEV0r1b7MiARG6M0xEbbKOsNpDveH8l2YfS7yzoxaWrtiXapismM9/c31jL
	sqPaprUEC9QovkgzrikAedZmp54gEX1jCiql7rivLP3DPXAkj28EJHvoufaeLfOWYaMLv+E2kLU
	DAUPMsGuuqCIHdBa6WlHGfjldFzHcgWDdiat7zznuxDsxDskfjUECk8Zz7CVxyH8NBOiPcOiDzL
	CSKFbbQWpQ2SmBX5xQNDjVOq28IBEZk9UAQkL6wHbXiWi0EIESzoeTY/VPuaJlzfuvD8QdBeP4r
	abhfw7maum71nmFA==
X-Received: by 2002:a05:6102:80a0:b0:634:eb91:695 with SMTP id ada2fe7eead31-71f5e0fa7f2mr4814652137.5.1781498582422;
        Sun, 14 Jun 2026 21:43:02 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720847c15a5sm1934151137.3.2026.06.14.21.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 21:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 23:42:55 -0500
Message-Id: <DJ9CJF4J1UT7.T2SOQM49NL56@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Jonathan Cameron"
 <jic23@kernel.org>
Cc: "Kurt Borja" <kuurtb@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
 <20260613-sparkling-naughty-tuna-3e9bf1@quoll>
 <20260614143918.35503c5a@jic23-huawei>
 <08a9a68a-f0f3-45eb-b018-43007a0acfdf@kernel.org>
In-Reply-To: <08a9a68a-f0f3-45eb-b018-43007a0acfdf@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38433-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:jic23@kernel.org,m:kuurtb@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,analog.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC3C1683517

On Sun Jun 14, 2026 at 11:33 PM -05, Krzysztof Kozlowski wrote:
> On 14/06/2026 15:39, Jonathan Cameron wrote:
>>=20
>>>> +
>>>> +DEFINE_RUNTIME_DEV_PM_OPS(ads1262_runtime_pm, ads1262_runtime_suspend=
,
>>>> +			  ads1262_runtime_resume, NULL);
>>>> +
>>>> +static const struct of_device_id ads1262_of_match[] =3D {
>>>> +	{ .compatible =3D "ti,ads1262" },
>>>> +	{ .compatible =3D "ti,ads1263" }, =20
>>>
>>> So devices are fully compatible? Then it should be expressed in the
>>> binding and drop one entry here.
>>=20
>> They aren't. It's relying on one of them having a subnode that spins up =
an
>
> I don't  see anything in the this patch that would be using the other
> compatible, so driver looks like handling it fully compatible.
>
>
>
>> auxdev for the hardware block they don't share.  A fallback would be fin=
e
>
> Patch #5 adding auxdev still does it uncoditionally, thus driver
> clearly treats them as 100% compatible.
>
> Or I missed piece of code - please point me where is any incompatible
> behavior coded.

You're right, Jonathan mentioned the same thing. This was the only check
when creating the auxiliary device.

	node =3D device_get_named_child_node(dev, "adc");
	if (!node)
		return 0;

But I should definitely check if chip is actually ads1263. I just
assumed user would know better, but I'm dropping the subnode anyway so
I'll check the model.

>
>
>
> Best regards,
> Krzysztof

--=20
Thanks,
 ~ Kurt

