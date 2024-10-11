Return-Path: <linux-gpio+bounces-11214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128D599AD06
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BA5B1C2119F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D25E1E6338;
	Fri, 11 Oct 2024 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VGr4WE5x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A080D1E503C
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675842; cv=none; b=j9tY1iGWLW6gCKxtFsNra4RoMVPl8AeXPsz68jFp4A6O+ljcEgupsBiWHyNEyR2dB26r9F0SV+Sn7mxNDsIJHjVdhMOdLSrWRTTSHQKwJN5cA/QnjBrWAcZq0Ii2zb3MZj6jPLGjMAHodtCPhST60LrjAb2sclMQemfm1ePjKHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675842; c=relaxed/simple;
	bh=TrY/petUyesoJ6UOsIJBp72dgEfm9iPyRIo0owx5hk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmwX0GNBtbrqIAQT7NceJitzONnanaxBXna/BWxqAb2H6qeLOoaq/hsK9SGsphyvBbvwmNXPY1/ubFN2AdWZYKL309HoDAK3w8uCx/NG9zFQxBWuA15pI70P9BliMGzziHZyj6Ks4QzHp9QEISmCAiRbPdjbDfD9UDsOrRMPgx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VGr4WE5x; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e28fc40fdccso2321830276.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728675839; x=1729280639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrY/petUyesoJ6UOsIJBp72dgEfm9iPyRIo0owx5hk8=;
        b=VGr4WE5xQChduX/z01oTFP2q2FWYVxHGlilIjngqXmA3OXRh+4fTYKggQp/HTdEcYj
         GZDJy9ntMwz/sfBoEIP3eCdaGSUzQvN72m6iM3Tn8Wn4xY0GlHbpJGHpsyh8Qlx7uSoL
         FrvmB3ES/UGEEsY8+jsWaNw0XXpSxkLzHoAdymlJAxt8LWGh1QwveqE0dyGgE22dp05O
         pwcmJnlFFfE7AWgad475hUstHegKngPmx8qDDzTOSZd4OTVgy81VhEQ4mKLs2Uud5Sti
         offomqDTE/jq/HMdH8+t0pe3a8Pfk9YkfYyCmVMQLGIZujMu9PWmWAtxrHC7bmlxRkv0
         AqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675839; x=1729280639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrY/petUyesoJ6UOsIJBp72dgEfm9iPyRIo0owx5hk8=;
        b=l9LCuD4KpxYyd4+PZ24ttx6FKna02cPl8xbxDp0ShwbaQ/Sk8pHW/mU0Enczk37lNO
         lODOyX/owAKH8k1Or14FW4pgexeFh23ghh26WjgWiboyEpnHSK73FG86HvwyTUGmrE0z
         mEBZpgh4/hNHfJfo1EO795TFixWeunr9uZ79DdYcYi/AYxg2bK+r6U+oPjkLFO3de/Qm
         TlpGWbJxHnjnbkE+Yw0Z3jrupDJXGOE7OmBuJGE0QwDCzCneItvku2HwaVhuMweXPtFk
         KtxsGSJZhi0LGjWbg9bG0asF7xl+avlHbccWFguMicKPSPC0wh2YrLPO8W7MOz8wDbIU
         SzRw==
X-Forwarded-Encrypted: i=1; AJvYcCURfp0VQ3AbHcfIiYDBd142Aku2KzEaaGfwGlg7quZf4d71muWfRaoP1idAfnzGpwk1EsttM3t965HL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9cfQAKB/GgF5xqGo/7Rlx6eFT4zmFD+0UMqJ/EO8oYvKdt67p
	4+iQdTXtITOvMIUDiy7CyYv4y36QxdIbXEnUAYV8BJ66dbxM3cKd1RkpqW1pxOqIQfZYLDyvlRx
	NmBYswSGW7JcKYCb7vc+o+oTaZKnc7fDl6np44w==
X-Google-Smtp-Source: AGHT+IF4HXKb6+hB5Dd59byncyBxXRjc3bZ6ZTetx5KTHT174R+xsljo+cnH+V0z7QzDk1+inOTjzE3NHBLYrvFkqh4=
X-Received: by 2002:a05:690c:ec3:b0:6de:1e2:d63b with SMTP id
 00721157ae682-6e3640f7e98mr6783107b3.1.1728675839497; Fri, 11 Oct 2024
 12:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007103440.38416-1-brgl@bgdev.pl> <20241007103440.38416-2-brgl@bgdev.pl>
In-Reply-To: <20241007103440.38416-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:43:45 +0200
Message-ID: <CACRpkdb9Faiyq_J5hQypwqM1zdB4Y=s5JyiDUH_b8j7gfeGHHA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: davinci: use generic device properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 12:34=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> OF-specific routines should not be used unless necessary. Generic device
> properties are preferred so switch to using them in the driver code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

