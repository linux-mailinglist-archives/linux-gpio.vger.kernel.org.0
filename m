Return-Path: <linux-gpio+bounces-31729-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO+hLB2Kk2lA6QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31729-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 22:20:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D97D147B18
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 22:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B58BB30210D0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 21:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA6527815D;
	Mon, 16 Feb 2026 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQn12f1P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5B11B532F
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 21:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771276823; cv=pass; b=qb6V9mJCvwQXosnFgRxVe0clnDzZSfrdtf8T+MEop/kr0RjSyIChrmQ0kVP/PXkMcf16KYTdhhXwJ6sSN8bIaUHlWgajbNd7qGttt8idlpyIz7KHZfY0KBthEfRlKOBDVKG7msC0Ehvarh1Oq3GFAYTKEAsBrhvYXcnVjz1i9fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771276823; c=relaxed/simple;
	bh=39jNJG7uDvRJApj7fvN8nXXrKM4bJ2RLCuxjPvVjkzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwSa0Db3Y3MPvfCImy/tiIwBPNxy30JJZl64ATfYLYxtI1G5oilmE1UHj4GAH9MRQJEqZ6Afr2SlzXbpy1HU+LbO1jIoHuHPk9aXazzXZgDtQj8G/hoXRIZqRVzpoqQJjD5p2jH8JqOg6PG2angED18iAmRpfLXkjrX0f+txlwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQn12f1P; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-948c3ce4d35so2041947241.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 13:20:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771276821; cv=none;
        d=google.com; s=arc-20240605;
        b=kCMEjy41f6lY/wbNN9XZmsUbD27Zps/ydDPninuI38Td3MfJW2zbjdqliTcs6aW1qY
         3pEeHvR/E0AcecZ2XnIIEaHFtWqp+rRywdCdk1/kZe9fNSAxPd3PhR2fhchQuicx+DGo
         iHHj4+a90jhfgy7MQ8l9kzoT0i9+TlVM9zzjqxiM0rODGEgD5o5fujLkTkwDCgSnklFa
         ncOoTZKdzzvJZ1qMCtC29w90wG8btIp1tHeafPTgOTzDrh9EXmdqrCqMg3aScPFNxfel
         /acGqIOEiRAPj8CAEQCwLf2HRyLquCV2QbT6silZSq27HasTrzf9YavZeK1KC93BXRYi
         ekHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=39jNJG7uDvRJApj7fvN8nXXrKM4bJ2RLCuxjPvVjkzI=;
        fh=dmpdgHhSE7pofg/+rejIWE8dnm6kF8qc0aujXiXE4Fc=;
        b=U+k0mgtobJ+t0YzH+5ieScao7OqbtH775TCMSoaGdjZvuBzhnxmzYTHm1Z5L63slG+
         qoOPFqLjsi8dUkyBAE6Pa4HK7i4sXeksbV95qsmhiErJMQVgzmAmOuDnEbfYnLtvzmqo
         ddyT0gUxsb9I3e6CyKA5R6dv5RpSkZhKuHlSHd4hDCifDKRVsT6AwMdk//a0tQQPr54U
         i57sqhNH0oGrMh7pdO3cpCNgdnBuGUkG0umLeXSOojZbmHp3NoNihXx5BU+yenEKBg9O
         plLRoIrtP+8KSS0h94xi2sHcQnSuouw38o5PY+wjn0AUS++R1a1nlRh2/U1gLmEI2bzU
         kDrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771276821; x=1771881621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39jNJG7uDvRJApj7fvN8nXXrKM4bJ2RLCuxjPvVjkzI=;
        b=QQn12f1PngYQaHeMgocTtcRNF38gjCsv5su7ZHj7u9ENx5D7oFUUuwNTR6NeXmfgS4
         eMDKFomFQOY7VcmhqI2SDUFUUIMyYOuCrDrxiQrvedqRqFQCHWhBlnp0XxAxJ7CBhHho
         g8x7D6Co7HdaDwfcus5Rj1NNqGzpe++in+BwJlyYVed8NdKrXLT+B268pUphApGGyt3n
         iSFRLg3iM+v++wBtdw2OMB/KERxCpFsUk01N7QoWVng4BMw1uiGq8mzUP4Kdf/zCEp7r
         tnTGM8BmpS9c50togtaSfR6ra5jXUSKwIMC2zZLjI1kkeexFNlOt8MdksXEHkF8SKtIa
         ChOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771276821; x=1771881621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39jNJG7uDvRJApj7fvN8nXXrKM4bJ2RLCuxjPvVjkzI=;
        b=nqEbliI3RMr5kbIiwLHm+8NIxMqtRyPgjpEYGNVw6dyUojGrqXlarMnRva7+AzRiF8
         y84eyY1mPd86vwzaHJXWwi+S0lMEpWi0SU5mGSVgBrfebdWOfUy7JdpzFyVrSQ7LbxJI
         ZNlhuQSNlkw69cYAZNTrsSOXoWzmgX+GLharZxqFexj9nggvanuKtd3RJ52cHA89nehL
         fWmxi50+Mmo4t7RH+f6y9ovCF/Q3YQ54T02RxTOkLzv0fXuOWmLER0ijcY7jSusm09Fo
         n2bFLJKjTKTwngz/MyLEgAQ4OZUiMxQwzlPHWv+jbn9VeUqbIkolrYliDObfP7847Jqx
         hIkQ==
X-Gm-Message-State: AOJu0YwbqaJVHAhiMT2WQ/4R+t/BYZEgJ4O6AX/L6cvEczYRVW7yMY8U
	84pQ9A9Nf1TZn/KXOx7RslsBZ/iwDhRQsGiRgRm+inPhRDJiIB7fPPwJsPeOk5ICkUlGU/odNJS
	I+ezZ/r5z4OeO39Y6o+JvUTeCOMP70IE8U2C9
X-Gm-Gg: AZuq6aKjRj3D7hjElUFPIr75iTPefUdriiwc9cXPcUbgmuDxldSuPFXgm6bipFatdod
	JRdHNwVR5nAxHB3SuoGc2MKWO81YSdXVyVWcq+O85DagADYMERhYNGu9vzelQqzMCPc9qYlolw3
	tSrT1nrB7RIOmXgWh2WtKtnJZWZcuhW3cVz4iZ5hN664pMhWvK+y708H+zGEj+RvWnLExPouhMk
	76p6GImrTY3GPTryCKglSP71eUZSs77I7GapyLqkVpwa64A/ABUPS7tx8XWtmUQW3jpbrhUMXed
	L2xVMf5sP6toHDBxZG2a6gPUDRnZBqyaN2NNnDW+L6kMY8kL11XqmzD2WtzHNBMI5n4Y
X-Received: by 2002:a05:6102:c15:b0:5fd:e9f8:b8d8 with SMTP id
 ada2fe7eead31-5fe1afb3fffmr4411476137.37.1771276821346; Mon, 16 Feb 2026
 13:20:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214213239.2546012-1-james.hilliard1@gmail.com> <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
In-Reply-To: <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Feb 2026 14:20:10 -0700
X-Gm-Features: AaiRm52FiAKU7rHk6inVhtiScAutlvFAT1kdXf1o_TCzG_SdmZ1wJXOYbAfPAe4
Message-ID: <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31729-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 1D97D147B18
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 4:38=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Sat, 14 Feb 2026 22:32:37 +0100, James Hilliard
> <james.hilliard1@gmail.com> said:
> > Allow GPIO controller child nodes marked with "gpio-line" to
> > configure direction/flags at probe time without hogging the line.
> >
> > Teach OF gpiochip scanning and OF dynamic reconfiguration handlers to
> > process gpio-line nodes in addition to gpio-hog nodes.
> >
> > Also parse "gpio-line-name" and apply it to desc->name. For gpio-hog
> > nodes, keep "line-name" semantics as the hog consumer label.
> >
>
> One important thing that's missing from this commit description is: what =
is
> the use-case and why do you need this.

Added some more use-case details in v3:
https://lore.kernel.org/all/20260216211021.3019827-1-james.hilliard1@gmail.=
com/

In my case I'm setting up the GPIO line initial state and names for
userspace consumers mostly. I want to be able to configure the
individual line names from a combination of the dts file and multiple
dtso files for the same gpiochip along with setting up an initial state
before userspace consumers operate on the lines.

> The DT binding patch should be sent together with this in a single series=
. It
> should also be documented in the relevant .rst file.

Which file would that be?

I had previously added docs to gpio.txt but was told here to just
drop the docs:
https://lore.kernel.org/all/b851bfd4-3c35-489f-a32d-dcd7a37ca99a@kernel.org=
/

> I suppose it's another shot at defining what we previously called
> "initial-line-state", "default-line-state", etc. What happens when someon=
e
> requests the line, reconfigures it and then releases it?

This should just provide an initial configuration, subsequent consumers
would override whatever is set here AFAIU.

> This should also not be OF-specific but rather a GPIOLIB-wide switch.

Like this?:
https://lore.kernel.org/all/20260216211021.3019827-1-james.hilliard1@gmail.=
com/

>
> Bartosz

