Return-Path: <linux-gpio+bounces-30019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA24CEC975
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 22:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 112CD3011A52
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 21:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BD930C374;
	Wed, 31 Dec 2025 21:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/myJmuv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F951E1E16
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 21:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767217047; cv=none; b=CICYcFXYp46kA9NwnS3NYtw/OwCeuK8dHbeOzcufX2vDVnbQE0OlDQWY3GB62HZEWW4rLESMsMKOXNfzkHKIwNWYbrb1wwPGDzQeqU+U95isrhlalSULJq6h4uuIMTmb0LX5KjbCL6WeKvalQH1hLT396OsCEM7ytuT0xiIOOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767217047; c=relaxed/simple;
	bh=3Rfnf2qhGGwgV00DUgX+jw89Q5Q97DzPe9bYdiAb1ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKF5wIFuX5j2Kvw4LiRW/FHRTbGYD+GtUQxbDeq6kPyaS2/J0Y/bJbWho7FBIt3cLKF0R/6l0HvESOjTbRE0yXmwnBEU1grj/BVcy8LYXv+9Nf9CR05XjzCrt33m7q4Fh8a7uKV5eqFSy7vha7he4OtiLbDRVd0PPC8qveyImRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/myJmuv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DABC19422
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767217047;
	bh=3Rfnf2qhGGwgV00DUgX+jw89Q5Q97DzPe9bYdiAb1ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S/myJmuvkQhoJ8EppRf3vex1oHqN6qlqOFLVY9fq6nDRgajD26aH7kRPXmgv928XN
	 DF+TI78MG0UkXzZMdQuw/GlDgWSTvvxshjuoWDv9HPqT/ygN9fSm4tM6/4gtAfbWRo
	 QzgG3od32ACcdrA4U/CqlZorWWrLyM+hVKKc9JprOQAISIoIWyWLrac6n3tEKlvdbz
	 pn7SDd/cIIVAUBaCaNAtbKkHkMk4EWxb3ubqdSGLJYW7BHJG77tQL9PBBKd5n9kxil
	 vefx2gkquaNmsHtp/u9YwXN07/1/wFU4m8CwszxqBuN+8dVBrt7VZWgJ48dhsHZj/v
	 RFgKGQWveyeJQ==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64476c85854so9849176d50.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 13:37:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6WsjhhLLbagrXhNQjXSQB0wnXEkJyhd4xLyCvk+RNh3LuyfvZq414iXOcvBGKAsMDcdN5VnrXk01V@vger.kernel.org
X-Gm-Message-State: AOJu0YyWZBrvWfg4glUZpxQV+8aO5/DtlLmliMrP2TFdiUNgdY2x3Pmt
	COeGf5IjitFNOWn5dtMOdYnebR5RjS2xm5w+twMTmw0f5P/lk5soYdNiHCqYA1jiDdKcOcsSK77
	k7Y/9SO9PSWmjfh74BzVNHEYlKsXnlj4=
X-Google-Smtp-Source: AGHT+IHHeH8zJG7rfiI2GFfedkzIC0YK/SbYafxSnkK2MFdRLnSCHEYor5QZDiE7b0zGilhY27fuPDjyGexn5uPgcoQ=
X-Received: by 2002:a05:690c:3803:b0:78f:984b:4bb5 with SMTP id
 00721157ae682-78fb40c5f09mr590051547b3.64.1767217046540; Wed, 31 Dec 2025
 13:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-2-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-2-21b18b9ada77@codeconstruct.com.au>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:37:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLmNGrDt3_w=DFnBnjEuz3LN-=uc1o9KHv1j=4gbGPoPQg@mail.gmail.com>
X-Gm-Features: AQt7F2oNijhkSY2l2xLUahhHBTqPWX5BBKamnMGV8HdX2c29O6a9KTnJl-DXNNE
Message-ID: <CAD++jLmNGrDt3_w=DFnBnjEuz3LN-=uc1o9KHv1j=4gbGPoPQg@mail.gmail.com>
Subject: Re: [PATCH RFC 02/16] pinctrl: aspeed: g5: Constrain LPC binding
 revision workaround to AST2500
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 9:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:

> Discovering a phandle to an AST2400 or AST2600 LPC node indicates an
> error for the purpose of the AST2500 pinctrl driver.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Also pretty obviously correct, can't I just apply this one?

Yours,
Linus Walleij

