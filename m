Return-Path: <linux-gpio+bounces-31849-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPQCHb7UlmmVowIAu9opvQ
	(envelope-from <linux-gpio+bounces-31849-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:15:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2128815D416
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 979D930214D4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B702B31A56B;
	Thu, 19 Feb 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZ7ShCga"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E82741B5
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492536; cv=none; b=q1B4w+NpEm4s0YxmCNfqkPD6Wd7gTWKd+7WmUVdyv29UjoYF+vbhmg54GscrTzyDf4qMAQKzGV3ySXe1X+l0S8PaAVIVJr9qQ8vBQNIL4/1MjFap4K8ZCD/ZIGcA701kKGo6e3iLgKRy/SxgwGpDu+JYXb26SjLCZn9RSx8tWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492536; c=relaxed/simple;
	bh=Bpd6tIihUzdkRi86JKN+3GQEcve9CWjezs2ct/495Fs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBgLL5YrpSIR/gHC3CIo6hf5K0fu8bR6beKARbbRHdWthYjPOSvMAcPhOeS2j+Y2wKkG1hesO/tQUz0vDfGrpoWW3jfUIj4ZStUc6Q6XcFeOnOWbmjiuDwNoUOb6A56rmjAxlLEomgthOAlVvzuEdYe2EigzKQKugXB+QAexxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZ7ShCga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22062C4CEF7
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771492536;
	bh=Bpd6tIihUzdkRi86JKN+3GQEcve9CWjezs2ct/495Fs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=GZ7ShCgak8J7quucLCiMR64qmYCq8MY0VbYCivA0tfiDDVft3A5qzS7AZfOwKrXSp
	 TLUQ3LzaF2iUPzywyQ6JaQGswS6STEfJ+W5nVgVsTOk4UmDh4EZ1+thIHpY2kFydfn
	 VJ3hXEhnqU0RZxdZDau0+6E6zhc2UCNxO56hFY9/ROwOHgH7pOT0/uk3qeiSxpBtL4
	 IIVYDUEknelS/uAthj0ugLbEWaZFA7cuOJB06JAzjhUBzmHhup7/wR3H4gf1cqPKjr
	 5MsARzZh1cjf9Lusl1w16h3ZvaXxt3rfR5wVc268E15ebdPOtHgPx76sKPldlOAPzC
	 9FJ/H+HkR5NVQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59de2d1fc2cso701729e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 01:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsoJE5rJ/owuvYwnazPTuEGsIM1hiirPHzt4WElDJekvpcZil9UYh58Va0KhVPtyfv/wX+20BxlKRL@vger.kernel.org
X-Gm-Message-State: AOJu0YzVXjQD8rewvSjLDpxcis/CNOAjHhGcmuH2wH/q/PpT+FOUR+Ep
	CpeH8yXglke+EusYrXluoJHvvH/b+5j/G6Fy7xDr78+QXJCEmY0/f1MHH7R2JSb8+3ZICeIU3L/
	5FL41eHJD1NU37C11D9S06YfFPYR4KGz0hiVbK3uTkQ==
X-Received: by 2002:a05:6512:3d03:b0:59d:f474:6079 with SMTP id
 2adb3069b0e04-59f83bbfc74mr1572175e87.41.1771492534728; Thu, 19 Feb 2026
 01:15:34 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 04:15:33 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 04:15:33 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CADvTj4pfuV1s7VzS-cw+66N9HxijZ8x4Gr_jgTqPEqDvpz-hqg@mail.gmail.com>
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
 <CAL_JsqLEKr6G4qZe=vvJzP+KC_WWh0SHOjg14rxQvAvxV7wNUA@mail.gmail.com> <CADvTj4pfuV1s7VzS-cw+66N9HxijZ8x4Gr_jgTqPEqDvpz-hqg@mail.gmail.com>
Date: Thu, 19 Feb 2026 04:15:33 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfBt3ae2tdRKQT-AvjocN9OmC-jAtw0206rT3qGmSJDig@mail.gmail.com>
X-Gm-Features: AaiRm5005qHHG1NsqtTOn_DkOyj9ExAqkDSg5qGSlYSsak6scfj-wx3brJpHvwQ
Message-ID: <CAMRc=MfBt3ae2tdRKQT-AvjocN9OmC-jAtw0206rT3qGmSJDig@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31849-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2128815D416
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:56=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Well the gpio-line-name property for the individual lines is a way of
> describing what the GPIOs are connected to in a way that userspace

That is hardware description plain and simple.

> can understand, at least that's one of the motivations for this change
> along with setting up the initial line state. I would probably also add

That is not.

> gpio-line support to u-boot so that initial state is configured prior to
> the kernel taking over as well.
>

The problem here is that the state of a GPIO that's not requested is consid=
ered
"undefined" and controlled by the GPIO chip driver. The whole "initial stat=
e"
sounds very hacky. You would have a much better case if you instead worked =
on
a "default state". It seems Rob is not entirely against it. Neither am I. I=
t
would make sense to tell the GPIO driver: "if nobody's using it, do this".

To that end: we need DT bindings and I'd say: start with an RFC bindings pa=
tch
even without code, see where it gets us.

> Some of the GPIOs have kernel driver consumers and some have
> userspace consumers but it would be kinda nice to have a way to
> name them all without the limitations of the gpio-line-names which
> isn't really capable of operating on individual lines.

Please don't use a property called "gpio-line-name" to define a state of
a GPIO, it makes no sense. The line-name property of a GPIO hog is the
label we assign to the line when requesting it. There's no requesting here
so let's just not use any new line names. I'd go with something like:

gpio@1 {
	compatible =3D "foo,bar";
	reg =3D <0x1>;
	gpio-controller;
	#gpio-cells =3D <2>;

	gpio-line-names =3D "foo", "bar", "", "xyz";

	foo-gpio {
		default-state;
		gpios =3D <3 GPIO_ACTIVE_LOW>;
		output-high;
	};
};

Bartosz

