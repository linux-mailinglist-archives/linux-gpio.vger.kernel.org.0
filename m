Return-Path: <linux-gpio+bounces-37592-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN8qDwsVF2ok3wcAu9opvQ
	(envelope-from <linux-gpio+bounces-37592-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 18:00:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A65E7579
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 18:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26751308ED66
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8093937E2E7;
	Wed, 27 May 2026 15:51:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0933D544
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897095; cv=none; b=U9+2HF+hx03T16q5uCDmbat6BEkyrm4SYc1SHZOht4fn+GVclD4YHAHtgzbMEP5K8KnpoEFrw1Rh4ds88fsgpNtyTKdN7vVGAf3JBVwlPV6/mzMbtCUVKOf9Kb6kGemuImcuN4K+H7/CdYWdPUVm7EE1jQfiY1qCdMqCF2nFYDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897095; c=relaxed/simple;
	bh=qKbkZMJtkt73q6MVdq9NtMxASPvqyv84AwgiiThd+7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwukxSUyM2/V1iBLGsh5KQz9vWU9M8SN7dCrkKTx0KSl2Pa2TffliaLQIi6Lv8JFYv8etwDt9JK4C3siPqC1Liv/1LFsX2lGmKdOBcBGPhdsSmrnG0Xa+V8g8XLv3p6+lUGNRMVtedlVt1suCvxA/FtXaqbSsByv9BnX/MhuCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-631466587e9so8922464137.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897093; x=1780501893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2bh+b2FSQ4S9tWiMljtZE1x8DvPABI/MvIYcGMABymU=;
        b=mfIEqaqCsh6u6ttp3Vo2d2aKLKW30TVXavyf3EbszFAgo0Okm6KOSba0+z0q1ZyQd+
         2AXLu0sHsC7jGSFPj8OW4roavzpnNDMv3sD28XiA5sJRdAEiZsRM14mi/I/pNRItgT0W
         XBhhSq14sxBRAX3b6qLz21qV6klvwokweHIMzS3vWrHGMXAk7zmuw2Y36228Ko8j8xdQ
         jxmZbooBfIBc2LaUOX04TY5gaZrpBtgcxZlIdPKrXP3C7ud0oOq/6lgHbIclEwmdLYyx
         WN//MYgJa8AW3jYco9tXmtKaK5vPWTYNJvBquVuxWoizWyAKVUSrTHZbN3omnlVkrTO3
         H76A==
X-Forwarded-Encrypted: i=1; AFNElJ/CTMKxafawafI1YaeFB1YNbgQWsvoCjQ3huKsfFnWEyxP/AJVLXk+13tqxKgFTVHc1u1+t72rBdHgp@vger.kernel.org
X-Gm-Message-State: AOJu0YxmR8s8pgQtt7geUXKPjqKPWG1KvW5nwVw20caRzqpdkfO7K6tg
	X8JWkDemGgVwNhDZoEdVxTuKFDHZYA/P2EvsSD4BNleX5H2e00GaGVKMQKU9HnY2oP0=
X-Gm-Gg: Acq92OG3leiCTDmbVK/Sk3txIWu0qfxsKLGJlnAciklmDTs0v8fbbgBf4KlApXzQrNn
	MuRfMp+UH8PTiKhy5/r/6AVjhGUYjmAkFkU5KJXXNaFS06dZr7ZSECAj6Isfqz2/ssP0P6ESgUd
	w6sqywIkqTVaYXy5knNEg0iIpGOMqDcb7jy83Oo/5sJbJWuXxI5TlO0ZlddplTFMtRUCmNS36hh
	JUc/d9+ecejd3DzKWmwpCO+0Be5BapsAdv3ac5EgkvnCxTCZzZewvN6Ix7daN7EIaZiZ2XGuZT4
	EXA9kaSCU0NMjpeFkG9PJY0D+nS+iYFkmiTqcz9o7dN5DOZtj5009wA8eLK9u0cBy/w508V41DA
	NbsO18a2cvuxrTc88ASCX4X7I+pr2HXHyDeMjThv5x6MwJegQ8CHCBa+0Q9o/8jKNm9CEeb/5EX
	LR38erYcJzQdA5DLEhpcb4/qj4ooFk6r0GsXIS/a009nAUJZVhA+nddaEV6ZBi
X-Received: by 2002:a05:6102:568d:b0:631:81d6:e152 with SMTP id ada2fe7eead31-67c60e899bcmr12751734137.0.1779897092914;
        Wed, 27 May 2026 08:51:32 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173afdb54sm17570477241.8.2026.05.27.08.51.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:51:31 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6313b7e3d03so7803467137.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:51:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ883yjrBX3ogIjB2rPkpVk/PSYPYk/vK+7o0BHnrxcvqRU0ScKtJ5RZPSMuciVHkjXQRzSHr4Y46mRw@vger.kernel.org
X-Received: by 2002:a05:6102:1494:b0:633:34c6:6ace with SMTP id
 ada2fe7eead31-67c8293fb73mr13015180137.26.1779897091174; Wed, 27 May 2026
 08:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779896151.git.u.kleine-koenig@baylibre.com> <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:51:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkYhoaN80b2xXvNLqwMdFgJV7cfPj_SPUea39Ft-AnqA@mail.gmail.com>
X-Gm-Features: AVHnY4JpYSaPlViJEZLn2urWPttxXKooTYEBn-cJQAbGcaWZK9sJWm1CqYq_4bU
Message-ID: <CAMuHMdWkYhoaN80b2xXvNLqwMdFgJV7cfPj_SPUea39Ft-AnqA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-37592-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,baylibre.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D66A65E7579
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 at 17:43, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pinctrl/renesas/core.c            | 24 +++++++++++------------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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

