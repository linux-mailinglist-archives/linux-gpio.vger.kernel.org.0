Return-Path: <linux-gpio+bounces-39779-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A9DXKAgiUGqBtwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39779-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 00:34:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCCC736151
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 00:34:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WdUXjKE7;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39779-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39779-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89366301300D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 22:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89D6339853;
	Thu,  9 Jul 2026 22:34:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EEF296BD3
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 22:34:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783636484; cv=pass; b=QoDGX5J4O3lz9qXnx4cP4EfJzEsXWdWF+a/T0fJTHDbBHrUAXKexdpWz9SBiXHrPYRGufPFvevZQNyxw44DrCeEs8xIF3EfpRt8h1KLnU7RRYDctrpdXWZeQq8VThh8j0rqtonOruM76bLHQwvufQ3G7rfxzITs0HAea+bfFRAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783636484; c=relaxed/simple;
	bh=r7dH1Jx48XQzw/YsyXVkq8hMuG/dbBX4rzxTJvICQTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEKhwdCaFRIjLOLamKiT8YPEWdT520UeUl2OlW4CfdrOZVmEbtQA7Vpb8xO+FpXkRd4o7qcyVu3QZh9wlo/CYkO/LhAj+9QdcjjV57UycBv+eWunYHBiAAxBl/nMRlqeW3OfCVgjDioaMh9fwZSHZq43Ka0Pe76G/IolRklMsLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdUXjKE7; arc=pass smtp.client-ip=209.85.218.47
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e03c2763so63854366b.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 15:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783636481; cv=none;
        d=google.com; s=arc-20260327;
        b=B4hBcBLb2cBZdd7fbSWohnuWq9E323veOF9OlTzAEkpuk8L/uLcN8CXXEPISTjN93L
         AOHXqeBnBQMadmJjoPGXTig08SZ+F6Ggq5SChnRnwbl9KRU+BW2XfViIlP1yeGKz/CdM
         TQmjxupCyLz1E8Y5pD4g3cPVzLbgkQuxBDAbpK0rin6sf2cbhzxAZpR2P4NyCsE6ugFo
         uQ7w+f2QGhgucrgbYUBWcBmtC+wMyLSwAVH4C70HrghkfnuQc4/TI7OdwUDx+f7tPFyV
         q9BrSBe1gJicbKiQTyFEJkQbQFLIMraJp2GWXLWfue/c4x0tn/m/ID1033bBW7QT/x9i
         bRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ueXpGkNkjghZXiFGmKL/ir6IQo5KJ2evZQEGq952mMA=;
        fh=L0ze/kXiVRvE/5nFNPAVorzQcdiMVh9bnR6vJEsya7g=;
        b=e63xyCxaQy+3RahoaOs1ZNZ0dKrTPsiK0B11a6Cx1vPJs/d61MDrwSJZ3Dm+XqDLpK
         MxlHsBG9B8jUtWVNeHzLacHUGFHeN4H8bD7GRv1tqtygwnTDnHg1MFp2AK+n2g6I9A8o
         lmYl70X6ghpzZGw1I2igKVffi6ZBvDYhw/RATx+5Iwenznnzk5kjWQRlj7h77X6/RiyW
         6DcAyBjuimYlGcL9igWiwVEeZ+CHhaFKFoHRwM9hf1qB3oMCIk42bXXbnBG+xAUYx/ul
         3Abi5TZrPMJq7Tfp9ckQMVIQ7pdy2fnu6sE9/WD1o29uaVKBJkLCeE92Efwz4uIwz7Yp
         jdeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783636481; x=1784241281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ueXpGkNkjghZXiFGmKL/ir6IQo5KJ2evZQEGq952mMA=;
        b=WdUXjKE7YHdMjP9t2nwMaEziXtc4OWIujbcjiIyOgZe2ZZOzRQvmLn+G0NqKDbDtvg
         N91OI8rsSqV85g1lEQbR27oHZUT2H2yO/0S9VYw/OCR5iB2Rnk0cxMF+NZHhksXfUB3B
         wD4y+gXw80SbWY2jAQxtwPGzY8hncdXyOxJPi2pL0kfDQ3RBiKylNLSHyTyJ+/1Wt3CK
         QPamIgcqdXdnViDgHfgpQuXzwcOc+InllVSHLksEYD7eaWYkgPtoU2/clb8cuoZdbOHv
         NhHOuqvVuXHYsnMhUhHymVpqHSMU0M7sr+DLuflIzsRFTR2Yut5ZtD/mNatZkCpS0wPq
         MhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783636481; x=1784241281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ueXpGkNkjghZXiFGmKL/ir6IQo5KJ2evZQEGq952mMA=;
        b=B+yHJpoMMCZni8DI9Tc73V1u5d8xM99V05z1ptUmEjMaXRE6NRNhVcVqyDrcVfEw03
         Hgtm15YFV9yankQYC9QaJ1FZKL717EpQ9T1WCxbxNhTf6z+FLikZlYwonYhIUtdoaR1b
         KwCYvA+M9Tv5Ab0b3aZIrHLyQ18ZnzdU9J29PYlD+Y2fdV5MDkazeftldhhQsyLQQH8N
         XsX5UZg3FcUlH34sz3UTt1LjBTqchgW9Y/rEZt7T2ijfzY+u3GlaLRDuIBnAYNmp6L6G
         2Gkw8GjqJhPaGeKwX/zRAJGZ247X+NeV7AJFLqww7FheIpX28gVyJTCSjGpXGAJJqrQo
         A+KQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVAv4M65INb8LFu5YzsP+T9vfojfPuH19Cg/YGt4LfY+gZEawxjvXaJ27Ag+YsGdd9DCD4TicPpkiX@vger.kernel.org
X-Gm-Message-State: AOJu0YzwU4w4Ud731oK50gxHNJondi+vHkaRHWn16R6GJ9wJ6AslNgIe
	3UuZJMLCdFuIlsNGGmkTi2P7dpsziMBfelFyYeTLPf1LNhBVO41MG+sZ14DcjvKawpIrFLxDdAM
	gUU/gqRF+Eudo+ckyluk1sVyLsEg0xwA=
X-Gm-Gg: AfdE7ckXncqp5Xq0iZK9BerGFikK2vLMQtLtYAJkrs0TfFRTCVMPrSjBtlGoJcI7yEj
	M3N1QOnhxTKDQgUk9tjjBMU8L/eS0Ki/sOjJ3A0NcfBm0mUn4MUiz0gMGPUkYCq1+twsAPRBl8x
	FckG0X4jttnQtjFsuJV25/axaSvYZOjZRzM+EnrcfTgDgNr/TDhkzprfacXjl7c7a/la6R1B75F
	2tSixL4tklx74O/+cbRNJMckL2ovWrYMxZLCNhktyMJxJy01cLYq7UPxj25DGODaE5KWfjcimSX
	5g4aQCimpWptQZyRoPSj8e14xxwzhM1ebRxhlfWvBT+w7JE15YE400XgypUxHAn1LOGWz6W9kvt
	ZRJXVQloGUP683sRmgDP44TFX1ucJHMu/uDH51RqOgqiDz9MoJm4dX3zUhmF7uMloCgNXaOFn0/
	7kaMZWtvhAjURvT1phWQ==
X-Received: by 2002:a17:907:7613:b0:c12:a9ad:68df with SMTP id
 a640c23a62f3a-c15fe7ebe86mr36352466b.27.1783636481414; Thu, 09 Jul 2026
 15:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707230651.1138887-1-rosenp@gmail.com> <d5a86921-db3d-458e-b826-b0bac370832e@lunn.ch>
 <CAKxU2N_aMvgOwEnmGbCB33k=KOKnk8=-RPK_aJCwV7tn3GcHKw@mail.gmail.com>
 <CAMRc=MeOzqqv4+zRdhEXo8x=8G+zuz7n_5wLTpKHVth7_kzjHw@mail.gmail.com> <1a7344ed-0ed7-4151-99dc-76f35860bd35@lunn.ch>
In-Reply-To: <1a7344ed-0ed7-4151-99dc-76f35860bd35@lunn.ch>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 9 Jul 2026 15:34:29 -0700
X-Gm-Features: AUfX_mx1kBIxyCtEDw19v6dzfq5U0eVU4wsBOLmqh8UCiPqM24rH79UzQH2D6V8
Message-ID: <CAKxU2N_DEZ_Sh3Nbr-KCGU5yPfssvjiqbBn8wgnQ8JhS_o49qQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: use devm_clk_get_optional_enabled()
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Ralph Sennhauser <ralph.sennhauser@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:ralph.sennhauser@gmail.com,m:thierry.reding@gmail.com,m:linux-kernel@vger.kernel.org,m:ralphsennhauser@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39779-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DCCC736151

On Thu, Jul 9, 2026 at 6:28=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > So is the clock optional or is it not? The answer determines the correc=
t
> > clk API to use.
>
> The Orion5x family does not have the clock. As far as i remember, all
> the other families using this driver do have the clock. And for this
> line of Marvell devices, if the clock exists, you need it ticking,
> otherwise the hardware just wedges if you access registers with the
> clock disabled.
I asked my LLM about this:

Compatible SoCs Has clocks in DTS?
marvell,orion-gpio Orion 5x, Dove, Kirkwood, Armada XP 98dx3236,
Armada 39x, Armada 375 Mixed - Kirkwood YES, Orion 5x/Dove NO,
98dx3236 NO, Armada 39x NO, Armada 375 NO
marvell,armada-370-g Armada 370, Armada 38x, Armada XP
(mv78230/60/460) Some have clocks, some don't

Not as simple as that looks like.
>
> Also, as far as i remember, the Orion5x family does not have the PWM
> extension to the GPIO controller. I don't remember the code well
> enough, but it is possible the missing clock check is dual purpose, it
> also detects an invalid DT when Orion5x has PWM properties when it
> should not?
>
>        Andrew

