Return-Path: <linux-gpio+bounces-21554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C697AD9007
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 16:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21C5D16E5E6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E918199949;
	Fri, 13 Jun 2025 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVsnaivI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B233E1
	for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826156; cv=none; b=i7PvaEixi4cInMRzew1eoNnv0K0EkVpCXg9K+A174zIaGil+vk9Rzt2XuoACMszlK9h5iTRRUl13Wd7/i42hoO6D+vWLsG/+hJvubdtzXZrgkJIjvurqfjkEqYFOjZJ3s7MhpbaCkWoEZs4KnQ85NaihF2JTRxC+Zn6xgIYOgFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826156; c=relaxed/simple;
	bh=2cJno2Hoj8gBQakrsjFx1WU6qLvNRnglSPMrwyBSsfw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i7SES6+1fP7qoBZ8mW9535sRC8YU7m22K5srTo/v/1zYEvcFmgC3fzoBEdWIt5uqECFXpFcMpup5X+EVdzBl85Z1UU1PAoR9adorwmyscBUqbrDokcBvF6K+QwkhfVXcRPvtM1iew6wMjzupewrjSJ5/q0/a970GTLPbJdvrx2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVsnaivI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a522224582so1264048f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749826152; x=1750430952; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2cJno2Hoj8gBQakrsjFx1WU6qLvNRnglSPMrwyBSsfw=;
        b=rVsnaivIXxckmHKkmEdauL+K9MnYezTJZ4JKghLmBef49U3l1sGT2L+nKfYOvTor3U
         mZA2IWvhNwOiSuyRVYdpFRjnMPV6b8rCkqP4DHpowjrhEhrFGoCWj9vxJIbiSo0Vb2Vo
         Lv43QVid+50SdqVOwt9fMR6ia0hgeF8vqqzucF/5CedOEGwP+u5bz03I0vbc7UuMB2x7
         YHVsreRiIS49pa1bO+clZRn2EeTfsysRfTIybW5YlH1NNlesKwDOnW2zM2oC7/0ZEjik
         T7FTmW/7ZOgch4nMvTmU9UTifZypG1x+TeNgbDYyOpeiDWyIAqrX7IelXLUbYFSMNw/F
         +nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826152; x=1750430952;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cJno2Hoj8gBQakrsjFx1WU6qLvNRnglSPMrwyBSsfw=;
        b=BS/tG5kX5+TuROqHCrnrHPL2MvN92ZoD9R1XKKA5cdKuIPhiARHdZDWI+dkf9Qdejh
         fJocR+ZxxgqLPNQyRKaF5FAP1EdD+jp4vuNN2qnJIwlU2adKJwL9RPl8hN0U0e4f77qI
         R3GE+6WWXn03UBeYFsAI1XZDKkRF4qZFI5cb65IHu1ucFbhMGCDKNDfpGJUHPKvOOD5M
         jpwkY/5Q6JWRNvjSMbY5o4BZkRK14TZSAhRuWy8vbURSxPe4g9G7Pq1FAy/7T7t+1ZQr
         LjvpoDnDoaSIPz2XnGAq1Hj90WudXWTNdr4HMPJmPzSaNWjMh48su82W4yIfm999Bp5y
         QMDg==
X-Forwarded-Encrypted: i=1; AJvYcCUcYHKw7qSASzZhgjT752SoRR1oUFlC5xglZ+eW7PjZSqHRGwY4t8OZwPKDuxhHGG2+03weiRNhKXB2@vger.kernel.org
X-Gm-Message-State: AOJu0YyINlnjdwDZAlqCi1V0GCdLkabhngyLR8EzbNiHXefZyiBXrlqV
	hc10ZYGM7WTm59XC3WuqG3ZRfpSyQfoER2u4riyVPt0aVK2BxsJG4vH0iyj7LwWjFfU=
X-Gm-Gg: ASbGncu28hijA+bd9Ba/wUnKtMntZB4ZLxRow4brmxnSksFmA1ftlOynp2EgH1YTYtP
	KINYaI1d3bnHsFhQkLYMh2trIdfaSkQDTpebDQP9Mbc7HxKY/IYALDSCD1d90yg9SMDl0VIASmh
	wdkYXi2yY93L7WtlwcoCYFMe/BAsNGv1g4xWUphs98ZUy+VJQmaS4ES6orxDhYGOJ3csI2TB4ik
	i9kqK9WvXaT6dpJM8w8pcBpdc8bOgoeu1bV1OP9c935rVBC0hjNSLfMULfrwRahQYtfkn6Qhzxt
	KP2Ph2AzOMZWwUJNis3t6h7ku91FU5dNF543vFpzollaviz+mdvzYTKIm5eKb1dTMQ==
X-Google-Smtp-Source: AGHT+IHGGsFtFCfbuYCXq3oL8odq3HLL7l0GwRKDXbGKH51pl4haYPNqSjXxdeo1IqvXv5YDBnxJAw==
X-Received: by 2002:a05:6000:250c:b0:3a5:2cca:6054 with SMTP id ffacd0b85a97d-3a572367c51mr3741f8f.4.1749826152548;
        Fri, 13 Jun 2025 07:49:12 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b5c372sm2510723f8f.89.2025.06.13.07.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:49:12 -0700 (PDT)
Message-ID: <05b9862c9a8f11bf7d7c8afdf60ecff30716a196.camel@linaro.org>
Subject: Re: [PATCH 07/17] mfd: sec-common: Instantiate s2mpg10 bucks and
 ldos separately
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski	
 <brgl@bgdev.pl>, Peter Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Fri, 13 Jun 2025 15:49:10 +0100
In-Reply-To: <20250613141902.GI897353@google.com>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
	 <20250604-s2mpg1x-regulators-v1-7-6038740f49ae@linaro.org>
	 <20250613141902.GI897353@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

Thanks for your review!

On Fri, 2025-06-13 at 15:19 +0100, Lee Jones wrote:
> On Wed, 04 Jun 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Bucks can conceivably be used as supplies for LDOs, which means we need
> > to instantiate them separately from each other so that the supply-
> > consumer links can be resolved successfully at probe time.
> >=20
> > By doing so, the kernel will defer and retry instantiating the LDOs
> > once BUCKs have been created while without this change, it can be
> > impossible to mark BUCKs as LDO supplies. This becomes particularly
> > an issue with the upcoming support for the S2MPG11 PMIC, where
> > typically certain S2MP10/11 buck rails supply certain S2MP11/10 LDO
> > rails.
> >=20
> > The platform_device's ::id field is used to inform the regulator driver
> > which type of regulators (buck or ldo) to instantiate.
>=20
> I'm confused.
>=20
> There is nothing that differentiates the two, so why do you need to?

On gs101, we have two PMICs, s2mpg10 and s2mpg11. Several s2mpg10 LDOs
are consumers of various s2mpg10 bucks & s2mpg10 bucks, and several
s2mpg11 LDOs are also supplied by various s2mpg10 bucks & s2mpg11 bucks.

So we have a circular dependency here. LDOs of one PMIC depend on bucks
of the other.

If all s2mpg10 rails are handled by the same instance of the s2mpg10
regulator driver, probe will defer (and ultimately fail), because the
supplies to the LDOs can not be resolved during probe.

The same goes for s2mpg11.

The result is that neither driver can probe successfully (unless you're
_extremely_ lucky due to parallel probing, but we can not rely on that,
of course).

By splitting LDO and buck rails into separate instances, this circular
dependency is gone, the buck-instance of each respective driver can probe,
which then allows the LDO instance of the other driver to probe.

Does that answer the question, or did I misunderstand it?


Cheers,
Andre'


