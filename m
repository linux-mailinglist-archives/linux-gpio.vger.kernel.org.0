Return-Path: <linux-gpio+bounces-32652-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WfB6AY+oqmnIVAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32652-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 11:12:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57021E7FA
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 11:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D607430238C6
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 10:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C40735E937;
	Fri,  6 Mar 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBYpZwEy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEF834D4F3
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791847; cv=none; b=Ow/7q86Oiftq2VNjxa5r3CtmVPtYDOMPKRzLodr00mrd/kmj1OKFXW9HLYx9GNHb9jV9WuOPQ4uCEBY4s2+TbybT7Eb0U7WtH7gTrc1TvtaOfZjaEFvD/XRFQrQCEymyGCTJg5FUPqZD/ghxdK6T0fet4LD/2UYhXmNI3p9EzV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791847; c=relaxed/simple;
	bh=HdPn5c+ILBD8SmjwCyntKaL95cGIXo27SeRX31FftiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYkKMf38uNH6URmfMY3QRj/mPPPtX1dJ4y0Zx0Qvw/yW1Q87yPUkN2Mjpyck/i6H468CzJ6gT7Z9m0nVYFgn08GEBjbf8dZfH2Rp1johyyr0UUqbw3szWLRXppzusJbBfkOsNM+uygLONpvjgEZu7bWP8p6ICEmPvYF+TA/iHis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBYpZwEy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153FCC2BCB3
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772791847;
	bh=HdPn5c+ILBD8SmjwCyntKaL95cGIXo27SeRX31FftiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GBYpZwEy3R3HmwylE4GJtsLw5kzM1IGv35fGpJrhj2tRZ0/cYKNzDVslthvjZ0H9a
	 hCNS3c01yh95AP8Q/1vJKqp6JwjKJUokF/SmrPF0jgY6cvdpeYYTNcR3oj29b+RDme
	 apcQMt14z0c8vsWzHbGINLNojEbiKFYvwvc2baTRQam2/iurYxqtYZs/Uf41ODWiwG
	 lahUkOpBy51XjxMyjGQ87oFEqRBtXjbhXSPogxah73jI1rYTvp0GyDAlqsUjfgRjKE
	 tEVuENURcGWOflJg5Nb1PbDao4jtRnZYWDVXBwFl5IGfQdOT3LPpRSGGAQxvOXaMcj
	 hTLcRmPdDQPhg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ca6595c8aso8820909d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 02:10:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4OmwhQME+vuvgo06LE6tkouqxNJ4sgDskbgIKWluYKhXmE5c4QtGreVqpe8eW6tOErOyIuOmx/+FV@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMa5pRLPjNGqSLLnCLEV4GmzP/CGaf7TPt21ryBRWMhw+LII9
	9SqmPAUZWj6WoML1ZZB6xC5goBsMy796FNlU3yYPIEy8W0MbTbhO9C/5jnug/qZz33WfFhkWaYC
	1PqO/GMHsWU99lHO3zju3OgvBvsW7wTY=
X-Received: by 2002:a53:ac90:0:b0:649:443f:ab2a with SMTP id
 956f58d0204a3-64d141f5c5dmr1386686d50.37.1772791846401; Fri, 06 Mar 2026
 02:10:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
In-Reply-To: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Mar 2026 11:10:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
X-Gm-Features: AaiRm52Qy20I1-ysB23Xjoyr078pEiHqVFaaz6UX6ocGFd2y23NFBsVi-_yieK0
Message-ID: <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.chen@cixtech.com, fugang.duan@cixtech.com, jank@cadence.com, 
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7E57021E7FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-32652-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Zichar,

On Fri, Mar 6, 2026 at 10:32=E2=80=AFAM Zichar Zhang <zichar.zhang@cixtech.=
com> wrote:

> +  clock-names:
> +    description:
> +      Optional name for the GPIO controller input clock.
> +    minItems: 1
> +    maxItems: 1

I think clock-names: true should suffice, but the binding maintainers
can say how
they want it.

I would suggest to also add:

  gpio-ranges:
    minItems: 1
    maxItems: 32

At this point even if you're not using it FTM. This will make it
possible to later
map the GPIOs to the pin controller and control pin configuration from the
GPIO subsystem.

Yours,
Linus Walleij

