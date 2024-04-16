Return-Path: <linux-gpio+bounces-5535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 546A18A6BB2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 14:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ACF11F2284D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 12:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F1112C466;
	Tue, 16 Apr 2024 12:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fWuVeGxy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25A6129A7C
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713272383; cv=none; b=DEKQbzwkHozMrLPufXxYBQMuodIe4/QoBRQRhPbqJGgKrkCT0Wh8P6/9Ka5vt+c59OgqciQO6gOudN+J8RARgiw8nyJb+4uUP1+HQPq6vdRKVlIGk70nG2sgX4n2ra+l6pCnD5t+crEeBbkOjuEBgSF4UACIZVCKJrEgqoTFHXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713272383; c=relaxed/simple;
	bh=9vivecuqLxpWcVVbWBg8R8WXEJKMUnErDIemeKW5USE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7rh/at/GPgllnMOZkogf4PfdUbnuAGnD/PsrGHbFzR0BAJLyDIACBkjFj9K6LSxvAtBncnof6Oyv2rXo0USpRCGf1l3Nqv12gw/bf7LAMj/lkGcC3/Lp71o6ZrIkwumrlKcstyAMN5BSK7QIUeVAsSbolq1OGsjPZWT5zK9PJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fWuVeGxy; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so3946785276.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 05:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713272380; x=1713877180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vivecuqLxpWcVVbWBg8R8WXEJKMUnErDIemeKW5USE=;
        b=fWuVeGxyxPgETmTTeCMdLQPwf36BDU361Prf2sTsF1WtlF9XyT32w/dk9Vz88ftzQk
         YI/iWh9bZzusdXsBPDc8ERtqv/NlIJFA3tRKPNutl/iUu1ovQ5mYCHZIh3O1eqa5dCns
         4la/Ea/nRbEuG/HK/jOQxYpCm6k6mTpAgcw5ntcDLw/NyAsgK0Ti3OuF3OBDXeTVKvg2
         DjDtylE0qES57Fmjygs9jIQOpjeeETfIakDTtatWwkmBP653O/lNwvmK6Yj/mL+3f0C/
         erDmhZecwsNwSfGzLc/3z3jZOUnfziroz6ijx6zHmkAWyMp7WdFgjeqMQlhhKg55t04J
         EaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713272380; x=1713877180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vivecuqLxpWcVVbWBg8R8WXEJKMUnErDIemeKW5USE=;
        b=lrPmQ/mJENdIM1GyTvuFRorCjS349vxO7NK7+Zb9scBuLmVLwbhaP2dbRJxjPxHFLe
         EyrNPSSHZP3o8zNLmzbS56XmdUjJdgePfFWqMby7xSfe7Tbr9wSC2k32tK74wQ7157HJ
         jHTAntUJ8Z64KbwkS1aIUwmm1IeRF2KxlJ60o9VJQSWa4njnBILv4DbYNbaMESZMKeO1
         sPwclZO/cjp3U/5eBHiYFNsGrRWQnCzZgSOrTI00GsgcByQ6rFo1RXVzKITsDFV3UaTX
         NsDUFUTVlZVaLF3IkyhQGBwVnFFsFEtlCI+f3I7n0LmRqS/BTgqcRtZ+sHQcXfgtIQv0
         kfEg==
X-Forwarded-Encrypted: i=1; AJvYcCVCXYgvPEHoTLEtFjuy5CgaonPs5e79C2Bcwr62vA4RGUtrnUX7uCmBHQoALTv9f/DkZphMDXbwltrYmSGvfUVJdcGqV5UAQNPnWg==
X-Gm-Message-State: AOJu0YzNpka/w6vgtk4n7F4s47bd4AO7zUDqxq7OL4yikMSt/VSRQc3c
	Bt9hDHVMrk0KyqFhhV+r0/XciI//Mvi3HCfD2XV+BdmpAPiBniP9pJxOUbmUj0Nc2QubGv0slOH
	qWzk1TgOdQtPsaQ1h8pTIBstP2ZcnAfE7aTVBhA==
X-Google-Smtp-Source: AGHT+IER4ET7tjdY7MFE9y9iXSWpKZRx6QzxZXviRVDxpgAQBBJ7zwMk5n1oREBP04xnwa9enbl+aCjWdoQ+zs8fiNU=
X-Received: by 2002:a25:2747:0:b0:dd1:ebc:ca2d with SMTP id
 n68-20020a252747000000b00dd10ebcca2dmr11141827ybn.52.1713272379300; Tue, 16
 Apr 2024 05:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1713036964.git.andrea.porta@suse.com> <2d1272cad92ad618297a6683e9264e31b8f2df73.1713036964.git.andrea.porta@suse.com>
 <f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com>
In-Reply-To: <f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Apr 2024 14:59:27 +0200
Message-ID: <CACRpkdbGFpFM3WKXeAy8nfXUf46GKPNBM8sfi3X-WWQJ=A9nhA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: Add support for BCM2712 pin controller
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jonathan Bell <jonathan@raspberrypi.com>, 
	Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2024 at 5:45=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 4/13/2024 3:14 PM, Andrea della Porta wrote:
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

> > +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712-pinctrl.ya=
ml
(...)
> > +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm2712-pinctrl.yaml#
(...)
> > +title: Broadcom BCM2712 pin controller
>
> This is not strictly speaking BCM2712 specific, the pin controller you
> describe is a Broadcom STB product line pin controller.
>
> Please describe it as such as and make BCM2712 a specific instance of
> the chip using that pin controller, see more comments on patch #4.

So also the name of the bindings namespace should not be this one
controller IMO but the name of the family, bcm-stb-pinctrl.yaml or
so.

Yours,
Linus Walleij

