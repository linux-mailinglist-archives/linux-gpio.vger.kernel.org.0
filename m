Return-Path: <linux-gpio+bounces-24062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43391B1D2EE
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 09:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E6C018C5BD4
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 07:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B68229B18;
	Thu,  7 Aug 2025 07:03:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECCD4AEE2;
	Thu,  7 Aug 2025 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754550202; cv=none; b=sKbtfrIAsDMrQYQp0bYaEPK0od4Ze88pOVnvv2rP+N1AKnivs+o60XrqUnqQaWSB+eMATmzUWV8pcD9jJEu28sHFnpVLuzGRfkwTMEJVi9MULhHeyDtoGDMWMfkNz6hwKEuujcfPlnJVlxq/QnHo0nNnEqdOOHIvlZQtahf8b+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754550202; c=relaxed/simple;
	bh=NZTmWWnxv4F8M3/i0Xepe/SlX3tm/fnvmK+bF10p6cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dgk1IAtyeUa+VSF1r2aO7PpD9AmA4dpBH6BFELNQWtxwulAYG1/EuaGd9yY1JQABpVoAyIJzc2DmbP/t4cZMqmaIjbjZwfVwZGuOmR2RV381/AGelL625TWFo1tOG5BRCiRb7HAw2hcjnqD8y/ExWJ7lKUDKxI+nFJCR9NHxD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4fc18de8e1bso238831137.0;
        Thu, 07 Aug 2025 00:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550200; x=1755155000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWu6B4qb51mVSqOrpcU1++wtRjVZzTKfb8/NIZVZsT0=;
        b=cfJ9csAa5bvvdJJr2tPZ5wkOT9k+lYhGjTjfXICDpYXGLWEYVl7JqO3HjsXLpID+SK
         vIf9GqRWQwMKpBrKz/KHHM5eypcwU74rdHo+ltLgXM3i/ZtAlGu8UusFxOVEqxGqmJi4
         4PwH63PGnj2D0GAkqVQvXB1/Hn0Sros32+eehtECbrmcnbnv6hRcf3UaymkVm6NVfYJj
         q8wbJdWBxPtgpkd6gdKmWhyzEQzcrKP9WcBStrNdR7u8P6HSUv8tWqAhxN7xMFFpr6j+
         nyuuU+KFhSinbNdnK8jGgOnx16MSy8WDwCHuKwCPDo6ZfFr7jsMAIEQpZa9nsoWUnocS
         ge0A==
X-Forwarded-Encrypted: i=1; AJvYcCU2dcTxLqUrJ1jFemp4UdxKN8nvwcBQmbD5FOHIo3ty+Z+QpF4Ezl2hjmOhaWISECqrUeux0z2EsMIJskIp@vger.kernel.org, AJvYcCVHHb54XK1JBxzZmbW6g6WUFtLamb1laBDTkMMFS2sMGZ3ezgjsRGcpDU0hsMhXuvih4COZJ5hKb3pa9OKn3KT0e6I=@vger.kernel.org, AJvYcCXK8xeRu1pwFBjRV+VkCyYeO/XGrd6DX202KjEXu1yL9dc6dvKiPKE8eJTJL6XTb6fzvNFOPWQz+XVi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwkb/XYGJat0L5++dwIOyBfHYUI5WsfSxDhjO4MrGZUwTeQ4CN
	+gqBr2YCEQSRN+I8VDgU++/GCTUaZoa8L86T+6GuLmuModf/GHRGCY065lnFFy8AkrY=
X-Gm-Gg: ASbGnctGEHX9Jwm1npyIFHnjOrHmrG/FhHrS85bALBB+4aZeUbyb4Zt2xGn4Dg8ssxL
	4EsDsGQGVOrfkYxu30m3E9vC/R3MxQt2+UWs+f7MSDA94G3mTU1Uo+IbmumdJmCzmaxtAVDbo63
	sK2mfSyweNVjOFc+NbvzSeCRnvVgBWZnzVhsLHNET7e/++eIfyqKfXq3TiAmeNqx9VQuWzUZsmO
	Qwl++0uAgn2xrpMJTzuW3fCX9TLo8EBuGX9kwMBypMw/CQmBYhnfFmK70ASgkjAQOLOs3E6MoG5
	dUvyEdK70ecqSTtVRP+gRE6AXDJ+CK5l/9QgFwuBsnxZG8++HSrT44evzcls60OEJqs0WnK6XIC
	W+wNOSTcFcYyZzLOgyWA9XabLYAhY/rn7/EESwhO5MnI1jYOAa9NqR79dtGTy
X-Google-Smtp-Source: AGHT+IH+Vp0xopven5MmQXOa90KgpBbUttTC71rL4RgqNnlL+QT/wZgVH5twJqIhQshRPQt1Bnzyzw==
X-Received: by 2002:a05:6102:4a91:b0:4f1:2ec7:af39 with SMTP id ada2fe7eead31-504b889e7a6mr918854137.18.1754550200000;
        Thu, 07 Aug 2025 00:03:20 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d503f48sm3833019137.22.2025.08.07.00.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 00:03:19 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4fc19b5fd8cso243126137.2;
        Thu, 07 Aug 2025 00:03:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfc54xBV+67lOgP8hTV85SyvOGS/p1KkGmy5pEd7c6ZhtEfOyDxwXo2CtC+/NeVW5DHlMbrY1k+KVSBEUa@vger.kernel.org, AJvYcCV0WksDudZXIvwIA0fi2NrGoBPmsnkBkmCmTQwIiFmqNE4JQVyet24wYvw5RrHdiytXFIMSPnNv4EGnuwMkUmhHyvo=@vger.kernel.org, AJvYcCXWb5OrbvVYqUWbyl4zxuz5hUP5bRG/exNd7kkrNgGa6dJHiLQiV9iwIrgNpCpojvRBDaE6YSDOOO0L@vger.kernel.org
X-Received: by 2002:a05:6102:418a:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-504b8cc5c5dmr779640137.21.1754550199293; Thu, 07 Aug 2025
 00:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250806195555.1372317-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250806195555.1372317-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Aug 2025 09:03:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKxH_rvgAfOJF5tdD8MQoHFPdyfEYTJMLEr+aELwf2cQ@mail.gmail.com>
X-Gm-Features: Ac12FXyEBUkACg13ZwjKj1gGmG-FLcQDJ45LxPbDnyWLp4b_wmHye9zS0I52v6w
Message-ID: <CAMuHMdXKxH_rvgAfOJF5tdD8MQoHFPdyfEYTJMLEr+aELwf2cQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] pinctrl: renesas: rzg2l: Drop oen_read and
 oen_write callbacks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 21:56, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove oen_read and oen_write callbacks from rzg2l_pinctrl_data as
> all SoCs now use the same rzg2l_read_oen() and rzg2l_write_oen()
> functions directly.
>
> Change rzg2l_read_oen() return type to int for proper error reporting
> and update callers to handle errors consistently.
>
> This simplifies the code by removing redundant callbacks and ensures
> uniform OEN handling across all supported SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
> - Added Reviewed-by tag from Geert.

Thanks, will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

