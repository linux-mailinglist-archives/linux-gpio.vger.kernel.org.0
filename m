Return-Path: <linux-gpio+bounces-18830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E20A896D3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72C9A17FD4A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D9027C869;
	Tue, 15 Apr 2025 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0nkpvfg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9A3192D97
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705981; cv=none; b=D2zny6Q9ef7PeLiEA0BaUqX51nx448N5mYl0W1VlfU0f3nRPItJAx4nMII381cZ9uBSxu0jgiuSlmFiLv0HLQkGp8nUejazI+msvHOYiJhkp61bYYTh2CVRRBHjweGn/OAdyKgG9r0g/Tche25Ns/jKSNoO9ssHncKXcnPW64QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705981; c=relaxed/simple;
	bh=p/sfemeB3+3AkoNBn983i9nv2fEhv2yg6yOcdLv/+hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHBYZxYYEzoKMFjEQ7dYh/JVvHOLhYsHuibKL8Jg/Yhv6aegK18QScgOWyHS4uRCJiZ8MkXU1/czh+eFh9YfTCuZ8wber6UtGewb6a9ocmWMKtSMLHsvE0OU48Wto7dkwu0OLsDYuv/e7znU9O4MVwgFNZgwffQRSd7BEc3SGWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0nkpvfg; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso54034311fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705978; x=1745310778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/sfemeB3+3AkoNBn983i9nv2fEhv2yg6yOcdLv/+hY=;
        b=Q0nkpvfgEMZiIYM6rWgOZhHhOiEvBFZyxS+X+MwOlT5bjg6uPCqpdltlgAnIw/42mr
         Fb/c1o2yflo1ZqaZNaWRk71JzfNcvr4jwKB/CikUjIGDwKkiplyRcB46lbNMv4iFNAed
         SnhAS/Jpw+wsxE9iZmo7T0nIwdYsf0jk465kEOoaL4mPPv+/hm/JitKyghn4m86nEZt/
         VmpiEjAFUl8X9EJgErZm2vMMqU5OPChGlrqB41fpaaiAfNVopPfTbq2VICULqBZi2ibU
         AtW34RDZQoTDlIB6HgJ3Tl2xm5qKp2WfJUnl+t/b+7tt1CjWwJ6y2ZOh3DDV81UNkNq+
         6DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705978; x=1745310778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/sfemeB3+3AkoNBn983i9nv2fEhv2yg6yOcdLv/+hY=;
        b=BPFlaFbu0lIOchmw4aoIHtWMcoscX1GSFE1kP75az0bJrTT6OyKcXVQrupqdvagBPW
         hJcV0UmTTZYrf19yb5q9yVQ9KZ32gNQq2HqbGSfRiFLqFzDJLjcKYKWI89QUhLRxgtde
         +dIGDPsnlxhvwoXQVrUt0xmVOsyy5e8dE0nnDlCFMWnraquK2fZjynZRujrHfOsPF8Hp
         OxJMfBc0bAscFdl+eqUsuzt/YjFS1xmT4ZpgjyKf0hLie7a58Z9+dKUwGWByRqfGCBpj
         dIH61xXMAHHedLB4lV1fc77s503wtjZGTYvauGe4w6rTRyjOinE/Up5GLZfeKEpga5b7
         E9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Zo2uVOg9mKyi3Wb+1JLnP/PbYHae/BbnwfbgpmaViUwwGg8aZvCzmkj5CfqdilURFP9AvAhpX60l@vger.kernel.org
X-Gm-Message-State: AOJu0YwS77h56TOvGug/d+qVCCAsjHgU73qTBsLJozaa5YAX1xVxK++n
	okHqXUT2B3xTAHeBMRdcTyAX2AsAmvs/zyUCCmK2NcLcS5S2ibNoaVUnauLdNVlY5/L9kPmevGG
	4RHw3S37aCKGMoR5GO6Mx5u5imMnBMCj3NMQNsg==
X-Gm-Gg: ASbGncvb67hmm5vDE95NBeq1EocZ/NCBBPlj4PQgvsbAFmDdReO+RoiKl34SF6UlPn1
	fCBQ+A+nj8U+uFgDEtXlwp73lDuFrBBd09FgiFJ/gMMmv63eyK0UIEWxLn90E5xcz3JvEH66OlN
	jRuUGB8fAJl6xGAlAqeHM+sw==
X-Google-Smtp-Source: AGHT+IFY4mxWjOvUJ45dJSrLBON1zaTvdnLpGG/sPvryWvonle0qbT8VZTQ6lzHhQH0TveUlkekm7lMiWhkJTsAbCfk=
X-Received: by 2002:a05:651c:1597:b0:30b:acad:d5ce with SMTP id
 38308e7fff4ca-31049a1acd9mr52007071fa.21.1744705977861; Tue, 15 Apr 2025
 01:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:32:46 +0200
X-Gm-Features: ATxdqUHStbj-Ti_vRnViTaRVrQ8zaVNPZsXG8wIEFb28PzUwDvLDxspkFk2FCi8
Message-ID: <CACRpkdb0RHqYejNJ9w5HzvX0nkYCJRpdzsp3=JankRkJKYXmdA@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: convert board-file GPIO drivers to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all MIPS board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

