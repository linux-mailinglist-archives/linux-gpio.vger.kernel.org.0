Return-Path: <linux-gpio+bounces-33786-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBwhJXOBu2k2kwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33786-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 05:54:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3A2C60FB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 05:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EB43301706C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 04:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127F32E06EF;
	Thu, 19 Mar 2026 04:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gV+Eq2BI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA6D3290B1
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 04:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773896042; cv=pass; b=bZk60WiSpX1Hm8QLUdvYK4Yq4RDmQINkA+eGBjgUKxb3mmGMmGZ4VEe+9uPJ4jAFWqhhzYq5FG5rCvBSzIAFnTPsdZjQT+RvIDT7OyTkwkRMw1uiNlJeYt3rTmKjwNa1Qvd/gA4iqXkNRgnauMTbqzF3vGWtq8XwhAwoZBnE+OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773896042; c=relaxed/simple;
	bh=EFP3LExiJe++o/o5vN4IaxbEwciH5djcNFNzyfCnjVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9b2PJPVjfzB8hRLodc6q0ARDgmQyLEm+utf3qbkTFbXWDlnGRoBT4BbbZpCOpwxyJ6PHyzlKfeyiATMFJgp9ofWZTcw+/6MA/DNl/nx5nmO9bv2RJhIThAY7T/LImMy6Xf2prZpI7wvc38PveSY7w56sFQLgDha8c36eHIsmas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gV+Eq2BI; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso469843e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 21:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773896039; cv=none;
        d=google.com; s=arc-20240605;
        b=dn6jnuZgWhuEnQrEEEl6QFGPIWlHMOmsCcNqcAQ6vffqmE/+ewx7m/ftsxZhxcu7PC
         Mh1keylrXlsHPNYCkw2BVPDF85atrs/bYQdhDBvbocQxsNnHi0QeTo2LisL3/i4gU3zI
         zSGA6gcIGx0sw5YutU5iSpjDe/J8g/9xyc0FLrFcw38nD1DpFixMSr26y4+uDNwYmRJ6
         wyhBzqpK1HBq+eqwdv2xsKW1ivRmoJM3G6az/QgIjUCEXI5jH2Vw0l6ppQBl4yr0bRrF
         JqPGiE6dwGHT5ZVW+RkUE4CGqkljK1vfd2oebOX7dfkGqGaMtrAn02g33w6F8gWRJ/ed
         O78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=;
        fh=BT0f25hz0kI0c42v4b20tzIwXHDo1jDkFpH56ZAu2ow=;
        b=V519KILPUyi4C3kndtGHqqcCHqK/pd0Z7UAdiMCgQBtWXA8bZdoVR8LokXvnyUSluW
         irPMUYk1bJZoTLJHOJ7B4EUZRcp1aAlft4W6TBEeliiu0dCsuJ2xk+38wa/RysRBK126
         19ZavG6PgZB13r2Byq0XkAT2BMoswPpB9wLW8yt4Kd5nKoKuOxZga7QStvD3iP5wwUto
         NckbztqweZ/vwF7mEhOYHq1+6lqbVBJg1CXNd3a625dmGdBzyeQXWQpu1HQBQYgBj//T
         I23keerKwrby0XlhesAMTunc/7RunbtuvIPhp6jtGvYY/cByQ+a3Wso2NblVpdpZTVMK
         08gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773896039; x=1774500839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=;
        b=gV+Eq2BIKKtmoCQOdQC5FlNrQM8p+4HX/PqIIXMiozS+ptENcq+pHxtuZnnbcRm7X4
         N3XZ08QmOOGKMmgzgiA9MVyuk1xGtfZ3uS9ZrVSTpf3emtCfX5CJ2RcvZTTCdddBBESt
         LpNq+ENxnX/JCZ6dcP/etaR4pM7hdQ1317nUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896039; x=1774500839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=;
        b=k9I3R8FaDJTMxJMq6NknNqa8MvKY1O1Y3IHvE3UQxM/9xFW1O6VrueqoKaczt4QwUz
         k7I4rKYjVxzPi1jHmC3DTTqIe0z9jrKmBPYgwI8e5A/mWX5KopurerBV2HFNUKqxeAFj
         grxJzZVcq/kuLlrCGe6wgfiF6KOnvkfKxAL52njMSR/k8FfMUdLnq7z/+HoFmmQVoGSX
         WNqY/AZOqa3QDGHh0iGIjdhY4BfgrhC2LNT012YKiLHqo9BocqM0TKoTjdHxGVFmQZs8
         l88aIfei1x4w0Dh8kkjqVV3iBsUab8ypMFIeK5dxwh1CjT3deVKTOqMeGf1VG/eb5DZq
         bM0A==
X-Forwarded-Encrypted: i=1; AJvYcCXQk7xX7EJklwiL5y3ZCPwX2J46srikR8/d5bP+3sI1lGeUTJwp75bBOlqGXrQrkRrEmEgLLnMFCgHb@vger.kernel.org
X-Gm-Message-State: AOJu0YwzylN2dYUx+B+sG67Z91HRBGyykJYbMsEf2K/SSThwod79plMN
	ATwI1lY21hQFESBJ24cEL5WsCQVUmuj3zOM3dpn5xYSiGp31kXegKBNFSwQUR2xm9GZwt870ZK1
	IavlXCJIZrRRux7ql5xLlAF3GSXiFKwsfTBbX2RoW
X-Gm-Gg: ATEYQzzdWAf75azwL5BhMxTbnQGtRarqtcKgmBC3WU3abktg11FJyLbylSELOWYxY9x
	aRaHqxqyF0pRsm+qjZhCAPh41YONBg9+twAM0ECSVbCyUSyP6CCFjcxbs9bhILZNgIvAjLXDAdX
	Z1h8C4VhiIqTJ0KSOgckBuy+JVALwznQerk5b1qOuYyJLM8spIL2+9ClxSDN2AuIvK4wi78BlGl
	MhTeGw4k2jjHNPiH82LxfBSHdLkk+nshkLqzUhAG+ye+uslCQwd3GECgS9+JOCYCDaOcaGSNnEO
	u5gfnpRiei+esgb2HIx2WJfqRR96DYO30agXEQ==
X-Received: by 2002:a05:6512:601:20b0:5a1:76b7:ac06 with SMTP id
 2adb3069b0e04-5a279585449mr1694598e87.3.1773896039222; Wed, 18 Mar 2026
 21:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-4-l.scorcia@gmail.com>
 <20260318-nickel-serval-of-tolerance-621bad@quoll> <CAORyz2Laoo4EiLcHZ-ygLiFGW_h8qV7QxqNsMbueM=nov5zH0A@mail.gmail.com>
 <ad0d1ea1-4c5d-4cfc-af0d-8d843e7e0e9e@kernel.org>
In-Reply-To: <ad0d1ea1-4c5d-4cfc-af0d-8d843e7e0e9e@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Mar 2026 12:53:47 +0800
X-Gm-Features: AaiRm53rEbzUcysiLnjhOdOv1aJMbQDabqUfN6XBRWKQC_wiMRBidNmKXvI9wx8
Message-ID: <CAGXv+5EqUhJ62fjE0R9nLcu6tsfXan8ZEYe7hvkofKnFM7W8NQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33786-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DD3A2C60FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 6:14=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 18/03/2026 22:25, Luca Leonardo Scorcia wrote:
> >>
> >> Drop compatible. Regulator nodes do not have compatibles.
> >
> > Thanks for this comment. It took me a while to understand what you
> > meant as most of the MediaTek PMIC regulator drivers still require the
> > compatible node to probe, including MT6397 that was the template for
> > this patch. I compared the driver to MT6359 that does not use it and I
> > am now working on the driver to not rely on it.
> >
> >> With this, you can also drop example as it won't be used.
> >
> > Just to be sure - do you mean remove the compatible attribute from the
> > example, or the whole example section?
>
> The entire example because without the compatible it will be no-op.
>
> >
> >>> +
> >>> +patternProperties:
> >>> +  "^(buck_)?v(core|proc|sys)$":
> >>
> >> Nope, underscores are not allowed. Use only hyphens.
> >
> > Got it. I will actually completely remove the (buck_|ldo_) prefix
> > altogether as suggested in another comment.
> >
> >>> +  "^(ldo_)?v(adc18|camio|cn18|io18)$":
> >>> +    description: LDOs with fixed 1.8V output
> >>
> >> If fixed, then encode it in the schema - min/max microvolt.
> >
> > If possible I'd like some clarification here. According to Chen-Yu
> > Tsai comment [1], dtsi shouldn't contain voltage constraints. The way
>
> That's odd, because long time in the past I heard that DTS must
> absolutely set min/max constraints, because these are real hardware
> (board) constraints for each regulator, unlike the generic and broad
> ones from the driver.
>
> IOW, driver has what datasheet tells. DTS has what actually should be use=
d.
>
> Also, I did not actually require to make min/max required, just they
> have to be specific/constrained.
>
> > I understood this is that electrical constraints are a matter of the
> > actual board layout, so if adjustments are needed they have to be in
> > the board dts. But you also specify "If fixed", so maybe there's an
> > exception to this rule when the constraint is "absolute" and boards
> > can't actually set a different value?
>
> Now I am confused. You wrote - LDOs with fixed 1.8V output - so board
> cannot set it to 2.0V for example. They are affixed. This regulator
> CANNOT physically produce anything else.

As you said, it cannot physically produce anything else. IMO it doesn't
even need voltage constraints as it is already implied by the model and
regulator output, in which case I would actually recommend rejecting
min/max voltage being added to this node.


ChenYu

