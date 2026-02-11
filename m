Return-Path: <linux-gpio+bounces-31625-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOlRIKH5jGnbwQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31625-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:50:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC4B127E48
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6886830FD54A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C73274669;
	Wed, 11 Feb 2026 21:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afCodai+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6A034CFC0
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 21:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770846591; cv=pass; b=FNkA4oyYYICLqGlPhcSJi2RINaZgNc9MvXmparModEfOAm6oLSEDEblu0oG0mGKt2pjYLO2IqSHFDvouGPoWvzXQlvxJC0OnvsOcqMaFNwUCSUi/oLwuDG5LHu3yC2N+2eKfB/6ctqIIfhsqrIv1eUwDJR7V/6/pHE1pv3kEVLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770846591; c=relaxed/simple;
	bh=TAaZHUSml4vGTBYCBXzjY9p8Kz4csqKyedAuxOPFZk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lykwHg+Vgl2NdJ9PjzjUIuYMabZd3GL6i4+f6Xy51lUx4YKY4pTC2jMaPk8MFO9Kpo6OhoCF4Ozw+MdEAvk04EyElgbHr4bZNMoDEjUuTyfAfre44izd9yHz+LdebY6DAFTuIMRcGAqva1nTn/ekKF84o4kA1Arbf48aR8NURhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afCodai+; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5fc456c3742so809488137.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 13:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770846589; cv=none;
        d=google.com; s=arc-20240605;
        b=O93BT43GReCdtLRnOPebNfSgdfL1WE2IXVzzs9YvhiHMfnF7uflp10WJXyjVc2Xf+y
         J0A2ebaDDmb2PtjXtvFmGjNedXLJxTim2wDDaZqBQ45DD9WcnPly7RYFAZEwrAzqmkNH
         BGO0bK8ZSathnGS9QKOPYx6tRiAUIuVEkSDvBwR4SEh1PrBRpzOOT0s28EC3jEbO4rqc
         x8o6gCKQRnIRMBh0L2LYK7IhzPyzboCKOcalZ4MlHrL6Rz13lqHRViB1rHvsybLDIVct
         JZnffvqdtIIiRYe6DOjbSfipIlKLCX5rsSZMkTFWRdxROraS9CeLgCRdyuPUTIdkCKbX
         qmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+gBaZTVHWvrk4jEyLZod4jSyYiXug3BM+6GVfN64nU=;
        fh=ThnzpO1VXt5iWxId80i8BtnYQlt8e4S44A5zz20zgqM=;
        b=MUj2gkHcGeGgjlNIgfOwoF8ksVdoENAZ3atQmkUjrUPmqMkp5erpzfL4ryjZx7ZkAx
         3nI4qFLSRE4d1gSLdUtvBS+IIAXVm5BVmpz5ADOHkR1QYJCeb7o0N0EKtg0XQDf1QVd3
         diKHPfNHIXoye6iCirVdrtLXwY6YhhPngv8vrMBH8hwHXmfPxCnryv0yAENGRqi3Th7O
         VqnddAG1f3ANdKrOTFU0kG97Gwr8XCam75sA+l9YdZ41pyAowvrxlu0pE7DI0+tebOxu
         QH9RHC2A4R6LLQ7PXtOG7t+uXDgpFTUaYhy8mVCqOcCtSiattJuE6BBKL+oaYnugXs8M
         wKUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770846589; x=1771451389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+gBaZTVHWvrk4jEyLZod4jSyYiXug3BM+6GVfN64nU=;
        b=afCodai+9v2KoMIwsHZaQ2FB4e7upo6a13TOr9TTc2vmQpz9Ma0BpyS3sJe9P9WBVL
         RbHufka2mBCv06e5amtvoUt55RlBFafPTeJAFxCm6xRiq3uO5tmxllZnFGB+K8VlnCsL
         LM1lyMbo5wT8KwRCgm6PLxVGjFNjUNTY/xvRHY9zFcJlVNTall3lw4YmjT07WFIPn22q
         Hu7jAG+j+QVZEflakJeXMrgVWJm+k/2ul6MROXcAEZpZF+p/tZkZwKiyZ8MglYrMizKP
         H/G9uKMaEHu/J50AXrwomuJ/j9jAxXRqGntGMVL+mchzfxhglE5wgOvRWPAC8ar3e7VO
         fPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770846589; x=1771451389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c+gBaZTVHWvrk4jEyLZod4jSyYiXug3BM+6GVfN64nU=;
        b=D5wB0VP1ed7S3MCcyRmyORl8d4ohcH3ipPMwdIDHCnzT8AFPzGxw4cIW6kwm4cB+Hp
         9CA+48vcwMQx+0xAb3BeNgbkSHnkNtaCbd3D82oz9CsxrCL6NeXxbLKUcpAUuIaOu2nF
         ax862y/lyRPSe5x/axtUXNsV9q62SB/0aY/u3EOTkRBi6t7EK7THzPzQixsuK5LE6fQB
         S9kw9/nB/4FjUGC/SRqtZjE/DRU8FJ59z2CurrJ4B1LExGj0wJYfpXYTwr2ZANYTJhuj
         ZX+QrLPDARHcA3olyM8mXeZTD/p86kdybjrp/ToUT5ptlS8IEcVTc18M4hd/VNZKfnBI
         yeXA==
X-Forwarded-Encrypted: i=1; AJvYcCUeY9+RZTmqoBzb4y5nzQOzNV76COxKcgG5OjZ8EeS/FGJHtOA3eIn3SrO//cpihnpEe7sgQBZUzrhB@vger.kernel.org
X-Gm-Message-State: AOJu0YykioNoaHvNYfuxUxpnJZxFUQAUmcSxMGavpUXbCVAr9Lgyk4wg
	76a1QqLZ+QEoz7vVOWCluiwFLz6YGA+mEGhNOfkGOgpOza6dAnSYxgkjAkYRFhVZb8Q05xaYIbE
	B9lQIqYPEJs9xL6qWZmheroBuyOuBGoj6m8egFA4=
X-Gm-Gg: AZuq6aLjGMjnzgDp39KrZLeaVCPn8jlgAGJvTintfHPyfdRqvnrSzuPVjzSo2j8drnN
	+EPnd/sEPU1K3yjG0cKMefYMiAIo5PyexKpr9JBbLVFwM3m4sf8fn73YryUTQACtbkyyhHr2Y/r
	HppvEccFwGjNFRANXj0HJsZFFRQaUDOG2/bO77tN3cMYxqlbfv0GmNKjPkweyB4h4ob8+C0/b/U
	kK4RKRzSxStqUGiZUTS3//Eq6YwT52kHRg1mvA/scB0pFnf2VumSqD/jtvB5I1KKXSWgJWOYdQb
	s0oM/vh2JWLMBvICBv+U7GAko4O08BWaO3MzqFGF3pnp/+lim2s6UBriaA67UtOlxzV4
X-Received: by 2002:a05:6102:30b0:b0:5f5:2a8e:f4b3 with SMTP id
 ada2fe7eead31-5fdfbe2a4eamr191958137.37.1770846589047; Wed, 11 Feb 2026
 13:49:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com> <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
 <34a9b531-4f53-47ee-861e-1b18ff1a5752@kernel.org> <CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
 <20260211214708.GA3947691-robh@kernel.org>
In-Reply-To: <20260211214708.GA3947691-robh@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Feb 2026 14:49:37 -0700
X-Gm-Features: AZwV_QjILHyNid6JLn_Ug4RC80CCa-RrRyFiF9lPlw8FULGmfltXw3YiVIlFNd4
Message-ID: <CADvTj4p-zHMrXW+GJstB2sKS-7Wij98JNJGoiPiYmaP5RHhNQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT compatible
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31625-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1BC4B127E48
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 2:47=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Feb 11, 2026 at 11:36:28AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Feb 11, 2026 at 11:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >
> > > >>
> > > >>  static const struct of_device_id gpio_aggregator_dt_ids[] =3D {
> > > >> +       {
> > > >> +               .compatible =3D "gpio-aggregator",
> > > >> +       },
> > > >>         {
> > > >>                 .compatible =3D "gpio-delay",
> > > >>                 .data =3D (void *)FWD_FEATURE_DELAY,
> > > >> --
> > > >> 2.43.0
> > > >>
> > > >
> > > > Regardless of the DT bindings - this change is perfectly fine. We d=
o
> > >
> > > You cannot have compatible without DT bindings, so this alone is not
> > > "perfectly fine". Maybe you wanted platform_device_id entry for
> > > ACPI/legacy/MFD devices?
> > >
> >
> > Sure you can, you just can't put it into upstream devicetree sources.
> > We have had a compatible for gpio-sim for testing purposes for years.
> > Why would it be illegal to enable matching of platform drivers over DT
> > for testing purposes?
>
> The primary issue is undocumented ones show up in 'make
> dt_compatible_check'. I would like that to be warning free.

Would adding it here make sense?
https://github.com/torvalds/linux/blob/v6.19/Documentation/devicetree/bindi=
ngs/incomplete-devices.yaml#L243-L245

>
> Rob

