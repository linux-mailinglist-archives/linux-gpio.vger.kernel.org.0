Return-Path: <linux-gpio+bounces-38486-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zLOCHD3vL2o+JQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38486-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:25:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D374F6862CF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:25:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MkOVC1W3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38486-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38486-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD809300EF76
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FCB3E7BCE;
	Mon, 15 Jun 2026 12:21:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110243E6DD8
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:21:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526083; cv=none; b=muw8hg4Q4JZbgInKAk+MMeU95cb+25WEkTW9rxetI6wDbowTKm7/KWLC+iCiWcdrb7oLzLmEKQhUy82T5wTW1jymfQF5SEY1BYt+HozkPsozhjLcWOXMnfBYr9SCl+wTFNyW8K7ias4A+M11Yx9+5abiwZxO5WlpjdZR7QnDDw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526083; c=relaxed/simple;
	bh=ROD8BjDuhqrcHGOg3YU5pJx9aeO2ZrsENA67Q221pek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4ANCQlqXr3pwOlti9AZIB3BM046dsjaHb9SEndlvz7SVhDJQtU8khS6eSQGzxsklrNXJ6rT0rynJ4zDcVJZCFFMBstipqKD8FJqv8927wXGpLd5hKkgem49+9dlL8aM9EaZ3JNppGxuPpkpUnAIFS9EB6wh1trquL5ihDapkyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkOVC1W3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8141F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781526083;
	bh=F/R26Myyl0yIhGDi/iXaNrHDLf/HQBvBtxQkw+f6av0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MkOVC1W3ae0yWWtsGOcuUFNtaGeCwRKcGjsxebAvK3Kooo/iGRyV1LK9XkneRwnbU
	 Y7cQJwC6xQJVxrMDUZvPWWk7nK3KE30O+9f/DdZySbIh7BCqtDJdVIvI13aJtqkGNd
	 tfZl+XZQDTNfKy+YsbRfX0pzKggYa7EtOR6/wZH0NOldCpGp+D/dpsEce9GqRFXiMH
	 0yOi862Ui9Mbg9c1oD/whS26InRATQXCphBhqhht3tKyVeWk9j2dRWyq2VNgxE2nCH
	 pSew8sAQmdyx9lZ+kOyS/hke9Qau7olrMIidVBBneAL0WKL0Ge6XndE4m12G7f8tqZ
	 OFImQJlj0V6KA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa5e0d57e5so2307512e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Y7vyJCgm7VTCT68ooU26pM2RU+K9pR3+LHSWo4z5d3hM9UH7AN5ebj5dlRK3xz6V7kBgIZY1SUzxT@vger.kernel.org
X-Gm-Message-State: AOJu0YwblKeWBMumduNHaR4PJ5nujP9yAHyYnGIRRrrchtCUnMo7ofpA
	n7uJB4yGbmgwpKS14WdAswAaMYarU7LQRWDJuBOWTIfoJrgpZNoO0+/QSQvqB2Xf5WxlAq4SDYA
	yLG/jGKUqFtvTe2Ncw0Ug+uRghfh5TOs=
X-Received: by 2002:ac2:42d5:0:b0:5aa:8824:1571 with SMTP id
 2adb3069b0e04-5ad2db8b01emr2615896e87.49.1781526081757; Mon, 15 Jun 2026
 05:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610083701.18663-1-hardikprakash.official@gmail.com> <ai8jhK9hUGHpojB5@zenone.zhora.eu>
In-Reply-To: <ai8jhK9hUGHpojB5@zenone.zhora.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:21:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLkZfFRBdbMzs3arLu61OO9KcJpS1pB18e4gdyu5PADvhQ@mail.gmail.com>
X-Gm-Features: AVVi8CelMRVH7oTzrLtejJtW_HL-yUSQgpLF7pD3CatF0zFZ_HBArAsp2CAL2-c
Message-ID: <CAD++jLkZfFRBdbMzs3arLu61OO9KcJpS1pB18e4gdyu5PADvhQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "i2c: designware: defer probe if child GpioInt
 controllers are not bound"
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	nathan@kernel.org, chaitanya.kumar.borah@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38486-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D374F6862CF

On Sun, Jun 14, 2026 at 11:57=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org>=
 wrote:

> On Wed, Jun 10, 2026 at 02:07:01PM +0530, Hardik Prakash wrote:
> > This reverts commit ef76a3a28c79b628890431aa344af633e892035b.
>
> Is this in your branch?

Nope. It was too late for me to handle as fix, what was merged for fixes wa=
s
this:

commit 3f786abd23951f3f600a62fef42469d9200d5f52
Author: Hardik Prakash <hardikprakash.official@gmail.com>
Date:   Fri May 29 15:38:36 2026 +0530

    Revert "pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo
Yoga 7 14AGP11"

    This reverts commit 3812a9e84265a5cdd90d29fe8d97a023e91fb945.

This needs to go through the i2c tree at this point.

Yours,
Linus Walleij

