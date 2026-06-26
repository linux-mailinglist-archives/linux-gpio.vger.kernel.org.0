Return-Path: <linux-gpio+bounces-39036-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8+CqDWB4PmrRGgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39036-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:02:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557C6CD44F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:02:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39036-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39036-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E1E6300B751
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 13:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA853F6600;
	Fri, 26 Jun 2026 13:00:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E944F3F65E7
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:00:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478845; cv=none; b=JDEVkGHNKcTxZ/Ef2wEvJZOoZ07TzWCfHCdz31IcdWawTcgrLiJxh5i7ZciwFQSpgEAr4IFTrsLt6DZdgVDstUuzAu403h1wU1dllz+NfmALC/UO7s/TXFTgPtoFTDzPeF+qFDhq22U5NIeFvJOM7TQGEkbWUeWRxa0TYCE67fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478845; c=relaxed/simple;
	bh=4F1/fUwt1PVM5XPC7LXsjVQ2Hci6TjH03w/Ot4zQN28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfsv0FTtkxQA0CoMEouhTxlL3RcBApOwP6M6Ok2HpaHBgWdrcfFpwHN8E52fbDP5bQhfoUfWIu/iMhFho0Kf9MRRIB3Il/TCPIF1BVT7ogoC9I7zjkMA6cc1m+77J4sfn5sEoIXx8wOUmjfCwJhkBx1o9JvgObYn7bC+vxoy+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-963f63fe025so238603241.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478839; x=1783083639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXdTYWIi8vqe/RDHU9rZqOBRL11YTZO/o5NnreBxgV4=;
        b=PLoxz3313dXH5Uw7CsdvnXPrmIYtC9Zbm4/prYLISzSb4dxsx3qX7ATdfhCh6f3KDl
         cGSb1SyILeHCJlc5Zhoy9gjT4e6T04rgQ2YDAJHFlLHKtvm2z+U2jfNY8RVsGjApxEmt
         hDI0UXnCZELo+LIw4gGDCOsCTgyAJeCKUmOtafcreOpo20bNd6z2teu/VqalB2tol0nU
         1197YsKWkwdYwfQlu4462CCTah4EKZapUdhrDrb1D2hxD6smmGmG3rpvKjJAf91qKFbA
         6ZAv9N7zPk++tcVwqt58cFqGuWUPjumXNpX1EXyv7m5anMb7wQ2uY1JhWd7ui3JBPSh5
         JBYw==
X-Forwarded-Encrypted: i=1; AHgh+RpMa7G4XB6gMyD9PBkU22yabmlZiXGVKbxauEsq7lExcp/LaFNxd88PX8BzJt5W9mmM2OtbX2ClM3Tn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/tdx1PMDbFNUE7KU6HAT3txFvWergo0L0fyKiBSaU05SRUAk
	8oReFbTAMt6Pi+uFJ9sJTPmpWLw+6zFOdIcxA3wBR4QWrIOeVjay4l/VORAkIR04
X-Gm-Gg: AfdE7clN+9Oec/Jzbr71QWoJu3KZfvkj+cetmxh/ymGf+VDQRY8SNwD/ze5yokY+ySQ
	NXlcWdRJWETPryPakPtq4nVAMcv89+9FN3QAmASEZ0cvI8+C6jXRUqEon2x4aPTEjNr69nwxXZg
	XXE8kgMwF8f9fn/PEqoxB+BEmVEYz3DibUBaM15jrq3sp37aKV4hAjisXwCSetLW0H/mRzqEYki
	frKbE4Nsr7D2E1uzQg5GlyqCj/uTwevDtfjO17O5dsWTAspTzEnV7pasZlq0J0Ro/BNp17JZvHp
	FrSpRUTI1Kd0iQiydMdbSDFRYuHASjM7ywbG0QjFO82teWN4n3QIO2HokkiwNmO458sHbs6mnm7
	sa0i2XcHLaz7Z+mVt0Oyuj93WZqOrrvJinApTRzgEZKORsmU5U4bdVjuTYAWUGGn/xpcLR8UuOK
	Tr7KToyMKQFEvpi5JepGvF0VucnO7lYxUDV6P3UXdcH6sTtYG/GQ==
X-Received: by 2002:a05:6102:54aa:b0:612:21f8:5afd with SMTP id ada2fe7eead31-73434c67027mr2844221137.12.1782478839254;
        Fri, 26 Jun 2026 06:00:39 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96916e27b87sm989995241.2.2026.06.26.06.00.38
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:00:38 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-73415614289so418685137.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:00:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roa7V7Ig9xKSaZWpyjP7wcuRZs8v6a6uUpqm0j0rvfjdQHn7HlPKR7PQWDYv4nV1g4KOBI5J4QkovI5@vger.kernel.org
X-Received: by 2002:a05:6102:54aa:b0:612:21f8:5afd with SMTP id
 ada2fe7eead31-73434c67027mr2844188137.12.1782478838038; Fri, 26 Jun 2026
 06:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782389357.git.geert@linux-m68k.org> <CAD++jLnme9So3j77C9ELdon=4dmGEeBKYj80r2g9MoJXw5XApw@mail.gmail.com>
In-Reply-To: <CAD++jLnme9So3j77C9ELdon=4dmGEeBKYj80r2g9MoJXw5XApw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jun 2026 15:00:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmph4pbN_X1HNsnED1rjJr-=w9X9Zddt1hFx9uEiXhSQ@mail.gmail.com>
X-Gm-Features: AVVi8CdUw_1X2mjYstfkXFNzWlyuXI9YQXUk3v5YVf-hEzqqrdCu6KGj15CenZk
Message-ID: <CAMuHMdXmph4pbN_X1HNsnED1rjJr-=w9X9Zddt1hFx9uEiXhSQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] MIPS: TXX9: Legacy GPIO interfaces cleanup
To: Linus Walleij <linusw@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39036-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:tsbogend@alpha.franken.de,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2557C6CD44F

Hi Linus,

On Fri, 26 Jun 2026 at 14:58, Linus Walleij <linusw@kernel.org> wrote:
> On Thu, Jun 25, 2026 at 2:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > This patch series gets rid of legacy GPIO interface usage on the MIPS
> > RBTX4927 development board, preceded and followed by some cleanups.
> > No blinky LEDs were harmed during the production of this series.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks!

> Sashiko is asking you to fix the entire universe as usual, I couldn't
> care less.

Feeling lucky for not being CCed by Sashiko ;-)

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

