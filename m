Return-Path: <linux-gpio+bounces-39034-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hml+ABR4PmqyGgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39034-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:01:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1016CD417
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:01:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iqpwkTao;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39034-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39034-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5B3A304636D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF543F54C4;
	Fri, 26 Jun 2026 12:58:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A87D3F44CA
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 12:58:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478731; cv=none; b=iiyuluoIdr9EelqYF0YGkHVXyEI2xh+HnWdFFcGzkfr6ipABMDP4dOJZBNIBkhul0dtmQ8ukTt4Rlf8g4TEIyVz3vd7Ymyx1nyyX+xddre6DCKeSNNKAjDJ8g8pimgIB4G1ZkZUvjr3oPwcL0zMUgp2NW9komcmj3Ly1pBS7pVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478731; c=relaxed/simple;
	bh=OS91UUSE5LjqEHkQaRweTDP8uzELw0+MCj0rXMg2npg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p04JY7mEJhYkBMGdwn4dfEGPJqYiQnw2FPbXu0ZWziRDMz/NTA6L/gLPenjfF25uM7BBV2Zol7B3GQJaGFRgvusz3oxNGG4VyZ1PKwNssHkTpedz37bjRoapMWNB/0PYs9NeMxstiRR9ziOPHWiT6UJqpxrls3rtvzE/QE6eTIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqpwkTao; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E821F00ACA
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782478729;
	bh=OS91UUSE5LjqEHkQaRweTDP8uzELw0+MCj0rXMg2npg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iqpwkTaogejtT6ZbfvKVbUdOYD1YqmQeTsIhamN/2bYV6EtC0TWyz5d1Vtses6n3I
	 ZG3/faIPO/rEpC5I+i/BuXjI449eU6Ym4OKhCiwtx/hX54xCVZJ7li3XCZE0XIgMhe
	 dGTBXcuAzTZ1O2AZn8M6TkglGJDBSbLOdSZGU5cBZaz3o3s6LNZk3rlSRAklZQLVK2
	 DSikjrUsSdXZl6Dv2MJet18MT+FZO62t6+gpliHYX0fS3NKMPChGYdu4LXk4hWEn3x
	 reHUnjc+g0VRSN0GYKpDV85lV6PbEtsd3y2diMG/eX6g0B0ZSXKlSzaKW9rpEw7t06
	 gGReW7urfAptw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39977ab0562so8940701fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 05:58:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqrln4z8lMDcHtLlsmO0jGqx2R3OyWxTB2sXyLcTr7dwFwXobmYRUXwHco3s0kl7QEzEQ7Gf6ar8vs5@vger.kernel.org
X-Gm-Message-State: AOJu0YwniOngyNsb/JewuVLNqtsefgSxZHOZml33emrLdAbWH87v0C04
	D/swU176fzGoHsgAl5jPignn//Y7cPyfofHB1q6HSYsbeQoeCekOtlGHimEMZ32hK2M0TfCewi6
	7Ma/Q2r+LhFngH4/rHktNYxFuyYII29U=
X-Received: by 2002:a05:6512:3f19:b0:5aa:6302:5718 with SMTP id
 2adb3069b0e04-5aea1f430e8mr2434186e87.13.1782478728736; Fri, 26 Jun 2026
 05:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782389357.git.geert@linux-m68k.org>
In-Reply-To: <cover.1782389357.git.geert@linux-m68k.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Jun 2026 14:58:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLnme9So3j77C9ELdon=4dmGEeBKYj80r2g9MoJXw5XApw@mail.gmail.com>
X-Gm-Features: AVVi8CdEmkCVzK9XzMqYnl1hXuqY8qAJJ0nZBuaUqgCHAKHeFp0Biu0iIjX6_Q0
Message-ID: <CAD++jLnme9So3j77C9ELdon=4dmGEeBKYj80r2g9MoJXw5XApw@mail.gmail.com>
Subject: Re: [PATCH 0/9] MIPS: TXX9: Legacy GPIO interfaces cleanup
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-39034-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F1016CD417

On Thu, Jun 25, 2026 at 2:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> This patch series gets rid of legacy GPIO interface usage on the MIPS
> RBTX4927 development board, preceded and followed by some cleanups.
> No blinky LEDs were harmed during the production of this series.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Sashiko is asking you to fix the entire universe as usual, I couldn't
care less.

Yours,
Linus Walleij

