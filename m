Return-Path: <linux-gpio+bounces-31892-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qWO6MepTl2lexAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31892-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:18:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C669416197D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F928301511A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715842D6E53;
	Thu, 19 Feb 2026 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCvpyNaH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F8257ACF
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 18:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771525094; cv=pass; b=jciPmi1z4Cf5qbbI05eTWiRH4xpz+Tp1BXtrb2X5JsqORN9ITN0lnb63hh7Y+UGMuNwXRIceQwoLtQPiiwc7FJyHnxHbmwQcPDQk+vYcV11S1gdc86nu5aIqUHW5CF9F/t7puujSyCsfvHf9PpTm7ZcG24ahx91IDpr43b8qLt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771525094; c=relaxed/simple;
	bh=/hp1y7ibpXSZAU1jyZgA+vA4E0AUAeJaWyX7n5TvGwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkQJXpE36ofqabHETPQyl4DNUJh0YZDKZ9PfO0zEI0nxYq2uj5uYK3RLNRaU5IPQL9IEoQ1G5k+7YWDmnpVZWyK75p5kOWBiytGvkq2zfSAZGt29IXVcex8QECb61Zdbio0CGVr6rUr/cXqxQxQepb0LYvGuGwpxUVwvdIMWe/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCvpyNaH; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-567543b8989so624564e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:18:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771525092; cv=none;
        d=google.com; s=arc-20240605;
        b=dC2awjWX2w/JMzJM81/AhftyQKtZnqp5SXPQ/3D5/jUghYxrRjB0/fuT7ikAiVzUgU
         VcRbcnPjYn0pkRvPXqK7VvCH+LB5FVX6PILDPLNHCc8bsWIw+4QLdXTSFasoXUgoo/qq
         Bk7vJuCW2sMtGHXeIivClSWhe9fRgo5c7Ho52+M61/WbXrPGbjcZvPZxvp4esy99ax/0
         uK6T0k0/Y0/s4HmGQPwH4rQdtN4HpsRX/NLMS4EvQ5Q17Y9rjRAc44FnZ8TPLxsbruMm
         ERBRGCBqcHIoeEDQNJy2Swwwh65/Y97Fz98v8dMDWIHhkfsOXClB+brZuZ9wI40iPXPJ
         vmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITQ+GJLf8Fq8a87zdUiSnabLp+dteo4o4FI2FGSkzq4=;
        fh=A0fVG9Gmcw52a5EQWy2rCbN0zAnycDmrIb3MbuOhIVQ=;
        b=ENfcIobACX1tZQRHmdQsHP8GZZ5MS+ZK+hhFUjNk33VtyczojpkJIi+AFXBCGyiGmr
         kEKO+RERmacEb2FC3ub0JKKEBCNtlLV1AyQK5W3LXIqDnTQkEQRVCvdvDzP4xmh7ElFR
         R0wKyGeaDfSgfm5nJGNuAm3dh+2KKc0/RFmCg5Gfi+0+IKrgoe7D9tKjfSpaLkzUZrxP
         aeAeVjiWVUSskrXUZptWSheBpxV/AuWveEvutMzU6TtD1nidaNXrNnDcFJ0HDo1oICmD
         f+oJLPpVzMzDKepTexJOLR5T2eU3x8F3WFcrimytxr+ZTlqnG7SA6hU8wWTUzuODPSe1
         eaJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771525092; x=1772129892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITQ+GJLf8Fq8a87zdUiSnabLp+dteo4o4FI2FGSkzq4=;
        b=RCvpyNaHBPq2ukZQJ351EwK0FyxGUze6Pg66B+fpeqEKKgFFSvLHytNprqm+ZHRQLI
         SafhIgNf/rzsXAFrDlWnHbkJmQ1LS8ho468VtPnANBfJt7rNsgfQdhW/XE1IbfXtsGh7
         z6Y+dbkWQeXcl8Vcy1jshmHFe8XuJHsJHl1FbH0WiNF6gxuauPhvZh9xkJoaDr86GmmT
         pgPEl12xIDPnAKtUr8FYUN82f+XA/VwfcU97PF2HlwtAc1nY9zN8bo63ZrNA9Zo8aLqU
         qmVnNpab1luj8BMA50sZz/SmvejMUqiE0Waz2Rit7LZOi+lvNl86YBOkj1ud+WzHAL24
         QQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771525092; x=1772129892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ITQ+GJLf8Fq8a87zdUiSnabLp+dteo4o4FI2FGSkzq4=;
        b=k9sdbb8nRpo9LhUmmX5dfttwRN82vWPav90/Jhg9Dy8JfKi2dGz5zpxyI8+4vwJ2Wf
         b1Ly0ZtUMGkQ24Gvp/cbJ9lE9va+tQ9H3f8e7hkbLDZMqBOhu1i0/G+pkjzr4WSmDCV/
         90OyKj6+S/U2QYErvov5FQZxZMuK36xytnNWbaJSlmF0WGm25PGC3bAzqgLixUeNAQXb
         FQEOu2ZyMd4ccTSJQdeyXHWHADokEjGJxeNAZE/sX1uj989NTVsSYivPltZrTXgNkm8l
         s10ddsZsMxvYNbRUcL+/G7tvftg3QaW3k9/7LFyYbm2n/SFJzmH60LoqdfAUcFyDtVVM
         pe8w==
X-Gm-Message-State: AOJu0Yww4GiGUkXUHSXCtYvyb4ofudkj2ZYiWxgAbU2SI0p5B+ONxMjW
	sJzzWqt++L/Dm9eZlVUpa4gartmrLY5yWZMZitnCQY1PG3snsxt5/KcHrWPpYHk6Jc8+8tnCLh3
	J4mm9mSr7XN17dkyMOvSvBFSUG6QIb04=
X-Gm-Gg: AZuq6aJRKvhlRlvTIQ06AUQ88Ai+7WiCPLdpzylaxRl8ACfjmCinfbqt2wlLOa8WR6/
	TiF3jetc67KW1U1aViRsfEWFtesk9YXbPqoOz+8q/+R10b0deMPpcZVibBWz8PLAuePNr9xSX7l
	51Rsj6sEquHK4FeGfHP8sUVd2K0ztKoi1lDjWCZ18MhHRI+u/zfoJjWW/DnZKy0fRPvu+VDwTWk
	7Ei8Q+F6DC3rfGmZzpg60F+GEAl5SJ04dMMEGOvqdBaxfs/kcvyb6mHS0T6tkWyR7GcKKxAsigD
	X6kWwsWjqb53Z2BRzRNmDn04sUC01LQPTAN1FR+WzxZMhsT/fpiBS00HkU/UJ6FB6Uw=
X-Received: by 2002:a05:6122:1819:b0:563:6df6:1b8 with SMTP id
 71dfb90a1353d-5676817b9efmr8149358e0c.1.1771525091490; Thu, 19 Feb 2026
 10:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214213239.2546012-1-james.hilliard1@gmail.com>
 <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
 <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com>
 <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com>
 <CADvTj4ovM1faNGoUa4HoTCN7avAqwkZfY5v9P8okgx87or8gDA@mail.gmail.com>
 <CAMRc=McR613nBkUehva0bidxrUz2eQ1Ud9g1m4gKdXyGzHo_PA@mail.gmail.com>
 <CAL_JsqLEKr6G4qZe=vvJzP+KC_WWh0SHOjg14rxQvAvxV7wNUA@mail.gmail.com>
 <CADvTj4pfuV1s7VzS-cw+66N9HxijZ8x4Gr_jgTqPEqDvpz-hqg@mail.gmail.com> <CAMRc=MfBt3ae2tdRKQT-AvjocN9OmC-jAtw0206rT3qGmSJDig@mail.gmail.com>
In-Reply-To: <CAMRc=MfBt3ae2tdRKQT-AvjocN9OmC-jAtw0206rT3qGmSJDig@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Feb 2026 11:18:00 -0700
X-Gm-Features: AaiRm53T_wYk-ofX8_WOlEoFF6DbfkPcGUjxarPmHryolQRltHZlJs3AJkTuWGQ
Message-ID: <CADvTj4qR9uq_uPmH0bwRxAsmYDxb0TKOfQow9DPTUbG_wqTAbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31892-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: C669416197D
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 2:15=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, Feb 19, 2026 at 12:56=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > Well the gpio-line-name property for the individual lines is a way of
> > describing what the GPIOs are connected to in a way that userspace
>
> That is hardware description plain and simple.
>
> > can understand, at least that's one of the motivations for this change
> > along with setting up the initial line state. I would probably also add
>
> That is not.
>
> > gpio-line support to u-boot so that initial state is configured prior t=
o
> > the kernel taking over as well.
> >
>
> The problem here is that the state of a GPIO that's not requested is cons=
idered
> "undefined" and controlled by the GPIO chip driver. The whole "initial st=
ate"
> sounds very hacky. You would have a much better case if you instead worke=
d on
> a "default state". It seems Rob is not entirely against it. Neither am I.=
 It
> would make sense to tell the GPIO driver: "if nobody's using it, do this"=
.

Other than the name would the existing code here be essentially the
same for setting default state vs the initial state? If a userspace
consumer attaches then detaches from the line would the state retain
the last state set by the userspace consumer or would it revert to the
default state somehow?

I'm not sure calling it "default-state" is the best option however as this
was also designed to be able to usable for simply setting individual
line "gpio-line-names" name equivalents without altering the default line
state at all.

For example it should allow for simply naming individual lines by doing
something like this(i.e. not setting the line "output-high" or similar
properties) without affecting initial/default line state:
line_c-init {
    gpio-line;
    gpios =3D <7 0>;
    gpio-line-name =3D "foo-baz-gpio";
};

>
> To that end: we need DT bindings and I'd say: start with an RFC bindings =
patch
> even without code, see where it gets us.
>
> > Some of the GPIOs have kernel driver consumers and some have
> > userspace consumers but it would be kinda nice to have a way to
> > name them all without the limitations of the gpio-line-names which
> > isn't really capable of operating on individual lines.
>
> Please don't use a property called "gpio-line-name" to define a state of
> a GPIO, it makes no sense. The line-name property of a GPIO hog is the
> label we assign to the line when requesting it. There's no requesting her=
e
> so let's just not use any new line names. I'd go with something like:

So "gpio-line-name" is not the consumer, I added it to gpio-hog as well
to allow for configuring "gpio-line-names" equivalent names but for the
individual lines, something that's not currently supported with the array
based "gpio-line-names" property.

>
> gpio@1 {
>         compatible =3D "foo,bar";
>         reg =3D <0x1>;
>         gpio-controller;
>         #gpio-cells =3D <2>;
>
>         gpio-line-names =3D "foo", "bar", "", "xyz";

This way of defining "gpio-line-names" doesn't allow for defining individua=
l
line names, which is problematic for cases where one wants names to
come from multiple dts/dtso files as array properties like these can only
come from one dts/dtso file at a time(i.e. doesn't allow for combining line
names from multiple sources).

>
>         foo-gpio {
>                 default-state;
>                 gpios =3D <3 GPIO_ACTIVE_LOW>;
>                 output-high;
>         };
> };
>
> Bartosz

