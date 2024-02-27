Return-Path: <linux-gpio+bounces-3792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59917868C8E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 10:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC402B265EA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 09:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE62138486;
	Tue, 27 Feb 2024 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkJES54X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826A136989
	for <linux-gpio@vger.kernel.org>; Tue, 27 Feb 2024 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709026897; cv=none; b=GiafQlD2WfhsYfEs0o6KAuaKBi11qWK243pE2BEisaL/D2tjojskMxyyd7nkn49tgDXxKnYCz10wfFkz2lVc7/1DSbELSq8Y7wBjSI9rYGtCmNEcSRkzHBc8cjRUQpxGEO6v6sUVk8Lq4SgKOe2HGCMiCGCSCexrglGjmbVUYKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709026897; c=relaxed/simple;
	bh=yHPFRl2mqSgcoxbtbCsPH8G6VO/2zl4zaTGrgQVkBF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bt6rVTqIZHTkg2MSFt3ydb5BFfiwQN+9M8fwM06vANXlkC3q2NLaceqCFm1YEOKHCkLp85SfmPV4wtUO2R1+r9l4s4vufa8e8gb7BhGcfHxQ7x3QNfqZPzsoz5Wwh083fk/JxCGWqmduwluTvOlen6atzHJtww0FGqP7gEJUInQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkJES54X; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-608ccac1899so35618767b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Feb 2024 01:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709026893; x=1709631693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHPFRl2mqSgcoxbtbCsPH8G6VO/2zl4zaTGrgQVkBF8=;
        b=gkJES54X6z2V6FfkRt94mZbhrUhv3HDpu1mp9xSGhDjpD7QsqhEndJFC45VCxMmWhN
         xDxlQ6QAY6k3dK1qyBVYZLaekuHs7uKKqHFWWPyFBRYjBoXVpAiWM35vekbvOYUShyZT
         wp8M0OHdWkqVaLimEN2RXtsnvD3TB/3KpeqiXhETLJtrj/Aw2T6m0sF0cgzut9qZ+/Cf
         jVR55yYGp+xR7PBUing82MEGNrbaSnQquIDrhtu26fNkkdqyQogepxNIWuTWHTn3saRE
         WYW0YItsGIYRxXEYgeWjXt/VZeCIbqmlmY+eVSMrO+M3iCrixaiNX7OLLkzQxLz+P8kK
         sq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709026893; x=1709631693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHPFRl2mqSgcoxbtbCsPH8G6VO/2zl4zaTGrgQVkBF8=;
        b=ODczoKqR52WaReoKERfTVaEnJegIPGSBacSf6ijLz1fmCI84IRlHblDwMlM+tZIV3C
         BVOFVnsJQifQaQ1F+4I9VfChDTrWVhMODYIxLHG/ZCUc/UUBry6lVGsx2Ajy0TK67O3B
         Gt+avUyqvneyz+FixILg38pDnpIkXIEY1mlyfVZZVGKIjBzjNiSMsdfHpHOrpLJcRe+s
         NkpINGBIqECnxiJBjZqkOGITkcnuuMAd8vwcF89+mf0DAuVCGYfcFgo1I13UL6nl0ZEX
         VGyLM07ls/D4LgXZqeUvYLPchn8sdDzzPirlMO0SlT0oHyABm0pl0ySPlmNBt4HtsbMF
         Y7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU9iKZ2Tp1F781RkUPJrSIBzWFqwL/i2rc/3g0J5Rv9DoCnZvc1GQnMavP3FlwVV9C/EZrzM//meB2xnNPRVIn+h4FDuCBsK5AzEA==
X-Gm-Message-State: AOJu0Ywk794Lh++YA1GhIRWME+GUUrN9T23kOWn0XSYrrevduzrQfGTZ
	cuD4jtxFCRxl7+8lt4cgFNWlR23pMIkbZiOT7mHEgH3LwJOdCqZmp8FLwpj31Xsfpm66tKUipeg
	LqScpnG2O30nOIviCpSzccC8QpcDds4e0hHQcBw==
X-Google-Smtp-Source: AGHT+IEGeQH9qBNerwILlDn6Yn5rwe8dUF3pjMomroMNj1UeWVIbZ4c4J0dTKPrCGJj9SepP+2/PIWhFlhbc5AL7NCI=
X-Received: by 2002:a25:d60e:0:b0:dcc:3a3:9150 with SMTP id
 n14-20020a25d60e000000b00dcc03a39150mr1769321ybg.22.1709026893169; Tue, 27
 Feb 2024 01:41:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221213208.17914-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240221213208.17914-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Feb 2024 10:41:21 +0100
Message-ID: <CACRpkdY0jooZEZcyug7jKJC9TXnKNPt1u120nXE4dgCWQta-ag@mail.gmail.com>
Subject: Re: [rfc, PATCH v1 1/1] gpiolib: Get rid of never false
 gpio_is_valid() calls
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 10:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In the cases when gpio_is_valid() is called with unsigned parameter
> the result is always true in the GPIO library code, hence the check
> for false won't ever be true. Get rid of such calls.
>
> While at it, move GPIO device base to be unsigned to clearly show
> it won't ever be negative. This requires a new definition for the
> maximum GPIO number in the system.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks right to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess it's related to the patch where we dropped <asm/gpio.h>
and ARCH_NR_GPIOS because after that a lot if the semantics
were removed from this function, but it's not quite a fix more of
a cleanup.

Yours,
Linus Walleij

