Return-Path: <linux-gpio+bounces-7716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53F917D85
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC82B1F23FA3
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BB717BB18;
	Wed, 26 Jun 2024 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSJhfLsL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB1017839B
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396882; cv=none; b=hQFN9/dB1gnxt2x/R1IXGaj3qIRpI/liaz7WIXBXdniEchDc1N6ya/utkLo4kayHGer4/ixINFqqFofmu35qQkswn5hhbrGFUYPSGvR0iZkDLo56iSOtMqPrUSS/ExOnndDNU8sIxQa/vf6HGw/AB7gjAYz/pROL8FphSeWChpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396882; c=relaxed/simple;
	bh=6XQ2pTvFVEbYAST3NGhXhfNbq20t52CTftouk2JNdhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZKWbOD8ykTi5cqMSmhguxMVq7lyUSiZxJhfYXGnL8uboOJleBAhysDKh9BhKXl2NbQKv1q0xSEBjgZJMoZK0AGDDcT50ovD0lhBBQ7VZ93i8mm/PSl3AFcKd2ukBg73kqyKTjrAioIxVKkoO0lqHqbzSjQo+mcaXzYTCq8zz7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pSJhfLsL; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so46034371fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 03:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396879; x=1720001679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XQ2pTvFVEbYAST3NGhXhfNbq20t52CTftouk2JNdhE=;
        b=pSJhfLsLH61fDM7ZeFtEGBa0TNpskhhdJpIOYhKhSB0Wdn1GwCuvPZpTPMIwM/ajen
         MgBGTesykaq9Pff6ULts1Qh3PMyCORrAThVfekHylF/N5C9HFEE4te/ggL+bV6lchFh3
         02V7xWRIYZ++4GzIgNqVZCIVCdH78kd6qwwqH4x780B0EZtXNI4MbhB6VaUAZPB5qiZq
         /fGJhtXkUe9/id6DS6gtTJVrmWAMJiB1mmI7OaxYfgOZ7Fpea74jJvgzaagmE83W6ZA6
         MEWUi2PLSy3RNPKB9GBPezEcsw8+3IU6qu7fDWLJtUdmU8F5+/OJ71NMcJsod/3lpyLj
         Ej9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396879; x=1720001679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XQ2pTvFVEbYAST3NGhXhfNbq20t52CTftouk2JNdhE=;
        b=TGqg1stvMF3TsRzTNs75/FAv55YMN/LK3GHHJWGYoJwJwNraIhvnQDNYIg8oPoC/LQ
         9WMKKHgwRMrSbgp8vlsPJuZqTyD6qmP4jLpmR9doatsbGbm6PSNtF8JPkCZbGq0xrW30
         AMxYi0JxCmDEIYFisRjgUlXu1yHTIcYj9QYBfBhU++3L8fm3gXeYleLauK9V2GpMjwie
         NEhxxX9WYfhKGs1Jh+H34t1RLtcVWq06eQyURibK38ZPGq+q3KX52JtKSB3+t4vvvWaN
         J/3qmADZdjo7U6eS+NNcWF6weqaH+tD9OILzp7uhLgzyLvTM0AwiO813dxby15PV+sQX
         HP1Q==
X-Gm-Message-State: AOJu0Yxt+BLda70LDB+T8qYPr8OVX60UM9H58fh/7L+kazSNcpyUxO2U
	9bt+se5weg2qGQV556CDCBgQFzNO0qSEkpSw7yhoYMc9RJcmUQhn349ZUrRZGfmHLacXNfVTJuU
	sZpYlhUfL1oAhfgO5wgWNiT8YXozPPGYdtlul242AlDYEtzC0
X-Google-Smtp-Source: AGHT+IGd0xNNrA5h4U5v1nImX7eX0z63kjBSZzzGeZCpZWttZ5iQa/kspmC0q9On0PVRRo7UKWbhGIaE9NhldX0tep0=
X-Received: by 2002:a05:6512:230b:b0:52d:a55b:fa9d with SMTP id
 2adb3069b0e04-52da55bfbccmr2105965e87.38.1719396879156; Wed, 26 Jun 2024
 03:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621091637.2299310-1-nichen@iscas.ac.cn>
In-Reply-To: <20240621091637.2299310-1-nichen@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:14:27 +0200
Message-ID: <CACRpkdYv3uoO4iASNtRVaioX9gP_XsUs9CSECsB3=oj8aSA2AA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mlxbf3: Fix return value check for devm_platform_ioremap_resource
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen,

On Fri, Jun 21, 2024 at 11:16=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote=
:

> Fix return value check for devm_platform_ioremap_resource() in
> mlxbf3_pinctrl_probe().
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Well spotted! Patch applied.

Yours,
Linus Walleij

