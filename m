Return-Path: <linux-gpio+bounces-3926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D6386C529
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE4C428E0D6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5915CDE5;
	Thu, 29 Feb 2024 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5lfH0Z1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066465B5C5
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198972; cv=none; b=LOgUgJjbRJVrVreAwF2wbUqVFXjL66hnVBgAIPWocy/jqb6f0L8EFr3+j+TojORMm047//I1fm2MFY6VN0Ski9jIg3ppjKba08qbJ+sRqYukLKV/pNM246xY+G7+11yXiJf5WItuBpIkRsUEaFQrt4MHwOKK7jy3Mlfq+i/M174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198972; c=relaxed/simple;
	bh=9xrun28hvTbwUNlBt/r1pmmvIKLwTUek4EH0OAQeY6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBfh6Ouifu3t115kl31712MayuhAw6SSEud7d9634qwAIBkuJI1mDxOUSr/rC1KEJNmUZad//l3ap1Rc8CT4lAzObuddssj82oV6aI8ZScbQMHk7lpzgReGKjL/OfFKuW2ssrvQ31DwDQrE0RQIVy1A6LrnXcqhnN0C2emVZM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5lfH0Z1; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so715196276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198970; x=1709803770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xrun28hvTbwUNlBt/r1pmmvIKLwTUek4EH0OAQeY6g=;
        b=d5lfH0Z1sSIgs50yYIeIQKbO474hjQu/EvDmwE49iQgsPOInNaUQDOSA+AF4CXIpmy
         Xb1yPwzdhzClmaM4/Sk0iXEUpm+yQhSsgDzdlqlLeZvTwcW3dE3W01U7sSMPo0shu7Fc
         DvniCqD9rNmEwOafYGPLQlfQwYPz5sQoI9To5ytwb51myDjMz8imulc5asSJHGygEuRW
         niIiT0OyykV5slPLPb3X8XhzLIz8bSeMBjuBVD+hqMi3M/ZVN6reQuYyVcKeW7hgzrHU
         GJh75fl0fgOWApwNO5tjbiM5lwSFeovt7YtrIQmbdYcRK4gc52P62cd5kaS1C6Oqf5xj
         tbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198970; x=1709803770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xrun28hvTbwUNlBt/r1pmmvIKLwTUek4EH0OAQeY6g=;
        b=bdsfAbJYK++/bI8kfVeRJzUDujvBCdw9I9gaDVqpkRSvW2EMm06b+wky33C2QSI8JL
         J9G1WELnwhAfTBENwa+PSPE8jDAtXtxrjw+fO0FRqU1dBwmr5T4UW6AVtbNMLEWSLvq2
         hRdb40w/ThEvou+BAGksBkcWplaa5FQNS+THRs7RehoLm6fCMY7GwSu7K2J3/UJJs3Jj
         NF0wetE/V057Y7PqT9JHP9wIdLvHJLbCHVwLlqWsBS0LudpwqRG/CzFXMH+Fhg/ch3im
         u8onKf5W2wUjgGLSAdO1/om7J4grQbiqSZjfAKn+VzBw4TuG9fRy16yIKVwjDLVsEUrG
         wuww==
X-Forwarded-Encrypted: i=1; AJvYcCVWrqShv0LMT7ppEvmXxFSt03DZXpZviAIlQiksTmIaRMLfUxq7w3sdnNj8ZOhuARUOf2M0cfSqLLGBdFN/37qr5C3Ycs1U8rgB7w==
X-Gm-Message-State: AOJu0YzI7Rls6so04OjVGTL/yBrNCB9ed68HF9fqhKzD7MYFHmgrfW8N
	7aX3LnQ4s0xCjfeI7Lx2gkx20q2ijosl5nRdIr8e/F1u1G5bBFFlOMSjZ0fk8Iw6zdv7+BljR+G
	sV6wqclxA+GCZktkec3uxrpXrhks/reQvhbLpzw==
X-Google-Smtp-Source: AGHT+IFcIq6rOa8YJF/37W++7S7G6OEFznJJRmbQw71XiyjH8oKuNU7jWDHU4uKxFfdpywX9lIfEjnnzQ3AuD36QOkg=
X-Received: by 2002:a25:81cd:0:b0:dcc:8c5e:7c9b with SMTP id
 n13-20020a2581cd000000b00dcc8c5e7c9bmr1795722ybm.57.1709198970093; Thu, 29
 Feb 2024 01:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-14-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-14-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:29:19 +0100
Message-ID: <CACRpkdYavroWGW5HXLJATF0UuffQYnyoQYnO=aV364=XA7ARsg@mail.gmail.com>
Subject: Re: [PATCH v2 14/30] gpio: nomadik: add #include <linux/slab.h>
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Add linux/slab.h header include for GFP flags.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

