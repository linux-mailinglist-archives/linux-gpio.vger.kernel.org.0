Return-Path: <linux-gpio+bounces-12040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0919AF585
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 00:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A49DB21475
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 22:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6932185A5;
	Thu, 24 Oct 2024 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vqs3Mhn/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5083A217318
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 22:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729809503; cv=none; b=Ew/PNTQlq5fp+p9/e+F30LhkcEs5Rflneu/4FMJbctCib8PYutal6hcVglGyrtCJd8yV7lDd3zWfmKhxYwS9jH/1us+ZVJT265yCmLWFySlQCpv/qq7tY2pl8yOpk80XvJFjh0wRNHVBbz0uUa2b8018mC5kRF2LL8aZ4e/hRgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729809503; c=relaxed/simple;
	bh=X8VlimnOpM3aYSaRCVCsg/PKQwzSkTGsHNQgqT+QXbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjIJB/eAVijEhYyj9tyGCpWHBIjswitDuYfL1CECMcLBggaSDAmXPeOUm2IIis9rdPlu3quHLRpB4GyaDuSaun0g11WNtj22RuQsQc/tIVN/weslR+2B0tXyIVw5wcQGwp9i1sDAHJfg9G3GhjscA+IKeh3zRzV6xSk9jKdphB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vqs3Mhn/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e13375d3so1702285e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 15:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729809499; x=1730414299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sd8x1e93gyeJX8KDkGrIIHUTJan7juKooq/kAucfUrQ=;
        b=Vqs3Mhn//W33/enae8vuFIx5z323FRts3jxve4kgRbrT+DsJqkH9oQEh2Ct1edco6x
         vO2q0nyOdP5FVMTMc7mOaTbgiYYTJkablH+Ef4mffbWVJZtxf8M/OBQGQTJcsSB+PV6L
         Ro4Cwbyco6Xwnc/QHAU2vP8D9BNJ8vpeuhu40AZ2S/9owwj9vP/oya+/XOw2MMzqv19Y
         f1jPRwzipoNuPThalOsRlbUAe6303AmIcMMkkJpSChNVgmH864vCDl8mqIoiDK68ChBy
         /Uv8Ro65HiwtDG6Ph4S6V0K1xkMSadM7TgeQcLHrNVFkvRPWy6hZHYWvVOwXYm6uQMGO
         rAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729809499; x=1730414299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sd8x1e93gyeJX8KDkGrIIHUTJan7juKooq/kAucfUrQ=;
        b=LEWjfbKZvGLQ/MPHGoyKlrqWn4l54b0UUzJckeOH3anZvvrRqUHaAVnH//Vxyy1uKo
         j9D/RRN1m+MhMjiT+CuPYh1fLhporYCMjt4embaps0tTyovG8WSm2YTp3yRr4cQNN5Jn
         c066iYayf5kPswxeAwz94hpmieDYecmNiR5S0vx4bIwo2UK0P62DRsrTq154nY3DILlD
         FddsotPh+BX174X91KBaIgIsV4OiFQQjozODAmHq1Qd2sUEr7n0/zf6zn0ZUbQI3IBHW
         Atq+7T8rjYyKH+NKw7JHQ/kEgw2iQT2/xKPMVKjHKhXuxBQagMlYLldsULATg4leiziH
         ybQg==
X-Forwarded-Encrypted: i=1; AJvYcCUWXLztNJJayRJKG8FwFJo42JT2gF2sAO5QjqREsOMRaMZyF9dnTT0dBqtjnqg+81g3xhFiA3flqAFc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyrmtq3rmt4NKspSLD4Xdwv0e+ULbUaXBO5VNnMnNFwExvm4mH
	5V2lKYSkEC6DXpa6wCf3TfW4HZw6eg+v8mGhhRfIVu81zgnT1zugH/ydZezWQAyRf09fsj1tR3f
	MrQ2j3imDlU+kIZMdScgUOUBEhSDX78jcQ8mEhg==
X-Google-Smtp-Source: AGHT+IE5xxtC2Rc24n40JWosDcNQf9KHvHXEMlpBefnnaFUNn8d62HXfg1mRdDkM6cR/UQGw/6tcJB7OYxes1hC/wMA=
X-Received: by 2002:a05:6512:a8d:b0:539:fbfa:4a9f with SMTP id
 2adb3069b0e04-53b1a3a7a4bmr3558958e87.58.1729809499262; Thu, 24 Oct 2024
 15:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com> <20241022155658.1647350-8-antonio.borneo@foss.st.com>
In-Reply-To: <20241022155658.1647350-8-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 00:38:08 +0200
Message-ID: <CACRpkdZKimfE_00kxa_qAf+jjwxBtuKizDTd3RvOS_PDuZ_JKg@mail.gmail.com>
Subject: Re: [PATCH 07/14] dt-bindings: pinctrl: stm32: support IO
 synchronization parameters
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Cheick Traore <cheick.traore@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonio/Fabien,

thanks for your patch!

On Tue, Oct 22, 2024 at 5:59=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
>
> Support the following IO synchronization parameters:
> - Delay (in ns)
> - Delay path (input / output)
> - Clock edge (single / double edge)
> - Clock inversion
> - Retiming
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
(...)

I want to check if we already have some of these properties
and if we don't, if they could and should be made generic,
i.e. will we see more of them, also from other vendors?

> +          st,io-delay-path:
> +            description: |
> +              IO synchronization delay path location
> +              0: Delay switched into the output path
> +              1: Delay switched into the input path
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

This looks related to the st,io-delay below so please keep those
properties together.

Is this path identification really needed in practice, isn't it
implicit from other pin config properties if the pin is used as
input or output, and in that case where the delay applies?

Do you really have - in practice - pins that change between
input and output and need different delays at runtime (i.e. not
at startup)?

Otherwise I would say that just checking if the line is in input
or output from other properties should be enough to configure
this? input-enable, output-enable to name the obvious.


> +          st,io-clk-edge:
> +            description: |
> +              IO synchronization clock edge
> +              0: Data single-edge (changing on rising or falling clock e=
dge)
> +              1: Data double-edge (changing on both clock edges)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

This looks like it should be made into a generic property,
it seems to be about how the logic is used rather than something
electronic but arguable fits in pin config.

Isn't this usually called DDR (double data rate) in tech speak?

What about a generic property "double-data-rate"?

> +          st,io-clk-type:
> +            description: |
> +              IO synchronization clock inversion
> +              0: IO clocks not inverted. Data retimed to rising clock ed=
ge
> +              1: IO clocks inverted. Data retimed to falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Doesn't this require st,io-retime to be specified at the same time?

Then we should add some YAML magic (if we can) to make sure
that happens.

> +          st,io-retime:
> +            description: |
> +              IO synchronization data retime
> +              0: Data not synchronized or retimed on clock edges
> +              1: Data retimed to either rising or falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Can't these two be merged into one (generic) property:

io-retime

enum [0, 1, 2]

0=3Dnone
1=3Drising retime
2=3Dfalling retime

Retiming seems like a very generic concept so I think it should
be made into a generic property.

> +          st,io-delay:
> +            description: |
> +              IO synchronization delay applied to the input or output pa=
th
> +              0: No delay
> +              1: Delay 0.30 ns
> +              2: Delay 0.50 ns
> +              3: Delay 0.75 ns
> +              4: Delay 1.00 ns
> +              5: Delay 1.25 ns
> +              6: Delay 1.50 ns
> +              7: Delay 1.75 ns
> +              8: Delay 2.00 ns
> +              9: Delay 2.25 ns
> +              10: Delay 2.50 ns
> +              11: Delay 2.75 ns
> +              12: Delay 3.00 ns
> +              13: Delay 3.25 ns
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 13

This looks very similar to the existing "skew-delay" property:

  skew-delay:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      this affects the expected clock skew on input pins
      and the delay before latching a value to an output
      pin. Typically indicates how many double-inverters are
      used to delay the signal.

can't we just use that?

Feel free to edit the text for it in
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
if that is too clock-specific.

Yours,
Linus Walleij

