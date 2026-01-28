Return-Path: <linux-gpio+bounces-31195-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNmkCxTBeWl/ywEAu9opvQ
	(envelope-from <linux-gpio+bounces-31195-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:56:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AFD9DE53
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C92AE3011589
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 07:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052F6296BDA;
	Wed, 28 Jan 2026 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1QBYHdd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA8D2FB0A3
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769586946; cv=none; b=QEtiroTc5kuUQcPvsyCZI4F1Lgut/i6uYakGW5lsF0crLkx+Y8i2E4SNkZn1zzwqlX3E6gS6+JKfXredrUiKK+KHHz5BP7ifAp8GCOMT1PCRLCqXPE9QnCGKhj67C6KlwbRg6oZgBfjOLl4VgCO7CSfkuhC9QE+u1YiD+7Qa2IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769586946; c=relaxed/simple;
	bh=vHn2iFtgy5GJQaM61wjSRdXAzs8HZg3PzkMlU90FWtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNtuYmAF93oNf5vUCzC4FNyOo0iG3kLtM8gkWMUVgbFNe76J924fluUWSXutDHJnaGIFF8X6E+3SsYwIJ2a+kn/4H9M8qAgXBC8ow7vhHIQkDejrdOJuj5UXClVCRLk8R3BYHsY6AO+btCFktzJtLIgQssdR/ievQGMZuZmybr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1QBYHdd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A083C2BC87
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 07:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769586946;
	bh=vHn2iFtgy5GJQaM61wjSRdXAzs8HZg3PzkMlU90FWtw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1QBYHddKBdREEF1g9cRnsvEkHtzruaxFIiRGsM34fqZ8OBU0orUhh6WQMGq5xNL6
	 HL41NbHbdQ1+7PXhz14aDvuEZ7yE50CtThAv1BBCgn05hrFDeMNer37tx+6CkAP5eZ
	 RdteQ7bA4TYaLWXjgnCcstw3sE6NiqnoXxuHf0cAPekdvxUtz7jQqBIdPOmhYek841
	 qcoXac7mtvi26SkXLcyLVFSblkmWO/HXaTtA5g2OcGogHt56Bhv7x/NClOukBnyVHF
	 p7Xjow2uthIXElbWErRjMDZXRZHRUm88VfJFKB4KF5rssBjl33eTOuEZL25JXTAR/y
	 XdWtsQK6eHVFA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64997a5c93bso217062d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 23:55:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWV5Q8za9EKpLudLTUiTcDc7DwRnEIuoCLRygLGyljsE2QR6XmM6V00zLpuTfgZa/hO8LIBXQscMLnX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/tlAN+BVvZBu/YTW7ibaBuZZPIfY5mqPTcsHof9jJ6F3wkcms
	EjcegnSwUAVaJW6KlMdAQQ3YgDCh+t/UM7OcItFi34wPMjc5arhhzpMf1f6X5NgbdrDNxEocRjZ
	2bvFIA5uQed3z2vofFplNeq5WTZWmbSk=
X-Received: by 2002:a53:d013:0:b0:649:437a:977d with SMTP id
 956f58d0204a3-6498fc57a82mr2894937d50.77.1769586945820; Tue, 27 Jan 2026
 23:55:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rzt2h-v1-1-86472e7421b8@gmail.com>
In-Reply-To: <20260127-rzt2h-v1-1-86472e7421b8@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Jan 2026 08:55:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLkmywtWQfZzRYNSqFGNDGp6_MWq2k7YH_aiNGo01cWpqA@mail.gmail.com>
X-Gm-Features: AZwV_QhIWyc0dcIVn5xQhcEzZQsk0RyGQ53A4s3SNkcAPAgStyzaNIu-yE4Jom0
Message-ID: <CAD++jLkmywtWQfZzRYNSqFGNDGp6_MWq2k7YH_aiNGo01cWpqA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzt2h: Fix device node leak in rzt2h_gpio_register()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31195-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[of_args.np:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A0AFD9DE53
X-Rspamd-Action: no action

Hi Felix,

thanks for your patch!

On Mon, Jan 26, 2026 at 5:35=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> +       of_node_put(of_args.np);
>         if (of_args.args[0] !=3D 0 || of_args.args[1] !=3D 0 ||
>             of_args.args[2] !=3D pctrl->data->n_port_pins)
>                 return dev_err_probe(dev, -EINVAL,

To me it's a bit odd to dereference .np and then use other parts of
the args the next line but maybe that works.

Geert will decide on the patch.

Yours,
Linus Walleij

