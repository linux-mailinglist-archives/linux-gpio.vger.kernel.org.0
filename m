Return-Path: <linux-gpio+bounces-13669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2629E9722
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 995FF2834AA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83751A238C;
	Mon,  9 Dec 2024 13:33:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137F2233159;
	Mon,  9 Dec 2024 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733751232; cv=none; b=Q7kB0HfYmdRxrZOoZ3iLI+CyH7pNL3vN9RfpDzO8fMrLetY+b22fGdXxaNUxVBaEbMHHu/X2QxppAIpmwy0EfifmzHFjrIZ9zT/PrvXseNkDZdM6mscXFGxJdqv23nyVX3SAZvrjNlc8D1PNaYfac/b2pb4j32BFwVzgn0pRMAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733751232; c=relaxed/simple;
	bh=xfxbbASD5zFvykhVZpOashx+axEag1Nf4Je7RHWv0jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGZyZVaXuvbwk+U+DEnqn4C1QxElF3TPM0DDwEqcAJmu0U1sJrMJdR+aCiNUa89QYdj/9rLusEezuzRrboaxRUxp+Vrgs5uaGSwytnsnZph+0Nk54vMgMCwEzyV2DtFmE3ilTQGYJOEIAbHUZviEDHHxPklSepy0HzsLiESwk9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5187f6f7bcaso201466e0c.3;
        Mon, 09 Dec 2024 05:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751228; x=1734356028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDOMBiu6AHEH20m4Y+mc0QWS4CnXegMB2+nlChMKf9c=;
        b=NC8+9EARjR+vLlQ4//1hJP9iCQBpARjQFnCq4kiQ2CZzVYfYOYNrfOKlPjc+/OR4tM
         FhWb/zHQsFjVDLoG/6oFEB5JO0Uz2o0qB0rXzp/KvVaYUxWm2EDJkFyjTKbKK31asjnR
         fmVoNAH6k2rsNjJR7FGGqCjYIO7uW/49qD7TmICBuMXdqUG0FyQ8b8PTTiivcfF/Uhxv
         tZdTWVuPzAMe2nY1ehJZvV4rjmJICP2l2M5v3GP5J+QdGJqioT61tGewUJcKAjYcgDOU
         l0YKvt1Pz1F5Zw8BVNsH15fMd9LgqWc/jTvZjRC8QFR5slm/WtOzWva+Hs64Z5biKVBB
         Xkhg==
X-Forwarded-Encrypted: i=1; AJvYcCUaHqAzebQ/cBtHZ88/oSzwp/r/KtBlr2RpUJ+avT+PMvtLsgSmV22n9IXgZGiOLxOjVw7QpVZF9vMakPiK@vger.kernel.org, AJvYcCVtdPSWuXTDimACM4bV2mg4DM0ouhT7TG0BSQGZWs4le0NsQ3YFydhZF2/c0VV202rtfBO2NqbHhi7ilw5QjpZzNIk=@vger.kernel.org, AJvYcCW9W7RLrzk5r4/eOYE9ME+oar3WrrznIkqtSyzUCbrww7GKoBMHHM9SNXi4628BdS1SGJzTYbFynG15@vger.kernel.org, AJvYcCWPXAADqqHvkJ7XJKucbkD4VE20BazhdYPGMQgfnnLqKok9was07axPmZrgXszaKVBm/VVzS/9lQ5/F8FI=@vger.kernel.org, AJvYcCXH0D+Zk2JCEoGuXYef0dtoXKQSwSKo07VBmZKNk+mJyoINi8g/VeRer+kRJGs0VwG5Q18e842eoM5nEg==@vger.kernel.org, AJvYcCXPFjLPHBBfVFLlC1Sfq2f3Ak9yDz9cBc2Ynty7DYm5eO8WF8WEv/0iv8U/NtFpve3+QgQdyAOkyh4f@vger.kernel.org
X-Gm-Message-State: AOJu0Yztsg9H9QkrkOwUuE1EAcpq0Q4wqDUEaYkvL20BcCLBkVGq0QLR
	Y82dyT/yI+Lt4vxNPU2gz+OzRCEM7Cp9JCi91a7E4Qz3K0tLMF/olO5VluStHf8=
X-Gm-Gg: ASbGncsL0NFM2IT3qFWk5UN2kCaOZ4bJqQH9psisiH6G9lDavYJ5KeBSIYEc4+5rfhF
	/dwul514LmpGhDJcTQ5cK4R3xtDmTLU9xzdrkbSiLJBGNV7pEK+ciohkNedB2Y8aS9N5XyKuw7d
	t8qSeMMTWM8/Jxbr4Yhd8IFNPSxn2EOuMTnPuH/oGohqPITw7Upw1DGof6YoAtlGMDKRQwJUJna
	0h/GScr9DvU9OSRtKSgu8DJVXREH0wbBh2lCD3pTdzZoTUjRhWBIVSMgIhmnaWNikUxAU5vbaWd
	OD2SzPYAIL0tXNUZ
X-Google-Smtp-Source: AGHT+IFEH4MLYVed3qSiNFOBY/20XhePzYmzavZEhldN2wm9TIyb0ubcIjb2PBtL4LQJYDDFyiZb4A==
X-Received: by 2002:a05:6122:378e:b0:517:4fca:86e2 with SMTP id 71dfb90a1353d-5174fca8adbmr2482757e0c.10.1733751227705;
        Mon, 09 Dec 2024 05:33:47 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eaf59706sm810727e0c.43.2024.12.09.05.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:33:47 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-515ec243329so1004002e0c.0;
        Mon, 09 Dec 2024 05:33:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCofeUKzVLaq6jOStuI7jBR6R2g+5Nr41kW+mDv5SFrdhhPjYUCvKTovIUHor/+wgfS54eq3+0aGM3sGE=@vger.kernel.org, AJvYcCV6bQL1FIVTtRiDK0jmvafnx8B7/NPHERKiewfbjxbzhXxRKEG9Fn/E1wNAw/feLhpJ67rrmLyoXEimpEV3WjVGaSI=@vger.kernel.org, AJvYcCV9HZn+u+dDb5Jg6SBfw+zvVKfmOSRn9lGk+7iJLeqNxN3cxFrZjOnC3KrckNPYw4Jf6871gnmnFJhGlW19@vger.kernel.org, AJvYcCVJKjncuR3qdy0iHG8+DLVF5dlJNUUXrzeol2yIt2IVUquOeZLJWxL9uc3y169t+1KPsmJTtLzF0hqVXg==@vger.kernel.org, AJvYcCWHNIABzpPiOrQRXyp/RquuEqIQU+a+MVVU1Ld9v9o1NqIQTxygX47lEjQPTGw24BXz7LP3p4r/YuOE@vger.kernel.org, AJvYcCWl66UOwVCqkDrVVddw3XN1GpZ+xRTA/7sNnqgSA+OIX2EBSncNpcQ4wImZ6CbL14oOsP6HqppVqQZ3@vger.kernel.org
X-Received: by 2002:a05:6122:5302:b0:516:25ed:28ee with SMTP id
 71dfb90a1353d-51625ed2cf1mr4141043e0c.1.1733751226507; Mon, 09 Dec 2024
 05:33:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-13-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-13-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:33:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcsrodx2drwse5-XSg1e_fKF-HYF+Mtt0bYpyrGqQ84A@mail.gmail.com>
Message-ID: <CAMuHMdVcsrodx2drwse5-XSg1e_fKF-HYF+Mtt0bYpyrGqQ84A@mail.gmail.com>
Subject: Re: [PATCH v3 12/25] ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
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
> Use readl_poll_timeout_atomic() instead of hardcoding something similar.
> While at it replace dev_info() with dev_warn_ratelimited() as the
> rz_ssi_set_idle() can also be called from IRQ context and if the SSI
> idle is not properly set this is at least a warning for user.
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

