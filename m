Return-Path: <linux-gpio+bounces-4749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B70D188FAE4
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 10:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45C55B25AEA
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 09:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59EF5FB90;
	Thu, 28 Mar 2024 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9nTBtX4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3320E5F876
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617318; cv=none; b=E/eLzdwldJzBRZwEG0SLm+kLuHsPQ6mkOIGc1xTFtPIffRSY6f7lnEJEmP0rMqoz0hAiqEb5q/XDPeXGItbhMTCqB6nENPj/iNx6vdz7OC7t8tdxyeICXJStBk/Bhg3ZdVguP8RVHqa+rffk9wootRhqGUo+QEqM7RmzQBn70n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617318; c=relaxed/simple;
	bh=DK3WWLpghCazhNxnzpVoeZ6lBHInJGjDV4FWurbpgm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qH0CZbbpSu1wtJ0JuFm4i6qupuURIWlDOcqkcH3MsEJMO+DtF6mtleIgaYw4wg0VaLieufNDIuo4jGUqKpLhscU67RSMVXxxLBdiqs3xsY700zm9ICdGqmYbksoh7i8xS6KaMhS99fpjuI4QGu/Lk/mjfUipRfNadJ1vvcuCWhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9nTBtX4; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so736570276.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711617316; x=1712222116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK3WWLpghCazhNxnzpVoeZ6lBHInJGjDV4FWurbpgm0=;
        b=B9nTBtX4Ml1Rl3ZO7w/cQZvClojyd4utcAjbyrjq8DN6EeJoephcoZr81NhKHjkE0P
         iq/vnuRF2B8DanFZY8dMMhhfXP+7UrA/Y/j2hhHhqskPD5UiwGBx6HUnVdZxrrqnwMOZ
         gWFnf7hjqpcYLZnh8tDxPfHTlxGnyNneinjTHMBQ8K6O+7p5DEE2En4EEKqckN6S3rK0
         I4AIS2aGX1uix1FghNU4X34hiyBnqfcosDPP7MeIO4Nwuzj3QSHdbidoh+X4Af/t72Vd
         wiMlzcBt7gkS5QpyYGTSadf9NYDjZ+7mYywOzJSu4LvFmsY1dikIeMzwupF4Mq8z60xA
         XK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617316; x=1712222116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DK3WWLpghCazhNxnzpVoeZ6lBHInJGjDV4FWurbpgm0=;
        b=RnAT0zyL/X6QNtcdYoWvntvn1lOoho41w2FsJctJfSZyk5ITYZWXeSIkj8GnfXw3iQ
         zWzrewGONH8AuMNPrJFXS2KKj8RzggJSHum/jQE14ouroHbsF3T3U/GlXMRbTqZSrB2y
         owKjsbrllSTcwlB5Wsv6rjmugl0UBwf3R0eYwJXhtcoeS/ASugxtuSR7GDGSQkVTxYwn
         SmQr083gwE1FRoowLqCajvvTh+Ej4naNDoSbKCgNgyVp5khJje3EVKdv2vcJvDyGC4yv
         qdk0rLXJS7fM75an/LxUvXJtwe4Qe+XMlLmTXfeYRoNCkyNpshf0jtOUgE0QuAAGEa6T
         OLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDbC1d2Ful996LjbgUraqlRfaieB3R18eh3bB+lOVLXmusMOE7MYFk+9slETR9PK2qgWn1F+zXSQWybt9347Zm96/EvQg+6uW4Rw==
X-Gm-Message-State: AOJu0YyM+/+wk6r1vANLR2VsuxdrnXCvr/r1XhTWiNLniAASyk+7KWBm
	Kxg4VglkNx8dGl/vGNIKyiWji9keFrSjJowrvWSnSixjoJjIWxw1QUaafDfcJ9GosucbFmeQViM
	n2tvgn6s5dj6OHlXSpGqpOLyOytqa37QS5TJWGBm5UZ8ltEAt
X-Google-Smtp-Source: AGHT+IG4UAVC7NGDGidRJtRNWZfYlG/8nA0Xwk+zw0p4efi6wDiAGEzLWglCyWj8gtQ9WRg5ukXUl7W+4wfTKJP4AgI=
X-Received: by 2002:a25:9b85:0:b0:dd0:39a0:a998 with SMTP id
 v5-20020a259b85000000b00dd039a0a998mr2199704ybo.6.1711617316176; Thu, 28 Mar
 2024 02:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313092809.2596644-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20240313092809.2596644-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:15:05 +0100
Message-ID: <CACRpkdaxekb_E4ttW5XfRUa+srkjOzUaVXRAtHMYjkVir7R7xQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: pinctrl-aspeed-g6: Fix register offset for
 pinconf of GPIOR-T
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, johnny_huang@aspeedtech.com, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, Ricky_CX_Wu@wiwynn.com, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 10:28=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> The register offset to disable the internal pull-down of GPIOR~T is 0x630
> instead of 0x620, as specified in the Ast2600 datasheet v15
> The datasheet can download from the official Aspeed website.
>
> Fixes: 15711ba6ff19 ("pinctrl: aspeed-g6: Add AST2600 pinconf support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied.
I recorded Delphine's similar patch as "reported-by".

Yours,
Linus Walleij

