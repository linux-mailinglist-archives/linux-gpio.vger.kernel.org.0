Return-Path: <linux-gpio+bounces-25163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0D4B3ABE5
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 22:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A150F188FE06
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 20:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3423C283159;
	Thu, 28 Aug 2025 20:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="duuC6gdi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647361EFFB4
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756414028; cv=none; b=X5ntAOiurdlwXoZcLdFT0hOKrDr/jYm1p2pJo94bhi+DVWxPL9AWClsgv6NZSZUbe+/7NCi1vE+L7osRnu+sD3+8DfvrcRUCncK8nQ4yIuKvxWo2vUhIhhSDVCzy7LRqDkbEvA9wJlxpEkH5fBRLs4uztJjsIK5Qvd0uaKinpfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756414028; c=relaxed/simple;
	bh=yypyaBN746HsDrUzE1kCYfLJaG9FQJercS2A7aMVfV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtCX1BN8H+3AqPmtO8bCtf0qt03kHSkmV8iN7TjjFluNL36NAtykSHTDCtUCLRiMqqa2L4HpfJdwdWGJBDLsspeDUW5C10ptz8dWG7BH/Z4NxLiHCuGmaJa/NRC1b7SkIgvKK75QDdS21YRqmXx/+VD/A9Ghnc0f5UKNng8Wjqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=duuC6gdi; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3366ce6889bso9892851fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 13:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756414024; x=1757018824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yypyaBN746HsDrUzE1kCYfLJaG9FQJercS2A7aMVfV4=;
        b=duuC6gdiDFxj9zSs7kJC5i30idcZkpCgXs3RsvTPLn41WIrZiLyjg47iKXVgDp0fGy
         sR1Ykp9kakPLjsqHqgAhVFhbv0MJWFPX7+pp+j8qDVg8p3yorBM7KzMIzdrCtrwfybW1
         o01WRpxJ90KqhKvZoQJJZ1i49LoC3j6DIjaxxgSUalbD83CnnK/OMUPPX1R2VkjF9EJm
         Fk5hvnS9St196MU70qE6Hm+tZ7nVCmBFILCDK0S7awwxLZAt9vNPeb/KWS6HLNT8iS/R
         KZfT7vTv1YgLyn6coGjbr57UB3adlC6qzvmLRus9O1SIvmDkWsV+8bN4ho9ZEdC7M9BF
         7sXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756414024; x=1757018824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yypyaBN746HsDrUzE1kCYfLJaG9FQJercS2A7aMVfV4=;
        b=QKO07f6AjqgPkEXrON90QFVFfZXH8Eex7m/kvHk+zTeHzAtPyGkQB203RHz8ihGZg1
         nmMZRNFCdtfs2tGklMQ9ffsoFWHs2m9tzisrCRWcWxdUiulrJ01V4GDddOeZjfzWUZkF
         618ZujYZ3LylA5Cut6azjFZ65Z0fmHWlunmAxhi5NTZXJeXk4COn9/eaLc0+rXqUZls1
         gZvyLdoS2zYR3Okg2oryBktpQRHZg322XEwn09QOCCXmhjuAcWF9Pqq7+wfX8CLpKVSg
         wTrVRyiaiKfqqV1zVa3CVVmirOHQCnLuRVc46xUONQyZLeTbLRIeQW4LzLB6DDIv8qhA
         XHaA==
X-Forwarded-Encrypted: i=1; AJvYcCU+2KvIiX+aXX0S08K4LFr+K7CKibQSFxnE7TONMdFmTWSQVKYeDHx5Hfkqr02Rc8mOn2FV4r5x8f3A@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg4n6Kx9uhhXrycqfM94VJy+5yft67cIG89IX2ZemWYvxrGNKa
	+DnleU0Gwl2TCWzjmAhmMhk7fTctM+VahldTwSZVGsZvoss0+DZg81RpYT+j/0zcAuMgqVzAtht
	4BKfl+JuZQKwIpI3dvXnZ84His74raEiKin6jq9n9Pw==
X-Gm-Gg: ASbGncvbEjHivX/rGSxCYL5Nimd3ahpUURsbkdpX4ruQL1rhv37ybKQIF8ta3kKGfGc
	5bQ5C8S/ck5+aATiI0IqLvKDqe5B/qkXKOC2ZCpnbsajHTjX6H6WqOCriTTctKkyq12/B9GVeo7
	eRQRwjEd4Rq7Vf4APDZ50XBem97UTpWtPvx7CENno58yjAvNCeGCFHdBztXleApn5xHSAA7M4xM
	wXQbDs=
X-Google-Smtp-Source: AGHT+IE2uWhuibXcObFZ5VTNIy6zlok6JnK2MWtwL7cqbL+/SAGd1n7jHXQKxLY98v4CVTQiyLHeR0E2ooltz4RMmZg=
X-Received: by 2002:a05:651c:23d2:10b0:333:f086:3092 with SMTP id
 38308e7fff4ca-33650e704femr56328661fa.11.1756414024499; Thu, 28 Aug 2025
 13:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-8-jacky_chou@aspeedtech.com> <CACRpkdarn16N9637dL=Qo8X8o==7T=wBfHdXPczU=Rv3b270KQ@mail.gmail.com>
 <SEYPR06MB513491FF4398138F8A52A5469D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
In-Reply-To: <SEYPR06MB513491FF4398138F8A52A5469D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:46:53 +0200
X-Gm-Features: Ac12FXzlvTJpPFPcU9uQ_fN2isTkkss2_BjIEzvxJnxhjmRwD11F1FNpCNVPGsc
Message-ID: <CACRpkdbmRpH1+HtW+vbK7rVk6OCEve54BxTAxrUhX631a2KP1w@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 5:08=E2=80=AFAM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> May I remove this patch in the next version of this series?

Yes, and in fact it could have been sent separately from the
rest as well, no need to keep things in a big bundle, it's
easier to merge in small pieces.

The only upside with the big bundles is to help developers
develop all in one place and have a "big branch" to test.
But it doesn't really help the Linux subsystem maintainers.

Yours,
Linus Walleij

