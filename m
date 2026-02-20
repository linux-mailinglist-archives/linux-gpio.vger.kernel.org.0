Return-Path: <linux-gpio+bounces-31944-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJTQDHImmGlQBwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31944-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:16:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDDD166122
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 533133020032
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD50314A94;
	Fri, 20 Feb 2026 09:16:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392A13D53C
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578974; cv=none; b=GO4P0i2dTAqCwogQHpN4TDtQaQkF/Hz9HFS5mVNKHuwtY16zc9LDxlseEaCNmjP5ZU6G1vmtrWCyLoO4GZnL2O6vMZLmciG8ce8MEo9uYcJJSxB/kA/dLhEOfkxFbyPCQbCnqqOip+JLyaHugYs+z9FAVHxuFwGwjI7lCevObD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578974; c=relaxed/simple;
	bh=wVPy7MKtK7TfY6ZJQ986gXJWDyYRO7pR/I9/6fZh0z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1bq0TKBmHYynVZJEVbaO60kjiMHVcv7XQOuma6uBeXf2CQzy1hD9e1erCxyCOweDIYBi1StgfXJcdvSdousrZNp6o+kxSM4TkoM0YL9J/3tn34Gk6DQSaYo7a6619fVn8YrXnwAIke7U6pkqzYwVCZGaP7iFapu6B1KKH8LsmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94abd52b274so516714241.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 01:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771578971; x=1772183771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UklHwruov2HcfxX9FBO2d6nnZFtMa4z3XO7xdbP+T4M=;
        b=j599iJkBxy9nh9v6X8uvhVGe8drcjXxp98qzGNY0sJkM6SZ3hJmMUl76uuWAuFbcT2
         TYlUAY1IOXb4njAgouDqA3jiSzhqq/+fD2yqWxbrH0/95yvTkwo3Syj1cm6dzHtiN8VI
         EpzaztNE9+n34oW2/aurPrb3/XnkUTDobWuNq6ECJPUb1I/vYRh4F+G85a51EyKG8k6m
         c/KMAi6UQ0XuWXCsmB0jmUC450rkGKSRGD2M3is+dNqyfGaxGB5Nwc4nOL6xXKLxGv8K
         EJx8esBVrLTQ4HGpjtdEPSwRprwuK/fImbpSpvzj49K785AXWBmVwrNJwjERxgcrPR0c
         DLkA==
X-Forwarded-Encrypted: i=1; AJvYcCUjpMIWd45cx9J9itww36j6qKmebE4aqglARjZSSs/25EmrsipcsqgamSZWRwscyACL/ajuHmheW8qy@vger.kernel.org
X-Gm-Message-State: AOJu0YzXkJuLCVzO5kKqv5huIpXL9GgPQp50atkZF/J/7pRQfnVeRwnv
	UYJ4vHaF3sHoezleDT7kUZ00KLMPgNdK0VZeGedGsqkFQwDL00w/Uw/YdLW9vT12
X-Gm-Gg: AZuq6aJypXoTUa9wBgmjTMUyVIayMMSvW4uNenZVTn9hsFmzXYYDYd/eUi+uvsc727D
	L8OodowRY8MY5BQSwikhl2kfplODOtxfFypi7YZ2CtqwFVwToyHLkPKRa9gNvMi5/L/LcHd8l92
	gdO2A2OimPRO8tNNhaszfLM9+7aLYG8NgvG1CYBawk8WsSG+hpAn15HhCn22V9BgXVVjRqqxqHo
	pz/8cOAi3dlez5LT/81QJuV1PaPPFsNlfV3XBvsvvXcLKlTkh9XoHh4h0qb+db+5MUrkbowSN4Q
	5fWmG88d2+1ydsF8r5WujuOx3PQ8Epz63/UkfaVN1pKlLGsFcOW8MaEfCryaYxm4Ws3I6NdnVi5
	84pYN4srdU6itgvub8bEuzDly+Xb+qUg6j/FhkhA6Wzphaxw9WmUnNr2PfVBVPftrWiilbkX0WS
	GedG4KNT+Q+jiMus3lXdkud2z6hGtbOVbOm9gZzIFuNCHdFsjOP1L6D6rURb1jxDRedzKUsq8K7
	Uk=
X-Received: by 2002:a05:6102:1613:b0:5ee:a2b0:c791 with SMTP id ada2fe7eead31-5fe7fd291a3mr2791269137.22.1771578971526;
        Fri, 20 Feb 2026 01:16:11 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd1d85d9sm15950847241.7.2026.02.20.01.16.11
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:16:11 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5688c221fd3so804425e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 01:16:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWy7/wQjgZgYNKhDxb1YofFVT4AsCUqG8dXXeU0j6ycfnJu1XEihAsu2jWbSLlKw2/4xQehDzyRs26y@vger.kernel.org
X-Received: by 2002:a05:6122:6608:b0:567:516f:256c with SMTP id
 71dfb90a1353d-568bf5f028cmr3644386e0c.16.1771578970867; Fri, 20 Feb 2026
 01:16:10 -0800 (PST)
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
 <CAD++jLn9KJ2sfMtAxVGbcmWQW=1vxdiMNCDLNg-XV3hJDz=O9w@mail.gmail.com>
 <20260220091727.5330accd@bootlin.com> <CAD++jLmwAb35RW1fh3ONc-R4ca_NeWPWhWag-c-xv0oACNAG9Q@mail.gmail.com>
In-Reply-To: <CAD++jLmwAb35RW1fh3ONc-R4ca_NeWPWhWag-c-xv0oACNAG9Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Feb 2026 10:15:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkdF1X7xZvu9uhNPJBnq6grq-BvBk-598f=h7uTbYbVA@mail.gmail.com>
X-Gm-Features: AaiRm52vKhTtpZ8KXd47pui1u5eVV_Ef9bTKfDzA-BudgYrfNKFwnFeOWRbCRSI
Message-ID: <CAMuHMdUkdF1X7xZvu9uhNPJBnq6grq-BvBk-598f=h7uTbYbVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Linus Walleij <linusw@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>, 
	James Hilliard <james.hilliard1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,gmail.com,vger.kernel.org,ew.tq-group.com];
	TAGGED_FROM(0.00)[bounces-31944-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4c:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8FDDD166122
X-Rspamd-Action: no action

Hi Linus,

On Fri, 20 Feb 2026 at 09:35, Linus Walleij <linusw@kernel.org> wrote:
> On Fri, Feb 20, 2026 at 9:17=E2=80=AFAM Herve Codina <herve.codina@bootli=
n.com> wrote:
> > With nexus, you cannot translate &spi0.
> >
> > Also nexus works well when an index is involved. In other word, it work=
s
> > well with phandle with args.
> >
> > i2c-bus =3D <&i2c0>;
> >
> > In this kind of of definition, no index are present. With nexus node, t=
his
> > looks like
> >
> > i2c-bus =3D <&nexus>;
> >
> > How to handle multiple i2c busses with nexus node?
>
> Can't you just use the foo-n suffix trick from the pinctrl etc?
>
> my_nexus: nexus {
>    gpio-map =3D <...>;
>    interrupt-map =3D <...>;
>    nexus_i2c0: i2c-bus-0 =3D <&i2c4>;
>    nexus_i2c1: i2c-bus-1 =3D <&i2c6>;
>    nexus_i2c2: i2c-bus-3 =3D <&i2c8>;
> };
>
> &nexus_i2c1 {
>      sensor@4c {
>           ....
>      };
> };
>
> Maybe it's not as elegant but I think it could work?

Wasn't that already solved using i2c-parent, cfr. the connectors
discussion at last ELC-E?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

