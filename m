Return-Path: <linux-gpio+bounces-30439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B98D11787
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 773F530ACE5F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7259F346FD1;
	Mon, 12 Jan 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="WEPRh/cp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0960340D93
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209602; cv=none; b=o+04Zla2TdhTZl9fpLBSlITvvK0qmV/2v5htH9fk//UPB4W5IzmuFpdWHJR2KiQgFbNNkCqI/V9YJUwWv5spANy9Pr2QII9n79YJLdBrFjBwkkJDRgQjdyTZQkMKz/WkGYY3mHeg9fLF4FCZ2X1v2JqMMZoe1vy9mLud6Z5PtbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209602; c=relaxed/simple;
	bh=gjcYFAuxaDI253DJSgDXMH9GfBZInHB2HdN8H8KRsbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUIuBbgfYzvA/h1gtJQNdY7QZKTZd3RpZZqSKc4lLlZdl8Z9jlX4NeltOoelCpZn8dnqs/o//GeCLSwelwuQH3HaRG08k1ztgKffVtzQXh366t7TL1K0wTewqZyUxih2KfT5sLYpQxO/c20Ki9f2UqomkfxwB/01JDze3fd0Rmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=WEPRh/cp; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so9761337a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 01:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768209599; x=1768814399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjcYFAuxaDI253DJSgDXMH9GfBZInHB2HdN8H8KRsbc=;
        b=WEPRh/cpqiIvVhTB4wHvclCEhpjaVT/eHZSyiAMssLFeelcJbzAXcw5U6Gpf5rK+kB
         gHQkit9EVGtKz5GCT4tC3paxQq6ppSTLvMoE2wZklNwKGXcRXvIyqFU7MYRDcihNV96V
         e6eDolE2fzQsJ9hT5kJ+OQPnt+wwxBEbD7WjPoLTW5HGaGj7W1BHf/QIFsXHc/Yj8LFh
         2jQcg3gm+17jcJmTIdx3SQBNeKYO8kXDf8dXAiZn4hVSoPwweuufTZBjk5HT48w9HLP8
         lIggv9UCxnH1iAkXHoC5VRZ18TIlF1qe+FlYajRBAbEsxMgiSxJ81cerN+t3iTxxkAGS
         2zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209599; x=1768814399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjcYFAuxaDI253DJSgDXMH9GfBZInHB2HdN8H8KRsbc=;
        b=XrfxfsFVari7UhVcgh8aAdhRTfnRVP0JSwYM+eT8650jDzUp+BDVUAehiYSrdIjyTp
         YK7qtt9IkOA/+26SGzDzMhCV6C2wjfm2gvPp1gJkhYXsm4zfTwURfo8bW7ZXkqzpjmM+
         iX0TXYFAW8lu8q/1vL6cJ/A/6/h92IX82e/icfCjBlBPAiwHZ3yRQO+v/FYLsquo4sy/
         ZD107U3AdFGCBXyipWMm1yPhDrtMOtAMEH7M5cBScQ/z406YzCOW5zhIHsr/pBY/Q+zT
         0XjRWodbIz6ynhmudIoOMNg3+7p7BTB1N4mq9fju52ZdcfwPzh9zyr8vo9Bi7CaNYXKE
         +rlw==
X-Forwarded-Encrypted: i=1; AJvYcCXkFGVoaMAe3UAcegtpafE4mMywdoNMkVj1fgm3TPQM0vgpSSH/vJSVFZ3DlvWHj+JdyRprSkzlOvdu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw210aP/fCxDaOdbiI0Vcjx8e8E50m0EclKXhmHBZIJRnodYtW9
	UtUBfq6Yc0Fk1Ct75Lxea3jgHM3Sl/KdlGIiB7nd/FL0RL2GE2rtTNfFUj7vwdwVVp+lAsMRStZ
	511OgNEHTnvKo+yy+snbywS5h1OUEkeibkbgcInS7NQ==
X-Gm-Gg: AY/fxX7Vab6E6l6x7l5v5b5kHFDlWcP268h64WlGv9Oxta5mJTRIpeEzoLeCGKPSaIS
	pdr3OiDmJ2R3JqjO5FDiHnF8FV4u/vDdJEBPI0PZ2UyT/D+U9hqZdue3nJzwpVmhwn8A2WC4vCk
	RSxF7PbuDHD10iJoS3qR0hQM1LRl53XWZXtaUhyGiCS9Yyjo7tNFKl1U4A0BpEJvBCrLA7btW0o
	AnaKqCQ30loBBUN/GQsVFxVWz1fwugnq1yB2PAWjffpQFgwexPwPpIFj38CcTiPmz9q2FU2DBFh
	h5dVWLDmqf6tchyGhZJiZZQbe2MRY1hTZ9QrAuM+9jupPPGe1A==
X-Google-Smtp-Source: AGHT+IGuKd3o2pS1NgX8ycF8TIEnqLjf9jm67IMIiNppDR6/sHAzRL+XtHzRQof4J25RchbmWV6flkFwjbLaVQJKzvw=
X-Received: by 2002:aa7:c30f:0:b0:64d:498b:aee7 with SMTP id
 4fb4d7f45d1cf-65097dfb0ccmr11406756a12.9.1768209599182; Mon, 12 Jan 2026
 01:19:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112064950.3837737-1-rdunlap@infradead.org> <a7d75307-7c99-4181-a3c7-10ad26752fc0@kernel.org>
In-Reply-To: <a7d75307-7c99-4181-a3c7-10ad26752fc0@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 12 Jan 2026 10:19:47 +0100
X-Gm-Features: AZwV_QgLxRk4y7N5x5Cj25e0M8TmTNV31-p9jBl2Epv--W5m3OiM-Y8q1VqZsbk
Message-ID: <CA+HBbNGaQ_mvMLW3_aeNqDoLDYWX7NVObQZzzBNBuovkL=+-7w@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the gpio-tn48m driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 8:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 12/01/2026 07:49, Randy Dunlap wrote:
> > The gpio-tn48m driver is useless without the simple-mfd parent, which i=
s
> > not present in the kernel tree, so delete it and all references to it.
>
> Same comment, simple-mfd exists in the kernel, so driver is perfectly
> usable based on above sentence...

My reply from the reset driver is valid here as well [1].

[1] https://lore.kernel.org/linux-devicetree/CA+HBbNGT+7x0Bs9p5=3DbNVUSHt66=
vd38RuFdjm_GxPWX6C6XDNA@mail.gmail.com/T/#t
>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

