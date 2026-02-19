Return-Path: <linux-gpio+bounces-31920-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAtkEL+Ol2lv0QIAu9opvQ
	(envelope-from <linux-gpio+bounces-31920-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:29:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DB163301
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E34E7302A50D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9599C32C31B;
	Thu, 19 Feb 2026 22:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlrnUEyP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41344326D53
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 22:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540144; cv=pass; b=f1/zonChAtTN6PTylU8n33/BXvMwR/ZRcRo3T7c+LHqZIffaqlHmJsEvE/OQeqzc+sqk3X3XKIZ0gjjLh5uswjuzQ/MEdM4TYYeqvAVEpWF3dM9vG6nggx0t+7NoZBdH/sHPagrcVuOe1d5yywgEon9IAXEDHXWxcTeBsL5rNeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540144; c=relaxed/simple;
	bh=1VeFjbT7hW9sFhCytM1OthSfHXRi/0vutjljh9R7GVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAuF5K++N3BV1rIy2lZazL1uJnRfkHT+ThrQ5A/O3993jHALkE2549DHCejBca6QB/6a5LtJJUIGlbLMtz/ejds+cWECTRGW+rVTTREZa6IIu1vkt49oIkwod5/WdRhqJJduNHMNVkK16Y8hwkghxkAkJfloQKcYdo6fSPkL9/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlrnUEyP; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94abf5a5e51so932941241.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 14:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771540141; cv=none;
        d=google.com; s=arc-20240605;
        b=GfFZFRzt7XCTwv6v8XwUEd/bzK5ZIQo5JFeZMFikS6JZKl2ixwO3kKhXuadSpKC7hJ
         XWqaAlMX5TSj3OcqjCFK+5NQNcSAd+iPZEzttd4LnlHmAX1ytdyoy4cgfeAM1Vqn89Og
         f00C5Lei9cLz/Wj1Dp8BMQqHBAKS6AMVbyZrVP8BT6q2EN2vpDrUUXqV7OxQSMPJIb5N
         mAng65cpoz25nVdfqbLf07wH5w+nTI2YqlSiUniZUfuM3Tc0KdcMNdJZJW+2TzkY4e+k
         eFxHms0t2a9lQtAMj+7RnnqGyXgPKWTD193opcAb3fzEGRo7W2k6X+oMWICttiewwHKJ
         68rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1VeFjbT7hW9sFhCytM1OthSfHXRi/0vutjljh9R7GVU=;
        fh=f8qAt1LQzutNtq7jf/Jh8+NG350QJWWIEsU16J7r8NU=;
        b=NrMovyTqT77W0eD1QfLcNFTyIWzJswJhhRWyOuGZBcX6utKRMsp4yjlO3scAxwJnu5
         w0qFz4qiJTxfu5keC1MmLSSHjiMxenHEGtRCi/sMEtoTER5+x9ZMKNOBUsViEsIde1jg
         jzkLi/In3juGAQ4YSQv5RYL787RgxdjCMsBihh2Q7cqXvue5nH611de0YZlmce6U8swI
         mPVJiQWgMdk6Lfj+JpfizQcITDJsjfEOCgg88MKvu2ozDAXsS4OFdjXTLH8Vp5WNrqQ4
         VUsD7wJtuQ1H8qJvfohkGzM/hEt2guMUJo8HhXVZ6KbrLu1n08uGJMbNFf1OEp+nYftj
         ewmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771540141; x=1772144941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VeFjbT7hW9sFhCytM1OthSfHXRi/0vutjljh9R7GVU=;
        b=ZlrnUEyPxSQQKGKg8iM6xwD8MV2z4iYIgpml5iFBrczR5E/nZVeYPQD/9wH/IuY5qR
         Xok4CcKVQgQqyORF5TBCSpDovbW0JWDVEvErym1K9JDOXt1zawHQoVBITI/+HyfvqJvx
         458Fm333luSlkXI59s4IhNMqIsblpTja7A+vw9XYwzR9DuHb+c1T6Pchc1KJG+3PlxSe
         84Yo7iGOpOi1yGaIfs/7RNkVZ0bbPV3lms1mSf1121sg8iWcKZ9cYjpW1G6DcDFzPdYw
         Xd8k4DygbDovGHx8ItB9ztATlAYTAChYtGt6ZGwpjlIrH0HXmpok5rsL2n/zJdn16k+O
         Umvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771540141; x=1772144941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1VeFjbT7hW9sFhCytM1OthSfHXRi/0vutjljh9R7GVU=;
        b=IBqzahquHKTyxpipJfnpoWG17uw8Yix6wBCbinrEQCX9QN2qChuZUZlueovHIQdrT3
         d1YX5mOlz+TdhOHPjWdfCwb3Yp1VMf1E+4Y28gwGVhOmjICQEHnLDp6tHPVDgRDaKfQl
         rjY6d5D77Byg3zet81IrPUd5Wk8ua8FJwKSotDswPjXUGP3iIYdW4UtzoJBjGPya1U4v
         k6mCoOeuQk8jhmh9vHJilhFuvqkuX7QJEmLqVruR+P+3UEI6surlDZKVudDCGJZX0gSf
         d45PXwqXgRVtIyJ+LlG4zqUsfw23HzstJC9HB9YSsSz+l/lqjclsphnR9ROzDk1aoBtY
         55ow==
X-Forwarded-Encrypted: i=1; AJvYcCVP285vsrGe2BQ3qijAoFatjiWh4InK98CVVRahyvr2xXjt48/wmYtGejzt+OGI1jTaTPjSJRbvQcr1@vger.kernel.org
X-Gm-Message-State: AOJu0YyECLapB5jNM4LT7fq3LixYYQJY7j7HPlK86ZvYnRPRFDUNPUQ8
	alVN3sniy7jsqjy53+WaA/gICAFNTMQlWP+L4RkQjYzno8FIbsmsazrP2QMXxyJlbvm5hVIIdFl
	I/+14uoOEdDplhFZM9Imj2mdnCpKGahs=
X-Gm-Gg: AZuq6aKuAporVPu89/t5W/zWqL6sBR5mMGP/NQjb6YuTq0g8X+pIm1vGhYvjMGuqhAi
	RrACEDsXx5bA7dhOXYoQa8XKIBFEUpWcYQ7crr/hFdzf5jF8UR8D7IAN+Pd2ehgtuS51Svc3tbW
	eTF4CDSaTwsikOH5PN9Rkx+69DYix/L/d3GCQ+oGEz6XXYnDlpZ3F0awDeXbyISSKlSp6EEXncF
	UNRJLOy6mDtMKBCnsqCx2m6GZUAVPy58xElXmKzL+hh0tFU2QVRyIQ7UyEo9PM3PaRkNcDuBOw0
	DC6H4Oxnw8jpIp79FVb5n6xxZAmpBJt3eBTWMn9mrG3Hn4nEYRZ5kpwdAX800DC3uuw=
X-Received: by 2002:a05:6102:c47:b0:5db:ca9e:b57d with SMTP id
 ada2fe7eead31-5fe1aceb197mr10870183137.19.1771540140910; Thu, 19 Feb 2026
 14:29:00 -0800 (PST)
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
 <CAMuHMdXmMVgPJv=HhkfttiRnSwFC6c2PnFjYwmL2hu3ikv+t3g@mail.gmail.com>
 <CADvTj4r95E2rLA0ZhOYPeFYpFbj0EXfb=omCN2Mab-Dj4T-cYA@mail.gmail.com>
 <CAMuHMdXTg8w3R1BVq3JO2z=gvTdB=qXY=aXvC7Lb8FtkEqz9ow@mail.gmail.com>
 <CAD++jLmp+47f-Ah4YdFJ+9dU0OFrnQdOcVyrQ61p0-_P61eBrA@mail.gmail.com>
 <CAL_JsqJK7PwyB=NoM+uXOgQk-RT49h4emogvYAfUAbZUpnd6Vg@mail.gmail.com> <CAD++jLkJE0ruzPeRMuVKJbJTjHoa-fTKn8djN+0es+hpqhELFw@mail.gmail.com>
In-Reply-To: <CAD++jLkJE0ruzPeRMuVKJbJTjHoa-fTKn8djN+0es+hpqhELFw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Feb 2026 15:28:49 -0700
X-Gm-Features: AaiRm50JFGFiJi_UErn1QwgM1XN64BckNk7aSA7hOrVufKPtG3K9PTpuvYnqvF0
Message-ID: <CADvTj4rd3jS5VAPK1wyC8wKqohZ4kAX4tAJ9CfnBk64+cqrMUw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31920-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BC9DB163301
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 3:14=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Thu, Feb 19, 2026 at 7:29=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > On Thu, Feb 19, 2026 at 12:00=E2=80=AFPM Linus Walleij <linusw@kernel.o=
rg> wrote:
>
> > > And as such it would be pretty half-baked wouldn't it...
> > >
> > > Probably Geert's suggestion to use the aggregator is a better
> > > idea.
> >
> > I don't know what that is to comment. (Please don't reply with "you
> > reviewed it" unless it was more recent than last week. :) )
>
> I only think it's half-baked if IRQs don't work and you say they
> do with the right interrupt-map so that's all fine.
>
> I'd say James have a go at gpio-map + interrupt-map for external
> connectors and see how that works.

From my testing, gpio-map does not allow renaming lines.

>
> It will certainly be more lightweight.
>
> Yours,
> Linus Walleij

