Return-Path: <linux-gpio+bounces-30887-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IEuOFnXcWk+MgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30887-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 08:52:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0AC62AD9
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 08:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A20DE389BDE
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 07:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B1547A0A0;
	Thu, 22 Jan 2026 07:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrWG3M+e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CAF33C1A9
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067935; cv=pass; b=sdI7tup9O+YF3uLwqOlel2RO3IvB9rsrob9MerAhq9ZlkpbZ5Y4+fePN/nEIyQfeoH3dP0SjafdW4hsjLratwen6eeb1lrlbskBm37dXSfObzLOb7JWMnGZykN9ow7/ItooxlcJvDUzQwcdDWXWZztQULo+kPK1BalGUbg0Orak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067935; c=relaxed/simple;
	bh=kcdMMEePmPWwsl/oQQMX7alOWF91Pg6xPOx+KB4E3RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEnL8qYNoK9w4QYJrMrXtX8z3DZ4L9palaDLWOuLCQJNZzEavE3m6MKrKmzXVhoYA7J92c+pJSTpYFMs6ZNVr1NH3WIxDGs3cz1FwCe2QcUqrrSsspQy/ukE2c5Xekpjm2unM98/Tju2ZuoGwnf0J0muwtakCEpO3r67uN34dks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrWG3M+e; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so1016288a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 23:45:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769067927; cv=none;
        d=google.com; s=arc-20240605;
        b=FwoBYXcUcaVl7GGvvpFmID4WQ9lAiszjQ67PMqIjAepXYcBoYIAXLyl2SBV08MbcMH
         PXBqSTqg2JJnrli2YkgafmhSIXKSVeeVbmpVZW4xLvpxROb1TWpmFhpUKYA0m57Qn/yG
         9Asl+sEku1bc+SwE2dypFvzTeuKJcc4C01NYeyUZvBEBfKzxfqM3v+A/CafgiDx62+xs
         CiDf+fxRRtsRgGBwZKHns3mnLnxMRSVtiWVORSA/dfmIktw5OiyHbcAf8t9wNLPtf3dB
         ipk+0IErH+k4biwOAqOHVkQTejV8TdAHibtq3D3SsKc9k9MSFwIiYhlmFZII5ckjirXw
         oTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EFGHcstC2p5i5Rnbgkl4MqcI8PeiMZ+c7LYfxJtXf7E=;
        fh=kUVv2RybzjYSrmMzGhaoTvv+e61/wevU37JT5CRBepI=;
        b=AuMD5xBJhs4HUdU/1yOh/bwnMrt6Ko1Vju1H7YLgjgmu+Vdgqiq2POI0W5ImbMqFjk
         ixuU1Xq/Rb0Wr75Z17CMYFDBNiMEdeomp5GwREiCNvufuGkeWEUJ2f1lw2T+NP7DzUGo
         GI1XucznjBVxIMUnqIFcvwq2PQtS/b2fHyAI6GoWwQbPPf/oFPbl8zwJsfWgwjpZBhjA
         nQqj9PWqW5+sBuvvPEto8UZq3UuM1Pr9BiLkfXmU/kSycG9LejJH5whOO9rHx85wRKma
         hBhflTTOCRaR7KQzVlVA9dgg0tBrPXmVj2LZbJjMTBkzaBl8r+Gn1hxLUQAbVYfbO6Qt
         hF3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769067927; x=1769672727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFGHcstC2p5i5Rnbgkl4MqcI8PeiMZ+c7LYfxJtXf7E=;
        b=NrWG3M+eJM7QrfZE6wKlBA3LwnRqeGBV4NH0vDH8ESG/mjpBEfhrPtKJhV3xy8sIQy
         0ZDN4Ma49VbQWJZzpQYNPGTQEgMQxR85Xtobx8PE/5Cvf0cK2kSWimt8uSjY93kz++E9
         +555HfrTeoBO7SF1zdB1gWBiGNnAw4QGr62HY0qsVzb6eAfYvLNVN7jLCL6ObKpEuz4i
         qNQnhvcEhk6gEuy6t5V/zKYB0Lua+A66EROMI0ZJNMoe9nTkBNiLBuDiDp/vOgeluxzx
         mvcUTE2mfjq5clDgZuVt11DeMPL2uYzAW0wefH2gTc65NdOWu3QPdmvJvEsCplwLBHsL
         mCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067927; x=1769672727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFGHcstC2p5i5Rnbgkl4MqcI8PeiMZ+c7LYfxJtXf7E=;
        b=UkNkVTxq5anfUISg9xZ/6nodJSbQjR5z0oFe0SMXkHwn7q1sPVfZ17FHb+L6qc73xf
         5gQMdQ2m0RGtPsE0A1q0yfa9iCqByfbTzkgHaqcfpLPVZ89oeRIQDebv3LOSMgH3rlHM
         hdQ5zBzp+R9jgjF4avshiuHGjK7CeJNT15n1vozLjLDUQB+oQlqdfTVlG/vwxJNEPcL0
         OxVjXSmYPTBTg+2iZK1vRjTsnaVYjSXOeiTGyvnGR2m3b1VMSuQVbVXrYozqHT4xvlBM
         40CwXLXqYBK4xyPwocXEwPgbzO4bWrzxRrUgjLhIMCTbekPvOs6Sev78Vav0/AGyb/Ou
         R8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWMOA+AD86kufoiNW3cLIOW+KXe4zaBS+aoPRDkM0MYUKJI78WLoPlvVdcka6ZZvFDdth+KcHHTjImp@vger.kernel.org
X-Gm-Message-State: AOJu0YyRkix8nUavaq+BgHQayrer4wK2oDnk3xwTPPPLGuQqtwQLw1M4
	phJNGa1n+Sh2E1A6H9xHNh1d1azDO9YVTZ2STKo8csYuhjYw5L1xrPX6YUYrBmuTfcOrPGoEZdw
	Th71MDtYQVCOZ1J5+JORMBjjgcHDY9bg=
X-Gm-Gg: AZuq6aIyPGIt/y6RU+1bWJOM3P/kBZ5YHeELv0seO4Os7pzAhKA76ao3B55l10FQJyv
	zTBo1kTyuPkhZYHQmTfaGpNpYn7Yjw3HapQH6589WtCnF2ce+li7wURlfzgoEQaFNl/jRNjvq/s
	MbnIVGifoDx0ovHl36g4kMfJZj57s0meZ8x8NzxxgkFyomNpae07e4dx7nbtAn7RvHocWWaruJd
	p6bx9sMtuUZjtOvIrgwqlfAjU2bZS6WpedVzgpuYls4vO9S9b/vYR98sCSpdUgHkGwGw6A6Rb/R
	oS5egyf2dwQaOuuJQKV1l/rRQrS3H9ML0U6+ZOLbHJsFg1gN9WDVcZSof5pRxh/j1iThgVSy6gW
	IuFnrSw==
X-Received: by 2002:a17:906:dc94:b0:b87:31b5:d68 with SMTP id
 a640c23a62f3a-b8796c137aemr1598800166b.65.1769067926666; Wed, 21 Jan 2026
 23:45:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com> <20260122010516.1200630-4-florian.fainelli@broadcom.com>
In-Reply-To: <20260122010516.1200630-4-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Jan 2026 09:44:48 +0200
X-Gm-Features: AZwV_Qgm_3igw06Hxix0lt5ONLXFKPF8H-PgfUJ9mf-T9zeen77Y_WpXql1l6r4
Message-ID: <CAHp75Vdyfq_9sCY0t8TXst6XhcOM079y2zYprSZDX4_GTJL6AA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30887-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,mail.gmail.com:mid,broadcom.com:email]
X-Rspamd-Queue-Id: 8E0AC62AD9
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> The classic parent_wake_irq can only occur after the system has
> been placed into a hardware managed power management state. This
> prevents its use for waking from software managed suspend states
> like s2idle.
>
> By allowing the parent_irq to be enabled for wake enabled GPIO
> during suspend, these GPIO can now be used to wake from these
> states. The 'suspended' boolean is introduced to support wake
> event accounting.

...

> -static void brcmstb_gpio_quiesce(struct device *dev, bool save)
> +static void brcmstb_gpio_quiesce(struct brcmstb_gpio_priv *priv, bool sa=
ve)
>  {
> -       struct brcmstb_gpio_priv *priv =3D dev_get_drvdata(dev);
>         struct brcmstb_gpio_bank *bank;
>         u32 imask;
>
> -       /* disable non-wake interrupt */
> -       if (priv->parent_irq >=3D 0)
> -               disable_irq(priv->parent_irq);
> -
>         list_for_each_entry(bank, &priv->bank_list, node) {
>                 if (save)
>                         brcmstb_gpio_bank_save(priv, bank);

>  static void brcmstb_gpio_shutdown(struct platform_device *pdev)

One more thing, how is "save" being used? I can't see it other than a dead =
code.



--=20
With Best Regards,
Andy Shevchenko

