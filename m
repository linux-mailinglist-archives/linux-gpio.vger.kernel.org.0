Return-Path: <linux-gpio+bounces-15421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F29BA2A3DC
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB4E18865DB
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463FF225A44;
	Thu,  6 Feb 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTeVRmYG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8979B41C92
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832873; cv=none; b=De1nZ0O8hKm56D3DaBuhEebwOkqycP1Z7mU24NnvZC4BH+JvUg1bc8j2scs/Gv9XfrHhtDHnAoe/PJFtatl7nC4VJci1L7CeV4FdvRKedA0ZYmBh70zE+teP2D1FyKjzNsOchjjlgNRjjM8FjY1bynWQ8eAgL7ANo/amtQQzQVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832873; c=relaxed/simple;
	bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huD7ra3gmkyhdAQicmz4G2aBhjq6EzxxcuOXhctQ3Fwp/fAhO5ce1kAdbNVZQM5pYnNqfn98JHWYfY3QRKLHXOfTQrw/BELAJ/4MxhRYnImdwlj4/WSyRqJPdISxScuGCiAoMUJGCbCoAsa0ljegbKWiwkTuF6nJvG/E5+t5msY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTeVRmYG; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30797730cbdso6393691fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738832868; x=1739437668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
        b=TTeVRmYG9yuGvQjpU85pWYUsAw4BWCBqf1IocAjyPXizPIbBjl1rwxJR2hWwRKCioe
         XDdGVDgR5Yc6RQkrsiDb/SPhVypwgiriFLKvT3R8yKlGavjj5RCaPi9BST9TZpUpvItj
         IDUSemjHvxnbm7kLFUbV3lz2Ee7F8pxNLBZVs+oY/ih47WKbsru5ilxLFjDMMeJdXR4Q
         Tu4EgVoJZ2OGyJV5jevlCUefNh1RoYz6B7anDynHT64MtVtEtizFq6XRxAPhzoahG6ly
         W552pMWU5aC4Iq0r9kxYSxI0pJL2CGPYw7EAAA9DZstwhQ33lPFLqrWc51DxxBh67J6B
         ltuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832868; x=1739437668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
        b=fTrf0r251IpC25kcb2ZzMedZXKEB14YuL0yW9usIkjRehXw0PYBBXvczkE7ZclWyot
         wV7dPMdJJx22kR2RcDV8EYi0aF09+f4/OvpieVBHb+7VgSS64Za7tkhZsVhOrYi8SGkI
         rgeBt93jAUenF7KZ1VKM6p2V1YLdeMU3A1Jge4gxPkCkRiAhVoo4XeII4hFYtbJvNk6n
         RkcAES1LJr31WVk4LhPh3eQXmFPGDAYeFI5IpuG46dLtq8jMT/uqfdwhZDHW92Mw2W1X
         nEge/eutp7u6uiVt8dMPQ3xMxwBrceNB3ephp78zfk+KBsvFW2S7CKLTOnvuzCFLHvzJ
         8A3g==
X-Forwarded-Encrypted: i=1; AJvYcCWEyXezrdAmv6wtSg7dvinyq0uYHuHP4qRwXXwMG713FEPZ3uldQOfhbzKuvV85uULMRhpKbdK8VVr/@vger.kernel.org
X-Gm-Message-State: AOJu0YxYSQQqB/i6KwXWbtwjJlQR6fbnnpOKaeJPGs9waId63b9RTvDO
	sfdeLt5q6D2XNj36697vls+Xc4FdFyRf5LquJvbZKwHSXqtyDb83fHZXWYLGbEeDQGZIvucSg5L
	RMaoRcVd+PNw7CkB/wV2tE+2LhUS75Y486yUJ2w==
X-Gm-Gg: ASbGncu/fzyv0x/p0FFZvsi4hzCjOqT2OLkRpBJStTfwb2lTxIXqzcZZBNU60EBXmM7
	Jrhd1nrbZc9sCr0SFKadQV+4Lkl1wyJzAz7xRJfyV89LeQtZyCabRWGqhYcLSr24z8UP79Ds=
X-Google-Smtp-Source: AGHT+IFMvokVoCNJp7A3lkxgigywWrPi05v98IDrumPEAYrql6H51kRCzThn+r8IlTxIEYbaKMGx7LiQg6tGfTHRK7I=
X-Received: by 2002:a2e:a917:0:b0:300:1c9a:80ce with SMTP id
 38308e7fff4ca-307cf385308mr20165081fa.33.1738832868506; Thu, 06 Feb 2025
 01:07:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <PAXPR04MB845925677F9AB860552A421988F42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845925677F9AB860552A421988F42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:07:37 +0100
X-Gm-Features: AWEUYZk9rGC_78qVqTxr81SNDU-6p5M6XpnmcdwLF8h4Nn9OhqhPBv8W52Ra8WI
Message-ID: <CACRpkdZ1zBkagd478Ee+JAUWrXF1z-Hts=dH+_jgT3Vi26W84g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce allow/block
 list to address devlink issue
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@google.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:31=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce
> > allow/block list to address devlink issue
>
> Any comments on this patchset?

The pinctrl changes look OK to me so for those 2 patches:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
in case you want to merge it through some other tree.

Yours,
Linus Walleij

