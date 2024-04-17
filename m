Return-Path: <linux-gpio+bounces-5595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A2A8A7F98
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 11:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD39B1F21607
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 09:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36635131E21;
	Wed, 17 Apr 2024 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7ANKHQ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0A12DD87
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713346028; cv=none; b=ONnGaJr2Dj6Js48aTSYnofm6T1qssF9Um6T5l6H0AtkqmPks+VQo2KOwjuiDITEovKq2l0Cuh+J/F3WVlaH1ggSKKDFFoIQZV7Wlx1RuUEtkQWkyt6ZmykuJPmkW7bFI4zbV8b9Iwyi/Da6hk4ygqY+xVyfvSRjh8/3uKYnF9WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713346028; c=relaxed/simple;
	bh=Yeu4xYB7BLvk9Ill1dF9JRym+Gaj87Pzo5C6ffxxA1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7VQg7L1Gc96YdF6wogAEauNOXUv6/NAcezM83XwRGbb9FAJYSSNv6dFxI17abjsSmDwOwvXjTmy8sqJD4GFbflFPkIAsMp6gAOAsSN/tUhh0BscjiBWf2S3o23nzsadwZ7fFc2AQBZKM8X5iEQ9YWajCdQuiJmPZIOHTDn7M4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7ANKHQ6; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso5259373276.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713346025; x=1713950825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yeu4xYB7BLvk9Ill1dF9JRym+Gaj87Pzo5C6ffxxA1o=;
        b=X7ANKHQ6t1kIywRRD25rxMVggJ5d2i/P51AF1/qNiG2SMx10lDOCt/rLE9S/jpgGtP
         lsLOyjVlRDNM7zIelUtOA8HUPqwtbx66N+USXavTiMe78G29cVuB2EMOAcwInCNx7A10
         1KHNuJ8is2S2ARuXNkYrqAc9n1fuH9qSo4dZG4WtQ08phNSSkayBllK80VrZ/N/VTRlK
         m12YQjJMt0op7s0xIjCY8w5962NmVoueXraBmnCN/nRzqbztnkciCR5FvKlxBxkC9p7n
         8a5KvhOv+5ij2BaayoBnB6NcyqHvHX1nXjyvwX9ni/UVFFRGIeAnrsaliO1N7nVAF46M
         6jEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713346025; x=1713950825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yeu4xYB7BLvk9Ill1dF9JRym+Gaj87Pzo5C6ffxxA1o=;
        b=ULepO2IgZV6OgYTaFXf4ijlmCheD6E3bbRouAMvi1DnOjCYhpF3Nhw2+DPTKL7+zun
         Ulf4ObRcc9pFFOC5Cyd6CO6e4knidnEtYwTGBbcjAhE8FRwwylnRJj8Mbj/W3C3P8kYD
         z8Rr6lxQUZJW+i3FDZPLCpyoBoZ1vqfGYxK3vWDmvjgWMg7CDBia1uHqT+IikXqt2J7P
         sNiDeUG0h0jdDwTUKSnhG+KMjRdBvHQo6GmR6qbilX/V++SHNaTY6fm8aHy1pOIV15w9
         G9hzkTUpB4hGOWQyyXWsNzoqHJ/c/3+OjRPgGgXn2VtENsxoYcmLsSy7vlCMkNh5IMLH
         dFjw==
X-Forwarded-Encrypted: i=1; AJvYcCUCFrDUDqNb8fPM4FHgy/qBncTxHaXGAfMt2m5zPodtht9j2oFI0jJ5nvqj1h2Pl7psZDGxw8Xtr7ig9vyPsReLSZvRhS+QZvXbIg==
X-Gm-Message-State: AOJu0Yz6RbJGST6gBEy1XaveJRroomkTikFuwobC9xq6zv3LmRd7FgG7
	R3w15iIdCzaru2XMYdWQz3gxbG8arSj1eCXM8ToFVk78UAbfIL71KewzfGrgXP9k7rSbY/p6Z9E
	MGhQRBv9L903Vc/wUa543ovGXk1ubv7fxTyKn8g==
X-Google-Smtp-Source: AGHT+IFd6w46gF6cWcu610WNObxuSqT+OycBvkUkCVvHSq76OEyzFC1DzsPH3oOQFPiC1xVXQtj4MKgadM8M8hUGOW4=
X-Received: by 2002:a25:c58e:0:b0:dcf:2cfe:c82e with SMTP id
 v136-20020a25c58e000000b00dcf2cfec82emr14634228ybe.55.1713346025571; Wed, 17
 Apr 2024 02:27:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415141743.1983350-1-github.com@herrie.org>
In-Reply-To: <20240415141743.1983350-1-github.com@herrie.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 11:26:53 +0200
Message-ID: <CACRpkdb5f50z34FVsfCRkF8qG-EE3bDgf7m6NcLj1jjw1L2FOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom-ssbi: add support for PM8901
To: Herman van Hazendonk <github.com@herrie.org>
Cc: andersson@kernel.org, benwolsieffer@gmail.com, chris.chapuis@gmail.com, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 4:17=E2=80=AFPM Herman van Hazendonk
<github.com@herrie.org> wrote:

> The PM8901 is used alongside the APQ8060/MSM8660 on the APQ8060 Dragonboa=
rd
> and HP TouchPad. It works the same as all others, so just add the
> compatible string for this variant.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Patch applied, fixing subject.

Yours,
Linus Walleij

