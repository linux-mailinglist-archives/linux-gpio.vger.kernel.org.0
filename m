Return-Path: <linux-gpio+bounces-10704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EA098D76E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 833F0B2272F
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C771D0493;
	Wed,  2 Oct 2024 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ribjNTzT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223F71D0436
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727876959; cv=none; b=uQqlxXpb1v+a8KZ5tE9ewq28Z8SFeletCdRwukODvpLFyZpTrrOwqt1H8yuEPUzSYucTriNuzlrmCtMg8gIfKmnOaDoT1HxXZts0sU1ZeTm9eZmq+b+wRLLSgwvPP34pgfr/RZlRthJ9vkpNE3kKhE7jAH8odhpoqxB4ekiS5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727876959; c=relaxed/simple;
	bh=qnemXlqKyVEtpzm2xthZ0SjGiLbsn+rvaEw1ec1dmrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t8SEBOrGlmJO8sFjTnqk/1ObfeXOc35cwT28Sie6w5l04WnPurjcwWberfvcFkssxBh7JoZK3r+wM6INUjx0LNPDUkOnbSFYUW1ItA1PfeoJOC9oToCNPr3uLPZxCKK3H77+dvu81PL8aD8UTVomDaMuZICERPHV0gbu4SDfST8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ribjNTzT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso4626277e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727876956; x=1728481756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnemXlqKyVEtpzm2xthZ0SjGiLbsn+rvaEw1ec1dmrI=;
        b=ribjNTzTMD/qOvrn18sj92+0mYG8L//gAXms5rrtsj4fEkEyGhTHpF5r/D3kUtWNSv
         CPnGHBq4H4IBhapHxSmfxUpuOxQhhh2MMpy0bfEVdkKx74lvYDcNJllL8EWhmBmz1xqX
         y5TF3uN62BSk86crYiRkJmRunTAF7AS1vSbeFEMDFqTcLbUL9RZ21oYkiKE1gVzbK8Xi
         Sq1/jOPYnF7vdqp4GwBGZ3e/thNEXKa4WzvQCraJGoiMnHtWZneoj9DZA7oIbnTEMJax
         1jYJj6eoPFGZzaslTWTpRGliJqHwYKH+SRaUyqQVxq3pyiTQGxIBS/PZR0f4jTQuKtjj
         KDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727876956; x=1728481756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnemXlqKyVEtpzm2xthZ0SjGiLbsn+rvaEw1ec1dmrI=;
        b=Bt0+ULDroj6FzPtpObfjA3C7bGHyq267Q1dg9UeMErprLlzn0srizaymf56qi6g77g
         tVc4iAFIPY4+coyDb6pj5HPc19kV+4KaAa5n7VE7GmJi73fHJA684kRxtpR9BVbZEYlT
         AgrUrWFSlJTQJnPByWS6mven7+LnogZwvZduNk4N0uTAlgCiBEylP1GdAK5gBj4uDZ5v
         eEwpodMi8VKdfHVU8oqQwre9uU+pVvPvTAO1V8Ju1TpcvY5gx7OrT8sxGexoWAmt6Aqy
         5sjjz6UTDT170xr+B+HUnEAUYS9GwOOU3qNaE1Hjx4V1H3259ewO8ZGmNUeJnZSRoYnh
         wEAA==
X-Gm-Message-State: AOJu0Yyq1tG5mtgNNzpyiYvbn617qxcShGIxgh7Z2e+5lvr+xwQpuFf0
	7C52Z98jQuynZzYUemdSym/SBUlvyBsl5b7y7NfOsSishaK5hUUkTyXOW+2loKEhsp+ExKrO+1Y
	I/jVCM++tOrS+g6RRgb21NzZSf5aoGJJtqaxIIg==
X-Google-Smtp-Source: AGHT+IFJBRBc8FJ4JDaAaunudWBbYUpwWknKXNTtPVmqXm83flomYUNagYhKZoWry7zxDfsurgHfnyAQwiGHyHDqW6I=
X-Received: by 2002:a05:6512:31cc:b0:52c:d819:517e with SMTP id
 2adb3069b0e04-539a068502fmr1897039e87.30.1727876956095; Wed, 02 Oct 2024
 06:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001212724.309320-1-rosenp@gmail.com>
In-Reply-To: <20241001212724.309320-1-rosenp@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:49:04 +0200
Message-ID: <CACRpkdZGiG0GFur-8WenpXUcWMLoc_56oeU+fTEV-vppmph4+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: aw9523: add missing mutex_destroy
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 11:27=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Otherwise the mutex remains after a failed kzalloc.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Patch applied for fixes!

Yours,
Linus Walleij

