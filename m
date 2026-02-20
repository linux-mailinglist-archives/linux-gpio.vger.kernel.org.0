Return-Path: <linux-gpio+bounces-31928-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEyuL8bpl2lT+AIAu9opvQ
	(envelope-from <linux-gpio+bounces-31928-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 05:57:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8F164B54
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 05:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B227B3027B60
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 04:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AE632D0F5;
	Fri, 20 Feb 2026 04:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLe+Tr85"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC523AB8D
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 04:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771563454; cv=pass; b=pfFF5z2E1Nxqon0w+4Ux7WwTijuRQ9NIvVnG+toh0T6bzD0Y8KVwzlkE+4qmtzGbUfiDZ6lyB1NBLZUxNkFyqDUTqZycs3B26+sdQ4fCJPuYHmuLoBpFODuOPIu/n+eTlYQi+VY26GJU7CmM/Eyk3F67wY9bJZcomQqCQAonXmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771563454; c=relaxed/simple;
	bh=2pJScVpbczlY+cE3gNw9cRiiwviVKOuZgpx2t8j2JtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkdZCyVN3g3xCaGCrDsW0HfYNknmPFAdNMVbbctHRfAhQLicX3AB25D4DJ8xmG6lnTzowkfIgmdBNLqdHfBLv6s9tXkc4M2OoLR39Tty5syize7I6r1bsS11vklGtPIfJBPnsuuo+yiAzGEMMxYUEJkIKzdNbPk0q1N7PHQPDBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLe+Tr85; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94a231b285dso883858241.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 20:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771563452; cv=none;
        d=google.com; s=arc-20240605;
        b=kZHHTyv7fxCoFQ3uD4WHcYx2udYygYjDC4TLYAjnOeMCZx0lC5wW0a3m+gRhSlX/ju
         UxPABsNZUylnNBUOdgA0k4n1VZ6XnAt0QEz5n3iyYi96+1uM28rmmlcW6Ska9JUmnmss
         0cHiSXCuuN1wkwcohuW/jNXDeOVSYG2Bbk24Nt92VCjhyoezLsoq639Fci0fjRsTHJ+L
         4GtKMlEBhLt2Bzs0Et1cUb/yEQIkQd3iwYC9fvmuZ9Fm2++aR/pTsglWErg+YuVF+emT
         WM+kZTLi285Mom/vyINbkNEuKQqoO7iwTUYx8rYpUV92x17UtMwvWSHgBG+S4ql88bu2
         VMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2pJScVpbczlY+cE3gNw9cRiiwviVKOuZgpx2t8j2JtI=;
        fh=EOiXn05yxmZ2Ic+nyu9miDCetD7RfWOpzxa/b2FctxY=;
        b=UieqGFX83boltmBpsBwxpDHxkeev4CldsGzS3y9dXFV6dJ59GDHE2mxpfyP79MPR/5
         1kMvZYpsjFUV9SAFrFz5M9dlfOd3ehX0P/kgbpA/8frWrdT2Oaww/0OrBqLYbrS/5J9g
         9PEj9nA7mJO0KsPvXkxdkWs9n1+6sTcuVuq/RhnPEtyYL1v6YNgrYkfdbpiNK2CHA2Wx
         fQnlhzza/NMhRjsWyQvaXbLKhEiwPUgZkuKTFQI8BSMqZuGeRY73hDGMz7ZaJsXvfWui
         PNG8rb92/1/kkkeCOp9vjAPjLjlUyIwQMOYpBkxAFDzEHTWGGQYnYTWAK4TmsmgGF6EC
         kLlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771563452; x=1772168252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pJScVpbczlY+cE3gNw9cRiiwviVKOuZgpx2t8j2JtI=;
        b=kLe+Tr85ZdTMwAwYoJzxTYv4I4OmNsS4bj3/QkMaKmOJ39NrVqDjCLzEHcQTHxSAbq
         DRWoOLd+n3Afb/Mw1mJEJHvq4QZIPeK7RyTMjKHb0aGpOk69kTo+WIn3rQ/qV0UMIHHN
         p6eLM1Oh+Q/n9EPJVZ4JK4ws3Cq3SP6d+ozHT0phkScFPthF7P+ta/EFArJ/MgS/RzIJ
         vNJDRoo+zlZYe4dSXOP3KlUNPp+WMLtkBAO/K4wGytyetwtaszCuzyiJxdJAUE3xAdcU
         6Re4DsqU6GPlM7ZWNCXrRbCvneRNwA15n4VKpVXPxVkTVCm6H802203e10WD7Abptw/w
         Oy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771563452; x=1772168252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2pJScVpbczlY+cE3gNw9cRiiwviVKOuZgpx2t8j2JtI=;
        b=f9q0qaEdRAwEoJy+Y2Wj3qSSUd82LjMpNb+rxTvQprIs7RSmsfsxWbzATM8b5s/qO8
         vImuMCPkDk6cjM/XVl1LNEv9bO3TArV9TBnROLFV2ldJkjLyM7LEFwGOmd5qk9GJm2Sx
         nraalnPkQhVqmQ+FPHvJnqOKB5/JlxoVKFAFAlkb7sgu5p7ib5aVpINW7JWGiP17y1r1
         yAj8Jxv7lZxcw3dWWEoGo1N7PxKFprcT659V0/X8YnmVegdctj+fYzzGIbUNvku2TCwR
         XZutxa17rAegP8xJYbZ4IGYZA+Aotqwmx8DCdQG2X7TkApH8nRlppUBXS39Y087g3Abl
         oEZw==
X-Forwarded-Encrypted: i=1; AJvYcCWnF1Dpv19fb6eKakakkVR6Se5p/v8PW3tTEVbsHhR0olRBMKbmiCDAQlWWM9qp8UM8cICjPYUgGT9b@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+FHxZAAshcBQm42XSD0VPtM9QpeAjwE9QDS48L4t8xbSlFXfS
	se2CD3UIts/eJW3QEPKbyxgjO/T7AG2Sxmy2S8FeCD9mTffjE54G4Az+v10yJxSxXNu4s55dlk9
	AB078FsX6FepJ9Al9Gs5FHwi2RRZl938=
X-Gm-Gg: AZuq6aJSoCXszpUwV8pFHIWXUcm8P5x2FGEq7ZR6hzlBWfL//ruiQUyPNWiTPML/EAG
	UJVjW2CMg9iXXLNCpMJCEbZOhu9r/YYM1VutkJ1JwP7KjripYn4FB+N1rSa/0wpez5RWBDQZrdS
	GBPF5TIiH9qVFzJQQyVSgc27B2jjebnPqVIayS6nkxSEG3HCme5oCGf6cK61ukCKEAMdDrstRsH
	0YeTndWHrpDK9JwWNojehJPCyks7B1kgFPZMz57p7UR9TEmXhLdNvEEoOORTg9OnUN8Y++SwFi9
	ydRA56RjnrdDbXW+FE4pVlJvVYWPXC8tv+Lqka372WpaQsWUhU94wCTbM9l4D93s9AA=
X-Received: by 2002:a05:6102:54a4:b0:5f5:46f6:fb29 with SMTP id
 ada2fe7eead31-5fe7fd7c045mr3991444137.26.1771563451988; Thu, 19 Feb 2026
 20:57:31 -0800 (PST)
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
 <CAL_JsqJK7PwyB=NoM+uXOgQk-RT49h4emogvYAfUAbZUpnd6Vg@mail.gmail.com>
 <CAD++jLkJE0ruzPeRMuVKJbJTjHoa-fTKn8djN+0es+hpqhELFw@mail.gmail.com>
 <CADvTj4rd3jS5VAPK1wyC8wKqohZ4kAX4tAJ9CfnBk64+cqrMUw@mail.gmail.com> <CAL_JsqLyF71Jq2QuY9SL2RZ4OS5GAeZhVRbRfXngMjjHGob36Q@mail.gmail.com>
In-Reply-To: <CAL_JsqLyF71Jq2QuY9SL2RZ4OS5GAeZhVRbRfXngMjjHGob36Q@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Feb 2026 21:57:20 -0700
X-Gm-Features: AaiRm5219etPTGqscLarTfTlDXnh5wOXb5DmdG61iA5b7k9AbeEbjmR8ni0cwe0
Message-ID: <CADvTj4qt6ubU+9f-b8ZP5+=RPfTD9wZqOui-c08via6mHPy5yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31928-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DA8F164B54
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 4:12=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Feb 19, 2026 at 4:29=E2=80=AFPM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > On Thu, Feb 19, 2026 at 3:14=E2=80=AFPM Linus Walleij <linusw@kernel.or=
g> wrote:
> > >
> > > On Thu, Feb 19, 2026 at 7:29=E2=80=AFPM Rob Herring <robh@kernel.org>=
 wrote:
> > > > On Thu, Feb 19, 2026 at 12:00=E2=80=AFPM Linus Walleij <linusw@kern=
el.org> wrote:
> > >
> > > > > And as such it would be pretty half-baked wouldn't it...
> > > > >
> > > > > Probably Geert's suggestion to use the aggregator is a better
> > > > > idea.
> > > >
> > > > I don't know what that is to comment. (Please don't reply with "you
> > > > reviewed it" unless it was more recent than last week. :) )
> > >
> > > I only think it's half-baked if IRQs don't work and you say they
> > > do with the right interrupt-map so that's all fine.
> > >
> > > I'd say James have a go at gpio-map + interrupt-map for external
> > > connectors and see how that works.
> >
> > From my testing, gpio-map does not allow renaming lines.
>
> I'm pretty sure I said that already. There's no reason we can't
> support gpio-line-names alongside a gpio-map property. Whether the
> kernel supports that or not is not my problem (as DT maintainer).

Yeah, I did investigate adding gpio-line-names support to gpio-map,
but there was no clear way that I saw to actually implement it in the
kernel. Maybe there's some way I missed however.

>
> Rob

