Return-Path: <linux-gpio+bounces-18929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C5FA8B43B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2BA1896121
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F514230D0D;
	Wed, 16 Apr 2025 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+xaIO1o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E131B808
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793148; cv=none; b=hUhcEyYljTyPqen+f3aryAkH4ELYnyzlzIKTx3Y8Pqo1lxIyLYp7QZJ5YqWT37DZrWtHox7eMlYn5GAAmYTX4JvLs/U5bQB7FrqaL+X/ldqBmRA9jHlC0N/NR14Ux+2S9riR522Ovizd4KLh0Y/Ohm9EtdV5tHDtUZifwE+grmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793148; c=relaxed/simple;
	bh=RE98C+gHqUp+2/XX8bTBngu2H+KXKruUzo51s1pekZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHu++J340oNUXONA8iw4r5xG3fsJJ3R8o7ptsRHOw3KvjtDDLE86rnsYxMLIq4A+9Hb5+Q86Qe+iJQbVwwugpZl3MQNCTsM2WAXIQiDji+d/1lWd30bVoLgwvrWJR+f9J/UgsKliL8te5xpgz+1ghn8+JkDzOctHfYcRYjmAxks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+xaIO1o; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3106217268dso33884961fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744793145; x=1745397945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RE98C+gHqUp+2/XX8bTBngu2H+KXKruUzo51s1pekZg=;
        b=W+xaIO1oiPuwbY7E1W3UhAIGLbErFO5qIdBXyplE1PfRlfYU1bCE3bgq8gB97Y0Oot
         BugGl5e3e4AWU6gjT8AfxzPr9W20x0hc7AVWKFOxz4Y0AgPJge60wCFI1NQVIEdisePe
         dql+BKdsLEl1sFiluwZb2GnO1FiE0+XM+0IudWIxCkakzl/Nk0EaF4mE5uat+MZ7xn1T
         8vz9s+/sUcvDlRp39H5WoZeZH2bRaJEvYOZm4SrgHThNJsrt3C8fU3TjTLvNUlDKGmJb
         GDN66QeliDt2mnz/whBg3ypzOCs+X0qhxJPGquonIHPOwk5AYV3rATXnx8fxOYC5Njfj
         uy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793145; x=1745397945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE98C+gHqUp+2/XX8bTBngu2H+KXKruUzo51s1pekZg=;
        b=cwRGw4PqHtgT1xyGMtJkXPkP/MdS0KniEeGemNRzPU2nvvNznU+jFxoCOEVb/D3jA1
         1KEsEswg1ws1tz4C6BlNiuerBOBrQW8dnzdBNty5RFuoH7sbcXHSispPkjcEY/qU/cdg
         a+8k7mFYvs8pR7Gac44JtcWepM/x5V49opJB5tG2foETvFMc4TrRv8bq38MDCVwU3PWf
         HzoQSBmv+GjRB1th4a78XWohsDuRGOcU+h/U3S3xFKAjZP1/D3z7ttozz3KfXgxkki6A
         XhjyzDO7HjGWjDwoGiFeNdbT36mP1Ev4T3NbYjpRiM1EBSBAzX9bbe3G3GQ7ceiKgW4t
         1Xlw==
X-Forwarded-Encrypted: i=1; AJvYcCWzKHmw0GC0+SdonuarmmeiAWChVrwePTXJ9W7BAgJJfUMCDIW+aH8KS+sbZz8twmluVDmDs7Y2Pm/G@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/a2lWEi5maOXvLpLq7x+DymQx7EeUc+1VmbypeoSyQhFjMzTj
	nr+KOSTxmBiaX1fvtwRDs+Vu3HnZzT3uh/yN3sjpGrD672wGzLI3UxqIL7lE0IVmv+e2C544etk
	r2CAfOhPCfbwVW9Ij2wLCTnQpygcIzDSos8SjRQ==
X-Gm-Gg: ASbGncsaBFIb/ZnPPQhuUjkxV8ibC9rWSLlaJElyBGzOKCZsQkVjW4NNfPL+4C0tLLD
	f6E1zla7r8FeDFkdLAg1eiL3aOCv+md6uU4Epgl/fmt/XPv1khetpflUSiDIF9sZsQ0lLH0iGkF
	bKXl7SS35zvwuorw1JiLyVpw==
X-Google-Smtp-Source: AGHT+IFmYxdzrZGUbGtKMa+u9hnYq1xmfRbmwLNj5G838Fi5mSqfD8BB7+HJ6tHui63K85iCuSDBoWduZ9oyUn/Qp4s=
X-Received: by 2002:a05:651c:50b:b0:30b:9813:b004 with SMTP id
 38308e7fff4ca-3107f73175bmr3853981fa.34.1744793145362; Wed, 16 Apr 2025
 01:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-6-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:45:34 +0200
X-Gm-Features: ATxdqUFF4O5obPmrMzaby6-Pz9kGjUdZrISDS5QYruNwCIm12lV8IvCKMpBO_AA
Message-ID: <CACRpkdYvbbfKoCAJF8R=74tH3avEPa3K-xe0Y8aNJg_aZLDfvw@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] gpiolib: Make taking gpio_lookup_lock consistent
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There are two ways to take a lock: plain call to the mutex_lock()
> or using guard()() / scoped_guard(). The driver inconsistently uses
> both. Make taking gpio_lookup_lock consistent.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

