Return-Path: <linux-gpio+bounces-408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F17A7F6217
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 15:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE05A281F43
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 14:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5818250EB;
	Thu, 23 Nov 2023 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xDS2D+5T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3667DD4F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Nov 2023 06:53:56 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5cc86fcea4fso8348427b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Nov 2023 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700751235; x=1701356035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hng7atoCf6aq1nFffZNGfN/YBOYveUc0TKmABRfWrB0=;
        b=xDS2D+5TICLhxq2ynKnVCUuGzMKUTwm58I8eQ2uHsASwJ55sOQfBZ+8ZydSyq0++Iz
         VTXmY3TAbrq8MPKcr5rGW0gqwTt8PVeh1JS7zY07WMuOvIW2bTlZ9dCXVGXA7EveHg9+
         j5kvLj6W9vYdDj9byFfQfN+GvmBdT/dpKqEIzOo35pAJTtf3rMkn2AaVsojmsh/PxiSG
         Evkd0dzMMeg53BG1lkmawaoNB9eUA38zsO0PcDTSFxzm78h8FPKNl4Z3nxHbKb3U2BQ9
         RuVRRf2xvAa5mERi90bfn1ihsMrYLX3I0h9xxuAgFtf2jkPG05438oCkXYP5lOur/vVP
         6rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751235; x=1701356035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hng7atoCf6aq1nFffZNGfN/YBOYveUc0TKmABRfWrB0=;
        b=LNoITsiZA5ZZBIAWXNMha+DClD0nUt6TMHpLERq5nsPwMFwnhPxA3jzyWV7aJDRCoR
         A0/tdi45GG8BOtdUfHr/CYCdtR1POVWR3hY1raRdsuXUk6aioKJknbLT0AYmVw3dLc2I
         32Z40OanuZHiLo+G6l2jkbIPMd37GluvfhOfG3IM0VwZZ3tm1x8f2Bs7c4du9byinpj/
         iClIFd9BUQI2myhPvm57GOfwAHyvx3EdLQHrKDO05WOdHrky8qPFhjDtHRE4trlUXABW
         a4YrFNyIs46ECJam3ZHHXdnaa2jiG7h7OXQ6J8uRjy+PB4VmqSpHbj+nezL7wv4Dr7sv
         NCGw==
X-Gm-Message-State: AOJu0YzeSgfAkNpCYXeZoq8y4gzGxOeR+soTzvOi5TOyfDss/qi0AFjc
	ETl6oiN00V3Jlq5s8h6Xf1xYjDhBMvobTi1qFwGtWw==
X-Google-Smtp-Source: AGHT+IGURWX4SQN9Qat66MW6pT/slPHMNeNkf7JUZYLrhKJ4LBXbN1slma6cln+C5UcPVSm4twoIuLVS7OgepAKwVKI=
X-Received: by 2002:a81:6dce:0:b0:5cc:475d:ce0a with SMTP id
 i197-20020a816dce000000b005cc475dce0amr5492125ywc.9.1700751235427; Thu, 23
 Nov 2023 06:53:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com> <20231122175039.2289945-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231122175039.2289945-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Nov 2023 15:53:44 +0100
Message-ID: <CACRpkdbXjixVG+g7Yiqm6ki-xzgKUPQ7tUG4VuLH5gBGpwD=TQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] pinctrl: baytrail: Factor out byt_gpio_force_input_mode()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 6:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is a piece of code that it being used at least twice.
> Factor it out.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

