Return-Path: <linux-gpio+bounces-39531-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HilgO9fSS2q+awEAu9opvQ
	(envelope-from <linux-gpio+bounces-39531-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 18:07:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E13D71305B
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 18:07:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="Z+/eLfFN";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39531-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39531-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCC39302000C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 15:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FB0430CF9;
	Mon,  6 Jul 2026 15:58:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0D742F6EF
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 15:57:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353481; cv=pass; b=GQ12QxodXg9EeICjOxXMu9psMEy3cPc5yExKpLGkwy/5XsSDb1d8GIIx04viKlzOJa042KZT4E3PsOU3qyefZwzCKK/mcAd5Pt58tqiR9mgzvbyj3hdvqP90Tbq4QDpIzeSAz6Pu5oplBhbeHeYmHZsMcEKdbv4yEe+pBpGlIGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353481; c=relaxed/simple;
	bh=gCs9HokUb+6ZMGzRlYcfJL9jBr5oqoU0ENUXdBhbWys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoxfwRCADJwTwsSx9D8VPEir9A3ZzjUjQozN9JHZdEMyYVXM4W+9deCEoXXOSnMjg+RlSFpLtmQs2Iq/H0pPJFcluGNM4idDMe19VNqKems4o3FqzvteHfU+dctXz5X8+xZWtXij2LDsjTqtvjEtSpM8uUt5IqUnVAEay9Ol1u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+/eLfFN; arc=pass smtp.client-ip=209.85.208.47
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso5360820a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 08:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783353478; cv=none;
        d=google.com; s=arc-20260327;
        b=k/q7F5wfBBsYEFrOuQo4/4NSxqxKtgxJl3iHGe8wPagGHPG5r2GlFB4OlydGH0rfO0
         JY+P0pRddn9oeW/LwLSNORbKZZfeQR496fY1LMuoIe9RWDeKs2D0wS71JsWAExtd60Es
         QpRmTCHiCSQLEcLMv7IuCZHiwrg3YgwfEQ8iLUW/hEYEGBLqtsedHI/Vq+vyPGGF2cHj
         w4czJHbSKh0NBj5DEThixekTkL4x2nNsIFWUkW6H6hbt8UQxXvUFVu5k6wF/VckBxqnh
         +wSQDG+zlpiWIznFWHZVs73wA2CcN+4K66+fnuEiov0xXWuJI646JX3nEgVXSmSXZ2rq
         RlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        fh=g6pZh81ixD3tOJQaQbdPBHG/TdDKrYNrlFINxrZpbt8=;
        b=ezSlOUKbfzU4f9INMVTO722qospbBrm2GjwvTFZwj/ueHWA0Qf+X62F1zEp+ZU2jDV
         EnLvFtvtpVWeEW2oFjP31tb9z3fhCn13q7U/zdi3PvGa50nq9D5Oa6PfS7QiqEhq8VSS
         ax8QihOE/JXQ8JRJUMuHb1fxWLxSUSywATtBBflg7SSgEpTyi+TgQfCUKBZOxEChx65l
         cGDAFRmWTF8eVLLyLp4lEqDe9CKZ6qJgGaAUkTnCLmYyelL4nmSA+LcKpATSRT1rvc/h
         9umRd4Ev15T+Ksdwjewdrzaqkl4NQLoMkFiLjbHcJ7MkYzPnsKhyEVj2jmubzVTUfZue
         FPVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783353478; x=1783958278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=Z+/eLfFN6xCQ/JXzVDa72FWOBSmvZ2SHuV4SdsDbvXjEyKc7QtkRbACuGnlZmMG1kS
         21xIPFkDIo19WZWh4MCGa4sk2CXpayXD+H7uysfPymrkR11lVhaYQsy9vLo9bLKb8A6Y
         J7RgKGvrNJf78fC8qhM7hy4ya+8hxs5TsxX7lhtYNglg6SzH2zpVinycyfn84YPIu6H5
         s0TrKrmW0KzxtTjJuha8xi0nxCtR5aqldd/QyCQfIfdFotfXtR3TKSAdS6pRs9vAXOZm
         d8f1EjuuZdwgNaLvS6tH4uHhS9ttCCosKo2FD8YrHuH4jO28GtDw3mVpSPdp8lR97Dso
         z2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353478; x=1783958278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=SAvbAh39/MZzVHltCfh/6T27TxMnZA7OB1ZoqOc02esKUGmA+lwnmfFS0rl5woMazu
         qTG4I8Su5bY8gyB9FX1nKXTpZxgh6XQR5LeznoToEXEN6nTiuRmrY6vs+jhxjxtt6ndL
         aWFP1Jz2YTWuw4KwKMDYzkl5x76RhWakmD75cSqstOnkQJ9OWmT34JK2Ttxs11aUwxDr
         U2DhqejIb25rMES5BXLa6nkcKFajodgVAaBKQISksbhL4cARHMcxj7j3eJthKu8KRPmW
         rmYxVEpBpEEwfEwTCvoGoJEQitU5CohPmwvVCUp9bM1VKTg3Qjto5x61Epn37saEdksk
         PRkg==
X-Forwarded-Encrypted: i=1; AHgh+Roq4RJAwH12P09VAV8sYsiUtb1ns70L+6Cy6zlGy53oy+bI0P/RxNN6X5SGJ5yoNaOKF65UvAyeIqYD@vger.kernel.org
X-Gm-Message-State: AOJu0YwhFAsdbi4ayzimVqWVJYvkBwY+9H39vdKoM4zIeZrYCuGddwjI
	+/e0FFwTcVcsSwHmTtSQm2bKXFnCzi0G/6N0nTt6QT6UJLGHXZ2EqyUk8ziTVWOOCicJOfPjxPh
	UkvTQzm1Nh4uTyB0TJSeGnlYaOVHG2VobtaPc2o9I8w==
X-Gm-Gg: AfdE7clJIoY58p0CcquGRK2MM/nl4dZeTD7RcXOW3MpInvrXCeBinZkPGp6Jf8Jywiv
	8fa0TdDoRUXFLQYLuQEozburj+tO2TLcVSrSasC9eBclSQJ0qm7TBXxM/JMlWKVjgXcPmt4GrHp
	/4NlmSoNS1zs30kjI2Bz25LPQ/VNIrWyOFcov+nliSDXexv5OfOQJF5ihZXj3M/aLw2qF/i+of2
	1LQV0rfCCqB1xRXaERAh1tWm3izqcMU4y7KGJ/H7CWRHABrmD0zWiyIS+Hr4HO16acCQyH9pFjt
	3K5K4+zGAXs+x7QVqG/YFgWoGNhJ
X-Received: by 2002:a17:906:3ce:b0:c12:992b:16d4 with SMTP id
 a640c23a62f3a-c15a68cf56fmr47982566b.41.1783353478105; Mon, 06 Jul 2026
 08:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com> <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 6 Jul 2026 09:57:47 -0600
X-Gm-Features: AVVi8CfCK8RZVsOnom89zz62dC_eh8WB0dnPwnnTYPsAfwJakdAft3ffWaiSkNg
Message-ID: <CANLsYkxmf=QfNUe=BLrrP7kBtZKq2Z1BkQDLnzmcQsW-kYzTPQ@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com" <b-padhi@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39531-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:shenwei.wang@oss.nxp.com,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:frank.li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E13D71305B

On Mon, 6 Jul 2026 at 09:40, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Shenwei Wang (OSS)
> > Sent: Thursday, June 25, 2026 10:55 AM
> > To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel=
.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysz=
tof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjo=
rn
> > Andersson <andersson@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>
> > Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org;=
 linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx=
 <linux-
> > imx@nxp.com>; Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; b-
> > padhi@ti.com; Andrew Lunn <andrew@lunn.ch>
> > Subject: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
> >
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Support the remote devices on the remote processor via the RPMSG bus on=
 i.MX
> > platform.
> >
> > Changes in v14:
> >  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>
> Hi Mathieu,
>
> Could you please let me know if you have any further comments on this ver=
sion?

I intend to review your patches but other people's work is ahead of yours.

>
> Thanks,
> Shenwei
>
> >  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
> >  - Modify rpmsg-core to enable prefix-based matching of RPMSG device ID=
s.
> >
> > Changes in v13:
> >  - drop the support for legacy NXP firmware.
> >  - remove the fixed_up hooks from the rpmsg gpio driver.
> >  - code cleanup.
> >
>

