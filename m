Return-Path: <linux-gpio+bounces-15484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2EFA2B194
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF4D43A4882
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322B219DF9A;
	Thu,  6 Feb 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSb8bKjl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFD819DF8B
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867605; cv=none; b=RwUEKaKeHmjUkgSsSGz4ccpUo7pOBexEI3BFCh2YoIbNTdMQdyH0mNw7MaKSkgpTus0NcBN5ollM4Saj18ifxh5hCLWjUjsvshQSboTGoeClFS1mOH1rjjrDPlqB+kRlvpm5eUM8SqD72xAFKiKg0hHtv/htDUuB81Ir5+iLlzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867605; c=relaxed/simple;
	bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpJhV3tXeKMjBBxYwGY7HpCLmhK/D+FoNWl5iG3Y+NsxdEGAGKUy3lXB0d8WZZs41Fa+U3VujuyAQmUl3KaGcnE1fxd82moobnt6AnfNZ7aNeYlpsIUiVtf16BVAh5lLT/Zku6hYZRaA1/a0u5zc+vP29rWACGzh4qd8B2mS6Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSb8bKjl; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so1426405e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867600; x=1739472400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=HSb8bKjlCso8Q2T33K6TqG78MC1pBc6iML9i+BJ8Q0DgT9npYfT9ppCDFnD8y26dIO
         q/bS5EVPVi0bwLw+Vf13weupn53gFOnG6j8UZB0r6mPsrIUzmM9AMXW9Q1sWhpK/ZvXe
         pUpJUj+ITtePG3fvDFxFRoc60DY/bPX6ssJ/mXBpmZ53Aa4ZMzX6aUSJJVaXWRm20mkV
         EL3ZyJz3zSio1/7DKWPuAWOP4VahXA735Hkg9ngvlmFLp0nr/wwFT8b7P35MVG+5q1Cf
         8lKMd53PhI0MoiAWFLrBlsoQpNgt+NQIFrH9x1RGdk96WrLI6MY5DU9xsUC7hG/UFxFa
         6HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867600; x=1739472400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=fq4yz3i6N5qfAoiMaEp4Qf8M6Io9wrofpZxOyrjSa2iJ1g1/bsPy/9tRjkr7s/+a7Q
         urZgQGzcAqao3vY+B+Lf3mTTGzwz2b41MunteUlS956w/FcjbpXJsad8IgHgjG56b/3h
         KN67naAdyaHKAax499fB04Me/uIqJT9lWxyi4sGJktO9YtxXQRks7M/Jg9ZRsAHcLRL1
         zGJR29CjVxIzavi/mTYjl8lPq6yfJapWkv9QwBHRMRLsntEu7wNnmAh+oUHLcQj1n+yW
         MUBAdTUlSV9j1l+cyPd5Qsk3+4f7bQCi+ZnvlK9rXy4h0tadm7ggMeQXqqgXBFLbdwQE
         tjhw==
X-Forwarded-Encrypted: i=1; AJvYcCW3LL9NRbWKBqhQNkXwkoGZvX7AbHwVIO4iElbUYBcB+7w3UFNFSvqE53gQc9Vj5Eo1THfZ7J23qtbW@vger.kernel.org
X-Gm-Message-State: AOJu0YxEybaSd5aUf0XXw85cAetbIkCTz3COay/NvnF+lVBx0vZCoNKA
	qrnZ/proap9veXEcPDi9YJx3q6rI8Ts6JLU8hjlf6MtA9MNLyPMqk/9wxFcDZEmnWPd3EpiEHno
	evCHwFl0VHjs4xTpzvvPerdIWS4HBJydIoPeObA==
X-Gm-Gg: ASbGnctAx5EUNRyRGXh62zMfJHEYGqpL8x+3YAkFkKgOTywtyIbddziLiOdY+fQQUpB
	L69VVreqktrgiDrHu1/3IQFTzlvBaZ4+pPIwTaxgjaYXL9DrWbuc4AagJwSZrHtk95Xrg8k0=
X-Google-Smtp-Source: AGHT+IEpzVZeWcxUUFevUxXUUtkE4eDoK/ekTj85xIIJYmnvT+leN3VUeeipd/F5aigtmYFlfRv7++sKlMafMRpOAt0=
X-Received: by 2002:a05:651c:548:b0:2ff:a928:a23e with SMTP id
 38308e7fff4ca-307e5a7c213mr216161fa.25.1738867598438; Thu, 06 Feb 2025
 10:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-11-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-11-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:46:27 +0100
X-Gm-Features: AWEUYZmP4B2GJCmX-AuJOGL0VPK6_mEkpxI9o4n-GutRcEqg2kbz1wZ69XnDlBM
Message-ID: <CACRpkdbKzZ2WWEOE=ustPhL9GjmN3tkoAsgThW3ei7Gjstbp4A@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] input: ipaq-micro-keys: use devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	dmitry.torokhov@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	sre@kernel.org, jic23@kernel.org, przemyslaw.kitszel@intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:09=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:

> Convert to use devm_kmemdup_array() which is more robust.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

