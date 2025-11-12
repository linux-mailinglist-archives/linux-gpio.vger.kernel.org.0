Return-Path: <linux-gpio+bounces-28389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2294C524C8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 13:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A2C1189EBFF
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 12:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78097329E7D;
	Wed, 12 Nov 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O4cVVoNH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9FB29408
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951503; cv=none; b=Wf8nylbMTwWNcb40WAjuFWBkQ4Cop4XQKEBGWERA0QcW5XKYMI6Ggv6RXPr8mMr8mP6NyXKSwJC7uZZsI9etQIxNhLlLaSF280ooQB2tdBIhhVyZ+5Ob41Wo/YLlZy+FgHMsNbEqGiGoAyQmlelvuV+wWmB4kqE6IaOq+zgEsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951503; c=relaxed/simple;
	bh=ovXYBvf9BeaM5Jrvkdgwh1YmZinox/U6c6KG8zcWhac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pniYLDZThFyFlBMquAFVjtQ+sAtxPeoXnnj1JGVxtEo1ef8uzfsZmnVPcG8y0mfoB7vtjXPAsMm7dP40z92kiayY2J6/RZ5kTKR9lGchmZ/B4pQdInd/LsdVSL0pSjsmIYh4ZlinxOUlH84cDckbiicphD6g6WvVob54gjBqPwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O4cVVoNH; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59431f57bf6so713871e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 04:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762951500; x=1763556300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovXYBvf9BeaM5Jrvkdgwh1YmZinox/U6c6KG8zcWhac=;
        b=O4cVVoNHNOcUJAOBqLIiO0pnA3v9GpaDu3EhKLPGHr0btOvOiCRdbP/iWiIm6oC+6h
         o9TQnXmdSknYi/v3hqF13mOFt1718w/eXrMX2ulcndTh4c1cp/u1oZVZ13kDVRzbApcn
         sGxM8Gg0h6gPwSLU0pj66qPQoNdMyJFTsLiW/lHJYh1twYqGhskTfS6/kxNqHn9wQ5Uf
         96yZKDOfShkb0L+xHg1Z4koJqFjSB0aWcfVbx/LcbiKCru2pnax8C6FdHw/GOcJ0g+8l
         WGYCJzzWa0TDX4zo8tmPu3ne6Ku5j8FrjNmBGu4iYICn7n7xpli7g1LgngzV1ARvESnQ
         T54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762951500; x=1763556300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ovXYBvf9BeaM5Jrvkdgwh1YmZinox/U6c6KG8zcWhac=;
        b=jQlLVwfXiAHK36trTdrDrvYnl+wLusLhaoUNxmjbAIhawaMjnBRHvdy3LY2awN5wYJ
         mt4VGjre3GcQx/gl01NfVpk6S7HSW1re7DD7K7F6v9yAKU/4+71MOAetGCGI/DWQtpiD
         v/cSmTB3QY5barYK2hIqtpI1ZynV0zkZozJBSrz5IJ/Eswht3bVxm9WY2oTWQhvAEDro
         Eryy1UYnKpQed/HJ6WpD3MyJm56WgfedgqVa/Sokpz8S054ukD+gBv7rivrUbBqBEIlU
         +IZonSdJKA9hrAnGzftmrAH6vRQGv0lASq8FzLfCnOgzOAnnKsei3MCeSO7jngEQSq7z
         DZXw==
X-Forwarded-Encrypted: i=1; AJvYcCU6F8Dbx617d1chcvGadvkc3Xs+PfZzTjBb36+z/AcLekswS4OOuR0z/Y2aJJj4b7vrx/GhaKC6KISX@vger.kernel.org
X-Gm-Message-State: AOJu0YwssutB+eqL5j+qoEwSlOEp+1iktnY6KhTVnvcbRmTm56Uz/LuI
	A7q6HGAl3KZ2jS2VCrraWrFfPiwwxv2bXGMzhs0yP7R+FRwreo3AaPrf59GW8Pa79khGM+zZLlB
	23e8cWKbp13IU5tIGtQN37MHnecRtIF7uIloL7IgSFg==
X-Gm-Gg: ASbGnct94tuTwxlUWVJ00oxKmgRvNNxVAbgUqUYlzAFsQJ9wJdYIwwNZDp8jp8vlW42
	gEPZklRe05mEICbKxc4xtpzb9+uMGKS8E/2znLOh5pBbDhDj2nLIJDGpDyYuO5SVqYpYbKFbS6h
	1yAmGpYsMSyfuswD7t+JKHwcsH6TiKuE6NlGPpQeRrJyV39GoJPaQZKP6qNbbsvU+jRP7P7Ia6U
	cOEbmH6ELAbZWC5i+WANHI93nhwPzKZTFwMIR84W64cATNJdn8ka8aDrKUOIEWxr6M0CDY=
X-Google-Smtp-Source: AGHT+IHQakyME6xEnHQQsmuUyerv0hf25mEyF8+JOVxqljHOGLgY+yIGdrozQm01lfyzvPwPJ0stQCUI+cbhPCgYAws=
X-Received: by 2002:a05:6512:12c9:b0:587:7f2d:2580 with SMTP id
 2adb3069b0e04-59576e19ba8mr982952e87.32.1762951499660; Wed, 12 Nov 2025
 04:44:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111062944.3820079-1-nichen@iscas.ac.cn>
In-Reply-To: <20251111062944.3820079-1-nichen@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Nov 2025 13:44:48 +0100
X-Gm-Features: AWmQ_bkCSMuaz30HpFGccbxR73HuAGmsgiOeKgCmrcMpEXvyI_fFR265lSkc_Yg
Message-ID: <CACRpkdbdXBKq5x1weqB339M6y0HBq_NyBTkJ_7BQMaveTHF7ig@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lorenzo@kernel.org, sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 7:40=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:

> Replace comma between expressions with semicolons.
>
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
>
> Found by inspection.
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

