Return-Path: <linux-gpio+bounces-9147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB62E95EBF0
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF6A280DEB
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857E8148850;
	Mon, 26 Aug 2024 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qb1d1u+0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758141448E4
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660792; cv=none; b=eu/izttISKe/rqV39WgylfG80wDkYOSBC9Och7G6T5oh2aGxJxd0ujIeNvXZpA38zZ5yp9m7YLzTbcKDVnbnq4uevA7Y8aPlmqsO+1qLUYfzGeZeEEdmTC0jqtufMkZiVoD6pgdtojfSsD7G35y3QvEUPcvuB6QbZOD3euN5Mw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660792; c=relaxed/simple;
	bh=g/4SfK3zwgSyniSBAB47/iW5R2FXbqs/l+E2+gnvjf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsLeo3aRcK7sIWfPb3OjeJ7pOFpnyT0oCGK/AInEvJisIUPs8KbnZ714vNWimzafev1FU4wQIBmPfenEVs2iOSD70uwBEYmnWYSAvyWRaPIM8zop/Hv0Yj8qyr1mmsDnC9bO2CeN48RPHgxhNDS2QdRx+CCRdfgwe501jJHtRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qb1d1u+0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5334fdabefbso3637999e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 01:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724660788; x=1725265588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/4SfK3zwgSyniSBAB47/iW5R2FXbqs/l+E2+gnvjf4=;
        b=qb1d1u+0THGngf3LEGFin2qpn/4WIlrJX3evtVEnrhyNcJ5sZSO4kmYwR7G2QY6rSU
         l3jEcdZIvwm+gHSzGK+nhT67LwBBApKx/WXt78/2Pj5cOMe4AsP6jtARgR05cPuR8FEE
         3TmfmyKRxsDSDziLcujkSgMGc3j4EJ+/GaDugTjhX1716RYrOMDBk/xMPnrVUCRB+ORY
         mrcpnekUko/fb4QNGcltzugPzb7uZ/oUMGjW7INnb/3Lj5Xl3RJyxgEbbhChWkuGd89D
         Gi8kLtKFaQcNdzP5xcouJaXOcPKlm16Fah02zqMAtFNaP/a2JdIu7/mYNEx64QlBb2zh
         +jWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724660788; x=1725265588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/4SfK3zwgSyniSBAB47/iW5R2FXbqs/l+E2+gnvjf4=;
        b=dTfg+i1CWxw9PzUNJORluxNRAfAKDIudQSRG+cA/BvI/gQocPzp+L8t7NK0sEkxTmL
         2bSkS/bXTXAWHEMPC26ZiAtMUpHh7r8Ck0UBY6v5NTjZe915fEMh7vk20prNtLBTWSAL
         24UfnSEWsdvRE9qwoFGoG5ghsqxnlLWLF2/K4sFbGu6knMaJNrO4l1VilNGQbUbC9YUd
         hMyG5U1J523u0y519HCdbd3H3QMbcl57iIf5SI1PUzU28VKV0ILAiTPfHI6TM2PhENAz
         a1ICqVQviBqC3MXW+hsTXWTkkvUTBekMA4pF0R0xWo2pItivmZc4+feGh2yPhBd+tdyq
         IPGw==
X-Forwarded-Encrypted: i=1; AJvYcCWF3GnNBZ17eMwu7PLswcH92xHWLQLZpF+33x6IgVWL3dFH+YeBLjqWZnEo2wCQw31VOuNau9xSh6Bd@vger.kernel.org
X-Gm-Message-State: AOJu0YyYCTcdlSNx0jaIVRLhMN0gHw5rU/on6NC940n61ghavGAUNSnj
	L6IjvxuH8yxIFy3qjach/dORvYV/Rn5Wsy6s393hFSatn7Ohuy2S8Fw0lhjB42DQMKSTYcaZBNg
	XMTwttM6OFxG9lAxMesNz7+H7JkqEwN1Xm7Zmi5lWrQKgsCcX
X-Google-Smtp-Source: AGHT+IGZ3mW9OrSPkBF7fGwchIoi8dyRSCL+VNwhQlZAYO9KF7VH9a0Gite//Z/t1UQPTKKPBi2DPsrj9/5oyYz5b80=
X-Received: by 2002:a05:6512:1251:b0:533:15:2b23 with SMTP id
 2adb3069b0e04-5343871eaedmr2756503e87.31.1724660788087; Mon, 26 Aug 2024
 01:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com> <20240521152602.1097764-2-patrick.rudolph@9elements.com>
In-Reply-To: <20240521152602.1097764-2-patrick.rudolph@9elements.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:26:17 +0200
Message-ID: <CACRpkdY=prhC=H3u0qEhQZ1MpQAjMLB+KrQgHNjAX4PWMyAEHQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: cy8c95x0: Use regmap ranges
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: naresh.solanki@9elements.com, andy.shevchenko@gmail.com, 
	broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 5:26=E2=80=AFPM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> Instead of implementing a custom register paging mechanism in
> the driver use the existing regmap ranges feature.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

I didn't end up applying this patch set (I don't know why, perhaps just
forgot it).

Could you revisit it, look into Andys further comments,
rebase on v6.11-rc1 and resend?

Yours,
Linus Walleij

