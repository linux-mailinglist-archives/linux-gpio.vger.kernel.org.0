Return-Path: <linux-gpio+bounces-28074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB7C347ED
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 09:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397863ABA82
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 08:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED73C21CC6A;
	Wed,  5 Nov 2025 08:34:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177971991CB
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762331672; cv=none; b=oY0mhVQH9ckc9XPkuXhWMoV7S4ZwrCtNiycnpk09Y6TMu1MLR62oUIhNmMgI+2RQx4k/uakLu8zJdPyoHGQMaNVklLGWt4u99KThLhM7sPSOXJjEBP3L94Y0K6zbUd6qnmSXNAxMNkefzZrnHUJvNsUY1j+PF2kif1adXNxTAvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762331672; c=relaxed/simple;
	bh=34nlR0Av3gx3vsNVLYrgniOq7mZCBds1+QKg++zruvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJFVAzzjdlLPcWZL5iOV3OXAB9/ipuPALmnLMmO/syrwYx2HDj1hXQvugBm3AFaWNpG6O6T55GcaSVmmyEbKpcu8XK3NU7tsTIksuZ6SdyoAKn/QF3sp1gIqXuxZn6NC+HPl4DPqDGsbT6Lrh7tjRoOQltKJKxNQg3NBzQSGN44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54aa30f4093so2288254e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 00:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762331670; x=1762936470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WMJlMq4HlepiSD2fmQ9BHOR0R49VU9iznpl8dol4Xc=;
        b=bqzpgMMD224VrRRIiJxxEpFAYnoeoEGhHqwvrjGGhb6yYloNAGZc58WOhM16RKuBDl
         F1FZ4GcWnkc9V5x/+ryLS7v0Zd8zxwoht4mU2051SFgZ0pYajSjvWkyJZgB0L8+qlnkG
         I5Redg8bk0h57PfxQil+lj610isR6ouE66fFhCuxzRPUoCqLNlnTVWnwytSGHADoVJLT
         GGhXBjfNs0C5/OhQzwm1UKuZP7E8/7vLMjjeVRrmbwlr1qR+QPs/mZ8sTYgeOCFpdCH6
         dMpe42uEPwdt/xBXYWBMs+J4PtqDZmWHI3kS+ESz2svBQ2ArKLJyRXcptCU6x2iZaH3v
         0U8g==
X-Forwarded-Encrypted: i=1; AJvYcCXaMzgoWV3gRlyGQUXT8oCzVWrjBCYVbAkj3Gl8wuIs1go11pn0WusECQjuwan2qOD7+Ysunjq4HrBp@vger.kernel.org
X-Gm-Message-State: AOJu0YwIga01WDh8IPZyfjK6xJKrzfkLyBIX0XHf3xBuuTDBoJB86kiG
	utHaPIMTiBBG9FyIgrWsZ7T1dqGNjlmcHtxbZ1TmQyHrw+jftXtv2n2dQAy7lETk
X-Gm-Gg: ASbGncsropjmb0gEOuBJ90JUEMb+D/SESMnzukhpxDlIteRume0GNThdUNcgLLlV1PZ
	nhuFZtteTUvEjHu+3zt4bLOUfjCdTM9PS0prA6MJJX+L+PDe6mqdCkPEVIV+jUuSj382l/fjzdn
	pWBz7MvLdRqB4Ab9W3ERawT6UPCFMXfrvKDwzFmlf1HdwWuZJSNb9ddu7OHE28QeXwNCDceY3hF
	g7qzfbw3vsRE4X29P4t1qejBsg13q/pUvUSXqtgzaGtW4iax9Db+1K6qLj0oBm2P8rbossU6lvJ
	yMfQfJMT5IL28jyV5JNJsUOFbvon7tgxOsBNc4NjT1yEBllpAvlniNt1QPgo6wSH0hNNF1kdFSU
	haKbVkW+HTUhGk4zYyf71lLnb0HTislLAzZLZKaCZ6z1CV1va7N/UttedidpYVEUdiNnteinyt5
	Nsy6+TUIPJ+Io8UngE3F8an6dcfEa5n2dOqiNzapRyrA==
X-Google-Smtp-Source: AGHT+IEdKaPIFVePwfpQdS5H14NZ0sqTRAweATIxkM9FbIHQElSQsKqB6lLnwfclhigFwoHGdnYBmw==
X-Received: by 2002:a05:6122:ca6:b0:559:7394:9c34 with SMTP id 71dfb90a1353d-5598624baa6mr795928e0c.1.1762331669614;
        Wed, 05 Nov 2025 00:34:29 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55973c9992csm1978886e0c.19.2025.11.05.00.34.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 00:34:29 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9352519258bso914078241.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 00:34:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeiaHXkzWnKQCRynvFXtUEh1ndjTybooOg2OOcD7iKV1EVCjee2Cn/I5A1OXweiaih1+vZRamBoiZv@vger.kernel.org
X-Received: by 2002:a05:6102:5093:b0:5dd:8819:e687 with SMTP id
 ada2fe7eead31-5dd8923db9cmr660276137.31.1762331668673; Wed, 05 Nov 2025
 00:34:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762274384.git.geert+renesas@glider.be> <77f9efe5388f2801ace945b7793d4823618eeec8.1762274384.git.geert+renesas@glider.be>
 <c9646952-1789-42eb-b7d9-b12915f77f07@mailbox.org>
In-Reply-To: <c9646952-1789-42eb-b7d9-b12915f77f07@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Nov 2025 09:34:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_jdCEE_zLfoX0SpfBBFFwFRscQ8tYskTbAK00jJCrTw@mail.gmail.com>
X-Gm-Features: AWmQ_blsUEYyxkjPzCCn1rrSFlAwZ9Tb7iuHmnTuFch7McN-xfZ4ph4p6lEc3A0
Message-ID: <CAMuHMdV_jdCEE_zLfoX0SpfBBFFwFRscQ8tYskTbAK00jJCrTw@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: renesas: r8a779g0: Remove CC5_OSCOUT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	huybui2 <huy.bui.wm@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Tue, 4 Nov 2025 at 22:41, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 11/4/25 5:59 PM, Geert Uytterhoeven wrote:
> > From: huybui2 <huy.bui.wm@renesas.com>
> >
> > Rev.1.30 of the R-Car V4H Series Hardware User=E2=80=99s Manual removed=
 the
> > "CC5_OSCOUT" signal from the pin control register tables.  As this is
> > further unused in the pin control driver, it can be removed safely.
> >
> > Signed-off-by: huybui2 <huy.bui.wm@renesas.com>
>
> The real name is 'Huy Bui' instead of huybui2 login name.

Right, I guess it is appropriate for me to fix that up while applying,
here and in subsequent patches.

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks!

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

