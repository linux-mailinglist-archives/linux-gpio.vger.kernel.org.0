Return-Path: <linux-gpio+bounces-6955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F428D4D1F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 15:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23A851C22216
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4675917D891;
	Thu, 30 May 2024 13:47:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C71186E4D;
	Thu, 30 May 2024 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717076855; cv=none; b=OQgnbtvKbmm60uV6vfEDUvD+RpiTHPhvERJVjuTb0KLnA5R1a4DfAF9stYO52phBb6yra//FZKeBiiCxacX4npjroA4uOAvpT3T7xR12W9z5kPKAhEqLYXNdDZiQE2VXhQUyw46IwR2YKwg76PybGRg2JorMHUMenXif9JJOECw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717076855; c=relaxed/simple;
	bh=twCBzSon4LhFvraE+ZnDqOij6Val8beNSztsSWEeegw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aA/fH995lE+4eNoDQsuzee72tDKRyL37JmAwHFLWRq6E7tmzxDL6FGJ3S+jHIsMpBr9oCe0E53RV+UVM1BNXvBWY+n0neTn+frPyOerNb9BZ6ZddsYYeg6lArupS96l8+Kzeof5ZGK5NOtzHyIDritsEc3abZ/GmRBUlVtXGy0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-62a0849f8e5so8295857b3.2;
        Thu, 30 May 2024 06:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717076852; x=1717681652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jlnWNCh57mn/Dh9+DEqeDbHcBenKZqeVO8hOxncfOY=;
        b=JLXt7V6bIBt0xbaYmWNLfHJhI/F+7OkPs5X2LCLiIC0kRgR7ZpD67WxcfAQ/1Mh5xM
         VO5k5fxnT9eSD8TJtOui/m+BEJTdKkZMLuqdFRmFYIU+EWXDwaIKiAGc2OiNBBLxnKH8
         A7cZk+hfXduok4r5XAJSV9kaKg7qz2wQfFiCjnLXJQvG+gKIJJ1ANja8bTNYq8uFnR9u
         KHLn1Gnv51TAgSH+MMSdYV6yH217E9kjNGZmgdy9UKzWO24IvpJjSBCYUbfepSsEuAdt
         ags/2Pp7ZdbPpxFW8bw/3jfT8+NKzblFhuCFbn1Gz18gzWhBe73g8+2xRpBxrwZbl6MY
         GlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFIdb+wo4O1TaOSlbutxdEAb/rjOnRLEPZLKwMHisSLRkVIYV8lVstV6LmrM8i/YYSTVWueJDfO9lvF3Oxv64pmcTTDRUFY39kp1z1Zkco3WmkVfMZCA4LxEajEa/ZEB2C8ZVRIrUR6bCnxFTJWN1xbjMs92y/cNZUP5OjmYz5yikdcIusfaG/SQVrbnwtqYdXnor6b4ooKiuDswbtOb0GPok5nauraA==
X-Gm-Message-State: AOJu0Yx5beMsUmE4g0P34zGecW7cZGB9MbvIx17/fISCUPkT8uk6humZ
	wZIbcSkeBp1mKvT5xLnKKh+XUaK6jz8CCVymZVdSCIqnRWBR2EJW89hpNRni
X-Google-Smtp-Source: AGHT+IEPt4exj9M/i8D3wefmEry779p4aqM7/PBgKWJv4vaP+cJ9HjG5miNxjpz7/AycEhdo4qhG0g==
X-Received: by 2002:a0d:d48b:0:b0:61a:e2e4:454d with SMTP id 00721157ae682-62c6bcc02admr22620557b3.45.1717076852277;
        Thu, 30 May 2024 06:47:32 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a4ee244sm27964417b3.77.2024.05.30.06.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:47:31 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dfa586054f9so934154276.0;
        Thu, 30 May 2024 06:47:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiJbGEXalo/GkqysAX5WXcmC64x0vGNlOK9M82rfV45s72KyPuW9ZpL3gZI5Bvnwf2OrA4vvcbnf88YI3D7uq4a0jCBQ9eM/JkUqDhqOgIvFVzkM6h4bXL0SDA2pj2hc7p7T2mHlJ4lLgn3sLoE2Plh6P+qYbYwrOK4JhIKc3QpHYyu4MEfgOPcHdTNv8XfiqwU3MzvykSEUwyykMhpL7/qHFXNEIqpQ==
X-Received: by 2002:a5b:a44:0:b0:df4:d367:6bd6 with SMTP id
 3f1490d57ef6-dfa5a611ccbmr2205084276.29.1717076851733; Thu, 30 May 2024
 06:47:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com> <20240524094603.988-6-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240524094603.988-6-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 15:47:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwgrrt3FKDD6A-HO09T6fT1-Kh3+_vnwLx8JqaWpRRKA@mail.gmail.com>
Message-ID: <CAMuHMdWwgrrt3FKDD6A-HO09T6fT1-Kh3+_vnwLx8JqaWpRRKA@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: renesas: rzg2lc: Enable Ethernet TXC output
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 11:47=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> Configure ET0_TXC and ET1_TXC as outputs on the Renesas RZ/G2LC SMARC
> SoM, as per RGMII specification.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

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

