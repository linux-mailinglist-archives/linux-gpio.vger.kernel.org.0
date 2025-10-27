Return-Path: <linux-gpio+bounces-27737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC4CC11A4B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E8601A6244C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6FA2F39AB;
	Mon, 27 Oct 2025 22:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t1aR8brj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE34C2D46B1
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603344; cv=none; b=WYGl86q5pEp3dMDUyfTSfVBcoZ32wO0MQtU2dxtCUmebZTurupYIYv1Pz8K9/9oZtLn+OXLBT1yufirKpkRLUEbKUp1cfZrVb47k9VzcIXn7FFC/gR2kL8eAVgZ7uLxeGDsnsKQpVNkYNZfPpZoByWfYjTI62XVedYXfSWOUgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603344; c=relaxed/simple;
	bh=dKH8vYMf6SqqIJ4Nr7m9tVSkocGsGWocEbO61fBw+IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H94lel55yIi0zCuxV0OxjEsmktj4j/26gPK+ElKQxAhukhS68s72ohmiQqE4JZJZl+lFq81bJRzq2D8VfDpdAC66vxkxqi/rVjFZqHv40f/1NpGcKKeLbHY7hnvT6ocnlrdhwa7Yid9AVoUZ+FEB+e1B3YDlzSIJL0vWilsIIlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t1aR8brj; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-378ddb31efaso62058931fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603341; x=1762208141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKH8vYMf6SqqIJ4Nr7m9tVSkocGsGWocEbO61fBw+IQ=;
        b=t1aR8brjJFRMEzXt53LT/pcO79CW60rL0z4xB7sFM2vCvDqDowTCoEx3PD+5w+mxjC
         Zy9WGy88PyWw+QvAXi4D/W7x92VYd2ZQhpdoy4gmGykzESBuyXHgici1IBgofw4wh278
         9vee/XI2BEz+P1QerWbnDniNks3hjRjiqnHD0x5KIrkjqhDkjovFTG8FRlsMZhJeC5sq
         E6FGZwfSDoDX4Zo0MWdBpYdUL70lvxB+Na0KspCgV6ZJCsaeGpsj1D1kzzt7VTCbzOwC
         aoxIiTWhf5etn49vvPD2gfxydQcA1hss6+6Plucl4aS06/tPVIMO70sm+O0W2Jcu+lbQ
         SQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603341; x=1762208141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKH8vYMf6SqqIJ4Nr7m9tVSkocGsGWocEbO61fBw+IQ=;
        b=wWU0cY/R2Fv+5kZ4HvzYzWA0aKZpzuZ1DqzhZLyf3+/Bm4q56WSFi3MNb26a+pz72N
         WVTw+1WZwojMDz9BU4+iZ8Lre12NDtz4bhgKXPrrxHODy23lGN5C1Qfr0sBAdIWdzMpq
         gyaz2TLgqMHjVRg7oLEXb+HJoIBLQ0dAc4Uw6ja5J7mU4WlcTAn/eqslWSuhvE5dOmwT
         KSUWRne/l4WZ8LB1YJEflLqEy9+Khz63pJbHy+CvN7IEix51adNZCjnfm50z27IE7zDX
         cW8WkLdieb39SqikoaI4vxWd0ZIdBh98nTX+JgC4+gOzpTCcdA4bVjcm6mtvg1KiL5Mn
         qZug==
X-Forwarded-Encrypted: i=1; AJvYcCVb7YIJ+e1IJS9Gs8UQKIb98LBw/0DYmvLq0GreuzeBxTsPgKuOBkWM0Pbo+A3m1VJGsnX+jcXZdnr5@vger.kernel.org
X-Gm-Message-State: AOJu0YxJtHx9e3P3G7XpbH3BjcXMFwxcV+JQYY75ofo5mXgU/vephobi
	B9x0vvZU8CUmdbn3Ful1zIQGX9pVbzC3vkJ1Xs4R0Cx79dQ684NK+JPJKX6fGZi6RzLh9vtsrs2
	MwTMu30XvhlqVTopv92SXXWttzlkS8oRbkWfkHykIZA==
X-Gm-Gg: ASbGncuzcuVa68oVNpZFR4KNzLZ0KF3bdnvvj45zMtpwY3xRpuwLlhIVVIrfya7w5pY
	QnT6ZBNLsEYhpZ8vJG6m5/YwbWtoEdJLxgQTbswr+nv0u7Q3Drx6n1PWlCtuoU7v1dMo1PBy/i2
	X6tFiFMJh+xoAB16rFP7Al0sg38Rv5JFILDS6KEvyIgVsu++NG7TRJwFoBkBRr1QyRJhbn4Jynp
	LAsNzzEpCkvLZ4KgXqTjVCJFxvdTKD6xKPVjIZH02W5s3kUBir8zkYa6Lr2l3hHXlcLVRQ=
X-Google-Smtp-Source: AGHT+IH6m3DSKBdAo1TUZBBV1Cir681XUQKPd2M1XukvdECylY8ML9HXimk23Lw5yV+XpOoav6hKjxByUPzz5iNTOgg=
X-Received: by 2002:a05:651c:1107:20b0:378:cd74:a289 with SMTP id
 38308e7fff4ca-3790774e9edmr2648271fa.42.1761603340965; Mon, 27 Oct 2025
 15:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-11-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-11-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:15:28 +0100
X-Gm-Features: AWmQ_bmjdTr7EUx2uJYxfPf9xIolvT4VGvVXwZyfYUonTVISSkwT-eVliP6qaRY
Message-ID: <CACRpkdYzT3DaqiXTg2swEKxxh2UQbhw2=uF6Md=RON9rWz+6ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] dt-bindings: pinctrl: stm32: Use properties from pincfg-node.yaml
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Don't re-declare the standard pincfg properties; take them from
> the default schema.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

