Return-Path: <linux-gpio+bounces-30452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB0D128AE
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 13:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98603305D9A5
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 12:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E8D3570AE;
	Mon, 12 Jan 2026 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="yOl3BrZN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D5130F547
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220686; cv=none; b=LpKM/2FGfdk/cm67cFGrO1WDlnkmVyV0mPuopIzpT7lQos312DszCiIU9XjN/z5RODS/tTXxIURapAgbgA1KsfPYxWeiPfbDv/9+Y3ftVuy9nacbPRMNXDV6uetkw6yCSBgM9e6Q5uV7eosG5vuHOFQtkQiULzM1dfUktFaLP38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220686; c=relaxed/simple;
	bh=e36I1KKUEK/sxZfTrjJ2xq32F1GQDKew287n3fswAvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gDHpIYVdc8T4zomsRy/xc7p7CNP4G3E6It9klMg1iSjAUgxqGW+ppuYu96VgBY12wcPLYjrne6Up2wQwKgBOLI1E7KBdqpA5MVoOoxx6+YAEEnc55YFS0mmnCiGcZTbVDc1AvKAzS2lqU4PieWR6B+y3jvOc81eHUdiHsjsSoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=yOl3BrZN; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso9955443a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 04:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768220683; x=1768825483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e36I1KKUEK/sxZfTrjJ2xq32F1GQDKew287n3fswAvw=;
        b=yOl3BrZN26CXk6jnuy0TyFoamixGK0rdfhKTodHZelcr0O46+OfDzr9Se7nS1K52yo
         u8bu4MrWx5TybfLA5QCaGlm8N65lk15MG7UAzFI+FcsTBvrU9FOUoIrek8+Igv6tTwhN
         e9E7PQ35a+5mZu2B+O1EswcEgmPiWTKG99rMb+liFCi5qpOR/EiQfDhhbBIPWRAk/n+3
         mUK/SvSJocXDY/j3dtdkV5/JyMbt/m4wKhlkeNzMd34jczUxNBup7r97FUp65xVI6TvN
         syUq8Dub6wqwBae1deY2Md16CN+kzGxl5HsGIqNuSOSnchfcw5xNuYcELMkCQs8iydMK
         H57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768220683; x=1768825483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e36I1KKUEK/sxZfTrjJ2xq32F1GQDKew287n3fswAvw=;
        b=piT//Y2VUYhMr+byaXNvkmhTLKiSxv/qd93Am7ttLRUp51TdoXgUXEllNcZSd/0MSL
         7eUnf1A+mC6FJvo9g2JWWCufbfxZAY8JviViUn4aNV7qMzS8TocXbjlAE2omcNubbjWR
         ij6igxEhV/rNr8jo4WbxaGyuLQF0m+fEZaedfUixgbie4iQ1ccCdFQa7jFgCBV1dG8y1
         deWbY6x3wK4VY3mSmZ18wLAO9b1U6vSHk+iUotqddHMTJ+6EC2Eg04I3tcO/Iu09yPD/
         a2BGFJCc2W3KBwf8Lzj2yuXXIbgLrbzeOZzlKkUvXfS9lGhbG6r3zQjVBqIOgcz7strB
         XZSg==
X-Forwarded-Encrypted: i=1; AJvYcCUKZkseuQMYW/u4u29kGGmPO3X0wvuA3DlT7GCBPn5IjM7XaDxkXwkyx96OINKscVGu149eORnUeEny@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/phMcfY4AmSl/7U7QhyEAlun+edvjsonJEjI9nKiFemRiF1n/
	cKrMvOSMoj5hLrMyu3zrJD7kRNfEKM7GtRw3ibbgXhHdebRvRdnnrrg19eym8RjnfryqJMlOWYf
	1dIpU/u0XDb7L09g5FPEfV6zbyrW+iKM+hgASEplg0w==
X-Gm-Gg: AY/fxX7iHZ9qtKwP9zvAOXOo/fslTAlDZ+7p276ZscJjmKD+xpffBgZhQ+e7OnkhDH6
	xH1ZHIMCvDCGMzeMcSuT44SHbO7yi16/59rNgA68YxPkbgCRyj57Ny/TJr2R4iUcpgkMPce2stE
	suFnD+M31vPWLVov18R4XcW94KjZnBvT6ZG6op3hTURupExbGGPJoUFIKb7293Bpds1BdY51OJY
	3z0XqS5E67Kj08OdGl2reXwnEmuODjGwnV7s8qrpHTNihay3YRbF2Knp01mSJXr1EbQVyNDV9C6
	fDSrXhVTeZHW4G3gitXjaYYoDQ9R7f1a5tFid1P+ltMOM9zXjXdY5v4nKphs
X-Google-Smtp-Source: AGHT+IHCXmp3p+BgDcyniu6pC3W4HMFaiEgturOAQ9x++4qE+oTjfglFKbXLUgrlr5LdiQs0nIVxyNn31APDXRimaZk=
X-Received: by 2002:a17:907:3ea9:b0:b7a:5bfd:7fe4 with SMTP id
 a640c23a62f3a-b84451b4d37mr1788876766b.18.1768220683527; Mon, 12 Jan 2026
 04:24:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112064950.3837737-1-rdunlap@infradead.org> <CAD++jLnrcsEjKpBQWL=RHKVyyfq1UDk-sDZ7MP-16z0hBLC_dA@mail.gmail.com>
In-Reply-To: <CAD++jLnrcsEjKpBQWL=RHKVyyfq1UDk-sDZ7MP-16z0hBLC_dA@mail.gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 12 Jan 2026 13:24:32 +0100
X-Gm-Features: AZwV_Qg-xRhTnlnYX-HcqlJ8RzmjlDOBxMyZw6ynyt8NfH_3Ozeva4wyYjVcAlU
Message-ID: <CA+HBbNFKyOFfhRu=XAE891dREPatFRD9VJ5=upz6xPBb8khGjQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the gpio-tn48m driver
To: Linus Walleij <linusw@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Lee Jones <lee@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 11:30=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Mon, Jan 12, 2026 at 7:49=E2=80=AFAM Randy Dunlap <rdunlap@infradead.o=
rg> wrote:
>
> > The gpio-tn48m driver is useless without the simple-mfd parent, which i=
s
> > not present in the kernel tree, so delete it and all references to it.
> > Also delete references to the (missing) mfd driver.
> >
> > Fixes: b3dcb5de6209 ("gpio: Add Delta TN48M CPLD GPIO driver")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>
> Is an equally fine solution to get a rebased version of this patch:
> https://lore.kernel.org/all/20220131133049.77780-2-robert.marko@sartura.h=
r/
>
> to Lee, given that Robert indicates the driver has users?
>
> AFAICT it was just reverted out because of process, not
> because of any problem wit the driver/subdrivers themselves.

It would be awesome to see it in the tree again, as the drivers
themselves work just fine
and allow SFP-s to work on the TN48M and I have patches for TN4810M
(Which is a SFP only version).

I still have both switches and there are some in the wild being
actually used as L3 switches so
it would be great to have the required CPLD drivers be compileable.

Regards,
Robert
>
> Lee might have something to add though.
>
> Yours,
> Linus Walleij



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

