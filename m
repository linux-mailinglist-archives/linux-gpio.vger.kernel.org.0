Return-Path: <linux-gpio+bounces-36301-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAzEEVlh+2kuaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36301-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:42:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 075F24DD767
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7EF9306A1B8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 15:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571653FADE2;
	Wed,  6 May 2026 15:38:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70C63F0AB2
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081919; cv=none; b=TT+eHvxrQY3gUeo+Bd+/Hxhk4nIMuoUn+SZVBw9LH7jy2MK7jfzWtkSy7/ygr5mizzPC4ijsDGXEQYTDaeIsAKJK3IlpFFm9/ViMeaLWfdQcUb+jtOzAzZGPMAJic7ygxJ9gYvtTdtjUDZqH9uh2WxMk6jrDlbE+vzGZRfq3OTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081919; c=relaxed/simple;
	bh=mK4RQvudzSfHDKsOsVoyt8Iw5IZ1HXhGx8SNTgh8YWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dy31bsvmO/QcwK9XgNnl7+y87km/fPzW3j5wQOuQcw+EF/38676+mGmTMfTw32NrMt88iZsVn+3CXzxayYtEiO+WY85tczSm86GDsv5V2Q46uViFb1sAxgz+swgxAMUQF2PqSP3pCNJ1OClhxK97sVJDdZffC29G1D3aGf9q1D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56f70865797so3566899e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081917; x=1778686717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiPvar8b58lM8s+EHxxzQhZuLn8K6vNLqEMxBWnkjCU=;
        b=DlWEk1x4ZTyq5Y/0hRNbDADYMR9snQ8zyTvoi7f1/rKNpDilFSJU/0xIX2Jn70LexS
         r+HAhsiILiRI3cWAST062DHCr7iR1nCVFdfsbj7JOI3CFmJH2MWIL6jYikQ857Y2BPdr
         824uq4QA5xKTXekr70IlmT6yuqQPyh7nbSBMe5pEOpSiZeFCkroGJHMkz0WpVCmuuya6
         l458KiRoyU6dXSJGD78dzNQI55q2mpIeguppOl+2FrN8JsHIujw4gyeVZn/dudIKNT9N
         P3wx9MVwO0Mw0Sm4R9hk2jUdIRtS576lTOjRSUucP8eqJ4TD23/xuUz9JgWPIuGhT5Gx
         o41Q==
X-Forwarded-Encrypted: i=1; AFNElJ+yu0RY8B//15zHyGgLUoi1NTTYx7FWwkzn6mJB8QEBm9lU6Pw0aEQ+tJ/KaXnCklwRJROLf84snKPS@vger.kernel.org
X-Gm-Message-State: AOJu0YySa6l8gwWOh7GMJA4U0N2GJv7IqfUzAQRWnj43SP3yHQvzS1RP
	uECRcwYkhKCvP+rlPEQ6bO9g6FMlx1TDXmb/jzN71+CDx6AcVWPq/gG7GyBObhQ87ZY=
X-Gm-Gg: AeBDieuXVTAwtqfGTJ/InocPSgfz6eBAlp8fE5Z281gZ9acKMZ5HnkKRWoEKm2LstdF
	A1e3QN5xVmuOZIT+ELCrMOk0KAbDJ/az1nlmYbCoLlH9GEEs7Ae4oEPuUjRExdG7d90hqRvcPUx
	YpqaES4DaJ1zMnCibnWA59teWc1Ot3BCwMLaVMVMRzfZ3W/sqsmkfmjLYFWn5z94DYyeHJqccP7
	YVblOk0gACLwhRPzoeIFdh5uKitZ9D9Ppj1WrkxVuEaKbSxuB7RWkZkybsFC+8LlWVNWFLYLZRC
	Wn15E3soLTuZNnE5OXxf7vH4jMeSRvR1ASoW6+1cb0pFTZ1RAQDbP+Wlvm9xJypt5udEzl7fC5A
	NLdZfADs+3C42D4HbEsXFmFZgIoo1EP9cM78fGwqPtTTcSkInigNZLDg2ZRTD53shIdlnviolCS
	nlYkulk0wEO/Lwr4PLeRBa6b+n0xt+j31/PP55Sz3W45j2Mfm0zq3Avl7jAbm7hS4SGy5DqeE=
X-Received: by 2002:a05:6122:3d01:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-57559517fbamr2241118e0c.7.1778081916783;
        Wed, 06 May 2026 08:38:36 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5752425a19csm6769928e0c.10.2026.05.06.08.38.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:38:34 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-95cc3522c40so4131957241.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:38:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9o9q1b6KtlvetgI33FAwrk56eqqQAJuwKQZr3ap+K55uJlmU1YamCBHBYlM/YS4F6FsDPrU1nLn9aw@vger.kernel.org
X-Received: by 2002:a05:6102:948:b0:613:6b44:3fad with SMTP id
 ada2fe7eead31-630f90367e5mr1751467137.25.1778081914401; Wed, 06 May 2026
 08:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:38:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUQonMKppURhOpuewET5v9=dqqbywtRzn5jNBqPdFFuQ@mail.gmail.com>
X-Gm-Features: AVHnY4JsU8xfdNxfBXAX3UweYeeFn-aNk8d9aeafTdrWsa0-SJ8O5YDm2A2HTXw
Message-ID: <CAMuHMdVUQonMKppURhOpuewET5v9=dqqbywtRzn5jNBqPdFFuQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 075F24DD767
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36301-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,microchip.com:email,glider.be:email,mail.gmail.com:mid,renesas.com:email]

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add documentation for the pin controller found on the Renesas RZ/G3L
> (R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
> more pins.
>
> Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
> numeric ports.
>
> Document renesas,clonech property for controlling clone channel
> control register located on SYSC IP block on RZ/G3L SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped Port P4 as it does not exist on RZ/G3L SoC.
>  * Retained the tag as it is trivial change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-pinctrl for v7.2
and renesas-devel.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

