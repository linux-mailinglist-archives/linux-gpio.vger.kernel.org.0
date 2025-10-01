Return-Path: <linux-gpio+bounces-26717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9BCBB0318
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 13:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8442C171E53
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 11:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B65E2D0629;
	Wed,  1 Oct 2025 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F52lhUAZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F72C3248
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 11:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759318626; cv=none; b=tImNKSdWvzGxzw8xXf7dlI16KqcqNQaoBwEiFWqHgnDr2p5KweSYQCFDjmow7GWmcBDiRahKRmIEMAh28Y4BfcDSc76G3V3AlHDkom5priPJ1UH41BlqZrpy1OKgUG2rIqsjG20DFoKE+opTd30cBUsS5pq5mnH79gukrer/xIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759318626; c=relaxed/simple;
	bh=Oh9tqT4BXfVxU9Z6FlbTpMfqC65Bh6cRSDairEHuhx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGb8oG4IPz5mtt6C867NqG9sgB9XxeSRF90QjBFMQaWoR/Gfh5DHNbb8a2xRUi0bEF+ndBv5PJxLHeNfO2WuUd38JcYQbHDe2YfpXnb5sTvmy5JtpLt+s2YoTn1f50MCU8f+Q0mk7p3e5y+vKbZJTDAvV06joMlufJpMxgPAYEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F52lhUAZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso1211650e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 04:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759318622; x=1759923422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yA7aQRihrsbAM2bYPKB7h4TTWbFXDP3J7TuvZ5SMQX0=;
        b=F52lhUAZ+z3M7IW9S/RJjHdbesG/xia29zuhJ/Dor9J5s2Uu2X5IGHj0Sy6w6mBN+H
         l5qnojNbC2u1RZtkAASw9SwEDXzhThAwby3leLMlMfBVSzSmcIMtPwmWohOWJuaD33Pe
         uiYo4KOJlVgHZctsF0j07FOfeQ1ktRfNNO7kJTJkAL1KJaQOJHY2H3Mx6QWk85qhqSGQ
         Hl9bf8TyYLlibhj7QnrvJW6vBGxG69NDUUIaZg4pAAVjQU5um9wzLAyCRpOH35dh50H3
         R7DPjFPp9TpaeUVJ2LVMKR09ltSyu+S2fL88smi4G18IWlRfp+qJH1Z9u+vSgiKgO6pd
         7A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318622; x=1759923422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yA7aQRihrsbAM2bYPKB7h4TTWbFXDP3J7TuvZ5SMQX0=;
        b=IlyjIGo9o+PP7IRElzI1gHfkCLPqTGl/Z8PUld5bybvlC2VIoWfeipjBbSnZfVmhht
         XGGiXW4R2PtEeDMmV2+E2ngujQsOsM5c+NTf2wNJKAF92qQBZGYgeFoMmwSYHXNTH6YW
         R3wqKzcstYJ/1doK6pEng8Birnhm9UKs6IDGUpTAN/oxFZU/zvXqHPF8gqRT3otyko5L
         EidKCwODz/hWo+Hh0mgwsls1cYAR9Bv5feuL6qkG0fDRmT9OTQY3GW0bpiOakrBqThDF
         8iCD20ad8n/627bbLsiUl47KjhhQDYpyNEhsjbQgiqK7mkY5JkeeBPP+Xk+zvxfy3Mf4
         Ageg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Pj9vP4uEsW9E3OmB0g2n6NApR12GSCTFTvnI6BRVBZkLpwz0r8MBAt4rIRAikj+RVpA1B43mitnG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9lShgsKFCQmamkuuvXfr2uye+ahSsOF3mJryKscFPFaH3wy74
	sHyOQjxR7WL0zEit20e29gKvfSl9onL0ROFz7tSgYAYvxCoek61j9687uLSS30X5GkL0RIS1lcI
	xDiUQYSeiJpTfkSL+hOpTJIjh4EEXql4IQIZS03FPyQ==
X-Gm-Gg: ASbGncs7fPLz5sIh3Sc0A9STbgyROinNNgPr9fhS40v1Ko87k9CbmVRAjKQHKwQ4sM3
	7yJ0PlVXjkLC8/eqYPWC5DWnW11dTdZDU7HGebHHQaZRk146LC3G0EViDUcy0BdElaHsouNJ2fK
	lixJqwG74siKWFBkqlwjLvtT/nFE/2VkTQxzWOXuT0uOmvQIuqksxqYtttQOBFeR9iaa6IOcZew
	EssChlhAfvs1Rml92oe7z5s3JjPLAk=
X-Google-Smtp-Source: AGHT+IEZ39wDf5y2+FoKl/S9Pd1gyU4eNs2R/nqxRPqYxaEmOIsx03SIZ7rGxTx1idd5o96eAnjGrysxostm2ToXY7o=
X-Received: by 2002:a05:6512:3b88:b0:585:1a9b:8b9a with SMTP id
 2adb3069b0e04-5897c348c2dmr2779744e87.9.1759318622276; Wed, 01 Oct 2025
 04:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-manpower-glacial-e9756c82b427@spud> <20250926-unshackle-jury-79f701f97e94@spud>
 <CACRpkdZ5RCcaNJB_3ufAgpDtdJBKfOVrMbJVAQWaVSOkY0-XNQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ5RCcaNJB_3ufAgpDtdJBKfOVrMbJVAQWaVSOkY0-XNQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 13:36:49 +0200
X-Gm-Features: AS18NWA9lQqxjLhryh6mWRwM5YU-v3y1Ej1S_ygRo7gjKky6YWFY61RMFP-QRag
Message-ID: <CACRpkdZo=c0BnSLm=FKRMNYKEaPAHBgtfhD9txhPofts4ApDkw@mail.gmail.com>
Subject: Re: [RFC 3/5] pinctrl: add polarfire soc iomux0 pinmux driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 1:34=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
> On Fri, Sep 26, 2025 at 4:33=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>
> > +static const struct pinctrl_pin_desc mpfs_iomux0_pinctrl_pins[] =3D {
> > +       PINCTRL_PIN(0, "spi0"),
> > +       PINCTRL_PIN(1, "spi1"),
> > +       PINCTRL_PIN(2, "i2c0"),
> > +       PINCTRL_PIN(3, "i2c1"),
> > +       PINCTRL_PIN(4, "can0"),
> > +       PINCTRL_PIN(5, "can1"),
> > +       PINCTRL_PIN(6, "qspi"),
> > +       PINCTRL_PIN(7, "uart0"),
> > +       PINCTRL_PIN(8, "uart1"),
> > +       PINCTRL_PIN(9, "uart2"),
> > +       PINCTRL_PIN(10, "uart3"),
> > +       PINCTRL_PIN(11, "uart4"),
> > +       PINCTRL_PIN(12, "mdio0"),
> > +       PINCTRL_PIN(13, "mdio1"),
>
> This looks like it is abusing the API. These things do not look like
> "pins" at all, rather these are all groups, right?

Or maybe they are rather functions. Like there is a function spi0
that can be mapped to a set of pins such as spi0_grp =3D <1, 2, 3, 4...>

I recommend a refresher with
https://docs.kernel.org/driver-api/pin-control.html
and work from there, and avoid looking too much at other
drivers that don't necessarily do the right thing.

Yours,
Linus Walleij

