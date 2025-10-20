Return-Path: <linux-gpio+bounces-27326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E66BF3BA5
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F10674FDB59
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD022334C09;
	Mon, 20 Oct 2025 21:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7MAEpQk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F386B334693
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760995560; cv=none; b=MLMPHpCZaC9/QT5hHYyYgzJ07FtUofBavEyX8xH/35JBTmbvPK5VTu5GaTeu/NkNiL9qScobf8cj+RQCGnV8EotYgBd+0RNzoR9Y5RfsUlBlrRURcV4j3PEGhsdVxi3+zwIb36OqfW6haZDlXyb/R3S12IBOHKx/gKZJPyiZRG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760995560; c=relaxed/simple;
	bh=3ficstr08eO/ho+LvgoSlORtGJi90d5fGOsDZArihyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdFUHaHPdtrtAAvQSQn3sTNOpOG/V/4u9usT00QuxaS7VBH3gVl1Q6VvPBdjTnwJyB8aBROtpmztJU2tkrBfHqBGP3SmVoc1k1sBeOHpl8aO9UeHg4GlXKGkGM+x8G2E7DEEHIAQXScuFo1Z+yuujvB5KEHblpTLaQWVztDKmMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7MAEpQk; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63e1a326253so3768798d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 14:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760995558; x=1761600358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ficstr08eO/ho+LvgoSlORtGJi90d5fGOsDZArihyE=;
        b=T7MAEpQkVpGf+lELgQcarCHJ7WfDW76bSwYS25Bouli5STkVhZ0xIorybcjQzOVGeg
         UUcqRPedHJqHdW3KnqaXyyD6v0+bqV/pfZ1Z0vv6jlrSXif1atKM91WdS5nqRv/enrke
         osXULzwnQmS3n0omif9E4ewC0mcmjZdQrxZioeLwZyyLiGEydfI6C1kWtuCK5FmaE2/L
         t4vIVxQSBPy0SQerNyju3kg25mypmH+zDldvugz9FrIJOPWIuEQ8je4ZNFQUAqruXIMK
         QFyeSPmrIwhMtzX5YzjmEwwu1y5eaJJZkVPXvG4jeJTL/IpLKExUUQ/ZIqsrE6w9iv4M
         Gjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760995558; x=1761600358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ficstr08eO/ho+LvgoSlORtGJi90d5fGOsDZArihyE=;
        b=Qps3V+LZzTRVEaefHJgDDw3qsaX1nI5RSOWGk2gpIDh2Rvqibgxhv+4bsbD+10R+mw
         Qn34B4+VtHu98CFng0RWfBKj/cLm0pNXKZ9/fF2baFsLK8yV1nbtVl4dDn6Mz604fsEt
         //zMZ+UW7c6btQpw99E9ASTdpcuZOiiKBOAtzv/D5+Np5n7HE9Gt//oM5cyLGyTW6GHJ
         lJnnyNE77KRJ01B54ehQ8rX1FfD781084hXa2ncpWeiAqX0OmoJCxC9+2rmsGz+DyHDz
         0ybnlaiZQb8ThwvdkMIdSYsMitxwkdueag32lNfvt2nZmrYesfZOmNuilkMq3uGfLaww
         4fZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaMh1ZnGzFW05p0dc4uo0QYktgDsb5yJeUlGF3qELWUI8LsePTQzHSIegKBZx5D4HXIfRoF6/pNA6A@vger.kernel.org
X-Gm-Message-State: AOJu0YxexX5Ag/zl3dy9eWGY3e3JUDT/QmxYbrF6H1B7FX4R6y5xRT9X
	Cz9/CMDb5c8AWgrr/STOOTQRxdZyByYHwB/+mNoh0g+7qePtdUYcQDh54uvMlvZR/qjXdtYhJL+
	t/QfLc9KYVijf2V16AHLjNhk3ExJzCYGOX/KXjjUFgA==
X-Gm-Gg: ASbGncuxAT1uaKYLg7GNcFwr9bruqgSpXxWd9KdkFQscJDWIBJQMQ47KP1Q6BZl+rp/
	23ESN4wHhCYF31Pi2nipEMVUDJuG+wkhkAn7yWmhZno6xm6eE4cPOYt8mvA5YkJ26ZzNRSm9WdF
	ol/MSNyJYb6k2hVV0QPFTKKJLvt4/OsZdUAOE5sO/A4wpT1bIdeuMbQhrPVs5b0yXIQXb2W9qbE
	BkBMFhpIv/x/KhxZoLUhPp9eUqtHPXGs3NFaVfjUMyDRAdzCukeIGYw3dGkZxrhbFFn8Ew=
X-Google-Smtp-Source: AGHT+IFEK+u7rcHcFq2YCBURn2SZqsS5EQVHgyo+WSTkrxddRAm9NFxgRGfkZifZkr4k8srGrUAoxt4PUGQB/cXcduk=
X-Received: by 2002:a05:690e:2505:10b0:63c:efd6:c607 with SMTP id
 956f58d0204a3-63e160d904emr10557853d50.3.1760995557991; Mon, 20 Oct 2025
 14:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:25:45 +0200
X-Gm-Features: AS18NWAZD7qKc4BMmb2MB0EYqlsiZhHQMPkiNfMmUGQwwkY6EwztrFsHH2m1viI
Message-ID: <CACRpkdaNJ4g_yYkwJHORtOdtxgYWMgmN1FZNj6yjDtZyc01CYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 9:11=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the pin configuration properties supported by the RZ/T2H pinctrl
> driver. The RZ/T2H SoC supports configuring various electrical properties
> through the DRCTLm (I/O Buffer Function Switching) registers.

I was going to provide some comments but Conor had already given
exactly the same comments that I would add myself, so looking
forward to the next version.

Yours,
Linus Walleij

