Return-Path: <linux-gpio+bounces-38767-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id njPiD2l/OGqccwcAu9opvQ
	(envelope-from <linux-gpio+bounces-38767-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 02:18:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B13606ABDA1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 02:18:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JqJUN17D;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38767-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38767-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1377130041D4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 00:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885751F099C;
	Mon, 22 Jun 2026 00:18:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E0F40D59E
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 00:18:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782087523; cv=none; b=MeZmr7l9l/w9+HnKm9+CmFS48tQ5jcCBteI8SjpClAHYtTgwUEOKYTk4b2fkJipTdkNwA9x4HdPDumQIPOv+d3WISTg/Yk2ox2/P0T3dFJmGjj7gx1vmAtNhlCeo2DDiJABGDTBq6uNlcMExG0EfF/QbB7J5ApeUsno2d0LuE6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782087523; c=relaxed/simple;
	bh=xCh2X6pjSEYFkzPWQKbcIxYIAG0zxBZt+ck9vKJzwM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iW9tN4yK+z2jsZIovDRePc3JQ59iC+uGpAD8gaHpaW5WdAYP+cS82+8InR8Ecc5/PAA2XSRjjb2mWzlzzrut2BIQkiIMoPYlUsO131Hd+2a9n0lsjHyq9bvU51cebBqA9P6FwOBCXNid0rX2QbP8Pa5PyBH/2dTtg4YyemdgHUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqJUN17D; arc=none smtp.client-ip=209.85.221.175
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59b6227df10so2858474e0c.0
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 17:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782087521; x=1782692321; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A93qYdMCJP1GrlM8oz/97lx9wA1Tl5BbdYs1SqoV3fY=;
        b=JqJUN17DMQRLJ3K9pGULPawFgjkCluxO0hho3GmYgyzUps1Ii5FKEqmb2dDZxp+g6R
         4Vq8bI4RLSw/Og00snhoECmGddJhGR48Q4nFj75guIk4+HOvlKqgGu8QuWXE+zKPvhoo
         1sE1GsHzA1BDg4yhuTBF7HM7ogJrHR6wOGj0gyynn5+engilFVx215jby4uocjoK1TyT
         dksUZusdDVBkEwsZa2T+v0dWAgX5Gn0/zvGbXa0ECyPvkRsEJpNktAyMTPJlH3WxkAcK
         Zx0w5sl5QHO0XALVq/r4rJKEThCt+eFaC/TQzQ8Zm0Sen6W2Z0BWJgdDQOvGcZ1552QV
         Wxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782087521; x=1782692321;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A93qYdMCJP1GrlM8oz/97lx9wA1Tl5BbdYs1SqoV3fY=;
        b=QJGRSkf55ovQ9iEANyKdFPPgkFJCYtT6wBY3R6i6FJNwsDb/hcpQjsynOw9m4L+0UN
         6/G2GMIrOH1bKZwKJbmTX3+GsTJ7XC9yhNLicCqqA8QOyrxIqIQHF37ouqM6HzJu9FK/
         actKai3kr3weL4qNJ6k8/2xWAc4cn66COJYXFHwS78l/CCdeCGvzSENvjaQj9WUtFnHD
         o8mWGR/YykAK3Oqao+yuR3qmQHAwgA2HTzQoif6/LU0ezMR9iNc1b81I3DC+Co6avH1p
         qRMc4lfHTiP5tUtyZxIkqfoAADBCYj90BGZ7os/oC4qPfj3pAHaqfh+Ly/38noF9C27n
         8tJw==
X-Forwarded-Encrypted: i=1; AFNElJ98dkvFFzv3zsWCIiMHomOE/70GNI3tG+eh/1YHqFjS8h+Kr/ONj1yERjCCGzNMHzlZ13qH1bdl6aRz@vger.kernel.org
X-Gm-Message-State: AOJu0YzDfQSxB3+fyisNSz1d2w2EpxY3SIDupqgx13EMyP+C0dgPOwiT
	KcbYqxXaQqeSc+5KOvKmvVl91YEdpCndW0lipNWq02ds/YPv6Uk8whwC
X-Gm-Gg: AfdE7clMLH3pGfx5OZjS+KpeUknNrEc0lcbiQ4V8MqsF9puvzbEMiOdt0iQR8AkGSgp
	IclKVE8ZX5YX+tBuptXPoNyoa8R4Am4dS2jdLhNVyBSTfNUQWLZM/iX6mqxmBgZ8vbBoUD6hbI+
	5gzD+nxikn3VPELbmYSE+7o4DmNAkdv952ehZo9SMDMGolxS5Sq6doj0iRMOnMfBdGDYOS+/MTJ
	4BxbhxqtLQ7TaKSVKyY0Zdv1OuR6SohgNw8VFy6tEAa/PQ9SYgzp07eeGnjsRYFfz1pY5/H3IgW
	OYdxthDOwYx0GE1p+9/Pxhe8KSphHqwTBiqwCYOf7A1DmH0fuaoF9Ujukdfk0FU5zA1JHrWWgV9
	GhNDndS0nsViR0rQQ8t7upPUqF4KSJFqu6+6aXFahntULtMN0RdoyX/H2avifaaEgtaMjG7O1/C
	e5/AE=
X-Received: by 2002:a05:6122:3a0c:b0:577:51e4:ef20 with SMTP id 71dfb90a1353d-5bbebb85e52mr5302022e0c.10.1782087521178;
        Sun, 21 Jun 2026 17:18:41 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb7d309asm5740788e0c.1.2026.06.21.17.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 17:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Jun 2026 19:18:33 -0500
Message-Id: <DJF5ATR2RPDJ.3LSN8DY58E6RO@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
 <20260613-sparkling-naughty-tuna-3e9bf1@quoll>
 <DJ92M0ZMSI2C.2I39LHFRNQS7W@gmail.com>
 <a994993e-7459-48a2-a8d7-823c1b0c9545@kernel.org>
 <20260621153318.4a723e3b@jic23-huawei>
In-Reply-To: <20260621153318.4a723e3b@jic23-huawei>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38767-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kuurtb@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:jic23@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,analog.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B13606ABDA1

On Sun Jun 21, 2026 at 9:33 AM -05, Jonathan Cameron wrote:
> On Mon, 15 Jun 2026 06:30:28 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
>> On 14/06/2026 22:56, Kurt Borja wrote:
>> > On Sat Jun 13, 2026 at 1:59 PM -05, Krzysztof Kozlowski wrote:
>> >=20
>> > [...]
>> >  =20
>> >> Functions used by probe() should be before probe(), not somewhere in =
the
>> >> middle of the code. IOW, entire probe is together. =20
>> >=20
>> > I they all are, it's just that regmap stuff takes a huge chunk. I'll
>> > check how to reorganize.
>> >=20
>> > [...]
>> >  =20
>> >>> +static const struct of_device_id ads1262_of_match[] =3D {
>> >>> +	{ .compatible =3D "ti,ads1262" },
>> >>> +	{ .compatible =3D "ti,ads1263" }, =20
>> >>
>> >> So devices are fully compatible? Then it should be expressed in the
>> >> binding and drop one entry here. =20
>> >=20
>> > Not fully compatible as Jonathan said. One is a subset of the other. =
=20
>>=20
>> This is THE meaning of compatible!
>
> This one I'm in agreement with. It is a strict subset, so should be
> using a fallback.  If the fallback is used, you just get support of the
> stuff in the simpler chip (or if you can override it with a chip ID
> you might still 'upgrade' to the more complex driver support).
> If you do end up with properties that only apply to 'new' parts of
> the more complex chip then they should be verified as part of the
> binding (assuming you can do that without the verifier complaining
> - I haven't checked!)

In v1 I had the "adc" subnode which was specific to ADS1263. Then I
agreed to drop the subnode but I'm having second thoughts...

If we dropped it, then we would still have some specific stuff.
#io-channel-cells would be "const: 2" in ADS1263 chips. Also ADS1263's
channels would have an extra ti,vref-adc2 prop, for ADC2 voltage
reference selection. I should maybe also add a vref-adc2-supply.

Maybe it's better to keep the subnode or, again, go for something like:

    spi {
        multi-adc@0 {
            adc@0 {
                ...
                vref-suppy =3D <&adc1-vref>;

                channel@0 {
                    ...
                    reference-source =3D <ADS1262_VREF_AIN0_AIN1>;
                };
            };
            adc@1 {
                ...
                vref-suppy =3D <&adc2-vref>;

                channel@0 {
                    ...
                    reference-source =3D <ADS1262_VREF_AIN2_AIN3>;
                };
            };
        };
    };

In this case we would have to kinda duplicate channel description, but I
don't think it's that bad.

Jonathan, Krzysztof, David, thoughts?

IMO the ADC2 specific voltage reference stuff is a strong argument for a
subnode or the above solution.

>
> The SLF3F discussion is about (to me) less obvious case of not a strict
> subset, but rather being detectable parts with different channel related
> properties.  In that case the ID match is necessary for anything to work.
> Anyhow, that discussion is in a different thread and not really relevant
> here.
>
> Jonathan
>
>>=20
>>=20
>> Best regards,
>> Krzysztof

--=20
Thanks,
 ~ Kurt

