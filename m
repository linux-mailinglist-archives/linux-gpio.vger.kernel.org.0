Return-Path: <linux-gpio+bounces-31615-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPSmOui1jGnNsQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31615-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 18:01:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD89126629
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 18:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B2EA30071F9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 17:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D73340A76;
	Wed, 11 Feb 2026 17:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa56ajQL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32252318EDC
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 17:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770829279; cv=pass; b=s+zPY6osk6HzxRhD6JzvxJ56ZndoZYn20yUkb49pjwtrlwiOqTmU9KOVL3kbNJNL1Wuy8vVjYDf8JRBBxjBuZTYK+LHqzle3B4I+qBzFAwWZ+NEjKDBlzQHUphAmP7hIn9TmCQn1O7q902P3jW/zyZ+OgWwIRrGRSS0JIzB3MHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770829279; c=relaxed/simple;
	bh=4ZnEBjDHwmku7NC9H+imiySGSAr5j+VPjTjM/2L2cLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PuvW7JmmfUZR6sWwoPlykXCfINaADytXm/Uwlt7ri+xZ2qvuVgyvUGs7R2COnnfJ9JOYWFlBs2K6GETFqR3axY5L9InZM7mI15pI1MUgPpEKjNN7rdicqM5Y5mbuVxFJ4Z8ER9fQHlFqxQkuywImWHfyecpVJTSPKexFGsXDZig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa56ajQL; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5fc66c49d03so910333137.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 09:01:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770829277; cv=none;
        d=google.com; s=arc-20240605;
        b=XcwpvQQhviCasFoTZCSpKutSwkfWunjn80c4wKKWrT5B6TPcOVz9oWn5+uQn3eO0Lr
         9ScDby0HMX4GrF5Uzm4tuGu94SaD5NJOXWpDRBQfdEvb/T9KanG/+5b7vfZdU/NrcReP
         oDuU0CX6KpKmyCXUBq1gUu2k+Fe4I+4vR8TForeeSl+9jSGM9x0xpNFb3a6I22xfEHyA
         BVXZ+zjhmSYmIOcq5BYqRcHO1jxct9eJgie7o3lUlko3wAsykCRB7o32303EMBGJL3VH
         c7JUpq274EdCvk0P113p1ArTJJAl/gGxj2eDDZqhVcjRUWYRtXB940ZaX8Q021JK5ZWs
         kmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ZnEBjDHwmku7NC9H+imiySGSAr5j+VPjTjM/2L2cLg=;
        fh=41mpbzMyENtJPsMlW8hfj2s624utJZAF3xuJ3H8yblU=;
        b=XZ+opCWtB7AujThivTJ0SbirG2NPMe124re/5nL1O2CHB7j397snmvATVi4o1Z4rtf
         5ZirYRKXa15Jh+/BWlIU1zCXJG1mGIlbm0DTWYCDfXscQ2mPUvv8UnueDXGt/hHTPU97
         tGxFPcK5qvUBpFNv5XExojbjlyV9ItkX86y4CkPxnOqZIUAoRNxjfnM+9aZctkT9DSqs
         MoCkStSstOTwdqVS3ygkHO/6DlhqAMQCgjodlsm3uQCCRv29P/pSyGg2sH+fcTjwF79A
         FBqty2L1DYe+rje/YiKeQYadxjWL2KoJaAQ8jDfyDBjwTQZx8X7tzmJcAIc6lHJt6Ca9
         ryZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770829277; x=1771434077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZnEBjDHwmku7NC9H+imiySGSAr5j+VPjTjM/2L2cLg=;
        b=Qa56ajQL4Cyy4WWIeR1fiBsmxfmPcVQjjzGT+oFf2dnq67i40IbmQl+YhcFUzOESbg
         vwDuFUFf9G0k+M7O8lrsnUW9Pgl9Co91Tap/BIaGEVh/ROc94Dv0dGNST7wZP87QWU+O
         hRJGZwb+KynruWH/pcrVIInwxNLUfO+57puFvMpn3SCCDMmKcADHW9JZd/9vjCLb1HWD
         i+JeicOOZMUUlGCy4io3RbXf9VT4X4Pqdnn2SYlc1Bvb9yhQkCoOXQE5gN19dNvFhiCF
         o5YUyF2p+4/HQ0/OU4ojNlEUwhjCXYY1BmZCk0i/x4rAtPbnhauOL738B5d7FQ0Kuu/A
         VqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770829277; x=1771434077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ZnEBjDHwmku7NC9H+imiySGSAr5j+VPjTjM/2L2cLg=;
        b=eosD3xcf8mYLCmKZ3jcCiig0/cXW+3ebpCdmVYLqQ+RlidQX8SGQ6YZv92DAgpNTxH
         ZOSraJs7zn8rBQCscFbTMZn7SyjYAgrzpZ7QQhh41G1qrbwT60VaiLNAuHx0z7j4yaNF
         f7AFn9YDFsrDKa7srTsz8VQYy794SNa2ue5zTKQfZJSk0lkS7+nGgP7sJFoCgPcSyXxo
         UDyoBGx8cOBl4E5A8l5V0ct3CFEoR+5C5r4XU/2zv51d/QU33qZ8BB6bqmctxYo8daGA
         GsE+pRmELzLG2/tP7y2QtTJquVjgqh1Jc+zKxgZc3OtpjdAYYjM9Ifxqaf9r3y3qt5m0
         vifw==
X-Gm-Message-State: AOJu0Yz+5Wiv+wL1bP1dsOKSwgQ3qUqpMPaPW6U6x++aUvplY0YiKAau
	f5kE1aJpAeHULvmzX2XRuchG3U81ii0ce/b8TlynZNBe7xAjXF8cEbMecERjsKXZZq4zNWhnV0k
	ybJUUjZxjjGJZ3NBXzwqMnBDMtxuj3mk=
X-Gm-Gg: AZuq6aIV5Fh8/aJreaSYh2EUJuOeL1le/OTHwAG2cyaiXqsKjyjtk2+0TRJIqm9JMAs
	ZC860+kHPihwCZCnFM1jq2v1EByNjSLNDiFA/gtYEgM95mvw7lfi7j/FbC45LoS3WBDwSYF6wlC
	rCMYflGQxpgWVo2QfQ+pD33JZRHDX99If8YDLSoPLFLOXc9CwchpELIfxRneoHT0dkaJLm9LL1N
	083ecOEr1lZy1C/lsJ3syV+LQCN+zZLpGXC/UZgR+AWjW9hPAZ/iEjwhHXYxKDPiuVsBfGdhsN2
	h5mTQDtwAidEaDWCXpOitrBD7HrULqr6Dn5RlyavsueJQ54APbLeN9pz3Y8eYvpq3/dQ
X-Received: by 2002:a05:6102:b09:b0:5f5:2501:6d2b with SMTP id
 ada2fe7eead31-5fae8c57117mr6228570137.35.1770829275348; Wed, 11 Feb 2026
 09:01:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org> <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
 <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com> <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org>
In-Reply-To: <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Feb 2026 10:01:05 -0700
X-Gm-Features: AZwV_QgM_JKrxsxQoYHHcgPm2Da0hw5ny58m-RsFEi2Y7Wb236pUtImS10OxfNc
Message-ID: <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31615-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DBD89126629
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 1:44=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/02/2026 09:28, James Hilliard wrote:
> > On Wed, Feb 11, 2026 at 1:19=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 11/02/2026 09:17, Krzysztof Kozlowski wrote:
> >>> On 11/02/2026 09:13, James Hilliard wrote:
> >>>> Document the gpio-aggregator virtual GPIO controller with a dedicate=
d
> >>>> schema and compatible string.
> >>>>
> >>>> Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover the new
> >>>> binding file.
> >>>
> >>> <form letter>
> >>> This is a friendly reminder during the review process.
> >>>
> >>> It seems my or other reviewer's previous comments were not fully
> >>> addressed. Maybe the feedback got lost between the quotes, maybe you
> >>> just forgot to apply it. Please go back to the previous discussion an=
d
> >>> either implement all requested changes or keep discussing them.
> >>>
> >>> Thank you.
> >>> </form letter>
> >>>
> >>
> >> First thing which was missing (I did not even check the rest in such
> >> case): missing rationale for this patch, missing hardware description.
> >
> > I added some more details to the commit message, this is a
>
> No... Commit msg is exactly the same.

I added the details to this commit message specifically:
https://lore.kernel.org/all/20260211081355.3028947-2-james.hilliard1@gmail.=
com/

>
> > virtual gpio driver though so AFAIU it's not hardware specific.
>
> You can give example of any hardware where this is useful. You need to
> make your case with actual arguments.

The sunxi h616 board I have has hundreds of GPIOs, only
a few of which are needed, I want to map them in device
tree overlays since there's some minor variants with different
hardware gpio configurations.

Setting the gpio names on the parent controller is not practical
since doing so would require setting hundreds of values for
gpio-line-names, you also can't really combine sets of pin
names across device tree overlays AFAIU.

> > Use case is I have a device with something like 300 gpio
> > lines...and I want to name/group a small subset of those
> > lines for delegation to a userspace app rather than trying
> > to set 300 or something gpio-line-names values, also I'm
>
> So if I change the approach in user-space or use different user-space
> app then I change the DTS?

The idea is to make it practical to set gpio-line-names for a
subset of the GPIOs that are wired to peripheral boards.

Say for example I have a control board connected to a few
different peripheral boards, there may be different mixtures
of peripheral boards, some of which can be used at the same
time as they use different GPIOs.

The idea is we load device tree overlays for the detected
peripheral boards with detection done in uboot based on a
GPIO pin strapping based detection.

In userspace we want to match the peripheral board GPIOs
based on the GPIO line names, but using gpio-line-names
on the entire GPIO controller isn't practical as that doesn't
allow composing gpio-line-names configurations from
multiple device tree overlays and would require a ridiculous
number of placeholder entries due to there being no way
to configure individual gpio-line-names for non-hog lines.

Maybe there's a better way to fix this limitation by allowing
sparse line name configurations(i.e. the ability to set a name
for gpio line 275 without touching names for lines 0-274)?
Although that would probably leave the access rights issue
described here as an outstanding issue:
https://bootlin.com/blog/gpio-aggregator-a-virtual-gpio-chip/

> Well, that's not a valid reason for a binding then.
>
> > supporting multiple board variants and want to be able to
> > better compose the gpio difference with device tree overlays
> > using these virtual gpio groups essentially.
>
> This also should not be used to differently organize DTS, for the sole
> purpose of composing gpio difference. The role of DTS is to represent
> here the hardware.

I'm trying to represent the hardware configuration in the DTS
by naming GPIO pins for userspace, but there's no way to
currently name the relevant pins without setting names for
non-relevant pins at the same time.

The current technique for pin naming is all or nothing and
doesn't really work properly with device tree overlays that
only need to name a subset of pins, especially if there are
other overlays that may need to name a different subset of
pins from the same parent gpiochip which can also be loaded
at the same time as other overlays.

So ultimately the purpose of what I'm trying to do is represent
the connected hardware accurately for userspace, something
which is not currently really possible from device tree AFAIU.

>
>
> Best regards,
> Krzysztof

