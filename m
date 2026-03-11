Return-Path: <linux-gpio+bounces-33131-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHArNGxpsWnsugIAu9opvQ
	(envelope-from <linux-gpio+bounces-33131-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:09:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD68026427D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCFDD300BCAB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B79B2E2F1F;
	Wed, 11 Mar 2026 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYtnzA/G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E28A16132A
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234313; cv=none; b=pT974T8i8I3cfz3ajJsyrkMtpIA2RnhyudR7rDKH7on2tU1u9uC2acrD4HE/V5SkL7cIF/V09UsDnShrpIbzc1vlrhgeQWeDAUaWFxTuakJURWaf7/TgxAm3NDasLKee+sZ/GESMu+PmCCZfN2YX/HemRt0yRyoubCNK3lLFC+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234313; c=relaxed/simple;
	bh=wMgWWPXAjl+83UwF3RnJ8R6sr1pfCH3T5MLpa+G/nZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzKYyfdPBxNTj1CjKPcMSwieT1WcB8O5MmsULKPBP6ILQpZ5tmpGUHSQ7FKEuXnx61TaUAcUHoduUDz5s3lJe0a+fg+mipnJ7MEyUb30XkF3NMp8tRRCGmtpvZxDp5PaCLBpMC7zFCFw93cJL/sP7yeks5PSHW7X+e6W75/aKrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYtnzA/G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D0CC19425
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234312;
	bh=wMgWWPXAjl+83UwF3RnJ8R6sr1pfCH3T5MLpa+G/nZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YYtnzA/G+o39KiYFBBaOWuKbndd3yDC/N6mINHtl5yymI7QZLVwNc6rH+HTQQAvR5
	 y6tdmtdD4TAEdg7c84tLGP9Ea4xABXF+Tj9pWD6v2TMwIkQUm+D/PfkTJ6DfQtkmy3
	 CU0ZrjmaHOIhNdYHq9kFX36hZ537162xOReANlu6gkPM6vsNvaeIRd0+Xk8Rc016b5
	 My+n4qiqigGhSli/jFUkdz/IxPekPKlaYoNSNiEIw3qEFVNuZ8IYABT8XFnsaojT0G
	 z0MV4KDqtXelyGPhMevzer1/uKmH1WHnx/TX8C7q6wojBTrk5hOYA/WSsxrI/Jj2tP
	 DT5mkW5/Qy/3Q==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7991d890ebbso3013117b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 06:05:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfb4381dXFSIm5NI0s51amKlywMY8eqivNbMzC1n4zl7Lngt5mnLnXphBjdOvlm7/ao6uWIUB8jHPL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0AiE+1AQRuQM4QhqUcnOrbhw1Kd7/5NdkazfM9DkYYz0my1zK
	ylYY5K9yn6YfhGm4sSfKOcwKwte0nAnOdq/NVQWKXBYquXwulhqSYrPC5z+3cw5sTR2mon1e6Xs
	GvYf1FByaS/JGhwIsxJak61sRXqGgnWg=
X-Received: by 2002:a05:690c:e687:20b0:798:65eb:aff5 with SMTP id
 00721157ae682-79917ead3c6mr16029807b3.8.1773234312142; Wed, 11 Mar 2026
 06:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com> <abFbRA33DtDdZ2j+@ZicharPC>
In-Reply-To: <abFbRA33DtDdZ2j+@ZicharPC>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 14:05:01 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Lo89mnTiqXeTqtcV7q3D-mg5BXBC7XYzbzJzTW3sgRA@mail.gmail.com>
X-Gm-Features: AaiRm52mfcznREEEuIoy4g3EGhtzEf3sfA6OhmlaeDTqvF_9XJry94hJfFQ0tQA
Message-ID: <CAD++jL=Lo89mnTiqXeTqtcV7q3D-mg5BXBC7XYzbzJzTW3sgRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.chen@cixtech.com, fugang.duan@cixtech.com, jank@cadence.com, 
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CD68026427D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33131-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,aka.ms:url,cixtech.com:email]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 1:08=E2=80=AFPM Zichar Zhang <zichar.zhang@cixtech.=
com> wrote:
> On Fri, Mar 06, 2026 at 11:10:35AM +0100, Linus Walleij wrote:
> > [You don't often get email from linusw@kernel.org. Learn why this is im=
portant at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > EXTERNAL EMAIL
> >
> > Hi Zichar,
> >
> > On Fri, Mar 6, 2026 at 10:32=E2=80=AFAM Zichar Zhang <zichar.zhang@cixt=
ech.com> wrote:
> >
> > > +  clock-names:
> > > +    description:
> > > +      Optional name for the GPIO controller input clock.
> > > +    minItems: 1
> > > +    maxItems: 1
> >
> > I think clock-names: true should suffice, but the binding maintainers
> > can say how
> > they want it.
> >
> > I would suggest to also add:
> >
> >   gpio-ranges:
> >     minItems: 1
> >     maxItems: 32
> >
> > At this point even if you're not using it FTM. This will make it
> > possible to later
> > map the GPIOs to the pin controller and control pin configuration from =
the
> > GPIO subsystem.
>
> Thanks. Given that cdns,gpio.yaml already defines "ngpios", would it make
> sense to use it for the "gpio-ranges" definition?

You mean like

maxItems: (ngpios) ? ngpios : 32

or something like that?

I don't think YAML can do variables that way, but Rob might know better.

We sure know 32 is a cap.

Yours,
Linus Walleij

