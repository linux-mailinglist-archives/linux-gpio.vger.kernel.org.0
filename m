Return-Path: <linux-gpio+bounces-31678-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOvGKMKtj2lsSgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31678-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 00:03:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF7139E78
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 00:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B871303D2D2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 23:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0603161A3;
	Fri, 13 Feb 2026 23:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVVtRsbv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CFD30FC33
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 23:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771023805; cv=pass; b=njxwPL6Aq4Q8yHq7rQU+Sv+bBxMDVrVixVz9O+GrbVfvV/Its3PtEWiytjoKtvG8LMbHB2fFsPuuffq4B512RK0DO1t0rzrE0Zu23pwIfAOqI4WsNiGVJ/p+ou9SDjxbWspMKIpAEQPulK+fpE3qTeorLvjRtyEDyBxEVEzxlIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771023805; c=relaxed/simple;
	bh=nsLWbhocujPIby+Y77/y5XU2lpZLkqkJeeuvXXYu/EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWtRoem5+qazGU0JhxeZv1MyFuexVjF/5XA3dIo2Lk64P7UUyWs1oKkIT/HtIwmuW1f/oqtOSVGBUqUh/hIZzsOajKyAR41B0nl5HgLPuEcsBVwL2hHOg6k8SNAWJK4Dck5s4w451vmngBG2/BeVbwbOdFCYbN/ieAD2n31nH7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVVtRsbv; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-948d0d5d4d0so819383241.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 15:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771023802; cv=none;
        d=google.com; s=arc-20240605;
        b=WUuj+Rw0RRsfnejpD28MCCr/y8gQgo6MjnDXsprhcxfe4NE6dwemr6vaYMPY0O0eb4
         182LExRGCJWkW8NhdhXfpUOIAnfl7c+wDB5AoaNKVabmEnUNKRvYOJT3n4Z/EHHq0DNO
         RqV/m59gCsZ4qxE6PGMsRR2R11QyWBt7jR5DG2Z4b0nUUgUfB5gCyAKSD2gAQ89uPc/M
         MKU+xLvlrJe8FP4lrI0BPpi6QmnG89WhlPREJhbAaG8nim7odLUQ9WCn5Sz1YvLrYR+t
         uDY0zHiiUFuyhLslEb9E1WR1tP/kDWmjoudxcNxsCOcVJk5wOc39UuwAPzPOJdDcv8bR
         VNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nsLWbhocujPIby+Y77/y5XU2lpZLkqkJeeuvXXYu/EI=;
        fh=t0EwQzqhWeZ0k4VHznkGFKzWzMdDQDX8fTn60Q+tQ/8=;
        b=AS4oSPjDAH/i/tgMOg0zSPA9R1i2uYKpARRetfv5CFgD64n+8PwOD9n/22ei6dQIMF
         G+f/0GrFC1mzVinp+GnqtD1Jqz6im0rJ+Rh4s+zS3NBrEZZQYf87RJEeqGjHnFYrE67o
         bK5BTlIDZtr/vByhsqZU12pxPvXG061En821Eoy6LuGu+TMWFFcgR2NiwKpmtl26U5f6
         ddZwbFy1ZOpAfvbLXzfbjLnrTRfUSyANKmokf/GHE5KqDw8Ti1ce0mNPK/HuVjGrlpd5
         ugk1ItARPVChUPQZ4aEYJw8VCkvE/5O0colJWC4Gtsn/5L7OcChiOOExki5uUsNYyvMk
         m03w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771023802; x=1771628602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsLWbhocujPIby+Y77/y5XU2lpZLkqkJeeuvXXYu/EI=;
        b=bVVtRsbvl0n531PgO0c+7APddH8EGHKMhaQ6q/uZBqpoEooWd88payGu11UZDJ4rwt
         mrlSWeJRsK9p8/n52JFTc8+XMgUIWY9mSKYrRsL2QFh82irPU3R5dDePVb1p5O7zu2DT
         BAdGxrPuQjg+GWVX53cqf2umds2DkoKCdnecXOmXbHFmX4H0zuCJrOM3lvLNUrnaLyuL
         5zkII4mFbkD6XV+oQXdaAiDJOaGe3mlbjIwcW6ZyqrxeOtphBka7LvBUISQaq6Wi6fvD
         zOkI8TIEHf40FDL65tWhiWWxBPFJP6kJ9ghaw6TIhSI7dEzhspRe2lHRMSi5YG2JWGtt
         xF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771023802; x=1771628602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nsLWbhocujPIby+Y77/y5XU2lpZLkqkJeeuvXXYu/EI=;
        b=tDAHMsDO49JXVuAvRaYix5QlTL+663QU9wNnc6vP/ALcdagyI59Y0C0ZzxVwkwEZqV
         kgRTcab/CY9U4dzge75Iqy76vb+p7heUoncurpOjdpsjujIEet8PxdRoNOPU/nuL4oHT
         cNpWbTbdEphveDQC/vtfPxQVtEX+7xqr9rQHw/nQKYMt9XxG+9PGlKoJZldCaBtUGGsN
         oDcSPGemuqaqLSgXZbTWWd3wHtGi3uv33SinivBFNI4DTxlSdZZXNRqfDCVOLaiQt0DA
         Quc/bE7Zpi7H37aITdF90STtUT2BupeDiYT7Nntru049NZc5hbUicIrExwzCuJf12EyU
         CBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOIjnbeQDXHzZ84/dV7aCWrAiCnJPNYvDUaIJn6lROScq4VNYbArgccqw2GF6z6OtHrSF/zIsp7Swk@vger.kernel.org
X-Gm-Message-State: AOJu0YzOj0g/aah7FUwtC3WfFHocCCAwVWKpGgJ5/nQZYPnZKEbwag0I
	pnTsKGQ+//KGQSSeli21jf0zH82N7oNlOHGFY+HTdDkViZRnfFXuPKyMX9y1GpPngyoSC+MtUHa
	9AQSVaj7v4gFqNCwxiMIUgpuRztgp/GB5+pGz
X-Gm-Gg: AZuq6aIV03Q5+ZMdkfEpgH5sDSObC87btXWr1RS/DSp+7UKiic2O921ujmcc2utOMYj
	VOZYnzUjyS111M7CXPXfmNEJ8+l0xCddDAM6aLqyL5n6a3lBTH8J5nwc9xUSD7Ij47RPWOye36e
	T23khbHm7NM6jLc7/MHYOR3XhruS7aBiUbymTFSZjLXzyyHojqKs6teUDL+FqvAGZBaeRiYqCGu
	Zj7oeX+UNdmHAToZUljUK7RJCopD+lYFjUnftgFD8Xrl7s3dp8bG72Mt8yIrbnkE0xYwIbceaMo
	rIiTSCRLCTWuut7kOy0FmpBOCryXJXOfTy6KTd1hA4fJ/YnhQaQWDBUaQL5eYOkep3Es
X-Received: by 2002:a05:6102:374b:b0:5ef:a8da:8b26 with SMTP id
 ada2fe7eead31-5fe1ae12ff4mr1443575137.27.1771023802482; Fri, 13 Feb 2026
 15:03:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com> <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
 <34a9b531-4f53-47ee-861e-1b18ff1a5752@kernel.org> <CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
 <20260211214708.GA3947691-robh@kernel.org> <CADvTj4p-zHMrXW+GJstB2sKS-7Wij98JNJGoiPiYmaP5RHhNQg@mail.gmail.com>
 <9afa52c1-b7de-4ccb-9114-a142567d21af@kernel.org> <CADvTj4pmAXo+KUMyB0=+x3HRdUdUq=baj_pnoa44oxnugZuTOg@mail.gmail.com>
 <89c0dd51-fdd5-4368-b5f5-615143ffd166@kernel.org> <20260213092914.79790cb9@bootlin.com>
 <0c6c8063-3c8e-49ad-a5cf-f751b3d9f2f5@kernel.org>
In-Reply-To: <0c6c8063-3c8e-49ad-a5cf-f751b3d9f2f5@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Feb 2026 16:03:11 -0700
X-Gm-Features: AaiRm51rMgFwshRgUDgbJwxkHp3aOfS5zWeVg5SiHcTx9ptmCGCq4_T0-0zgTLo
Message-ID: <CADvTj4qSJEfCTAPHYB0jVc2LPN8cTjSGt1FASoV_+RSDZtsnUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31678-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 09DF7139E78
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 1:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 13/02/2026 09:29, Herve Codina wrote:
> > Hi all,
> >
> > On Fri, 13 Feb 2026 08:31:21 +0100
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> >>>
> >>> Or is the issue just with the name of the compatible I used being
> >>> called "gpio-aggregator"?
> >>
> >> No, the issue is that there is no hardware you are trying represent in=
 DTS.
> >
> > Except if you have a piece of hardware that invert the gpio line.
> >
> > In that case you need to set GPIO_ACTIVE_LOW somewhere.
> >
> > The aggregator allows to describe this line inverter.
>
> Of course. And then you could touch that piece of hardware and use it as
> an argument here, where I asked show me the piece of hardware being
> described.
>
> Anyway, we encode the inverters in the final GPIO flags.
>
> >
> > Of course, if the gpio is connected to a hardware component handled by =
the
> > kernel, the DT node describing this hardware can set the flag.
> >
> > The issue is for GPIOs that are just GPIOs and should by a user-space
> > application as GPIOs.
> >
> > Some bindings exist for GPIO and do not describe the hardware but the
> > feature. For instance:
> > https://elixir.bootlin.com/linux/v6.18/source/Documentation/devicetree/=
bindings/trigger-source/gpio-trigger.yaml
> > https://elixir.bootlin.com/linux/v6.18/source/Documentation/devicetree/=
bindings/power/reset/gpio-poweroff.yaml
> > https://elixir.bootlin.com/linux/v6.18/source/Documentation/devicetree/=
bindings/power/reset/gpio-restart.yaml
> >
> > Can we consider the gpio-aggregator describing the wires that should be
> > grouped together.
>
> No, because the grouping depends on user-space choice (as explained by
> the author).

More like the grouping would be used to better represent the actual
physical connectors to userspace. I'm not really sure why this would
be so much a user-space choice as the grouping would be aligned
with the physical hardware connections still.

>
> >
> > Industrial board can have some GPIOs grouped together and used as input=
s or
> > ouputs of this industrial board.
> >
> > As output they command an external system. As input, they get feedback =
from
> > this system.
> >
> > gpio-aggregator describes those lines.
> >
> > In that sense, it describes hardware.
> > Maybe the "gpio-aggregator" name doesn't reflect that and a compatible =
such as
> > "gpio-equipment" could make sense.
>
> What is a "GPIO grouped together"? The moment such grouping does not
> depend on hardware characteristics, it's the moment it is purely
> arbitrary choice thus not suitable for DT.

The groupings would be things like the physical ribbon cable connectors
the peripheral boards plug into for my case. So it would still depend on
the hardware characteristics(i.e. the line to ribbon cable connector routin=
g
and such for the control card subvariant).

I came up with another approach(which could also be used in
combination with an aggregator approach or independently) to better
describe and configure the GPIO lines for use by userspace as well:
https://lore.kernel.org/linux-gpio/20260213223204.2415507-1-james.hilliard1=
@gmail.com/

> Comparison to gpio-restart where you have actual component, receiving a
> fixed line and then doing restart is not appropriate.
>
>
> Best regards,
> Krzysztof

