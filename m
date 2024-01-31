Return-Path: <linux-gpio+bounces-2775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0447E84388D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADDA01F295CC
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 08:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966BB5731A;
	Wed, 31 Jan 2024 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HNJiCUHw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451305788C
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706688645; cv=none; b=S3jKJRM6ZG6YWcS2tKuO8Ax8HMRiTNtPunLY8SaVS2hcIAw9EZWoiURsEDJdtB59//UeIhpaEN9XmQwZXIyJGLEVWcunmRK4BTO1kRU9W0ajfMcWrMt83dNjLmsUHmOCGrD2fBVvXuRjM1cmgCNw4HztPqiZ9W3F1L9sqkeiNCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706688645; c=relaxed/simple;
	bh=z9OD1UiKot9xBEp4pQEuFNoRwTpzFrjRRiTMq/H5FH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShykjtPv9At6evu9WJK5akgvMIM2naQ58aPcwZy1pCpWuAQJpRnS7o9+fRmMgRC9a+q8a70D6MjHWjQxz6BbJ7nF5x+rlJKpDhFQIl90WY1Xz7sFPh5Q4W7Hiu9ycauejxzgzXzqheU3UoKgdSrlWxPIK5JnJajgE0TDO+l9um4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HNJiCUHw; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbed179f0faso481766276.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 00:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706688642; x=1707293442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9OD1UiKot9xBEp4pQEuFNoRwTpzFrjRRiTMq/H5FH8=;
        b=HNJiCUHwlrM2PdILPi6phbO/S7pKIR2Ki3WwBv8AcsldZApf3xrRVUQM4KDwfkfcc4
         p9KigDXyJGEitAELY+Z+yWAb+yqAg3DnuKKGx8DqKTYYs6heZVRhR+6MGPfddL/Xzcq8
         +fUF2pJPuFmeLHDblDmbXVaf42QuBRv+LRV9wVdDIqA46GS5Jnnvd4/1s8ihmMFjtFg3
         nDOHdwx7M9acWPqGro9+VY5pbTu1hpK7q/d00Jn7Bg8ESYOgNqDr5tYygDTbpUzUiNKU
         KCnPhFuROMI0MFG7I9xmyX5KBkLijIf0hF/X2w/mh/MD0oQILBiOJu+MubUeq9Sj+oAB
         Iuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688642; x=1707293442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9OD1UiKot9xBEp4pQEuFNoRwTpzFrjRRiTMq/H5FH8=;
        b=Rhi9ZlJPsYNdPjjKzIsLMwsSH1l/YoWCcxC1XaW64x79N/xDbKeVQ3PG/rhitiBz8/
         OeiP5Eg69ovZIBMkgQ2i5MLxNGQ58UqXkEWDfyJjY4wly/OcfeIzF7oXbXwpnRBef4H+
         xzSn2N9lOxdl4vjHEUwNf2JqE7RG5O2D5Wl7GlEXb3LRjEVYYK2aPE4X1UqryYvE9q/K
         xgoOviFdowTblq5FtUYRwRPkF4qgWi4KbqFp592pxIonWom8xOHbdLYDVmSI56SV/D4+
         Bx19KO3bIkAJFfZCwTjPQnBJ3ql6+7LdRXCBf4e0a/ZvV8aEMOJsbrTokBnJJiGu2Lm+
         AELA==
X-Gm-Message-State: AOJu0Yw6+B9OsSnyA/jyqEmBNNibKkWDi2+7tQiBm50tqHE6efg155Ml
	5NAGA90UaxQgmJn8O7JRR1OA90yxyQc1Nbu5QChy28x7y81qVLmszTJxOe+PKmaOM6xweHW+94R
	rciTPRzV+tgs75syOAp8ivBXIKIFXu0tHWmiieA==
X-Google-Smtp-Source: AGHT+IF7/97h8A2ABSW+ZKivSqrc+3VaVDxhilyJhD8FjHKMHd8T3fIFoykLSG2kAQuVNIsrK+oFINo0NP7MfrmxMWg=
X-Received: by 2002:a25:bb4d:0:b0:dc6:c252:75fe with SMTP id
 b13-20020a25bb4d000000b00dc6c25275femr281957ybk.10.1706688642247; Wed, 31 Jan
 2024 00:10:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124190106.1540585-1-robh@kernel.org>
In-Reply-To: <20240124190106.1540585-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 09:10:31 +0100
Message-ID: <CACRpkdZq4dYwJNvo1CncaHGsDeU5qQhms2SN8WGsTRwBB-Bhmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Unify "input-debounce" schema
To: Rob Herring <robh@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 8:01=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> nuvoton,npcm845-pinctrl defines the common "input-debounce" property as
> an array rather than an scalar. Update the common definition to expand
> it to an uint32-array, and update all the users of the property with
> array constraints.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patches applied, thanks for fixing this!

Yours,
Linus Walleij

