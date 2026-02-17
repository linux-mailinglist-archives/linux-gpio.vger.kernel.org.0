Return-Path: <linux-gpio+bounces-31755-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AILYCaRqlGmqDgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31755-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:18:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C114C7F9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EFD93023E32
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3CA361DBE;
	Tue, 17 Feb 2026 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgi3HTtn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8181DF27F
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334302; cv=none; b=Z8pPQu9nnKdcDry1e8jG9XDUxTri3xHH681nUhptYM0UZ+ii5LruFlcMR2fWzZ/Q4CZ4zHVzqnJ/3M2ioJ/5bw67cG/Ae2b8VjTw8cMHIHoFDGlXMpGeorypBfeGGxFniRbccS/8VoV5x9EFuqKuzLuB3QX0CAHeWxvRtDZmReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334302; c=relaxed/simple;
	bh=dPbwNzfn+9D2xC09XXNXSx+qckuIsurXP3GR4z9ZbtU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWruvgf1kBKf8jnqnFMtOTaxOX8jWSSQDxv2AQqON+dLAGuxpkBOaTsvTdWjlbAzsFDGq/7CNQR9tQ9+jlh7ky2/2g9BQrZMtmTdfZlJHs1Sjj1iaPBT34fR02wbiy4iPwOXCW+W9qg7PO6SbcwNgvdz2MSQkgpUqAVWYM8tIkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgi3HTtn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38DAC4AF09
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771334301;
	bh=dPbwNzfn+9D2xC09XXNXSx+qckuIsurXP3GR4z9ZbtU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=mgi3HTtnqi1yFKsjcG0Ejtds16oyeV1UX5pJ4q1TSIGT12ioAHSqmNM+LImHGN4Wn
	 KN7AK/4iQLdGQGqs0qBK00FQ09cOsJAuJG3PocgLkc/Ilzh9ODpc2ugwlzbaZ7iUR5
	 sy1si8eCJpn4/wSH3BtwBZl+5dLLySVCiALJAgVDuKzrKgl93XxOn2BpeJp0CZuNMY
	 FLKq1bTsN3330OrbO6x1qxfB246J62fVkl+GuQD8+ICTufK+l57QxqdJSaZceLqDaN
	 mCYXGAtIVxaZNg1p09CsiKWsZ4f7BlT7rmGB7UDPTmOIDBvZrxN/Zy0PrKJaEFsFSv
	 P+4ld0mZwyMCQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e6b7b11ebso4784999e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 05:18:21 -0800 (PST)
X-Gm-Message-State: AOJu0Yx6olEPF/Pmdjt++rOLl3Hh5cmwgpzyD9QHFt25h2AU7SHzSp7V
	B869TFze2+99dZXhUwGVTvK+Z66/T4D5soNg9ufJ/jxpyy4oglUYqgpuCuwqlLXgqXzaWqQAzdO
	/TJn8NWExSNAPb8eQ9SnIadu/zB1AeVDajtpTpcqP2w==
X-Received: by 2002:a05:6512:6c1:b0:59b:786b:2a18 with SMTP id
 2adb3069b0e04-59f6d38744bmr2983262e87.46.1771334300559; Tue, 17 Feb 2026
 05:18:20 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 05:18:18 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 05:18:18 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214213239.2546012-1-james.hilliard1@gmail.com>
 <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com> <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com>
Date: Tue, 17 Feb 2026 05:18:18 -0800
X-Gmail-Original-Message-ID: <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com>
X-Gm-Features: AaiRm51u6cZWlWQ4_c0C0bRr66KZOXjCrve-gSPWLCp3sPzT446gMMF_3O0WXuY
Message-ID: <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31755-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C2C114C7F9
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 22:20:10 +0100, James Hilliard
<james.hilliard1@gmail.com> said:
> On Mon, Feb 16, 2026 at 4:38=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> On Sat, 14 Feb 2026 22:32:37 +0100, James Hilliard
>> <james.hilliard1@gmail.com> said:
>> > Allow GPIO controller child nodes marked with "gpio-line" to
>> > configure direction/flags at probe time without hogging the line.
>> >
>> > Teach OF gpiochip scanning and OF dynamic reconfiguration handlers to
>> > process gpio-line nodes in addition to gpio-hog nodes.
>> >
>> > Also parse "gpio-line-name" and apply it to desc->name. For gpio-hog
>> > nodes, keep "line-name" semantics as the hog consumer label.
>> >
>>
>> One important thing that's missing from this commit description is: what=
 is
>> the use-case and why do you need this.
>
> Added some more use-case details in v3:
> https://lore.kernel.org/all/20260216211021.3019827-1-james.hilliard1@gmai=
l.com/
>
> In my case I'm setting up the GPIO line initial state and names for
> userspace consumers mostly. I want to be able to configure the
> individual line names from a combination of the dts file and multiple
> dtso files for the same gpiochip along with setting up an initial state
> before userspace consumers operate on the lines.
>
>> The DT binding patch should be sent together with this in a single serie=
s. It
>> should also be documented in the relevant .rst file.
>
> Which file would that be?
>

Documentation/driver-api/gpio/board.rst would fit best.

> I had previously added docs to gpio.txt but was told here to just
> drop the docs:
> https://lore.kernel.org/all/b851bfd4-3c35-489f-a32d-dcd7a37ca99a@kernel.o=
rg/
>

There's a difference between device-tree bindings (formal, machine-readable
definition of the firmware ABI) under Documentation/devicetree/bindings/ an=
d
documentation for humans residing elsewhere in Documentation/. Make sure to
not confuse the two. I would expect both to be supplied with such a change.

>> I suppose it's another shot at defining what we previously called
>> "initial-line-state", "default-line-state", etc. What happens when someo=
ne
>> requests the line, reconfigures it and then releases it?
>
> This should just provide an initial configuration, subsequent consumers
> would override whatever is set here AFAIU.
>

Yeah, that's what I was afraid of. This is not hardware description, this i=
s
user-convencience and as such I don't think it has place in DT bindings and=
 -
by extension - in DTS.

I'm afraid I don't have good alternatives to offer, solving this has been
attempted several times in the past without success. Even gpio-hog would li=
kely
not get past DT maintainer review these days but it's ABI now so will stay
supported.

How early do you need to set these settings?

Bartosz

>> This should also not be OF-specific but rather a GPIOLIB-wide switch.
>
> Like this?:
> https://lore.kernel.org/all/20260216211021.3019827-1-james.hilliard1@gmai=
l.com/
>
>>
>> Bartosz
>

