Return-Path: <linux-gpio+bounces-31955-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL9bLzdImGnYFAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31955-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:40:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFD16753B
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 12:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B692C3030B03
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 11:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D768E331220;
	Fri, 20 Feb 2026 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpxX5oLD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DF61BBBE5
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771587634; cv=none; b=pP8jW/5mwohF3fZ2hqKCj/9cy3/qkBlI1eOaBJz9PVTjTDlnyuItRVq406ePAFr9tOd8rUVTKmrrkjRz8yMi6VeATc1g3FtMFekhphk7ATHKhRHK2qqV9rNXXK5qjY9dHA4GDmXpaLGw7gJ5GENf4EWOFC9mKzyk2Q1hUlMe5Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771587634; c=relaxed/simple;
	bh=lWtEjlAAPVWq0gS3+MQtMEHmyPRs3bM96WHmgpzpEmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxkYEE6YMTY4Ev227zk9uE+ox8qBJrV37U9WOUDqoccxLTFnfj6g52tynSsPizbFAMvIpROOrgLe9jjGJvzYe3JcOD9zF2O3QZ/JOnAGZZIea4nPgspNa9ugSRSlBNTNn8Vwh3WeSr1iuWEcXPkA8SZys+jY7ghQz+FsWCkBUII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpxX5oLD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528BAC19425
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771587634;
	bh=lWtEjlAAPVWq0gS3+MQtMEHmyPRs3bM96WHmgpzpEmk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bpxX5oLDVRUB4Gb0AG6Gwx6ZypQFptsyq06ujLnMqdfXDu52Ghng14iHqRJl2iiaw
	 7QO+gjcxJnyBTrJaORPsgHFHVyPw5GaU4JRzERXWeBfCWQjDS4pT6tUEGIlCojdMFP
	 eVLDtuFPSoE4+zebP8yaVvcut62VRyjBzJsKCEXi1gRvZgKgZWJPOqQ8hqNbcC8nss
	 d70neir9+UjmLBcNJggCycx/eSqFncOuyjvl1sGcbbrzNinxO7zUrzUid/ycNqprTk
	 +nFuhNe7eyksCtYHNNgN5o6SGMD13pJcibrm8Pj0Ya+Gqmx6/+jZfsVAHRgLANGsTU
	 Tea6SbCajN/PQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38700168abaso16792881fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 03:40:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+cSlwexc7RGkFh2ykuNHcDAl0NaBIFp6I7zf577PljISkuDdPMS+w2PKQKROAoiqknZs4U8xRawz9@vger.kernel.org
X-Gm-Message-State: AOJu0YwiKXni9OAmY35aII8n8HCXC06O/Ixvns+mCAP767VcwBYa5ivc
	NnD4XxsGVHgd344JjhOUFhTfH0y4N6FH1yRJLgmkl20r8CJOkweqg43VbncmoIKniUyx/8COBHK
	nOyr0/oWQDvPuOcqP0C/OgH273XHoFNvytwjOl4+NUg==
X-Received: by 2002:a05:651c:1546:b0:386:ff65:4409 with SMTP id
 38308e7fff4ca-3881b95ed9fmr64284981fa.40.1771587632811; Fri, 20 Feb 2026
 03:40:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216211021.3019827-1-james.hilliard1@gmail.com> <CAD++jLnOouLSt324=iKVnYd5v3HMBaMG_U4=8k-ixoqkek5niQ@mail.gmail.com>
In-Reply-To: <CAD++jLnOouLSt324=iKVnYd5v3HMBaMG_U4=8k-ixoqkek5niQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 20 Feb 2026 12:40:20 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdWb1ym-6=k3gaH6uAC+gniTmKW=c+_s=ce_J47nGu-Vg@mail.gmail.com>
X-Gm-Features: AaiRm53grk0SDPss9X0K0LADVSQisEy5T7jvaOaqTpFltE4XptNPpbCS67TZixo
Message-ID: <CAMRc=MdWb1ym-6=k3gaH6uAC+gniTmKW=c+_s=ce_J47nGu-Vg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] gpiolib: of: add gpio-line node support
To: Linus Walleij <linusw@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
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
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31955-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20EFD16753B
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 6:44=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Feb 16, 2026 at 10:10=E2=80=AFPM James Hilliard
> <james.hilliard1@gmail.com> wrote:
>
> > Allow GPIO controller child nodes marked with "gpio-line" to apply
> > probe-time direction/flags without hogging the line.
> >
> > Extend OF gpiochip scanning and OF dynamic reconfiguration handling to
> > process gpio-line nodes alongside gpio-hog nodes.
> >
> > Some boards need probe-time GPIO direction/value setup while still
> > leaving lines available for later userspace or driver requests. GPIO
> > hogs can initialize lines but reserve them permanently.
> >
> > Add gpiod_apply_line_init() as a core helper for one-shot line
> > initialization and use it for gpio-line setup.
> >
> > Because gpio-line initialization does not reserve ownership, subsequent
> > consumer requests remain normal requests and may reconfigure or release
> > the line as usual.
> >
> > Support "gpio-line-name" for setting the visible line name. For
> > gpio-hog nodes, keep "line-name" semantics as the hog consumer label.
> >
> > Some boards only need to name a small subset of GPIO lines. Doing this
> > generally requires defining a full gpio-line-names array with empty
> > placeholders for unrelated lines.
> >
> > In overlays, gpio-line-names replacement is all-or-nothing. Names from
> > base DT and multiple overlays for the same gpiochip do not compose,
> > because each update replaces the full property.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I like this looks of this, there might be some minor code duplication
> with hogs, but the core idea is sane and very similar to what has been
> discussed in the past.
>
> It's minimalist, it's elegant, it does the job.
>
> If for nothing else, so for the sake of making the previous attempts
> count for something, and because I personally align with this idea,
> and because at least three (3!)  attempts in the past by different
> people for the same idea:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> ... and if we apply the patch in the end I would have their names
> added to the commit as Co-developed-by:
>
> > Depends on:
> >   - https://github.com/devicetree-org/dt-schema/pull/185
>
> That's the real trick isn't it?
> FWIW I approved it.
>

I'm noting this but I will insist on making it into "default state" -
state to which we revert when the line is not used: be it initially or
after a gpiod_put(). And it must not conflict with driver-specific
behavior so the reverting to default state must happen after
gpio_chip::free() returns.

And of course we need a DT binding.

And as an unrelated mental node: there's nothing in gpio-hog binding
that requires us to use of_ APIs. This should probably be ported to
fwnode and put into gpiolib.c. The legacy GPIO_HOG macro is used in a
single board file too and should be replaced with a software node once
the former is done.

Bartosz

