Return-Path: <linux-gpio+bounces-9940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55E974CA5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2024 10:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E8172868BD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2024 08:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B0D15F3F9;
	Wed, 11 Sep 2024 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x4F7V2dq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80715DBB3
	for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2024 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726043299; cv=none; b=DCg/fjt62k6mto9NNG5kbkhssLlpbcUr2UDAJZ+IskCt0UfPj0CRfsS4Bs4sfEH9/WK0KGTttdbAr0EG5/dp6k53ZISfZbpreIrYOFZxHv2NFd1htev9GyaJLfarZWnenLkdYPo/CPyyoc5Yn4gJ9sRsjtDByZhXh1JiXea3Rpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726043299; c=relaxed/simple;
	bh=ijn0dNrv7jyeqwNP1PBx4yLvBAQoFuLdvg3BljHGbVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U19BBEaFoJ9ngwcPMWnu6pW3pgJHOfPQl8AJknl12wcx/UWlfvmvIKb5VgNAhsZovWxqPiw1KoYVMqfIR9w86H13c7zcTCLEnr6frUoCjS3hNCtTCFVAiDyNhU8duVWwI7qExdBx+1E/hO1NZ8VXOxqQGwp+Vp8dSh1BsRlOAVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x4F7V2dq; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f758f84dfbso13387011fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2024 01:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726043296; x=1726648096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijn0dNrv7jyeqwNP1PBx4yLvBAQoFuLdvg3BljHGbVs=;
        b=x4F7V2dqmLnPoXUbyGFhnyd9PaQik/Q2ehMhw5C3nceWQMOUQp8zYkwKq52SyYTSt1
         qrgu/RZ62+6GIi0idnMJPgVu2RRceUwM8StkO2cTrbfAxh69V4GxxnUMsrKxmGcV1h3w
         W8pRACucoeTe37p99x8/ea4SxWV7/eZzpJVtMKWU7EkOYx3qVABLHqo7hlcDJ+glhNOv
         a0wJEZD2/tq8q0C3BL3xeCxpkXaJJrrxSoGuHvXxcg0yWD3tUWigwT/NFqIp+Uh1Raje
         191FgbaspRxWP+i9jpvSoCJCKUp5wHQBB1Zbbaf3ZO0MaKBrqfdbFjdidqbFdx62ik2G
         ga+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726043296; x=1726648096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijn0dNrv7jyeqwNP1PBx4yLvBAQoFuLdvg3BljHGbVs=;
        b=cVQJb3va6Aos4eYfMTmfZ2Px40REjhaFL+dgHbPf7KvyFBbZ0a9SNAvBjr0NIXtf+1
         BMlWfm/6kIOHAofgZ99uDTUfzh3A/kY+E303Euqquc6FVj5gWVPmio7INnvwsnCSIUKI
         lYKINROcyaJ8ADygzyPqq8Hj6MoTfqpmkPS6B1UlGZjax4rGpdj//JwA/L7pJeiNlDn2
         91+qODbElzLzGVL7aRzghJHDnFmEWZFyqKxPxdY3xFLSzzVYUbZE+Z1r7Pe1AkGE+Mh6
         HfCUNzQTWqfXRx9+F6k6CSLxY3S59PLgA9rgQXNFk9GDTFjgoYbH+llmhF3MrTZCAMVL
         rcDQ==
X-Gm-Message-State: AOJu0YzXRAgkEi0vPn82CRSH2PpXFgLszvCNseBjgHXbENbECTJfLCUs
	j4UZfxj4rkueO7VXm4YRDy8GFoZBmhdsV4onLDBhZT3fFS5td+bWuu9tldFGbM9wge5RRPpEMqb
	dF1QFZ9JAmkR4dbTe+S+U2dEu0pxxp5lbEANspQlnCwY+3UzI
X-Google-Smtp-Source: AGHT+IG1+gQvF5Un1FS6UxNcPMDySOrw1jiPDBiVoQz+9SiZ6cyBxxfhw/FKlDEzo0WhBcJrx9W8GzpAvmLQjXUKI1A=
X-Received: by 2002:a05:651c:1992:b0:2f3:f339:e68d with SMTP id
 38308e7fff4ca-2f77b752429mr16606851fa.15.1726043295575; Wed, 11 Sep 2024
 01:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZuADHfjPOZCV_osO@black.fi.intel.com>
In-Reply-To: <ZuADHfjPOZCV_osO@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2024 10:28:04 +0200
Message-ID: <CACRpkdbaX=7YKsE6G2FbJrtj3ADg8qRFeRgiS=9sBwvsOc3krw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.12-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 10:28=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Not so big update to the Intel pin control drivers for the next cycle. No
> problems were reported for one or more weeks that patches reside in Linux=
 Next.
> Please, pull for v6.12.

Pulled in, thanks Andy!

Yours,
Linus Walleij

