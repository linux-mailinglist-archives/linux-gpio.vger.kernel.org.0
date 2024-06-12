Return-Path: <linux-gpio+bounces-7388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95721904F92
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 11:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3998E284E41
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 09:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842A816E871;
	Wed, 12 Jun 2024 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NqCaQPRl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653516E869
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718185624; cv=none; b=LzCl7YdjdQiPzTWd02muTrQSJ5h5OJoSJ3i69dJk8+tQQlZt6spXBB+nMxnUsRZ5VruQ28wQtJSVWDQAFjA4KZm2xwphrMFcUTFydcvysJZw9Oor1FjtkV3iaUZERtPlVwJwM7KrtnXwPPz0wgCdsK+UF/OuqtW8OCiiBCCtGYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718185624; c=relaxed/simple;
	bh=zQKdgF8mcEp+wVi7lqvaVDwpdEckLhnlchOC12xC+RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TV4P0amtMSJ+rxeA4XmTjPbEgs8aZex0O6Etu2mTcGxdnccYkTF3qFLTAOPVcW2EkRkgI6z6fQSjC1eUc0Wv+O5Y3dmCLv7l5JjQtLbTPxdI0o8szVpmBn5yqhEPKczpYw1zjNJlw0wEgFj7gGKu+oJrHtFsp9WphDpPossmyHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NqCaQPRl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso5854469e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718185621; x=1718790421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQKdgF8mcEp+wVi7lqvaVDwpdEckLhnlchOC12xC+RA=;
        b=NqCaQPRlTRnZ5AqJpRZYeLGeRA00pmfFw6V7DlOqQ8WqAeyOOAMnVc1OnRdnQUszEi
         om+vkFuWK55xI7UGVC5Zhy1DK+RyJgrVPq/VU5zYB3AUQbH72GQPU+vDBiUAxqA7a9AY
         JcLby1i/X5OSb6AKFLYXEk8UHflvIVEOGEXzqsrKpxc+viIPQEMt4Tf8qB+bUCFaQ1Gp
         mgeIKlh7RQ6nWyEWatcaFiGEnJpTaLlWadLTi1vg6T0AKrwE4Ym8AV2De8vLADQ0YrYY
         tZCf1eA4fDR9jkYx72fALjhAUjU22dZI48vnbRC8rkpjJ2iws8MKViFWZjNutZ1TfSjS
         Ff1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718185621; x=1718790421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQKdgF8mcEp+wVi7lqvaVDwpdEckLhnlchOC12xC+RA=;
        b=rr7lpJH99RSd49of2td3i3W42Lh8nPW6gz0peBLZHqGDaMjeFVRvaW/fjnGicXsnCS
         0zX+V8mIiWdd69AJhFbNHsZz4G7lYlbknJKtvnSApCnssNcKSkI2LZxGuUzFmwy21Zpt
         dxspd1i+ON7Vw2Y5HJr93AkxKCrTwuv/UeIUo3CuW1mDIOBrK2n3lmr6Mngg7bTOE7OP
         hhgYeULe2ZJVxp6tiXGlFnifvbpSU9Nf13N674r+dGHR3fMVz7tIdKcD+BCN6yffNt65
         uiAcqlkiCe3yhq1Vf2zXszfeWRBwQUZIIzvvHNT5aZPBux6EvUZz3ggD+aA9uM6RJrNe
         B1rA==
X-Forwarded-Encrypted: i=1; AJvYcCUAoxFJaX9StsPYn6WaGOwRsmR2J7Vz2nOZ+cviMK+WeWnOoj7jpo8WHZ0Mzv8M8LPhccqU90ySs2IHnrxyuzoFt0/lIaW/1X3F7A==
X-Gm-Message-State: AOJu0Yzep89fpCnhVGka+vBuhmlue2+faYzAN9wWPWwmVwIePi9oPF6K
	d9GQxNGz4miwXBgnI0uBNitnfa32Vbvn6Jnkyy1wBj3U57+84/XhaxSFkvHUgqlSLZFf4V7sx0r
	5IAcH9cSdYXWKcpx42jTc87ZUzQGnLR0yfWQ0+A==
X-Google-Smtp-Source: AGHT+IGCNkHASnW9VHX/JSYWKJzZNEu3Qmg4CK2c1hPkFlnh/pbup3cTnpgiY+Of0KiWJ4QoVJYCQXU1sRI9qEXlsX4=
X-Received: by 2002:a19:e00a:0:b0:52c:8811:42f7 with SMTP id
 2adb3069b0e04-52c9a3d2020mr998967e87.19.1718185620774; Wed, 12 Jun 2024
 02:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530165424.3173673-1-Frank.Li@nxp.com>
In-Reply-To: <20240530165424.3173673-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Jun 2024 11:46:49 +0200
Message-ID: <CACRpkdYbZAMjgLQPo9Xw_ooqpohwGKG3S1qMV0sKsDAYh3Pv+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: robh@kernel.org, brgl@bgdev.pl, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 6:54=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert binding doc from txt to yaml.
>
> Remove redundated "gpio1: gpio@2300000" example.
> Add gpio-controller at example "gpio@1100".
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

