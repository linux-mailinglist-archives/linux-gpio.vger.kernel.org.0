Return-Path: <linux-gpio+bounces-32800-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEpRGrGQrmk7GQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32800-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:19:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C36DA2360AB
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14994301B734
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 09:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C5B377ED7;
	Mon,  9 Mar 2026 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5Qe0xmw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13020146D53
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047864; cv=none; b=NaBNWytlpPDqGpLjFMgGokA+GMLWs9ahaOCgQd3rkMAlPI8LvC4hiCtVLMgzSS/Y3putlAn9CkI65KVF7AtSyNcU5K1Suy8qNm7z59isVwMCjkTeIQOucVhOZdzcP690FRDl+noWvS4h3eZ+5PGZeACDUcnWlpLA0EZUIageVg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047864; c=relaxed/simple;
	bh=YLXhNGCsQCx1qS2BiicwkZEbN+zda8ZNiRoTS2x/QoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6wreWfS5lOIrNTHLC5y1THGYzzQ/Yi61Ck6B0+6vGBmC527eE+W1Akt7rtZiSYqXFI0hk+ca4goeVWaKbINJCnia+nNkdsZjNmTC8yRzn20azZPwR1APgF47t6NFaohO18D3YynN7LVXA7vRUFD/ra3xrFB70BF3Lx7yR3I8b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5Qe0xmw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8C8C4CEF7
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047864;
	bh=YLXhNGCsQCx1qS2BiicwkZEbN+zda8ZNiRoTS2x/QoA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k5Qe0xmw2AEmGlrgD5DUDGQ6NskjA3NK6aRG73abYPJe/iG8w1UyPOywZyNif1YLf
	 HCV6SMw8H41nKiARvAe/IVazL8tOjO2LtckOujmZoCLfa5BuG1gxtSeULJc8gN7+hP
	 FJaqcjhFSjwOuA3R6dfbTJu/RgNTxUbTB7v4e6yMlLKInY0svaNb2/90cbsC8ipD+Y
	 DdAdlX7oEs/ETp9ZxxydSt6h03+b1fQzYebVsAatNpnkliv8Nv9ZBc1O7L5vA31tUK
	 UaJYfOq3VwwRA8RR9vYdpe1LYYEYkZnTPjZZVqlWTnhvIm2nck952hHpdvQ8CD8e8z
	 5m+mGXTCe3Fpw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a46657a9fso15282041fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 02:17:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHmPNgBNpIQDfoALlKHcacIULoAKdhh3PbYArlgJl2lleaBGD3mNo7Iqffu69WBuSKh58Srn1C7H6a@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/bxiG8usVqXG0/YgEUbE0aWMZ0mxykT9A42Vcg+c+Blu4Q2Yd
	178dwxZ4WVMXUrZi/pmEveHiBqJMnxcVInfHmYYxRhPL3V52aU/VBXI4uDuoqzLBZyOz+DAKRM5
	Ya+uRWVV24n60U9JfGdhbBTUgmWyKKFTp9zPbDFNhnw==
X-Received: by 2002:a2e:a991:0:b0:38a:4d20:3f7c with SMTP id
 38308e7fff4ca-38a4d2042eemr18701111fa.36.1773047862657; Mon, 09 Mar 2026
 02:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212110905.52842-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMRc=Me14BeYBgy5_bNk+2riQzGhfTu_5nQhU1R8sXMbO5s8TQ@mail.gmail.com> <20260305234528.GA796613-robh@kernel.org>
In-Reply-To: <20260305234528.GA796613-robh@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 9 Mar 2026 10:17:29 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mcv+LWK_skGTB0_Y0XXDNa8F19t+Pxev4iYgWFSUcv=8A@mail.gmail.com>
X-Gm-Features: AaiRm53jgViOFPs1FPMLNJ5L0WqZqaBREnjWwRr7yfZjFgiKllRvrB0IvqdS-gg
Message-ID: <CAMRc=Mcv+LWK_skGTB0_Y0XXDNa8F19t+Pxev4iYgWFSUcv=8A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-delay: Use Alexander's email
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C36DA2360AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32800-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,mail.gmail.com:mid,qualcomm.com:email,tq-group.com:email]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 12:45=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Feb 12, 2026 at 03:10:57AM -0800, Bartosz Golaszewski wrote:
> > On Thu, 12 Feb 2026 12:09:06 +0100, Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> said:
> > > Group/anonymous mailboxes are not accepted for bindings maintainers, =
so
> > > switch from such linux @TQ mailbox to Alexander's email.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
> > > ---
> > >  Documentation/devicetree/bindings/gpio/gpio-delay.yaml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml b=
/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> > > index 1cebc4058e27..b99ceff6c5f6 100644
> > > --- a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> > > +++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> > > @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml=
#
> > >  title: GPIO delay controller
> > >
> > >  maintainers:
> > > -  - Alexander Stein <linux@ew.tq-group.com>
> > > +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> > >
> > >  description: |
> > >    This binding describes an electrical setup where setting an GPIO o=
utput
> > > --
> > > 2.51.0
> > >
> > >
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Are you going to pick this up?
>

Yes, queued now.

Bart

