Return-Path: <linux-gpio+bounces-9117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE295DE74
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC01D1F2239B
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5D117A59D;
	Sat, 24 Aug 2024 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idb57QSp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD0176AC7
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510224; cv=none; b=Ex02lY0Zkgje0uGVfMfMj14jVJKYv6NwNj5j/4w7yzw10FLArx35/MtF3klIsCcgAbJAfinZBwQDWvyDFQ+UQYcHxcpUjCtcMTvbq0/U3oT2H+DDQ0KmgTdk5SkUWoi/A2e/hj2wPvkh+UC165TsgHaDsyZtCluoARDwbAViqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510224; c=relaxed/simple;
	bh=CG95G2B/zrqeXZjGU9yYd4Sqy81qj8Ln1dTXSjqDD7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmLGqCQBgcECNTu3yMl8Kn+vkxwKpdaTvE2umi3V+DSMNcAxlwyS29Z4gIIGLvPtPJ14xCQ/lWrBLRklVfj20mUGDq9R9QxYrKzo1241mT5UQqKqqRO4qVbO88wJ9AtEcyyURKbNMn1CXcKClMcIuEAXzeD6m8NsHBu+GalgK/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idb57QSp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-533488ffaebso3291452e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724510221; x=1725115021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG95G2B/zrqeXZjGU9yYd4Sqy81qj8Ln1dTXSjqDD7A=;
        b=idb57QSpbx/lKTXcd0/wve9MOiaq0W78bjRHMnHx/2Ge39x79gkddF5BhCuktpCCPI
         d2r8wZuPOV1xqxKRz9S6gaymY91JKV/2WRAFLuLPxyRnQZvQ9klYCK7gHqXySFF8wZN2
         +8bAszEOEUqFy5FSbzEq/AOtIa+s6SkLfEjM9IyU/aSjG0NHPIC4m0Rq5F+DatdYa2zm
         hWYW12kThv8bJBXSHTXI6g7ZQCsPHxgwNcqolkNbf0XR70T2pMk+tHeiTkAlrHbQp3Nw
         guQfsrL8mIqk46lQfm60PIx9tjEZMNtnqMmkp9ED8oy6b3YDa+PG5n9vYQXeRA92HtfI
         58bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724510221; x=1725115021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG95G2B/zrqeXZjGU9yYd4Sqy81qj8Ln1dTXSjqDD7A=;
        b=geV0z8jQ4wn5w/JZmxtEgIbWQOPtjz+117SgrO/ksgMEnet2c3XGII/A7m/cwsitcf
         zxsEK0jWXy9a33x3L78R7edg97gRbX5got0uYJ+zvUxQYPiPKnF+DdUPncHK+DXJBRDp
         vn0NKeh4ZnPv0OVxFOJUq+lfNsRY2BGB4SpoGx7P7JG911+Gh20AedS679vgbRSbu4Ab
         V2kisWlrxAMzAsXZNwBGSoCcbjHEg7sOLjPNXDWFsVg7CJ91SDduPB+koJq3Zl06IvXY
         cj+xiPlUiJmtCQZaNPr9HOflL9ULq87iP7Y1kwvcFj9JN1KK+eCc8Kr8WoNKpBL4gjvY
         x8PA==
X-Forwarded-Encrypted: i=1; AJvYcCVVnJb4nQT6vCRVdprZobMHTEbWe/bBvCcS9kw8F55Itu/mpuk1wJRDkWYqe48syLxOYAnIde3aPfnl@vger.kernel.org
X-Gm-Message-State: AOJu0YztIoc5JuVyCxPB3aS+7+lH177DX2IEDXhtRihIq85Np0avd7zm
	ZouVy8ePox+DrMu6qzI5AjjQNjq4eKZt1/bewak/xyVM9uOXB245pvER+icEHeIxOoTy04ysbJV
	UtS54OaAhUehJYvpW4TMo1dZdZwcVYie88h+IbQ==
X-Google-Smtp-Source: AGHT+IHExAEP6USXFTAcZY3wpPjikr9WBIKxt2aZPdORkA7FU/NSxzDoC+Ur7Uz5K9SsyeaVfIvKDaawtozRzHt9S8E=
X-Received: by 2002:a05:6512:114d:b0:52e:9b68:d2d4 with SMTP id
 2adb3069b0e04-534387be68cmr3422497e87.56.1724510220377; Sat, 24 Aug 2024
 07:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819151705.37258-1-brgl@bgdev.pl> <20240819151705.37258-2-brgl@bgdev.pl>
In-Reply-To: <20240819151705.37258-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Aug 2024 16:36:49 +0200
Message-ID: <CACRpkdYm+exCeVV9RVWNnn_6vAQpSss0benQTYCOLtoWs0N9OA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: davinci: use devm_clk_get_enabled()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 5:17=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Simplify the code in error paths by using the managed variant of the
> clock getter that controls the clock state as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

