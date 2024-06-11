Return-Path: <linux-gpio+bounces-7369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5772904384
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 20:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B2B5B26382
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 18:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97996745EF;
	Tue, 11 Jun 2024 18:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0KnVkvR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD67F492
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718130477; cv=none; b=kis8N9DNzNxcO4hDDHOBr9cGnAfrmPnDT96/NWKHp67u/hbINtVVt9zyXFMQE+F6LBBdkABuRMOtusDwEuGwYS83AkyYyrhxWbj77t46GD3n5zBG0wak5YzXG2BZIeM60HKeXTrvtD1/EoW1JcyMIBX9eo6GG56So7zf0nGmiyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718130477; c=relaxed/simple;
	bh=xNv2gtlBfEvUS6Ujo5AA9Bt69CcEG9Nao++wV38Ni2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6Na7wepdExWDnGdbj1Z5DgRQAgYvrntlHig0zpFW/NNgiBC36ePQkzHMylQmL4tmakXta+xDEIRRsl0O833KYHgv9dIGRWPjFxBRswsqmedeFgiUAvR9uRaLvAIw4ZuDMv4spYSOvVBYUScI/iu2dEunnALzecOluEqHpJgZIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0KnVkvR; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f3efa1cc7so20675466b.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 11:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718130473; x=1718735273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAzQpAsku5HY8+Qmj0ySk3Jtzr0pPw6rPKwko9mzqm8=;
        b=U0KnVkvR2RH2uY3IimImJ8Hjwk8brCp17StV0P6Gw0jbx9KOABCCfCBSlaNAgJ+VAQ
         QCQsF4zFYjsvugXbKwTjhkTZNnIIfBpJlyctTy+g8tvMvuyi9ZA+a/yib29orhQ2tNhG
         jRiP6Ww+gH3pxtv7ssedqzR/cfetoLncwHXasXd/4zZuL+ed6F36WaaN5yfAV4bD6L5F
         NtJVISH3j8xMFCH6QGDtZgMdEEmQ0ZcDtKQ4ieylnznckaJaXz+g1WTS6nkfGXAij2FU
         Y1xL3Y//NssZam4c9n+7TgfgIALhZxpxh95pZkxodX+ha0P0YS6XESIvtoIqygstNsQ9
         AWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718130473; x=1718735273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAzQpAsku5HY8+Qmj0ySk3Jtzr0pPw6rPKwko9mzqm8=;
        b=NEILY8u77KVakMl0OlF/rpxRQNNNJ6Eqit00H4ZBK8Euwrq5j3ahsa9p0eu4HmrXeN
         tBOYSKOmSfGrWAUyVtgdJsUPHyIMrZqSm0lZ6tSFOzp6Zw76DKcJq37EwjLqiAbIMY+l
         6y5mbF9e+2A89l7opG7PEleEvMZ1kEcO98SG7ihCHM7sx551qWA6rf5iJA2RuxFJDQ3m
         aWeUNPVW/rxe3uES+QmvwtMu8S1ixQw0mW0PnuOp8NHViigMUAEC4Sw94SFLlhs5civA
         abGD/3pKRH++5Eid9thy7JS406hqqlj8KHEfGLlJOETeOE+kNYMzy7xVSQtMuiND2I6E
         nQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVLtAeDJoNge4WYa4potdNmisHvOb3JqrtWy70HQq79UAfZcxHRfaa6Hi2PF8omuBFGy1SHd6aaIAIgHAzaT3T0wKyej77lHtluw==
X-Gm-Message-State: AOJu0Yx1FtIlLhiuoPeldD8UysI9n1zQXPDEWNrVzV6RpBlS8ZeqrTtd
	Sfdh7vPRlmdeoKixoN1hehC2WFpnI3ACCsqOqaEpPqi0SUEE3m2b04tq8Wd6jwvP9yQyI+lC4F7
	bhIj9mP9KZTT/Sq62x5gaNkSNZtshxSfY
X-Google-Smtp-Source: AGHT+IF1N64L1BDSLsRfKUWvL7ixtVlnG3jH3MB2N4pKTF0BtAIrRHO8wv2HJFgF1ngUY9+5x7xZaRMS1bHgKA+TTC8=
X-Received: by 2002:a17:906:c210:b0:a68:e681:be2c with SMTP id
 a640c23a62f3a-a6f34cd6b4fmr252203866b.20.1718130472659; Tue, 11 Jun 2024
 11:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611-pinctrl-keembay-fix-func-conversion-v1-1-3197f2ded3f7@kernel.org>
In-Reply-To: <20240611-pinctrl-keembay-fix-func-conversion-v1-1-3197f2ded3f7@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2024 21:27:16 +0300
Message-ID: <CAHp75VdUR7jYtTCu1jaz4v-XExboyCeWPj+g6U-YU-SD9q44xw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: keembay: Fix func conversion in keembay_build_functions()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 9:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
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

Oh, Keem Bay is ARM-based :-)
Thanks for finding and fixing this issue.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

