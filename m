Return-Path: <linux-gpio+bounces-15638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25993A2E763
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85066188B98E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 09:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428831C3C05;
	Mon, 10 Feb 2025 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hx+P1oTG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2243151
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178765; cv=none; b=jX1Rq6OTb/dsGVjzyeK+vvSZxuGNlH0TJrF2kVIEPKj2bmOGjbsHVxkvj5WYTNFxpfGFPvrXBm5rD1rJ7RWQpPRQSVfnSTXuepFlebcOqQDucjxsucAGD6GLPW7BRhGDG8CY6N++tZpJ267XvLrMIacbtlCSLFCsfntMQrdNef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178765; c=relaxed/simple;
	bh=KpP0VauWezlZl9zLEnci186WAPTItH41JwByqjcT1Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRxIF2oowgKRBwFk1rauMDqjkJK1Npnc6SZvo15yx/TeyLG9twNgVPzn1iNsdd5UlS9rdUg9PKZifqcRP8k2Cd/jX3zno1ZwPNx2VKXT0mSc/SGYlj3NxqMoq04dTdeco3cKx3GPb0psbkW+hXtfHScnLv2frUJuuPxll1sjjYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hx+P1oTG; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f4bc408e49so31581757b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 01:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739178761; x=1739783561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpP0VauWezlZl9zLEnci186WAPTItH41JwByqjcT1Sg=;
        b=Hx+P1oTGKLCO6v/M+eJ7H3JyeiB1hcsM+tlDK7/oMd2/I/vf+QAxik82pF1PwInqd+
         qNOH4VM9oshPuBCFABBWYuC6GvdK2+TKQvLUbEuSwlo69Xh+RFUoCPousUJE33X2sti/
         0rKI8r83uLQRfw5rwD7X+3c4S7hZJciXIevSrQZqns+gp5xkBwzaVCCGaJN9w2pOr9q1
         63KNDVsd0VM0D8WrOsH3A7BHRY+DxHkGEKMg8FKxPKkNqdZY6zo4+u+wxk2QAWG12bHK
         OhEwyD0cEkKrihn1ULI3L74Nc/AfZgJQsxmPhUuoZ5R2Y3NXf6UiOpHjzriP6cTk/EOg
         0mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739178761; x=1739783561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpP0VauWezlZl9zLEnci186WAPTItH41JwByqjcT1Sg=;
        b=CIh8Dj2VnjuR3NnBLF5+C+Vakdr72kP+SwSuKWbM4T43ay9bEcxN1Z58NVdvaYqqFV
         D3yCS6GmqiRYJ2RRMGlOpTmoazUkkEi/+5zsplqTEZjukaQhh/6n1wi0vRUAEjg9Ul3O
         CO9KhogNOnK8yP+qpd2Z7ewxY0SNJPh/L3cuNh5A2x91jxtsONv0Am94zLlbf/GLZJob
         cR3pvZ0qTH9uyEW7AvgNl24BesyiNWbUdlNwpAHprgBhwhK9w3+9ZRAbXH1T7Xci68Cj
         Eg4n3l8qbvY7pH1QvyYSxARJB55NdX6CpVCLh25vPTmfYUhgf3yDGeWQWE560r9c1ulq
         Ja5w==
X-Forwarded-Encrypted: i=1; AJvYcCU7FqdHcZ2XtYqUYMRYbH27Rw/Swe7cRucntShomr5iAegJDOV/5313nH64eUQtSXbAmAu+yHMI+Flm@vger.kernel.org
X-Gm-Message-State: AOJu0YwCab2CrzWidAjMHBpx1XyQwi3dC7V/YOP4UBTNcAxbuuw5yNJq
	ZQZhKs0T8dTLJ5kXbd8bgh87ipp2s5By5vmofb4f2ekJb1F2ERX5rqJ7UFLTtJMj5b69waid0or
	xmcq94d9pIilXEIdinfdrgC2OsFs+LneDHge0TQ==
X-Gm-Gg: ASbGnctLPs9XSkCew0Qbz/ekMvUsG/U8DRLJCznA9kRatAwgMu2GL6/m92ASSPE/T7M
	WS9W6sgQf5zze7ObEa2krGAl0hDAGVGVrg+Qz4ga3J2KuQIA7Sy4M8/f8t9wpHMTNb7ZaEH6S
X-Google-Smtp-Source: AGHT+IFAawMg2Nf7mqa5umT0YKscWEuVFFrDSBesMFIgDCoKmA9MK9WP2lFoyGsa/Z/8TYQ1P+7gsxVF6nzcDCRCG5E=
X-Received: by 2002:a05:690c:6306:b0:6f9:4bb6:eb46 with SMTP id
 00721157ae682-6f9b2a21876mr119497097b3.31.1739178761099; Mon, 10 Feb 2025
 01:12:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com> <20250203121843.3183991-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203121843.3183991-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:12:27 +0100
X-Gm-Features: AWEUYZnXwUXk95Ic6JXWl33Js0Fr1hk4GXmLDnCXzS64aYVBM9dHPxfnvm3rnoc
Message-ID: <CACRpkdbwBB7aS=oRHCkUcZybigXabD6x_z9m_X7iveRakYxLxw@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] gpio: 74x164: Simplify code with cleanup helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use macros defined in linux/cleanup.h to automate resource lifetime
> control in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Clearly this is more readable and less prone to accidental bugs.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

