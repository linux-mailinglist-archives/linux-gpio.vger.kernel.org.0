Return-Path: <linux-gpio+bounces-1330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4DD80F715
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 20:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC011C20D2B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 19:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FB963584;
	Tue, 12 Dec 2023 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NNmGExVO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F217B7
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 11:44:04 -0800 (PST)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-2030f89a722so315649fac.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 11:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702410243; x=1703015043; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5BQMFtAFEVshsml7NDivd/paYwikSCal1XjNLmVRnaY=;
        b=NNmGExVOdims0tb2N191Wefeh6WM4JRumc+DNPptKdUk6+4kc2hl0rY16wKqn32kIo
         tZuYzJ/qDiBq0OqE8/gCl2a0gloVYNxI0drImQPzpziPqA0miCLzuOO0S5P8MhvN15iO
         oQ48AtiEi7yOoECja7eeJ7fhfOmvhy4vwGT+Oz7TEgnz6i8EK9i451W/TNodza/FsXr1
         UrF0ET/wLPVPCmcyGiSFJoxjnUYsf8NkjBsHXVDbbJ5eJ7kk6WKRxkz/UtHesfWpvzjU
         lsay4KTc7uYVwb59TyeR4vmgNAG+CgWEJQheQAZX1DxRI9jmPpm3FzXy0vEfYw5nBJZ4
         rg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702410243; x=1703015043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BQMFtAFEVshsml7NDivd/paYwikSCal1XjNLmVRnaY=;
        b=bz/Of+otw4Eps1kOnjTptK7c30WvuNejJJiJkyKMMBdaO9DQjRQgBhEib5crN5a0Tt
         QSjKBqHncmgBGzOz9iXzWz/mtz0m+qmDbuLZf6v4ioNcL/j6jn7uEKXOoezwAkKeMGt/
         Hg1JgyVWdMrK+av10KmyQfQkdoHVHC2NYNvj3EEAnQPPcOEja7d/Nq+zIu+v8k2fGvUr
         QiIjj73GkCQzrIENvM5GVDYjgBIGDiUu3oM/4GdxSYcVoSfKay4YYATyeZEgBQX5Gvtr
         U5LkC16s8BwLwQkczGIvCgwCGcIrH0QrB8ouDHSfC97cQ0nFRnOcB1EjCJEVFpY5GOl+
         KakA==
X-Gm-Message-State: AOJu0YzuCuV+07GN6C1QT2V+BYLbhUjjqzOoSiW1xQZgWIqV6OarrXxZ
	q2EpiN0WlmKe62U97iK7njrG0t5RwcyZJ6nhuxi36Q==
X-Google-Smtp-Source: AGHT+IEpRUag5rB1tDDpj1KnSRL4BnsZpmVdNbHOzdHEtq0m5gt0oCTzHiRTdbC5zgVahAhKY6c+9bAJrFEY8lC9oNc=
X-Received: by 2002:a05:6870:7817:b0:1fb:75a:6d15 with SMTP id
 hb23-20020a056870781700b001fb075a6d15mr8510488oab.60.1702410243522; Tue, 12
 Dec 2023 11:44:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-9-peter.griffin@linaro.org> <CAL_JsqJ_NUajmQs8ZYiE2GpvNxBwtkLRE2jvWDU3hKtztt92Ug@mail.gmail.com>
 <CADrjBPrkso2cM8zKq-WU8WC3P3A9YoS6nqX-f6XvSNS-EofK9g@mail.gmail.com> <d23cc32c-8a5b-48aa-be4d-608fbbb9ac3a@linaro.org>
In-Reply-To: <d23cc32c-8a5b-48aa-be4d-608fbbb9ac3a@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 12 Dec 2023 19:43:51 +0000
Message-ID: <CADrjBPoireQMauac4D4d0Ry+PBBUUF=s0Lozp50KLz2y6ZLHKw@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 19:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/12/2023 20:46, Peter Griffin wrote:
> >>> +#include <linux/platform_device.h>
> >
> > You are correct, this header isn't required. If a new series is
> > required I will remove it.
>
> I dropped it while applying.

Thanks Krzysztof :)

