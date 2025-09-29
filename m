Return-Path: <linux-gpio+bounces-26648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34303BA8197
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 08:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D2E418920E7
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 06:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C82142A99;
	Mon, 29 Sep 2025 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MvEzWovv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A10250BEC
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759126897; cv=none; b=Lph7Ta77ubTmU2yhweoUZ0Lh1ji8673XhwXnVFVcR3GVdue8gFd7leBbHDmOCRg1TfI1qwM9Y8gbUfC/Ehu/v/V+R2ilWZZ7d8L9+gNFvEsGSSX3qGtNFZj0ayfDzW9K8yErMF943iOpu49FM/dq110BgJRGz4KXfT2hohEziHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759126897; c=relaxed/simple;
	bh=VmHWr9tkQOqQfivv7RH4gDZhYyrjzzvFI4w9JCU8qNE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qiGvxNVQdufvcnj3oKnFDKdP1vbty5vs8cYaTM2iHCaB0mzyb/BNfkTQqBA9IBnE2mWLdQKsbiDWXT600Rc0IPxnQmJq4NrQYY68JsfJZbFLBofYmsuUmNzmA4yL9WALoSEaM9SREcGFxcGq7V7JSZDH59mlCVpRUl5U7oeQU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MvEzWovv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so5552921b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Sep 2025 23:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1759126894; x=1759731694; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b90GCgmysVPYpZPIdEY5jKSKdferjZz3AdIfhp7Wvk=;
        b=MvEzWovvUshkedkd8ep494N7Ra5ATH+7QPkRVDm6QP1Q3CHvIzQLLFc1u7pRgZ6xom
         eZLbPPG22g+DJGH3NdIRmbbjsBx85ladxTVRJnDJmOJp+eKQ/EOXJioBIjjEUdhZD4dF
         A2EGq7+iuNih/fnBdtdezLE7tG1GVD4iKKTor36pHwvagyzKJa9zYRqIx2kQ+Zq07ZvZ
         ywdC1zdHUvcAnQHa8Df8+jb6l0Glot6Jak6yuj7c/tVZepglpdCFx/45xKk1Nto8ftKD
         kDArI+A9dk4UND+TO/73EpeGBRTwBXGEo42ca3bzYCjNTCn7W6loNCZMa919HXpt+jpl
         KyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759126894; x=1759731694;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0b90GCgmysVPYpZPIdEY5jKSKdferjZz3AdIfhp7Wvk=;
        b=tbsez1pn7Y5Ib95Fz2ZaE6UfMlX2Vhq2GP5iC/9QEpVNJzJJfrH6D3FSKufxfRppq+
         0d5IJWQF1ikh3LfodAUGEjH21lvkq+4AR6lK4xUq/Fa8d1rNO/4556AAgaavd4aF2Y1l
         XchSsZYdEKaQQKUZi0myNGK1czmal/IG73fodSHTstqykbgMUACdSXKUO91aLG7PPbYO
         NMG5Uw3gtB6y8w0A4qWTsN2NaMQthDbtJjYa/OHm8RUW/k0tQcl57n0MijyWBIMWN9nX
         mu/f4FN/2FEOFXQdDg1uecqW481kL8odjw6+dKQzrw6aXbGl6h5uNZlm4zjwhBrXK6DB
         npwQ==
X-Gm-Message-State: AOJu0YwdmjOLBbEZ0gAJ0ryhSe4wpm7hGQTlZ8b7f4BXU7FcwAjXsv3K
	2ahjYTU0I8RCbNt8QPSHPRCKirtfvxnuM3t5Hyvpm64dy68Tx78iRIUqkYMaAC5cVyw=
X-Gm-Gg: ASbGnctm1QBxNZVvXTjiYfa3tb3wIjxFabwN2MvwB4OHnFdE5gr22UWi5lXnc/S8iOU
	jyYEG14Er4az1+51EGxDlgVnzMxcQt3Am72gOS+AYKuPoFeqgur8Hj/gfI+6XjFDAPb9et1hc0E
	BTCFEmFoj0vDenVGamP7IJY/xOg+uxqRhqjXdFmqZOIjbeGmsLR3SgoY75WvoPNWDGBSeXmgwPL
	xd+7i+y5vN3xw7/9Z+cyM3FmVWo/x2q+AWOhBhq91dmfUJAr5urcQ/TTckV9WdVSBNLShexRFLI
	wnUYrQdXvAFlMW0X34gowEwn9GDsVUKVeRs2F1ZuOsBSK8wh0oqR8fxe/hWaKt1YbXFq39gYf8U
	=
X-Google-Smtp-Source: AGHT+IHudMzREFr11YFvsrU9bFj1mQWvJ2OeM2CHeUWjep3DazKRlU6o7QopLvfZy8fHSCQS4z57EA==
X-Received: by 2002:a05:6a20:1593:b0:2cc:692a:3a2b with SMTP id adf61e73a8af0-2e7c79c5b20mr18395405637.16.1759126894036;
        Sun, 28 Sep 2025 23:21:34 -0700 (PDT)
Received: from localhost ([2001:9e8:d591:9700::35e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53bacf4sm10562328a12.7.2025.09.28.23.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 08:21:31 +0200
Message-Id: <DD52FTCTUUEU.3H1VCKA0GZVIH@riscstar.com>
Subject: Re: [PATCH libgpiod 1/3] bindings: rust: complete the unification
 of exports in examples
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
X-Mailer: aerc 0.20.1
References: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
 <20250926-rust-release-tweaks-v1-1-beae932eb691@linaro.org>
In-Reply-To: <20250926-rust-release-tweaks-v1-1-beae932eb691@linaro.org>

On Fri Sep 26, 2025 at 4:35 PM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit cd32f27dd550 ("bindings: rust: unify imports in examples") failed
> to consistently unify the code across all examples so finish the
> process.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../rust/libgpiod/examples/toggle_line_value.rs    | 17 +++++++++------
>  .../examples/toggle_multiple_line_values.rs        | 17 +++++++++------
>  .../rust/libgpiod/examples/watch_line_rising.rs    | 23 ++++++++++++----=
----
>  .../rust/libgpiod/examples/watch_line_value.rs     | 25 +++++++++++++---=
------
>  .../examples/watch_multiple_line_values.rs         | 18 +++++++++-------
>  5 files changed, 59 insertions(+), 41 deletions(-)

nit: Was a bit confused by "complete unifications of exports". Shouldn't
this be "imports" (as used by the previous commit)?


