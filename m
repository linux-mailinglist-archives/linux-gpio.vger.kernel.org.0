Return-Path: <linux-gpio+bounces-5409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D9D8A2C58
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CAD2826F0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 10:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0799A1CAA3;
	Fri, 12 Apr 2024 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iWThPDfJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3A0610B
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712917854; cv=none; b=sWeGP4ANdLbzWsXSJ10VO5rmX4k6XIONZqvZgqJEj3/Q5hIjMPaY3p6vgpzpBooKtf7vnzzNWPUMEGatvzolHw0/Zx1gVAIdulpXND9oJRo3ykA0FL45Z9cuj9lC7Eoc2aogVcQoLKnSriekCB2b6NFmTfTGfWuVtgMX4MyulUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712917854; c=relaxed/simple;
	bh=aWgSYuHiSKkt8/FrA60b89r2S20h+141kNRDHyQe6XI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9ovHezR2Y+maZHs89iIFTg/Xniiv0x0vk328NMfi/j8vWQgqE9gcS0aucms1ibBlMBq8PNjb7mh8ayV06srq5G4nBqGX5Em4cKKvgrPGQ8RjthNK7TdbggWp0fm+FTAs1p9hs5rnJMVTuHs92fjeCistZTpzB+o2fj+L+07ocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iWThPDfJ; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6153d85053aso6268357b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 03:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712917852; x=1713522652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWgSYuHiSKkt8/FrA60b89r2S20h+141kNRDHyQe6XI=;
        b=iWThPDfJQNFzy1rgeUuRZpmgA63t3mzkeAaI0BoXHKCAG/N5h0CXZePcE78uL1dAJ3
         B2kIEemYzjwuLGECvF2ozErqU/Eor5se6H16DfoII55EEY9vjoDbdoWgyKRXfWzYzvq6
         WSE/oeEGEihcYnXKO6+xq/tOb2lS8+aT/u27T2QxUyanVBuWwsOt5h39fAeTuj5/+kbi
         p0XPgDoLQ3CZ8Rn1e4UReU1GVWzB75FxgDEL9ris1GcPawfEBePLBJLJFInVadZVLvMx
         kmtqeuDUquI1bYvn2XampBCi8QIY3aG3WH1wU02yKn0chFswD52fPb+TYrrL62GrpeIB
         1cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712917852; x=1713522652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWgSYuHiSKkt8/FrA60b89r2S20h+141kNRDHyQe6XI=;
        b=CQ0CeCXWWzS36iXF7fCAlpPRgUpuF8M6fgabsME3grVoLrXT+5LGfi5Qx4IQ1qtNre
         FOEg3MBhDZnnYhOdrexZRz2iG2zv41c16geT9zZ0POB3vmIxhqN2uwCaN/l5zn57g6i/
         5KLE2pTt/tCXTz6BCPnIlS3BYK4TwGfW21P4cK9XUpyuzLB4dFq1sy8Tpw/VkClRR31e
         r8R5UdNdwGXIWGQgl4sLQf1AEbO2/2h8AuiO3HBKEtXkipSjFNPZPdYl32oBD2/QqVOv
         RIJXUyTgWDa2qcx9AQRVyiYN2zOa9SWGEUzLS402HSPiD4dgfuzDMHFoWKQnSF1ZMjGi
         zR+g==
X-Gm-Message-State: AOJu0Yx3CFBEjRmYMsIo9MV3mW2xUiJmn0obtVF7uTsNlDIz4SXa5b6Z
	jiVUdyOXLkKZKR6xYi5IS7YPyHOV6nuTVvlfwluZrIEAoS5XZhNo1tbjnHBkMj50kdveD53j7wi
	j4RDfXfOq2XeNAYtQU/8RlNMhVFkZvFTg6n2wjg==
X-Google-Smtp-Source: AGHT+IH7IfR+AHNm+mTQKByEr+kP4aKWQ3cNsgDIL9B44QfZfFiqgK1haazNAAs02JEfChdOGSOi/DWlIoNoT2wDS+A=
X-Received: by 2002:a25:f44d:0:b0:dd0:76e:d630 with SMTP id
 p13-20020a25f44d000000b00dd0076ed630mr1880213ybe.53.1712917852463; Fri, 12
 Apr 2024 03:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410063930.1199355-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240410063930.1199355-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 12:30:41 +0200
Message-ID: <CACRpkdZdV2G69q3=_HRE3LWhin5MOyGtwfCOOEHWGvchoTVMPA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: regmap: Use -ENOTSUPP consistently
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 8:39=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> The GPIO library expects the drivers to return -ENOTSUPP in some cases
> and not using analogue POSIX code. Make the driver to follow this.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

