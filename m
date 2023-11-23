Return-Path: <linux-gpio+bounces-410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F87F621C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 15:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B9ADB21587
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 14:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6352D2E82D;
	Thu, 23 Nov 2023 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkG7RxcO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B146D68
	for <linux-gpio@vger.kernel.org>; Thu, 23 Nov 2023 06:54:35 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5cca8b559b3so9528267b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Nov 2023 06:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700751274; x=1701356074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRvtJNZozpO0bnie9sd9zh5ke0kldmBEFtw2MsgOEU0=;
        b=mkG7RxcOGHGD1Svy91l5iyaLhXFAtN0FPpQsflgm9H9pNivjRKUD6t7kC/qFFZxFE/
         T26YFg+qz61P2r22INtnRmrHKKIfkp1oKTh/wpjLBcQbACFFbR8jVw1sZLl2Y46Qilbw
         vgpW5XfjrtOwEvz0ewhfrQ/U60tN3odC4iT5LE3diyR8U7Da8Q/6CJYAs7R6DGHzavEB
         rYpQzh/E1Fy5aj0KU5AkdSGlw57fI7fhkZiE4zzV7vTwBD6ZmOPlk9lg0OIqlNb2hHAD
         Su0tp3aWjIGg6ep0FGAtwSp8/ZQ3lrrFg3iN0ICtFZgwnio9J5Op+H0x8x7hHsH97z9j
         xU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751274; x=1701356074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRvtJNZozpO0bnie9sd9zh5ke0kldmBEFtw2MsgOEU0=;
        b=hEO1KgQthychFG/5ABpjzQG7IpsKI2g9JKJ2VNZuIHE21LbHV0etceaIA4bxwPMzcA
         xhrKDX68KD9+Am7mI/UmvRTCLm0r5nePLSek+2Ul1fsGSZuj3jWQcsNzvh5r/ZOknjyX
         BGGEtD4R7b1SozQEWJpyWEW0lwZ0YgKvjurAJ9TRnkcMzzJilXsohVUm5DO50bqHc9Ui
         nzkYZ25u1egGmiYpxgFvI2oFJfVdgQkwrYvgwNH/Q/SAGGD0Om07AEsYiaJIFrKQlUrp
         Fdb+Wnp9k5+JgVQndE30qISZvQwxXyIyK0WWctyBT4uv10Lr98m0xOAi/6EzO7nrEnDF
         nIwA==
X-Gm-Message-State: AOJu0YyY9x4qQaaZmoaWLUGyDJlLHTO3bwU+C89UM2p5sqaQOy4wQCqb
	W/3c+fZrWCDXSGiokUrMHdtisc70AwgTzoDFM9MQPg==
X-Google-Smtp-Source: AGHT+IEqHGUy8srm+W2fOIN/DF+rCJy6HEwoShEzTGFqCsOxU8MZDzOqoPECz3axzRKlSd8vE4exbeUo5+mR58vqu+s=
X-Received: by 2002:a81:6c04:0:b0:5ad:a3f9:1b10 with SMTP id
 h4-20020a816c04000000b005ada3f91b10mr5685572ywc.10.1700751274772; Thu, 23 Nov
 2023 06:54:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com> <20231122175039.2289945-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231122175039.2289945-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Nov 2023 15:54:23 +0100
Message-ID: <CACRpkdZo3W6ServvKQV5KpBuOqXYPE=OCVoLvC1kA585H=vMDA@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] pinctrl: baytrail: Simplify code with cleanup helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 6:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use macros defined in linux/cleanup.h to automate resource lifetime
> control in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

