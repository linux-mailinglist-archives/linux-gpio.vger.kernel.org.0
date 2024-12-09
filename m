Return-Path: <linux-gpio+bounces-13663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C489E96C6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A8B7162C45
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5751A238E;
	Mon,  9 Dec 2024 13:24:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999572744B;
	Mon,  9 Dec 2024 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733750643; cv=none; b=ATqLWe6v+/HHYv6SkuVy0noFzu+UCEMVpLdeeh9H6NE7I5XBpwPQUnifRYuFuk8Zg9RkscZUSO6ZOQkmJzo7r2NuaorGFNlefRFk8DieU0ipVa26o1o9nXFaItIG+6ubuh58tbgqKUZBymV1rbB0sWtx+dFQj0NMnL1kqqUV9ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733750643; c=relaxed/simple;
	bh=1tLSL87TZA7eVAP+vAyLhAovYg5kCNthTxPTDpOFT+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBqgPHKe72miY5tyVctra3W2UHj2EPTIh2DYozcKOeXCUjbUDqUJUhcsy29aEJq3vXPeo/q8qXUpN6d6KMveBiqjrrSGMyg5DRRG5VdJNE+nauHv/GcAErcVVBs+ZbgwSjXymJ+ZpJo7sU7r9jYLbu27id9wY0162hZV2HFVS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afdd15db60so660979137.1;
        Mon, 09 Dec 2024 05:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750640; x=1734355440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqD9y+TZlpx8awPgJD6i8retfqKC4vxl3zB5fzptVp0=;
        b=p3fuWPGbEB1VEZYuzDYLafRaC7ju57csYnZJy/wf+ymp0uXnliC98/L7p1Y/yvKnc8
         dsh8XS4a3g0O4HOB4zn1agCx/CaeKQPuifvh5GDVzUkqUOFtJRWUJe6cGe1Iiqd+XQc/
         b2Ib1aDjj/TfW8GgnJSlHmCg3E6PmgDSSpOe+yyn4lzDVY8xSgOBtx5omEpuoyZ3NeDo
         uHkFa4FlfAWwARp11ivLqGhWrb38qmOlofGJ5PmKyy/VRB09NDx5ZRB4o0NcT+q4/vf8
         qQUnToO/2EgXxmPHY6avlc1INJs+IsPCNGwngX94ozHY0N/VmsSbLLYSJD6y9vNS8H5w
         JhtA==
X-Forwarded-Encrypted: i=1; AJvYcCU8NF1H0hJ+nRQ/NWy3ztOR6bFYyHnWSEqpMwq46jBYxU7RAmh4St6oBA+TGr3UBb8cFyaU3avrLXj8@vger.kernel.org, AJvYcCV65zXCHQYwm8WqTYYT4Q/7a5GrZb0L+mPpNVzZWHS+7wVTIMdZu1Uv1HFjtpuprkLCRp+6fUD3L8X3@vger.kernel.org, AJvYcCVInknOWF2YJWl2I3l8h9IzgasYvjSQURlIBuWpT7+sLqX2b2AKwADkkO3vDLf+TFcmbIibo64Omc/ECrySlsbugo4=@vger.kernel.org, AJvYcCVyP+bIpaEOftHiP7vdthMttenW0TcqMMqwkI1y8I0bIT9yVIgUI56xgBgmPOcvpE4X5MLpUv7t3RBQVg==@vger.kernel.org, AJvYcCW4qLDg84mhZKjAzujToewL0LDANnTm+yy94qfoGWFebpwtZOYKfegiuc5GLNByv+/nsya9pAs3CPKIBIw=@vger.kernel.org, AJvYcCWJPyl+YxjBO8Vd8HUgPRYQASOAc5ZBeSCdwhSOGLitRqEiD59bkLTehT5uhsUXPvDh7Kid9aYNL4CjS4lw@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJlF69yfPzppdjMNcIj33xBvMbB2Kl/IQna0LGYn97Ne8ksGM
	ZWi0CBkEOMj+Q5V93STlwJTbFGz1fftKD+Wq1F79XY+IOntXOyrusHz1wmjrdEM=
X-Gm-Gg: ASbGncsDnPhv5Li1tHafXUGFusugsT04GVaKXHHERP2IlSpX6PCflt1SG0xPqw6Dixg
	JSY4oE3KOsgx/qg0SHMXDo1gKHVtvEpkCSEsh/1WiQit6OXM+w/CDkyp2U9Hlho7OcCGMzSPemi
	PEGJeM6xplAuGDTHc0McW6yMU0lzuIREjhAAvUfGUUh/IoTTZ37Xf4x1yL35MqOe6T0sRrr+/vY
	SKl570N7ivdCRKCVVQhpNEmVdjiRFaoFK+wX59CRokq2k14v7H7ba7QUbXhHr+ftJnFifSLZBpO
	09GE4so6Mf4ZVhjv
X-Google-Smtp-Source: AGHT+IH625btiLBqvGqpn3DMiqK1dI+7zObNttFtPEmoj5A2GsXC6dly550EJA2KOi5CRl7my2sD6w==
X-Received: by 2002:a05:6102:3914:b0:4af:f809:5172 with SMTP id ada2fe7eead31-4aff809641amr2169592137.1.1733750640230;
        Mon, 09 Dec 2024 05:24:00 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afdae80f4fsm745253137.31.2024.12.09.05.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:23:56 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5174f298e18so336866e0c.2;
        Mon, 09 Dec 2024 05:23:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAkpTZsU3eRcD8C1NFGc4E6VOvkyXuLZWO18Q3ARbfoLvjQ76uvkVPtA3faCpgi4MqkxGKrie/dJM+DmUe@vger.kernel.org, AJvYcCVM0p8DG2MyD8qr2aRgREB/4aYovHvtBtUZ+vxSslT4ACKuS6YCnAssZyD5RFcy4oZ0EwVkHHdFYBAo@vger.kernel.org, AJvYcCVxK+X3IBEZsY46pdQR5k5FJaeQMmNTvBiFBfQ689CNx/KVaQ0/1Lyi2uiRwKYkgrk+HkXJei/prG/rmVw=@vger.kernel.org, AJvYcCWB0h49ONuBKwY3G2AfIMLBNPLLuO524dVgNV0jejKe1abkON4AlIrVnytZEeY8op1R3ICs6wqS5po7WxLT7VxSeHU=@vger.kernel.org, AJvYcCWb5+V/6stUGi4qm/hsOxwhPB8DekgwEkzLBq+WjUMNmC4+bTglWNpNc5sMCa+U6+yDyY9VMf4vAMIRXQ==@vger.kernel.org, AJvYcCXv+vP3MljtZRtZUA3B9bLTCrrOOixTufEN4zdBtkjhyjjxdbzjqnpVDI9eFcgvg1J6dl5y0W8jHxd2@vger.kernel.org
X-Received: by 2002:a05:6122:134a:b0:50d:c2e6:2730 with SMTP id
 71dfb90a1353d-515fc9ca46cmr10821615e0c.2.1733750636501; Mon, 09 Dec 2024
 05:23:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-9-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:23:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2SF2Cv-GLBQk5=CNX-LDbs3sq+S+92hT3rgrrCo18rA@mail.gmail.com>
Message-ID: <CAMuHMdW2SF2Cv-GLBQk5=CNX-LDbs3sq+S+92hT3rgrrCo18rA@mail.gmail.com>
Subject: Re: [PATCH v3 08/25] ASoC: renesas: rz-ssi: Fix typo on SSI_RATES
 macro comment
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
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The SSI_RATES macro covers 8KHz-48KHz audio frequencies. Update macro
> comment to reflect it.
>
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

