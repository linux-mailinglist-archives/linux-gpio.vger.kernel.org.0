Return-Path: <linux-gpio+bounces-38137-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d4O5MZ9JJ2qouQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38137-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 01:00:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 597BF65B1CD
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 01:00:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=igL+nhRB;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38137-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38137-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C85F7301137D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 23:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96605305669;
	Mon,  8 Jun 2026 23:00:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6930C63B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 23:00:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780959645; cv=none; b=nYWusJvsxORB4PFu2/OTFuaXv7PV0D1vd8lQEyORA9SaMotQMdhLdjSivijX/Jt4fTiVoTJK68OQhGvkS99MTr6TMMVMOZPu5eeoc34F8mkLCL+LK5UVr2RXvuqS1tGNgNWODhrzrNgszybkjCm9StTXYMYjyWgEbBOKZCVhM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780959645; c=relaxed/simple;
	bh=tJA5S9VVnb4rEMWgyMK9X6OSlXkW1JwN9PBKfm26y0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5cgPm+jjnL6KoxHN4yoWOZHFaXCsfNcz9EYaTma35dNfxk/x7eTZ8Kvu/uEsr4UpZRONGK5ZQjZsdULS4JSyw2xlYzjHAPdu7SNAUxdkQ5vOcd06S32VKUXpAWPZurLDh1v4A1PCm5jyXGrGF+Kv3lf0U56RJd0KkZiN37SJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igL+nhRB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAF51F00899
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 23:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780959644;
	bh=JhbnXu7MJeCdMazwCf9CObS2tysQ84r38RimbYrlm7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=igL+nhRB8+AtBOPn5P+qF1ts1XeGjMUJg+YKOrYtneRc1qX5LQdchD15G+HVqZXUJ
	 VIt6IKgrQUWBuKzSGF5r3voRmtza9LHzK1R4lpGS1NvU7XFNPdljl2yjsbrU4fRdxE
	 Dl6eWuzwXw7OTQHrzk5nwGNFYsEQsI+8fqKzeSXMu2REyjKbG5vZOA/3Ce8riZjrrH
	 /Ap3RIr/tKvlFqej0ZNnfAtYp3kKV8KksLUmVmRRQetoHgD3e/SD7dXvx9eT8Ui/JC
	 xIH6wby3ZqusgdE4YV0nIF+YsjU+L6uRDgsLhiyGZ21posHSG3lapSh5GnP3R62j72
	 3mkWBAif70UZw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so40641611fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 16:00:44 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw47vALtfqGwlasmL/2jfQ5rM/F2LKtvgK6zhXNDlcJF0UEKnkB
	iJHttYYMnPF2+YVqu7SHIt2vS6mYDjKpRvYqeWmp7Y7RGQQX5wwiZFmHEBnyJihuhpsFDmurVx7
	ZtmbuGkkFOjOuiNN1NqOhQ4n9ZS/Kf9I=
X-Received: by 2002:a05:651c:1a1e:b0:396:7d37:b2c9 with SMTP id
 38308e7fff4ca-396d0922d46mr50223071fa.27.1780959642953; Mon, 08 Jun 2026
 16:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780909189.git.geert+renesas@glider.be>
In-Reply-To: <cover.1780909189.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 01:00:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLnjwZhrKAuwP7mve-NgOy0nVYP591HPd7rUb7eUnhJzxw@mail.gmail.com>
X-Gm-Features: AVVi8CfrdoExAzOy97elpH5G6LSf9L1Y7bwbbqDZAWmtu790WAQPJkW48b36SqQ
Message-ID: <CAD++jLnjwZhrKAuwP7mve-NgOy0nVYP591HPd7rUb7eUnhJzxw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v7.2 (take three)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38137-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 597BF65B1CD

On Mon, Jun 8, 2026 at 11:01=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 80538a53978bb9788080caea6e5ee3393dfb6a=
72:
>
>   pinctrl: renesas: rzg2l: Use tab instead of spaces (2026-05-28 15:07:29=
 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v7.2-tag3
>
> for you to fetch changes up to 14270179806b876fecefcbf35905e512b56a5867:
>
>   pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source upd=
ate (2026-06-05 11:44:54 +0200)

Pulled in, thanks!

Yours,
Linus Walleij

