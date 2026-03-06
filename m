Return-Path: <linux-gpio+bounces-32676-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHgLFIvVqmnQXgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32676-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 14:24:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA0221870
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 14:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 831AB30713D0
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 13:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBCB395DB9;
	Fri,  6 Mar 2026 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o492Mygh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E3838E5FA
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803460; cv=none; b=jjwUrvHDX4MINHXPpTX+VLn4T5sVa75IrgKXyZ9/b4DsRTSSRVa/7yMLFqkmJgdfIhnz7y4FmMhaxzf8nIdCHp+SQZIRb9uRSjEAZ786BQkGS8+VQyvwSK02oHuP0z0kZ7KNGNzE1oX3rWpL4GXyQXpkRWs9ah5qi0hzdFBIh+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803460; c=relaxed/simple;
	bh=2Tg8c9NGCSfmldFmWgaUNjrLa0Dc9VIFZxjhyqX/Ulo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6kzowaWZPJxRl4t9fhg1Xchyk4iTmmjrmG5H3WBjt3XXCgCmimEw8YzrXQczZ8Y1zFz4r93GCGa3nQwjXSqbOKZTvtBxDzYtm8ZxDlaZQbOLs2bOkJwKjzs39NHpzO/OlrF+3+oHwWIDNTk66VK10WfTZnfCh4dX4PjF1b7zU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o492Mygh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC4CC2BCB5
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772803459;
	bh=2Tg8c9NGCSfmldFmWgaUNjrLa0Dc9VIFZxjhyqX/Ulo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o492MyghB/tp8dXmhNHfymNJbAraq7z9hMeH9lOOj7MxMotyPaAnXeZusXf6hZx8e
	 NnBLCDKrHKFbRSufS6UyHqVmpmX5W0QmEGUgX1aHKtAeHCvWrSluubEG8eqO5kIBDm
	 gcbXb467gumlcFleVjrdNuE2JrY1Mk8DbKIkGJ8LwtUX3XbPZ2PWDH7Tr9iiZkCYBg
	 I/e7lwvQw8xSM2TzpvufeyaggZkEgzQf+aOxE+64jmUL7z9v1XTcNLTjmjgAk8SbUf
	 VJdN+nzetb9HIykrliTCfJA0Q0E4QGAREe0wP5PiW0AFoLadnR9bBA6r/lZh7I8Q57
	 Fdal8HEf3b85A==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9f7576d4so6873282d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 05:24:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5XscMjsPJLvGXWds9oSODxxWEFmQ5kPB5gKxZgyNZMqUKTfdgy9x9IgNyaFd6WbV8o1gtNlkxrXUD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9edksGYS3jLpFkMfziqYEj9XanilL3gTvGBxvIyaPJ3EI1iG
	cPT9Q4sP6VB25F9wX+hE6SwF3WK7kWnfIFhmvUxpGMriYz8EuWgV7xRubsQqlicXFC7t3Mmh11w
	WxK8iOPhA9s8cvjnGMWC6gweRN+tifGA=
X-Received: by 2002:a53:b44b:0:b0:64c:f001:f6b with SMTP id
 956f58d0204a3-64d140a41bfmr1547217d50.9.1772803458885; Fri, 06 Mar 2026
 05:24:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de> <177254885509.3251575.14819823286886805862.robh@kernel.org>
 <aacH7NmkOzZued0Y@pengutronix.de> <20260304-graceful-sweet-bittern-98efdb@quoll>
 <20260304100642.44d00b99@erd003.prtnl> <4d4c6ebc-698b-44c2-9a91-607381d6ece1@kernel.org>
 <20260304112500.4766f21b@erd003.prtnl> <98debf2d-cc29-42dc-bb93-ee97439683fd@kernel.org>
 <20260304131731.4d54f051@erd003.prtnl> <CAD++jLkK5od7cODqQ2BsEKE7tvp8vVAsv6erLu1dEzcn35F8QA@mail.gmail.com>
 <20260305161019.09b67af2@erd003.prtnl> <CAD++jL=Gaaq0_20wDjjPkYwpyL6HWx7bmKqBmy_tieYu4scB6Q@mail.gmail.com>
 <20260306094406.6cafaeea@erd003.prtnl>
In-Reply-To: <20260306094406.6cafaeea@erd003.prtnl>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Mar 2026 14:24:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLkT2me3xCTjUf7hoO7oxfjp4h7ff+pxL4=Zf6zs45bz2A@mail.gmail.com>
X-Gm-Features: AaiRm50-l3MIo10Bj62OpNeCt8sqzr-ZXHm52j4AORSue8KDhp7pl4ctiIG0mXM
Message-ID: <CAD++jLkT2me3xCTjUf7hoO7oxfjp4h7ff+pxL4=Zf6zs45bz2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
To: David Jander <david@protonic.nl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	"Rob Herring (Arm)" <robh@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A9FA0221870
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32676-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,protonic.nl:email]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 9:44=E2=80=AFAM David Jander <david@protonic.nl> wro=
te:

> > GPIO assumes all values are expressing the (raw) voltage on the pin
> > clamped to [0,1] logic level.
>
> This sounds like a good, usable definition. I like it, but I can't find i=
t in
> the documentation.

I sent a patch, thanks for noting that.

> To make it more complete, I'd add one more clarification in
> case we deal with negative voltage levels (0 and -5V for example), but it=
 is
> usable for this case. Where can I find it? Or.. should we add it to the
> documentation if it isn't documented this way yet?

We don't really do upfront design, we deal with this case the day
we have a driver that needs it.

> Thanks for clarifying. This makes sense taking into account the above
> definition of raw logic-level =3D=3D raw voltage on pin clamped to [0,1].
> But for the future users of this driver I would need this officially defi=
ned
> somewhere, so I can point there to avoid confusion.

See proposed patch, it may need some debate but it's in there.

Yours,
Linus Walleij

