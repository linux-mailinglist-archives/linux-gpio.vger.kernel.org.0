Return-Path: <linux-gpio+bounces-26539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1889FB99B27
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 13:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2DA73255C1
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 11:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014CA2FF67F;
	Wed, 24 Sep 2025 11:58:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630622E62B7
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715120; cv=none; b=DjJU2uZNWm0BeITc+DNO9Qi77F7/qbS3946XIkbnZyhPJIERl29wtHP6F3RQyI/brWexrjcn+4/eiIPKfxe0GWL5b8XdC2hOnqRgmATFs1IhwqvFAFLorQwxs56BVtsq4CAtyZadN99jeWKAEybshpJiv6Cv1nQYUsXaTaHZra0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715120; c=relaxed/simple;
	bh=CH80Zg8QJziib3a9s+6lE/c7RM05j9no03yn3eyIRBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVZLxvg18DQNYwEgfd63NID6uE49jI3Qv4YgZwWUGaxuhSfMH3dravVyux/drk4vvO8hOUZfVzUZG8bOUqehKMtAVuEas8W7LLiC8jGWEtEMlvvzhB8QVvpp/WuedxuuM+k0KN7XBcphlXhIEumSkETvLeIZUItQEWQ0EW6LS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5a6743cdaa0so812341137.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 04:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715118; x=1759319918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1F+3NjRjW7oCcKmojh3L12WB2Mn5ermgaswG3WtQQkE=;
        b=p91sGgJAblCFf9UPcaVVMMgINI+Aij8JDw2bNx4zwWDdo6nPIGlUk7Y9KqftGUug51
         oJuK2qTFqeRunjL7C9MnwUXHaRFMd8xrrl5c1epXWD7dbtmp51cvA0LQ+kT+1bQhVYBE
         X0iuMbjR7hVmCzN7SlxSXaMX40ua3NN7GcSC/bZDeusSnm1D8VawWJemVMo8YadON9qs
         6/VR7a0y1dOqFdpx6futt5JGIEpjlHXEB1xI+DLEqHZHzK+q5xj1sX8b0mWxgWYP6EHD
         JBPl0rdAMvOzfXl3bXl9d4Q7Uydn4l5XpV9Zoiij5WRJ94BINHa5hvWwhntJLTVC36kv
         E05A==
X-Forwarded-Encrypted: i=1; AJvYcCW26ToBH8WgPbBybJr2rCT2lVlNPgZlOAeVNULADFakIdKoEfNwltMCwi0yOgxhXpozAbpAK9zM0zs4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6j6NaAYteOm5VMa8MDVSvDGT/HmUbUsXHqcmv51KVlYy8TphG
	CA8eK/aJlXK6+TvsNJQOMqqIMEPQmX1z4dRat3IBKdTcG/mCnDjj+Pm1EdrKQGDg
X-Gm-Gg: ASbGncuDOA+Oyp4/cWGT+Gltv6AqMxSBbvVSkbYUcyG8XbsWfZgtfOhyUg/VDgYcO9N
	Ep/x0jEuqOftmK/SmwFOeeJ+6UHAL0/cmUZD72mb0v7L8+zyQ+bCjNQCNIaoRC3evVohISFkSeC
	i0/jk3YYZMasjVgDQfGcowk7NoPoMWQ/wpZ+ZB9VpyFfezUlj7x3QliXDXkD1WhVkgGd2sOQe2i
	aasY3cytVBRjElmqnq5PaSQIJFqXi0zX07mbh95jwRxrlZv3iT5+W3a8vgnHzh0d9pCkCbPtJw0
	1kGq97KwKrfgRD8PL3i/7Bke2G3Qc8crIGBhlu06hwZ0e4LlcJKPCtW1SAg9lf5a773/dvkTWYZ
	UpWFShUBsFjJrOvKVTWfpstVU7SEUb++Kc+81x/g00bsJQKqsCJ2lgzfT9NbK
X-Google-Smtp-Source: AGHT+IHcm5UmKZuzYSl76YOusnOofTcJbnn2MDepMb5ytHCSTpQUZixEA8w6oyAk91umS3VNBBxiuw==
X-Received: by 2002:a05:6102:418a:b0:4fa:25a2:5804 with SMTP id ada2fe7eead31-5a57d4e60f8mr2496549137.10.1758715118216;
        Wed, 24 Sep 2025 04:58:38 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a7272cfddsm3977775e0c.2.2025.09.24.04.58.37
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 04:58:37 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-904d71faab6so2644542241.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 04:58:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvggxyTfdfOnNYFFjQSD8kDcEjUmMylnFwDLEztYcZgsw02qh/d50KBXAXQ4KsWzEglclE9tbCxBc8@vger.kernel.org
X-Received: by 2002:a05:6102:32d0:b0:515:a84d:45a8 with SMTP id
 ada2fe7eead31-5a5800da2bemr2283926137.20.1758715117607; Wed, 24 Sep 2025
 04:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923174951.1136259-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20250923174951.1136259-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 13:58:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdoJsr_zopj511gx3Gb8e3NmLyG4ge1ReZJG9A2SOXew@mail.gmail.com>
X-Gm-Features: AS18NWCEqlWzRSEZwc-etvpzN2cuJ6XqdlAjQdzvmM1IviyM4O9XNmvx6ad4ciE
Message-ID: <CAMuHMdVdoJsr_zopj511gx3Gb8e3NmLyG4ge1ReZJG9A2SOXew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: remove extra semicolons
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 19:50, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Semicolons after end of function braces are unnecessary, remove them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

