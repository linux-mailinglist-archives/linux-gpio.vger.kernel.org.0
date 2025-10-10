Return-Path: <linux-gpio+bounces-26981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5DBCD0DE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 15:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 406654E740F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 13:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9282F0C67;
	Fri, 10 Oct 2025 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRBqzbGY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB982F0692
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760101901; cv=none; b=nlQXZam3KcENC7lDb0vHF1HQ21VyfZl8xppYn52oIYoOv8cO9gzA83wlmu2MgvlOKDAmEilG1kqbYgbV8Qy8KL9hJM9La5Ro4LO6upgePTkf0uBaFRMOmpzN6crrwmhUI4tt1awddDFXN1DzYGOkF1YHoDTw/pSOThAKWUyTBQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760101901; c=relaxed/simple;
	bh=zfV7K2QNPW1bCb9/xjhztw8mFKyfc1Xn1VxxpIN1qzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uU52Lz+bZsFalTAeaViT3Jy41rpGWu5AxXmrJmv8jsEL/gXWUYrwsDIEwbfWqGMwjkPOVvaLZ0ZPsHmnJ+ReJ+RssZq9055+UFLo0d5rWGnMZpVVmznEM8o1/p3oURDa4PeQqJjy6HdQuzcrJHP9yPy/wXYzW9o6TQhHz2kR9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRBqzbGY; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-930c304d208so267247241.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760101899; x=1760706699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfV7K2QNPW1bCb9/xjhztw8mFKyfc1Xn1VxxpIN1qzs=;
        b=LRBqzbGY3jMvJiexWPnAgxjd6yp+Q6FCIYqUwV6ovqCQEW/I/u3r5/lICk9dCkA7kp
         1LNQZAiSclgRdF7+O6ZTwwD0UDx64DALER2FhZ8IQoY7+0yjPi3MyhLFtXxftPqrfDtu
         SG3j9ZZfWlgP+81foL9LOKcTMktPMhTCjP90T9UiTsm5dEqmXC3uDPNFIV9tmZt3U3fw
         6RjfasuviY6eyPMxhkcP2EvTwRskg7Aj+H8fX+u3oA0C8eGP6K+TB1Zv4k8ULS87sTP4
         l5Pxnk4FHjojdTt/bTyOOmsursd4uuaIz5lipBGpdqKX+aYrDgxceCSMKIcxmfliwvaL
         9rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760101899; x=1760706699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfV7K2QNPW1bCb9/xjhztw8mFKyfc1Xn1VxxpIN1qzs=;
        b=CPaWIv7/RT+bL6k6YL8tDXIkeWJdkM/uIpCQ/aa7zrl8ca6jI9NwcTUUPWJmoYwqJ0
         EnN62oT21s61Av/njWOdp0UJ+wBpEch0wYlmHZ2FewKRsFthG6UQnQo8y67JUSdWkdJk
         ZqGQLY8FD7DxtHqktHLiOk2UF2OgY+Tf/ydRCXvarqkA1+MrVq7RRshLwzD9HGNbZ/3+
         YHmupWeKPGvcd8ktOcxZRowuOQ7D18S4locbN9Ptvtd/9nshZR5TKd8cQkR2UouSk/je
         RWAYFCK9foRJgreFJ+DW+mr+jwAtR5Zsiexs5yO91WBRIogfpwxYn8Oi/c1rWDWd6sFt
         cmjw==
X-Forwarded-Encrypted: i=1; AJvYcCVUoTL2CYuRadQhvXHvCoYiNozDJHJUZhLdwHFfxJiQ2gDoHw+aZyqigpKZKIIN2xJlJxdQ8WBU/0eC@vger.kernel.org
X-Gm-Message-State: AOJu0YxjlNB9U/ugg9pNoTa2IPqxU4jlaPXJFFvisoLWytYTi58VOUtZ
	KPPsENG2UG3hTcKG8GXq1AcDe8w/7JJg+BvknVQC8Yfi1fUHnQdvzRUOQ20LIVoyJkxWKlBvn3J
	0lWKMqj48794H5U31XpOg+MZTk/lf39m74kyRsIs=
X-Gm-Gg: ASbGnctT431uejTqDGj2E6vJNUnNLv9o1nzf1jbvg/ZT4Zm6fGg3v8j2XaeW4N4QEHc
	j1idLiFR2/Sag30EU0Gxv/xCUOtu4vzZUgeztkWmSXLC6jUqp75mxEGnJULU0wMt+iW1+BFNxIS
	XIidw87vyinIF809eUc0A8JYgpjmTtjUeHIM4h5+gWVmjP55SMkTt8BP92zPcggEYADDiVgjfdP
	4EbTar2hS3dzE9ySJyVpEAS+pQ=
X-Google-Smtp-Source: AGHT+IG8JAlDharJDGIyxQ2vKZLjt3ZYRLvz/T9Q4qH8d0flWObVVcXRTf14Sm7TSGaklZk4erE6LTOVgdTPpo/Qe5c=
X-Received: by 2002:a05:6122:20a3:b0:543:e262:ade2 with SMTP id
 71dfb90a1353d-554b8bdee12mr5030319e0c.12.1760101898766; Fri, 10 Oct 2025
 06:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010094951.18927-1-brgl@bgdev.pl>
In-Reply-To: <20251010094951.18927-1-brgl@bgdev.pl>
From: Vincent Fazio <vfazio@gmail.com>
Date: Fri, 10 Oct 2025 08:11:27 -0500
X-Gm-Features: AS18NWBxYN6xiN-EFzcX75t6Ni9z6Zrfv80PmHpuwRtW3o-SszUWD7w6SDIUo-c
Message-ID: <CAOrEah4da7w875m6K8UibfRNQRsxjwJTzT8Wf=U4cien4d2c5A@mail.gmail.com>
Subject: Re: [PATCH] tests: gpiosim: revert minimum kernel version back to v5.17.4
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 4:49=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit b4009e2e6715 ("tests: gpiosim: provide
> gpiosim_bank_set_line_valid()") added support for marking simulated GPIO
> lines as valid/invalid using a new attribute of the kernel configfs
> interface of the gpio-sim module. In the process it bumped the minimum
> kernel version required to use it to v6.17 where this feature first
> appeared. The test cases we added later only appear in gpiod-test which
> is the test suite for the core C library. However with the kernel
> version change in libgpiosim other test suites have also seen their
> minimum kernel versions implicitly increase.
>
> Since the libgpiosim library will simply return an error in the event
> that the attribute in question doesn't exist when the new function is
> called, we can revert the required kernel version to what it was before
> and allow just the individual test suites to bump their respective
> minimums separately.
>
> Reported-by: Vincent Fazio <vfazio@gmail.com>

Tested-by: Vincent Fazio <vfazio@gmail.com>

