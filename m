Return-Path: <linux-gpio+bounces-31770-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SES8Fpm8lGm4HQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31770-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 20:08:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C934014F786
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 20:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 848B830416C7
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 19:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C560137473B;
	Tue, 17 Feb 2026 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LX5bd9+q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFA237419A
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771355276; cv=pass; b=rlQYYNgTQ3b8dKqm2APYN5a6VoW3Lh/eB8E+6h2FPsN024X3MDR5D0BDnUXIKjuHi9a44/L4PFCC60+r5hjyaHr2yA6Q4fqh1y5ujzsmzDQ9i83sLTaSbFwCoe22ZDoBz85/l4YpOA1c64ifYAqAWdDlAhLBu3RorNlRCBnoUVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771355276; c=relaxed/simple;
	bh=dyldXXzyBlj2YTsN0PLz1aoLB+RoqNGt55UKA5i9/hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGI7CH1JTF+iAI2G4FCa1QNegEiLv6oF/hjZpOukFSLHqcRIcyEaJUYSyOwm+Rv+Uz6R58cMkt8O7Yospag3ejOhYv5Vhuef/eiD8cHqy5Rzs+kipuQReGmTwBebMR7Z1atDR+g3s7/fDL8QCtkw3qPV71AsVlFuTL8qxZSpIDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LX5bd9+q; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56753dc51baso1707518e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:07:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771355274; cv=none;
        d=google.com; s=arc-20240605;
        b=bXX7fb33gqsCzAV+VsjovX4IyuqEcxQ2qoeOwlyYEwj85ckAQI5RnyX7o+1v0+af08
         4wcBD3NPzboQjcDI33MarMFMDzBexCcW6ewqTNRpePAXrsAxyUCxibEQ9RLGa7DXrCVp
         Bh+CeCqvQw3Kbb76t3hosuP4RmCG9QmAZ3BMNvqRZKZB2wxapiKD4u6HTbGyjm6v1RE1
         Ht7bNbseF/H6WReYJql0ip508tXksXYpvZSqGntYzvnBKXx6RqMt4t7tGoWT1Q7vHrLM
         xZLdlsBPCtxESi7fyZv3k/agKfDLLgFvFJXhWWIW+IIeRDWwcI+hWQWHRJ3wd89kzlrw
         Atjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dyldXXzyBlj2YTsN0PLz1aoLB+RoqNGt55UKA5i9/hI=;
        fh=mGgLYAnTovXq/TyMj0fg8aWxG4Qh7sMWRNPer7l4JO8=;
        b=LhoCgMODns4ATi5qN5hLLlHFominAimdtFxAjAa5cQu1TsfKjS6zEfRGYUyHdJl8wD
         1b80PQx0H/cBZ4jnnZcrgcfifn1bdTeDYow0W+/k8at6Wxm0Ovb7g6458OofSrzhaJmj
         z4cBSn3hyNJrkM2wuI4PqeZ7uZBE2moTH06ljBLpqHZseoCIB5UaGJnUASM7ekOUnM8D
         yh+FWGO/lNp4Y5IF1Z5mQ6zRH17Wef2JYkGR6msum7onzY70fP+E3Nf8SIwu3LeySrmG
         T9Gg2Uu+UoE1UZlCL6fp9tuDnY531AyGSBoQVhfRZ3lahCt+y3/9ZnE2hGK5UgVQKGzo
         jUaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771355274; x=1771960074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyldXXzyBlj2YTsN0PLz1aoLB+RoqNGt55UKA5i9/hI=;
        b=LX5bd9+qC73X6kHuCXHMD4IjGouNsDS1iCmTABGjNfXLJjgQiLshWLCEDuUNLMrb2W
         Oqa788NhAfKWqDyFV311sH0TJRnQL/resNdzYFNedkT4cHfvoXMvOiYddeMtEUzBygkV
         OuG/5DKswdUA5uk2PyRGtTd98y+6Yb8+ZyRFKQuVsKp/seT9ihlkIqqUEzX88fbsMbhx
         lyUQPX7B1CZ6tXwj16B8GOJnw2+j8Bd0HuUPWkwyLrndsZEvnugGXGf3SOtEG+N/w3FL
         DKl2JbicQgHjVAO/UCWif7wMudVljW3rJILrzPj/gTC8+KexzwIqy/vhridHIcJbH4Le
         cyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771355274; x=1771960074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dyldXXzyBlj2YTsN0PLz1aoLB+RoqNGt55UKA5i9/hI=;
        b=njMwvpF13K61D1J0Uh2d21QNcT/cF5UwOiaKtOXCtqUCYhI/vKg0C0QY/dWIagHbGz
         xpuBJmu++fJFCmQrXwGHcGoX687cehfYE1HEbIRZ9/ekEvX0dBwB0lchoz3NoQzPIO1C
         crP3zvIXYgjof7qBxGhQiBLuo0+nf1vJqdQFfMVG620+j4TsXBv3Dp7qyWD50xya6tH/
         JFHDzL8aSDXRMuw/FR1TT+rkn453R0/5HC+QQUz27lppku8RRa2cM8ossc5cogW+4k4a
         9j4RXRe94d3MlU4bLC733oNvx0+8wdwhia9rHPoUBAJwUBBPP6Njnhg3xlkzfHcbY568
         wrtw==
X-Gm-Message-State: AOJu0Yy32DKJy2/wu6TFBlEUrPwpgJF5mX1lpGUZpx7MgH6799XntH55
	0kuUT2ssZY+p9aAWQWnmG4mJa5aOgPnh5d2ZFqTRk/S1PmVWU4pinbK0TYws+YY8sZC1dHQom3e
	We8XYapZZWn03MK/qUHb+Ce8Um+tNC5NpSSua6IM=
X-Gm-Gg: AZuq6aIbjoWi3dJyLkYuUV6BBUu6U8U0Lt22JeEaoo5fONk1BBbUgrM1Fu7yx1P5rvJ
	TpPUbVDD54JtbJ3x23DP120g8qyaPD1wEaUMdMc/FZ8xg8hB5dB0W7kKQ+RbI9m+SFG4gOCyZPL
	IVI3b2og2tbb9zqGy75BeXjawWvnLuMGthSw79WReT/+IIehrbXHAfAE8VHya5pgu0UM9acWdp6
	x2he8ClaORuX49a7GTuKO+Irdqhkh7PW6j+OJmLDGXPP/tg4tW0S/sjsaZNJgSINzwiyfYVYG7a
	mQuUcuso+t1fGjh9FdFt4Krlp00aF3UnGB5Hfay4np8EOEPpQtERCUPFl25cGPw8qcm7
X-Received: by 2002:a05:6122:6588:b0:563:80e6:3b76 with SMTP id
 71dfb90a1353d-567681c291cmr4450342e0c.7.1771355274182; Tue, 17 Feb 2026
 11:07:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214213239.2546012-1-james.hilliard1@gmail.com>
 <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
 <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com> <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com>
In-Reply-To: <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Feb 2026 12:07:43 -0700
X-Gm-Features: AaiRm52HJ10yrzqkWoEOjyORfgZU1OldI-gXjZc5qft3kUVLQ6_-UhHaFZ-xLy0
Message-ID: <CADvTj4ovM1faNGoUa4HoTCN7avAqwkZfY5v9P8okgx87or8gDA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-31770-lists,linux-gpio=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C934014F786
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 6:18=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Mon, 16 Feb 2026 22:20:10 +0100, James Hilliard
> <james.hilliard1@gmail.com> said:
> > On Mon, Feb 16, 2026 at 4:38=E2=80=AFAM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >>
> >> On Sat, 14 Feb 2026 22:32:37 +0100, James Hilliard
> >> <james.hilliard1@gmail.com> said:
> >> > Allow GPIO controller child nodes marked with "gpio-line" to
> >> > configure direction/flags at probe time without hogging the line.
> >> >
> >> > Teach OF gpiochip scanning and OF dynamic reconfiguration handlers t=
o
> >> > process gpio-line nodes in addition to gpio-hog nodes.
> >> >
> >> > Also parse "gpio-line-name" and apply it to desc->name. For gpio-hog
> >> > nodes, keep "line-name" semantics as the hog consumer label.
> >> >
> >>
> >> One important thing that's missing from this commit description is: wh=
at is
> >> the use-case and why do you need this.
> >
> > Added some more use-case details in v3:
> > https://lore.kernel.org/all/20260216211021.3019827-1-james.hilliard1@gm=
ail.com/
> >
> > In my case I'm setting up the GPIO line initial state and names for
> > userspace consumers mostly. I want to be able to configure the
> > individual line names from a combination of the dts file and multiple
> > dtso files for the same gpiochip along with setting up an initial state
> > before userspace consumers operate on the lines.
> >
> >> The DT binding patch should be sent together with this in a single ser=
ies. It
> >> should also be documented in the relevant .rst file.
> >
> > Which file would that be?
> >
>
> Documentation/driver-api/gpio/board.rst would fit best.

Should gpio-hog docs be moved here as well?

>
> > I had previously added docs to gpio.txt but was told here to just
> > drop the docs:
> > https://lore.kernel.org/all/b851bfd4-3c35-489f-a32d-dcd7a37ca99a@kernel=
.org/
> >
>
> There's a difference between device-tree bindings (formal, machine-readab=
le
> definition of the firmware ABI) under Documentation/devicetree/bindings/ =
and
> documentation for humans residing elsewhere in Documentation/. Make sure =
to
> not confuse the two. I would expect both to be supplied with such a chang=
e.

What file under bindings would this go in?

>
> >> I suppose it's another shot at defining what we previously called
> >> "initial-line-state", "default-line-state", etc. What happens when som=
eone
> >> requests the line, reconfigures it and then releases it?
> >
> > This should just provide an initial configuration, subsequent consumers
> > would override whatever is set here AFAIU.
> >
>
> Yeah, that's what I was afraid of. This is not hardware description, this=
 is
> user-convencience and as such I don't think it has place in DT bindings a=
nd -
> by extension - in DTS.

I guess this is more describing a hardware configuration, but is that
not allowed in DT bindings? There seems to be plenty of DT stuff
that's effectively describing the way the hardware should be configured
initially.

For example uart/serial nodes have a current-speed property that
can be used to configure the initial speed, but this can also be
overridden by userspace consumers at runtime as well via
termios configurations AFAIU. That seems to be a pretty similar
case to what I'm trying to do here with gpios.

What's the reason user-convenience hardware configuration stuff
like this shouldn't go in DT bindings?

> I'm afraid I don't have good alternatives to offer, solving this has been
> attempted several times in the past without success. Even gpio-hog would =
likely
> not get past DT maintainer review these days but it's ABI now so will sta=
y
> supported.

What did previous attempts look like? At least this is minimally invasive
and shares most of the code paths with gpio-hog.

> How early do you need to set these settings?

Well, before userspace applications can interact with the gpio lines I
suppose. Essentially so that it acts as a failsafe configuration in case
the userspace app doesn't get started for whatever reason as well as
giving some initial starting configuration for a userspace app to act
upon.

