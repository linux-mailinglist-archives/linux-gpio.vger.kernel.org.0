Return-Path: <linux-gpio+bounces-24551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C49B2C378
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 237B75800CC
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2524B33EB13;
	Tue, 19 Aug 2025 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MF6QWanc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF633A03C
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605955; cv=none; b=tgUNG3qShxB+WJenNoza6CgULBfDCOyNdgKgopvzzQ7kIswLQvTU1gXaPiqLYfMtWkjFbG0nnc/T50KEen9uHQjMaBL2oQ7ZrumrmJfR4i0SibQTXqnetzB0JDo4jUpdfzyEhlwMbneXNECFAU9KHzc9aCl8ss8oW20bl2lrePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605955; c=relaxed/simple;
	bh=u2Y/gfnxlc437mpb6PhnysrCJ1QgGq/sgZI77ejaYT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPw9mqlA32YqAHK8zUJVqo0ZVUDbCutifhXr4tAIm6v6dCJYbDiYxgCjGbFMEDS4H9emvFgkfbFcRr1iZ2qWqK99OwCcx3xlhel1ReybRsP0arjmdu+71zn0O/glOwLTb6YtWsuTD2fEoqZRekSo/GFp/Azpbx6dvEQbgo3Rf4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MF6QWanc; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-333f8f5ca72so37118661fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605952; x=1756210752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2Y/gfnxlc437mpb6PhnysrCJ1QgGq/sgZI77ejaYT0=;
        b=MF6QWancNVDnFcIzKm+4rAQAkk52B9JC8H019EHqPTT39Mw6rnfV9hkusKUOckHQ2C
         HtS4v95VOcAM+wAK52qhdHSttQeS64HTOkxnappQA+lDaDyNxa8NvOcEjqqNCnXCN66B
         VgGweEPDx9lTUC2NgYdvSIXR2/Q2l8nu6r5xUqS1mqbmw1sV4SEReyjkmp9gxBy0BwgN
         CAHaijAMoczdoC5Jgg68Eil0PcCXnaJwibNQpgfkaOmkIaYah3UYwvrZ7KwoM4zFV3EJ
         RkAtRdbPDNxU4W+9PHJWBTE48qHVr7gwrynzFHLrUL6wVAaQ9kvHNYPYvlYiI2mumdpl
         Hbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605952; x=1756210752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2Y/gfnxlc437mpb6PhnysrCJ1QgGq/sgZI77ejaYT0=;
        b=cVxpFgB8p1xDOWpsp+T9zJwWXuvsAZE8D+XOSOSgS7TWI4Dw/a3ozNSWboNE2hMNqz
         fjI6ji9y85e9uiGWliM6mKdHWsBa5W2tVCurmRJk9hHKD7Y4QSvx9VBvd/KD/RfK2okE
         zss9Q6frsK7+9xmgqm1SS2cVSKj3Krb2pInmrmd0DgXiuMol5pOJlzTDhAeXl9XATQcN
         NkT2/ccMmy6yq+1KN0YzZPZ3YcfOdRF7TzAbxu/8fRi8G1B9SmA7dbQ3iDiv80PP8gxz
         XOiui5WId64STP4mK5xyO5ICnDRlcLBZAaepQ7o1KYcrkk6w14eaqGp1cdrQHXiZdQ3a
         zQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaxwDxwqvZLfKJN8+3twO2IWFCKSGi+7Wva9NQVn20PRQL31Hd0R3cC7VLwEFJ55HtujpSV5/Xcctx@vger.kernel.org
X-Gm-Message-State: AOJu0YxQihfyjuky12BFcesXqg4Y1mUW77bII1ZYqWUxjwbb+Zfir6+H
	+pqwTe4pnOJpQhlXmNcrN0U5x3/DN5bNsvwHJLza7viRV4vntYOmEfIiV1qFmbfxV9cDio6W1uP
	HJk/c+QB1VSXP6Hkn7j2rVcAVflJuLfR4b6noYYMPcQ==
X-Gm-Gg: ASbGncuK2vd9fv3NDVSOmcOTL/DIFWH2f5CAbUoZmaARZLK5rdtCJ1qP9Sr4rmHE5fW
	gxWuEoWYSRzkcm5Tgw9bsAcdDegejr4xnCpLSirIOsJ/THFatjEV4Ic69uAFtG31jLt8sFCOKP0
	xjjk8na/hUXZsaEIYMZ6udofMhN5xvhtloDCZ3ak2+j72m791epH/nbUZEAZ+N+/E7hlvKcoR6p
	Su9omfwih3W
X-Google-Smtp-Source: AGHT+IHsaqPH9hjr7u54X1LUFS04SWJNAP7LPz98uFiQfhrqMU6MDbmAcQVfPn//Z7iM44rJEqEQbl5npay+fB7TPz8=
X-Received: by 2002:a05:651c:1503:b0:32f:45e5:df46 with SMTP id
 38308e7fff4ca-3353073c91dmr5858371fa.37.1755605952075; Tue, 19 Aug 2025
 05:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814181236.1956731-1-da@libre.computer>
In-Reply-To: <20250814181236.1956731-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:19:00 +0200
X-Gm-Features: Ac12FXyeObfcMrouhnaGZFteU5KOKCRkIGy1hUn_EywbJRo053Gro_IOs7It1sg
Message-ID: <CACRpkdb=OTwGyz0ArKPDdcBWU3nzrBF5d6LMHgNRgVsb9zH=bw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add GPIOC_7 pcie_clkreqn pinmux
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 8:12=E2=80=AFPM Da Xue <da@libre.computer> wrote:

> Amlogic G12 exposes PCIe clock request signal on GPIOC_7 pinmux func 1
>
> Add the relevant pinmux and pin groups
>
> Signed-off-by: Da Xue <da@libre.computer>

Patch applied.

Yours,
Linus Walleij

