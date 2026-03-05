Return-Path: <linux-gpio+bounces-32616-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5G3WHnAUqmmYKwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32616-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 00:40:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF7219684
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 00:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FF373018293
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 23:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730202BEFEE;
	Thu,  5 Mar 2026 23:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHUezPzB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3404C34D4D6
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 23:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772754029; cv=none; b=Ms7eB4k6ywIMjaccpXGVmaSYMITY3j2jDvfYgdfoc9tpi+3/Da8/RP5h3yk69EB1ZEZ8MlOQ433Tqbdh/SSuDIWr7QEOmU+z9LYzua2ARQCH+j3GurYZ2pljd8WhUhM+fGmWOg3y6Jk2iZBaR0BJspmSsJ+FuyouDyzfQxNfX9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772754029; c=relaxed/simple;
	bh=BS7Umqk48e97pOwcEp8BnjV08Occp4nWz8Zi+ocSdsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snZpqpgbyUfJIupXU6JJDOigwqe6rgK70hSVepNUYGvVHItPbXCLoayD6ZzlOVhsrwk+Q6uHKUa5kLmqKtvV45+dPEtIaNanBXykEUoQlxTum7/4B1ibh9wKhTfRP+DtLupt+idgYk+6T+Y+kSLcMme/GthUmurFc80wkkkpZrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHUezPzB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BE3C2BCB1
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772754029;
	bh=BS7Umqk48e97pOwcEp8BnjV08Occp4nWz8Zi+ocSdsY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OHUezPzBG+j0/hSxEL3mqpN0okT3SJ9BL3N9XVpxramUlQBrwntgLnLcCLJ3B5xhj
	 gMvs7Zk1iNNxV0DBcznDykH5WqUtY89IMmvw0g1lKNOg3VLuGTDIqHx3P5Op7we2VI
	 qHASKd3q7vxYpvzAkoDgfV0lgcSbi5c7Zrl28N6hTqAXDGbcM697WPeiODyPUF9uhS
	 2EwNaKxq4SgtzfPewl0zY/Zxh1x4KsRAwnm8QEsBJVu6mVXiXce+vNRqTR5WGmU5TC
	 BbyfTA6V/ztLH1Dwy6zech80m3vEmcGfKMxVwD9Uhj68EAKAi6YM2JrPyBtI+gcT0G
	 zb/9sej1t3IxQ==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79868eae536so88825357b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 15:40:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6FaE9BgIKtGTzz2gv0ZCyg5qhWjw2xb6oNuk43lDvpRrsG4pKLB2gk61bsPGa00F4FNmaTwDRIknu@vger.kernel.org
X-Gm-Message-State: AOJu0YwvTE5lTwjHO3tkj4RRg1ZC94tzQKt6A7vPvwcapF9hbKk6jzvg
	9D1NTOXCxYdTFmt6DnZS40lFBKiimsEV7ijr2qcMabdTQ0N5LZ8C74GUrelmOzS1iFncHOjolc3
	Zrs4a+f3L6t5bKU01OvXHMlHDFJwOJis=
X-Received: by 2002:a05:690c:6201:b0:794:9d24:76b0 with SMTP id
 00721157ae682-798dd774941mr1327417b3.54.1772754028299; Thu, 05 Mar 2026
 15:40:28 -0800 (PST)
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
 <20260305161019.09b67af2@erd003.prtnl>
In-Reply-To: <20260305161019.09b67af2@erd003.prtnl>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Mar 2026 00:40:16 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Gaaq0_20wDjjPkYwpyL6HWx7bmKqBmy_tieYu4scB6Q@mail.gmail.com>
X-Gm-Features: AaiRm53ImxVNtY4WeeRKRMTl05H_o8Tu0rFl0zRGdyjHzHfME3y6wZnmaSU5GLU
Message-ID: <CAD++jL=Gaaq0_20wDjjPkYwpyL6HWx7bmKqBmy_tieYu4scB6Q@mail.gmail.com>
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
X-Rspamd-Queue-Id: 18CF7219684
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32616-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,protonic.nl:email]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 4:10=E2=80=AFPM David Jander <david@protonic.nl> wro=
te:

> I am tempted to think that hardware developers that use this chip might e=
xpect
> the GPIO driver to report the state as it is read from the register. But =
I
> suspect that the Linux kernel GPIO framework might enforce strictly the
> logical state to be equal to the voltage at the pin (i.e. logic 0 =3D=3D =
zero volt,
> and logic 1 =3D=3D positive non-zero voltage), but is this true?

GPIO assumes all values are expressing the (raw) voltage on the pin
clamped to [0,1] logic level.

It can further invert the meaning of this using GPIO_ACTIVE_LOW,
ACTIVE LOW means the same as  "overstrike"  or #VAL in schematic
so if a signal is active low and low voltage on the board it is
presented as active (1) to the consumers in the kernel or
userspace.

If it represents anything else than the raw logic voltage on the line,
the semantics of GPIO_ACTIVE_LOW would be completely
confusing.

To represent switch states, I think using drivers or userspace code
should interpret this.

You can also add a custom debugfs file to your driver to help
users by providing the actual switch state and more.

Yours,
Linus Walleij

