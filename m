Return-Path: <linux-gpio+bounces-6564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC158CC0DA
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 14:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFFC81F23DB7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 12:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B5F13D53D;
	Wed, 22 May 2024 12:05:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747E42E419;
	Wed, 22 May 2024 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379534; cv=none; b=bWT3tqu9HsqAE1BiStZkzR7Oi2c+VuTaSQssZ8joz/D2pJoH9+4aHseyIInabRISWyGtqg3upULiazsrc5DXMqq+nkLeiMSIydziQxmvOKcukcdwNHhvmFmeSobcsXq9ksqnnf/OgOMZgpXq+cgipc4mWV7thlqwLQnrORClj+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379534; c=relaxed/simple;
	bh=7y9vClOkU7FWL+oFpmG0VlpA1FZaoENIvh+QxkS8kRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOHkdqN9fHYbwkIMMdc2W3lUwj0G8p7xF1JeAbIYm/fuA8AVTLBmS/7ugxN90zDxtm4/sswznIuRCtEBUWVGFBLx3cRlr9Le9eOjHU6JjLASWFhK5kWkvli09M5YPhqIuEIoeqE5oL9AG4bt/UMUQmPAp+Qw3/vn8dDdUlHRE5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62036051972so52245167b3.1;
        Wed, 22 May 2024 05:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716379531; x=1716984331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7jjRFLOKWFdHtOrX+3Wl4TBJG5yJ/lUgTzrcC6RTu4=;
        b=g9zTVIeEYEnjCA5Tr0TGXc/egQe5in8WRn5NxEZhPOYNjCTGbBQPQGZmQTmkHROAwW
         8yFtJCW1DLeIcIDRoL1T2f6vAYj3kn6Eus9XkGZmylqpPZFF74tNO3nMUnlYhE+AfHM3
         JCTf46zLg0SrW7hDKmLrBmlmGtNbN6dud6tD1/L9CGEv+QrlwAkWwsERJbzB6ioWFZDb
         FsHEGsrcPbi6e60SdxhCJfc8uuFLg3i9uCfUwYGL93r2CflrfuUnNl93MUgn/J2YtF27
         4KnBTeVEuaJDBbbQMdBqpwbKwlQdfyuKJzKfhzEmvXQS7no1/8Vi1dj1rglbqKacdXrz
         oEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwlVPYKTPhDzqUvXcbyQ/2W7LCPjAQylisS1DJadwoX6z67AnrD8tUHhcnqR0vvFKkUSnTGIuDAzHWgR+QghoWXLlRNirMfVfMhV1r5FkpdSBzRKss7tYPtMs4su0DKh+8Z265yg0sxBrAvgR6pWWWBkshLYZ+pRclZZJAc2u5wZb6GWFtp5pRWhf786/oHy7zPBUus3OM+0V341W/sLDaHkV99Eut3g==
X-Gm-Message-State: AOJu0Yy7BOES991O5vHHD0epiPDmYrvhdCdd8ayyQApKvrlZ4zRrmDbT
	k6ZUQPOvzUA36PIArqSKaWjaI9QfnoM5GzJ6uueh9lCxQSQpJYdVbXScUr/+
X-Google-Smtp-Source: AGHT+IGJYej+sw9fJo8JbG3GIFyfu0vG7873YpSGh+UFs7cdpOTxfW9piJ6itN1Xe0xjcq6il7m1nQ==
X-Received: by 2002:a05:690c:e1a:b0:615:a86:f77b with SMTP id 00721157ae682-627e46ee0a0mr20891587b3.26.1716379530894;
        Wed, 22 May 2024 05:05:30 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e233fc3sm58550197b3.8.2024.05.22.05.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 05:05:30 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-df4e0d8fa10so752356276.1;
        Wed, 22 May 2024 05:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaQEBDgReWMn+6A0cJ8Zg2LipcfCuASEyzvxsDSHXJc8DWgF1/nQOnKpXfLXWsPUyDtLDgsNN362OMD/d+WWRdNnJN7G/fgLC3+wJBxgVCu0XpqKpDOq33TLbdXlzOFWeTt8vgKFacAQ9JvWpk5W7aaFX4oquZkS2AAVMA0Kxh+qti5z1yxZCLkyKkG/hpM5bMloZILlumBOiH1Cdh5Of6DyUrr32nUA==
X-Received: by 2002:a05:6902:510:b0:df4:b435:c3f with SMTP id
 3f1490d57ef6-df4e0db98c1mr1815537276.42.1716379530525; Wed, 22 May 2024
 05:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 14:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6UVPKhXcwYaY915JBwram8jSm0i=Ky9tkyehJM2w6jg@mail.gmail.com>
Message-ID: <CAMuHMdV6UVPKhXcwYaY915JBwram8jSm0i=Ky9tkyehJM2w6jg@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointers for locking/unlocking the PFC register
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the RZ/G2L SoC, the PFCWE bit controls writing to PFC registers.
> However, on the RZ/V2H(P) SoC, the PFCWE (REGWE_A on RZ/V2H) bit controls
> writing to both PFC and PMC registers. Additionally, BIT(7) B0WI is
> undocumented for the PWPR register on RZ/V2H(P) SoC. To accommodate these
> differences across SoC variants, introduce the set_pfc_mode() and
> pm_set_pfc() function pointers.
>
> Note, in rzg2l_pinctrl_set_pfc_mode() the pwpr_pfc_unlock() call is now
> called before PMC read/write and pwpr_pfc_lock() call is now called after
> PMC read/write this is to keep changes minimal for RZ/V2H(P).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - Introduced function pointer for (un)lock

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

