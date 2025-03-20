Return-Path: <linux-gpio+bounces-17817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C61BA6A18D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 09:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2B493BC732
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 08:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACD621420B;
	Thu, 20 Mar 2025 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M1S9IfIi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EFC1F4CAA
	for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459880; cv=none; b=kx1DLHkVVEMXTe/93O28ykyuhFoGU1QTrDdNIV6VzhmSkLfIuB4+h0uZByXSPQIpg4s38VYLVga5XO+80DIew2uTyj36YJjIDwsxdYoGT5nidHFqsFQZW6hdB7SbYxVVZwEw5pjK3cJVFUK4+pLvfnhKA89yH9aovr3GAJ8b9XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459880; c=relaxed/simple;
	bh=Hjnm6h6VbKdAmP+BYdeTLnUhxywAbAPx3ODECnQc050=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBnNvSKdUr6R5DNK5gKTkBjS7vhkEMubKuVXUQUrmsQ/Z/iL01kIcbTWULshQqmqAAo0IKNYUwHDp6HBAp5VASJUx/PPg5+aPW0uBZvEtvL0QNChL3WqsP5tM0byJDUIXQPRWYWYAi2HKevfLquadU9JJ/boieWxDco4BcMyrWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M1S9IfIi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54ac9d57173so1799955e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 01:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742459877; x=1743064677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hjnm6h6VbKdAmP+BYdeTLnUhxywAbAPx3ODECnQc050=;
        b=M1S9IfIil12HIpBsTto0dlZfzxEPbTItzJyQmBvzufxsjjBdQv+7BxEwJjotUgo4nt
         ux1FX19G+uUPodUKec3GvPcVK+8ojUgFlW2ttt3ZI1GK09DYbT1fZxar24XCwnFM1zYs
         cwW4KDNREDl2E7oiOFv1tvskN5CUEIGl9HJAmb55qMNpcrgvOcN53oUixeIvoE9N1asV
         wAptLZEm/RmAfA9RPj0zwlkfPPauay0IZiPgXmNfA+ACg2AZflMTfGGZmIcUaTwCcrow
         5kg6raNDQ7AsqatYL1d8b7Nh71EE3HBEqMoACwPrxAxlCwXe3AL75YHKWDO4KbEBUd6B
         GRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742459877; x=1743064677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hjnm6h6VbKdAmP+BYdeTLnUhxywAbAPx3ODECnQc050=;
        b=eMa0LKpXE8jrR5V6w3+0eTN4oVrRzHPQd4vf0c/oURQmQirVrwMbiOa/XzcWz6jHjY
         1MS0jjfvWxV/azYzwfwJ1EhRfdwm9ZsSOgkCbfDcZ6HdzHPnd2si5mcoTeYpPl18KiTy
         bz3frnqcjjJ4kUV42mV2OniRjAGitu194kfv3sG+18qDnCfKSuocInsQNqFdo/8H8a0D
         qpIOiLoE2sdknSYTlC/eqyG6oVkMJJEaiV3vLXuJM+0VNagZFkWmnISojMfTSFu+R9UX
         W8bjB2Af7iKwRtfbArc8wF1bWDAAJrOewdOhhGXOtFqE3pmiBhWA/7Pp9Rq+6R/Snzj8
         pU9A==
X-Forwarded-Encrypted: i=1; AJvYcCWG4BYLKoR7UXFoteztD7a3fWPQzFGgKHXfZCSFiAfydhPs2O3DMkkTJBFsBPZZ6w+sf36RyH9a5FIM@vger.kernel.org
X-Gm-Message-State: AOJu0YwFBQC02D0HUCtjKGxuSN5uGcTmKWJqQKD0lU3GiMXEe30ywnKV
	FxjUfnBqe8cOIbZR9yjzH5DLtu6vlz6WGbBiNuIS3Z47HmfyclCewCanV7Mg+d+cb8zavQLP0Ne
	Xo4lBs2cS+D4rRBiIz2GX/1+qumTy2cGxWntyeA==
X-Gm-Gg: ASbGnctTrqxK0Ob6DwCxViNnohRCw0Qk7IbohpAC7JKiQ7y358Ci/No0Mrdi7IxWAHr
	hco8c6Su0OY/rzNZtlsOgtCuZ7/v93iqPcPpbMPkxkCLheSio+4SqvO8Z5DAfymfxajFs5rqI6x
	myZfk1z9kvaNxFZ3xdqOzhoZg=
X-Google-Smtp-Source: AGHT+IG/qAFRD74EC6DfOcOqkvgWE0hQdw3vhe6S+Yk+NWo+wi1lPVjn1cyc/Bi7/s/7IoSWdNyFqFlt+2nxrhzoVuo=
X-Received: by 2002:a05:6512:3da5:b0:549:90ac:cca2 with SMTP id
 2adb3069b0e04-54acfa81eeamr1107537e87.1.1742459876900; Thu, 20 Mar 2025
 01:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319092951.37667-1-jirislaby@kernel.org> <20250319092951.37667-44-jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-44-jirislaby@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 09:38:06 +0100
X-Gm-Features: AQ5f1JqSSwrQ-z73spgQxCBP5NfYJlEiFwR6UtMfH3ZSL2iZPsZZ-Fc9orX5jF8
Message-ID: <CACRpkdbh=eei7RRFOeKdEeDQLDtiydnpLzYOGy0SmBbUVXOLzA@mail.gmail.com>
Subject: Re: [PATCH v2 43/57] irqdomain: gpio: Switch to irq_find_mapping()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 10:33=E2=80=AFAM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:

> irq_linear_revmap() is deprecated, so remove all its uses and supersede
> them by an identical call to irq_find_mapping().
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

