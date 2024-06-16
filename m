Return-Path: <linux-gpio+bounces-7471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DC890A087
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 00:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D5101F2180C
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jun 2024 22:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EF061FDE;
	Sun, 16 Jun 2024 22:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ew4Wp9qB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D80414AA0
	for <linux-gpio@vger.kernel.org>; Sun, 16 Jun 2024 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718577476; cv=none; b=D7wV4P+AbNny6Tkww4JfMXD/4StMWcuR1BWoAoyOLHElLc9rSfw/P/EA950uK2GZz4XjyvBFiS+3R/i/khAGRfzGkP9QrEpjq1c2DOplYhk4m51BAFqutgxM+PeNtSgwW25Yi9259zTIe6wjeilXVx8oVm9cSR2gTMPCMd/wVM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718577476; c=relaxed/simple;
	bh=SQym0ka5edFkGH9GW0Q/RKr7Gzcy3p89cc6csKQ9GtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfYAlu2B4v99TMkAtASVWfZCAAiLTJPh/svWOWnQrfqUDRNf16UCLTgGO37mUYrkffcRtAYkuGlwqOy9BXv+NVLxOakzIvxSzyAaTq8PyW26tXzpNtiP4u/89FPUchutEuwNW1tWy6LjHEKVxX542Ta8UWbPGiE0VjRIje/vrtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ew4Wp9qB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52c9034860dso4707234e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jun 2024 15:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718577473; x=1719182273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJmULIbWb285fO6OZ+xt9ZdoZq+h0NtQ/msZb57jBI0=;
        b=ew4Wp9qBwEOectoS8pABL/iEcma6YocSbuu37bqmY35yNLxkQOr/sb6PPCEdoMyPnp
         4Qnx4fjxosXi47szJvITvreWVKSJwGl38XQI9jLZY0MBomjOQDhWMiNOsAwFXRY8G0jp
         6SdhW1BuT+pErgfuF+yxu3svUw0h5fvQUd6PnO0Dui2rQ3x+edH4y3SFvcGX3KanF+8E
         /fICMWMLi8W5+x3jQrMM8JFUhXF0IuHyQ9OrHKkni+IwUykBLVdC0wXHi1ADwqs2yEoc
         Lls73Fcc1FXKSiy8Z6FgN8rGg/Po2IKbdGq4JSNxtuNmeDmPtFG7dy3frYK0zFHTr2RM
         NMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718577473; x=1719182273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJmULIbWb285fO6OZ+xt9ZdoZq+h0NtQ/msZb57jBI0=;
        b=A29jsqoXLu7J3LKRYMR/GORy5pu7BRuKJHIdHyhVF6G3QiJGffaRAasJJJHT9qz6/I
         p3wMxWgRXE4iQNcoZLObihsc/sJJpfydDVG2JzBkJoXmyPvCQdTHAIJ7zRRxoNxDNkfF
         OvGXFYHTYLo5D0v400EpOnZe+EsI8/edMvijh5JjUQOtT6g8OekU6OjcldEfumSO3wRC
         TFfpdl1brasx+IuTdDeU1RnNzI2ZAEd+3gUWiBi7ridhNACwv/+AY6uT8nyEpcyHuuYI
         7fXYk31go4jGk0PAA/9+eZtOZIJqG7z2wLL40B1NQnrCV2x/iPrCws3YfQIPbZLZNtIe
         UO5w==
X-Forwarded-Encrypted: i=1; AJvYcCWN9LFysI44yK+hevGqpQYE7wB/AmbXIIGfz95T2AZDWmhqbYPLPNygKJHN0Jhol/rbW6qnDcA69Ogoab4nID6zYeCEibEHIRG2nA==
X-Gm-Message-State: AOJu0YzoASf5DDc1Hr7x0C8B4zoXPnZpbyf7UW9yZa2r6stPPsM+wqtX
	FpKk9laYvtSJIrb0qBTbaq8SlgN3rHu6+DIN6Pl/SxtD7o2ad+1RNoS2BjarWgsLRLSQO632YAX
	xmUpDlGgBzuXz1bb4wG2Is8DeaX1MzLOF0d/lVQ==
X-Google-Smtp-Source: AGHT+IEBmjTYQaGafJ86WIDi2Cr5cBGdo70co+/vV8OZw5CTIbsccdUAgyRfLgyO7Zi+9wG5Gih6EPt0y2U5e8e7ak0=
X-Received: by 2002:a05:6512:34d9:b0:52c:993d:b462 with SMTP id
 2adb3069b0e04-52ca6e6e25amr5706964e87.29.1718577472498; Sun, 16 Jun 2024
 15:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611-pinctrl-keembay-fix-func-conversion-v1-1-3197f2ded3f7@kernel.org>
In-Reply-To: <20240611-pinctrl-keembay-fix-func-conversion-v1-1-3197f2ded3f7@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 00:37:41 +0200
Message-ID: <CACRpkdbcCLSUjUaYoUi+mVMBOrcELRe_XExs-zB9417ttPaHVQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: keembay: Fix func conversion in keembay_build_functions()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 8:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> A recent refactoring to use the func member in struct function_desc
> missed converting one uses of name in keembay_build_functions(),
> resulting in a build failure:
>
>   drivers/pinctrl/pinctrl-keembay.c: In function 'keembay_build_functions=
':
>   drivers/pinctrl/pinctrl-keembay.c:1630:35: error: 'struct function_desc=
' has no member named 'name'
>    1630 |                         if (!fdesc->name) {
>         |                                   ^~
>
> Perform the same conversion to resolve the build error.
>
> Fixes: 73ee52205e5a ("pinctrl: keembay: Convert to use func member")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I had cooked my own version of this fix but this came first so I applied th=
is
instead.

Yours,
Linus Walleij

