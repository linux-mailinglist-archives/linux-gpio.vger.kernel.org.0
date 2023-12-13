Return-Path: <linux-gpio+bounces-1422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84209811E61
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 20:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38D1F1F21C88
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 19:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AEF63599;
	Wed, 13 Dec 2023 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E0X+B/ox"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C883CF
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 11:13:42 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5913e3a9e05so1324278eaf.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 11:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494821; x=1703099621; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoasIn7ZWnWThH0PLf9u8EiK7T+LlQqn1Vvx2nlonP4=;
        b=E0X+B/oxPvxfM6DIOvgp5aNszau4clZ7/loIOGUT5vofzEAHDc9jr/rce6YD1UFR1S
         aK08BgJCmZdSdnoxnQyzdg7XbhYcPzzm/g3S8VDQnvDinID1R74oduw6LM3ohFFuynvg
         nMZg4blmZWVTf9Jrna2n0WSLU+G25fW3LF5y5vXgqmQ7x3RFLcbIeYnznhHEhKUIORhh
         urgOOdS2GXt8smq6757k/j+laJK4ssKcmEPqeyf7qpXofuuPzasC4FbGjjk//psPWn29
         ft9gWLq9EO9UaYr+au4ORGblWx+I2JvMgxf1WzK8sl+XcdrHZlCyoHXrMdbS61ShLhMk
         L6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494821; x=1703099621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoasIn7ZWnWThH0PLf9u8EiK7T+LlQqn1Vvx2nlonP4=;
        b=BhhBRT+8I55Rs7M56AfGEqlQiRiGtBvwo05o7nUS/HcW4+q4myAbHgMyATNCGsos6s
         Jy7Lxz5Yrr+dn0iZq0k5OgImMUR0/hlCzBnWMVTRKbMOY2gqr5Cry+L60PB+fb6tXvbR
         Fa1wAP/w7R8vat4nYn5aU+ju49F960kE8yK/XjCCYVDMrX/Y9lHpGMK2/xzboSe0qjoh
         d97a4orpRS2Syd1cxBDxhG20d2XAV15PALKCJxZ1NHQI8lh6wrHbQKb6keXiD334+//0
         lt6krnut/IL0YRDaMwo5h1HjEJAv4kLQru6vBktm6u6/hy2fFVQTdVlYwIeiSR8kWJW8
         k/tg==
X-Gm-Message-State: AOJu0Yw5irCuvYgLox3PwUK3d7icwpLW+d327GGF+oNW+4fHCDVAzGVY
	2CWKQ4jsiGt22Xm8dLT7X8KHA3b1GyRdYV6RNq5W1w==
X-Google-Smtp-Source: AGHT+IH4+myfhe9Yt7eO0yu5pPXNu0R/7YLBoZZEMIElJzsamITcWtE6zUFIGooST9U4bGH3ubAkBPh6S/8Kq9R6VJ8=
X-Received: by 2002:a05:6358:cb25:b0:170:7dca:9798 with SMTP id
 gr37-20020a056358cb2500b001707dca9798mr6354481rwb.10.1702494821571; Wed, 13
 Dec 2023 11:13:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <CGME20231211162434epcas5p485e7b2edbb02a1b6ea04ff5cc758f5db@epcas5p4.samsung.com>
 <20231211162331.435900-12-peter.griffin@linaro.org> <017401da2de2$400ec6e0$c02c54a0$@samsung.com>
In-Reply-To: <017401da2de2$400ec6e0$c02c54a0$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 13 Dec 2023 19:13:30 +0000
Message-ID: <CADrjBPoFu8azjZ65RGqae6HSCCoHQuhcBHNO_Fo0nVsE9pYGaA@mail.gmail.com>
Subject: Re: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to
 use BIT macro
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

Thanks for your reviews.

On Wed, 13 Dec 2023 at 16:34, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Monday, December 11, 2023 9:53 PM
> > To: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
> > tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org;
> > wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
> > will@kernel.org; arnd@arndb.de; olof@lixom.net;
> > gregkh@linuxfoundation.org; jirislaby@kernel.org;
> > cw00.choi@samsung.com; alim.akhtar@samsung.com
> > Cc: peter.griffin@linaro.org; tudor.ambarus@linaro.org;
> > andre.draszik@linaro.org; semen.protsenko@linaro.org;
> > saravanak@google.com; willmcvicker@google.com; soc@kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> > gpio@vger.kernel.org; linux-watchdog@vger.kernel.org; kernel-
> > team@android.com; linux-serial@vger.kernel.org
> > Subject: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to
> > use BIT macro
> >
> > Update the remaining QUIRK macros to use the BIT macro.
> >
> Ah! I see you have change use BIT here, so you can squash this patch to
> patch 10/16 or
> Move BIT change from patch 10/16 to this patch. Either way is fine.

I actually kept them separate deliberately to avoid conflating adding
of the DBGACK quirk with cleanup of the driver to use BIT macro.

As such one patch adds the QUIRK and only updates the macros that were
touched by that patch (to avoid the --strict warnings), and the second
patch cleans up the rest of the macros to use BIT macro for
consistency.

regards,

Peter

