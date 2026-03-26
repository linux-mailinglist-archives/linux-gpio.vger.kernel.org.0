Return-Path: <linux-gpio+bounces-34221-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAbmAIl5xWnw+QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34221-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 19:23:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1CB33A033
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 19:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5432130134A0
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 18:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBD93932F3;
	Thu, 26 Mar 2026 18:14:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE97733F360
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 18:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548853; cv=none; b=i1081K8DyOm9XNggMg8Rc84v4yvQLbiakl1fk/eS6Yjwm/owxh6vGLiQ7JjZNESG2Q/BeAclnLa4j0wq4i/nsgJxx41zQBp/bXHqRFuOCEG+FwVPM9Ln5bf6mRv24xZnvvXWzICXmAT36lTHaz4k0okIY7WPrm6K2BE2jXtyDBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548853; c=relaxed/simple;
	bh=76VMedtrZ0Lm+x5KOVR+2lWQ5UcBt0+gKLPvNzCznGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzzJofVLVHF75rp69bKkSQUtE4/ZIF775MGlRhuJyNwzQMiED+0V+cnpABg7i4IlgJBibVa+g3PkkwHbEOi/1podLQ4UWCXmw8Han1srRjcjsk2I1jD0A2kDP+TxvoOfYu6Q2z5KeAgBNtly/1XIBukE3/ikbXODTzRur6Yrelk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5637886c92aso673584e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 11:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548851; x=1775153651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHLUPu/4rF+1oqXhCLWDxxcDFJL1EIISHR05cKMTjK4=;
        b=oba2MfRlzs5r+KujDXcK1SyNBtc7h7U8D6sc87BtAJ6xI4gL5iE9bGLT6Im9Cnvq/o
         nRd0b31H07uEHKgqfar7fWXwAJBOsTOl6podPG9hRfOfbXkbgr78+yLEu1Q2D8tAMhXh
         UF4KxvZoz6Hko9KZzoDQn3QgBMAh+tqFaZdtY3tccXG74PyD4ZenhGygM61PBLTSSp7L
         cmOP45MpdbLZQDZhkWGja8S8kHazywIBePRlrKzJTz3JgdE41Lyxo3stD41uc20FrH/1
         70r2TdP4w5LzxIijnw/RPbmPVJe7RinL7+RhnRv0f1RNDojkovE0mRXxyLufVPKU6dkL
         CVWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCC6TE6deXaX1SQQ5kalCuDyZWr38g7lbZ5zIi5bVaxaudoSgU6HQjmKlIoJiy9kwV2R8steYX4RmI@vger.kernel.org
X-Gm-Message-State: AOJu0YwHP6OWFFR8pCvA5LOyejF3KXHaytqlSRT8ym0tGmc/UCxCOedK
	oBxFjnh5RMQTvjuCNnovh83V8+7BwY4CCrNbm6nXYNZkHBgQDBvpnwN1nro48Ld13Bc=
X-Gm-Gg: ATEYQzwbT1bNk9qhloPNqCLRgGRLDm+GbLFXqOM1eXz4QFIV4bZ7G+yMYobYgxVekUD
	kk4m023aE5+tehf2YIzNlTcKpBZsVhNfwnRyVFOs6Glf8BIMpo9bhpbvb/RDGGt44vF6Hp1u9Rp
	5Nb7i/UEsaKkz6300t94YN9V8ijo54I9Pv7kqwP03iI252UjPvgeDn4mKVnPvLo5Mo9mlshvL52
	MwtP3v6th+7QQF+F2sXrG4kXhtLIxPMRBS+C8tYF91eZGGEdMwgcXXaRCmX7Z4KWaaMPFaCVmjL
	5m+MGWkXkuzEkCYEs1cdV7oyLUD+LzwDo8v28fRmxdiE/UAaGdAYXn2tfDzFmSW8dwUpn/9Z7VG
	TzaGaz/ER3XmaIIEkoOsAei2hmwyZoqYdKXKMJeBPMy3svPjeFa3kZiNYNfi9Dv4S6v9my+7VSb
	c0NS0YXLSHvUpXwcOyp8R+xxjgw/tUIC+Mb7A2bgNikd1Qvy32vfGVfEhsrg8J
X-Received: by 2002:a05:6122:2a4b:b0:56a:f576:cfca with SMTP id 71dfb90a1353d-56d21f3f975mr3826369e0c.2.1774548850652;
        Thu, 26 Mar 2026 11:14:10 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf719bsm5905130e0c.4.2026.03.26.11.14.10
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:14:10 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94e9810221cso348600241.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 11:14:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXg0K4vuzZv7OLACrMZCt0/nWoLk9s9USIlhu7dCKDG4GJGR/l31GsGIgOo4XTboibvOuJWKrDZZ4Ti@vger.kernel.org
X-Received: by 2002:a05:6102:3ca1:b0:602:6784:3eef with SMTP id
 ada2fe7eead31-603872c905cmr3701587137.28.1774548850029; Thu, 26 Mar 2026
 11:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326162459.101414-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326162459.101414-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 19:13:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQrGC122Wq3iUmqs9HnrBWZtXUgLFPkBn7a5dbF3h8qA@mail.gmail.com>
X-Gm-Features: AQROBzDv6QdGpz2y1Tker0_kpChhfFsFmJQK-M4dgnKK-7Xf9ip2061ToeQN1p8
Message-ID: <CAMuHMdWQrGC122Wq3iUmqs9HnrBWZtXUgLFPkBn7a5dbF3h8qA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: renesas: rzg2l: Fix save/restore of
 {IOLH,IEN,PUPD,SMT} registers
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34221-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 7D1CB33A033
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 17:25, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The rzg2l_pinctrl_pm_setup_regs() handles save/restore of
> {IOLH,IEN,PUPD,SMT} registers during s2ram, but only for ports where all
> pins share the same pincfg. Extend the code to also support ports with
> variable pincfg per pin, so that {IOLH,IEN,PUPD,SMT} registers are
> correctly saved and restored for all pins.
>
> Fixes: 254203f9a94c ("pinctrl: renesas: rzg2l: Add suspend/resume support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped pin_off, pin_desc, and pin_data local variables and
>    instead used pctrl->desc.pins[pin + i].drv_data.
>  * Started the loop at 0 so that it covers all the variable pins.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

