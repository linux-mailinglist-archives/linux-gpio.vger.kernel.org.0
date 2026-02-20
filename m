Return-Path: <linux-gpio+bounces-31939-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIb8DD8dmGnp/wIAu9opvQ
	(envelope-from <linux-gpio+bounces-31939-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:37:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8286A165BA1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B0883009CFF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B393164C7;
	Fri, 20 Feb 2026 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkKbkDfg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576A2C0F8E
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771576527; cv=none; b=tnLe7SvPB5EeJ6NczGzEO2qS86ukFay9YT7Blb+rtiMZt7G66VR56awDhU8jM+ISfqAaJLpF1TthIKesRnXvAU0GMZv/TvjW52SEUOWAmI1vnmn3YoKdjLh2xLVSzVSSO3ZPHVV7L5WYq6xAa3mICSxAWMMEYDnkX+1XI5nPR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771576527; c=relaxed/simple;
	bh=F+gihPeU83HHKc9wwG/R06SPNq+qpdQYay6QFni9La8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIud2wiIpNYisiYMhz/5nfTAvkUrBNA5Oxow/CF/HBG+HBVVLfPsYth6RNTwAI0HJqmObWtsPwD2jtR9fJ1jke+icJUphPmP5RwP//y5hWLWIxCkp1qJvec7w4oIUx57O3ojvKs4zyMp3JRr49SuVDH13+2FZffDOOs2ZmjgUd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkKbkDfg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6663FC116C6
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771576527;
	bh=F+gihPeU83HHKc9wwG/R06SPNq+qpdQYay6QFni9La8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kkKbkDfg7LY//5OJYaZSkleXjUoMu+RW220pDHkKbZlN55Oj2bXtFt5R8X1w0sIna
	 cymy+L/AwtBZBpsdwrNRR8IvMkxtuOE2NqQntsJ/BMm6clJSCJtkdi7LegkH0sNM5x
	 K00CBQOBaGve/qYdj3HmoeIHdbVUmr9ZhwUCKkC7B7u5cOnBGgI2G46buQRTkKETo2
	 AfihroHsJWV2Km/EI9lV4T+LeaLXaPHHDdH+Qb7s/2CAaoWO8FefzaFqvZtSLqEf4U
	 8x6fQSTQWEdWGcfjmJTdB2sSzX7hUid9P0n2igAbrQOgPHx3hnJD372eHrnJgY/MrN
	 kPB/OMgwSejyg==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad019bb5eso1651336d50.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 00:35:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpOqr82v85HTut5tiomarEn+z0Ir7K6jjC+UozTd6bxbTgGq40FuExnmqI/d5PKcmuAd+FC8JtekKo@vger.kernel.org
X-Gm-Message-State: AOJu0YwnyuUpCp+Cp0FLbYSehomBI8XN/Ke0zb+4+/BAlBpg+EETiZxF
	eY8gYK3tAk/QZaYxHhbJPrxICZ8QjC93+ut9BR0uI/eol3mIN/k4rWDKS4byUQfvqPfvzTJDOLx
	K2tm7bSWdOxFVFjUq3ZhFX8FiplFk6qo=
X-Received: by 2002:a05:690e:dcd:b0:649:c36a:a9c1 with SMTP id
 956f58d0204a3-64c70df7277mr663978d50.69.1771576526565; Fri, 20 Feb 2026
 00:35:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org> <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
 <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
 <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org> <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
 <20260212195423.GA787785-robh@kernel.org> <CADvTj4rPq8D5piqEijCdAjkWmZtq3Bi_Kxv-4F0aU4xi_O5WKg@mail.gmail.com>
 <CAL_Jsq+Fb0vOggHWkNGusCBcwTQubD1Lc+0=U4+MpZacXqc_ag@mail.gmail.com>
 <CAD++jLn9KJ2sfMtAxVGbcmWQW=1vxdiMNCDLNg-XV3hJDz=O9w@mail.gmail.com> <20260220091727.5330accd@bootlin.com>
In-Reply-To: <20260220091727.5330accd@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 09:35:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLmwAb35RW1fh3ONc-R4ca_NeWPWhWag-c-xv0oACNAG9Q@mail.gmail.com>
X-Gm-Features: AaiRm519WEZgCW7-36GlJV-kjwOVV9yATQgCHNaAzNCaP2lafv6imRtDymdCIqI
Message-ID: <CAD++jLmwAb35RW1fh3ONc-R4ca_NeWPWhWag-c-xv0oACNAG9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, James Hilliard <james.hilliard1@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31939-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,glider.be,ew.tq-group.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 8286A165BA1
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 9:17=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:

> With nexus, you cannot translate &spi0.
>
> Also nexus works well when an index is involved. In other word, it works
> well with phandle with args.
>
> i2c-bus =3D <&i2c0>;
>
> In this kind of of definition, no index are present. With nexus node, thi=
s
> looks like
>
> i2c-bus =3D <&nexus>;
>
> How to handle multiple i2c busses with nexus node?

Can't you just use the foo-n suffix trick from the pinctrl etc?

my_nexus: nexus {
   gpio-map =3D <...>;
   interrupt-map =3D <...>;
   nexus_i2c0: i2c-bus-0 =3D <&i2c4>;
   nexus_i2c1: i2c-bus-1 =3D <&i2c6>;
   nexus_i2c2: i2c-bus-3 =3D <&i2c8>;
};

&nexus_i2c1 {
     sensor@4c {
          ....
     };
};

Maybe it's not as elegant but I think it could work?

Yours,
Linus Walleij

