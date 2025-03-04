Return-Path: <linux-gpio+bounces-17004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7720EA4D6DC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A54B616AE26
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBD71FC7D2;
	Tue,  4 Mar 2025 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpNCNxz5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7641FC10E
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077905; cv=none; b=tB+zSWfEo6whPYzc61UtGCWdt2Ye854GnpoJuwScQsyMTf7m0YoOHuSL1BK/tMECWlgKACrDwkrbMQY+XaVPLhbJRzJHf65UJPUSmvs77TqYs8vBjpu6Qv8Fh/n2XIZPEa0Vr7pj5QFSvzS+XqLP86XwKKzAg2V043C0hUSWkx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077905; c=relaxed/simple;
	bh=pR+bRfGQlzWx7gBjcdSucJAnN3K9ea1LhqswU3jkQrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AB8KSLHnMyEe35cTDQqxmPb9KKu18bIos8y5BwbKAgWJYetFVZfDkovtE/k8hs6u69FwkcDS/fuooVkGe9UoeWSDiPnRmtSgAqfCJzPgBzA0QQpaE7imrLQszdzN+QFy9i0TaKZs3gN3QUABGztKrBNfl5cU+bXUAD7KXiG3rU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpNCNxz5; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so56705021fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 00:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077902; x=1741682702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pR+bRfGQlzWx7gBjcdSucJAnN3K9ea1LhqswU3jkQrg=;
        b=IpNCNxz5DWjg1NDjK+v9sQWobdNY0C7VexzWIoUdOBkB1jFTE7ulKywoIiL2dOlQil
         uMI0qxKIqgLP6VrX8//TPapY41dzYjzkd9gQ4rMCjMVP85q2mH8z6877+AhpkEnJDDgb
         TZlA29t2oloimwJNjngCRPWYQXzpSBCNs7nlbDtLYPqa42OUYDi3t7SPidoVXG46KTch
         Qqk9WkXgv0WOh9R9yGcQd6J89IdvYMHd3SqZmj3owU8RFGRQku5/V5mn/KWdXWhFXTxo
         giRGuE60LvK5+rxuMlhjroZKiIF8/LIRvTbWY95ROtvhGZPRRoHIVE/397F23lFlAOwT
         6Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077902; x=1741682702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pR+bRfGQlzWx7gBjcdSucJAnN3K9ea1LhqswU3jkQrg=;
        b=ntNUEHfSTIUZPRuwv3CuIsr/6SOXdD8bjLCYOBw9aDnNlvkpDFIDzgZIBLojb4M+Ch
         jhMvoJzRIIkVaHLePWugOPBtvxCH1T6n3W6RJfaScwY1oRgbN647vLped1Vl6MNaJsKY
         v7GqgF3m0Did/xSEFqRCZ5srZ2WfWXAulYUSTY5HRMs4GEWnIL8B5eEkra04U6Ys4Pvw
         wKFqQT7B4fj9mVrPqDZQThJxCwgmr+NQOepu9yuNQ2RgDnHGGhhhaGlz7Ro6QykqOmwB
         ruixKA60nVraUt9/IOAGp+TRYS5C6NXVleeFDvICo5c4HMp2dMXF5qWaVPVbk699cv57
         vDLg==
X-Forwarded-Encrypted: i=1; AJvYcCXhYRb2FQpvfoCQRmtbqv2uTpUEBfmx7QXLnEi/TZZkjqrXya7tko9REj2oqmjuI794erC7v3IrZAwH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5BG7sabtI0ADGu2DQOfFu9nwkFCOgc1AZuGen4Js7URbV5Y3
	HmaYhKEDuWb9JJ70227ImwOVCvwZsEsP6LvvXY8A4bgbu1o9KprcCepchifdRCPNMC9AF7NKzyB
	3NhDYwIwei5UfQGWekERGTphnuEqAjavtcdOpaA==
X-Gm-Gg: ASbGnctZ77mRpFTzyKOkwaA3UMVU80VkRnyGUx5xrkCblQ3uSkKZ4nFZ65eiPFkUR1r
	ZJkiWw5LYjiHOYmb2gMJSoGpJvQKEWEKD0KYMZhhAjLF0Tqdbhi/dXTO6hyzFJn+lBUxdrm0QmQ
	baNzI2QwSpja5OjEvCYkquNkrEhg==
X-Google-Smtp-Source: AGHT+IGgRiH2oS22RGfJxg7aIwVmCJWTNc+/r77/fuTgsqtE4Ux8/GK0e63mEvBxg75vsi2ow2K3BDFTL4IZbFj8pc8=
X-Received: by 2002:a05:651c:1546:b0:30b:d35c:4754 with SMTP id
 38308e7fff4ca-30bd35c5025mr120331fa.10.1741077901727; Tue, 04 Mar 2025
 00:45:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303160341.1322640-1-andriy.shevchenko@linux.intel.com> <20250303160341.1322640-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250303160341.1322640-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:44:50 +0100
X-Gm-Features: AQ5f1JpGA_-UhNoTPJmPBEBi7eNV4b_GKZenv7aPR3Dmi6S0SC42FWEfJP36qBc
Message-ID: <CACRpkdZ3E9J3+P3ANK-+NDidnsoZG-8UWP_G98Oai-dp6fk6Xw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpiolib: Align FLAG_* definitions in the struct gpio_desc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <westeri@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 5:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Align FLAG_* definitions in the struct gpio_desc for better readability.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

