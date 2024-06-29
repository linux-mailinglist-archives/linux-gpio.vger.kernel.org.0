Return-Path: <linux-gpio+bounces-7833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5D91CC6B
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 13:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A682283010
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 11:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8841F4EB2B;
	Sat, 29 Jun 2024 11:35:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F6F1CF8D;
	Sat, 29 Jun 2024 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719660956; cv=none; b=tfp2xG0/BIEgHk+S2J5KsHZ0xITj21MZ2qUEMHBEBsefTfzGGAcgJiuoHDTYREmdzJkatsBZ9esYOvYVL7PzTWPhakpWFsCx9xZ3gAwUWG3xixaSFIrWyYgamKIQHcuetAbzQZYIF2wGHaU7S/5736L1xc9fkFmxbIcTYq5ZRSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719660956; c=relaxed/simple;
	bh=KHYsi4NzdHdqcK0JtApKxfLj2hbF4AXMBZAsTJbNacE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2xUs1+OkvE7B9iaBcR64E91EdWxDC4Ylozjk0N8N2Obs7tnNuqcV0IRiPTo85HeW3QJc9BViXleNvrmByzLYmp6G5QSNq1lhqXsdep9G3uwSn2FZ+UleUOoiwnQfQzuCKY/hLC3W9xKnzgG5uR7Fl7esFhGiVKaUhPlK/SlbNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-64b5617ba47so11617137b3.3;
        Sat, 29 Jun 2024 04:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719660952; x=1720265752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1S1yRV7C3FxWUhUHxRqIh6Hp71QQxiOPCiDvVMr4BEA=;
        b=QO8cDSZhCQd/9ksx2LaA4FIqDJpcj9lKLR8fTB3QW0MCGZK8GVqOvu5Jm6RDFj8ruJ
         LctctJ+nsZaQ25ZePrGMLLhsgCeg6sRrb5FTf/9BrLbuo3olp7WxD2jc1bGSX75s7n2l
         l+Uz+vmad4sD97H2oAUurmEKXRleyCvmtOGcLuBdkTOzyezPnpxqHkU9dhYfd3USkDTW
         PaMZ7Fbi5VmgNnS2ww3gjsblDtwAFTlhVtDPOmxg63XzXX4bH+jbUONZjfJQibO8xROB
         WdTRP+20HhZpoAY0pEh6SjybXYjeNrL0CYrGD8vpIXYUFhHMiNUMKDirK7YDpE+AjWwh
         6C0A==
X-Forwarded-Encrypted: i=1; AJvYcCVPzJfaQHuEPxKOdMSaXoh1JJIMQbgAul+JxR8DQx0YoRJYVBrO+q3G43Sg6fYEyIDPk5wQq+S88NM+vyjK+gck4iWEQ6kYtGWa+wR1i5pffjZq51O8XmTm3zAZme6qyZM9O90ZrpFMfsAPn7wG834m22aqh9rdDSNOkz8si40lhtdyRwVL9Gy/d4ZukNm69hV/sgbC2eBybrsw5nJxuj+xlz99lapgdg==
X-Gm-Message-State: AOJu0YwmSsTZh040Q4eWlpVtUopj+eJXmIjQmQvB/+wNv98wM1QiQwfs
	6OpOpiyqlKmu2ScqXHklH2jBsgizS0M4eNKXalQFZdQXAtIxLTGoEBUNzPNA
X-Google-Smtp-Source: AGHT+IGr4jG4lHbu9IjBZo6YNejiX7X18+BSleKOGoND+8h1/4MeKbOM50Mdc0RjsghZLgUnNOVnPQ==
X-Received: by 2002:a05:690c:a9d:b0:647:7782:421a with SMTP id 00721157ae682-64c73ae898amr5641387b3.45.1719660952388;
        Sat, 29 Jun 2024 04:35:52 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9c405db0sm6520217b3.130.2024.06.29.04.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 04:35:51 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-64a6bf15db9so13936047b3.0;
        Sat, 29 Jun 2024 04:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV16s/rWF9eNg7VOH5iuoPGFCBano1zzZ1dHO2gkXUs96XwQ1+wzZCfKn29FX6EdkFnSaZvH868xSlh0HCCycyNNMcWXVnoKKeDPCj8/chkgnvqe/VRX6qZRUzEdRXTEwD7fWS/sa1G0BGNa1P/+Qe3Qgwefo/suLkQqr9wzYhep0GHmmi3SzsLl4IKe0rD4xBF+FOblGVBwXqNmpbKKlMytCaLJZasSA==
X-Received: by 2002:a05:690c:24f:b0:647:e079:da73 with SMTP id
 00721157ae682-64c7114570bmr6412747b3.10.1719660951106; Sat, 29 Jun 2024
 04:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716974502.git.geert+renesas@glider.be>
In-Reply-To: <cover.1716974502.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 29 Jun 2024 13:35:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtAPebwHkEcp+PcAxP-BfP8wqmX4BYOc1TC7mCex7Fsw@mail.gmail.com>
Message-ID: <CAMuHMdXtAPebwHkEcp+PcAxP-BfP8wqmX4BYOc1TC7mCex7Fsw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add R-Car fuse support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srinivas,

On Wed, May 29, 2024 at 11:29=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> R-Car Gen3/Gen4 SoCs contain fuses indicating hardware support or
> hardware parameters.  Unfortunately the various SoCs require different
> mechanisms to read the state of the fuses:
>   - On R-Car Gen3, the fuse monitor registers are in the middle of the
>     Pin Function Controller (PFC) register block,
>   - On R-Car V3U and S4-8, the E-FUSE non-volatile memory is accessible
>     through a separate register block in the PFC,
>   - On R-Car V4H and V4M, the E-FUSE non-volatile memory is accessible
>     through the second register block of OTP_MEM.
>
> This patch series adds support for all 3 variants.  It provides an
> in-kernel API to read the fuses' states, as well as userspace access
> through the nvmem subsystem and sysfs:
>   - R-Car Gen3:    /sys/bus/platform/devices/rcar_fuse/fuse/nvmem
>   - R-Car V3U/S4:  /sys/bus/platform/devices/e6078800.fuse/fuse/nvmem
>   - R-Car V4H/V4M: /sys/bus/platform/devices/e61be000.otp/fuse/nvmem
>
> This has been tested on R-Car H3 ES2.0, M3-W and M3-W+, M3-N, V3M, V3H
> and V3H2, D3, E3, V3U, S4-8 ES1.0 and ES1.2, V4H, and V4M.
>
> For SoCs where E-FUSE is accessed through the PFC, it is not clear from
> the documentation if any PFC module clock needs to be enabled for fuse
> access.  According to experiments on R-Car S4-8, the module clock and
> reset only impact the GPIO functionality of the PFC, not the pinmux or
> fuse monitor functionalities.  So perhaps the clock/power-domains/resets
> properties should be dropped from the DT bindings and DTS, as well as
> the Runtime PM handling from the driver?
>
> Changes compared to v1[1]:
>   - Drop RFC state and broaden audience,
>   - Fix typo in one-line summary,
>   - Add Reviewed-by.
>
> Thanks for your comments!
>
> [1] https://lore.kernel.org/r/cover.1714642390.git.geert+renesas@glider.b=
e
>
> Geert Uytterhoeven (8):
>   dt-bindings: fuse: Document R-Car E-FUSE / PFC
>   dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
>   soc: renesas: Add R-Car fuse driver
>   pinctrl: renesas: Add R-Car Gen3 fuse support
>   arm64: dts: renesas: r8a779a0: Add E-FUSE node
>   arm64: dts: renesas: r8a779f0: Add E-FUSE node
>   arm64: dts: renesas: r8a779g0: Add OTP_MEM node
>   arm64: dts: renesas: r8a779h0: Add OTP_MEM node
>
>  .../bindings/fuse/renesas,rcar-efuse.yaml     |  55 +++++
>  .../bindings/fuse/renesas,rcar-otp.yaml       |  38 ++++
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |   8 +
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi     |   8 +
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |   5 +
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi     |   5 +
>  drivers/pinctrl/renesas/core.c                |  18 ++
>  drivers/pinctrl/renesas/pfc-r8a77951.c        |   2 +
>  drivers/pinctrl/renesas/pfc-r8a7796.c         |   4 +
>  drivers/pinctrl/renesas/pfc-r8a77965.c        |   2 +
>  drivers/pinctrl/renesas/pfc-r8a77970.c        |   2 +
>  drivers/pinctrl/renesas/pfc-r8a77980.c        |  14 +-
>  drivers/pinctrl/renesas/pfc-r8a77990.c        |   2 +
>  drivers/pinctrl/renesas/pfc-r8a77995.c        |   2 +
>  drivers/pinctrl/renesas/sh_pfc.h              |   4 +-
>  drivers/soc/renesas/Kconfig                   |   8 +
>  drivers/soc/renesas/Makefile                  |   1 +
>  drivers/soc/renesas/rcar-fuse.c               | 201 ++++++++++++++++++
>  include/linux/platform_data/rcar_fuse.h       |  11 +
>  include/linux/soc/renesas/rcar-fuse.h         |  41 ++++
>  20 files changed, 429 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-e=
fuse.yaml
>  create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-o=
tp.yaml
>  create mode 100644 drivers/soc/renesas/rcar-fuse.c
>  create mode 100644 include/linux/platform_data/rcar_fuse.h
>  create mode 100644 include/linux/soc/renesas/rcar-fuse.h

Arnd pointed out on IRC this should probably be an nvmem driver instead
of an soc driver.  I had mimicked this after the Tegra fuse driver,
which is also an soc driver.  The in-kernel user would be its main
user. The nvmem interface exists just because the tegra driver did
the same.

After some investigation, it looks like this should use
Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
instead, and handle it like e.g.
Documentation/devicetree/bindings/nvmem/sprd-efuse.txt?

Thanks for your guidance!

Link to this series:
https://lore.kernel.org/all/cover.1716974502.git.geert+renesas@glider.be/

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

