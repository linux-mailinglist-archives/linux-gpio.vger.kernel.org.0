Return-Path: <linux-gpio+bounces-31590-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOJYJMs9jGlyjwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31590-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:28:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE40D1223B5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA8CC3013A49
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 08:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9312350D55;
	Wed, 11 Feb 2026 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cg/9omM/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF9350282
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770798536; cv=pass; b=BgHDCapPhvecuhqzBewNhQV57zxaW5e5o55A4eV46zLyBD8Wuwss93nMglzbeaycLwR2UA20/O6s421cS76KJb4SmlkADif/UoXEeRgc0pt7wtNNKoW9DoeiWtPvRCLQhVD5RE8mOZoiLo6sVp+cJjsb+VB3Ztrca92+voZCVrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770798536; c=relaxed/simple;
	bh=Kg6moQXk9ZlzdUMp6S2MKmxwSba5KfxOcZPdAHunSgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/aRiz3vtD5hmDM99/kQoJP95rw+DdTiFp6pHkPx2tZs97ZdY4/dfu6/y+lMGKv0RAE54+MZeAoxvuwjcsDEz4E3jCuzlflBlswZwo0boUxsjjr+plYF82t2FWc+yQPNdmUEZQn8vnQCwJaXz8rknU4S+FD4D61zqaW5X+1mRms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cg/9omM/; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5fc41f88ff1so704920137.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 00:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770798534; cv=none;
        d=google.com; s=arc-20240605;
        b=EZmCUaJ/PoWBRfGgywuULXxsTzfjEzCU5F3Yu+EkwEmdSiDf8pSYcsWHNH2BJ+4B9r
         A9pkjlpbC4JUEPm0ZBRlwlKhp/Mg/luf/jfbz9BP1CUagJoURYTrrvBqFf69QyYxVEMe
         j0oyc3a6aRgURre6VbkcGJJvH3HTZPHgl0ycctb2mNok2jKoWBB6Z37QA0TLdjqIiuKT
         BzohRWQWnlomgy/Rw5lUoq+w5kEg1hnhEVCUSfi2BqtjI/wfUxvLQ1uZ8JyQG49HZLWq
         z9OXgebrUPgttbJ24iw5FyKELQ6+Y0GDv22IRj2dxcaM09CyBWhHwx4lzmDwbfey35A5
         nqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kg6moQXk9ZlzdUMp6S2MKmxwSba5KfxOcZPdAHunSgg=;
        fh=ri+rSD/u7dIn4PJf8eFNNhN0rGZ1HkKPNaKdqwh4zU8=;
        b=huyf4nCu/LwvRkPqcjYRfjBbeDxYyc4flpVfwBG7GOEp+zewlPivwRa7Osyg1H8CEt
         i4XAQZMilzstu1jAgOLSOVmCdkDpuNNIlYaD/9zEDV1ixtcTht+ByT1LGT0DPHGeTIPX
         66IEF53kZipCcO00BrpHE3DXdhe4/BUhx2aQ0JtRUgmusJY462jlx3/ZQB+Cmp7sxigv
         p9M2csdYhdQ2kmUrHKJtW2OjZSY74efNfFpadhLUs+3yNSDQ4MbeKs+hgyuVbPAeRJiC
         mxJxpvkOQy7gNzokNSlAgbTT2s7VwNGX19/JlceOgReLf8RqQlfj1mu+n6ac1jCk7BeP
         D2UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770798534; x=1771403334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kg6moQXk9ZlzdUMp6S2MKmxwSba5KfxOcZPdAHunSgg=;
        b=Cg/9omM/8lqlAR6QTtKU7nKpXD8IOsgEuNNI8hr6wYXIQnlAtggbH/2yF/Me4lczHP
         HjXfIdHwqms4owfmzMXUuiI7ZV6FG8+/QbvofOjXMO3xWcthwquJ9KGnCvMGJn8YxGOd
         HDp1R0EDfS48dYpUgxZgs3jhtV1pn6P8lhDKJm7O5OBgsmefwOnK9JOlJRi3cODMgTde
         KO5ln8DKiJ6iKPhOyiACNorAWq3BvRuKJSwtgrLgGGdFWholsNQ5XDIpTAOvlc6CD2k+
         vmmNp2+UOPUh+6NHJPdhCneXBMb3xvL/8nEf+8UcHK0eLaufK3ZY4BgxYrWX5AzDmG9e
         HBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798534; x=1771403334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kg6moQXk9ZlzdUMp6S2MKmxwSba5KfxOcZPdAHunSgg=;
        b=Om6mhgyIvCzpjBcwW9DI/w/s83zB+488wZSoDsRkduKRBWUVSjDc7ioooQbqC8AzGj
         bD0QjsJ13FFnAomRotmzOOxECVdw00/JnnXNOIjpGt18MRdP24bbXXxgEVqqJr2FoicH
         lygz5WmqO6Ab69t/PYJvL5VcVqN9unf6yVGdPPmQoKdYpEKVoGNqjO4hmtcjtnTF1y9Z
         NG5GUvFqlUHJx3CEF7s2NTRpsJnjkb9K8t02myQMmzA+eiUetn0MbwEitbPhSgC3hwko
         hgMAeZwFDG3bxcM883GyvUJQpTHCQDam/bOPQz2HxzNg7RreBbvVwm4Bk8SbNPy+3Ywz
         mJFQ==
X-Gm-Message-State: AOJu0YzXxavRV53eNnrO5jzxM6FO1ppJAPrZY9F779XYc/hWM26XU0/i
	jW5YEuMkeylmUMoi/SbQQ9zyLFGNoqA5vAwGNvHFul21NFqJz1J5c02TcnrRs9kouEqhGYohVdF
	C4b67jLYC32gpTqmFoAu6ODKUdpQI/JQ=
X-Gm-Gg: AZuq6aL6wviviel9YSrgilSrTzIOqlsa1e3B7gnMei5Yz9zVDa5uqCuyuLqkavXZ7gt
	D3CjZVdRM7D0xeq1+s468lzzGWCctyiYSDJnqFjhNNLrnKg2ixvqTQ4ct57VZPEmPigoGxQWQv2
	5PdPaTzX2zvbS9S7JUATBTQTMYUBHskBztEb0MGVV/XMQMmT/iI0CmoaKy2mGvkOuZqxKiqpyXJ
	Tv48eJP4cKtPupTME2QBNrFWyfacGuiEDbi5pNp+0xbmfQ7MCrVvA6Z/plp3RKEFQK41CK3THdk
	UYEaiH1JS4N/xDNxH5CYjghJz8s40tdGJuDgIB7zym+tatVlokrlMtTBqqZjQSCQrMZ1
X-Received: by 2002:a05:6102:2ad5:b0:5ee:9f76:1ab with SMTP id
 ada2fe7eead31-5fde417367fmr471702137.5.1770798534275; Wed, 11 Feb 2026
 00:28:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org> <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
In-Reply-To: <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Feb 2026 01:28:44 -0700
X-Gm-Features: AZwV_QjfXIRkNqLm-Dp3Zh9PYyfFaTDskzThQSZuWG7pN9NHmqot008KowqL37k
Message-ID: <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31590-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE40D1223B5
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 1:19=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/02/2026 09:17, Krzysztof Kozlowski wrote:
> > On 11/02/2026 09:13, James Hilliard wrote:
> >> Document the gpio-aggregator virtual GPIO controller with a dedicated
> >> schema and compatible string.
> >>
> >> Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover the new
> >> binding file.
> >
> > <form letter>
> > This is a friendly reminder during the review process.
> >
> > It seems my or other reviewer's previous comments were not fully
> > addressed. Maybe the feedback got lost between the quotes, maybe you
> > just forgot to apply it. Please go back to the previous discussion and
> > either implement all requested changes or keep discussing them.
> >
> > Thank you.
> > </form letter>
> >
>
> First thing which was missing (I did not even check the rest in such
> case): missing rationale for this patch, missing hardware description.

I added some more details to the commit message, this is a
virtual gpio driver though so AFAIU it's not hardware specific.

Use case is I have a device with something like 300 gpio
lines...and I want to name/group a small subset of those
lines for delegation to a userspace app rather than trying
to set 300 or something gpio-line-names values, also I'm
supporting multiple board variants and want to be able to
better compose the gpio difference with device tree overlays
using these virtual gpio groups essentially.

>
> Best regards,
> Krzysztof

