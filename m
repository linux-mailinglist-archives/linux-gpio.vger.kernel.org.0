Return-Path: <linux-gpio+bounces-13653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E939E94CB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF56318839CE
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F2922757D;
	Mon,  9 Dec 2024 12:49:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A822163B5;
	Mon,  9 Dec 2024 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748542; cv=none; b=Qn2rr6szEK1roRhXwEcVBIYPaTSP+hiQZaUWmOl34LOckt0LZNWcJHmBaT+OS1iwEC3+2iF0PJIJsH4oDNQDzER5294RIp37i/e9YYYshNggRH0mHOqVQWP7hC2MlmoUBIclRSvjXAGKsMNq31GpbUlBkdjFZgxvCJtoT2mqafI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748542; c=relaxed/simple;
	bh=KRnVJqR5zgovk7btCjKppkXMqEKHu1JoPSZXRxXJcjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pK1YbYXdl3wA1jJoSIcJSB17itJ7lk4n8unkVlObRt10DraiGu1IlEVcgiHBH0hKwZed0i0HDROIl5M55KOu8LqKZ28p/D8tJVWgDwNWxdabRUOP72ujt08diRYbX9Jn/a1ip6oc5Vpl3GkH7BK3oDpkKfzCCYuSe13mUQF9Syo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-515e2a94fb1so928514e0c.1;
        Mon, 09 Dec 2024 04:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733748538; x=1734353338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xguzG2kN5bHFp1BhztI5kdqvCpSXEyn5KvtWxBMicaY=;
        b=el7l/0xNoKpyRv33OibMgeHhEMZqA1IwHDJeDLo+sx0fDObWIzaxXNKOb9GfMNi1DJ
         e0sD9x04/9bWq9sCCIl1j482Q98FepQ6sWOC+4bbomkU3bNSujlQ+s8K19db1Tq6PChq
         5BFj6h9STku8BJDXyhWqTX9hyQwDb8vWBQEGCYDG0a/HGCy0134r/crGesMH2euw28jE
         KwJdVjmdFYOVxsZxA3KdPOC13S7MyeN7xunY8iAjp20/Z2HgDsaoB0z1iHyvJixYNZ0y
         hKfMJSvo1NP2EG0oBlVt0c+6UVCVPlpD0oOU5esKHyPLdJQ6p9GLMREyBC5s+oeHX+/7
         YUPw==
X-Forwarded-Encrypted: i=1; AJvYcCU0A/yM690MFANB0sV/8Q1iTOcB5M3i/aTe020KXeObkHkLEdVA6bHmNDhLJXj12Y2Q2q7vhjHezpOsOQ==@vger.kernel.org, AJvYcCVCRkERxIMrQudHszhDXT1EjtCYFxyWPztY4B3IOxE2SyWg/qQOah/qQe4EAr6WOO/ttPywI7v2C+Nq@vger.kernel.org, AJvYcCVdpMeIFSv7hITU9bm+aggef/9I954R95qCJG1f5nTv5UyzoSmILy3LxhG6OjRJ6QxXceHGMB810swG3hva@vger.kernel.org, AJvYcCXQjE78F3+S/TUDF/0ojl16IwkfPmDasIxZBeG5iVTOTbLmAdbUZ4B6VFTthvCeKNVwmPtZa5Z5ZREx@vger.kernel.org, AJvYcCXcIkUhnosVKIQ/25A/c1EVccAUiJ99iY0pZJF/IJoh3LRLLOCV+xnl8LWbFJ1spl+BW/iHp4MZm5VqfwE=@vger.kernel.org, AJvYcCXupLA1ZHFZ2Rxt+1OBoBGjaJzSoMSg5qjukEZO4M/4zj9T4hIWWzveiFT3LuZ70vt8qiWMDJnbjBse0P6hFiBIyIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy66aj3qX2aJNpaAr1BtapsT75AAn7/LjeEHMGdL1uLst/20Wwn
	QiNiLGk/4RYOO0wiZKseNf4xaWd3t1NJJIlGAp3hEODsWlkHT1w9gAc9ZfJ8DxA=
X-Gm-Gg: ASbGncu0W0XTbwSmpR9tb0Hvisz/N4Re7M3YWx8Sy5rukeQwmnmmGTraYVWn7JOQ6cJ
	q74F//8eE0s3U+zCl9T+a0f4+GQoquIL0URyyXx0tMSUD9ZoIYuE2hlXTBS77j5BysuchulDqo5
	n8RVrrTnp7lXQKF5T37GYIwN3Irxw/FEVMO9BHvT5M1zrzMyO8PAIruhQnZD1cP9zmlCsxHab29
	6amscaepIWroIPl2M5z3f5RMclZq+pq4smdQy1sjwUjuctruuezV9bS0TItDjZhOV9ne8EMlu+Y
	y8iuv0ReSgTw
X-Google-Smtp-Source: AGHT+IGejzoVv2j+0q9V3WQPXS5YH4b/x++D676z+IqbeBGgp17OK9kUnb4c5cW5I1CF6a+qybBjKw==
X-Received: by 2002:a05:6122:3bc2:b0:517:4fb0:749c with SMTP id 71dfb90a1353d-518882ebfa8mr318969e0c.3.1733748538086;
        Mon, 09 Dec 2024 04:48:58 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5187a500e9bsm149201e0c.16.2024.12.09.04.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:48:57 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afdfd3124dso569807137.2;
        Mon, 09 Dec 2024 04:48:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBrV5MWwKR2O4MZBfZOr3tfDB47/H5rV1sMCvTbfmwGFYKHC2Lw2rShyWU8G2OAx3RQyJIczgLZgGxjUg=@vger.kernel.org, AJvYcCUDNLc8gQ13Rh8BFUzaeuu4bHqqXUI+KWS3MsY+I5foVoMomA1Yozrraz0j5Uwtpcz7ov/emNGTypXKlg==@vger.kernel.org, AJvYcCUj/WGP3gYCVyQ1PVwCkZQVsyFa924QUBnGr9oiCSnBmo+4hFmX/o1qMZoEbxzrXllU/qb7A2ubrbiV@vger.kernel.org, AJvYcCVNVj4JCN/J7uRR+2WAqqSCT+1IqnNN2g8j5Pu7T9Z4ivwnSYBriy0P+dq9UFbBYnIydOLtjLtikpF4S5GMC2lbhPM=@vger.kernel.org, AJvYcCWU7I3/+DKWWy5nQrdcT9SXMZbBmyU5c86oHsP+OPkzQcHX1IYLUju6BgXOUtQYxroSouqfDUL3ntD4fVDl@vger.kernel.org, AJvYcCWWhvnYHwHBBM8vxXYj7ucmhkAuZk5LXVSldTrwV6YvAbpy1t4mULMsfWa6v5epVjiwl9BBB3kjKsr1@vger.kernel.org
X-Received: by 2002:a05:6102:cce:b0:4b0:49ba:8287 with SMTP id
 ada2fe7eead31-4b1160bfbabmr348406137.13.1733748537466; Mon, 09 Dec 2024
 04:48:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 13:48:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuN=WSrw+k_6vgOQGSuT7+yABbCeVCeXs95mhCPrHiWQ@mail.gmail.com>
Message-ID: <CAMuHMdXuN=WSrw+k_6vgOQGSuT7+yABbCeVCeXs95mhCPrHiWQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/25] dt-bindings: clock: versaclock3: Document
 5L35023 Versa3 clock generator
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> There are some differences b/w 5L35023 and 5P35023 Versa3 clock
> generator variants but the same driver could be used with minimal
> adjustments. The identified differences are PLL2 Fvco, the clock sel
> bit for SE2 clock and different default values for some registers.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

