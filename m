Return-Path: <linux-gpio+bounces-5075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9CD8985E7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 13:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 982B81C21D9D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 11:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB68183A19;
	Thu,  4 Apr 2024 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JyNHx/po"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341A48286B
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712229607; cv=none; b=ktfJirQ/KcFY0Q2b88SJ+ylDrUZRof+co0jiPKz3loEvd6DfY54si8OE7YP39Hjvd1BhyntTQQTEL4pYLfRjEWaWOL+bIHmH7TfhdfkbQuvxKPI5TDoSCbyl6t0an9jqNqJhnuNBQm7I0X3jubnzhQsUdI/z7sQS1FWmXBQXZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712229607; c=relaxed/simple;
	bh=SgFyjVI7skGqGufmNsJfs5VYJ8IwI+CIbwdMTiKmSD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qESFkKLsxtWbzMQo9C06o1ZBVD0zRjdHBbCpfa1nR9FwvL5m4lm8NmYYaZpVlfvSd1syEz7WJvcYkNDYlLd52PkJ2z+KKNNlVT3+S2mg2iRwE1PW2KoEX75jB2/fgu950fiOrL9qLxf4BbszOCG/DVmYEtVZVW0Uh6ERq1u/rzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JyNHx/po; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so870973276.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 04:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712229605; x=1712834405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgFyjVI7skGqGufmNsJfs5VYJ8IwI+CIbwdMTiKmSD0=;
        b=JyNHx/poqfLlD4cjbCsFo7O36agnBvBbnIsGWZlVKHUjS/9wxaqWzzWmnmmn48V2Tl
         kB0iU2xRNnDRvayLamHJiKTNArAadsiLxQmY5JyKAK3YTHa95uXs0iOu+ioB+dywNolg
         8DwtVtCCPtpQ+H1l1W9gRwl9Zkx0CSQh1JVGq0yQ2dTwulmzfB/ljRaGE3UikZ4wbiaF
         iT6EZpQSTt2xKs71WkoVPnM64kROP5p+Sx7FLK7l7lKe6R0Bo2Ihf5n08eX4hYzx9vuz
         a+Hoky2W3pwcyap2isF20I6AnMpkPcOoNVdEdMu5VA0FYGPYv9wk1akhvmX9AWNs09wN
         grsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712229605; x=1712834405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgFyjVI7skGqGufmNsJfs5VYJ8IwI+CIbwdMTiKmSD0=;
        b=esBO7kNYqEehWryrgUAcKJiKV2PAls9ig9YlimPq7rwkrrVnGaTTK2/Ss5XxZFvCvG
         4976qUR9X2ic0RBGqIRYmNA8QQ6EKzlRG+IiaQXrSgTj+/CDYHxOMErqoT9E3BeDodH4
         rSf2yL0d0z5uqd20EgeoYqMlpZQ03VL6QP45ntSqYqM2ZNYE9n8timVa8nvsezehzXHb
         CZUZq1Ic+WOhYa+6HJ1iBRwpxA+3iWwEzVsieEdvJK7S0rUbpgMFEKXevGcNX56KMi4o
         8hhs2Jaib17j1zb9gylnlqGoIUvnlcG9q67YZ4K/sxiFy7il+zvBWASx8wAMRhvCX/za
         j4Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWzsniJ512ZbZX5/KpMMyfFEtOTUCoNWS5Vh2kt0DDR6KYSYVyvbXygLAg0/lEPmqRKe044B6h/bUf8tk0wO/TGHa0pOT6u/+09IQ==
X-Gm-Message-State: AOJu0Yz2SYTYlZN/bS3gTUTUraWHWLIsVLVnr+dCjNp0LlRMNi6cCMUZ
	uvWPCrbZttO/TTgKSjWsLQC5CeG2qthffrYI5JOyWVLtpS5cDxyIV4Twkwaag1z9i45qXxmLcZz
	RswO7pK3jlelCioOXjNCRpj5/h9t+frJPzPS5kQ==
X-Google-Smtp-Source: AGHT+IGVjPLP5XGVqd8J5W4eYI/XCEWM3gv+qj66WPaPpCXMykCACqcRsxZcNsZfydLYjM8mo3rNCXIZdkK3WjrCAZQ=
X-Received: by 2002:a5b:bce:0:b0:dc6:bd4c:b119 with SMTP id
 c14-20020a5b0bce000000b00dc6bd4cb119mr2010810ybr.55.1712229604946; Thu, 04
 Apr 2024 04:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329105634.712457-1-andy.shevchenko@gmail.com> <20240329105634.712457-12-andy.shevchenko@gmail.com>
In-Reply-To: <20240329105634.712457-12-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:19:54 +0200
Message-ID: <CACRpkdagjPLMUjYa0z1sFGVJJ4+0Tp9Kvf6umU2JWHeOB+fbPw@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] pinctrl: aw9523: Remove redundant dependency to OF
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 11:56=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Driver does not dependent on OF, remove it.
> While here, add missing mod_devicetable.h.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Oh the kbuild complains about this one because the driver uses some
DT-only helpers. How typical. I kept patches 1-10 and dropped this
one.

Yours,
Linus Walleij

