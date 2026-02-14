Return-Path: <linux-gpio+bounces-31688-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH0YABjfkGkqdgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31688-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 21:46:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A3413D2D8
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 21:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C44023022628
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 20:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283CA30DD30;
	Sat, 14 Feb 2026 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTJ1q29y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65201A2389
	for <linux-gpio@vger.kernel.org>; Sat, 14 Feb 2026 20:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771101960; cv=pass; b=H7w+stzZP+33iOStPGEgR0lgfevrQcIzLhLUxkz2/Cc0EfbZzDrPtDQwJg+v70953NdbrHcegmsmMQ+k6xb0L2bsrxzunBQgRlrvGfELTYhTUdTgoMenIcMdEZTc66YrTquAuIGu+jVVSrFRptp8rc79rLZlL64MfsNH/1UxGNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771101960; c=relaxed/simple;
	bh=lBiVTrGMk0ZRN1QGaTkrqE8XbpfvB6ZZVFA/5Yy0G/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQsFH4Y/JS/3XTG3SvAoLJWVCzMqCxf+ZaoRBg6h8MQyUr3II6OVvf1ma5LbrrJD409n+0bwPVm12THhiu3y5rgHJojOdXBaKuGhjqfI95W7h+goZ5w93hdCfEfMFhgcI/OT4QmwqVwURLx/Zta1Eedj7y5dfsxTiyTbueLYME4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTJ1q29y; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94aca174532so608331241.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Feb 2026 12:45:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771101958; cv=none;
        d=google.com; s=arc-20240605;
        b=Tc9cAEcp6BY0rOfFCl9ka4Gb53Q6kE2J864TfWXf3XQBSPOoDYye5zpAWgruskb4lu
         R/e3SnGv93raF3Kb5MEAWwscdCdBbnABwCfnCSPwbnRak0YnUBOPF/L+6GDJAJjJQckS
         mWDx+C6zS9Mh3SG/oFY1MjIirZ09M13m0zxsDKaIDANcVoFIep0zserjC7M3kmfJpPNJ
         tAqMYl1jylh02OVlaQsVrBtRcs+X05I5mqC8gLnCDeGP4cPGflYjGIJSqNuGKPkxbYq3
         fc0Q9UwM/pWW55i9JMxB/PvxSw8zyBDXJZh8aVciqQPw6JhgcBqDhOgtMhO9p4u6kJua
         Ss0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yV+zPkSeaVocPQ09zuAThwGqA+dNxR9ezr6Dwi1Sij4=;
        fh=dGero6o2rFWLLrgP1i9Ywomgs9VdCzCQIuw9j5HTMV8=;
        b=QvH+rLC9NX3jKiYq0E/uj1Oz6Y5MwtJCUNZwdaz9afaCJtmf7oePmBJISZ3PfALqI5
         sNwJ9Vx5FFKlTYcaDRyIEO0dYACHDl5G+20P18Od4rs38aPhpS1cFUN+x8/lkXYK9G9R
         cJbwJI166XLVMke3sAQ+aiH6ODOOblsyVta+0Nk9AAFe0hfPZmzmMv4wBdng9195AkKj
         LHiOR9c8d1APvuIh9pXU9WR6zVVvfc+zzx2v2qiBPWOjZ4a83KmErO0weJrvcPD+Uet5
         NVzKV+lcfPsCYYqi5Dbck3GcCp8sVm9hAAUEqLVAg8paUeJ6Pa8cPimE7wMn6oaHgd7Y
         yMpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771101958; x=1771706758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV+zPkSeaVocPQ09zuAThwGqA+dNxR9ezr6Dwi1Sij4=;
        b=ZTJ1q29yXHfsb0E33GB8wHbNe1Jwf0/gR75+dxl1xPeH9pvsJuO66zgRlbgq3UAN7i
         56Zt6sweDD+tp+3NtyDKFPLcYM6E3fdyiU4GmmFVJ8bXB3FUEf+RX5MVUg8Sn1Sw3L9K
         4w3CYBJ3jUVhDT+u7m9SFfwhcBLDkV4vGvtZmk01CuIYTK8zh69MpvJO+iMvJucxUB8C
         +T3UQykinuSvBoXm+5i+egdUiwNdAR2b7p8hrwPDj63eotKlKXpHPAtHR9wCRTMyifyZ
         4L7hbHbwgNvZ/137NPkkSxE4GFOtIvIpvLTl9SBtFE8CroyMKder46HsNbRC8vZZCMWn
         g5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771101958; x=1771706758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yV+zPkSeaVocPQ09zuAThwGqA+dNxR9ezr6Dwi1Sij4=;
        b=E2Phxnali9JnoSQ4JmdYxCq4VyHsp0WCMtobGGZA1vcGxAmH5gCAUPjWD57brLEV6I
         kwT7a68P3AAvOG5tQGCpyXix9H1J1mujlL+hK8oiigAJ0Fw3UFlldtV3Uwa2Wp4VZyzt
         KD2ZuXIQdhY+dIXS8W5tb25rZXYOPLoI29r5xVAaDgOLYFPOA0M9D58pbk2xyFl6aKhd
         kP1vG2NOjyg5ArD42lWW5gALLBw64nNfoKCVKKlXecFR9YkuIA54dMA0OMDEH7cIxW/+
         iXl7mXtF0blaZqBd8r1p4E2wVahovJUzzzb4NEqpmDaXPc/V2LXCoJQpkhsGkxI/OKRz
         9Glw==
X-Gm-Message-State: AOJu0YwqfjnKA8DiggxeDJ+eBsBtN2t0ZaWgwNFE2QoTTqrSEHrsIFMe
	34snS/Oc5UlTPqhNyMBQdtxVEU7IUPqUt+p+zwJ/iqKJ5vv4dsK+nn1PYFoPe9GbI/Qr7eSe1/u
	yHsKjYQGE09UU9qQQMtT2KyNReY3W5U8Lw4eq
X-Gm-Gg: AZuq6aJT7kS09oPemyVNCngO3cIxUH/Phb0DpzIc3KWLcOjPnz1uY4LLpilwYtmnZq7
	F/TP/7xS9gqRIEcM9NMbU1HeKpoSG/Ae9jVdKD1UbVu4ZaBX6U3JOJIh3CbweXzJ4Ddw5vb/yQe
	txuGakV5JaVGgyRuNUZdQymlTF+rm47bDaaIE113tgwaJulUTlGAhrBReKcUUdoK4Dk/o02FZeP
	NpLIHqTSmGPjavUJK5GNr0jFwlL0o/Py/qkvoZ2BK31hg10x3Ibw0OV18cwP4S7/rixRXGiiTjz
	N2fYVOF/MURqLOqvxMCcX62XyPLgiJ/ewXrpcw9ZHV03XbxRbUvbUkJghMfBJT1KkWtvQYfl44a
	n8ro=
X-Received: by 2002:a05:6102:3a0d:b0:5de:8933:9d0f with SMTP id
 ada2fe7eead31-5fe2ad158f4mr1010874137.9.1771101957638; Sat, 14 Feb 2026
 12:45:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213223204.2415507-1-james.hilliard1@gmail.com>
 <20260213223204.2415507-2-james.hilliard1@gmail.com> <20260214-loose-slug-of-courtesy-bd846f@quoll>
In-Reply-To: <20260214-loose-slug-of-courtesy-bd846f@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 14 Feb 2026 13:45:46 -0700
X-Gm-Features: AaiRm50UUqg9PWfw6RMtRkweCJKAyzBDfGlTXP7m2YMg6eWpBDv35RTtSfI5pkE
Message-ID: <CADvTj4pRE1LHfPnVbWLpd-AedCgCNWPDjcP=oLHyT=muH4r6=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: document gpio-line usage
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31688-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 55A3413D2D8
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 2:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Feb 13, 2026 at 03:32:02PM -0700, James Hilliard wrote:
> > Document gpio-line child nodes for GPIO controller initialization
> > without line hogging.
> >
> > Describe gpio-line-name semantics for both gpio-line nodes and gpio-hog
> > nodes, and update examples accordingly.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/gpio/gpio.txt         | 47 ++++++++++++++-----
> >  1 file changed, 34 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Document=
ation/devicetree/bindings/gpio/gpio.txt
> > index b37dbb1edc62..cf591954eafd 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> > @@ -199,28 +199,41 @@ gpio-controller@00000000 {
> >               "poweroff", "reset";
> >  }
> >
> > -The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mech=
anism
> > -providing automatic GPIO request and configuration as part of the
> > -gpio-controller's driver probe function.
> > +The GPIO chip may contain child nodes used for line setup at probe tim=
e:
> > +- gpio-hog: reserves the GPIO line as a hog and configures it.
> > +- gpio-line: configures the GPIO line without reserving it as a hog.
>
> New properties do not go to TXT bindings, so if you want to introduce
> gpio-line, you need to send a patch or pull request to dtschema.

Like this?:
https://github.com/devicetree-org/dt-schema/pull/185

So this would just need a dtschema change and no documentation
changes in the actual kernel tree?

>
> Otherwise how do you validate your DTS? How does it pass validation?
>
> Please don't send a code which fails - either on upstream or downstream
> DTS.
>
> Best regards,
> Krzysztof
>

