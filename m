Return-Path: <linux-gpio+bounces-8007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 762959260C7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 14:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D37C92843C6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 12:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B69A1741C0;
	Wed,  3 Jul 2024 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xS+NbOsK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A0E1E4A9
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720010783; cv=none; b=dsxSlLA7nqOABXR5XOUw9ag1VMNufegnTgUpsEpDZ6gcoztpAjaDaWH3uHwKgFyA1CNL/5UokiRQMnMjbjpkrYbEA26u2OCqJ9SHeEDjAgWg2GGffPW9qFZCCnSxajD23A44OC7IYXbH4ohGOJ/FJS9iX+nVEMG8KcoJxQLLEYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720010783; c=relaxed/simple;
	bh=Ut68rqDrN1TwpAu4QkfYXs+IX6JiITiQUrIaV3hssN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4dja+A7122MXyc64NyWjEv6avviKqlvZnjErTNqTHCb1e6NlhKgY4vnEhPZ35Zc0c3ZBd7IECYUz8dDiBGoAOpfJ8pVh06hK0ALAkMNLpYKiCBCFQ5QgglHqU/VoMfkzRbV8NBXnVA7VSKWhhO54tv62kiLPMlqwGVuGPC3zNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xS+NbOsK; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e03a6c1741eso1245828276.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 05:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720010781; x=1720615581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ut68rqDrN1TwpAu4QkfYXs+IX6JiITiQUrIaV3hssN4=;
        b=xS+NbOsK1LrdxBZz+P4dkUeZWg73cc3q8EQrnykGnmaFz1Db9fOf9J2SWq3SQSQblW
         uUvC9rKZf3EcHJT3ghE5RKTSDjGG8ZNSVEiNRTDN2kvH02CLZ/EJ7K9oFs044ajXUhJC
         BxxgbR1tnhKKvgNJ7nD4NoGYYb46CaE1LcmEWwG4hJkLlqxb3hSFbIe40O3sZu9WHGjW
         soChqzGtfiMdsHeeX43pYgnRMPQwmAZxs060bX2JSXekCIyRUwLe3rw5pn2lOspt225Q
         VWvkwLa5lpjYBTnPcba9bUbNFgh1/S0rxiA1Qn4KruOI5r5yLJwLNdpvB2cDWlMPiZrw
         VyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720010781; x=1720615581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ut68rqDrN1TwpAu4QkfYXs+IX6JiITiQUrIaV3hssN4=;
        b=uChAfrhowuly0HcK3TgI7p/C5cafxmnuuWXgPnuJHF0Em21QUcFyL9upJebD3GGEEO
         lG0YVOasXxgZkjDR4VlYoaqNr74HJFC/72GSfpl1PoA0w+bYBccPL1jBw+Swkt8NAofp
         /N1AapsN8eVjPX77bqEcXDY5o6IQWzdhjv57SX+DqlgFzrNtZ8nHc22ZZxCWtisxoElZ
         2uhZPb6niMQgUwm4B9eI7NGn2rCrpEvH7lplJ4Kf3GX8ofwUW7AM4HOWX5tH+N3mkVHe
         YO4tV8vo6SnwONTUkbgRBBK0+5JY8Hgrf+seZ0Xk45kYrvPabemJBSwfoZZgotPmf9yg
         Z+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCU9ybkii6hASAddfGOtPNYYr1w4tkq5T0tBlYSQcYRTvqNTV8kcKyD7tzAItyOQ9Kcmjzmv++iWR+F4+Rx7bEffW/Paup5M67AmJQ==
X-Gm-Message-State: AOJu0Yzvf2JnHoGAB11tcO9t0I69OjQYlqb56Th2Oc/09E75cip3uSys
	9uENq5zXom8CENicLke53d7VkG3My65UbYi0E+b2qAaQouYS7IpsTQtDgnlIasIcrgE39eDUpYj
	jUyvVCO8h4gPoQR1LIwIZn8kfLlBk8iyJypvV0w==
X-Google-Smtp-Source: AGHT+IGx0EtqF24mwZRqfU+d7OwAJMjAo8uBkj9IVIYdq7kjT6pCMEr0hMuMUufGQFu/0P086qoqyzdlDDqlq5KxMEs=
X-Received: by 2002:a25:c5c7:0:b0:dfe:73d8:4593 with SMTP id
 3f1490d57ef6-e036ec454b4mr11736791276.48.1720010780692; Wed, 03 Jul 2024
 05:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <IA1PR20MB4953D5E7D7D68DDCE31C0031BBCF2@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953D5E7D7D68DDCE31C0031BBCF2@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:46:08 +0200
Message-ID: <CACRpkdYJCnTXHMwUi1-uhdrBjt=dukyJNGCZM2pLfN+tbw8bmw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: pinctrl-single: fix schmitt related properties
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 1:15=E2=80=AFAM Inochi Amaoto <inochiama@outlook.co=
m> wrote:

> The "pinctrl-single,input-schmitt" have four arguments in the bindings
> but the driver needs two. According to the meaning of other properties
> and driver, it should have "enable" suffix. Fortunately, there is no
> dts using this property, so it is safe to correct this property with the
> right name.
>
> Rename existed property "pinctrl-single,input-schmitt" to
> "pinctrl-single,input-schmitt-enable" and add the right description for
> property "pinctrl-single,input-schmitt" used by the driver.
>
> Fixes: 677a62482bd6 ("dt-bindings: pinctrl: Update pinctrl-single to use =
yaml")
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Patch applied!

Yours,
Linus Walleij

