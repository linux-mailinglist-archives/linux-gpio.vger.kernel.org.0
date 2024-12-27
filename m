Return-Path: <linux-gpio+bounces-14311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4529FD5D6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 640231885741
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 16:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C88E1F7591;
	Fri, 27 Dec 2024 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndhLGKMZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E231F757E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 16:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735315846; cv=none; b=RLE8U4aXmIVZS2CscG+ayzOhqiax/GXzOA33s42FGXAjtENVUmpjzAMripY9Hm+4Q3cyWUCPY8tkkqNBYKYSQ6mY/YMaSPzsX1dbAGMKCPG+h0xd4/gN6Luxvc0LlLFSc9AlJVwlwv7nCmQLkG+3ErWhWMPMeJ4zTMFkwOPeXDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735315846; c=relaxed/simple;
	bh=NWcG+xJssZXE0W/ODvxFkGWdlsiyy5ecnOvmy4eo0jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrXqxQhD2WEHs/lZCnJ3kVWEGyE4ztQ+XOk9Vyc1wyQhB4q+dabCFvbgqKBX1gq+ttzmSXkWGlwxgoExML4+9hz4ph+0dDe/MBakV62HTokVQdCeSTxZ38B1P4AeODA0VA9gSghEwDvkX+TNcGviLKLrFYK+5fDgzQG2Yp4neEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndhLGKMZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e3a90336eso8173697e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 08:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735315843; x=1735920643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWcG+xJssZXE0W/ODvxFkGWdlsiyy5ecnOvmy4eo0jA=;
        b=ndhLGKMZXeJTjnRJiQFOGahKog19OvwibIn35kdYYWiN4hccZO9ZkpWwzvczzBZSx5
         9jSaTZQWEJPe72Y191QvSJOpkPh/6eiX+i5i3rR2erp2fgdjzO/Dqt5poVDqPLgwQy2a
         sPbQvK5u7GCntlRtgWg/mJ8UIULV+DFWLQlDyZT7gifLg7Pc9cfc4RJDhT0Kh4Iu9+yo
         LbuDHTICizOCuOHwZQsOCly/peFkrqwSU2xGIeLmZzN4jQMjJtwixU+RIvN6cfgGJ9Cy
         DoBrHnihbX16uN29ASmB9unpWzf4XE4DQAEoDhjMOgHcKZnpw3uhIjKtW7r4/3mk8Xxw
         Vyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735315843; x=1735920643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWcG+xJssZXE0W/ODvxFkGWdlsiyy5ecnOvmy4eo0jA=;
        b=CUrNqNa/ongEJNWvGFQBqIhp+zMoOCQ/5dT8etn6LQP+CdlCh2ZSXwmqNWUDvPB9uw
         rlF19jP3DauBMqohowaPNeGN1WDL0aqXX3FgnZ/G6dcpBkd7IatnCbvhmUBv2s1vvfbu
         Ztqy/u9eBFWWfaNbfp0bsVG3VgcbNIkWNBy4GaqCHssihlQtGeYpExpWsc8bbssIVCCs
         8ovNQZ+DLOUjDlcRLrTHK62vqh9Gdgo0lb8ALvjvlRCJRT7YyVrks69VNt44j/cbx9WK
         AZ7PWwifZp8dM7KoDWVQleLP5SJRtKQeDDfr89NKEiLf095bkFSDpEM6tVcbrBw4P7wx
         D+lA==
X-Gm-Message-State: AOJu0Yx/c9hJwnSKYQqvL4Td9JXMe4IWwu1qc3w4tGUNOYsMeJKfhVga
	Z53UnOLdE6dn7MUJ72enOmQURd7tZ5bcVWTctwqsVKbzN8h0gehTq7s23n7eJitdxdi1foaVzp2
	H0ipy2ZwAjepQTi9tX1suO+i+/cGhU8H6z9200g==
X-Gm-Gg: ASbGncvQNQ8C1oiouFe/GRPzhnX5voAj1B7kGHxskr4aAVsLCkaGSyFaeOlXGBrkTbG
	V7mO0hh6KLOHeKdM5s9DGcLVeGzBPOMma64YF
X-Google-Smtp-Source: AGHT+IEZG4nrNf1SMaSqOWSZAhlOmUZSL7vhp8jPsHy6Oab0nJt86IesaiURHyUzlhxJSlgFE66xZGtYm62ARUftqpw=
X-Received: by 2002:a05:6512:3049:b0:540:357b:2137 with SMTP id
 2adb3069b0e04-5422953c49bmr7757760e87.26.1735315842586; Fri, 27 Dec 2024
 08:10:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224084441.515870-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20241224084441.515870-1-mukesh.ojha@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:10:31 +0100
Message-ID: <CACRpkda2ejW2HoOr3rTRrx7CK6qyoV--S8dRJ9sem6CcGejY6Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Fix the clean up on pinconf_apply_setting failure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mukesh,

thanks for your patch!

On Tue, Dec 24, 2024 at 9:45=E2=80=AFAM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:

> When some client does devm_pinctrl_get() followed by
> pinctrl_select_state() that does pinmux first successfully and later
> during config setting it sets the wrong drive strenght to the pin due to
> which pinconf_apply_setting fails. Currently, on failure during config
> setting is implemented as if pinmux has failed for one of the pin but
> that does not seem right and need to undo the pinmux for all the pin if
> config setting fails.
>
> Current commit does a bit refactor to reuse the code and tries to clean
> up mux setting on config setting failure.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Hats off, it's a real nice patch. I bet these are design flaws from
my initial implementation ~13 years ago.

I have applied it for -next (v6.14) while we test it in linux-next and
think about if we should even back-port this to stable.

Yours,
Linus Walleij

