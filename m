Return-Path: <linux-gpio+bounces-19213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE643A98809
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 13:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B12E4410BA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 11:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F43125DCEC;
	Wed, 23 Apr 2025 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HhV/ai/G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8FB1A3166
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406060; cv=none; b=Lvfr6JCdA5II8ip8/dqkFv/uEbgqX7GPTTMpOMG0C06NaWddTPd7noBZyLbl8dip03opUNjlFk4MEnh3piL/VHMcTCX+Jz8PahCNhGW2amD6RFSSnfd/oFoLfUwpIyQa4zrabk5i6ZmBbJem1ltljlOsG6dDSAQ6hBxdgKvYds0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406060; c=relaxed/simple;
	bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApVAPUyAPpe1BKcKzoJ6vBOGMAzhhbUpgr0eToAojT4C7MfDu1YUeEutqigCDBLlyrVLz9oBOUZV9Nz+2At4Hlhc5T5aptws+ahryLxXNPGjZ2JoO3wW5MdnwgAqSyVaSns6QokmT3CH3nb1bdvvn8ucnWiVusZe1TMjlpDhpnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HhV/ai/G; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54993c68ba0so7187498e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745406056; x=1746010856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
        b=HhV/ai/GZNfP0KshxWTOSpygdXV6n5HU1KBbQM/2ffGVjmDgv2W9aUbLM4Jc/B+slk
         ELFFg6+XRwmkqZFdTFBakZ4g4COw1EbC0OfEcxcQikk9RtTXLn0VioLfOcqX0t3W1psN
         /XLiqfnbv+jqJ7LsGoOqvqGWeADMezDebdsjemufxzy+Nwd5x1RJeG6WgQTcUiVcX3HL
         fZXf2XlJHyPqdysgEgay18H/l8zq+xYffJcPbHP5txcYbeY7VSjMXIdtfZa4VoOUJQF6
         VK5I30/rl5QK7E7UQ3eXJ1uMb+QXiv0LOhQmC+XswAvHOkm8d8Rg7FV7B8TUUl0KrUaV
         rmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406056; x=1746010856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
        b=Frj86vpZ2bcbmQcpZ9EhV5rSgGPEgipRtouuFjIDNCDgXqdM1+PEzWW9nP+KXsmtFF
         qsUUjiT+0RgIA73k7GI1yUGbX/zwwR9oPWhu7WqEy5whpgzGTYtWyuObgz7tOQG7MBjs
         CgrfRDAUpKV1fMPikqP4O5UsT3L1IafxUevS/F34WdnVMqTQDHC7QPwuJDjsbc0qqtAi
         3gaQ6MNZZexZL33DOkXkzErIwmCLc67Xs/Bh/Kuryv4ITbfBnQZjhi295jf2PMUUCVpp
         V7nhtnkxmAy61UA4PQiPoyK12a8frpBpmCNHrngG/eBbb5syzIzDqY4IG2YN+JRVvQ14
         G5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfVCbj/MHuP+XtMMtKfpJznhDsWyZCqR1o3ynSLSUu3mhZILE8zTQ8JPK7s+3oIo+MdTkI6zarMY3E@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DOnNFc3ebVpr1HJIFMQU6WfgGcoF12o4oCO2xGUY0SR3lA64
	6c4RQ0w9f1ZEQZVry24piNu+oui0wb2nXhD2CdZLVRUdL6iKlSIIVNkNo3bYs3LhnqnznyV4hdN
	cRqm2ss47VFuc8BNODTpbv+qi6ViTEF5OON+Sog==
X-Gm-Gg: ASbGncsMwtW5u/ANTGanhKnbulwn9zRXfRXiUgzdLieaXM/ZHNZb8NSYvdiFBEXZpwB
	+eyaWEr59bE18UTBBeTAlbuIqLW3xfE6pOR1DvwT2M1Xrg5ETZH9H3CWPQhPxcId/sbY0oQ/k5K
	AAyRdHVYBYNrIEOQy0uLEFxQ==
X-Google-Smtp-Source: AGHT+IHMCySz3z6SljYbbcEsFOxE9JkbCutC0ziw5S/nYiq5XuUyK8ef365iq8jZ7YlaLZiMtkJdFLKp9/dUsZ/eF3c=
X-Received: by 2002:a05:6512:31d0:b0:54a:cc03:693d with SMTP id
 2adb3069b0e04-54d6e61dd6bmr5088730e87.9.1745406056469; Wed, 23 Apr 2025
 04:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 13:00:44 +0200
X-Gm-Features: ATxdqUE_gVFsHXxkj74AZEmclfvOPWvTaJ08Tt0ls6iGN_ulCw8C7P0a0FJrIas
Message-ID: <CACRpkdYdDPL_L-q2bofv+6wv53xSCsvOugt7+xE3oxX2=PtMew@mail.gmail.com>
Subject: Re: [PATCH 0/6] hid: use new GPIO setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 10:55=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO drivers under drivers/hid/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

