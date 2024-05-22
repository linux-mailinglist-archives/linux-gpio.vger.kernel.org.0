Return-Path: <linux-gpio+bounces-6553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 588028CBEB7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 11:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 682F51C22106
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 09:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B242181751;
	Wed, 22 May 2024 09:57:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF63E81723;
	Wed, 22 May 2024 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716371866; cv=none; b=Kg0S8wW6MsqHa5qW2veOqSyQ4m4wuYEGDLIzv4+C0IuLY03bEgsYiD8zDCnqm3KBC1sHvgONmMg0H2Fer2f6pmGb5afmyxN3YbLZYu6CoZ3u1dg6THuwYAlEewLyfxVyA6yeR+kx8ZmpymW4DDc24zGzQGkt8Jng2k6G+sGJP7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716371866; c=relaxed/simple;
	bh=oRhZ+hkitej8QLEV7TjmpBTnEXYNkbKTGXWL5E1m5TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnMLTjF6ZefXn1rAaW6NcQ8PoqKDISG8SAAlk9ErB+9LyDq4Dwfs/v/q6KcNLOUlXZ4T9XtkLHoMAWqzys63oE5rN5v2ymBscZDPAzlvph3WPmWBN666r4lIDhsum3PqYa/g1n8GO+w27udHcawYNa67d6e4F7W4HVyfxiAAjjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62036051972so51029857b3.1;
        Wed, 22 May 2024 02:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716371863; x=1716976663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQUqzHvmyAFsXTEe5p45/nDuCGsXZRnjFI+azIsZoY4=;
        b=WUqCaRJGYT7TJNyeKFVVHTNgyPC+sN8Fakxk+XClyxFGNysf4+XaQ8MZwUPQFW04zG
         KJGHBLsxwfQ5hZ/AGo9g8E2lc8kxW/olbt7+qrgHz36e4IWHV/LJbiHFwUd0/wpVHM8L
         QEBBEviex18YdYLzhhpiTbf20Njm01F9b0TwYrYZOQoiBtK+gGiZOKhe+YZ/GF/maI8E
         DLjgnMe0ZTjHoQQsZCUtKilcpEIguVtc2Axh0FmQIv2EyqkHuIamn1yMJY6tacYGO1nL
         VCY96ZbFdJRdRgFIT/pi2QkCGv+sNOoUOyjpb8d5KVwGrh3PZGBrURgdblaEiW6Yg/V4
         IrnA==
X-Forwarded-Encrypted: i=1; AJvYcCUMWrJwdCDhshHC2z4Gw36WKSv39aPNSTUC0P+4gtsf+bjuUSY0nnD9lq2lU6H6xNygqBv4upHv120VfOT8OhkQrZJhjuyseZyz3PBJTgMg9qZRyApdRq9PeAwkKegLb2ByWFX1MVR/5CPWIfSP3Ybm/BoGSbusYZkSQ7yN8uv0I2DM2DK0SBXNxTJpy72ryka2E7mFg0GYK2ORPlomAExGa4+fTXYRNw==
X-Gm-Message-State: AOJu0Yx8NSLX5JFUaa1kHP+FotV10nadfO3LYXVL2/zHq0O20RPfVa+9
	Z4Gmk8bf6WBA2QwUAqYU6itQbb6SV1AbPL51LQ87rUjbBukbpO+3nnwlWX8m
X-Google-Smtp-Source: AGHT+IEB9NRIOWnTUbxg/Ad3FS5WcBSQh38DZCgPzil/W6hyl3srPeJxdp4Of6U2U1CKlEbKnRB7qg==
X-Received: by 2002:a81:a18d:0:b0:61b:a7de:1f8c with SMTP id 00721157ae682-627e46a4872mr15269317b3.2.1716371863023;
        Wed, 22 May 2024 02:57:43 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e347048sm58291807b3.82.2024.05.22.02.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 02:57:42 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df4dda88ce9so728341276.3;
        Wed, 22 May 2024 02:57:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWpSMDCFHdvTby375xo4tw/iK9gWgkLtGJozJC6n9xx2W+CtvHlUqS/ohAeVRbeyh/hEwjgHu1k8lxAlIR7JePpJeidNhMX1NKyPdDe4I8bm7awrIQIy57Do5JSsmT0q28mdB4e4zEy/a1SGlBEcS2gcWssePuPddOFdPQG6l3joFfhnpnUc6VgaTCpdVf+r+Kz8/NhFtE5cQuvjwmDt9a4RbcaS4hfA==
X-Received: by 2002:a25:854e:0:b0:deb:d87e:b2c7 with SMTP id
 3f1490d57ef6-df4e0db9859mr1397700276.49.1716371862361; Wed, 22 May 2024
 02:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 11:57:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzio8eYndKGjUASw964FtYezBW=E_xapDZ7F4i7Mi_rA@mail.gmail.com>
Message-ID: <CAMuHMdVzio8eYndKGjUASw964FtYezBW=E_xapDZ7F4i7Mi_rA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Remove the check from the object
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
> Drop the bogus check from object as this didn't really add restriction
> check.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> RFC->v2
> - Updated commit message
> - Collected RB tag from Rob

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.11.

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

