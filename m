Return-Path: <linux-gpio+bounces-1251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62980D5A4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 19:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7EA1C21472
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 18:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0AF51034;
	Mon, 11 Dec 2023 18:26:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3030DB;
	Mon, 11 Dec 2023 10:26:39 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6da16eab6fcso864590a34.3;
        Mon, 11 Dec 2023 10:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702319199; x=1702923999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIsWkgcgh+iryiOw2ckITXN971M9P/rGXpk4uklSnJ4=;
        b=FUOf1Xz2C8fYGfWm3h06C4cohTdV96zMnyA2hTzJDvEADpr085IucRvA8dqrTIsmxs
         ItVDm7mD+Q1m3FW75yb4tNVtfzFVC8gBSX3+O+6PZvulbOAkLFTTiYhcTBpg5vUpaFbl
         J9sYEA1sA8pV8UUrd7xiFfk0v1nMv5TxVocYJnutkuyHzgZmKGRQM7Y9A7l+TWfduYDb
         LxlDAbWo89/oJZ1X/w3kUfT++mWdMfrtWClYZXZDHqPIUWS4YxQHLM+cHeQRPsM6c+ir
         doBJboMTAla7PfPjOfjSKkAhxAmQCznY9ILRHH1Rc+34AWn2+uG5V9k9SKRtS65upzDf
         IeIw==
X-Gm-Message-State: AOJu0YxC0Haq+kLQdwfmeKRFvuPoCxYE3u5pzO8TZDnEovdocoqmFOpa
	Hm/kb8cvqRoGdQWp03ejkiwkGGXfFg==
X-Google-Smtp-Source: AGHT+IEeiVS/4EbZYPFhn0tgt9W90eW5liw+bo1KTROUv5Qfw1SPIbJZbqhh1GSmu2/aNwicB7rJEw==
X-Received: by 2002:a9d:6c17:0:b0:6d9:ece7:a3fc with SMTP id f23-20020a9d6c17000000b006d9ece7a3fcmr4260019otq.55.1702319199167;
        Mon, 11 Dec 2023 10:26:39 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e7-20020a0568301e4700b006d87df1c53dsm1795031otj.65.2023.12.11.10.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 10:26:38 -0800 (PST)
Received: (nullmailer pid 2663219 invoked by uid 1000);
	Mon, 11 Dec 2023 18:26:36 -0000
Date: Mon, 11 Dec 2023 12:26:36 -0600
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Griffin <peter.griffin@linaro.org>, krzysztof.kozlowski+dt@linaro.org, 
	Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, saravanak@google.com, 
	William McVicker <willmcvicker@google.com>, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 09/20] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
Message-ID: <20231211182636.GA2657319-robh@kernel.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-10-peter.griffin@linaro.org>
 <59b949a0-5aeb-4f01-8789-cb305513b626@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59b949a0-5aeb-4f01-8789-cb305513b626@app.fastmail.com>

On Fri, Dec 01, 2023 at 05:39:33PM +0100, Arnd Bergmann wrote:
> On Fri, Dec 1, 2023, at 17:09, Peter Griffin wrote:
> > 
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - google,gs101-uart
> > +    then:
> > +      required:
> > +        - samsung,uart-fifosize
> > +
> 
> Is there a way to reverse the list and make the property
> required for anything that is not explicitly enumerated?

if:
  properties:
    compatible:
      not: 
        contains:
          enum:
            - optional-compatibles


Either way is fine with me. Anything new has to add their compatible 
anyways, so not a big deal to adjust it here, too.

Rob

