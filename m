Return-Path: <linux-gpio+bounces-13674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F689E986E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 463191883FB1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3631A1B0432;
	Mon,  9 Dec 2024 14:08:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0988C1A2392;
	Mon,  9 Dec 2024 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753282; cv=none; b=eHgw4WD005xiuBcr0+bBm6FDFXq5pUs0YYCypDK+cQE4U7IFXXhURMhK3knM7sHZOHEZZWQ8lBu+9j+BRvV1yI1New6liBpMGr1cqJ25EftBO/LoJjlCnumHIWJuY27RTKUu+G2tNfUEQzMFXsXeMSZUkHC+kjT9UJDFJ5BBtZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753282; c=relaxed/simple;
	bh=fMLnWKRwyXGyQvbk+QJaHut2AAjD6XdKv4stgmyMhrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNVmrzuEXzxzesrKgzLpfeVQCi+6ehVojuEAOWxGluUEFdXHzUPw4Wkc/pcG1RKyCpH3REupGcd8Baq6vtbTcm9nygmh1FqFdGSucV8OSO5PNrmK5q7Lz3V7a5MsjbXSQVMcQtYbS2Cw42Ih1x8IgBbMkCpAJP0TClVZuS3y+n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d918f066c1so2789736d6.2;
        Mon, 09 Dec 2024 06:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753278; x=1734358078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK85peZI82UVhOXh97j60VdocE1lKKGDWZ00ZE8W9eY=;
        b=k5ma8HVqxiS7Po5d9lWDkpyxDe1lPxovZLArsAjUXDG6KzUUr3ox4/if4DJg8MyKRh
         pfUcBoN96IXcb8+WESPNmU/g6bWVG26zqliq2OEdM2E303THlkTETO731Cnvds8kN3m4
         2vZlG8IcBzY6mmnsO8ayllnSDpGR2ebLyiTFFnYpQo7tDJRfz6jF/8i1/bllR1yB98G5
         FyTteQJ92z25acC6WPyYzgsvmkOsSGPXRKrRbcFMnLSm8Rg74tBn/nuqb8mZFW1VMJAD
         JuBErXUY5r/c82obbbSzir3wUxkZbgsCZSh7IOqvQFIp8mLinMxMkmPZ0pr4OgstuGpd
         7whg==
X-Forwarded-Encrypted: i=1; AJvYcCUYWiAe3mnX0FBwc5NNje127p+0sbok8mhf24dST1k3NBOCdf7Sgvfv9+TaUcPtkiXpjnF0aNhYtVx3byE=@vger.kernel.org, AJvYcCV5BzWFcG5mAyI68ilcAL4Mr5SAHWws1Lh7Plkc94yGgbOH23CtEOaDUR03uAyFc0GsKibFuStVc9BVxVKn@vger.kernel.org, AJvYcCWLuL4Qdghh7sVZkT+oA9kafe5RYA79henlWFrMwhmDepmeMGBT82wl0EaaXDnv6T6srVYvFKoopLdM@vger.kernel.org, AJvYcCWjTpTKOVttCW3+cGzBnZ4jk535YP2KOB47G+LrXMuqp4jJFL5lpPTL+RLlBBo8SphWZyMbFW2pTj2FVg==@vger.kernel.org, AJvYcCXIe1AD74T8eKtTSM0IP2gkgMgMDKWOcwHTfpiEjRcWuxWOPcWHgnlyQKXY57SFxjYAfALNGrVpA7rC@vger.kernel.org, AJvYcCXYlfSG/psS6fMnZ30eS4mp3wbtwkEFIX8Tb14BKmynUn7goqxDge1w271qvnfDl9Zqe2L4qj1K2LFme+n8H6fni+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQm2EkLWCQuXpSxUvP+xWNXF7mLkMazpK/hww0vDMIiO67Ex94
	q1WqyTeI/J6M1D5m/ueDFlzaAWlKmCKO7ouaSOegu/It6H9aszd6RfK2wlytvlU=
X-Gm-Gg: ASbGncteKBgnFH2Oa0caC48A6QSrVbssFVW7Bxk7Wc5QnmW7MdtOAFhVGXSZ7D7vhcI
	9A/L7RA5BjMe4OWb+wTrLthv5MGl2h24iPJk8a82E9EOhbcDZfqwEv+3cVeGk2Bep2/+jUfowqP
	8sIkvLb7blWRJy+JPqeNdMypPv20VUDdFKWWC2ebliEQcGBsTaWqvYYNAlTpWmTxIQEB0+2r7fN
	WeeZFHlZeg61DvgnP6g86CHfx7DOfvsRWirRp1SCso9y3cSod+u0biLDJEo0CCrHHGDGhUug/sm
	1lCeQmH3rQlA5Sw/
X-Google-Smtp-Source: AGHT+IGtSm/6Govk+zvtcEVPCSCFg8HtsvNFDnWqfndNmGREu2OYgrE8AM7EOlskNLZngdC393FbIg==
X-Received: by 2002:a05:6214:400b:b0:6d8:7ed4:335b with SMTP id 6a1803df08f44-6d8e714c6afmr183834266d6.26.1733753277752;
        Mon, 09 Dec 2024 06:07:57 -0800 (PST)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d90e0c40f1sm13740416d6.89.2024.12.09.06.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:07:57 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467631f3ae3so6114301cf.0;
        Mon, 09 Dec 2024 06:07:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmG6koKSmcaL5RXXm8s0wXQ+wmCOj/JPSjmop29ELgT105FMfrziSBDY8JzoLW3ZNFZzyXm1q/JW2oGp2SXNGGMc0=@vger.kernel.org, AJvYcCVNaqphxvxUI5I8+jcq69EgszBkw54oJiwfyCnY6X52w3CS3JrxkiwKpeazf44tgHDq4AIk6wwj2W6zNQ4=@vger.kernel.org, AJvYcCVQEf/SrsutMX1EZn4QoZwfV80gY5kK9c5oAwXyT7yxDsF5Didj8/kMoPQwV74N1+nTTK0p1yUfzNLs/C4C@vger.kernel.org, AJvYcCWGuXB8R2OIBNnMG/SC+4WMkJg0bnnSmvLewsxEOHsNZQuZey78REDVNRY4ajHgnPvy2VnHY1ChkwlS1g==@vger.kernel.org, AJvYcCWiqg+fUPmHfxaFVrI19kLuHiwtd+r9nEaC96ZgWoiDECPlOxLed6podGbYg+mbECenNStslw/bdGWO@vger.kernel.org, AJvYcCXWpU34LlLb9/0vuIXIustLITlouqhIfP7218f959rXGTkx5BxkfeMea0zGiUMLHiq4e1t37TKKmHni@vger.kernel.org
X-Received: by 2002:a05:620a:1d09:b0:7b6:d1f6:3df with SMTP id
 af79cd13be357-7b6d1f605d0mr887904185a.21.1733753276599; Mon, 09 Dec 2024
 06:07:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-18-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-18-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 15:07:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHHG11tRnNgfmz8vEUE1vn_Eb6qjroK470w=ERfmP=mw@mail.gmail.com>
Message-ID: <CAMuHMdXHHG11tRnNgfmz8vEUE1vn_Eb6qjroK470w=ERfmP=mw@mail.gmail.com>
Subject: Re: [PATCH v3 17/25] ASoC: renesas: rz-ssi: Add runtime PM support
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
> Add runtime PM support to the ssi driver. This assert/de-assert the
> reset lines on runtime suspend/resume. Along with it the de-assertion of
> the reset line from probe function was removed as it is not necessary
> anymore.
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

