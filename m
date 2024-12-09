Return-Path: <linux-gpio+bounces-13684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059FC9E9AF4
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 16:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0790C164F3F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AC81369AA;
	Mon,  9 Dec 2024 15:55:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7578C9C;
	Mon,  9 Dec 2024 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759731; cv=none; b=MAgtggmlkD4Dw0UX8HWFnEYMK8uvQraG7pEbOAoCla3uiDBLrbcLfbfClG4BiMDVZJYafF6sUA4E88acm9BrS/foFoO1i6WAATTWWXliutRcMJMsYPw3cEZ3ibo5XlWgaVLQnvGqrl7nPhhLtp5va0MwYBm1vUP3qfh6ssA3BA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759731; c=relaxed/simple;
	bh=XswTRhc2FgsKGapPraVnaq5t3FsVcVZuNOD29axiOxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfn1eyeXwquhTVLimTLYejlGocHwmLrMCWrpu6ZQ8OwK4E7hxcEFhi4ybMT1C3XuQOWnsczxS6TuMAq1w6zrjDUCFVF6ER4xOkMUeHyKHqs9R6D09y5YlYUmGJNhImiJw9JUU0SlxTwsNQlsY67S0IFcmTMOMZFOusMM+Dw070g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-517ae9ff6e8so348912e0c.3;
        Mon, 09 Dec 2024 07:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733759728; x=1734364528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5iSM4ixQflBoS0B8PVVLYzHGyv6dQ39nvBtZwQMiCA=;
        b=YybBHg0fMsYDi2NanqK/AjO1ywrpMnIHuo2GWpykaJm7lT+rPmSLK8wqT6yuvEoW1c
         SleEhtKe2YqVmRCM8pyR/QjYB7jyYAHkmtoGWaBapNYLLeizrW2y4dLO5QtoqdezvkBB
         MSfXMlgrbrlsQOU42QSFAwMeynEtbpZaGx+Nvh+B6vUL8+DyqoHDZe25jioHu9hwo1nH
         tMPm4Tnmqn/ic+Tp5XWdQOaw2HwYue5ht0wsU+wckNkgIDerlb0zlw+Y3VlIhIIk/R5t
         vJIa0ZMLn7DvATifasZSh4B5iCQwpimBsxHMRjJvKg9mlMAtBi7iqWuDTAc7T6b9JX9O
         RcuA==
X-Forwarded-Encrypted: i=1; AJvYcCUXpJ70HiNQMxWKpL+h9L7iBmRpSasN5mgLOk3y49kE+YJwvhMWAPUipVCXVEIzIWOVgyqpDOzKWrfC@vger.kernel.org, AJvYcCUo2ClH2ztmEbnnYfGvw1XV4GCE0Gswwd97scA1F3ppE00jvObNNgImOgybIQnkKQuAxXPtmXSd7fag3w==@vger.kernel.org, AJvYcCVSgu/Gohv630YRPLqkbNhh7CkJj/u3q+fxbe8CUpmahOGPEM2CEbeHzfqrEP5OXrrvHLs5tjohXxJKVRDR@vger.kernel.org, AJvYcCVzRIJ2cg4nhWqnuGVRo91nWj0AzvgML/HtfvDvv3j2ippz2igMdCbcFIZBoiiY/HhxcukDbrwJkJHz@vger.kernel.org, AJvYcCXCBaip20g7noiEFWS5yicn1ZsCfYWKBLSHsSIcHX+Bu7ZDhIeJ1KFcZGd78y1LEyOgq7UwPoE6+LB6Sh4=@vger.kernel.org, AJvYcCXU8yJ9opNfXz/zH9zLDJ3fu8pHlSJHEqxPr0i6yJfBbYUkMSH4ZaQ+DbygemeynYgmdr03MOaDljWtjyv9doQfpBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPpzKWhe1F72990pydvi3ZK72h1fVVhqMQwgWPt32125n4lsR/
	ZZCxwrVHBvBP9iIUmSJoGC5dCNvPD1Zl8HhOZO3/MNcPUQHSC+mNUiBa0HzP4g8=
X-Gm-Gg: ASbGncuyB6eGkN1ABdrGE2gQL3xa6DS15w9Kc+RyGKB2wNqXZ3hrLEglaV1DU2TfK+n
	F2x6zksmNFQQezKPDYXX/Vn95RUyQskbODCz3nkWR9wX0iyRNHMLezcQEKA5NPgyAa8OmBit/9w
	gyd7uq1RXwlYwpS06FXICf8qPEvHCoLUkZ4zRE1wbQJgBenYBMkxLjgX/7ifAZBFq+G+0k8FpXg
	l1lgNTbQUMx/dM30mu2aHgFQShJnTCO/5Vi4wSQJgxKX1Io6CDnJh4OQ4KgmLOnHOS0lbsfQOzh
	/C0VJQzrOZigVvVV
X-Google-Smtp-Source: AGHT+IGauaD9zmQKDL9wEafyogWUEnj70oQrlvS72K1x5VCEWXrwcrqyy+mpdsUDr6XIUPrK1adpbQ==
X-Received: by 2002:a05:6122:3981:b0:50c:4efb:835a with SMTP id 71dfb90a1353d-515fc9e20c0mr12225599e0c.1.1733759728089;
        Mon, 09 Dec 2024 07:55:28 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eae3edfcsm751157e0c.12.2024.12.09.07.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:55:27 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-515fc723d3eso880287e0c.0;
        Mon, 09 Dec 2024 07:55:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUw/RhNAp/AYkBQEpwdNkUgpY1DZGhn2L/3/C6TLIvHFUN8RTFmWWNcd1p4qK497QWZg3sTKMtiF6Go7sDR@vger.kernel.org, AJvYcCW8MPpHfPgnAYxnIcMqD7KnRnJsc13yqPLHqRi6A1X2BS/YLqVKnjFmqDBgUtmZ62E+mhNMNvFv/WigOscd5Z6y+yk=@vger.kernel.org, AJvYcCWgU16gopZJK1UYBH0RlprdPqWqT1Lsyf5u8v9QWkz3tGDY4avgiU1XNIjRJlCg5YrB/Lih/Ize/9/d6g==@vger.kernel.org, AJvYcCXEt+NdAlGSPCtgOnKWGh6PviiW5tkmQ0k5HNBAnCJ/xE/Tt/AqVohkgabtlqmya/ZlFtWPH5rVx5vj@vger.kernel.org, AJvYcCXJRgndOYF/ypOS+S06kt9WMO0C2+qgb+2vB3hAzMYRlOxpKUvGoovldDUGx9uc/OuYRBnNie3xv41WOdU=@vger.kernel.org, AJvYcCXxpt6wC8FSqidmNxeTW6H/MkC4RPiByOPzsuCy6UN7V/kA8U4c80LiA0BpgyLU39ZYND2rbAqjdqB4@vger.kernel.org
X-Received: by 2002:a05:6122:308e:b0:517:83d1:d438 with SMTP id
 71dfb90a1353d-51783d1d7d7mr3556407e0c.3.1733759727639; Mon, 09 Dec 2024
 07:55:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-26-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-26-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 16:55:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW0Rg9J+cqoeP_z5Xr5RYCbNG++4o6gRunEhQ3WfSqx=A@mail.gmail.com>
Message-ID: <CAMuHMdW0Rg9J+cqoeP_z5Xr5RYCbNG++4o6gRunEhQ3WfSqx=A@mail.gmail.com>
Subject: Re: [PATCH v3 25/25] arm64: dts: renesas: rzg3s-smarc: Add sound card
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add sound card with SSI3 as CPU DAI and DA7212 as codec DAI.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

LGTM, so
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

