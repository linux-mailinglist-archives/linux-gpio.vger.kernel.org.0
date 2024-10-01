Return-Path: <linux-gpio+bounces-10639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B07698C036
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46BDDB29CD2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B9D1C9EDE;
	Tue,  1 Oct 2024 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Djk3UDNe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F039D1C9B67
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727793046; cv=none; b=MOio7JphZeJihHS/T18e1xN6uLqFI6SW1+kG8TVPIOGqCQi9xAiER7/1juMyL+nQzZBTSH7ZrOmVuntHBPdcWglfg+dIPTBjtuzZtksoFMkOMLRPiZca+UeS3q84YJoTazXGKZID7yOfPANHqqcnDkgJ1VsFdcVTCpA783eZRE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727793046; c=relaxed/simple;
	bh=cvgFpm4rDeWEyMMdQ20T3EGJ3qMtaD8+usSEuEvv7iY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxeGwIPxFvGKzaauAs0uYijIyeQ3XoyZ//3QsejJubUxYLu1rOlOeKJRpW9An3WIG70lSltnr+ObrZV7TzkNsJvVuedpRw2Sz+C18lPbK9ebDPIkhQSFoS8wDayFWDBDrpxH3AtIGBNvhUV5vZbNCSm4HuyzO1lfQcGbz3UZ0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Djk3UDNe; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5389fbb28f3so4179743e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727793042; x=1728397842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvgFpm4rDeWEyMMdQ20T3EGJ3qMtaD8+usSEuEvv7iY=;
        b=Djk3UDNePe1ykftJ6p60lF9NHA+VmFLqQFXL32D0QtjVRdqM1tOpPlhBTSR1aNyYVe
         BEixgLxTxQof45PAn53N9XuCkgzqZ0o1fBzcZb0s406NQ6K07Y0j3xiamJaIsbfJe8mu
         PACEirwPQ9ofatVw2VnFbhTbL4AIaaCZDGfWCzNSUuK7wzbyzh5/cjdSePBWIgt7inzJ
         c8jup5zFgIyEBeDEqiOWnRF11t2rZg2eQqp3pxHINixwP3+3C0OV8ja2Ho+e7LNHkVaV
         L6II5bYebZaWQBxqQL2FS6Frwk0dY0/+nR9mc4TJNLjyK70GXDDDnZ+QdSlasAAUCB62
         tCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727793042; x=1728397842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvgFpm4rDeWEyMMdQ20T3EGJ3qMtaD8+usSEuEvv7iY=;
        b=f3kPE3xvKTbSOf7wP45tITUE5NHoSFLsjzOocaxmmG7UN3w2L1Hhzp7jYTWHk0+OE5
         6FyHIb8v59dJvyxY5rY3INhdDv4rqmv0N0j0Zi+npskK32rgeA9loumAiiqNCi2dTy8+
         GlFQ3YS9Hh0qXKf3PzAhf7oLJxmkFlVBbmKzDE7A9Dr1aydZDWuTTjOj1ImOmne+AKnF
         sPHNhYOReoiL1eONBKJPfH5DSzOi5CiFHgDscOkfw/S7nCzaQ/N1EMjLbNyXVH0o5V+8
         P/pftbFHTzw5O6TOxlUFlOOp46xJhDsc7wGHs4gWrDScHYJH6AnvU9PhMShPKlnWAW9T
         xZWg==
X-Gm-Message-State: AOJu0Yw0jEdG/YoBhbrLyHCH9LBdG9BCmd2yAtwgwfWpuzDhanmzcIaf
	YId/OSXNa9pirLa7+gdQvHuQoYhq2F3k9xgaMniDW/8RCjTERHSpGH81IiLNK/x8m6tmlSeoGJO
	VcLOHvXQqNHAeqJfHr2ieMo79DIFWvdcEBmcB8w==
X-Google-Smtp-Source: AGHT+IG+Cj9uBDgQqk2xEbqNSYpxfJ50Q7PX8br+Y8B2wdH7MgvZc5ZjKVzSuVxtvai2dvhR6L28NSaVg6WFiSGR/BQ=
X-Received: by 2002:a05:6512:138c:b0:52f:c398:8780 with SMTP id
 2adb3069b0e04-5399a25697amr1158445e87.18.1727793041967; Tue, 01 Oct 2024
 07:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924-pinctl-sx150x-maple-v1-1-17dcfefefd17@kernel.org>
In-Reply-To: <20240924-pinctl-sx150x-maple-v1-1-17dcfefefd17@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 16:30:31 +0200
Message-ID: <CACRpkdYLkUhK5Q4b5ckAY1F-uuoc3C+XYW42W=_NKxp7hfzf-g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sx150x: Use maple tree register cache
To: Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 5:39=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> The sx150x driver uses a rbtree register cache with no obvious reason for
> specifically preferring it. The maple tree register cache is based on a
> more modern data structure and makes implementation decisions more suitab=
le
> for modern systems so let's switch the driver to use that. No functional
> change.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Patch applied!

Yours,
Linus Walleij

