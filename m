Return-Path: <linux-gpio+bounces-7170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE18FCE6E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 15:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEF0F1F24B90
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800571BD50B;
	Wed,  5 Jun 2024 12:23:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18E5194134;
	Wed,  5 Jun 2024 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590203; cv=none; b=Ho8KUlPSIhrds1Ue8uQ36BZ5xvbflF2w3IjhAv9jWMijMMjUXNukl89wPcoLsZaOBfMVSwO2xfs9LoJasT8aOpmu0sGpje8AvJE3jMbwcUmF6PbEZnjp5+NEnQrwJeJ/spxSMUXe4jg8XHvdhrYfPfsDZUxLzSjio6B0QQAQ4ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590203; c=relaxed/simple;
	bh=ORlbWIIpJw0HagFTlitUdIs16MJk0Dl44His+lVbrQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYwfSZDIvsb7HNvolscRZ/irmTUH2BkPcMYEzox6uWGJooPBRqrjWkXO5kH+YTeQy3IuP8vMIXesEcgvkhkxUdR+Pvle3ktLvYWyt3/3XMWXwU+s52njoLWyjEReM/tbP0mNDWelehXVbXs7OvBVw+crak1+tKa90tO+CAO1nXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dfa584ea2ffso1802472276.1;
        Wed, 05 Jun 2024 05:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590200; x=1718195000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yl35AQl2+NnXi3840SGV5tyFSlF+7tO6QF/Co15JM5k=;
        b=NnYLwujb46BFKZG3p9s2agvMj5ig+OZBRirODQx3nHk2Niw5fg1bBkgdIuwivWWbxq
         FI4MIypAqQZY6/IZjkuHq0dtb+vvOPFjbhzkSArtvscviLo5+wPAWwTz+4QW2vi6ditg
         87P5n71W6/wQcVSnt15FhYDLCfBEpeeQrjUQAqGBdBhuhqa9hlukTcmJyX2Bj54QME9+
         42M6yXLNEq7SUy8dHONbipWrwUU4UZoGnYj48cROx0oJsxoIXVdd/KkID/h5IWwpxSTB
         /rNDAH+1s+xrDAH2o1ptXsrQFXcjpx2yZCvoLrjkH+Vc7gZ0TG9A8cGj1SZUz0QHxNvT
         uicA==
X-Forwarded-Encrypted: i=1; AJvYcCUt06iG9D5mLiT7+BJNapnlE35p3tVdDYnJ0BKnha4A3NV0hFybBOv3Jv9nY9D9zF5LMqCFZ5WTRJhTawUHhbq9WLvUUJrwybz815jnbVLkoXH7Q7qWihCdD9nQQhF1rcuieri1DyvWdPgA/ydo3gCDm9jgGw3HC7Z3YFAg1JiL7P0vT5eahob7ag2YjAS9tD3SX8Xk0R+fR385AqXh26CD4wuto/kJ2Q==
X-Gm-Message-State: AOJu0YzGvJwraqt7nE0njo/fJw+MNiPgRVeL1GU56dRT1RZaKAgyhgPX
	H+SOPD9cwptPMC4CW4l6s/IcTrp5DmrOV8PQbpPAApaIasjO3uEv/U3PtBXr
X-Google-Smtp-Source: AGHT+IG6y//UKYiukGGkzrSkcXiCM5zLBeC1WiJzP7fVwVgJdZF5DsJoe8Pz4Ci2Q9WNEviM7x6+bQ==
X-Received: by 2002:a25:ab0b:0:b0:deb:cfcb:507e with SMTP id 3f1490d57ef6-dfacac604d2mr2227726276.35.1717590199804;
        Wed, 05 Jun 2024 05:23:19 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfac4dbfb39sm480611276.24.2024.06.05.05.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:23:19 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfa59c35e44so2267872276.3;
        Wed, 05 Jun 2024 05:23:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiGB6B9uCy56abF9VYZ+KIiEH19lTXGb/T7VakMkoEo1h8t1PKFpOmt2mMsErqgal0get/TFh0yHmCaBmT6XDuqOzDeBKvmPnO0iffw/Rbsg1cz7Uofo/jfv2K7pFmVmgp2e0f07GO6sXy+nx3dyrQBAnqgdEuFu6rsozIWZA134xwt1AqZVuMQwPd4tP4bPuIJ3xjYpCHIq8KlNB6W5hJVHQh81zdog==
X-Received: by 2002:a05:6902:2503:b0:de5:9d13:591b with SMTP id
 3f1490d57ef6-dfacac5f766mr2499181276.32.1717590198854; Wed, 05 Jun 2024
 05:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 14:23:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUea9MxNi4HHRFO4rTWyrMbY73G7564zNqtG+Ts4r7-4Q@mail.gmail.com>
Message-ID: <CAMuHMdUea9MxNi4HHRFO4rTWyrMbY73G7564zNqtG+Ts4r7-4Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] pinctrl: renesas: pinctrl-rzg2l: Add support to
 set pulling up/down the pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 7:42=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support to configure bias-disable, bias-pull-up, and bias-pull-down
> properties of the pin.
>
> Two new function pointers, hw_to_bias_param() and bias_param_to_hw(), are
> introduced in the struct rzg2l_pinctrl_data to configure bias settings,
> as the values in the PUPD register differ when compared to the RZ/G2L
> family and the RZ/V2H(P) SoC.
>
> Value | RZ/G2L        | RZ/V2H
> ---------------------------------
> 00b:  | Bias Disabled | Pull up/down disabled
> 01b:  | Pull-up       | Pull up/down disabled
> 10b:  | Pull-down     | Pull-down
> 11b:  | Prohibited    | Pull-up
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Updated commit message
> - Renamed get_bias_param -> hw_to_bias_param
> - Renamed get_bias_val -> bias_param_to_hw
> - Dropped un-necessary block {}
> - Now reading arg before calling hw_to_bias_param()

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

