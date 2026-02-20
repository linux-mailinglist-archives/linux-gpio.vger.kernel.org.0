Return-Path: <linux-gpio+bounces-31980-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id obd4GlDCmGlHLwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31980-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 21:21:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0144316A981
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 21:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34687300A33F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 20:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142C82EBBA4;
	Fri, 20 Feb 2026 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xr7d4Qoj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB932E8B9B
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771618893; cv=pass; b=Qa7pBAEle1OvWhboM3rhikcgR4sV/8EC4x0D2wJaM/+JOCxEyhfRxfNYrqzpiK3a4RCLG9XEPQsD0CbDhuhr6gv11avzy65byjLgLTiBvy8iGnsuwd5cJwmp9NxcYwIhyUEwWtoFcMTlF4dE4OczgvB/TFOWJ6iNbnOv/sLlC9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771618893; c=relaxed/simple;
	bh=/MQjPz3AFp9hJYRg6RaO7nd5l2K1vMZNwkI3RJIJr/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2HzdZPji3ygt+GVaA5UPQJDZn+fs2H1QJjUQlWxrfg9UbVMa/LPZgQBCxN47c9a8dknz4QGO+ag+88YtPzup/yj0JVP6JTfTAFykphDGn6IS23TS+Vbnjf8jKu8+Ss2Chbqf4B/VFyS/jKQkDWPKEREjbB635ar/sRydAhuhSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xr7d4Qoj; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65c5a778923so3645545a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 12:21:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771618891; cv=none;
        d=google.com; s=arc-20240605;
        b=jrbrzOrpaSPqYigg3wbsI3ac1KEnPiXWDPJOD4xiicwkPkVmgupduP0AWrj/mq4CVP
         IGWfVZospaISwltCYMp13EYNEStefYbARJkCEAUmYKK8VxbCysBcS8Gg6lMBFkrWqthU
         aPos9Cd93Bh+dGz+SnEZsm9WrvtIHWg9WwE8GTqdhWi883bslUziJePM89HHDGa4sqNn
         8N+d+fCVwQv8R0TmhNXzA3H7vGYWBm93bR/FPAEd7Z4fqIKoBK2l1+NwWNd/MEUbkLc1
         B8k+8EKaz2/NAvY6SNvg5v/0gXo45xDERjWcQqYGHQJqT9vK9EC4xnQ8ZtXrTjRFLDJj
         JJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        fh=uEm0PA3xs5Lo2+PG0XHalNXvSZYSmgMfX8PjQQzWQsQ=;
        b=TrVdIet9CAaVIjEB3woDMBreENlCOerglWnX5DVNsPy6GN5ahdusO+UI94ePgehMW2
         4AX9z9kbCGzl2BKnxIZ7YcXrX6gd4RAjIYTbnZopuz1VPx4VNSeL0/qrrCl/wbMn//xo
         faOG4A4apM7o9pcMpchMKJl3UVL29QVUvkWCXW53qDQKu9xNsEUu0rbyC1SvP1k0QWs7
         2ThAJ1rjsz4s5RvuQuxwlOkbgvvlw7KCa0coNhT8WmUcgqE+qNnPEbT6xKJx637PyX2d
         TnS5YBZt7EPxA2qHwbF87WObyciv8THHQxlxjRPFqRkxa+rL20bHK4hb/c6zVGIW1hNY
         biwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771618891; x=1772223691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=xr7d4QojHNK9zrZ4MdKJDM+AOXyfokLc1h1vWUBN4t7a2bELnxrwhtSV/I2cLP5bpE
         suKa13NWnDXp+yh/+ONEY1Y3rWxnViFCF0591/RaiS44zOL9E3TQEs16A29oEdifuHr8
         Gzjs8RPM8dimS4NrQ6agpqQvyBseoev18AeXXnnZC00SnZJYnjSoTo2Ue5dT/U5tTRUU
         hsWfCGdSyGWLFYmcfdI/F+m5R7RZo36s1S7cto11L8G4CQzpC1WKPStx4Jn/P83ZOTgM
         U2RrsDITF+ZktPG5JB9xKYtrN98GDujYTnrGjjI6881VnFwiAS5DtBPI7DEI0EhE3aD1
         /Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771618891; x=1772223691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=rqqc+ASvML3gdwFMfGlT1okITorNoH31uKNLZwzTlzxKgkETA0EHHhYkpGfU2waIRY
         U/LgW5oPRPux1XIW7CvYNsNVWpx3mJbQu48kcIywcTux0av2EIKlbCsAx5eDKg1N1LfX
         u7hduoJFXI9L2DXWOF8AauHhJ7FU6QP9oD/UanX0umszHGdc5CHn/aTCFqCfFD7iMr44
         ZuPOZaqme1zRXMI/i8bBYQY2Cclr5GzFBGLu9R0D5BCe/6hkWFETAWlowU2n6XX6uM+L
         RydqIQtWW2pONhN7jzyjfcC0icO/TBCc3XY1i/7Kcgh4XC1GlIW1yUr6OKzZCoWemDvs
         wDhA==
X-Forwarded-Encrypted: i=1; AJvYcCW1XBtiMhxYQsiKMOsSWttsF110BXq1osF+Wd67+BUtPGlGPIXwNU7ooYFoUWgH/yxzTFjaRO7OoqPr@vger.kernel.org
X-Gm-Message-State: AOJu0YwfGDBG68qAXq7CUZhjWJZy01mrKvxMh8LJBqWE2QH/R500CSFj
	gGtHWdhqKGY7KpBG75suLsLIDPXVwDzEwGz4TZyeNfpTDiSDHxkoYu3yZDBh0C4guPn2ep7l5ab
	451SRg25+7ew5QAahaY9O3DYCi5Z8j/s/xe9EKzMQLQ==
X-Gm-Gg: AZuq6aJ22VbfUKM3NVjHAoQbL+LLwmUO7rYvQEZOMynDOAiEXkoYDXUtaqJtaM/v7BA
	bhxHb/SfiDfzeksb1oIHH2EekTHdE9U8wNhVq1PT0D4h0ZtyPnpICPoP3nhL4p6BjqFN3sLGwkl
	UaPMaMHHziqOVGlBASWzm87cSjd0x+fPJ7KK74eeWALxC3W5SGcDUYhJ1BFl8DrG3oC4RFSviIf
	DVFApuOw/QTACiBX3iz6BStX+ljI2xFsolD7TfiGtcKcovDKHp/PAYYn6Lq2iV2vM+z2mQNTcky
	cqUA4m7o1oZPJllZ2yo0MzfioYl65/Df0bRJF1HcJA==
X-Received: by 2002:a05:6402:3547:b0:64b:83cb:d943 with SMTP id
 4fb4d7f45d1cf-65ea4ebf346mr552702a12.6.1771618890856; Fri, 20 Feb 2026
 12:21:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212213656.662437-1-shenwei.wang@nxp.com> <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com> <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com> <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 20 Feb 2026 13:21:19 -0700
X-Gm-Features: AaiRm50Kkz1w5MRtvgIyG-wO2YfHNIXg4Tb2fsX628-LWgxPRUtWFjuasLWIuqk
Message-ID: <CANLsYkx0Wubx0FiV8ypEnHcstXc2shfEc+87Jn_p=RDe8ib1xg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31980-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,foss.st.com,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0144316A981
X-Rspamd-Action: no action

On Fri, 20 Feb 2026 at 11:57, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Friday, February 20, 2026 11:45 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Co=
rbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Anderss=
on
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; F=
rank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > > If there are concerns about specific design elements within the
> > > driver, I=E2=80=99m happy to address those, but redesigning the hardw=
are/firmware
> > interface is not something this series can solve.
> >
> > Then i think you are limited to using the out of tree driver.
> >
>
> Thanks for the feedback.
>
> To clarify: is Linux moving toward supporting only fully open hardware pl=
atforms? I=E2=80=99m
> not aware of any rule that prevents a company from upstreaming a driver t=
hat implements
> support for an existing hardware/firmware interface.
>
> Given that, I=E2=80=99d like to hear from the GPIO subsystem maintainers =
=E2=80=94 @Linus Walleij and
> @Bartosz Golaszewski =E2=80=94 on whether a driver that works with the cu=
rrent hardware/firmware
> design could still be acceptable for upstream inclusion. My understanding=
 is that upstream
> generally supports existing, real-world hardware as long as the driver me=
ets subsystem standards.
>

The HW can't be changed but firmware can.  It is not realistic to
think upstream can accommodate all the quirks happening in downstream
trees - this approach simply doesn't scale.

As if I wasn't clear enough already (along with many others), the
current implementation will not be merged upstream for reasons that
have been amply discussed.  You either comply with the comments we
provided or use the existing out of tree driver.

> Regards,
> Shenwei
>
> > Sorry.
> >
> >         Andrew

