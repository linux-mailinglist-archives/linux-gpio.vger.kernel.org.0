Return-Path: <linux-gpio+bounces-6261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5768C072F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 00:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 619EE1F221F8
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 22:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1C1133285;
	Wed,  8 May 2024 22:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W1omN7bE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F65132817
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715206162; cv=none; b=AHh87nsvfedNpX4AZ5TjvTi8pubzfyvk9TkmK1PJfdbH6ZiYpkQt08I1KySW/4hYEEYsjmzRsBpxT1CzYrPg7qbs7v+jBt1q90j0pUvRVR9zK4I2wSli5Rqjl7Durq7opoeXx+Z82uez9Jir/ew0mddiuWBEPHvRvEe95HP/wNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715206162; c=relaxed/simple;
	bh=7GZkKiNCvuTzSGNjI+sa6xXe59cl5TEdqZR7DwsLRc8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzRXZpUFJ3K5wfdudb0N2wqA+se62Rju8zQRc4JVVJZNV7ixsWaaGDwt9wU1j1w1CzEzf7sBg5R8uyLEpnyHzChGSmy5YWKi7wXV1sdOl+KTkvCeaymsXmNWTfxy4ymi3L9uHWgIcD7nUvPDmG5HJ3EKr3gWW7PvvcKkyvLP4Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W1omN7bE; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-debaa161ae3so281530276.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 15:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715206160; x=1715810960; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehIS8irD32fJXSiR/+AUSvXIjdFuXwVxp5pQitNyfHg=;
        b=W1omN7bEGhMu5wUusgAr+Ez9YtOHPSOxjEZNwmfZ5Y6N0c17cHVguITz8RifcDYVE0
         fy1ukw0FoQfXELqAK1ag+mq+fkFQPty7Wf85zQt2/X85UvCHpON1cCb5WTt5WkE6YGdt
         KSH1+bm4k1F8Is65hocyNURL8W6ywQoclGlXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715206160; x=1715810960;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehIS8irD32fJXSiR/+AUSvXIjdFuXwVxp5pQitNyfHg=;
        b=oMtanGkH8xt+uOO2L7YJ91Y5iEJ618DWOkAWeB7Ui0tPQ3wHDQva1S27jhKs3ugQ2R
         DSnGYKmyhAmQGpXoDmsuhtah3yGEFEfRpjyj8V7daePJXEtFsoqjXeCosiKM3DAMyDZC
         SZxgCiwEEPDotv142azCUE7d8qXsEI/t4fp4y5Dwt2wK0I9Asm8Cs7A+pxtnAW6p/+EB
         8HIAqUq1ilNNdpBO+NTlJ3CUUJDA5GVy1Zre/B/NZb4HihNrVHJwINATrL5Fijkg3qMP
         fQqW0zqqKg42jMPf/Dp+C/qreJtOw6caR4WgRmRKiqKZbRSg4mPuFq1NpCque7dWMi8I
         vERg==
X-Forwarded-Encrypted: i=1; AJvYcCXr1EeNtmi5kZq3auhC2mKbZG5dLcxNFqIwcVTPk2P8EDf9i02uodgEsUIZeaI4iim5ZwJdnEOiLjJudYXv9+dA5t/Nud3AdvG34g==
X-Gm-Message-State: AOJu0YzHbu+DAMrOIKVLNLccPmEwt8rTLUS4V0pIqv1MRM/x3RceMDlR
	82b+xWxJ/byQ1k2dIiJ3O5d7WAVCNjNLe3AR+6FxUJBEypevduiAhow+XuSDybHgv8W82VUOCG6
	bZWNP1kVA0LXcmr8ob4ibrgiKorlIZOUgWDZp
X-Google-Smtp-Source: AGHT+IHeqLQyeAoohwLXj5oRUs3ks0X5/F25ER37ASEsXThi1af79Xw9zhQ/fw0YIawdB4TqLox+CozGdVTUEhPI4tc=
X-Received: by 2002:a25:8445:0:b0:dcd:3e78:d080 with SMTP id
 3f1490d57ef6-debb9ce03d2mr4616902276.4.1715206160670; Wed, 08 May 2024
 15:09:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 22:09:20 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZjpHWIKeFrJ1QZDj@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-11-johan+linaro@kernel.org> <fa54422f-329e-4c3e-b297-b84438f75abe@kernel.org>
 <ZjpHWIKeFrJ1QZDj@hovoldconsulting.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 22:09:20 +0000
Message-ID: <CAE-0n514vcieg4uDZUOnZFm-14_hCX7eY8Ji+nyeqgtTh=xbUg@mail.gmail.com>
Subject: Re: [PATCH 10/13] dt-bindings: mfd: pm8008: rework binding
To: Johan Hovold <johan@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-07 08:23:04)
> On Tue, May 07, 2024 at 08:43:08AM +0200, Krzysztof Kozlowski wrote:
> > > -
> > >      maxItems: 1
> > >
> > >    interrupts:
> > >      maxItems: 1
> > >
> > > -    description: Parent interrupt.
> > > -
> > >    reset-gpios:
> > >      maxItems: 1
> > >
> > > -  "#interrupt-cells":
> > > +  vdd_l1_l2-supply: true
> >
> > No underscores in property names.
>
> Indeed. These names come from Qualcomm's v15, but I should have caught
> that. Thanks.

Drive by comment: we have underscores to match the label on the
datasheet. Not sure that will sway your opinion. Only trying to provide
some background rationale.

